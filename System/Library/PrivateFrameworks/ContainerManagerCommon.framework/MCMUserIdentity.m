@implementation MCMUserIdentity

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

id __35__MCMUserIdentity_shortDescription__block_invoke(uint64_t a1, char a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "posixUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "UID");
  objc_msgSend(*(id *)(a1 + 32), "posixUser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "primaryGID");
  if ((a2 & 1) != 0)
  {
    v9 = CFSTR("~~");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%u/%u/%@/%d/%d>"), v6, v8, v9, objc_msgSend(*(id *)(a1 + 32), "personaType"), objc_msgSend(*(id *)(a1 + 32), "kernelPersonaID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a2 & 1) == 0)

  return v10;
}

- (int)personaType
{
  return self->_personaType;
}

- (MCMPOSIXUser)posixUser
{
  return self->_posixUser;
}

- (unsigned)kernelPersonaID
{
  return self->_kernelPersonaID;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if ((self->_extensionHandle & 0x8000000000000000) == 0)
  {
    sandbox_extension_release();
    self->_extensionHandle = -1;
  }
  v3.receiver = self;
  v3.super_class = (Class)MCMUserIdentity;
  -[MCMUserIdentity dealloc](&v3, sel_dealloc);
}

- (NSString)shortDescription
{
  MCMLazyDescription *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = [MCMLazyDescription alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__MCMUserIdentity_shortDescription__block_invoke;
  v5[3] = &unk_1E8CB6800;
  v5[4] = self;
  return (NSString *)-[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (id)description
{
  MCMLazyDescription *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = [MCMLazyDescription alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__MCMUserIdentity_description__block_invoke;
  v5[3] = &unk_1E8CB6800;
  v5[4] = self;
  return -[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (BOOL)isEqual:(id)a3
{
  MCMUserIdentity *v4;
  MCMUserIdentity *v5;
  BOOL v6;

  v4 = (MCMUserIdentity *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[MCMUserIdentity isEqualToUserIdentity:](self, "isEqualToUserIdentity:", v5);

  return v6;
}

- (BOOL)isEqualToUserIdentity:(id)a3
{
  return -[NSString isEqual:](self->_identifier, "isEqual:", *((_QWORD *)a3 + 5));
}

- (BOOL)isNoSpecificPersona
{
  return -[MCMUserIdentity personaType](self, "personaType") == 2;
}

- (BOOL)isDataSeparated
{
  return -[MCMUserIdentity personaType](self, "personaType") == 1;
}

+ (BOOL)isUserIdentityRequiredForContainerClass:(unint64_t)a3
{
  id v4;
  char v5;
  id v7;
  char v8;

  v4 = containermanager_copy_global_configuration();
  v5 = objc_msgSend(v4, "isGlobalBundleContainerWithContainerClass:", a3);

  if ((v5 & 1) != 0)
    return 0;
  v7 = containermanager_copy_global_configuration();
  v8 = objc_msgSend(v7, "isGlobalSystemContainerWithContainerClass:", a3);

  return v8 ^ 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posixUser, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_homeDirectoryURL, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = -[MCMPOSIXUser copyWithZone:](self->_posixUser, "copyWithZone:", a3);
    v7 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v6;

    v8 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v8;

    v10 = -[NSURL copyWithZone:](self->_homeDirectoryURL, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 8);
    *(_QWORD *)(v5 + 8) = v10;

    v12 = -[NSString copyWithZone:](self->_personaUniqueString, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v12;

    *(_DWORD *)(v5 + 20) = self->_personaType;
    *(_DWORD *)(v5 + 16) = self->_kernelPersonaID;
  }
  return (id)v5;
}

- (MCMUserIdentity)init
{
  id v3;
  void *v4;
  void *v5;
  MCMUserIdentity *v6;

  v3 = containermanager_copy_global_configuration();
  objc_msgSend(v3, "defaultUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "homeDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MCMUserIdentity initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:](self, "initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:", v4, v5, 0, 2, objc_msgSend(v4, "UID"));

  return v6;
}

- (MCMUserIdentity)initWithPOSIXUser:(id)a3 homeDirectoryURL:(id)a4 personaUniqueString:(id)a5 personaType:(int)a6 kernelPersonaID:(unsigned int)a7
{
  uint64_t v8;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  MCMUserIdentity *v19;
  MCMUserIdentity *v20;
  MCMUserIdentity *v21;
  NSObject *v22;
  objc_super v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v8 = *(_QWORD *)&a6;
  v27 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (v13)
  {
    if (v14)
      goto LABEL_10;
    goto LABEL_7;
  }
  container_log_handle_for_category();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1CF807000, v16, OS_LOG_TYPE_FAULT, "POSIX user cannot be nil", buf, 2u);
  }

  if (!v14)
  {
LABEL_7:
    container_log_handle_for_category();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v13;
      _os_log_fault_impl(&dword_1CF807000, v17, OS_LOG_TYPE_FAULT, "Home directory cannot be nil, user '%@'", buf, 0xCu);
    }

  }
LABEL_10:
  objc_msgSend((id)objc_opt_class(), "_identifierForPOSIXUID:personaUniqueString:personaType:", objc_msgSend(v13, "UID"), v15, v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v24.receiver = self;
    v24.super_class = (Class)MCMUserIdentity;
    v19 = -[MCMUserIdentity init](&v24, sel_init);
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_posixUser, a3);
      objc_storeStrong((id *)&v20->_personaUniqueString, a5);
      v20->_personaType = v8;
      objc_storeStrong((id *)&v20->_identifier, v18);
      objc_storeStrong((id *)&v20->_homeDirectoryURL, a4);
      v20->_kernelPersonaID = a7;
      v20->_extensionHandle = -1;
    }
    self = v20;
    v21 = self;
  }
  else
  {
    container_log_handle_for_category();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v13;
      _os_log_fault_impl(&dword_1CF807000, v22, OS_LOG_TYPE_FAULT, "Computed nil identifier, user '%@'", buf, 0xCu);
    }

    v21 = 0;
  }

  return v21;
}

+ (id)_identifierForPOSIXUID:(unsigned int)a3 personaUniqueString:(id)a4 personaType:(int)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v6 = *(_QWORD *)&a3;
  v7 = a4;
  v8 = v7;
  if (v7 && a5 == 1)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

- (BOOL)isStrictlyEqualToUserIdentity:(id)a3
{
  _DWORD *v4;
  BOOL v5;

  v4 = a3;
  if (-[MCMUserIdentity isEqualToUserIdentity:](self, "isEqualToUserIdentity:", v4))
    v5 = self->_personaType == v4[5];
  else
    v5 = 0;

  return v5;
}

id __30__MCMUserIdentity_description__block_invoke(uint64_t a1, int a2)
{
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  const __CFString *v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  objc_msgSend(*(id *)(a1 + 32), "homeDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "posixUser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = -[__CFString isEqualToString:](v5, "isEqualToString:", v8);
  v26 = (void *)v8;
  if ((v9 & 1) != 0 || a2)
  {
    if (v9)
      v10 = 0;
    else
      v10 = CFSTR("<cm-redacted>");

    v5 = (__CFString *)v10;
  }
  v23 = (void *)MEMORY[0x1E0CB3940];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(a1 + 32);
  objc_msgSend(v12, "posixUser");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v13;
  if (a2)
    objc_msgSend(v13, "redactedDescription");
  else
    objc_msgSend(v13, "description");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v16 = ", homeDirectoryURL = [";
  else
    v16 = "";
  if (v5)
    v17 = v5;
  else
    v17 = &stru_1E8CB6A50;
  if (v5)
    v18 = "]";
  else
    v18 = "";
  objc_msgSend(*(id *)(a1 + 32), "_descriptionForPersonaType:", objc_msgSend(*(id *)(a1 + 32), "personaType"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "personaUniqueString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@: %p; posixUser = %@, identifier = %@%s%@%s, personaType = %@, personaUniqueString = %@, kernelPersonaID = %d>"),
    v25,
    v12,
    v14,
    v15,
    v16,
    v17,
    v18,
    v19,
    v20,
    objc_msgSend(*(id *)(a1 + 32), "kernelPersonaID"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (NSURL)homeDirectoryURL
{
  return self->_homeDirectoryURL;
}

- (id)_descriptionForPersonaType:(int)a3
{
  if (a3 > 2)
    return CFSTR("unknown");
  else
    return off_1E8CB5958[a3];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MCMUserIdentity)initWithPlist:(id)a3 cache:(id)a4 error:(unint64_t *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  MCMUserIdentity *v13;
  void *v14;
  int v15;

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
      v12 = objc_msgSend(v11, "isEqual:", CFSTR("2"));

      if (v12)
      {
        v13 = -[MCMUserIdentity initWithVersion2PlistDictionary:cache:error:](self, "initWithVersion2PlistDictionary:cache:error:", v10, v9, a5);
      }
      else
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("version"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", CFSTR("1"));

        if (!v15)
        {
LABEL_8:

          goto LABEL_9;
        }
        v13 = -[MCMUserIdentity initWithVersion1PlistDictionary:cache:error:](self, "initWithVersion1PlistDictionary:cache:error:", v10, v9, a5);
      }
      self = v13;
      goto LABEL_8;
    }
  }
LABEL_9:

  return self;
}

- (MCMUserIdentity)initWithVersion1PlistDictionary:(id)a3 cache:(id)a4 error:(unint64_t *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  MCMUserIdentity *v19;
  NSObject *v20;
  NSObject *v21;
  unint64_t v22;
  id v24;
  int v25;
  id v26;
  int v27;
  _BYTE v28[10];
  _BYTE v29[10];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("posixUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("posixGID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("personaIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    container_log_handle_for_category();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v27 = 138412802;
      *(_QWORD *)v28 = CFSTR("posixUID");
      *(_WORD *)&v28[8] = 2112;
      *(_QWORD *)v29 = objc_opt_class();
      *(_WORD *)&v29[8] = 2112;
      v30[0] = v8;
      v24 = *(id *)v29;
      _os_log_error_impl(&dword_1CF807000, v20, OS_LOG_TYPE_ERROR, "Invalid user identity plist data. Expected number for %@, got %@. Data: %@", (uint8_t *)&v27, 0x20u);

    }
LABEL_15:
    v17 = 0;
    v19 = 0;
    v22 = 75;
    if (!a5)
      goto LABEL_18;
    goto LABEL_16;
  }
  v13 = objc_msgSend(v10, "unsignedIntegerValue");
  if (!v11 || (v14 = v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    container_log_handle_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v27 = 138412802;
      *(_QWORD *)v28 = CFSTR("posixGID");
      *(_WORD *)&v28[8] = 2112;
      *(_QWORD *)v29 = objc_opt_class();
      *(_WORD *)&v29[8] = 2112;
      v30[0] = v8;
      v26 = *(id *)v29;
      _os_log_error_impl(&dword_1CF807000, v21, OS_LOG_TYPE_ERROR, "Invalid user identity plist data. Expected number for %@, got %@. Data: %@", (uint8_t *)&v27, 0x20u);

    }
    goto LABEL_14;
  }
  v15 = objc_msgSend(v11, "unsignedIntegerValue");
  +[MCMPOSIXUser posixUserWithUID:](MCMPOSIXUser, "posixUserWithUID:", v14);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v25 = v14;
    container_log_handle_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v27 = 67109890;
      *(_DWORD *)v28 = v15;
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = v25;
      strcpy(v29, "@\b");
      v29[3] = 0;
      *(_WORD *)&v29[4] = 0;
      *(_DWORD *)&v29[6] = 0;
      LOWORD(v30[0]) = 2112;
      *(_QWORD *)((char *)v30 + 2) = v8;
      _os_log_error_impl(&dword_1CF807000, v21, OS_LOG_TYPE_ERROR, "Invalid user identity plist data. Could not get matching uid passwd data. gid: %d, uid: %d, User: %@, Data: %@", (uint8_t *)&v27, 0x22u);
    }
LABEL_14:

    goto LABEL_15;
  }
  v17 = (void *)v16;
  if (v12)
  {
    objc_msgSend(v9, "userIdentityForPersonaUniqueString:POSIXUser:", v12, v16);
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (MCMUserIdentity *)v18;
      goto LABEL_18;
    }
  }
  objc_msgSend(v9, "userIdentityForPersonalPersonaWithPOSIXUser:", v17);
  v19 = (MCMUserIdentity *)objc_claimAutoreleasedReturnValue();
  v22 = 1;
  if (!a5)
    goto LABEL_18;
LABEL_16:
  if (!v19)
    *a5 = v22;
LABEL_18:

  return v19;
}

