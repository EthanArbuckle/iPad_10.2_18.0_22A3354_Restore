@implementation MCMStaticConfiguration

- (id)initFromPlistAtPathOrName:(id)a3 defaultPlistDirectoryURL:(id)a4
{
  _QWORD *v4;
  void *v5;
  void *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)MCMStaticConfiguration;
  v4 = -[MCMPlistReadOnly initFromPlistAtPathOrName:defaultPlistDirectoryURL:conformingToProtocol:](&v8, sel_initFromPlistAtPathOrName_defaultPlistDirectoryURL_conformingToProtocol_, a3, a4, &unk_1EFBC6070);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)v4[11];
    v4[11] = 0;

  }
  return v5;
}

- (id)configForContainerClass:(unint64_t)a3
{
  NSDictionary *containerConfigMapByEnum;
  void *v4;
  void *v5;

  containerConfigMapByEnum = self->_containerConfigMapByEnum;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", container_class_normalized());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](containerConfigMapByEnum, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)loadWithError:(id *)a3
{
  void *v5;
  unsigned int v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  NSDictionary *v20;
  NSDictionary *containerConfigMapByEnum;
  BOOL v22;
  id *v24;
  id v25;
  objc_super v26;
  id v27;
  _BYTE v28[128];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)MCMStaticConfiguration;
  v27 = 0;
  v6 = -[MCMPlistReadOnly loadWithError:](&v26, sel_loadWithError_, &v27);
  v7 = v27;
  v8 = v7;
  if (v6)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[MCMStaticConfiguration containerConfigMap](self, "containerConfigMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
    if (!v10)
    {
LABEL_12:

      v20 = (NSDictionary *)objc_msgSend(v5, "copy");
      containerConfigMapByEnum = self->_containerConfigMapByEnum;
      self->_containerConfigMapByEnum = v20;

      v22 = 1;
      v18 = v8;
      goto LABEL_17;
    }
    v11 = v10;
    v24 = a3;
    v12 = *(_QWORD *)v30;
LABEL_4:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v12)
        objc_enumerationMutation(v9);
      v14 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v13);
      -[MCMStaticConfiguration containerConfigMap](self, "containerConfigMap");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v25 = v8;
        v17 = objc_msgSend(v16, "loadWithError:", &v25);
        v18 = v25;

        if (!v17)
        {

          a3 = v24;
          if (v24)
            goto LABEL_14;
LABEL_16:
          v22 = 0;
          goto LABEL_17;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v16, "containerClass"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v19);

        v8 = v18;
      }

      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
        if (v11)
          goto LABEL_4;
        goto LABEL_12;
      }
    }
  }
  v18 = v7;
  if (!a3)
    goto LABEL_16;
LABEL_14:
  v18 = objc_retainAutorelease(v18);
  v22 = 0;
  *a3 = v18;
LABEL_17:

  return v22;
}

