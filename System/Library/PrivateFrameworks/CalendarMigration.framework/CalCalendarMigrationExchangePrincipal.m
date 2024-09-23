@implementation CalCalendarMigrationExchangePrincipal

- (CalCalendarMigrationExchangePrincipal)initWithUid:(id)a3 mailbox:(id)a4
{
  id v6;
  NSString *v7;
  NSString *uid;
  NSString *v9;
  NSString *mailbox;

  if (self)
  {
    v6 = a4;
    v7 = (NSString *)objc_msgSend(a3, "copy");
    uid = self->_uid;
    self->_uid = v7;

    v9 = (NSString *)objc_msgSend(v6, "copy");
    mailbox = self->_mailbox;
    self->_mailbox = v9;

  }
  return self;
}

- (id)dictionaryForAccountProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalCalendarMigrationExchangePrincipal mailbox](self, "mailbox");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BE140B0]);

  -[CalCalendarMigrationExchangePrincipal name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE140B8]);

  -[CalCalendarMigrationExchangePrincipal title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE140C0]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CalCalendarMigrationExchangePrincipal isDelegate](self, "isDelegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE140A8]);

  v8 = (void *)objc_msgSend(v3, "copy");
  return v8;
}

- (BOOL)addressIsAccountOwner:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  if (!a3)
    return 0;
  objc_msgSend(a3, "stringRemovingMailto");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalCalendarMigrationExchangePrincipal mailbox](self, "mailbox");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringRemovingMailto");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  return v7;
}

- (BOOL)addressURLIsAccountOwner:(id)a3
{
  void *v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CalCalendarMigrationExchangePrincipal addressIsAccountOwner:](self, "addressIsAccountOwner:", v4);

  return (char)self;
}

- (NSString)uid
{
  return self->_uid;
}

- (NSString)mailbox
{
  return self->_mailbox;
}

- (NSString)ownerUid
{
  return self->_ownerUid;
}

- (void)setOwnerUid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isDelegate
{
  return self->_delegate;
}

- (void)setDelegate:(BOOL)a3
{
  self->_delegate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_ownerUid, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);
  objc_storeStrong((id *)&self->_uid, 0);
}

@end
