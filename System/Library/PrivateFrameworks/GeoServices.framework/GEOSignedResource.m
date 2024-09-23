@implementation GEOSignedResource

+ (unint64_t)typeForResourceByFileName:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", CFSTR("cms"))
    && (objc_msgSend(v3, "lastPathComponent"),
        v5 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend((id)v5, "stringByDeletingPathExtension"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        (id)v5,
        LOBYTE(v5) = objc_msgSend(v6, "hasPrefix:", CFSTR("placecard")),
        v6,
        (v5 & 1) != 0))
  {
    v7 = 3;
  }
  else
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("-"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count") == 2
      && (objc_msgSend(v8, "firstObject"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("cms")),
          v9,
          v10))
    {
      objc_msgSend(v8, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isEqualToString:", CFSTR("lpr")) & 1) != 0)
      {
        v7 = 1;
      }
      else if (objc_msgSend(v11, "isEqualToString:", CFSTR("rap")))
      {
        v7 = 2;
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

+ (BOOL)_validateResource:(unint64_t)a3 withData:(id)a4 data:(id *)a5 error:(id *)a6
{
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  BOOL v11;
  void *v12;
  NSObject *v13;
  uint64_t v15;
  OSStatus v16;
  uint64_t *v17;
  BOOL v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t ApplePinned;
  const void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  dispatch_once_t *v28;
  void *v29;
  id *v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  uint8_t buf[4];
  _BYTE v35[18];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v31 = a4;
  switch(a3)
  {
    case 3uLL:
      if (qword_1ECDBB948 == -1)
      {
        v8 = &qword_1ECDBB938;
        goto LABEL_10;
      }
      v8 = &qword_1ECDBB938;
      v28 = &qword_1ECDBB948;
      v29 = &__block_literal_global_39;
      break;
    case 2uLL:
      if (qword_1ECDBB930 == -1)
      {
        v8 = &qword_1ECDBB920;
        goto LABEL_10;
      }
      v8 = &qword_1ECDBB920;
      v28 = &qword_1ECDBB930;
      v29 = &__block_literal_global_36;
      break;
    case 1uLL:
      if (qword_1ECDBB918 == -1)
      {
        v8 = &_MergedGlobals_181;
        goto LABEL_10;
      }
      v8 = &_MergedGlobals_181;
      v28 = &qword_1ECDBB918;
      v29 = &__block_literal_global_11;
      break;
    default:
      goto LABEL_15;
  }
  dispatch_once(v28, v29);
LABEL_10:
  v9 = *v8;
  v10 = v8[1];
  if (v10)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid signed resource type %d"), a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -29, v12);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    GEOGetSignedResourcesLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v35 = v12;
      _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, " - Failed: %@", buf, 0xCu);
    }

LABEL_20:
    v18 = 0;
    goto LABEL_21;
  }
  v30 = a6;
  v15 = 0;
  v16 = 0;
  v17 = (uint64_t *)(v9 + 8);
  v18 = 1;
  do
  {
    GEOGetSignedResourcesLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v21 = *(v17 - 1);
      v20 = *v17;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v35 = v20;
      *(_WORD *)&v35[8] = 2112;
      *(_QWORD *)&v35[10] = v21;
      _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_DEBUG, "Checking OIDs ca %@, leaf %@", buf, 0x16u);
    }

    ApplePinned = SecPolicyCreateApplePinned();
    if (ApplePinned)
    {
      v23 = (const void *)ApplePinned;
      v16 = SecCMSVerifyCopyDataAndAttributes();
      CFRelease(v23);
    }
    if (!v16)
    {
      GEOGetSignedResourcesLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v24, OS_LOG_TYPE_DEBUG, " - Passed", buf, 2u);
      }
      goto LABEL_34;
    }
    v18 = ++v15 < v10;
    v17 += 2;
  }
  while (v10 != v15);
  if (!v30)
    goto LABEL_20;
  v24 = SecCopyErrorMessageString(v16, 0);
  v25 = (void *)MEMORY[0x1E0CB35C8];
  v32 = *MEMORY[0x1E0C9AFB0];
  v33 = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("SecError"), v16, v26);
  *v30 = (id)objc_claimAutoreleasedReturnValue();

  GEOGetSignedResourcesLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v35 = v16;
    *(_WORD *)&v35[4] = 2112;
    *(_QWORD *)&v35[6] = v24;
    _os_log_impl(&dword_1885A9000, v27, OS_LOG_TYPE_ERROR, " - Failed (%d): %@", buf, 0x12u);
  }

  v18 = 0;
LABEL_34:

LABEL_21:
  return v18;
}

+ (BOOL)_validateResource:(unint64_t)a3 atPath:(id)a4 data:(id *)a5 error:(id *)a6
{
  void *v10;
  char v11;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", a4, 0, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = objc_msgSend(a1, "_validateResource:withData:data:error:", a3, v10, a5, a6);
  else
    v11 = 0;

  return v11;
}

+ (id)validateResource:(unint64_t)a3 withData:(id)a4
{
  id v5;

  v5 = 0;
  objc_msgSend(a1, "_validateResource:withData:data:error:", a3, a4, 0, &v5);
  return v5;
}

+ (id)validateResource:(unint64_t)a3 atPath:(id)a4
{
  id v5;

  v5 = 0;
  objc_msgSend(a1, "_validateResource:atPath:data:error:", a3, a4, 0, &v5);
  return v5;
}

+ (id)loadResource:(unint64_t)a3 atPath:(id)a4 error:(id *)a5
{
  id v6;

  v6 = 0;
  objc_msgSend(a1, "_validateResource:atPath:data:error:", a3, a4, &v6, a5);
  return v6;
}

+ (id)validateResourceAtPath:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v9;

  v4 = a3;
  v5 = objc_msgSend(a1, "typeForResourceByFileName:", v4);
  if (v5)
  {
    v9 = 0;
    objc_msgSend(a1, "_validateResource:atPath:data:error:", v5, v4, 0, &v9);
    v6 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -29, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

+ (id)loadResourceAtPath:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v10;

  v6 = a3;
  v7 = objc_msgSend(a1, "typeForResourceByFileName:", v6);
  if (v7)
  {
    v10 = 0;
    objc_msgSend(a1, "_validateResource:atPath:data:error:", v7, v6, &v10, a4);
    v8 = v10;
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -29, 0);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
