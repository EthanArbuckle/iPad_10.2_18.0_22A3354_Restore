@implementation MCMCommandSetInfoValue

- (MCMCommandSetInfoValue)initWithKey:(id)a3 value:(id)a4 containerIdentity:(id)a5 context:(id)a6 resultPromise:(id)a7
{
  id v13;
  id v14;
  id v15;
  MCMCommandSetInfoValue *v16;
  MCMCommandSetInfoValue *v17;
  objc_super v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MCMCommandSetInfoValue;
  v16 = -[MCMCommand initWithContext:resultPromise:](&v19, sel_initWithContext_resultPromise_, a6, a7);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_key, a3);
    objc_storeStrong(&v17->_value, a4);
    objc_storeStrong((id *)&v17->_concreteContainerIdentity, a5);
  }

  return v17;
}

- (MCMCommandSetInfoValue)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  MCMCommandSetInfoValue *v9;
  uint64_t v10;
  MCMConcreteContainerIdentity *concreteContainerIdentity;
  uint64_t v12;
  NSString *key;
  uint64_t v14;
  id value;
  objc_super v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MCMCommandSetInfoValue;
  v9 = -[MCMCommand initWithMessage:context:reply:](&v17, sel_initWithMessage_context_reply_, v8, a4, a5);
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

    objc_msgSend(v8, "value");
    v14 = objc_claimAutoreleasedReturnValue();
    value = v9->_value;
    v9->_value = (id)v14;

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
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  MCMError *v14;
  void *v15;
  void *v16;
  char v17;
  MCMError *v18;
  void *v19;
  void *v20;
  MCMError *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  MCMResultBase *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  MCMError *v35;
  MCMError *v36;
  id v37;
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  MCMError *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17D7010](self, a2);
  -[MCMCommandSetInfoValue concreteContainerIdentity](self, "concreteContainerIdentity");
  v4 = objc_claimAutoreleasedReturnValue();
  -[MCMCommandSetInfoValue key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommandSetInfoValue value](self, "value");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v7 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  v33 = (void *)v6;
  v34 = (void *)v4;
  if (!v8)
  {
    v32 = v3;
    v14 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 38);
    container_log_handle_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v40 = (uint64_t)v7;
      _os_log_error_impl(&dword_1CF807000, v23, OS_LOG_TYPE_ERROR, "Can't set nil or non-NSString key: %@", buf, 0xCu);
    }
    v16 = 0;
    v13 = 0;
    v11 = 0;
    goto LABEL_21;
  }
  -[MCMCommand context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "containerCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend(v10, "entryForContainerIdentity:error:", v4, &v38);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v38;

  v37 = v12;
  objc_msgSend(v11, "metadataWithError:", &v37);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (MCMError *)v37;

  if (!v13)
  {
    v32 = v3;
    container_log_handle_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v4;
      _os_log_error_impl(&dword_1CF807000, v23, OS_LOG_TYPE_ERROR, "No Container with identity: %@", buf, 0xCu);
    }
    v16 = 0;
    v13 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v13, "metadataBySettingInfoValue:forKey:", v6, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 != v15)
  {
    v16 = v15;
    v32 = v3;
    v36 = v14;
    v17 = objc_msgSend(v15, "writeMetadataToDiskWithError:", &v36);
    v18 = v36;

    if ((v17 & 1) != 0)
    {
      -[MCMCommand context](self, "context");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "containerCache");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v18;
      objc_msgSend(v20, "addContainerMetadata:error:", v16, &v35);
      v21 = v18;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v35;

      if (v22)
      {
LABEL_22:
        v3 = v32;
        goto LABEL_23;
      }
      container_log_handle_for_category();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "containerPath");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "containerRootURL");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "path");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v40 = (uint64_t)v16;
        v41 = 2112;
        v42 = v26;
        _os_log_error_impl(&dword_1CF807000, v23, OS_LOG_TYPE_ERROR, "Failed to add to cache: %@, url: %@", buf, 0x16u);

      }
    }
    else
    {
      container_log_handle_for_category();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "containerPath");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "containerRootURL");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "path");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v40 = (uint64_t)v16;
        v41 = 2112;
        v42 = v31;
        v43 = 2112;
        v44 = v18;
        _os_log_error_impl(&dword_1CF807000, v23, OS_LOG_TYPE_ERROR, "Failed to write updated metadata: %@, url: %@, error = %@", buf, 0x20u);

      }
      v14 = v18;
    }
LABEL_21:

    goto LABEL_22;
  }
  v16 = v13;
LABEL_23:
  v27 = -[MCMResultBase initWithError:]([MCMResultBase alloc], "initWithError:", v14);
  -[MCMCommand resultPromise](self, "resultPromise");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "completeWithResult:", v27);

  objc_autoreleasePoolPop(v3);
}

- (MCMConcreteContainerIdentity)concreteContainerIdentity
{
  return self->_concreteContainerIdentity;
}

- (NSString)key
{
  return self->_key;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_concreteContainerIdentity, 0);
}

+ (unint64_t)command
{
  return 5;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end
