@implementation IFPlistParser

+ (id)topLevelAppBundleIconKeys
{
  if (topLevelAppBundleIconKeys_onceToken != -1)
    dispatch_once(&topLevelAppBundleIconKeys_onceToken, &__block_literal_global_5);
  return (id)topLevelAppBundleIconKeys_keys;
}

void __42__IFPlistParser_topLevelAppBundleIconKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("CFBundleIcons");
  v2[1] = CFSTR("CFBundleIconFile");
  v2[2] = CFSTR("CFBundleIconFiles");
  v2[3] = CFSTR("CFBundleIconName");
  v2[4] = CFSTR("CFBundleIcons~ipad");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)topLevelAppBundleIconKeys_keys;
  topLevelAppBundleIconKeys_keys = v0;

}

- (IFPlistParser)initWithInfoDictionary:(id)a3
{
  id v4;
  IFPlistParser *v5;
  uint64_t v6;
  NSDictionary *infoDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IFPlistParser;
  v5 = -[IFPlistParser init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    infoDictionary = v5->_infoDictionary;
    v5->_infoDictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (NSDictionary)iconContent
{
  void *v2;
  void *v3;
  void *v4;

  -[IFPlistParser infoDictionary](self, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[IFPlistParser topLevelAppBundleIconKeys](IFPlistParser, "topLevelAppBundleIconKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_IF_dictionarySubsetForKeys:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (NSDictionary)iconDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[IFPlistParser infoDictionary](self, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "_IF_dictionaryForKey:", CFSTR("CFBundleIcons"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_IF_dictionaryForKey:", CFSTR("CFBundlePrimaryIcon"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "addEntriesFromDictionary:", v5);
  if (!objc_msgSend(v3, "count"))
  {
    objc_msgSend(v2, "_IF_dictionaryForKey:", CFSTR("CFBundleIcons"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_IF_stringForKey:", CFSTR("CFBundlePrimaryIcon"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("CFBundleIconName"));

  }
  if (!objc_msgSend(v3, "count"))
  {
    objc_msgSend(v2, "_IF_stringForKey:", CFSTR("CFBundleIconFile"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("CFBundleIconFile"));
    objc_msgSend(v2, "_IF_arrayForKey:", CFSTR("CFBundleIconFiles"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("CFBundleIconFiles"));
    objc_msgSend(v2, "_IF_stringForKey:", CFSTR("CFBundleIconName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("CFBundleIconName"));

  }
  objc_msgSend(v2, "_IF_dictionaryForKey:", CFSTR("CFBundleIcons"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_IF_dictionaryForKey:", CFSTR("ISGraphicIconConfiguration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("ISGraphicIconConfiguration"));

  return (NSDictionary *)v3;
}

- (NSString)catalogAssetName
{
  void *v2;
  void *v3;

  -[IFPlistParser iconDictionary](self, "iconDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_IF_stringForKey:", CFSTR("CFBundleIconName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)supportedPlatform
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[IFPlistParser infoDictionary](self, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_IF_arrayForKey:", CFSTR("CFBundleSupportedPlatforms"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[IFPlatformInfo sharedInstance](IFPlatformInfo, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "platformFromPlatformStrings:", v3);

  return v5;
}

- (NSDictionary)infoDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoDictionary, 0);
}

+ (id)catalogAssetExcerptForAssetName:(id)a3 style:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void **v10;
  const __CFString **v11;
  void *v12;
  NSObject *v13;
  int v15;
  unint64_t v16;
  __int16 v17;
  void *v18;
  const __CFString *v19;
  id v20;
  const __CFString *v21;
  id v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  id v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  id v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    switch(a4)
    {
      case 0uLL:
        v35 = CFSTR("CFBundleIcons");
        v32 = v5;
        v33 = CFSTR("CFBundlePrimaryIcon");
        v31 = CFSTR("CFBundleIconName");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = v8;
        v9 = (void *)MEMORY[0x1E0C99D80];
        v10 = (void **)v36;
        v11 = &v35;
        goto LABEL_7;
      case 1uLL:
        v22 = v5;
        v23 = CFSTR("CFBundleIcons");
        v21 = CFSTR("CFBundlePrimaryIcon");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      case 2uLL:
        v19 = CFSTR("CFBundleIconName");
        v20 = v5;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 3uLL:
        v29 = CFSTR("CFBundleIcons~ipad");
        v26 = v5;
        v27 = CFSTR("CFBundlePrimaryIcon");
        v25 = CFSTR("CFBundleIconName");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v8;
        v9 = (void *)MEMORY[0x1E0C99D80];
        v10 = &v30;
        v11 = &v29;
LABEL_7:
        objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
        break;
      default:
        IFDefaultLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v15 = 134218242;
          v16 = a4;
          v17 = 2112;
          v18 = v6;
        }

        goto LABEL_12;
    }
  }
  else
  {
LABEL_12:
    v12 = 0;
  }

  return v12;
}

+ (id)fileAssetsExcerptForFilenames:(id)a3 style:(unint64_t)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject **v9;
  const __CFString **v10;
  void *v11;
  void *v12;
  void *v13;
  void **v14;
  const __CFString **v15;
  int v17;
  unint64_t v18;
  __int16 v19;
  void *v20;
  const __CFString *v21;
  NSObject *v22;
  const __CFString *v23;
  NSObject *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  NSObject *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  NSObject *v34;
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    switch(a4)
    {
      case 0uLL:
        v35 = CFSTR("CFBundleIcons");
        v32 = v6;
        v33 = CFSTR("CFBundlePrimaryIcon");
        v31 = CFSTR("CFBundleIconFiles");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
        v7 = objc_claimAutoreleasedReturnValue();
        v34 = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = v12;
        v13 = (void *)MEMORY[0x1E0C99D80];
        v14 = (void **)v36;
        v15 = &v35;
        goto LABEL_11;
      case 2uLL:
      case 4uLL:
        v23 = CFSTR("CFBundleIconFile");
        objc_msgSend(v6, "firstObject");
        v7 = objc_claimAutoreleasedReturnValue();
        v24 = v7;
        v8 = (void *)MEMORY[0x1E0C99D80];
        v9 = &v24;
        v10 = &v23;
        goto LABEL_13;
      case 3uLL:
        v29 = CFSTR("CFBundleIcons~ipad");
        v26 = v6;
        v27 = CFSTR("CFBundlePrimaryIcon");
        v25 = CFSTR("CFBundleIconFiles");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
        v7 = objc_claimAutoreleasedReturnValue();
        v28 = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v12;
        v13 = (void *)MEMORY[0x1E0C99D80];
        v14 = &v30;
        v15 = &v29;
LABEL_11:
        objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      case 5uLL:
        v21 = CFSTR("CFBundleIconFile~ipad");
        objc_msgSend(v6, "firstObject");
        v7 = objc_claimAutoreleasedReturnValue();
        v22 = v7;
        v8 = (void *)MEMORY[0x1E0C99D80];
        v9 = &v22;
        v10 = &v21;
LABEL_13:
        objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        IFDefaultLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v17 = 134218242;
          v18 = a4;
          v19 = 2112;
          v20 = v6;
        }
        v11 = 0;
        break;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)grahpicIconExcerptForConfigDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v9 = v4;
    v10 = CFSTR("CFBundleIcons");
    v8 = CFSTR("ISGraphicIconConfiguration");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)catalogAssetNamesReturningPlistExcerpt:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  -[IFPlistParser infoDictionary](self, "infoDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_IF_dictionaryForKey:", CFSTR("CFBundleIcons"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_IF_dictionaryForKey:", CFSTR("CFBundlePrimaryIcon"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_IF_stringForKey:", CFSTR("CFBundleIconName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "addObject:", v10);
    +[IFPlistParser catalogAssetExcerptForAssetName:style:](IFPlistParser, "catalogAssetExcerptForAssetName:style:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEntriesFromDictionary:", v11);

  }
  -[IFPlistParser infoDictionary](self, "infoDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_IF_dictionaryForKey:", CFSTR("CFBundleIcons~ipad"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_IF_dictionaryForKey:", CFSTR("CFBundlePrimaryIcon"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_IF_stringForKey:", CFSTR("CFBundleIconName"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v6, "addObject:", v15);
    +[IFPlistParser catalogAssetExcerptForAssetName:style:](IFPlistParser, "catalogAssetExcerptForAssetName:style:", v15, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEntriesFromDictionary:", v16);

  }
  -[IFPlistParser infoDictionary](self, "infoDictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_IF_dictionaryForKey:", CFSTR("CFBundleIcons"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_IF_stringForKey:", CFSTR("CFBundlePrimaryIcon"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v6, "addObject:", v19);
    +[IFPlistParser catalogAssetExcerptForAssetName:style:](IFPlistParser, "catalogAssetExcerptForAssetName:style:", v19, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEntriesFromDictionary:", v20);

  }
  -[IFPlistParser infoDictionary](self, "infoDictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_IF_stringForKey:", CFSTR("CFBundleIconName"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v6, "addObject:", v22);
    +[IFPlistParser catalogAssetExcerptForAssetName:style:](IFPlistParser, "catalogAssetExcerptForAssetName:style:", v22, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEntriesFromDictionary:", v23);

  }
  if (objc_msgSend(v6, "count"))
  {
    if (a3)
      *a3 = (id)objc_msgSend(v5, "copy");
    v24 = v6;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)looseFilesNamesReturningPlistExcerpt:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  -[IFPlistParser infoDictionary](self, "infoDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_IF_dictionaryForKey:", CFSTR("CFBundleIcons"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_IF_dictionaryForKey:", CFSTR("CFBundlePrimaryIcon"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_IF_arrayForKey:", CFSTR("CFBundleIconFiles"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && objc_msgSend(v10, "count"))
  {
    objc_msgSend(v6, "addObjectsFromArray:", v10);
    +[IFPlistParser fileAssetsExcerptForFilenames:style:](IFPlistParser, "fileAssetsExcerptForFilenames:style:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEntriesFromDictionary:", v11);

  }
  -[IFPlistParser infoDictionary](self, "infoDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_IF_dictionaryForKey:", CFSTR("CFBundleIcons~ipad"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_IF_dictionaryForKey:", CFSTR("CFBundlePrimaryIcon"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_IF_arrayForKey:", CFSTR("CFBundleIconFiles"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && objc_msgSend(v15, "count"))
  {
    objc_msgSend(v6, "addObjectsFromArray:", v15);
    +[IFPlistParser fileAssetsExcerptForFilenames:style:](IFPlistParser, "fileAssetsExcerptForFilenames:style:", v15, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEntriesFromDictionary:", v16);

  }
  -[IFPlistParser infoDictionary](self, "infoDictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_IF_arrayForKey:", CFSTR("CFBundleIconFiles"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18 && objc_msgSend(v18, "count"))
  {
    objc_msgSend(v6, "addObjectsFromArray:", v18);
    +[IFPlistParser fileAssetsExcerptForFilenames:style:](IFPlistParser, "fileAssetsExcerptForFilenames:style:", v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEntriesFromDictionary:", v19);

  }
  -[IFPlistParser infoDictionary](self, "infoDictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_IF_arrayForKey:", CFSTR("CFBundleIconFiles~ipad"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21 && objc_msgSend(v21, "count"))
  {
    objc_msgSend(v6, "addObjectsFromArray:", v21);
    +[IFPlistParser fileAssetsExcerptForFilenames:style:](IFPlistParser, "fileAssetsExcerptForFilenames:style:", v21, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEntriesFromDictionary:", v22);

  }
  -[IFPlistParser infoDictionary](self, "infoDictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_IF_stringForKey:", CFSTR("CFBundleIconFile"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v6, "addObject:", v24);
    v34[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[IFPlistParser fileAssetsExcerptForFilenames:style:](IFPlistParser, "fileAssetsExcerptForFilenames:style:", v25, 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEntriesFromDictionary:", v26);

  }
  -[IFPlistParser infoDictionary](self, "infoDictionary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "_IF_stringForKey:", CFSTR("CFBundleIconFile~ipad"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v6, "addObject:", v28);
    v33 = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[IFPlistParser fileAssetsExcerptForFilenames:style:](IFPlistParser, "fileAssetsExcerptForFilenames:style:", v29, 5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEntriesFromDictionary:", v30);

  }
  if (objc_msgSend(v6, "count"))
  {
    if (a3)
      *a3 = (id)objc_msgSend(v5, "copy");
    v31 = v6;
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (BOOL)hasGraphicIconReturningPlistExcerpt:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[IFPlistParser infoDictionary](self, "infoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_IF_dictionaryForKey:", CFSTR("CFBundleIcons"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_IF_dictionaryForKey:", CFSTR("ISGraphicIconConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    +[IFPlistParser grahpicIconExcerptForConfigDictionary:](IFPlistParser, "grahpicIconExcerptForConfigDictionary:", v6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6 != 0;
}

- (id)iconContentForAlternateIconName:(id)a3 variants:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  id obj;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  const __CFString *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "addObject:", CFSTR("CFBundleIcons"));
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v35;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(CFSTR("CFBundleIcons"), "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v10);
  }
  v26 = v8;

  v28 = (id)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v7;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v31;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v17);
        -[IFPlistParser infoDictionary](self, "infoDictionary", v26);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "_IF_dictionaryForKey:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_IF_dictionaryForKey:", CFSTR("CFBundleAlternateIcons"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "_IF_dictionaryForKey:", v29);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          v39 = v22;
          v40 = v18;
          v38 = CFSTR("CFBundlePrimaryIcon");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v23;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v28, "addEntriesFromDictionary:", v24);
        }

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    }
    while (v15);
  }

  return v28;
}

@end
