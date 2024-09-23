@implementation FCContextConfiguration

- (int64_t)environment
{
  return self->_environment;
}

- (NSString)contentContainerCombinationIdentifier
{
  return self->_contentContainerCombinationIdentifier;
}

- (NSString)privateDataSecureContainerIdentifier
{
  return self->_privateDataSecureContainerIdentifier;
}

- (NSString)privateDataContainerIdentifier
{
  return self->_privateDataContainerIdentifier;
}

- (BOOL)isProductionPrivateDataEnvironment
{
  return self->_isProductionPrivateDataEnvironment;
}

+ (id)defaultConfiguration
{
  if (qword_1ED0F84F0 != -1)
    dispatch_once(&qword_1ED0F84F0, &__block_literal_global_113);
  return (id)_MergedGlobals_185;
}

- (NSString)privateDataContainerCombinationIdentifier
{
  return self->_privateDataContainerCombinationIdentifier;
}

- (NSString)contentContainerIdentifier
{
  return self->_contentContainerIdentifier;
}

- (BOOL)isProductionContentEnvironment
{
  return self->_isProductionContentEnvironment;
}

void __46__FCContextConfiguration_defaultConfiguration__block_invoke()
{
  FCContextConfiguration *v0;
  void *v1;

  v0 = -[FCContextConfiguration initWithEnvironment:]([FCContextConfiguration alloc], "initWithEnvironment:", FCCurrentContextEnvironment());
  v1 = (void *)_MergedGlobals_185;
  _MergedGlobals_185 = (uint64_t)v0;

}

- (FCContextConfiguration)initWithEnvironment:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  __CFString **v8;
  __CFString **v9;
  __CFString **v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  FCContextConfiguration *v24;
  void *v26;
  void *v27;
  FCContextConfiguration *v28;
  void *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentStoreFrontID");
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = 1;
  v28 = self;
  v29 = (void *)v6;
  v8 = FCCKProductionPrivateSecureContainerIdentifier;
  v9 = FCCKProductionPrivateContainerIdentifier;
  v10 = FCCKProductionContentContainerIdentifier;
  switch(a3)
  {
    case 0:
      goto LABEL_9;
    case 1:
    case 4:
      v7 = 0;
      v8 = FCCKStagingPrivateSecureContainerIdentifier;
      v9 = FCCKStagingPrivateContainerIdentifier;
      v10 = FCCKStagingContentContainerIdentifier;
      goto LABEL_9;
    case 2:
      v7 = 0;
      v8 = FCCKQAPrivateSecureContainerIdentifier;
      v9 = FCCKQAPrivateContainerIdentifier;
      v10 = FCCKQAContentContainerIdentifier;
      goto LABEL_9;
    case 3:
    case 5:
      v7 = 0;
      goto LABEL_9;
    case 6:
      v7 = 0;
      v8 = FCCKSandboxPrivateSecureContainerIdentifier;
      v9 = FCCKSandboxPrivateContainerIdentifier;
      v10 = FCCKSandboxContentContainerIdentifier;
      goto LABEL_9;
    case 7:
      v7 = 0;
      v8 = FCCKDemo1PrivateSecureContainerIdentifier;
      v9 = FCCKDemo1PrivateContainerIdentifier;
      v10 = FCCKDemo1ContentContainerIdentifier;
      goto LABEL_9;
    case 8:
      v7 = 0;
      v8 = FCCKDemo2PrivateSecureContainerIdentifier;
      v9 = FCCKDemo2PrivateContainerIdentifier;
      v10 = FCCKDemo2ContentContainerIdentifier;
LABEL_9:
      v13 = *v10;
      v12 = *v9;
      v11 = *v8;
      break;
    default:
      v11 = 0;
      v12 = 0;
      v13 = 0;
      break;
  }
  NewsCoreUserDefaults();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringForKey:", CFSTR("private_container_name"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;

    v12 = v17;
  }
  objc_msgSend(v14, "stringForKey:", CFSTR("private_secure_container_name"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = v18;

    v11 = v20;
  }
  objc_msgSend(v14, "stringForKey:", CFSTR("private_container_environment"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  v23 = v7;
  if (v21)
    v23 = objc_msgSend(v21, "isEqualToString:", CFSTR("production"));
  if (!v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("must have a content container identifier"));
    *(_DWORD *)buf = 136315906;
    v31 = "-[FCContextConfiguration initWithEnvironment:]";
    v32 = 2080;
    v33 = "FCContextConfiguration.m";
    v34 = 1024;
    v35 = 179;
    v36 = 2114;
    v37 = v26;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v12)
      goto LABEL_21;
  }
  else if (v12)
  {
    goto LABEL_21;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("must have a private container identifier"));
    *(_DWORD *)buf = 136315906;
    v31 = "-[FCContextConfiguration initWithEnvironment:]";
    v32 = 2080;
    v33 = "FCContextConfiguration.m";
    v34 = 1024;
    v35 = 180;
    v36 = 2114;
    v37 = v27;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_21:
  v24 = -[FCContextConfiguration initWithProductionContentEnvironment:productionPrivateDataEnvironment:contentContainerIdentifier:privateDataContainerIdentifier:privateDataSecureContainerIdentifier:storeFrontID:environment:](v28, "initWithProductionContentEnvironment:productionPrivateDataEnvironment:contentContainerIdentifier:privateDataContainerIdentifier:privateDataSecureContainerIdentifier:storeFrontID:environment:", v7, v23, v13, v12, v11, v29, a3);

  return v24;
}

