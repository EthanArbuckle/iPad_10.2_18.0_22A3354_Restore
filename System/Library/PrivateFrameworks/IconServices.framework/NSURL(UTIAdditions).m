@implementation NSURL(UTIAdditions)

- (BOOL)__is__getResourceValue:()UTIAdditions forKey:error:
{
  __CFString *v8;
  void *v9;
  int v10;
  int v11;
  _BOOL8 v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  NSObject *v30;
  id propertyValueTypeRefPtr;
  _BYTE error[12];
  __int16 v33;
  void *v34;
  __int16 v35;
  __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  +[ISDefaults sharedInstance](ISDefaults, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "logMissingURLCacheProperties");

  if (!v10)
  {
    propertyValueTypeRefPtr = 0;
    *(_QWORD *)error = 0;
    goto LABEL_5;
  }
  propertyValueTypeRefPtr = 0;
  if (_CFURLCopyResourcePropertyForKeyFromCache())
  {
    *a3 = propertyValueTypeRefPtr;
LABEL_11:
    v12 = 1;
    goto LABEL_12;
  }
  +[ISURLResourcePropertySpecification sharedInstance](ISURLResourcePropertySpecification, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allowedMissingProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsObject:", v8);

  if ((v16 & 1) != 0)
    goto LABEL_11;
  if (-[__CFURL isFileReferenceURL](a1, "isFileReferenceURL"))
  {
    v30 = 0;
    CFURLCopyResourcePropertyForKey(a1, (CFStringRef)*MEMORY[0x1E0C99AA8], &v30, 0);
    v18 = v30;
    if (!v30)
    {
      -[__CFURL path](a1, "path");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    _ISURLCacheLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_signpost_id_make_with_pointer(v19, a1);

    if (v20)
    {
      _ISURLCacheLog();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_signpost_enabled(v21);

      if (v22)
      {
        _ISURLCacheLog();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v20 != -1 && os_signpost_enabled(v23))
        {
          *(_DWORD *)error = 138412802;
          *(_QWORD *)&error[4] = a1;
          v33 = 2112;
          v34 = v18;
          v35 = 2112;
          v36 = v8;
          _os_signpost_emit_with_name_impl(&dword_1AA928000, v24, OS_SIGNPOST_EVENT, v20, "cache miss", "URL %@ path %@ was missing expected cached values for key: %@", error, 0x20u);
        }

      }
    }
  }
  else
  {
    _ISURLCacheLog();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_signpost_id_make_with_pointer(v25, a1);

    if (!v26)
      goto LABEL_28;
    _ISURLCacheLog();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_signpost_enabled(v27);

    if (!v28)
      goto LABEL_28;
    _ISURLCacheLog();
    v29 = objc_claimAutoreleasedReturnValue();
    v18 = v29;
    if (v26 != -1 && os_signpost_enabled(v29))
    {
      *(_DWORD *)error = 138412546;
      *(_QWORD *)&error[4] = a1;
      v33 = 2112;
      v34 = v8;
      _os_signpost_emit_with_name_impl(&dword_1AA928000, v18, OS_SIGNPOST_EVENT, v26, "cache miss", "URL %@ was missing expected cached values for key: %@", error, 0x16u);
    }
  }

LABEL_28:
  *(_QWORD *)error = 0;
LABEL_5:
  v11 = CFURLCopyResourcePropertyForKey(a1, v8, &propertyValueTypeRefPtr, (CFErrorRef *)error);
  v12 = v11 != 0;
  if (v11)
  {
    v13 = propertyValueTypeRefPtr;
    a5 = a3;
LABEL_9:
    *a5 = v13;
    goto LABEL_12;
  }
  if (a5)
  {
    v13 = *(id *)error;
    if (*(_QWORD *)error)
      goto LABEL_9;
  }
LABEL_12:

  return v12;
}

- (CFDictionaryRef)__is_resourceValuesForKeys:()UTIAdditions error:
{
  const __CFArray *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  CFDictionaryRef v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  NSObject *v29;
  id v31;
  CFErrorRef error;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  NSObject *v36;
  __int16 v37;
  NSObject *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  error = 0;
  +[ISDefaults sharedInstance](ISDefaults, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "logMissingURLCacheProperties");

  if (v8)
  {
    v9 = (void *)_CFURLCopyResourcePropertiesForKeysFromCache();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v11 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v9, "allKeys");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithArray:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if ((-[NSObject isEqual:](v10, "isEqual:", v13) & 1) != 0)
        goto LABEL_23;
      -[NSObject minusSet:](v10, "minusSet:", v13);
    }
    else
    {
      v13 = 0;
    }
    +[ISURLResourcePropertySpecification sharedInstance](ISURLResourcePropertySpecification, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allowedMissingProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject minusSet:](v10, "minusSet:", v16);

    if (-[NSObject count](v10, "count"))
    {
      if (objc_msgSend(a1, "isFileReferenceURL"))
      {
        v31 = 0;
        objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &v31, *MEMORY[0x1E0C99AA8], 0);
        v17 = v31;
        if (!v17)
        {
          objc_msgSend(a1, "path");
          v17 = objc_claimAutoreleasedReturnValue();
        }
        _ISURLCacheLog();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = os_signpost_id_make_with_pointer(v18, a1);

        if (v19)
        {
          _ISURLCacheLog();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = os_signpost_enabled(v20);

          if (v21)
          {
            _ISURLCacheLog();
            v22 = objc_claimAutoreleasedReturnValue();
            v23 = v22;
            if (v19 != -1 && os_signpost_enabled(v22))
            {
              *(_DWORD *)buf = 138412802;
              v34 = a1;
              v35 = 2112;
              v36 = v17;
              v37 = 2112;
              v38 = v10;
              _os_signpost_emit_with_name_impl(&dword_1AA928000, v23, OS_SIGNPOST_EVENT, v19, "cache miss", "URL %@ path %@ was missing expected cached values for keys: %@", buf, 0x20u);
            }

          }
        }
      }
      else
      {
        _ISURLCacheLog();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = os_signpost_id_make_with_pointer(v24, a1);

        if (!v25)
          goto LABEL_23;
        _ISURLCacheLog();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = os_signpost_enabled(v26);

        if (!v27)
          goto LABEL_23;
        _ISURLCacheLog();
        v28 = objc_claimAutoreleasedReturnValue();
        v17 = v28;
        if (v25 != -1 && os_signpost_enabled(v28))
        {
          *(_DWORD *)buf = 138412546;
          v34 = a1;
          v35 = 2112;
          v36 = v10;
          _os_signpost_emit_with_name_impl(&dword_1AA928000, v17, OS_SIGNPOST_EVENT, v25, "cache miss", "URL %@ was missing expected cached values for keys: %@", buf, 0x16u);
        }
      }

    }
