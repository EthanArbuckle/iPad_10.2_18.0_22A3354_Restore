@implementation EMListUnsubscribeCommand

- (EMListUnsubscribeCommand)init
{
  -[EMListUnsubscribeCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EMListUnsubscribeCommand init]", "EMListUnsubscribeCommand.m", 115, "0");
}

+ (id)mailtoUnsubscribeCommandWithListID:(id)a3 address:(id)a4 sender:(id)a5 subject:(id)a6 body:(id)a7 account:(id)a8 headerUnsubscribeTypes:(int64_t)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  EMListUnsubscribeMailtoValues *v20;
  EMListUnsubscribeCommand *v21;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = -[EMListUnsubscribeMailtoValues initWithAddresss:subject:body:account:]([EMListUnsubscribeMailtoValues alloc], "initWithAddresss:subject:body:account:", v15, v17, v18, v19);
  v21 = -[EMListUnsubscribeCommand initWithListID:sender:mailtoValues:postValues:headerUnsubscribeTypes:]([EMListUnsubscribeCommand alloc], "initWithListID:sender:mailtoValues:postValues:headerUnsubscribeTypes:", v14, v16, v20, 0, a9);

  return v21;
}

+ (id)oneClickUnsubscribeCommandWithListID:(id)a3 sender:(id)a4 URL:(id)a5 postContent:(id)a6 headerUnsubscribeTypes:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  EMListUnsubscribePostValues *v15;
  EMListUnsubscribeCommand *v16;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = -[EMListUnsubscribePostValues initWithURL:postContent:]([EMListUnsubscribePostValues alloc], "initWithURL:postContent:", v13, v14);
  v16 = -[EMListUnsubscribeCommand initWithListID:sender:mailtoValues:postValues:headerUnsubscribeTypes:]([EMListUnsubscribeCommand alloc], "initWithListID:sender:mailtoValues:postValues:headerUnsubscribeTypes:", v11, v12, 0, v15, a7);

  return v16;
}

- (EMListUnsubscribeCommand)initWithListID:(id)a3 sender:(id)a4 mailtoValues:(id)a5 postValues:(id)a6 headerUnsubscribeTypes:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  EMListUnsubscribeCommand *v16;
  uint64_t v17;
  NSString *listID;
  uint64_t v19;
  NSString *sender;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)EMListUnsubscribeCommand;
  v16 = -[EMListUnsubscribeCommand init](&v22, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    listID = v16->_listID;
    v16->_listID = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    sender = v16->_sender;
    v16->_sender = (NSString *)v19;

    objc_storeStrong((id *)&v16->_mailtoValues, a5);
    objc_storeStrong((id *)&v16->_postValues, a6);
    v16->_headerUnsubscribeTypes = a7;
  }

  return v16;
}

- (NSString)ef_publicDescription
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int64_t headerUnsubscribeTypes;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EMListUnsubscribeMailtoValues address](self->_mailtoValues, "address");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v16, "hash");
  -[EMListUnsubscribeMailtoValues subject](self->_mailtoValues, "subject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v15, "hash");
  -[EMListUnsubscribeMailtoValues body](self->_mailtoValues, "body");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v14, "hash");
  -[EMListUnsubscribePostValues oneClickURL](self->_postValues, "oneClickURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  headerUnsubscribeTypes = self->_headerUnsubscribeTypes;
  -[EMListUnsubscribePostValues postContent](self->_postValues, "postContent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p address: %lx, subject: %lx, body: %lx, url: %lx, availableUnsubscribeType: %lx, postContent: %@>"), v4, self, v5, v6, v7, v9, headerUnsubscribeTypes, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_listID, "hash");
  v4 = -[NSString hash](self->_sender, "hash") ^ v3;
  v5 = -[EMListUnsubscribeMailtoValues hash](self->_mailtoValues, "hash");
  return v4 ^ v5 ^ -[EMListUnsubscribePostValues hash](self->_postValues, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;
  void *v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[EMListUnsubscribeCommand headerUnsubscribeTypes](self, "headerUnsubscribeTypes");
    if (v6 == objc_msgSend(v5, "headerUnsubscribeTypes"))
    {
      -[EMListUnsubscribeCommand listID](self, "listID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "listID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (EFObjectsAreEqual())
      {
        -[EMListUnsubscribeCommand sender](self, "sender");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "sender");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (EFObjectsAreEqual())
        {
          -[EMListUnsubscribeCommand mailtoValues](self, "mailtoValues");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "mailtoValues");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (EFObjectsAreEqual())
          {
            -[EMListUnsubscribeCommand postValues](self, "postValues");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "postValues");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = EFObjectsAreEqual();

          }
          else
          {
            v13 = 0;
          }

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)accountFinderBlock
{
  return (id)MEMORY[0x1BCCC8C10](sAccountFinderBlock, a2);
}

+ (void)setAccountFinderBlock:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = MEMORY[0x1BCCC8C10](a3, a2);
  v4 = (void *)sAccountFinderBlock;
  sAccountFinderBlock = v3;

}

