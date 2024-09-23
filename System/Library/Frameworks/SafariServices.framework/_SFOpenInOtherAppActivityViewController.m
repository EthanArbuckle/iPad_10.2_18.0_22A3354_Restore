@implementation _SFOpenInOtherAppActivityViewController

+ (id)_applicationsForDocumentProxy:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationsAvailableForOpeningDocument:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v14, "bundleIdentifier", (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v8);

        if (v16)
        {
          objc_msgSend(v9, "removeObject:", v14);
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

+ (id)_activityItemsForFilePath:(id)a3 UTI:(id)a4 sourceURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  _SFOpenWithAppUIActivity *v22;
  void *v23;
  _SFOpenWithAppUIActivity *v24;
  id v25;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CA58C8];
    objc_msgSend(v8, "lastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sf_documentProxyForName:type:MIMEType:sourceURL:", v13, v9, 0, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(a1, "_applicationsForDocumentProxy:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "count"))
      {
        v28 = v10;
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v27 = v15;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v30 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
              v22 = [_SFOpenWithAppUIActivity alloc];
              objc_msgSend(v21, "bundleIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = -[_SFOpenWithAppUIActivity initWithApplicationIdentifier:andFilePath:](v22, "initWithApplicationIdentifier:andFilePath:", v23, v8);
              objc_msgSend(v11, "addObject:", v24);

            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          }
          while (v18);
        }

        v25 = v11;
        v10 = v28;
        v15 = v27;
      }
      else
      {
        v25 = 0;
      }

    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

+ (BOOL)canOpenWithFilePath:(id)a3 UTI:(id)a4 sourceURL:(id)a5
{
  void *v5;
  BOOL v6;

  objc_msgSend(a1, "_activityItemsForFilePath:UTI:sourceURL:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (_SFOpenInOtherAppActivityViewController)initWithFilePath:(id)a3 UTI:(id)a4 sourceURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  _SFOpenInOtherAppActivityItemsSource *v11;
  void *v12;
  void *v13;
  _SFOpenInOtherAppActivityViewController *v14;
  _SFOpenInOtherAppActivityViewController *v15;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = -[_SFOpenInOtherAppActivityItemsSource initWithFilePath:]([_SFOpenInOtherAppActivityItemsSource alloc], "initWithFilePath:", v8);
  objc_msgSend((id)objc_opt_class(), "_activityItemsForFilePath:UTI:sourceURL:", v8, v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v18[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17.receiver = self;
    v17.super_class = (Class)_SFOpenInOtherAppActivityViewController;
    v14 = -[_SFActivityViewController initWithActivityItems:applicationActivities:sharingURL:sourceURL:](&v17, sel_initWithActivityItems_applicationActivities_sharingURL_sourceURL_, v13, v12, v9, v9);

    if (v14)
      -[_SFOpenInOtherAppActivityViewController setFilePath:](v14, "setFilePath:", v8);
    self = v14;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_prepareActivity:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "activityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB1D0]);

  if (v5)
  {
    -[NSString lastPathComponent](self->_filePath, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSubject:", v6);

  }
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_filePath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end