LABEL_23:
    v14 = CFURLCopyResourcePropertiesForKeys((CFURLRef)a1, v6, &error);

    goto LABEL_24;
  }
  v14 = CFURLCopyResourcePropertiesForKeys((CFURLRef)a1, v6, &error);
LABEL_24:
  if (a4 && error)
  {
    *a4 = error;
  }
  else if (error)
  {
    _ISDefaultLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      -[NSURL(UTIAdditions) __is_resourceValuesForKeys:error:].cold.1((uint64_t)v6, (uint64_t *)&error, v29);

    CFRelease(error);
  }

  return v14;
}

- (BOOL)__is__conformsToUTI:()UTIAdditions
{
  __CFString *v4;
  _BOOL8 v5;
  CFStringRef inUTI;

  v4 = a3;
  inUTI = 0;
  objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &inUTI, *MEMORY[0x1E0C99AD0], 0);
  if (inUTI)
    v5 = UTTypeConformsTo(inUTI, v4) != 0;
  else
    v5 = 0;

  return v5;
}

- (uint64_t)__is__isDirectory
{
  int v1;
  id v2;
  uint64_t v3;
  id v5;

  v5 = 0;
  v1 = objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &v5, *MEMORY[0x1E0C999D0], 0);
  v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v2 = 0;
  }
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)__is__isPackage
{
  int v1;
  id v2;
  uint64_t v3;
  id v5;

  v5 = 0;
  v1 = objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &v5, *MEMORY[0x1E0C99A00], 0);
  v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v2 = 0;
  }
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)__is__isVolume
{
  int v1;
  id v2;
  uint64_t v3;
  id v5;

  v5 = 0;
  v1 = objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &v5, *MEMORY[0x1E0C99A48], 0);
  v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v2 = 0;
  }
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)__is__isAliasFile
{
  int v2;
  id v3;
  uint64_t v4;
  id v6;

  v6 = 0;
  v2 = objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &v6, *MEMORY[0x1E0C999B8], 0);
  v3 = v6;
  if (!v2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v3 = 0;
  }
  if (objc_msgSend(v3, "BOOLValue"))
    v4 = objc_msgSend(a1, "__is__isSymLink") ^ 1;
  else
    v4 = 0;

  return v4;
}

