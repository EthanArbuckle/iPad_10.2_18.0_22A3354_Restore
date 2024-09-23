@implementation MCMPlistReadOnly

- (id)initFromPlistAtPathOrName:(id)a3 defaultPlistDirectoryURL:(id)a4 conformingToProtocol:(id)a5
{
  return -[MCMPlistReadOnly initWithRawPlist:preprocessedPlist:pathOrName:protocol:defaultPlistDirectoryURL:](self, "initWithRawPlist:preprocessedPlist:pathOrName:protocol:defaultPlistDirectoryURL:", 0, 0, a3, a5, a4);
}

- (id)initFromPlist:(id)a3 defaultPlistDirectoryURL:(id)a4 conformingToProtocol:(id)a5
{
  return -[MCMPlistReadOnly initWithRawPlist:preprocessedPlist:pathOrName:protocol:defaultPlistDirectoryURL:](self, "initWithRawPlist:preprocessedPlist:pathOrName:protocol:defaultPlistDirectoryURL:", a3, 0, 0, a5, a4);
}

- (MCMPlistReadOnly)initWithPreprocessedPlist:(id)a3 conformingToProtocol:(id)a4
{
  return -[MCMPlistReadOnly initWithRawPlist:preprocessedPlist:pathOrName:protocol:defaultPlistDirectoryURL:](self, "initWithRawPlist:preprocessedPlist:pathOrName:protocol:defaultPlistDirectoryURL:", 0, a3, 0, a4, 0);
}

- (MCMPlistReadOnly)initWithRawPlist:(id)a3 preprocessedPlist:(id)a4 pathOrName:(id)a5 protocol:(id)a6 defaultPlistDirectoryURL:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  MCMPlistReadOnly *v17;
  uint64_t v18;
  NSCountedSet *numIncludes;
  NSDictionary **p_rawPlist;
  _QWORD *p_pathOrName;
  NSURL **p_defaultPlistDirectoryURL;
  uint64_t v23;
  MCMFileManagerReadsData *fileManager;
  id featureFlagProvider;
  NSDictionary *v26;
  MCMPlistReadOnly *result;
  objc_class *v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  objc_super v33;
  int v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v32 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v33.receiver = self;
  v33.super_class = (Class)MCMPlistReadOnly;
  v17 = -[MCMPlistReadOnly init](&v33, sel_init);
  if (!v17)
    goto LABEL_9;
  v31 = v13;
  v18 = objc_opt_new();
  numIncludes = v17->_numIncludes;
  v17->_numIncludes = (NSCountedSet *)v18;

  p_rawPlist = &v17->_rawPlist;
  objc_storeStrong((id *)&v17->_rawPlist, a3);
  objc_storeStrong((id *)&v17->_preprocessedPlist, a4);
  p_pathOrName = &v17->_pathOrName;
  objc_storeStrong((id *)&v17->_pathOrName, a5);
  objc_storeStrong((id *)&v17->_protocol, a6);
  p_defaultPlistDirectoryURL = &v17->_defaultPlistDirectoryURL;
  objc_storeStrong((id *)&v17->_defaultPlistDirectoryURL, a7);
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v23 = objc_claimAutoreleasedReturnValue();
  fileManager = v17->_fileManager;
  v17->_fileManager = (MCMFileManagerReadsData *)v23;

  featureFlagProvider = v17->_featureFlagProvider;
  v17->_featureFlagProvider = 0;

  v17->_keepArtifacts = 0;
  if ((-[MCMPlistReadOnly conformsToProtocol:](v17, "conformsToProtocol:", v15) & 1) == 0)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v36 = 0u;
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v30 = objc_msgSend(v29, "UTF8String");
    v34 = 136315138;
    v35 = v30;
    _os_log_send_and_compose_impl();

    _os_crash_msg();
    __break(1u);
LABEL_11:
    _os_crash();
    __break(1u);
