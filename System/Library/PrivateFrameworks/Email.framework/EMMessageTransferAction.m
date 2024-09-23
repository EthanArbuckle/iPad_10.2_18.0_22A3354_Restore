@implementation EMMessageTransferAction

- (EMMessageTransferAction)initWithMessageListItems:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 destinationMailbox:(id)a6 copyMessages:(BOOL)a7
{
  id v12;
  id v13;
  EMMessageTransferAction *v14;
  void *v15;
  uint64_t v16;
  NSURL *destinationMailboxURL;
  objc_super v19;

  v12 = a3;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)EMMessageTransferAction;
  v14 = -[EMMessageChangeAction initWithMessageListItems:origin:actor:](&v19, sel_initWithMessageListItems_origin_actor_, v12, a4, a5);
  if (v14)
  {
    objc_msgSend(v13, "objectID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "url");
    v16 = objc_claimAutoreleasedReturnValue();
    destinationMailboxURL = v14->_destinationMailboxURL;
    v14->_destinationMailboxURL = (NSURL *)v16;

    v14->_copyMessages = a7;
  }

  return v14;
}

- (EMMessageTransferAction)initWithQuery:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 specialDestinationMailboxType:(int64_t)a6 flagChange:(id)a7 copyMessages:(BOOL)a8
{
  id v15;
  EMMessageTransferAction *v16;
  EMMessageTransferAction *v17;
  objc_super v19;

  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)EMMessageTransferAction;
  v16 = -[EMMessageChangeAction initWithQuery:origin:actor:](&v19, sel_initWithQuery_origin_actor_, a3, a4, a5);
  v17 = v16;
  if (v16)
  {
    v16->_specialDestinationMailboxType = a6;
    v16->_copyMessages = a8;
    objc_storeStrong((id *)&v16->_flagChange, a7);
  }

  return v17;
}

- (EMMessageTransferAction)initWithMessageListItems:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 specialDestinationMailboxType:(int64_t)a6 flagChange:(id)a7 copyMessages:(BOOL)a8
{
  id v15;
  EMMessageTransferAction *v16;
  EMMessageTransferAction *v17;
  objc_super v19;

  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)EMMessageTransferAction;
  v16 = -[EMMessageChangeAction initWithMessageListItems:origin:actor:](&v19, sel_initWithMessageListItems_origin_actor_, a3, a4, a5);
  v17 = v16;
  if (v16)
  {
    v16->_specialDestinationMailboxType = a6;
    v16->_copyMessages = a8;
    objc_storeStrong((id *)&v16->_flagChange, a7);
  }

  return v17;
}

- (EMMessageTransferAction)initWithObjectIDs:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 specialDestinationMailboxType:(int64_t)a6 flagChange:(id)a7 copyMessages:(BOOL)a8
{
  id v15;
  EMMessageTransferAction *v16;
  EMMessageTransferAction *v17;
  objc_super v19;

  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)EMMessageTransferAction;
  v16 = -[EMMessageChangeAction initWithObjectIDs:origin:actor:](&v19, sel_initWithObjectIDs_origin_actor_, a3, a4, a5);
  v17 = v16;
  if (v16)
  {
    v16->_specialDestinationMailboxType = a6;
    v16->_copyMessages = a8;
    objc_storeStrong((id *)&v16->_flagChange, a7);
  }

  return v17;
}

- (int64_t)signpostType
{
  return 8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageTransferAction)initWithCoder:(id)a3
{
  id v4;
  EMMessageTransferAction *v5;
  uint64_t v6;
  NSURL *destinationMailboxURL;
  uint64_t v8;
  ECMessageFlagChange *flagChange;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMMessageTransferAction;
  v5 = -[EMMessageChangeAction initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_destinationMailboxURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    destinationMailboxURL = v5->_destinationMailboxURL;
    v5->_destinationMailboxURL = (NSURL *)v6;

    v5->_specialDestinationMailboxType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_specialDestinationMailboxType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_flagChange"));
    v8 = objc_claimAutoreleasedReturnValue();
    flagChange = v5->_flagChange;
    v5->_flagChange = (ECMessageFlagChange *)v8;

    v5->_copyMessages = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_copyMessages"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EMMessageTransferAction;
  -[EMMessageChangeAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[EMMessageTransferAction destinationMailboxURL](self, "destinationMailboxURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_destinationMailboxURL"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[EMMessageTransferAction specialDestinationMailboxType](self, "specialDestinationMailboxType"), CFSTR("EFPropertyKey_specialDestinationMailboxType"));
  -[EMMessageTransferAction flagChange](self, "flagChange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_flagChange"));

  objc_msgSend(v4, "encodeBool:forKey:", -[EMMessageTransferAction copyMessages](self, "copyMessages"), CFSTR("EFPropertyKey_copyMessages"));
}

- (NSURL)destinationMailboxURL
{
  return self->_destinationMailboxURL;
}

- (int64_t)specialDestinationMailboxType
{
  return self->_specialDestinationMailboxType;
}

- (ECMessageFlagChange)flagChange
{
  return self->_flagChange;
}

- (BOOL)copyMessages
{
  return self->_copyMessages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flagChange, 0);
  objc_storeStrong((id *)&self->_destinationMailboxURL, 0);
}

@end
