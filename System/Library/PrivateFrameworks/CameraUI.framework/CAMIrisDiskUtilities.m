@implementation CAMIrisDiskUtilities

+ (BOOL)hasPendingWork
{
  void *v2;
  void *v3;
  int v4;
  BOOL v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "irisVideoDirectoryPathCreateIfNeeded:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v2);

  v5 = 0;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v2, &v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;

    if (v8)
    {
      v9 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v13 = v2;
        v14 = 2114;
        v15 = v8;
        _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "Failed to get contents of %{public}@: %{public}@", buf, 0x16u);
      }

    }
    v5 = objc_msgSend(v7, "count") != 0;

  }
  return v5;
}

+ (id)irisVideoDirectoryPathCreateIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D73138], "photoDCIMDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR(".MISC/Iris"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, 0);

  }
  return v5;
}

+ (id)irisVideoDirectoryPath
{
  return (id)objc_msgSend(a1, "irisVideoDirectoryPathCreateIfNeeded:", 1);
}

+ (id)videoPathExtension
{
  return CFSTR("MOV");
}

+ (id)videoDestinationPathForStillImageRequest:(id)a3 captureTime:(double)a4 isEV0ForHDR:(BOOL)a5 bundleIdentifier:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  void *v28;
  void *v29;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  objc_msgSend(v10, "irisStillImagePersistenceUUIDForEV0:", v7);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isCTMVideo"))
    objc_msgSend(v10, "persistenceUUID");
  else
    objc_msgSend(v10, "irisVideoPersistenceUUIDForEV0:", v7);
  v12 = objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v10, "captureDevice");
  v13 = objc_msgSend(v10, "captureOrientation");
  v14 = objc_msgSend(v10, "persistenceOptions");
  v15 = objc_msgSend(v10, "temporaryPersistenceOptions");
  +[CAMEffectFilterManager ciFilterNameForFilterType:](CAMEffectFilterManager, "ciFilterNameForFilterType:", objc_msgSend(v10, "effectFilterType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_substituteForDotInBundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_delimiterForFilenames");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%ld%@%ld%@%.f%@%ld%@%ld%@%@"), v29, v19, v12, v19, v27, v19, v13, v19, a4 * 100.0, v19, v14, v19, v15, v19, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)v12;
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v20, v19, v16);
    v21 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v21;
  }
  objc_msgSend(a1, "irisVideoDirectoryPath");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringByAppendingPathComponent:", v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "videoPathExtension");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringByAppendingPathExtension:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (BOOL)parseVideoDestinationPath:(id)a3 forStillImagePersistenceUUID:(id *)a4 videoPersistenceUUID:(id *)a5 captureDevice:(int64_t *)a6 captureOrientation:(int64_t *)a7 captureTime:(double *)a8 persistenceOptions:(int64_t *)a9 temporaryPersistenceOptions:(int64_t *)a10 bundleIdentifier:(id *)a11 filterName:(id *)a12
{
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  id v26;
  int v27;
  uint64_t v28;
  int v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  BOOL v35;
  void *v36;
  void *v38;
  int v39;
  id v40;
  id v41;
  void *v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  id v52;
  id v53;
  int64_t v54;
  int64_t v55;
  int64_t v56;
  int64_t v57;

  v13 = a3;
  v56 = 0;
  v57 = 0;
  v54 = 0;
  v55 = 0;
  objc_msgSend(v13, "lastPathComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pathExtension");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14;
  v17 = 0;
  v18 = v16;
  do
  {
    v19 = v17;
    v20 = v18;
    objc_msgSend(v18, "stringByDeletingPathExtension");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "pathExtension");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  while (objc_msgSend(v17, "length"));
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_delimiterForFilenames");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "videoPathExtension");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v15, "isEqualToString:", v23);

  v47 = v16;
  v48 = v15;
  if (v24)
  {
    v53 = 0;
    v25 = objc_msgSend(v21, "scanUpToString:intoString:", v22, &v53);
    v26 = v53;
    if (v25 && objc_msgSend(v21, "scanString:intoString:", v22, 0))
    {
      v52 = 0;
      v27 = objc_msgSend(v21, "scanUpToString:intoString:", v22, &v52);
      v41 = v52;
      if (!v27
        || !objc_msgSend(v21, "scanString:intoString:", v22, 0)
        || !objc_msgSend(v21, "scanInteger:", &v57)
        || !objc_msgSend(v21, "scanString:intoString:", v22, 0)
        || !objc_msgSend(v21, "scanInteger:", &v56)
        || !objc_msgSend(v21, "scanString:intoString:", v22, 0)
        || (v51 = 0, !objc_msgSend(v21, "scanLongLong:", &v51))
        || (v28 = v51, !objc_msgSend(v21, "scanString:intoString:", v22, 0))
        || !objc_msgSend(v21, "scanInteger:", &v55)
        || !objc_msgSend(v21, "scanString:intoString:", v22, 0))
      {
        v35 = 0;
        v31 = 0;
        v30 = 0;
LABEL_44:
        v36 = v41;
        goto LABEL_45;
      }
      v40 = v26;
      if (!objc_msgSend(v21, "scanInteger:", &v54)
        || !objc_msgSend(v21, "scanString:intoString:", v22, 0))
      {
        v35 = 0;
        v31 = 0;
        v30 = 0;
LABEL_47:
        v26 = v40;
        goto LABEL_44;
      }
      v50 = 0;
      v29 = objc_msgSend(v21, "scanUpToString:intoString:", v22, &v50);
      v30 = v50;
      if (v29)
      {
        if ((objc_msgSend(v21, "isAtEnd") & 1) != 0)
        {
          v31 = 0;
          goto LABEL_21;
        }
        if (objc_msgSend(v21, "scanString:intoString:", v22, 0))
        {
          objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = 0;
          v39 = objc_msgSend(v21, "scanCharactersFromSet:intoString:", v38, &v49);
          v31 = v49;

          if (!v39)
          {
LABEL_50:
            v35 = 0;
            goto LABEL_47;
          }
LABEL_21:
          if (objc_msgSend(v21, "isAtEnd"))
          {
            if (a4)
              *a4 = objc_retainAutorelease(v40);
            if (a5)
              *a5 = objc_retainAutorelease(v41);
            if (a6)
              *a6 = v57;
            if (a7)
              *a7 = v56;
            if (a8)
              *a8 = (double)v28 / 100.0;
            if (a9)
              *a9 = v55;
            if (a10)
              *a10 = v54;
            if (a11)
            {
              objc_msgSend(a1, "_substituteForDotInBundleIdentifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "stringByReplacingOccurrencesOfString:withString:", v32, CFSTR("."));
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              v34 = objc_retainAutorelease(v33);
              *a11 = v34;

            }
            if (a12)
            {
              v31 = objc_retainAutorelease(v31);
              *a12 = v31;
            }
            v35 = 1;
            goto LABEL_47;
          }
          goto LABEL_50;
        }
      }
      v35 = 0;
      v31 = 0;
      goto LABEL_47;
    }
    v35 = 0;
    v31 = 0;
    v30 = 0;
    v36 = 0;
  }
  else
  {
    v35 = 0;
    v31 = 0;
    v30 = 0;
    v36 = 0;
    v26 = 0;
  }
LABEL_45:

  return v35;
}

+ (BOOL)isValidVideoDestinationPath:(id)a3
{
  return objc_msgSend(a1, "parseVideoDestinationPath:forStillImagePersistenceUUID:videoPersistenceUUID:captureDevice:captureOrientation:captureTime:persistenceOptions:temporaryPersistenceOptions:bundleIdentifier:filterName:", a3, 0, 0, 0, 0, 0, 0, 0, 0, 0);
}

+ (id)_delimiterForFilenames
{
  return CFSTR("__");
}

+ (id)_substituteForDotInBundleIdentifier
{
  return CFSTR(",");
}

@end