- (MCMUserIdentity)initWithVersion2PlistDictionary:(id)a3 cache:(id)a4 error:(unint64_t *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  MCMUserIdentity *v19;
  unint64_t v20;
  id v21;
  int v22;
  NSObject *v23;
  MCMUserIdentity *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v28;
  id v29;
  id v30;
  NSObject *v31;
  id v32;
  uint64_t v34;
  void *v35;
  uint8_t buf[4];
  _BYTE v37[10];
  _BYTE v38[10];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("posixUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("posixGID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("personaUniqueString"));
  v34 = objc_claimAutoreleasedReturnValue();
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    container_log_handle_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v37 = CFSTR("posixUID");
      *(_WORD *)&v37[8] = 2112;
      *(_QWORD *)v38 = objc_opt_class();
      *(_WORD *)&v38[8] = 2112;
      v39[0] = v7;
      v29 = *(id *)v38;
      _os_log_error_impl(&dword_1CF807000, v25, OS_LOG_TYPE_ERROR, "Invalid user identity plist data. Expected number for %@, got %@. Data: %@", buf, 0x20u);

    }
    goto LABEL_22;
  }
  v11 = objc_msgSend(v9, "unsignedIntegerValue");
  if (!v10 || (v12 = v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    container_log_handle_for_category();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v37 = CFSTR("posixGID");
      *(_WORD *)&v37[8] = 2112;
      *(_QWORD *)v38 = objc_opt_class();
      *(_WORD *)&v38[8] = 2112;
      v39[0] = v7;
      v30 = *(id *)v38;
      _os_log_error_impl(&dword_1CF807000, v26, OS_LOG_TYPE_ERROR, "Invalid user identity plist data. Expected number for %@, got %@. Data: %@", buf, 0x20u);

    }
    goto LABEL_26;
  }
  v13 = objc_msgSend(v10, "unsignedIntegerValue");
  +[MCMPOSIXUser posixUserWithUID:](MCMPOSIXUser, "posixUserWithUID:", v12);
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    container_log_handle_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v37 = v13;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = v12;
      strcpy(v38, "@\b");
      v38[3] = 0;
      *(_WORD *)&v38[4] = 0;
      *(_DWORD *)&v38[6] = 0;
      LOWORD(v39[0]) = 2112;
      *(_QWORD *)((char *)v39 + 2) = v7;
      _os_log_error_impl(&dword_1CF807000, v25, OS_LOG_TYPE_ERROR, "Invalid user identity plist data. Could not get matching uid passwd data. gid: %d, uid: %d, User: %@, Data: %@", buf, 0x22u);
    }
