@implementation NSURL(IconFoundationAdditions)

- (id)_IF_extendedAttributeForName:()IconFoundationAdditions
{
  id v4;
  id v5;
  const char *v6;
  id v7;
  const char *v8;
  const char *v9;
  ssize_t v10;
  size_t v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v4 = a3;
  v5 = objc_retainAutorelease(a1);
  v6 = (const char *)objc_msgSend(v5, "fileSystemRepresentation");
  v7 = objc_retainAutorelease(v4);
  v8 = (const char *)objc_msgSend(v7, "fileSystemRepresentation");
  if (!v6 || (v9 = v8) == 0)
  {
    IFDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[NSURL(IconFoundationAdditions) _IF_extendedAttributeForName:].cold.1((uint64_t)v5, (uint64_t)v7, v14);

    goto LABEL_9;
  }
  v10 = getxattr(v6, v8, 0, 0, 0, 0);
  if (v10 < 1)
  {
LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  v11 = v10;
  v12 = malloc_type_malloc(v10, 0x3050905EuLL);
  if (getxattr(v6, v9, v12, v11, 0, 0) != v11)
    -[NSURL(IconFoundationAdditions) _IF_extendedAttributeForName:].cold.2();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v12, v11, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v13;
}

- (uint64_t)_IF_setExtendedAttribute:()IconFoundationAdditions forName:error:
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  id v12;
  const char *v13;
  const char *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_retainAutorelease(a1);
  v11 = (const char *)objc_msgSend(v10, "fileSystemRepresentation");
  v12 = objc_retainAutorelease(v9);
  v13 = (const char *)objc_msgSend(v12, "fileSystemRepresentation");
  if (v11)
  {
    v14 = v13;
    if (v13)
    {
      if (v8)
      {
        v15 = objc_retainAutorelease(v8);
        if (setxattr(v11, v14, (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), 0, 0))
        {
LABEL_5:
          v16 = (void *)MEMORY[0x1E0CB35C8];
          v17 = *MEMORY[0x1E0CB2FE0];
          v18 = *__error();
          v19 = *MEMORY[0x1E0CB2938];
          v33 = *MEMORY[0x1E0CB2938];
          v20 = (void *)MEMORY[0x1E0CB3940];
          v21 = __error();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("Failed to set xattr %@ with name %@ error %s"), v8, v12, strerror(*v21), v33);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v22;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v16;
          v25 = v17;
          v26 = v18;
          goto LABEL_7;
        }
      }
      else if (removexattr(v11, v13, 0))
      {
        goto LABEL_5;
      }
      v29 = 0;
      goto LABEL_15;
    }
  }
  v27 = (void *)MEMORY[0x1E0CB35C8];
  v28 = *MEMORY[0x1E0CB2F90];
  v19 = *MEMORY[0x1E0CB2938];
  v35 = *MEMORY[0x1E0CB2938];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("XAttr set on invalid URL %@ or with invalid name %@"), v10, v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v27;
  v25 = v28;
  v26 = -43;
LABEL_7:
  objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, v26, v23);
  v29 = (id)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
LABEL_15:
    v31 = 1;
    goto LABEL_16;
  }
  IFDefaultLog();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    -[NSURL(IconFoundationAdditions) _IF_setExtendedAttribute:forName:error:].cold.1(v29, v19, v30);

  if (a5)
  {
    v29 = objc_retainAutorelease(v29);
    v31 = 0;
    *a5 = v29;
  }
  else
  {
    v31 = 0;
  }
LABEL_16:

  return v31;
}

- (id)_IF_contentModifiedDate
{
  int v1;
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v13;

  v13 = 0;
  v1 = objc_msgSend(a1, "_IF_getResourceValue:forKey:error:", &v13, *MEMORY[0x1E0C998D8], 0);
  v2 = v13;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    IFDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[NSURL(IconFoundationAdditions) _IF_contentModifiedDate].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v11 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v11;
  }
  return v2;
}

- (BOOL)_IF_getResourceValue:()IconFoundationAdditions forKey:error:
{
  int v7;
  id v9;
  CFErrorRef error;

  v9 = 0;
  error = 0;
  v7 = CFURLCopyResourcePropertyForKey(a1, key, &v9, &error);
  if (v7)
  {
    *a3 = v9;
  }
  else if (a5 && error)
  {
    *a5 = error;
  }
  else if (error)
  {
    CFRelease(error);
  }
  return v7 != 0;
}

- (id)_IF_attributeModifiedDate
{
  int v1;
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v13;

  v13 = 0;
  v1 = objc_msgSend(a1, "_IF_getResourceValue:forKey:error:", &v13, *MEMORY[0x1E0C998C0], 0);
  v2 = v13;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    IFDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[NSURL(IconFoundationAdditions) _IF_contentModifiedDate].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v11 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v11;
  }
  return v2;
}

