@implementation IDSTransactionLogMessage

- (id)_initWithAccountUniqueID:(id)a3 fromID:(id)a4 loginID:(id)a5 serviceName:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  IDSTransactionLogMessage *v15;
  id *p_isa;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IDSTransactionLogMessage;
  v15 = -[IDSTransactionLogMessage init](&v18, sel_init);
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountUniqueID, a3);
    objc_storeStrong(p_isa + 1, a4);
    objc_storeStrong(p_isa + 2, a5);
    objc_storeStrong(p_isa + 4, a6);
  }

  return p_isa;
}

- (IDSTransactionLogMessage)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  IDSTransactionLogMessage *v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IDSTransactionLogMessageAccountUniqueIDKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IDSTransactionLogMessageFromIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IDSTransactionLogMessageLoginIDKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IDSTransactionLogMessageServiceNameKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[IDSTransactionLogMessage _initWithAccountUniqueID:fromID:loginID:serviceName:](self, "_initWithAccountUniqueID:fromID:loginID:serviceName:", v5, v6, v7, v8);
  return v9;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSTransactionLogMessage accountUniqueID](self, "accountUniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IDSTransactionLogMessage accountUniqueID](self, "accountUniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("IDSTransactionLogMessageAccountUniqueIDKey"));

  }
  -[IDSTransactionLogMessage fromID](self, "fromID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IDSTransactionLogMessage fromID](self, "fromID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("IDSTransactionLogMessageFromIDKey"));

  }
  -[IDSTransactionLogMessage loginID](self, "loginID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[IDSTransactionLogMessage loginID](self, "loginID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("IDSTransactionLogMessageLoginIDKey"));

  }
  -[IDSTransactionLogMessage serviceName](self, "serviceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[IDSTransactionLogMessage serviceName](self, "serviceName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("IDSTransactionLogMessageServiceNameKey"));

  }
  return v3;
}

+ (id)transactionLogMessageFromDictionaryRepresentation:(id)a3
{
  id v3;
  void *v4;
  __objc2_class **v5;
  void *v6;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("IDSTransactionLogMessageDictionaryValueKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = off_1E2C5DF50;
LABEL_8:
      v6 = (void *)objc_msgSend(objc_alloc(*v5), "initWithDictionaryRepresentation:", v3);
      goto LABEL_9;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("IDSTransactionLogMessageDataValueKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v5 = off_1E2C5DF48;
      goto LABEL_8;
    }
  }
  else
  {
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (NSString)accountUniqueID
{
  return self->_accountUniqueID;
}

- (NSString)fromID
{
  return self->_fromID;
}

- (NSString)loginID
{
  return self->_loginID;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_accountUniqueID, 0);
  objc_storeStrong((id *)&self->_loginID, 0);
  objc_storeStrong((id *)&self->_fromID, 0);
}

@end
