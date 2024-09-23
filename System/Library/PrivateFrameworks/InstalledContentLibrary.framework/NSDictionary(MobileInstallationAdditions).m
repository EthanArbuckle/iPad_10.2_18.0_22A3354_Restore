@implementation NSDictionary(MobileInstallationAdditions)

+ (id)MI_dictionaryWithContentsOfURL:()MobileInstallationAdditions options:error:
{
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v15;
  id v16;

  v16 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 2, &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16;
  if (v7)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, a4, 0, &v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v15;

    objc_opt_class();
    v11 = v9;
    v12 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;

    if (v12)
    {
      v13 = v11;
      v8 = v10;
      v11 = v13;
      if (!a5)
        goto LABEL_12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 2048, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      v13 = 0;
      if (!a5)
        goto LABEL_12;
    }
  }
  else
  {
    v13 = 0;
    v11 = 0;
    if (!a5)
      goto LABEL_12;
  }
  if (!v13)
    *a5 = objc_retainAutorelease(v8);
LABEL_12:

  return v13;
}

- (uint64_t)MI_writeToURL:()MobileInstallationAdditions format:options:error:
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v17;
  id v18;

  v10 = a3;
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a1, a4, 0, &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v18;
  v13 = v12;
  if (v11)
  {
    v17 = v12;
    v14 = objc_msgSend(v11, "writeToURL:options:error:", v10, a5, &v17);
    v15 = v17;

    v13 = v15;
    if (!a6)
      goto LABEL_7;
  }
  else
  {
    v14 = 0;
    if (!a6)
      goto LABEL_7;
  }
  if ((v14 & 1) == 0)
    *a6 = objc_retainAutorelease(v13);
LABEL_7:

  return v14;
}

- (uint64_t)MI_writeAtomicallyToURLMatchingCurrentFileMetadata:()MobileInstallationAdditions format:error:
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v15;
  id v16;

  v8 = a3;
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a1, a4, 0, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  v11 = v10;
  if (v9)
  {
    v15 = v10;
    v12 = objc_msgSend(v9, "MI_writeAtomicallyToURLMatchingCurrentFileMetadata:error:", v8, &v15);
    v13 = v15;

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
  if ((v12 & 1) == 0)
    *a5 = objc_retainAutorelease(v11);
LABEL_7:

  return v12;
}

@end