- (id)_IF_modifiedDate
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "_IF_attributeModifiedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_IF_contentModifiedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "compare:", v2) == -1)
    v4 = v2;
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

- (uint64_t)_IF_fileSize
{
  int v1;
  id v2;
  uint64_t v3;
  id v5;

  v5 = 0;
  v1 = objc_msgSend(a1, "_IF_getResourceValue:forKey:error:", &v5, *MEMORY[0x1E0C99998], 0);
  v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v2 = 0;
  }
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (uint64_t)_IF_isVolume
{
  int v1;
  id v2;
  uint64_t v3;
  id v5;

  v5 = 0;
  v1 = objc_msgSend(a1, "_IF_getResourceValue:forKey:error:", &v5, *MEMORY[0x1E0C99A48], 0);
  v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v2 = 0;
  }
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)_IF_volumeURL
{
  int v1;
  id v2;
  id v4;

  v4 = 0;
  v1 = objc_msgSend(a1, "_IF_getResourceValue:forKey:error:", &v4, *MEMORY[0x1E0C99D08], 0);
  v2 = v4;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v2 = 0;
  }
  return v2;
}

- (uint64_t)_IF_isBootVolume
{
  int v1;
  id v2;
  uint64_t v3;
  id v5;

  v5 = 0;
  v1 = objc_msgSend(a1, "_IF_getResourceValue:forKey:error:", &v5, *MEMORY[0x1E0C99C18], 0);
  v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v2 = 0;
  }
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)_IF_isOnBootVolume
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_IF_volumeURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "_IF_isBootVolume");

  return v2;
}

- (uint64_t)_IF_isSymLink
{
  int v1;
  id v2;
  uint64_t v3;
  id v5;

  v5 = 0;
  v1 = objc_msgSend(a1, "_IF_getResourceValue:forKey:error:", &v5, *MEMORY[0x1E0C99A28], 0);
  v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v2 = 0;
  }
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)_IF_isAliasFile
{
  int v2;
  id v3;
  uint64_t v4;
  id v6;

  v6 = 0;
  v2 = objc_msgSend(a1, "_IF_getResourceValue:forKey:error:", &v6, *MEMORY[0x1E0C999B8], 0);
  v3 = v6;
  if (!v2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v3 = 0;
  }
  if (objc_msgSend(v3, "BOOLValue"))
    v4 = objc_msgSend(a1, "_IF_isSymLink") ^ 1;
  else
    v4 = 0;

  return v4;
}

- (id)_IF_typeIdentifier
{
  int v1;
  id v2;
  id v3;
  id v5;

  v5 = 0;
  v1 = objc_msgSend(a1, "_IF_getResourceValue:forKey:error:", &v5, *MEMORY[0x1E0C99AD0], 0);
  v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v3 = (id)*MEMORY[0x1E0CA5B20];

    v2 = v3;
  }
  return v2;
}

- (BOOL)_IF_conformsToUTI:()IconFoundationAdditions
{
  __CFString *v4;
  _BOOL8 v5;
  CFStringRef inUTI;

  v4 = a3;
  inUTI = 0;
  objc_msgSend(a1, "_IF_getResourceValue:forKey:error:", &inUTI, *MEMORY[0x1E0C99AD0], 0);
  if (inUTI)
    v5 = UTTypeConformsTo(inUTI, v4) != 0;
  else
    v5 = 0;

  return v5;
}

- (uint64_t)_IF_isDirectory
{
  int v1;
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v13;

  v13 = 0;
  v1 = objc_msgSend(a1, "_IF_getResourceValue:forKey:error:", &v13, *MEMORY[0x1E0C999D0], 0);
  v2 = v13;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    IFDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[NSURL(IconFoundationAdditions) _IF_contentModifiedDate].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

    v2 = 0;
  }
  v11 = objc_msgSend(v2, "BOOLValue");

  return v11;
}

- (void)_IF_extendedAttributeForName:()IconFoundationAdditions .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1D4106000, log, OS_LOG_TYPE_ERROR, "XAttr set on invalid URL %@ or with invalid name %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_4();
}

- (void)_IF_extendedAttributeForName:()IconFoundationAdditions .cold.2()
{
  __assert_rtn("-[NSURL(IconFoundationAdditions) _IF_extendedAttributeForName:]", "NSURL+IconFoundationAdditions.m", 32, "getxattr(cPath, cName, buffer, length, 0, 0) == length");
}

- (void)_IF_setExtendedAttribute:()IconFoundationAdditions forName:error:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412290;
  v8 = v6;
  _os_log_error_impl(&dword_1D4106000, a3, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v7, 0xCu);

}

- (void)_IF_contentModifiedDate
{
  OUTLINED_FUNCTION_0_1(&dword_1D4106000, a1, a3, "Could not get requested properties and flags with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

@end
