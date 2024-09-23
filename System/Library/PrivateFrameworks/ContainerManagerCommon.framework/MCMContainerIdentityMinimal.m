@implementation MCMContainerIdentityMinimal

- (MCMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (unint64_t)containerClass
{
  void *v2;
  unint64_t v3;

  -[MCMContainerIdentityMinimal containerConfig](self, "containerConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containerClass");

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityCache, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_containerConfig, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (unsigned)platform
{
  return self->_platform;
}

- (id)identityBySettingPlatform:(unsigned int)a3
{
  _DWORD *v4;

  v4 = (_DWORD *)-[MCMContainerIdentityMinimal copy](self, "copy");
  v4[2] = a3;
  return v4;
}

- (unsigned)disposition
{
  return self->_disposition;
}

- (MCMContainerIdentityMinimal)init
{
  NSObject *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  container_log_handle_for_category();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v5 = 136315138;
    v6 = "-[MCMContainerIdentityMinimal init]";
    _os_log_fault_impl(&dword_1CF807000, v3, OS_LOG_TYPE_FAULT, "%s You cannot init this class directly.", (uint8_t *)&v5, 0xCu);
  }

  return 0;
}

- (MCMContainerIdentityMinimal)initWithUserIdentity:(id)a3 identifier:(id)a4 containerConfig:(id)a5 platform:(unsigned int)a6 userIdentityCache:(id)a7 error:(unint64_t *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  MCMContainerIdentityMinimal *v18;
  MCMContainerIdentityMinimal *v19;
  uint64_t v20;
  MCMUserIdentity *userIdentity;
  id v22;
  NSString *v23;
  unint64_t v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  NSString *identifier;
  unsigned int v30;
  objc_super v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v32.receiver = self;
  v32.super_class = (Class)MCMContainerIdentityMinimal;
  v18 = -[MCMContainerIdentityMinimal init](&v32, sel_init);
  if (!v18)
  {
    v24 = 1;
    goto LABEL_24;
  }
  v19 = v18;
  objc_storeStrong((id *)&v18->_userIdentityCache, a7);
  objc_msgSend(v17, "userIdentityForContainerConfig:originatorUserIdentity:", v16, v14);
  v20 = objc_claimAutoreleasedReturnValue();
  userIdentity = v19->_userIdentity;
  v19->_userIdentity = (MCMUserIdentity *)v20;

  if (v19->_userIdentity)
  {
    if (!v15)
    {
      container_log_handle_for_category();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CF807000, v25, OS_LOG_TYPE_ERROR, "Invalid object: missing identifier", buf, 2u);
      }
      v24 = 18;
      goto LABEL_23;
    }
    objc_opt_class();
    v22 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = (NSString *)v22;
    else
      v23 = 0;

    identifier = v19->_identifier;
    v19->_identifier = v23;

    if (v19->_identifier)
    {
      objc_storeStrong((id *)&v19->_containerConfig, a5);
      if (v19->_containerConfig)
      {
        v30 = objc_msgSend(v16, "disposition");
        v19->_platform = a6;
        v19->_disposition = v30;
        goto LABEL_26;
      }
      container_log_handle_for_category();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        goto LABEL_22;
      *(_DWORD *)buf = 138412290;
      v34 = v16;
      v26 = "Invalid object: container class = %@";
      goto LABEL_20;
    }
    container_log_handle_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v22;
      v26 = "Invalid object: identifier = [%@]";
LABEL_20:
      v27 = v25;
      v28 = 12;
      goto LABEL_21;
    }
  }
  else
  {
    container_log_handle_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v26 = "Invalid object: no user identity";
      v27 = v25;
      v28 = 2;
LABEL_21:
      _os_log_error_impl(&dword_1CF807000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
    }
  }
LABEL_22:
  v24 = 11;
LABEL_23:

LABEL_24:
  v19 = 0;
  if (a8)
    *a8 = v24;
LABEL_26:

  return v19;
}

- (MCMContainerIdentityMinimal)initWithLibsystemContainer:(container_object_s *)a3 defaultUserIdentity:(id)a4 userIdentityCache:(id)a5 error:(unint64_t *)a6
{
  id v9;
  id v10;
  uint64_t identifier;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t persona_unique_string;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  MCMContainerIdentityMinimal *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  MCMContainerIdentityMinimal *v30;
  char v32;
  char v33;
  NSObject *v34;
  NSObject *v35;
  unint64_t *v36;
  unint64_t v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v37 = 1;
  identifier = container_get_identifier();
  if (!identifier)
  {
    container_log_handle_for_category();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CF807000, v19, OS_LOG_TYPE_ERROR, "Identifier in container_object_t is NULL", buf, 2u);
    }

    v20 = 0;
    v21 = 0;
    v16 = 0;
    v18 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 11;
