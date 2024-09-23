@implementation ECLocalMessageAction

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ECLocalMessageAction;
  -[ECLocalMessageAction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECLocalMessageAction persistentID](self, "persistentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ id = %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (ECLocalMessageActionID)persistentID
{
  return self->_persistentID;
}

- (void)setPersistentID:(id)a3
{
  objc_storeStrong((id *)&self->_persistentID, a3);
}

- (NSURL)mailboxURL
{
  return self->_mailboxURL;
}

- (void)setMailboxURL:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxURL, a3);
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxURL, 0);
  objc_storeStrong((id *)&self->_persistentID, 0);
}

@end