LABEL_12:
    _os_crash();
    __break(1u);
    goto LABEL_13;
  }
  v26 = *p_rawPlist;
  if (*p_rawPlist && !*p_defaultPlistDirectoryURL)
    goto LABEL_11;
  v13 = v31;
  if (*p_pathOrName && !*p_defaultPlistDirectoryURL)
    goto LABEL_12;
  if (v26 || *p_pathOrName | (uint64_t)v17->_preprocessedPlist)
  {
LABEL_9:

    return v17;
  }
LABEL_13:
  result = (MCMPlistReadOnly *)_os_crash();
  __break(1u);
  return result;
}

- (BOOL)loadWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSURL *v8;
  MCMError *v9;
  NSURL *sourceFileURL;
  NSURL *v11;
  void *v12;
  void *v13;
  NSDictionary *v14;
  id v15;
  NSDictionary *rawPlist;
  NSDictionary *v17;
  Protocol *protocol;
  NSDictionary *v19;
  MCMError *v20;
  NSDictionary *preprocessedPlist;
  NSDictionary *v22;
  NSDictionary *v23;
  Protocol *v24;
  _BOOL4 v25;
  NSDictionary *v26;
  BOOL v27;
  NSObject *v28;
  MCMError *v29;
  BOOL result;
  void *v31;
  MCMError *v32;
  MCMError *v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17D7010](self, a2);
  if (self->_pathOrName)
  {
    -[MCMPlistReadOnly pathOrName](self, "pathOrName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMPlistReadOnly defaultPlistDirectoryURL](self, "defaultPlistDirectoryURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    -[MCMPlistReadOnly _urlByResolvingConfigName:defaultPlistDirectoryURL:error:](self, "_urlByResolvingConfigName:defaultPlistDirectoryURL:error:", v6, v7, &v35);
    v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v9 = (MCMError *)v35;
    sourceFileURL = self->_sourceFileURL;
    self->_sourceFileURL = v8;

    v11 = self->_sourceFileURL;
    if (!v11)
      goto LABEL_20;
    v12 = (void *)MEMORY[0x1E0C99D80];
    -[MCMPlistReadOnly fileManager](self, "fileManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(v12, "MCM_dictionaryWithContentsOfURL:options:fileManager:fsNode:error:", v11, 0, v13, 0, &v34);
    v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v15 = v34;
    rawPlist = self->_rawPlist;
    self->_rawPlist = v14;

    if (!self->_rawPlist)
    {
      container_log_handle_for_category();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        -[NSURL path](self->_sourceFileURL, "path");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v37 = v31;
        v38 = 2112;
        v39 = v15;
        _os_log_error_impl(&dword_1CF807000, v28, OS_LOG_TYPE_ERROR, "Failed to read config file [%@]; error = %@",
          buf,
          0x16u);

      }
      v29 = -[MCMError initWithNSError:url:defaultErrorType:]([MCMError alloc], "initWithNSError:url:defaultErrorType:", v15, self->_sourceFileURL, 149);

      v9 = v29;
      goto LABEL_20;
    }

  }
  else
  {
    v9 = 0;
  }
  v17 = self->_rawPlist;
  if (v17)
  {
    protocol = self->_protocol;
    v33 = v9;
    -[MCMPlistReadOnly _plistByPreprocessingPlist:conformingToProtocol:error:](self, "_plistByPreprocessingPlist:conformingToProtocol:error:", v17, protocol, &v33);
    v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v20 = v33;

    preprocessedPlist = self->_preprocessedPlist;
    self->_preprocessedPlist = v19;

    if (!self->_preprocessedPlist)
    {
      v9 = v20;
      goto LABEL_20;
    }
    if (!self->_keepArtifacts)
    {
      v22 = self->_rawPlist;
      self->_rawPlist = 0;

    }
  }
  else
  {
    v20 = v9;
  }
  v23 = self->_preprocessedPlist;
  if (v23)
  {
    v24 = self->_protocol;
    v32 = v20;
    v25 = -[MCMPlistReadOnly _initPropertiesWithPlist:conformingToProtocol:error:](self, "_initPropertiesWithPlist:conformingToProtocol:error:", v23, v24, &v32);
    v9 = v32;

    if (v25)
    {
      if (!self->_keepArtifacts)
      {
        v26 = self->_preprocessedPlist;
        self->_preprocessedPlist = 0;

      }
      objc_autoreleasePoolPop(v5);
      v27 = 1;
      goto LABEL_23;
    }
LABEL_20:
    objc_autoreleasePoolPop(v5);
    if (a3)
    {
      v9 = objc_retainAutorelease(v9);
      v27 = 0;
      *a3 = v9;
    }
    else
    {
      v27 = 0;
    }
LABEL_23:

    return v27;
  }
  result = _os_crash();
  __break(1u);
  return result;
}

