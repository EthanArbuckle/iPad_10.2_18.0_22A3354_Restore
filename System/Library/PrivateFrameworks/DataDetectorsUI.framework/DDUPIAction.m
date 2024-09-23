@implementation DDUPIAction

+ (BOOL)actionAvailableForResult:(__DDResult *)a3 url:(id)a4 context:(id)a5
{
  void *v5;
  BOOL v6;

  +[DDUPIAction actionsWithURL:result:context:](DDUPIAction, "actionsWithURL:result:context:", a4, a3, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") != 0;

  return v6;
}

+ (id)actionsWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  DDUPIAction *v41;
  void *v42;
  void *v44;
  void *v45;
  id v46;
  id obj;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _QWORD v60[3];

  v60[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.MobileSMS"));

  if (v11)
  {
    +[DDAction actionWithURL:result:context:](DDCopyAction, "actionWithURL:result:context:", v7, a4, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  if (!dd_canListURLHandlers())
  {
    v17 = v13;
    goto LABEL_46;
  }
  v14 = 0;
  if (!v7 && a4)
  {
    if (DDResultHasType())
    {
      v14 = (void *)DDResultCopyUPIIdentifierValue();
      if (v14)
      {
        v15 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("upi://pay?pa=%@"), v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "URLWithString:", v16);
        v7 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_13;
      }
    }
    else
    {
      v14 = 0;
    }
    v7 = 0;
  }
LABEL_13:
  objc_msgSend(v7, "scheme");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lowercaseString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("upi"));

  if (v20)
  {
    if (actionsWithURL_result_context__onceToken != -1)
      dispatch_once(&actionsWithURL_result_context__onceToken, &__block_literal_global_11);
    if (actionsWithURL_result_context___isUPIEnabled)
    {
      v48 = v14;
      v21 = v8;
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v7;
      objc_msgSend(v22, "applicationsAvailableForOpeningURL:", v7);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringForKey:", CFSTR("DDUIUPILastUsed"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      obj = v24;
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v55 != v28)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "bundleIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_alloc(MEMORY[0x1E0CA5870]);
            v53 = 0;
            v32 = objc_msgSend(v31, "initWithBundleIdentifier:allowPlaceholder:error:", v30, 1, &v53);
            v33 = (void *)v32;
            if (!v53 && v32 && v30 != 0)
            {
              if (objc_msgSend(v45, "isEqualToString:", v30))
                objc_msgSend(v46, "insertObject:atIndex:", v33, 0);
              else
                objc_msgSend(v46, "addObject:", v33);
            }

          }
          v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
        }
        while (v27);
      }

      v35 = v46;
      if (objc_msgSend(v46, "count"))
      {
        v44 = v13;
        v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v46, "count"));
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v36 = v46;
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v50;
          do
          {
            for (j = 0; j != v38; ++j)
            {
              if (*(_QWORD *)v50 != v39)
                objc_enumerationMutation(v36);
              v41 = -[DDUPIAction initWithURL:result:context:appRecord:upiIdentifier:]([DDUPIAction alloc], "initWithURL:result:context:appRecord:upiIdentifier:", v23, a4, v21, *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j), v48);
              objc_msgSend(v17, "addObject:", v41);

            }
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
          }
          while (v38);
        }

        v7 = v23;
        v8 = v21;
        +[DDAction actionWithURL:result:context:](DDCopyAction, "actionWithURL:result:context:", v23, a4, v21);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v42);

        v13 = v44;
        v35 = v46;
      }
      else
      {
        v17 = v13;
        v8 = v21;
      }

      v14 = v48;
    }
    else
    {
      v17 = v13;
    }
  }
  else
  {
    v17 = 0;
  }

LABEL_46:
  return v17;
}

uint64_t __45__DDUPIAction_actionsWithURL_result_context___block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  actionsWithURL_result_context___isUPIEnabled = result;
  return result;
}

+ (id)matchingScheme
{
  return CFSTR("upi");
}

- (DDUPIAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5 appRecord:(id)a6 upiIdentifier:(id)a7
{
  id v13;
  id v14;
  DDUPIAction *v15;
  DDUPIAction *v16;
  uint64_t v17;
  NSString *appName;
  objc_super v20;

  v13 = a6;
  v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)DDUPIAction;
  v15 = -[DDAction initWithURL:result:context:](&v20, sel_initWithURL_result_context_, a3, a4, a5);
  v16 = v15;
  if (v13 && v15)
  {
    objc_storeStrong((id *)&v15->_appRecord, a6);
    objc_msgSend(v13, "localizedName");
    v17 = objc_claimAutoreleasedReturnValue();
    appName = v16->_appName;
    v16->_appName = (NSString *)v17;

    objc_storeStrong((id *)&v16->_upiIdentifier, a7);
  }

  return v16;
}

- (id)localizedName
{
  void *v3;
  void *v4;
  void *v5;

  if (self->_appName)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    DDLocalizedString(CFSTR("Pay with %@"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringWithFormat:", v4, self->_appName);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    DDLocalizedString(CFSTR("Pay"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)subtitle
{
  return 0;
}

- (id)iconName
{
  return CFSTR("applepaycash.circle");
}

- (id)icon
{
  LSApplicationRecord *appRecord;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  appRecord = self->_appRecord;
  if (!appRecord
    || (v4 = (void *)MEMORY[0x1E0CEA638],
        -[LSApplicationRecord bundleIdentifier](appRecord, "bundleIdentifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "_applicationIconImageForBundleIdentifier:format:", v5, 0),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    v8.receiver = self;
    v8.super_class = (Class)DDUPIAction;
    -[DDAction icon](&v8, sel_icon);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (int)interactionType
{
  return 0;
}

- (id)notificationIconBundleIdentifier
{
  return (id)-[LSApplicationRecord bundleIdentifier](self->_appRecord, "bundleIdentifier");
}

- (id)notificationURL
{
  return self->super._url;
}

- (void)performFromView:(id)a3
{
  void *v4;
  NSURL *url;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  url = self->super._url;
  -[LSApplicationRecord bundleIdentifier](self->_appRecord, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:", url, v6, 0, 0, 0, 0, 0, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSApplicationRecord bundleIdentifier](self->_appRecord, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("DDUIUPILastUsed"));

  objc_msgSend(v9, "start");
}

- (BOOL)canBePerformedByOpeningURL
{
  return 1;
}

- (id)viewController
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_upiIdentifier, 0);
  objc_storeStrong((id *)&self->_appRecord, 0);
}

@end
