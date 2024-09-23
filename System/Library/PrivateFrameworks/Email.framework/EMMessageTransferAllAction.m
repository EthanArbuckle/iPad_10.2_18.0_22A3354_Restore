@implementation EMMessageTransferAllAction

- (EMMessageTransferAllAction)initWithMailboxes:(id)a3 messageListItemsToExclude:(id)a4 destinationMailbox:(id)a5 copyMessages:(BOOL)a6 origin:(int64_t)a7 actor:(int64_t)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  EMMessageTransferAllAction *v17;
  uint64_t v18;
  NSArray *mailboxObjectIDs;
  objc_super v21;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v21.receiver = self;
  v21.super_class = (Class)EMMessageTransferAllAction;
  v17 = -[EMMessageTransferAction initWithMessageListItems:origin:actor:destinationMailbox:copyMessages:](&v21, sel_initWithMessageListItems_origin_actor_destinationMailbox_copyMessages_, v15, a7, a8, v16, v10);
  if (v17)
  {
    objc_msgSend(v14, "ef_mapSelector:", sel_objectID);
    v18 = objc_claimAutoreleasedReturnValue();
    mailboxObjectIDs = v17->_mailboxObjectIDs;
    v17->_mailboxObjectIDs = (NSArray *)v18;

  }
  return v17;
}

- (EMMessageTransferAllAction)initWithMailboxes:(id)a3 messageListItemsToExclude:(id)a4 specialDestinationMailboxType:(int64_t)a5 flagChange:(id)a6 copyMessages:(BOOL)a7 origin:(int64_t)a8 actor:(int64_t)a9
{
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  EMMessageTransferAllAction *v18;
  uint64_t v19;
  NSArray *mailboxObjectIDs;
  objc_super v22;

  v10 = a7;
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)EMMessageTransferAllAction;
  v18 = -[EMMessageTransferAction initWithMessageListItems:origin:actor:specialDestinationMailboxType:flagChange:copyMessages:](&v22, sel_initWithMessageListItems_origin_actor_specialDestinationMailboxType_flagChange_copyMessages_, v16, a8, a9, a5, v17, v10);
  if (v18)
  {
    objc_msgSend(v15, "ef_map:", &__block_literal_global_35);
    v19 = objc_claimAutoreleasedReturnValue();
    mailboxObjectIDs = v18->_mailboxObjectIDs;
    v18->_mailboxObjectIDs = (NSArray *)v19;

  }
  return v18;
}

id __141__EMMessageTransferAllAction_initWithMailboxes_messageListItemsToExclude_specialDestinationMailboxType_flagChange_copyMessages_origin_actor___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "objectID");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)signpostType
{
  return 9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageTransferAllAction)initWithCoder:(id)a3
{
  id v4;
  EMMessageTransferAllAction *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *mailboxObjectIDs;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EMMessageTransferAllAction;
  v5 = -[EMMessageTransferAction initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("EFPropertyKey_mailboxObjectIDs"));
    v9 = objc_claimAutoreleasedReturnValue();
    mailboxObjectIDs = v5->_mailboxObjectIDs;
    v5->_mailboxObjectIDs = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)EMMessageTransferAllAction;
  -[EMMessageTransferAction encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[EMMessageTransferAllAction mailboxObjectIDs](self, "mailboxObjectIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_mailboxObjectIDs"));

}

- (NSArray)mailboxObjectIDs
{
  return self->_mailboxObjectIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxObjectIDs, 0);
}

@end