- (id)descriptionOfBoolPropertiesWithIndentString:(id)a3
{
  id v4;
  Protocol *protocol;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4518;
  v16 = __Block_byref_object_dispose__4519;
  v17 = &stru_1E8CB6A50;
  protocol = self->_protocol;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__MCMPlistReadOnly_descriptionOfBoolPropertiesWithIndentString___block_invoke;
  v9[3] = &unk_1E8CB5808;
  v9[4] = self;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  -[MCMPlistReadOnly _forEachBoolPropertyUsingObjCMagicInProtocol:runBlock:](self, "_forEachBoolPropertyUsingObjCMagicInProtocol:runBlock:", protocol, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)override_initNonBoolPropertiesWithPlist:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)_initPropertiesWithPlist:(id)a3 conformingToProtocol:(id)a4 error:(id *)a5
{
  id v8;
  BOOL v9;
  id v10;
  void *v11;
  id v13[2];

  v13[1] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a3;
  -[MCMPlistReadOnly _initBoolPropertiesUsingObjCMagicWithPlist:conformingToProtocol:](self, "_initBoolPropertiesUsingObjCMagicWithPlist:conformingToProtocol:", v8, a4);
  v13[0] = 0;
  v9 = -[MCMPlistReadOnly override_initNonBoolPropertiesWithPlist:error:](self, "override_initNonBoolPropertiesWithPlist:error:", v8, v13);

  v10 = v13[0];
  v11 = v10;
  if (a5 && !v9)
    *a5 = objc_retainAutorelease(v10);

  return v9;
}

- (void)_initBoolPropertiesUsingObjCMagicWithPlist:(id)a3 conformingToProtocol:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__MCMPlistReadOnly__initBoolPropertiesUsingObjCMagicWithPlist_conformingToProtocol___block_invoke;
  v8[3] = &unk_1E8CB5830;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[MCMPlistReadOnly _forEachBoolPropertyUsingObjCMagicInProtocol:runBlock:](self, "_forEachBoolPropertyUsingObjCMagicInProtocol:runBlock:", a4, v8);

}

- (void)_initBoolPropertyWithName:(id)a3 entry:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v6 = a4;
  v7 = a3;
  objc_opt_class();
  v10 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!v10)
    {
      v8 = 0;
      goto LABEL_6;
    }
    v8 = objc_msgSend(v10, "BOOLValue");
  }
  else
  {
    v8 = 0;
  }

LABEL_6:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMPlistReadOnly setValue:forKey:](self, "setValue:forKey:", v9, v7);

}