LABEL_9:
    v37 = v24;
    if (!a6)
      goto LABEL_27;
    goto LABEL_25;
  }
  v36 = a6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", identifier);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = container_get_class();
  v14 = containermanager_copy_global_configuration();
  objc_msgSend(v14, "staticConfig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "configForContainerClass:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if ((objc_msgSend(v16, "supportedOnPlatform") & 1) != 0)
    {
      container_is_transient();
      persona_unique_string = container_get_persona_unique_string();
      if (persona_unique_string)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", persona_unique_string);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }
      +[MCMPOSIXUser posixUserWithUID:](MCMPOSIXUser, "posixUserWithUID:", container_get_uid());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "personaAndUserSpecific"))
      {
        if (v18)
        {
          objc_msgSend(v10, "userIdentityForPersonaUniqueString:POSIXUser:", v18, v20);
          v28 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v28 = v9;
        }
        v21 = v28;
        v22 = (void *)v12;
        a6 = v36;
        if (!v28)
        {
          container_log_handle_for_category();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v39 = (uint64_t)v18;
            _os_log_error_impl(&dword_1CF807000, v35, OS_LOG_TYPE_ERROR, "Cannot reconstitute a user identity from provided persona unique string; personaUniqueString = [%@]",
              buf,
              0xCu);
          }

          v21 = 0;
          goto LABEL_38;
        }
        v32 = objc_msgSend(v9, "isNoSpecificPersona");
        v33 = objc_msgSend(v9, "isEqual:", v21);
        if ((v32 & 1) == 0 && (v33 & 1) == 0)
        {
          container_log_handle_for_category();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v39 = (uint64_t)v18;
            v40 = 1024;
            v41 = 0;
            v42 = 1024;
            v43 = 0;
            _os_log_error_impl(&dword_1CF807000, v34, OS_LOG_TYPE_ERROR, "Persona unique string is not valid for this client; personaUniqueString = [%@], nonspecific = %d, sameAsClient = %d",
              buf,
              0x18u);
          }

LABEL_38:
          v23 = 0;
          v24 = 76;
          goto LABEL_9;
        }
      }
      else
      {
        v21 = 0;
        v22 = (void *)v12;
        a6 = v36;
      }
      objc_msgSend(v10, "userIdentityForContainerConfig:originatorUserIdentity:", v16, v21);
      v29 = objc_claimAutoreleasedReturnValue();

      v23 = -[MCMContainerIdentityMinimal initWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:](self, "initWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:", v29, v22, v16, 0, v10, &v37);
      v21 = (void *)v29;
      self = v23;
      if (!a6)
        goto LABEL_27;
      goto LABEL_25;
    }
    container_log_handle_for_category();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v39 = v13;
      _os_log_error_impl(&dword_1CF807000, v27, OS_LOG_TYPE_ERROR, "Container class in container_object_t (%llu) is unsupported", buf, 0xCu);
    }

    v20 = 0;
    v21 = 0;
    v18 = 0;
    v23 = 0;
    v26 = 72;
  }
  else
  {
    container_log_handle_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v39 = v13;
      _os_log_error_impl(&dword_1CF807000, v25, OS_LOG_TYPE_ERROR, "Container class in container_object_t (%llu) is invalid", buf, 0xCu);
    }

    v20 = 0;
    v21 = 0;
    v16 = 0;
    v18 = 0;
    v23 = 0;
    v26 = 20;
  }
  v37 = v26;
  v22 = (void *)v12;
  a6 = v36;
  if (!v36)
    goto LABEL_27;
LABEL_25:
  if (!v23)
    *a6 = v37;
LABEL_27:
  v30 = v23;

  return v30;
}