- (uint64_t)__is__isSymLink
{
  int v1;
  id v2;
  uint64_t v3;
  id v5;

  v5 = 0;
  v1 = objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &v5, *MEMORY[0x1E0C99A28], 0);
  v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v2 = 0;
  }
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)__is_volumeURL
{
  int v1;
  id v2;
  id v4;

  v4 = 0;
  v1 = objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &v4, *MEMORY[0x1E0C99D08], 0);
  v2 = v4;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v2 = 0;
  }
  return v2;
}

- (uint64_t)__has_ResourceFork
{
  int v1;
  id v2;
  uint64_t v3;
  id v5;

  v5 = 0;
  v1 = objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &v5, *MEMORY[0x1E0C9AC58], 0);
  v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v2 = 0;
  }
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)__is_isBootVolume
{
  int v1;
  id v2;
  uint64_t v3;
  id v5;

  v5 = 0;
  v1 = objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &v5, *MEMORY[0x1E0C99C18], 0);
  v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v2 = 0;
  }
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)__is_isOnBootVolume
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "__is_volumeURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "__is_isBootVolume");

  return v2;
}

- (BOOL)__is_hasFileExtension:()UTIAdditions
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "caseInsensitiveCompare:", v4);

  return v6 == 0;
}

- (uint64_t)__is_isApplication
{
  int v1;
  id v2;
  uint64_t v3;
  id v5;

  v5 = 0;
  v1 = objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &v5, *MEMORY[0x1E0C999C0], 0);
  v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v2 = 0;
  }
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)__is_isAppExtension
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "pathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("appex")))
    v3 = objc_msgSend(a1, "__is__isDirectory");
  else
    v3 = 0;

  return v3;
}

- (uint64_t)__is_isBundleWithUnregisteredPersonality
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99E98], "_is_unregisteredPersonlityFileExtensions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = objc_msgSend(a1, "__is__isDirectory");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)__is_fileExists
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  return v4;
}

- (uint64_t)__is_accessFlags
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C99A50];
  v10[0] = *MEMORY[0x1E0C99A10];
  v2 = v10[0];
  v10[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "__is_resourceValuesForKeys:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v2) = objc_msgSend(v5, "_IF_BOOLForKey:", v2);
  v6 = objc_msgSend(v5, "_IF_BOOLForKey:", v3);
  if ((_DWORD)v2)
    v7 = 4;
  else
    v7 = 0;
  if (v6)
    v8 = 2;
  else
    v8 = 0;

  return v8 | v7;
}

- (uint64_t)__is_locked
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C99A40];
  v7[0] = *MEMORY[0x1E0C99A30];
  v2 = v7[0];
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "__is_resourceValuesForKeys:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(a1) = objc_msgSend(v5, "_IF_BOOLForKey:", v2);
  LODWORD(v2) = objc_msgSend(v5, "_IF_BOOLForKey:", v3);

  return a1 | v2;
}

+ (id)__is_coreTypesURL
{
  if (__is_coreTypesURL_onceToken != -1)
    dispatch_once(&__is_coreTypesURL_onceToken, &__block_literal_global_9);
  return (id)__is_coreTypesURL_coreTypesURL;
}

- (id)__is_typeIdentifier
{
  int v1;
  id v2;
  id v3;
  id v5;

  v5 = 0;
  v1 = objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &v5, *MEMORY[0x1E0C99AD0], 0);
  v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v3 = (id)*MEMORY[0x1E0CA5B20];

    v2 = v3;
  }
  return v2;
}

- (void)__is_resourceValuesForKeys:()UTIAdditions error:.cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_1AA928000, log, OS_LOG_TYPE_DEBUG, "Error getting resource properties: %@ error: %@", (uint8_t *)&v4, 0x16u);
}

@end