- (id)_plistByPreprocessingPlist:(id)a3 conformingToProtocol:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v16;
  id v17[2];

  v17[1] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void *)objc_msgSend(a3, "mutableCopy");
  v17[0] = 0;
  -[MCMPlistReadOnly _plistByResolvingFeatureFlagsInMutablePlist:error:](self, "_plistByResolvingFeatureFlagsInMutablePlist:error:", v9, v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17[0];

  if (v10)
  {
    v16 = v11;
    -[MCMPlistReadOnly _plistByResolvingIncludeInMutablePlist:conformingToProtocol:error:](self, "_plistByResolvingIncludeInMutablePlist:conformingToProtocol:error:", v10, v8, &v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v16;

    v11 = v13;
    if (!a5)
      goto LABEL_7;
  }
  else
  {
    v12 = 0;
    if (!a5)
      goto LABEL_7;
  }
  if (!v12)
    *a5 = objc_retainAutorelease(v11);
LABEL_7:
  objc_msgSend(v12, "MCM_deepCopy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_plistByResolvingFeatureFlagsInMutablePlist:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  MCMError *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id (*v20)(_QWORD *, void *, void *);
  void *v21;
  MCMPlistReadOnly *v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MCMPlistReadOnly featureFlagProvider](self, "featureFlagProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__4518;
  v34 = __Block_byref_object_dispose__4519;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v8 = v6;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __70__MCMPlistReadOnly__plistByResolvingFeatureFlagsInMutablePlist_error___block_invoke;
  v21 = &unk_1E8CB5858;
  v24 = &v26;
  v9 = v7;
  v22 = self;
  v23 = v9;
  v25 = &v30;
  objc_msgSend(v8, "MCM_replaceDeepDictionariesWithReplaceHandler:", &v18);
  v10 = v8;
  if (*((_BYTE *)v27 + 24))
  {
    if (v31[5])
      goto LABEL_6;
    container_log_handle_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[NSURL path](self->_sourceFileURL, "path", v18, v19, v20, v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v37 = v17;
      _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, "Config file invalid [%@]", buf, 0xCu);

    }
    v12 = [MCMError alloc];
    -[NSURL path](self->_sourceFileURL, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v12, "initWithErrorType:category:path:POSIXerrno:", 149, 5, v13, 100);
    v15 = (void *)v31[5];
    v31[5] = v14;

    v10 = v8;
    if (*((_BYTE *)v27 + 24))
    {
LABEL_6:
      if (a4)
        *a4 = objc_retainAutorelease((id)v31[5]);

      v10 = 0;
    }
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v10;
}

- (id)_plistByResolvingIncludeInMutablePlist:(id)a3 conformingToProtocol:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  MCMError *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  MCMError *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  id *v25;
  NSObject *p_super;
  NSObject *v27;
  NSObject *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id *v34;
  id v35;
  void *v36;
  MCMError *v37;
  id v38;
  MCMError *v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  MCMError *v45;
  uint64_t v46;

  v34 = a5;
  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v35 = a4;
  v8 = v7;
  v9 = 0;
  v10 = 0;
  v36 = v8;
  while (1)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("#Include"), v34);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v12 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    if (!v13)
    {
      v25 = v34;
      goto LABEL_25;
    }
    objc_msgSend(v8, "removeObjectForKey:", CFSTR("#Include"));
    -[MCMPlistReadOnly defaultPlistDirectoryURL](self, "defaultPlistDirectoryURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v10;
    -[MCMPlistReadOnly _urlByResolvingConfigName:defaultPlistDirectoryURL:error:](self, "_urlByResolvingConfigName:defaultPlistDirectoryURL:error:", v13, v14, &v39);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v39;

    if (!v15)
    {
      container_log_handle_for_category();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        -[MCMPlistReadOnly defaultPlistDirectoryURL](self, "defaultPlistDirectoryURL");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "path");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v41 = v13;
        v42 = 2112;
        v43 = (uint64_t)v31;
        v44 = 2112;
        v45 = v16;
        _os_log_error_impl(&dword_1CF807000, p_super, OS_LOG_TYPE_ERROR, "Could not resolve config file name [%@] using default directory [%@]; error = %@",
          buf,
          0x20u);

      }
      v15 = 0;
      goto LABEL_18;
    }
    -[MCMPlistReadOnly numIncludes](self, "numIncludes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v15);

    -[MCMPlistReadOnly numIncludes](self, "numIncludes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countForObject:", v15);

    if (v19 >= 0x1F)
    {
      container_log_handle_for_category();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        -[NSObject path](v15, "path");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v41 = v32;
        v42 = 2048;
        v43 = 30;
        _os_log_error_impl(&dword_1CF807000, v27, OS_LOG_TYPE_ERROR, "[%@] exceeded maximum inclusions (%lu), possible recursion", buf, 0x16u);

      }
      p_super = &v16->super;
      v16 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 150);