- (FCContextConfiguration)initWithProductionContentEnvironment:(BOOL)a3 productionPrivateDataEnvironment:(BOOL)a4 contentContainerIdentifier:(id)a5 privateDataContainerIdentifier:(id)a6 privateDataSecureContainerIdentifier:(id)a7 storeFrontID:(id)a8 environment:(int64_t)a9
{
  _BOOL4 v12;
  _BOOL4 v13;
  id v15;
  id v16;
  id v17;
  FCContextConfiguration *v18;
  FCContextConfiguration *v19;
  uint64_t v20;
  NSString *contentContainerIdentifier;
  uint64_t v22;
  NSString *privateDataContainerIdentifier;
  uint64_t v24;
  NSString *privateDataSecureContainerIdentifier;
  __CFString *v26;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  uint64_t v30;
  NSString *contentContainerCombinationIdentifier;
  const __CFString *v32;
  uint64_t v33;
  NSString *privateDataContainerCombinationIdentifier;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  objc_super v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v12 = a4;
  v13 = a3;
  v49 = *MEMORY[0x1E0C80C00];
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v39 = a8;
  if (!v15 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "contentContainerIdentifier");
    *(_DWORD *)buf = 136315906;
    v42 = "-[FCContextConfiguration initWithProductionContentEnvironment:productionPrivateDataEnvironment:contentContaine"
          "rIdentifier:privateDataContainerIdentifier:privateDataSecureContainerIdentifier:storeFrontID:environment:]";
    v43 = 2080;
    v44 = "FCContextConfiguration.m";
    v45 = 1024;
    v46 = 43;
    v47 = 2114;
    v48 = v36;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v16)
      goto LABEL_6;
  }
  else if (v16)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "privateDataContainerIdentifier");
    *(_DWORD *)buf = 136315906;
    v42 = "-[FCContextConfiguration initWithProductionContentEnvironment:productionPrivateDataEnvironment:contentContaine"
          "rIdentifier:privateDataContainerIdentifier:privateDataSecureContainerIdentifier:storeFrontID:environment:]";
    v43 = 2080;
    v44 = "FCContextConfiguration.m";
    v45 = 1024;
    v46 = 44;
    v47 = 2114;
    v48 = v37;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v40.receiver = self;
  v40.super_class = (Class)FCContextConfiguration;
  v18 = -[FCContextConfiguration init](&v40, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_environment = a9;
    v18->_isProductionContentEnvironment = v13;
    v18->_isProductionPrivateDataEnvironment = v12;
    v20 = objc_msgSend(v15, "copy");
    contentContainerIdentifier = v19->_contentContainerIdentifier;
    v19->_contentContainerIdentifier = (NSString *)v20;

    v22 = objc_msgSend(v16, "copy");
    privateDataContainerIdentifier = v19->_privateDataContainerIdentifier;
    v19->_privateDataContainerIdentifier = (NSString *)v22;

    v24 = objc_msgSend(v17, "copy");
    privateDataSecureContainerIdentifier = v19->_privateDataSecureContainerIdentifier;
    v19->_privateDataSecureContainerIdentifier = (NSString *)v24;

    if (v13)
      v26 = CFSTR("production");
    else
      v26 = CFSTR("sandbox");
    v27 = (void *)MEMORY[0x1E0CB3940];
    v28 = v26;
    v29 = v28;
    if (v39)
      objc_msgSend(v27, "stringWithFormat:", CFSTR("%@-%@-%@"), v15, v28, v39);
    else
      objc_msgSend(v27, "stringWithFormat:", CFSTR("%@-%@"), v15, v28, v38);
    v30 = objc_claimAutoreleasedReturnValue();
    contentContainerCombinationIdentifier = v19->_contentContainerCombinationIdentifier;
    v19->_contentContainerCombinationIdentifier = (NSString *)v30;

    if (v12)
      v32 = CFSTR("production");
    else
      v32 = CFSTR("sandbox");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-%@"), v15, v16, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    privateDataContainerCombinationIdentifier = v19->_privateDataContainerCombinationIdentifier;
    v19->_privateDataContainerCombinationIdentifier = (NSString *)v33;

  }
  return v19;
}

- (FCContextConfiguration)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCContextConfiguration init]";
    v9 = 2080;
    v10 = "FCContextConfiguration.m";
    v11 = 1024;
    v12 = 27;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCContextConfiguration init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NSString)contentEnvironmentDescription
{
  int64_t v2;

  v2 = -[FCContextConfiguration environment](self, "environment");
  if ((unint64_t)(v2 - 1) > 7)
    return (NSString *)CFSTR("production");
  else
    return &off_1E4645E78[v2 - 1]->isa;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateDataContainerCombinationIdentifier, 0);
  objc_storeStrong((id *)&self->_privateDataSecureContainerIdentifier, 0);
  objc_storeStrong((id *)&self->_privateDataContainerIdentifier, 0);
  objc_storeStrong((id *)&self->_contentContainerCombinationIdentifier, 0);
  objc_storeStrong((id *)&self->_contentContainerIdentifier, 0);
}

@end