- (id)plist
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("1");
  v11[0] = CFSTR("version");
  v11[1] = CFSTR("identifier");
  -[MCMContainerIdentityMinimal identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  v11[2] = CFSTR("containerClass");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[MCMContainerIdentityMinimal containerConfig](self, "containerConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(v5, "containerClass"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  v11[3] = CFSTR("userIdentity");
  -[MCMContainerIdentityMinimal userIdentity](self, "userIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "plist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (MCMContainerIdentityMinimal)initWithPlist:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v8;
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("version"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqual:", CFSTR("1"));

      if (v12)
        self = -[MCMContainerIdentityMinimal initWithVersion1PlistDictionary:userIdentityCache:error:](self, "initWithVersion1PlistDictionary:userIdentityCache:error:", v10, v9, a5);

    }
  }

  return self;
}

- (MCMContainerIdentityMinimal)initWithVersion1PlistDictionary:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  MCMContainerIdentityMinimal *v19;
  NSObject *v20;
  NSObject *v21;
  MCMContainerIdentityMinimal *v22;
  id v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  const __CFString *v30;
  MCMContainerIdentityMinimal *v31;
  void *v32;
  unint64_t v33;
  uint8_t buf[4];
  const __CFString *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v33 = 1;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("containerClass"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("userIdentity"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v33 = 116;
    container_log_handle_for_category();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v35 = CFSTR("identifier");
      v36 = 2112;
      v37 = (id)objc_opt_class();
      v38 = 2112;
      v39 = v8;
      v24 = v37;
      _os_log_error_impl(&dword_1CF807000, v20, OS_LOG_TYPE_ERROR, "Invalid container identity plist data. Expected string for %@, got %@. Data: %@", buf, 0x20u);

    }
    v16 = 0;
    v18 = 0;
    v12 = 0;
LABEL_17:
    v19 = 0;
    if (!a5)
      goto LABEL_20;
    goto LABEL_18;
  }
  v12 = v10;
  if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v33 = 116;
    container_log_handle_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v35 = CFSTR("containerClass");
      v36 = 2112;
      v37 = (id)objc_opt_class();
      v38 = 2112;
      v39 = v8;
      v28 = v37;
      _os_log_error_impl(&dword_1CF807000, v21, OS_LOG_TYPE_ERROR, "Invalid container identity plist data. Expected number for %@, got %@. Data: %@", buf, 0x20u);

    }
    v16 = 0;
LABEL_16:
    v18 = 0;
    goto LABEL_17;
  }
  v31 = self;
  v13 = objc_msgSend(v11, "unsignedIntegerValue");
  v14 = containermanager_copy_global_configuration();
  objc_msgSend(v14, "staticConfig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (const __CFString *)v13;
  objc_msgSend(v15, "configForContainerClass:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    self = v31;
    if ((objc_msgSend(v16, "supportedOnPlatform") & 1) != 0)
    {
      +[MCMUserIdentity userIdentityWithPlist:cache:error:](MCMUserIdentity, "userIdentityWithPlist:cache:error:", v32, v9, &v33);
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)v17;
        v19 = -[MCMContainerIdentityMinimal initWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:](v31, "initWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:", v17, v12, v16, 0, v9, &v33);
        self = v19;
        if (!a5)
          goto LABEL_20;
        goto LABEL_18;
      }
      v33 = 116;
      container_log_handle_for_category();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v35 = CFSTR("userIdentity");
        v36 = 2112;
        v37 = v8;
        _os_log_error_impl(&dword_1CF807000, v29, OS_LOG_TYPE_ERROR, "Invalid container identity plist data. Could not reconstitute user identity from %@. Data: %@", buf, 0x16u);
      }

      goto LABEL_16;
    }
    container_log_handle_for_category();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v35 = v30;
      _os_log_error_impl(&dword_1CF807000, v27, OS_LOG_TYPE_ERROR, "Container class in container_object_t (%llu) is unsupported", buf, 0xCu);
    }

    v18 = 0;
    v19 = 0;
    v26 = 72;
  }
  else
  {
    container_log_handle_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    self = v31;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v35 = v30;
      _os_log_error_impl(&dword_1CF807000, v25, OS_LOG_TYPE_ERROR, "Container class in plist data (%llu) is invalid", buf, 0xCu);
    }

    v16 = 0;
    v18 = 0;
    v19 = 0;
    v26 = 20;
  }
  v33 = v26;
  if (!a5)
    goto LABEL_20;
LABEL_18:
  if (!v19)
    *a5 = v33;
LABEL_20:
  v22 = v19;

  return v22;
}