LABEL_18:
      v25 = v34;
      goto LABEL_24;
    }
    v20 = (void *)MEMORY[0x1E0C99D80];
    -[MCMPlistReadOnly fileManager](self, "fileManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    objc_msgSend(v20, "MCM_dictionaryWithContentsOfURL:options:fileManager:fsNode:error:", v15, 0, v21, 0, &v38);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v38;

    if (!v22)
    {
      container_log_handle_for_category();
      v28 = objc_claimAutoreleasedReturnValue();
      v25 = v34;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        -[NSObject path](v15, "path");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v41 = v33;
        v42 = 2112;
        v43 = (uint64_t)v23;
        _os_log_error_impl(&dword_1CF807000, v28, OS_LOG_TYPE_ERROR, "Could not read config file [%@]; error = %@",
          buf,
          0x16u);

      }
      v10 = -[MCMError initWithNSError:url:defaultErrorType:]([MCMError alloc], "initWithNSError:url:defaultErrorType:", v23, v15, 149);

      v22 = 0;
      goto LABEL_23;
    }
    objc_msgSend(v8, "MCM_overlayDictionary:existingValuesTakePrecedent:", v22, 1);
    v37 = v16;
    -[MCMPlistReadOnly _plistByResolvingFeatureFlagsInMutablePlist:error:](self, "_plistByResolvingFeatureFlagsInMutablePlist:error:", v8, &v37);
    v24 = objc_claimAutoreleasedReturnValue();
    v10 = v37;

    if (!v24)
      break;

    v9 = v13;
    v8 = (id)v24;
  }
  v8 = 0;
  v25 = v34;
LABEL_23:

  p_super = v15;
  v15 = v23;
  v16 = v10;
LABEL_24:

  v10 = v16;
LABEL_25:
  if (v10)
  {

    v8 = 0;
  }
  if (v25 && !v8)
    *v25 = objc_retainAutorelease(v10);

  return v8;
}

- (id)_urlByResolvingConfigName:(id)a3 defaultPlistDirectoryURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  MCMError *v15;
  MCMError *v16;
  id v18[2];

  v18[1] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "hasPrefix:", CFSTR("/")))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v8, "hasPrefix:", CFSTR("./")))
    {
      -[NSURL URLByDeletingLastPathComponent](self->_sourceFileURL, "URLByDeletingLastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", v8, 0);
    }
    else
    {
      objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", v8, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URLByAppendingPathExtension:", CFSTR("plist"));
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[MCMPlistReadOnly fileManager](self, "fileManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = 0;
  objc_msgSend(v12, "realPathForURL:isDirectory:error:", v10, 0, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v18[0];

  v15 = 0;
  if (!v13)
  {
    v16 = -[MCMError initWithNSError:url:defaultErrorType:]([MCMError alloc], "initWithNSError:url:defaultErrorType:", v14, v10, 149);
    v15 = v16;
    if (a5)
    {
      v15 = objc_retainAutorelease(v16);
      *a5 = v15;
    }
  }

  return v13;
}

- (void)_forEachBoolPropertyUsingObjCMagicInProtocol:(id)a3 runBlock:(id)a4
{
  void (**v6)(id, void *);
  objc_property_t *v7;
  unint64_t i;
  objc_property *v9;
  const char *Name;
  const char *Attributes;
  void *v12;
  unsigned int outCount;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  outCount = 0;
  v7 = protocol_copyPropertyList2((Protocol *)a3, &outCount, 1, 1);
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      v9 = v7[i];
      Name = property_getName(v9);
      Attributes = property_getAttributes(v9);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Name);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[MCMPlistReadOnly _isNonatomicReadonlyBoolPropertyTypeWithAttributes:](self, "_isNonatomicReadonlyBoolPropertyTypeWithAttributes:", Attributes))
      {
        v6[2](v6, v12);
      }

    }
  }
  free(v7);

}