LABEL_22:

LABEL_26:
    v15 = 0;
LABEL_27:
    v19 = 0;
    v20 = 75;
    v17 = v8;
LABEL_28:
    v18 = (void *)v34;
    goto LABEL_29;
  }
  v15 = (void *)v14;
  if (!v35 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    container_log_handle_for_category();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v37 = CFSTR("type");
      *(_WORD *)&v37[8] = 2112;
      *(_QWORD *)v38 = objc_opt_class();
      *(_WORD *)&v38[8] = 2112;
      v39[0] = v7;
      v32 = *(id *)v38;
      _os_log_error_impl(&dword_1CF807000, v28, OS_LOG_TYPE_ERROR, "Invalid user identity plist data. Expected number for %@, got %@. Data: %@", buf, 0x20u);

    }
    goto LABEL_27;
  }
  v16 = objc_msgSend(v35, "unsignedIntegerValue");
  if (v16 >= 4)
  {
    container_log_handle_for_category();
    v31 = objc_claimAutoreleasedReturnValue();
    v17 = v8;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v37 = CFSTR("type");
      *(_WORD *)&v37[8] = 2112;
      *(_QWORD *)v38 = v35;
      *(_WORD *)&v38[8] = 2112;
      v39[0] = v7;
      _os_log_error_impl(&dword_1CF807000, v31, OS_LOG_TYPE_ERROR, "Invalid user identity plist data. Expected persona type for %@, got %@. Data: %@", buf, 0x20u);
    }

    v19 = 0;
    v20 = 75;
    goto LABEL_28;
  }
  v17 = v8;
  v18 = (void *)v34;
  if (!v34 || v16 != 1)
  {
    objc_msgSend(v8, "userIdentityForPersonalPersonaWithPOSIXUser:", v15);
    v19 = (MCMUserIdentity *)objc_claimAutoreleasedReturnValue();
    v20 = 1;
    if (!a5)
      goto LABEL_32;
    goto LABEL_30;
  }
  objc_msgSend(v8, "userIdentityForPersonaUniqueString:POSIXUser:", v34, v15);
  v19 = (MCMUserIdentity *)objc_claimAutoreleasedReturnValue();
  if (MCMPersonasAreSupported_onceToken != -1)
    dispatch_once(&MCMPersonasAreSupported_onceToken, &__block_literal_global_8254);
  v20 = 1;
  if (!MCMPersonasAreSupported_staticPersonasSupported || !v19)
  {
LABEL_29:
    if (!a5)
      goto LABEL_32;
LABEL_30:
    if (!v19)
      *a5 = v20;
    goto LABEL_32;
  }
  if (-[MCMUserIdentity isDataSeparated](v19, "isDataSeparated"))
  {
LABEL_32:
    v24 = self;
    goto LABEL_33;
  }
  v21 = containermanager_copy_global_configuration();
  v22 = objc_msgSend(v21, "dispositionForContainerClass:", 2);

  if (v22 == 1)
  {
    container_log_handle_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = self;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v37 = v34;
      *(_WORD *)&v37[8] = 2112;
      *(_QWORD *)v38 = v19;
      *(_WORD *)&v38[8] = 2112;
      v39[0] = v7;
      _os_log_error_impl(&dword_1CF807000, v23, OS_LOG_TYPE_ERROR, "Invalid user identity plist data. Expected %@ to be data separated, but it was not: %@; Data: %@",
        buf,
        0x20u);
    }

    v18 = (void *)v34;
  }
  else
  {
    v24 = self;
    v18 = (void *)v34;
  }
