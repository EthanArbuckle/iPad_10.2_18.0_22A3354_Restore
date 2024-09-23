@implementation LibraryMenuProvider

+ (id)contextMenuConfigurationForLibraryItems:(id)a3 dataSource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count") == 1
    && (objc_msgSend(v5, "firstObject"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v5, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tab");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v9, "tab");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "tabGroup");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contextMenuConfigurationForTab:inTabGroup:", v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v9, "tabGroup");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contextMenuConfigurationForTabGroup:variant:", v11, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
