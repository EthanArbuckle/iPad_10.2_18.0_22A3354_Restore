@implementation EMMailboxChangeAction

- (EMMailboxChangeAction)initWithMailbox:(id)a3
{
  void *v4;
  EMMailboxChangeAction *v5;

  objc_msgSend(a3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[EMMailboxChangeAction initWithMailboxObjectID:](self, "initWithMailboxObjectID:", v4);

  return v5;
}

- (EMMailboxChangeAction)initWithMailboxObjectID:(id)a3
{
  id v5;
  EMMailboxChangeAction *v6;
  EMMailboxChangeAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMMailboxChangeAction;
  v6 = -[EMMailboxChangeAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mailboxObjectID, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMailboxChangeAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  EMMailboxChangeAction *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_mailboxObjectID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EMMailboxChangeAction initWithMailboxObjectID:](self, "initWithMailboxObjectID:", v5);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EMMailboxChangeAction mailboxObjectID](self, "mailboxObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_mailboxObjectID"));

}

- (EMMailboxObjectID)mailboxObjectID
{
  return self->_mailboxObjectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxObjectID, 0);
}

@end