- (id)minimalIdentity
{
  MCMContainerIdentityMinimal *v2;
  MCMContainerIdentityMinimal *v3;
  MCMContainerIdentityMinimal *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v12;
  uint64_t error_description;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  MCMContainerIdentityMinimal *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v14 = 1;
  v2 = self;
  v3 = v2;
  if ((-[MCMContainerIdentityMinimal isMemberOfClass:](v2, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
  {
    v4 = [MCMContainerIdentityMinimal alloc];
    -[MCMContainerIdentityMinimal userIdentity](v2, "userIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMContainerIdentityMinimal identifier](v2, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMContainerIdentityMinimal containerConfig](v2, "containerConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MCMContainerIdentityMinimal platform](v2, "platform");
    -[MCMContainerIdentityMinimal userIdentityCache](v2, "userIdentityCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[MCMContainerIdentityMinimal initWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:](v4, "initWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:", v5, v6, v7, v8, v9, &v14);

  }
  if (!v3)
  {
    container_log_handle_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v12 = v14;
      error_description = container_get_error_description();
      *(_DWORD *)buf = 134218498;
      v16 = v12;
      v17 = 2080;
      v18 = error_description;
      v19 = 2112;
      v20 = v2;
      _os_log_fault_impl(&dword_1CF807000, v10, OS_LOG_TYPE_FAULT, "Failed to create minimal identity; error = (%llu) %s, self = %@",
        buf,
        0x20u);
    }

  }
  return v3;
}

- (id)identityByChangingUserIdentity:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = (_QWORD *)-[MCMContainerIdentityMinimal copy](self, "copy");
  v6 = (void *)v5[4];
  v5[4] = v4;

  return v5;
}

- (id)description
{
  MCMLazyDescription *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = [MCMLazyDescription alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__MCMContainerIdentityMinimal_description__block_invoke;
  v5[3] = &unk_1E8CB6800;
  v5[4] = self;
  return -[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (id)debugDescription
{
  MCMLazyDescription *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = [MCMLazyDescription alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__MCMContainerIdentityMinimal_debugDescription__block_invoke;
  v5[3] = &unk_1E8CB6800;
  v5[4] = self;
  return -[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[MCMUserIdentity hash](self->_userIdentity, "hash");
  return v4 ^ v3 ^ -[MCMContainerConfiguration hash](self->_containerConfig, "hash");
}

- (BOOL)isEqualToContainerIdentity:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  v5 = -[NSString isEqual:](self->_identifier, "isEqual:", v4[2])
    && -[MCMUserIdentity isEqual:](self->_userIdentity, "isEqual:", v4[4])
    && -[MCMContainerConfiguration isEqual:](self->_containerConfig, "isEqual:", v4[3]);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  MCMContainerIdentityMinimal *v4;
  BOOL v5;

  v4 = (MCMContainerIdentityMinimal *)a3;
  v5 = self == v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[MCMContainerIdentityMinimal isEqualToContainerIdentity:](self, "isEqualToContainerIdentity:", v4);

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MCMContainerIdentityMinimal *v5;
  MCMUserIdentity *userIdentity;
  void *v7;
  MCMContainerIdentityMinimal *v8;

  v5 = [MCMContainerIdentityMinimal alloc];
  userIdentity = self->_userIdentity;
  v7 = (void *)-[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v8 = -[MCMContainerIdentityMinimal initWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:](v5, "initWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:", userIdentity, v7, self->_containerConfig, self->_platform, self->_userIdentityCache, 0);

  return v8;
}

- (MCMContainerConfiguration)containerConfig
{
  return self->_containerConfig;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

id __47__MCMContainerIdentityMinimal_debugDescription__block_invoke(uint64_t a1, int a2)
{
  objc_class *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;

  v19 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "userIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shortDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a2)
  {
    objc_msgSend(v8, "redactedDescription");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "redactedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (uint64_t)v9;
  }
  objc_msgSend(*(id *)(a1 + 32), "containerConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "debugDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(*(id *)(a1 + 32), "platform");
  v15 = (void *)v5;
  objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@: %p; userIdentity = %@, identifier = %@, class = %@, platform = %d>"),
    v5,
    v6,
    v10,
    v11,
    v13,
    v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2)
  {

    v11 = (void *)v10;
  }

  return v16;
}

id __42__MCMContainerIdentityMinimal_description__block_invoke(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = v5;
  if (a2)
  {
    objc_msgSend(v5, "redactedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "containerConfig");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shortDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = v10;
  if (a2)
  {
    objc_msgSend(v10, "redactedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@(%@-);%@;pf%d>"),
    v7,
    v8,
    v12,
    objc_msgSend(*(id *)(a1 + 32), "platform"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {

    v11 = v9;
    v9 = (void *)v8;
  }
  else
  {
    v7 = (void *)v8;
  }

  return v13;
}

+ (id)minimalContainerIdentityFromPlist:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPlist:userIdentityCache:error:", v9, v8, a5);

  return v10;
}

@end
