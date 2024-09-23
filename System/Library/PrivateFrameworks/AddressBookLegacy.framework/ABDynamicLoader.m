@implementation ABDynamicLoader

+ (BOOL)loadFrameworkAtPath:(id)a3 andStoreHandle:(void *)a4 bundle:(id *)a5 logging:(BOOL)a6
{
  _BOOL4 v6;
  void **v8;
  void *v10;
  void *v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  const char *v20;
  size_t v21;
  size_t v22;
  char *v23;
  uint64_t v24;
  BOOL v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void **v33;
  _BOOL4 v34;
  void *v35;
  id *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v6 = a6;
  v8 = a4;
  v42 = *MEMORY[0x1E0C80C00];
  v10 = *a4;
  v11 = (void *)objc_msgSend((id)CPSystemRootDirectory(), "stringByAppendingPathComponent:", a3);
  v12 = getenv("DYLD_FRAMEWORK_PATH");
  v13 = (void *)objc_msgSend(v11, "stringByDeletingLastPathComponent");
  if (v12)
  {
    v35 = v10;
    v36 = a5;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v14 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12), "componentsSeparatedByString:", CFSTR(":"));
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v15)
    {
      v16 = v15;
      v33 = v8;
      v34 = v6;
      v17 = *(_QWORD *)v38;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v38 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v19, "lowercaseString"), "containsString:", CFSTR("debug")))
          {
            v12 = (char *)objc_msgSend(v19, "cStringUsingEncoding:", 4);
            goto LABEL_12;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (v16)
          continue;
        break;
      }
LABEL_12:
      v6 = v34;
      v8 = v33;
    }
    v20 = (const char *)objc_msgSend(v11, "fileSystemRepresentation");
    v21 = strlen(v12);
    v22 = v21 + strlen(v20) + 2;
    v23 = (char *)malloc_type_calloc(1uLL, v22, 0x43B19BCEuLL);
    strlcat(v23, v12, v22);
    strlcat(v23, "/", v22);
    strlcat(v23, (const char *)objc_msgSend((id)objc_msgSend(v13, "lastPathComponent"), "fileSystemRepresentation"), v22);
    strlcat(v23, "/", v22);
    strlcat(v23, (const char *)objc_msgSend((id)objc_msgSend(a3, "lastPathComponent"), "fileSystemRepresentation"), v22);
    v24 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12), "stringByAppendingPathComponent:", objc_msgSend(v13, "lastPathComponent"));
    a5 = v36;
    if (v35)
      goto LABEL_14;
  }
  else
  {
    v23 = (char *)objc_msgSend(v11, "fileSystemRepresentation");
    v20 = 0;
    v24 = (uint64_t)v13;
    v13 = 0;
    if (v10)
    {
LABEL_14:
      v25 = 1;
      goto LABEL_25;
    }
  }
  v26 = dlopen(v23, 2);
  *v8 = v26;
  if (v20 && !v26)
  {
    v26 = dlopen(v20, 2);
    *v8 = v26;
  }
  v25 = v26 != 0;
  if (!v26 && v6)
  {
    ABDiagnosticsEnabled();
    if (v20)
      v30 = (uint64_t)v20;
    else
      v30 = (uint64_t)v23;
    _ABLog2(3, (uint64_t)"+[ABDynamicLoader loadFrameworkAtPath:andStoreHandle:bundle:logging:]", 69, 0, (uint64_t)CFSTR("Could not load framework at path: %s"), v27, v28, v29, v30);
    v25 = 0;
  }
LABEL_25:
  if (a5)
  {
    v31 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v24);
    *a5 = v31;
    if (!v31)
    {
      if (v13)
        *a5 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v13);
    }
  }
  if (v23 && v20)
    free(v23);
  return v25;
}

+ (BOOL)loadFrameworkAtPath:(id)a3 andStoreHandle:(void *)a4 bundle:(id *)a5
{
  return objc_msgSend(a1, "loadFrameworkAtPath:andStoreHandle:bundle:logging:", a3, a4, a5, 1);
}

@end
