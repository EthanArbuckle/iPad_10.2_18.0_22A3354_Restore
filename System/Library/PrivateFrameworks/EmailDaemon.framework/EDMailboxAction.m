@implementation EDMailboxAction

+ (id)actionWithID:(int64_t)a3 toCreateMailbox:(int64_t)a4 mailboxName:(id)a5
{
  id v8;
  void *v9;

  v8 = a5;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithID:actionType:mailboxID:mailboxName:renamedMailboxName:", a3, 1, a4, v8, 0);

  return v9;
}

+ (id)actionWithID:(int64_t)a3 toDeleteMailbox:(int64_t)a4 mailboxName:(id)a5
{
  id v8;
  void *v9;

  v8 = a5;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithID:actionType:mailboxID:mailboxName:renamedMailboxName:", a3, 2, a4, v8, 0);

  return v9;
}

+ (id)actionWithID:(int64_t)a3 toRenameMailbox:(int64_t)a4 mailboxName:(id)a5 toName:(id)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithID:actionType:mailboxID:mailboxName:renamedMailboxName:", a3, 3, a4, v10, v11);

  return v12;
}

- (EDMailboxAction)initWithID:(int64_t)a3 actionType:(int64_t)a4 mailboxID:(int64_t)a5 mailboxName:(id)a6 renamedMailboxName:(id)a7
{
  id v12;
  id v13;
  EDMailboxAction *v14;
  EDMailboxAction *v15;
  uint64_t v16;
  NSString *mailboxName;
  uint64_t v18;
  NSString *renamedMailboxName;
  objc_super v21;

  v12 = a6;
  v13 = a7;
  v21.receiver = self;
  v21.super_class = (Class)EDMailboxAction;
  v14 = -[EDMailboxAction init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_actionID = a3;
    v14->_actionType = a4;
    v14->_mailboxID = a5;
    v16 = objc_msgSend(v12, "copy");
    mailboxName = v15->_mailboxName;
    v15->_mailboxName = (NSString *)v16;

    v18 = objc_msgSend(v13, "copy");
    renamedMailboxName = v15->_renamedMailboxName;
    v15->_renamedMailboxName = (NSString *)v18;

  }
  return v15;
}

- (int64_t)actionID
{
  return self->_actionID;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (int64_t)mailboxID
{
  return self->_mailboxID;
}

- (NSString)mailboxName
{
  return self->_mailboxName;
}

- (NSString)renamedMailboxName
{
  return self->_renamedMailboxName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renamedMailboxName, 0);
  objc_storeStrong((id *)&self->_mailboxName, 0);
}

@end