- (BOOL)override_initNonBoolPropertiesWithPlist:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  objc_class *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  NSDictionary *containerConfigMap;
  void *v26;
  void *v27;
  uint64_t v28;
  MCMPOSIXUser *defaultUser;
  MCMError *v30;
  BOOL v31;
  MCMError *v33;
  void *v34;
  void *v35;
  MCMStaticConfiguration *v37;
  void *v38;
  _BYTE v39[128];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("containerConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v38 = v5;

  v9 = (void *)MEMORY[0x1E0C9AA70];
  if (v8)
    v9 = v8;
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = self;
  v12 = -[MCMStaticConfiguration containerConfigClass](self, "containerConfigClass");
  if (!v12)
    v12 = (objc_class *)objc_opt_class();
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v39, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v41;
    v17 = MEMORY[0x1E0C9AA70];
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v41 != v16)
          objc_enumerationMutation(v13);
        v19 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v21 = v20;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v22 = v21;
        else
          v22 = 0;

        if (!v22 || (v23 = (void *)objc_msgSend([v12 alloc], "initWithPreprocessedPlist:name:", v22, v19)) == 0)
          v23 = (void *)objc_msgSend([v12 alloc], "initWithPreprocessedPlist:name:", v17, v19);
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, v19);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v39, 16);
    }
    while (v15);
  }

  v24 = objc_msgSend(v11, "copy");
  containerConfigMap = v37->_containerConfigMap;
  v37->_containerConfigMap = (NSDictionary *)v24;

  NSStringFromSelector(sel_defaultUser);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27
    && (-[MCMStaticConfiguration _posixUserFromPlistValue:](v37, "_posixUserFromPlistValue:", v27),
        v28 = objc_claimAutoreleasedReturnValue(),
        defaultUser = v37->_defaultUser,
        v37->_defaultUser = (MCMPOSIXUser *)v28,
        defaultUser,
        !v37->_defaultUser))
  {
    v33 = [MCMError alloc];
    -[MCMPlistReadOnly sourceFileURL](v37, "sourceFileURL");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "path");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v33, "initWithErrorType:category:path:POSIXerrno:", 149, 5, v35, 100);

    if (a4)
    {
      v30 = objc_retainAutorelease(v30);
      v31 = 0;
      *a4 = v30;
    }
    else
    {
      v31 = 0;
    }
  }
  else
  {
    v30 = 0;
    v31 = 1;
  }

  return v31;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)MCMStaticConfiguration;
  -[MCMPlistReadOnly descriptionOfBoolPropertiesWithIndentString:](&v10, sel_descriptionOfBoolPropertiesWithIndentString_, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_defaultUser);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMStaticConfiguration defaultUser](self, "defaultUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("%@: %@\n"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCMStaticConfiguration descriptionForContainerConfiguration](self, "descriptionForContainerConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)_posixUserFromPlistValue:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    if (objc_msgSend(v6, "isEqualToString:", CFSTR("current")))
    {
      +[MCMPOSIXUser currentPOSIXUser](MCMPOSIXUser, "currentPOSIXUser");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[MCMPOSIXUser posixUserWithName:](MCMPOSIXUser, "posixUserWithName:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)descriptionForContainerConfiguration
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[MCMStaticConfiguration containerConfigMap](self, "containerConfigMap");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    v6 = CFSTR("containerConfiguration: {\n");
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[MCMStaticConfiguration containerConfigMap](self, "containerConfigMap");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR("\t%@: {\n"), v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "debugDescriptionWithIndentString:", CFSTR("\t\t"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByAppendingString:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "stringByAppendingString:", CFSTR("\t}\n"));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
    }
    while (v4);
  }
  else
  {
    v6 = CFSTR("containerConfiguration: {\n");
  }

  -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", CFSTR("}\n"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (Class)containerConfigClass
{
  return self->_containerConfigClass;
}

- (void)setContainerConfigClass:(Class)a3
{
  self->_containerConfigClass = a3;
}

- (BOOL)errorOnPersonaPropagationFailure
{
  return self->_errorOnPersonaPropagationFailure;
}

- (BOOL)attemptMetadataReconstructionIfMissing
{
  return self->_attemptMetadataReconstructionIfMissing;
}

- (MCMPOSIXUser)defaultUser
{
  return self->_defaultUser;
}

- (NSDictionary)containerConfigMap
{
  return self->_containerConfigMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerConfigMap, 0);
  objc_storeStrong((id *)&self->_defaultUser, 0);
  objc_storeStrong((id *)&self->_containerConfigMapByEnum, 0);
}

+ (id)defaultPlistDirectoryURL
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (defaultPlistDirectoryURL_onceToken != -1)
    dispatch_once(&defaultPlistDirectoryURL_onceToken, &__block_literal_global_6313);
  container_log_handle_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)defaultPlistDirectoryURL_defaultURL, "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1CF807000, v2, OS_LOG_TYPE_DEFAULT, "defaultPlistDirectoryURL: [%@]", (uint8_t *)&v5, 0xCu);

  }
  return (id)defaultPlistDirectoryURL_defaultURL;
}

void __50__MCMStaticConfiguration_defaultPlistDirectoryURL__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", "/System/Library/PrivateFrameworks/ContainerManagerCommon.framework", 1, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultPlistDirectoryURL_defaultURL;
  defaultPlistDirectoryURL_defaultURL = v0;

}

@end