LABEL_33:

  return v19;
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("posixUID");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[MCMUserIdentity posixUser](self, "posixUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInt:", objc_msgSend(v4, "UID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v16[1] = CFSTR("posixGID");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[MCMUserIdentity posixUser](self, "posixUser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInt:", objc_msgSend(v7, "primaryGID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v8;
  v16[2] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MCMUserIdentity personaType](self, "personaType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = CFSTR("version");
  v17[2] = v9;
  v17[3] = CFSTR("2");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  -[MCMUserIdentity personaUniqueString](self, "personaUniqueString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MCMUserIdentity personaUniqueString](self, "personaUniqueString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("personaUniqueString"));

  }
  v14 = (void *)objc_msgSend(v11, "copy");

  return v14;
}

- (BOOL)homeDirectoryExists
{
  void *v3;
  void *v4;

  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMUserIdentity homeDirectoryURL](self, "homeDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "itemExistsAtURL:", v4);

  return (char)self;
}

- (MCMUserIdentity)userIdentityWithPOSIXUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  MCMUserIdentity *v8;

  v4 = a3;
  -[MCMUserIdentity personaUniqueString](self, "personaUniqueString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMUserIdentity homeDirectoryURL](self, "homeDirectoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[MCMUserIdentity isDataSeparated](self, "isDataSeparated"))
  {
    objc_msgSend(v4, "homeDirectoryURL");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  v8 = -[MCMUserIdentity initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:]([MCMUserIdentity alloc], "initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:", v4, v6, v5, -[MCMUserIdentity personaType](self, "personaType"), -[MCMUserIdentity kernelPersonaID](self, "kernelPersonaID"));

  return v8;
}

- (int64_t)extensionHandle
{
  return self->_extensionHandle;
}

- (void)setExtensionHandle:(int64_t)a3
{
  self->_extensionHandle = a3;
}

+ (MCMUserIdentity)userIdentityWithPlist:(id)a3 cache:(id)a4 error:(unint64_t *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPlist:cache:error:", v9, v8, a5);

  return (MCMUserIdentity *)v10;
}

@end
