@implementation MFDebugAccountState

- (MFDebugAccountState)initWithStateEventDictionary:(id)a3 identifier:(id)a4 lastKnownCapabilities:(id)a5
{
  id v9;
  id v10;
  id v11;
  MFDebugAccountState *v12;
  MFDebugAccountState *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MFDebugAccountState;
  v12 = -[MFDebugAccountState init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a4);
    objc_storeStrong((id *)&v13->_mailAccount, a3);
    objc_storeStrong((id *)&v13->_lastKnownCapabilities, a5);
  }

  return v13;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MFDebugAccountState identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MFDebugAccountState identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("identifier"));

  }
  -[MFDebugAccountState mailAccount](self, "mailAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MFDebugAccountState mailAccount](self, "mailAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@"), v8);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("account"));

  }
  -[MFDebugAccountState lastKnownCapabilities](self, "lastKnownCapabilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MFDebugAccountState lastKnownCapabilities](self, "lastKnownCapabilities");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("last capabilities"));

  }
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSArray)lastKnownCapabilities
{
  return self->_lastKnownCapabilities;
}

- (void)setLastKnownCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownCapabilities, a3);
}

- (MailAccount)mailAccount
{
  return self->_mailAccount;
}

- (void)setMailAccount:(id)a3
{
  objc_storeStrong((id *)&self->_mailAccount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailAccount, 0);
  objc_storeStrong((id *)&self->_lastKnownCapabilities, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