- (BOOL)_isNonatomicReadonlyBoolPropertyTypeWithAttributes:(const char *)a3
{
  char *v4;
  size_t v5;

  if (_isNonatomicReadonlyBoolPropertyTypeWithAttributes__onceToken != -1)
    dispatch_once(&_isNonatomicReadonlyBoolPropertyTypeWithAttributes__onceToken, &__block_literal_global_4499);
  if (!strncmp(_isNonatomicReadonlyBoolPropertyTypeWithAttributes__BOOLType, a3, _isNonatomicReadonlyBoolPropertyTypeWithAttributes__BOOLTypeLen))
  {
    v5 = strnlen(a3, 0x64uLL);
    v4 = strnstr(a3, ",N", v5);
    if (v4)
      LOBYTE(v4) = strnstr(a3, ",R", v5) != 0;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (NSCountedSet)numIncludes
{
  return self->_numIncludes;
}

- (void)setNumIncludes:(id)a3
{
  objc_storeStrong((id *)&self->_numIncludes, a3);
}

- (NSURL)defaultPlistDirectoryURL
{
  return self->_defaultPlistDirectoryURL;
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (NSString)pathOrName
{
  return self->_pathOrName;
}

- (NSDictionary)rawPlist
{
  return self->_rawPlist;
}

- (NSDictionary)preprocessedPlist
{
  return self->_preprocessedPlist;
}

- (NSURL)sourceFileURL
{
  return self->_sourceFileURL;
}

- (MCMFileManagerReadsData)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_fileManager, a3);
}

- (id)featureFlagProvider
{
  return self->_featureFlagProvider;
}

- (void)setFeatureFlagProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)keepArtifacts
{
  return self->_keepArtifacts;
}

- (void)setKeepArtifacts:(BOOL)a3
{
  self->_keepArtifacts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_featureFlagProvider, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_sourceFileURL, 0);
  objc_storeStrong((id *)&self->_preprocessedPlist, 0);
  objc_storeStrong((id *)&self->_rawPlist, 0);
  objc_storeStrong((id *)&self->_pathOrName, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_defaultPlistDirectoryURL, 0);
  objc_storeStrong((id *)&self->_numIncludes, 0);
}

size_t __71__MCMPlistReadOnly__isNonatomicReadonlyBoolPropertyTypeWithAttributes___block_invoke()
{
  size_t result;

  snprintf(_isNonatomicReadonlyBoolPropertyTypeWithAttributes__BOOLType, 0x64uLL, "T%s", "B");
  result = strnlen(_isNonatomicReadonlyBoolPropertyTypeWithAttributes__BOOLType, 0x64uLL);
  _isNonatomicReadonlyBoolPropertyTypeWithAttributes__BOOLTypeLen = result;
  return result;
}

