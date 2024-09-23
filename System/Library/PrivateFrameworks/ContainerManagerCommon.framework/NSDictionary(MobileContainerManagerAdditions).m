@implementation NSDictionary(MobileContainerManagerAdditions)

- (uint64_t)MCM_writeToURL:()MobileContainerManagerAdditions withOptions:error:
{
  id v8;
  void *v9;
  uint64_t v10;

  v8 = a3;
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "MCM_writeToURL:withOptions:fileManager:error:", v8, a4, v9, a5);

  return v10;
}

- (uint64_t)MCM_writeToURL:()MobileContainerManagerAdditions withOptions:fileManager:error:
{
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20[2];

  v20[1] = *(id *)MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v20[0] = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a1, 200, 0, v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v20[0];
  if (!v12)
    goto LABEL_7;
  if (objc_msgSend(v12, "length"))
  {
    v17 = v13;
    v14 = objc_msgSend(v11, "writeData:toURL:options:mode:error:", v12, v10, a4, 438, &v17);
    v15 = v17;
    goto LABEL_4;
  }
  if (v13)
  {
LABEL_7:
    v14 = 0;
    if (!a6)
      goto LABEL_10;
    goto LABEL_8;
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __94__NSDictionary_MobileContainerManagerAdditions__MCM_writeToURL_withOptions_fileManager_error___block_invoke;
  v18[3] = &unk_1E8CB67B8;
  v19 = v10;
  __94__NSDictionary_MobileContainerManagerAdditions__MCM_writeToURL_withOptions_fileManager_error___block_invoke((uint64_t)v18);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v13 = v19;
LABEL_4:

  v13 = v15;
  if (!a6)
    goto LABEL_10;
LABEL_8:
  if ((v14 & 1) == 0)
    *a6 = objc_retainAutorelease(v13);
LABEL_10:

  return v14;
}

+ (uint64_t)MCM_dictionaryWithContentsOfURL:()MobileContainerManagerAdditions options:error:
{
  return objc_msgSend(a1, "MCM_dictionaryWithContentsOfURL:options:fsNode:error:", a3, a4, 0, a5);
}

+ (id)MCM_dictionaryWithContentsOfURL:()MobileContainerManagerAdditions options:fsNode:error:
{
  id v10;
  void *v11;
  void *v12;

  v10 = a3;
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "MCM_dictionaryWithContentsOfURL:options:fileManager:fsNode:error:", v10, a4, v11, a5, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)MCM_dictionaryWithContentsOfURL:()MobileContainerManagerAdditions options:fileManager:fsNode:error:
{
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v17;
  id v18[2];

  v18[1] = *(id *)MEMORY[0x1E0C80C00];
  v18[0] = 0;
  objc_msgSend(a5, "readDataFromURL:options:fsNode:error:", a3, 2, a6, v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v18[0];
  if (v9)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v9, a4, 0, &v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v17;

    objc_opt_class();
    v13 = v11;
    v14 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;

    if (v14)
    {
      v15 = v13;
      v10 = v12;
      v13 = v15;
      if (!a7)
        goto LABEL_12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 2048, 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v15 = 0;
      if (!a7)
        goto LABEL_12;
    }
  }
  else
  {
    v15 = 0;
    v13 = 0;
    if (!a7)
      goto LABEL_12;
  }
  if (!v15)
    *a7 = objc_retainAutorelease(v10);
LABEL_12:

  return v15;
}

@end
