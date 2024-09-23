@implementation MCMCommandInfoValueForKey

- (MCMCommandInfoValueForKey)initWithKey:(id)a3 concreteContainerIdentity:(id)a4 context:(id)a5 resultPromise:(id)a6
{
  id v11;
  id v12;
  MCMCommandInfoValueForKey *v13;
  MCMCommandInfoValueForKey *v14;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MCMCommandInfoValueForKey;
  v13 = -[MCMCommand initWithContext:resultPromise:](&v16, sel_initWithContext_resultPromise_, a5, a6);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_key, a3);
    objc_storeStrong((id *)&v14->_concreteContainerIdentity, a4);
  }

  return v14;
}

- (MCMCommandInfoValueForKey)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  MCMCommandInfoValueForKey *v9;
  uint64_t v10;
  MCMConcreteContainerIdentity *concreteContainerIdentity;
  uint64_t v12;
  NSString *key;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MCMCommandInfoValueForKey;
  v9 = -[MCMCommand initWithMessage:context:reply:](&v15, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "concreteContainerIdentity");
    v10 = objc_claimAutoreleasedReturnValue();
    concreteContainerIdentity = v9->_concreteContainerIdentity;
    v9->_concreteContainerIdentity = (MCMConcreteContainerIdentity *)v10;

    objc_msgSend(v8, "key");
    v12 = objc_claimAutoreleasedReturnValue();
    key = v9->_key;
    v9->_key = (NSString *)v12;

  }
  return v9;
}

- (BOOL)preflightClientAllowed
{
  void *v2;
  void *v3;

  -[MCMCommand context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isAllowedToAccessInfoMetadata");
  return (char)v2;
}

- (void)execute
{
  void *v3;
  void *v4;
  MCMResultInfoValueForKey *v5;
  MCMError *v6;
  MCMError *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17D7010](self, a2);
  v9[0] = 1;
  -[MCMCommandInfoValueForKey infoValueForKeyWithError:](self, "infoValueForKeyWithError:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9[0] == 1)
  {
    v5 = -[MCMResultInfoValueForKey initWithValue:]([MCMResultInfoValueForKey alloc], "initWithValue:", v4);
  }
  else
  {
    v6 = [MCMError alloc];
    v7 = -[MCMError initWithErrorType:](v6, "initWithErrorType:", v9[0]);
    v5 = -[MCMResultBase initWithError:]([MCMResultInfoValueForKey alloc], "initWithError:", v7);

  }
  -[MCMCommand resultPromise](self, "resultPromise");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "completeWithResult:", v5);

  objc_autoreleasePoolPop(v3);
}

- (MCMCommandInfoValueForKey)infoValueForKeyWithError:(unint64_t *)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  MCMError *v12;
  void *v13;
  void *v14;
  MCMError *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  MCMCommandInfoValueForKey *v19;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[MCMCommandInfoValueForKey concreteContainerIdentity](self, "concreteContainerIdentity");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommandInfoValueForKey key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  if (!v6)
  {
    v15 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 38);
    container_log_handle_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v5;
      _os_log_error_impl(&dword_1CF807000, v16, OS_LOG_TYPE_ERROR, "Can't get nil or non-NSString key: %@", buf, 0xCu);
    }

    v11 = 0;
    v9 = 0;
    goto LABEL_17;
  }
  -[MCMCommand context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v8, "entryForContainerIdentity:error:", v22, &v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v24;

  v23 = v10;
  objc_msgSend(v9, "metadataWithError:", &v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (MCMError *)v23;

  if (!v11)
  {
    v15 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 21);

    container_log_handle_for_category();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v22;
      _os_log_error_impl(&dword_1CF807000, v17, OS_LOG_TYPE_ERROR, "No Container with identity: %@", buf, 0xCu);
    }

    v11 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v11, "info");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v15 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 24);

    container_log_handle_for_category();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v5;
      _os_log_error_impl(&dword_1CF807000, v18, OS_LOG_TYPE_ERROR, "Didn't find info value for key: %@", buf, 0xCu);
    }

LABEL_17:
    v14 = 0;
    goto LABEL_18;
  }
  v15 = v12;
LABEL_18:
  if (a3 && v15)
    *a3 = -[MCMError type](v15, "type");
  v19 = v14;

  return v19;
}

- (MCMConcreteContainerIdentity)concreteContainerIdentity
{
  return self->_concreteContainerIdentity;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_concreteContainerIdentity, 0);
}

+ (unint64_t)command
{
  return 6;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end