id __70__MCMPlistReadOnly__plistByResolvingFeatureFlagsInMutablePlist_error___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  const __CFString *v5;
  id v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  NSObject *v30;
  int v31;
  char v32;
  id v33;
  id v34;
  objc_class *v35;
  __CFString *v36;
  uint64_t v37;
  __CFString *v38;
  void *v39;
  id obj;
  uint8_t buf[4];
  const __CFString *v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  const __CFString *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = CFSTR("#IfFeatureFlagEnabled");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("#IfFeatureFlagEnabled"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("#IfFeatureFlagDisabled");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("#IfFeatureFlagDisabled"));
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("#Then"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("#Else"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (__CFString *)v5;
  if (v9 | v11)
  {
    if (v9 && v11)
    {
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
      container_log_handle_for_category();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v42 = CFSTR("#IfFeatureFlagEnabled");
        v43 = 2112;
        v44 = CFSTR("#IfFeatureFlagDisabled");
        v45 = 2112;
        v46 = v5;
        v14 = "Invalid plist; both [%@] and [%@] specified but only one should be at [%@]";
        v15 = v13;
        v16 = 32;
LABEL_38:
        _os_log_error_impl(&dword_1CF807000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
      }
    }
    else
    {
      if (v12)
      {
        if (v9)
          v19 = (void *)v9;
        else
          v19 = (void *)v11;
        v18 = v19;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v17 = v18;
          objc_msgSend(v17, "componentsSeparatedByString:", CFSTR("/"));
          v13 = objc_claimAutoreleasedReturnValue();
          if (-[NSObject count](v13, "count") == 2)
          {
            v20 = a1[5];
            -[NSObject objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", 0);
            v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            if (v20)
            {
              v37 = objc_msgSend(v21, "UTF8String");
              -[NSObject objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", 1);
              v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v23 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v20, v37, objc_msgSend(v22, "UTF8String"));
            }
            else
            {
              objc_msgSend(v21, "UTF8String");
              -[NSObject objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", 1);
              v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              objc_msgSend(v22, "UTF8String");
              v23 = _os_feature_enabled_impl();
            }
            v31 = v23;

            if (v9 && v31 || (!v11 ? (v32 = 1) : (v32 = v31), (v32 & 1) == 0))
              v33 = v12;
            else
              v33 = v39;
            v34 = v33;

            v18 = v17;
            v7 = v34;
          }
          else
          {
            *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
            container_log_handle_for_category();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              if (!v9)
                v8 = CFSTR("#IfFeatureFlagDisabled");
              *(_DWORD *)buf = 138412802;
              v42 = v8;
              v43 = 2048;
              v44 = (const __CFString *)-[NSObject count](v13, "count");
              v45 = 2112;
              v46 = v38;
              _os_log_error_impl(&dword_1CF807000, v30, OS_LOG_TYPE_ERROR, "Invalid plist; value of [%@] should be a feature flag string with two components but has %lu components at [%@]",
                buf,
                0x20u);
            }

            v18 = v17;
          }
        }
        else
        {
          *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
          container_log_handle_for_category();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            if (v9)
              v10 = CFSTR("#IfFeatureFlagEnabled");
            v35 = (objc_class *)objc_opt_class();
            NSStringFromClass(v35);
            v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v42 = v10;
            v43 = 2112;
            v44 = v36;
            v45 = 2112;
            v46 = v38;
            _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, "Invalid plist; value of [%@] should be an string but is a [%@] at [%@]",
              buf,
              0x20u);

          }
          v17 = 0;
        }
        goto LABEL_17;
      }
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
      container_log_handle_for_category();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v42 = CFSTR("#Then");
        v43 = 2112;
        v44 = v5;
        v14 = "Invalid plist; no [%@] specified at [%@]";
        v15 = v13;
        v16 = 22;
        goto LABEL_38;
      }
    }
    v17 = 0;
    v18 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v17 = 0;
  v18 = 0;
LABEL_18:
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = (void *)a1[4];
      objc_msgSend(v24, "protocol");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(a1[7] + 8);
      obj = *(id *)(v26 + 40);
      objc_msgSend(v24, "_plistByResolvingIncludeInMutablePlist:conformingToProtocol:error:", v7, v25, &obj);
      v27 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v26 + 40), obj);

      v7 = (void *)v27;
      if (!v27)
        *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    }
  }
  v28 = v7;

  return v28;
}

void __84__MCMPlistReadOnly__initBoolPropertiesUsingObjCMagicWithPlist_conformingToProtocol___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_initBoolPropertyWithName:entry:", v4);

}

void __64__MCMPlistReadOnly_descriptionOfBoolPropertiesWithIndentString___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  v8 = &stru_1E8CB6A50;
  if (a1[5])
    v8 = (const __CFString *)a1[5];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "stringByAppendingFormat:", CFSTR("%@%@: %@\n"), v8, v4, v7);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = *(_QWORD *)(a1[6] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

@end