+ (id)_accountWithIdentifier:(id)a3
{
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v9;
  void *v10;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "accountFinderBlock");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EMListUnsubscribeCommand.m"), 190, CFSTR("accountFinderBlock is not set"));

  }
  ((void (**)(_QWORD, id))v6)[2](v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EMListUnsubscribeCommand.m"), 192, CFSTR("failed to find an account for identifier"));

  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMListUnsubscribeCommand)initWithCoder:(id)a3
{
  id v4;
  EMListUnsubscribeCommand *v5;
  uint64_t v6;
  NSString *listID;
  uint64_t v8;
  NSString *sender;
  uint64_t v10;
  EMListUnsubscribeMailtoValues *mailtoValues;
  uint64_t v12;
  EMListUnsubscribePostValues *postValues;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EMListUnsubscribeCommand;
  v5 = -[EMListUnsubscribeCommand init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_listID"));
    v6 = objc_claimAutoreleasedReturnValue();
    listID = v5->_listID;
    v5->_listID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_sender"));
    v8 = objc_claimAutoreleasedReturnValue();
    sender = v5->_sender;
    v5->_sender = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_mailtoValues"));
    v10 = objc_claimAutoreleasedReturnValue();
    mailtoValues = v5->_mailtoValues;
    v5->_mailtoValues = (EMListUnsubscribeMailtoValues *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_postValues"));
    v12 = objc_claimAutoreleasedReturnValue();
    postValues = v5->_postValues;
    v5->_postValues = (EMListUnsubscribePostValues *)v12;

    v5->_headerUnsubscribeTypes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_headerUnsubscribeTypes"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[EMListUnsubscribeCommand listID](self, "listID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_listID"));

  -[EMListUnsubscribeCommand sender](self, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_sender"));

  -[EMListUnsubscribeCommand mailtoValues](self, "mailtoValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_mailtoValues"));

  -[EMListUnsubscribeCommand postValues](self, "postValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("EFPropertyKey_postValues"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[EMListUnsubscribeCommand headerUnsubscribeTypes](self, "headerUnsubscribeTypes"), CFSTR("EFPropertyKey_headerUnsubscribeTypes"));
}

- (BOOL)isMailtoOperation
{
  return self->_mailtoValues != 0;
}

- (NSString)listID
{
  return self->_listID;
}

- (NSString)sender
{
  return self->_sender;
}

- (int64_t)headerUnsubscribeTypes
{
  return self->_headerUnsubscribeTypes;
}

- (EMListUnsubscribeMailtoValues)mailtoValues
{
  return self->_mailtoValues;
}

- (EMListUnsubscribePostValues)postValues
{
  return self->_postValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postValues, 0);
  objc_storeStrong((id *)&self->_mailtoValues, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_listID, 0);
}

@end
