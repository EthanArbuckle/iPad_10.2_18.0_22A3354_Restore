@implementation EKConferenceUtils

+ (NSString)FacetimeAppBundleID
{
  return (NSString *)CFSTR("com.apple.facetime");
}

+ (NSString)FacetimeConferenceExtensionBundleID
{
  return (NSString *)CFSTR("com.apple.mobilecal.FacetimeExtension");
}

+ (id)logHandle
{
  return (id)EKLogHandle;
}

+ (id)_workQueue
{
  if (_workQueue_onceToken != -1)
    dispatch_once(&_workQueue_onceToken, &__block_literal_global_79);
  return (id)_workQueue_workQueue;
}

void __31__EKConferenceUtils__workQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("EKConferenceUtils.workQueue", 0);
  v1 = (void *)_workQueue_workQueue;
  _workQueue_workQueue = (uint64_t)v0;

}

+ (double)conferenceImageSize
{
  return 35.0;
}

+ (void)virtualConference:(id)a3 likelyCameFromRoomTypes:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v26 = a5;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v13);
        objc_msgSend(v7, "title");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          objc_msgSend(v7, "title");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "title");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "isEqualToString:", v18);

          if (v19)
          {
            v23 = v26;
            (*((void (**)(id, void *))v26 + 2))(v26, v14);
            v24 = v9;
            goto LABEL_12;
          }
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v11)
        continue;
      break;
    }
  }

  objc_msgSend(v7, "joinMethods");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "URL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __81__EKConferenceUtils_virtualConference_likelyCameFromRoomTypes_completionHandler___block_invoke;
  v27[3] = &unk_1E4788FD8;
  v28 = v9;
  v23 = v26;
  v30 = a1;
  v29 = v26;
  objc_msgSend(a1, "applicationRecordForURL:completionHandler:", v22, v27);

  v24 = v28;
LABEL_12:

}

void __81__EKConferenceUtils_virtualConference_likelyCameFromRoomTypes_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "extensionBundleIdentifier", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "parentAppBundleIdentifierForExtensionBundleIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v3, "isEqual:", v11))
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

          goto LABEL_11;
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_11:

}

+ (id)synchronousAppTitleOnlyForURL:(id)a3 incomplete:(BOOL *)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a1, "applicationRecordForURL:incomplete:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.microsoft.lync2013.iphone")))
    {
      EKBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Skype"), &stru_1E4789A58, 0);
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v9;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)applicationRecordForURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  _QWORD v9[4];
  id v10;
  void (**v11)(id, _QWORD);
  id v12;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (objc_msgSend(v6, "cal_hasSchemeTel"))
  {
    v7[2](v7, 0);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CA5838];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__EKConferenceUtils_applicationRecordForURL_completionHandler___block_invoke;
    v9[3] = &unk_1E4789028;
    v12 = a1;
    v10 = v6;
    v11 = v7;
    objc_msgSend(v8, "getAppLinksWithURL:completionHandler:", v10, v9);

  }
}

void __63__EKConferenceUtils_applicationRecordForURL_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[6], "_workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__EKConferenceUtils_applicationRecordForURL_completionHandler___block_invoke_2;
  block[3] = &unk_1E4789000;
  v15 = a1[6];
  v11 = v5;
  v12 = v6;
  v13 = a1[4];
  v14 = a1[5];
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, block);

}

void __63__EKConferenceUtils_applicationRecordForURL_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "targetApplicationRecord", (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsString:", CFSTR("com.apple.internal"));

        if ((v10 & 1) == 0)
        {
          v11 = v7;

          goto LABEL_11;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  objc_msgSend(*(id *)(a1 + 64), "_applicationRecordFromAppLink:appLinkError:orCustomScheme:", v11, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

+ (void)clearAppRecordCache
{
  id v2;

  objc_msgSend(a1, "appRecordCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

+ (id)appRecordCache
{
  if (appRecordCache_onceToken != -1)
    dispatch_once(&appRecordCache_onceToken, &__block_literal_global_23_0);
  return (id)appRecordCache_cache;
}

uint64_t __35__EKConferenceUtils_appRecordCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)appRecordCache_cache;
  appRecordCache_cache = (uint64_t)v0;

  objc_msgSend((id)appRecordCache_cache, "setCountLimit:", 100);
  return notify_register_check((const char *)*MEMORY[0x1E0CF9658], &apHiddenAppsNotifyToken);
}

+ (id)applicationRecordForURL:(id)a3 incomplete:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void *v18;
  id v19;
  int check;

  v6 = a3;
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "cal_hasSchemeTel") & 1) == 0)
  {
    check = 0;
    notify_check(apHiddenAppsNotifyToken, &check);
    if (check)
      objc_msgSend(a1, "clearAppRecordCache");
    objc_msgSend(a1, "appRecordCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = (void *)objc_opt_new();
      objc_msgSend(a1, "appRecordCache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v11, v7);

      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __56__EKConferenceUtils_applicationRecordForURL_incomplete___block_invoke;
      v18 = &unk_1E4789050;
      v10 = v11;
      v19 = v10;
      objc_msgSend(a1, "applicationRecordForURL:completionHandler:", v7, &v15);

    }
    objc_msgSend(v10, "record", v15, v16, v17, v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v8 == 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      v8 = 0;
    }
    if (a4)
      *a4 = v13;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __56__EKConferenceUtils_applicationRecordForURL_incomplete___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRecord:", a2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setRecord:", v3);

  }
}

+ (id)_applicationRecordFromAppLink:(id)a3 appLinkError:(id)a4 orCustomScheme:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;
  int v22;
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v28;
  int v29;
  id v30;
  id v31;
  id v32;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    objc_msgSend((id)objc_opt_class(), "logHandle");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      +[EKConferenceUtils _applicationRecordFromAppLink:appLinkError:orCustomScheme:].cold.3();

    v31 = 0;
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA58A8]), "initWithURL:error:", v9, &v31);
    v19 = v31;
    v16 = v19;
    if (v17)
    {
      -[NSObject bundleRecord](v17, "bundleRecord");
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (-[NSObject isWebBrowser](v20, "isWebBrowser") & 1) == 0)
        {
          v20 = v20;
          -[NSObject bundleIdentifier](v20, "bundleIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.FaceTimeLinkTrampoline"));

          if (v22)
          {
            v23 = objc_alloc(MEMORY[0x1E0CA5870]);
            +[EKConferenceUtils FacetimeAppBundleID](EKConferenceUtils, "FacetimeAppBundleID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = 0;
            v15 = objc_msgSend(v23, "initWithBundleIdentifier:allowPlaceholder:error:", v24, 0, &v30);
            v25 = v30;

            if (!v15)
            {
              objc_msgSend((id)objc_opt_class(), "logHandle");
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                +[EKConferenceUtils _applicationRecordFromAppLink:appLinkError:orCustomScheme:].cold.2();

            }
            goto LABEL_22;
          }
          -[NSObject bundleIdentifier](v20, "bundleIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "containsString:", CFSTR("com.apple.internal"));

          if (!v29)
          {
            v15 = (uint64_t)v20;
            goto LABEL_22;
          }

        }
      }
    }
    else
    {
      if (!v19)
      {
        v15 = 0;
        goto LABEL_23;
      }
      objc_msgSend((id)objc_opt_class(), "logHandle");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        +[EKConferenceUtils _applicationRecordFromAppLink:appLinkError:orCustomScheme:].cold.1();
    }
    v15 = 0;
LABEL_22:

    goto LABEL_23;
  }
  objc_msgSend(v7, "targetApplicationRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.FaceTimeLinkTrampoline"));

  if (v12)
  {
    v13 = objc_alloc(MEMORY[0x1E0CA5870]);
    +[EKConferenceUtils FacetimeAppBundleID](EKConferenceUtils, "FacetimeAppBundleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v15 = objc_msgSend(v13, "initWithBundleIdentifier:allowPlaceholder:error:", v14, 0, &v32);
    v16 = v32;

    if (v15)
    {
LABEL_24:

      v10 = (void *)v15;
      goto LABEL_25;
    }
    objc_msgSend((id)objc_opt_class(), "logHandle");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[EKConferenceUtils _applicationRecordFromAppLink:appLinkError:orCustomScheme:].cold.4();
LABEL_23:

    goto LABEL_24;
  }
LABEL_25:

  return v10;
}

+ (id)parentAppBundleIdentifierForExtensionBundleIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  id v21;

  v3 = (objc_class *)MEMORY[0x1E0CA5848];
  v4 = a3;
  v21 = 0;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:error:", v4, &v21);

  v6 = v21;
  if (v5)
  {
    objc_msgSend(v5, "containingBundleRecord");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_msgSend((id)objc_opt_class(), "logHandle");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[EKConferenceUtils parentAppBundleIdentifierForExtensionBundleIdentifier:].cold.2(v8, v10, v11, v12, v13, v14, v15, v16);
      v17 = 0;
      goto LABEL_14;
    }
    -[NSObject bundleIdentifier](v7, "bundleIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject bundleIdentifier](v7, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.mobilecal")))
    {

LABEL_13:
      +[EKConferenceUtils FacetimeAppBundleID](EKConferenceUtils, "FacetimeAppBundleID");
      v17 = objc_claimAutoreleasedReturnValue();
LABEL_14:

      v8 = v17;
      goto LABEL_15;
    }
    -[NSObject bundleIdentifier](v7, "bundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.iCal"));

    if (v19)
      goto LABEL_13;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "logHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[EKConferenceUtils parentAppBundleIdentifierForExtensionBundleIdentifier:].cold.1();
    v8 = 0;
  }
LABEL_15:

  return v8;
}

+ (void)invalidateConferenceURLIfNeeded:(id)a3 inEventStore:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  dispatch_time_t v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  SEL v28;
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7 && objc_msgSend(MEMORY[0x1E0D0C288], "isTUConversationLink:", v7))
  {
    os_unfair_lock_lock(&_invalidationLock);
    if (!_urlsAwaitingInvalidation)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = (void *)_urlsAwaitingInvalidation;
      _urlsAwaitingInvalidation = (uint64_t)v9;

      v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v12 = (void *)_invalidatedURLs;
      _invalidatedURLs = (uint64_t)v11;

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = dispatch_queue_create("com.apple.eventkit.ConferenceInvalidationQueue", v13);
      v15 = (void *)_invalidationQueue;
      _invalidationQueue = (uint64_t)v14;

    }
    objc_msgSend((id)_invalidatedURLs, "objectForKeyedSubscript:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "validURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
    }
    else
    {
      objc_msgSend((id)_urlsAwaitingInvalidation, "objectForKeyedSubscript:", v7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "integerValue");
      v19 = v21 != 1;
      if (v21 != 1)
        objc_msgSend((id)_urlsAwaitingInvalidation, "setObject:forKeyedSubscript:", &unk_1E47B5420, v7);

      v18 = 0;
    }

    os_unfair_lock_unlock(&_invalidationLock);
    if (v18)
    {
      objc_msgSend(a1, "invalidateConferenceURLIfNeeded:inEventStore:", v18, v8);
    }
    else if (v19)
    {
      objc_msgSend((id)objc_opt_class(), "logHandle");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v7;
        _os_log_impl(&dword_1A2318000, v22, OS_LOG_TYPE_INFO, "Checking if we need to invalidate URL %@", buf, 0xCu);
      }

      v23 = dispatch_time(0, 500000000);
      v24 = _invalidationQueue;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __66__EKConferenceUtils_invalidateConferenceURLIfNeeded_inEventStore___block_invoke;
      v25[3] = &unk_1E4789078;
      v26 = v7;
      v28 = a2;
      v29 = a1;
      v27 = v8;
      dispatch_after(v23, v24, v25);

    }
  }

}

void __66__EKConferenceUtils_invalidateConferenceURLIfNeeded_inEventStore___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  EKConferenceInvalidationRecord *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock(&_invalidationLock);
  objc_msgSend((id)_urlsAwaitingInvalidation, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");
  switch(v3)
  {
    case 3:
      objc_msgSend((id)_urlsAwaitingInvalidation, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), CFSTR("EKConferenceUtils.m"), 389, CFSTR("invalidation state before search already set to checking"));

      break;
    case 1:
      objc_msgSend((id)_urlsAwaitingInvalidation, "setObject:forKeyedSubscript:", &unk_1E47B5438, *(_QWORD *)(a1 + 32));
      os_unfair_lock_unlock(&_invalidationLock);
      objc_msgSend(*(id *)(a1 + 40), "predicateForEventsWithConferenceURL:limit:", *(_QWORD *)(a1 + 32), 1);
      v4 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "eventsMatchingPredicate:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");
      os_unfair_lock_lock(&_invalidationLock);
      objc_msgSend((id)_urlsAwaitingInvalidation, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "integerValue");
      v9 = v8;
      if (v6 || (unint64_t)(v8 - 1) >= 2)
      {
        objc_msgSend((id)objc_opt_class(), "logHandle");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
        if (v9 == 2)
        {
          if (v16)
          {
            v17 = *(_QWORD *)(a1 + 32);
            v18 = 138412290;
            v19 = v17;
            _os_log_impl(&dword_1A2318000, v15, OS_LOG_TYPE_INFO, "Found uses of %@", (uint8_t *)&v18, 0xCu);
          }

          objc_msgSend((id)_urlsAwaitingInvalidation, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
        }
        else
        {
          if (v16)
          {
            v18 = 134217984;
            v19 = v9;
            _os_log_impl(&dword_1A2318000, v15, OS_LOG_TYPE_INFO, "Not invalidating because state changed to %li while checking", (uint8_t *)&v18, 0xCu);
          }

        }
        os_unfair_lock_unlock(&_invalidationLock);
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "logHandle");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = *(_QWORD *)(a1 + 32);
          v18 = 138412290;
          v19 = v11;
          _os_log_impl(&dword_1A2318000, v10, OS_LOG_TYPE_INFO, "No uses found of %@", (uint8_t *)&v18, 0xCu);
        }

        objc_msgSend((id)_urlsAwaitingInvalidation, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
        v12 = objc_alloc_init(EKConferenceInvalidationRecord);
        objc_msgSend((id)_invalidatedURLs, "setObject:forKeyedSubscript:", v12, *(_QWORD *)(a1 + 32));

        os_unfair_lock_unlock(&_invalidationLock);
        +[EKConferenceUtils invalidateConferenceURL:](EKConferenceUtils, "invalidateConferenceURL:", *(_QWORD *)(a1 + 32));
      }

      goto LABEL_22;
  }
  os_unfair_lock_unlock(&_invalidationLock);
  objc_msgSend((id)objc_opt_class(), "logHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v18 = 138412290;
    v19 = v14;
    _os_log_impl(&dword_1A2318000, v4, OS_LOG_TYPE_INFO, "No need to check URL %@", (uint8_t *)&v18, 0xCu);
  }
LABEL_22:

}

+ (void)invalidateConferenceURL:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && objc_msgSend(MEMORY[0x1E0D0C288], "isTUConversationLink:", v4))
  {
    objc_msgSend((id)objc_opt_class(), "logHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1A2318000, v5, OS_LOG_TYPE_DEFAULT, "Going to invalidate the URL %@", buf, 0xCu);
    }

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__EKConferenceUtils_invalidateConferenceURL___block_invoke;
    v6[3] = &unk_1E47890C8;
    v8 = a1;
    v7 = v4;
    objc_msgSend(a1, "_findExtensionIdentifierForURL:completionHandler:", v7, v6);

  }
}

void __45__EKConferenceUtils_invalidateConferenceURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  BOOL v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  __int128 v16;
  id v17;
  _QWORD v18[4];
  __int128 v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  NSObject *v26;
  id v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", v3, &v20);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v20;
    if (v5)
      v6 = 1;
    else
      v6 = v4 == 0;
    if (v6)
    {
      v14 = v5;
      objc_msgSend((id)objc_opt_class(), "logHandle");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __45__EKConferenceUtils_invalidateConferenceURL___block_invoke_cold_2();
    }
    else
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __45__EKConferenceUtils_invalidateConferenceURL___block_invoke_49;
      v18[3] = &unk_1E47890A0;
      v16 = *(_OWORD *)(a1 + 32);
      v8 = (id)v16;
      v19 = v16;
      objc_msgSend(v4, "setRequestCompletionBlock:", v18);
      v9 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
      v28[0] = CFSTR("_EKVirtualConferenceRequestTypeKey");
      v28[1] = CFSTR("_EKVirtualConferenceRequestURLParameterForInvalidation");
      v10 = *(_QWORD *)(a1 + 32);
      v29[0] = CFSTR("_EKVirtualConferenceRequestTypeURLInvalidate");
      v29[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setUserInfo:", v11);

      v27 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      objc_msgSend(v4, "beginExtensionRequestWithOptions:inputItems:error:", 1, v12, &v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v17;

      if (v14)
      {
        objc_msgSend((id)objc_opt_class(), "logHandle");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v22 = v4;
          v23 = 2112;
          v24 = v13;
          v25 = 2112;
          v26 = v14;
          _os_log_error_impl(&dword_1A2318000, v15, OS_LOG_TYPE_ERROR, "Failed to invalidate virtual conference URL, extension = %@ request = %@ error = %@", buf, 0x20u);
        }

      }
      v7 = v19;
    }

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "logHandle");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __45__EKConferenceUtils_invalidateConferenceURL___block_invoke_cold_1();
  }

}

void __45__EKConferenceUtils_invalidateConferenceURL___block_invoke_49(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("_EKVirtualConferenceInvalidationResultKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && objc_msgSend(v6, "isEqualToString:", CFSTR("_EKVirtualConferenceInvalidationResultSucceeded")))
  {
    objc_msgSend((id)objc_opt_class(), "logHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1A2318000, v7, OS_LOG_TYPE_INFO, "URL invalidated successfully: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "logHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __45__EKConferenceUtils_invalidateConferenceURL___block_invoke_49_cold_1();
  }

}

+ (id)validURLForConferenceURL:(id)a3 completion:(id)a4
{
  return (id)objc_msgSend(a1, "_validURLForConferenceURL:previousURLs:completion:", a3, 0, a4);
}

+ (id)_validURLForConferenceURL:(id)a3 previousURLs:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  os_unfair_lock_lock(&_invalidationLock);
  objc_msgSend((id)_urlsAwaitingInvalidation, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend((id)_invalidatedURLs, "objectForKeyedSubscript:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18;
    if (!v18)
      goto LABEL_3;
    objc_msgSend(v18, "validURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      goto LABEL_4;
    objc_msgSend(v13, "waitingCompletionHandlers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v13, "waitingCompletionHandlers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1A85849D4](v10);
      objc_msgSend(v20, "addObject:", v21);

      if (!v9)
      {
        os_unfair_lock_unlock(&_invalidationLock);
LABEL_22:
        v16 = 0;
        goto LABEL_11;
      }
    }
    else
    {
      v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v13, "setWaitingCompletionHandlers:", v22);

      objc_msgSend(v13, "waitingCompletionHandlers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1A85849D4](v10);
      objc_msgSend(v23, "addObject:", v24);

      v25 = (void *)objc_opt_new();
      objc_msgSend(v13, "setReplacementForURLs:", v25);

      objc_msgSend(v13, "replacementForURLs");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObject:", v11);

      if (!v9)
      {
        os_unfair_lock_unlock(&_invalidationLock);
        goto LABEL_21;
      }
    }
    objc_msgSend(v13, "replacementForURLs");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "unionSet:", v9);

    os_unfair_lock_unlock(&_invalidationLock);
    if (v19)
      goto LABEL_22;
LABEL_21:
    objc_msgSend(v13, "generateNewValidURLForOriginalURL:", v11);
    goto LABEL_22;
  }
  objc_msgSend((id)_urlsAwaitingInvalidation, "setObject:forKeyedSubscript:", &unk_1E47B5450, v11);
  v13 = 0;
LABEL_3:
  v14 = v11;
LABEL_4:
  os_unfair_lock_unlock(&_invalidationLock);
  if (v14 && v13)
  {
    objc_msgSend(v13, "replacementForURLs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_validURLForConferenceURL:previousURLs:completion:", v14, v15, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 && (objc_msgSend(v16, "isEqual:", v14) & 1) == 0)
    {
      os_unfair_lock_lock(&_invalidationLock);
      objc_msgSend(v13, "setValidURL:", v16);
      os_unfair_lock_unlock(&_invalidationLock);
    }

  }
  else
  {
    v16 = v14;
  }
LABEL_11:

  return v16;
}

+ (void)renewConferenceURL:(id)a3 toDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "logHandle");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v6;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_1A2318000, v8, OS_LOG_TYPE_INFO, "ConferenceRenewal: Attempting to extend expiration of URL: %@ to date: %@", buf, 0x16u);
  }

  if (v6 && v7)
  {
    if ((objc_msgSend(MEMORY[0x1E0D0C288], "isTUConversationLink:", v6) & 1) != 0)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __47__EKConferenceUtils_renewConferenceURL_toDate___block_invoke;
      v17[3] = &unk_1E47890F0;
      v20 = a1;
      v18 = v6;
      v19 = v7;
      objc_msgSend(a1, "_findExtensionIdentifierForURL:completionHandler:", v18, v17);

      v9 = v18;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "logHandle");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[EKConferenceUtils renewConferenceURL:toDate:].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "logHandle");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[EKConferenceUtils renewConferenceURL:toDate:].cold.1();
  }

}

void __47__EKConferenceUtils_renewConferenceURL_toDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  BOOL v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  NSObject *v26;
  id v27;
  _QWORD v28[3];
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", v3, &v20);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v20;
    if (v5)
      v6 = 1;
    else
      v6 = v4 == 0;
    if (v6)
    {
      v14 = v5;
      objc_msgSend((id)objc_opt_class(), "logHandle");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __47__EKConferenceUtils_renewConferenceURL_toDate___block_invoke_cold_2();
    }
    else
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __47__EKConferenceUtils_renewConferenceURL_toDate___block_invoke_58;
      v17[3] = &unk_1E47890A0;
      v19 = *(_QWORD *)(a1 + 48);
      v18 = *(id *)(a1 + 32);
      objc_msgSend(v4, "setRequestCompletionBlock:", v17);
      v8 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
      v28[0] = CFSTR("_EKVirtualConferenceRequestTypeKey");
      v28[1] = CFSTR("_EKVirtualConferenceRequestURLParameterForRenewal");
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v29[0] = CFSTR("_EKVirtualConferenceRequestTypeURLRenew");
      v29[1] = v9;
      v28[2] = CFSTR("_EKVirtualConferenceRequestDateParameterForRenewal");
      v29[2] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setUserInfo:", v11);
      v27 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      objc_msgSend(v4, "beginExtensionRequestWithOptions:inputItems:error:", 1, v12, &v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v16;

      if (v14)
      {
        objc_msgSend((id)objc_opt_class(), "logHandle");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v22 = v4;
          v23 = 2112;
          v24 = v13;
          v25 = 2112;
          v26 = v14;
          _os_log_error_impl(&dword_1A2318000, v15, OS_LOG_TYPE_ERROR, "ConferenceRenewal: Request to renew conference URL failed, extension = %@ request = %@ error = %@", buf, 0x20u);
        }

      }
      v7 = v18;
    }

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "logHandle");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __47__EKConferenceUtils_renewConferenceURL_toDate___block_invoke_cold_1();
  }

}

void __47__EKConferenceUtils_renewConferenceURL_toDate___block_invoke_58(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("_EKVirtualConferenceRenewalResultKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v6, "isEqualToString:", CFSTR("_EKVirtualConferenceRenewalResultSucceeded")))
  {
    objc_msgSend((id)objc_opt_class(), "logHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_1A2318000, v7, OS_LOG_TYPE_INFO, "ConferenceRenewal: URL renewed successfully: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("_EKVirtualConferenceErrorResultKey"));
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "logHandle");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __47__EKConferenceUtils_renewConferenceURL_toDate___block_invoke_58_cold_1();

  }
}

+ (void)_findExtensionIdentifierForURL:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  id v7;

  v7 = a3;
  v5 = (void (**)(id, void *))a4;
  if (v7 && (objc_msgSend(MEMORY[0x1E0D0C288], "isTUConversationLink:") & 1) != 0)
  {
    +[EKConferenceUtils FacetimeConferenceExtensionBundleID](EKConferenceUtils, "FacetimeConferenceExtensionBundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v6);

  }
  else
  {
    v5[2](v5, 0);
  }

}

+ (void)_findRoomTypeForURL:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__EKConferenceUtils__findRoomTypeForURL_queue_completionHandler___block_invoke;
  v14[3] = &unk_1E4789140;
  v17 = v10;
  v18 = a1;
  v15 = v8;
  v16 = v9;
  v11 = v9;
  v12 = v10;
  v13 = v8;
  +[EKConferenceUtils _findExtensionIdentifierForURL:completionHandler:](EKConferenceUtils, "_findExtensionIdentifierForURL:completionHandler:", v13, v14);

}

void __65__EKConferenceUtils__findRoomTypeForURL_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  BOOL v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = a2;
  if (v3)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", v3, &v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v14;
    if (v5)
      v6 = 1;
    else
      v6 = v4 == 0;
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "logHandle");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __45__EKConferenceUtils_invalidateConferenceURL___block_invoke_cold_2();

      v8 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", EKConferenceValidationErrorDomain, 1, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v11);
    }
    else
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __65__EKConferenceUtils__findRoomTypeForURL_queue_completionHandler___block_invoke_61;
      v12[3] = &unk_1E4789118;
      v13 = *(id *)(a1 + 48);
      +[EKVirtualConferenceRoomType virtualConferenceRoomTypesWithCompletion:queue:](EKVirtualConferenceRoomType, "virtualConferenceRoomTypesWithCompletion:queue:", v12, *(_QWORD *)(a1 + 40));
      v11 = v13;
    }

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "logHandle");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __65__EKConferenceUtils__findRoomTypeForURL_queue_completionHandler___block_invoke_cold_1();

    v10 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", EKConferenceValidationErrorDomain, 1, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v10 + 16))(v10, 0, v5);
  }

}

void __65__EKConferenceUtils__findRoomTypeForURL_queue_completionHandler___block_invoke_61(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "firstObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v6 = (id)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v4 + 16))(v4, v3, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", EKConferenceValidationErrorDomain, 4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

  }
}

+ (void)_applicationRecordFromAppLink:appLinkError:orCustomScheme:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Error getting claim binding for URL, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_applicationRecordFromAppLink:appLinkError:orCustomScheme:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "URL should be opened with the FaceTime app, but there was an error fetching FaceTime's application record: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_applicationRecordFromAppLink:appLinkError:orCustomScheme:.cold.3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1A2318000, v0, OS_LOG_TYPE_DEBUG, "Couldn't find out what app opens URL as a universal link, trying to see what opens it as a custom URL scheme: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_applicationRecordFromAppLink:appLinkError:orCustomScheme:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "URL should be opened with the FaceTime app, but there was an error fetching FaceTime's application record: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parentAppBundleIdentifierForExtensionBundleIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Failed to find app extension record for extension bundle identifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parentAppBundleIdentifierForExtensionBundleIdentifier:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, a1, a3, "Containing record for app extension record could not be found or was the wrong type", a5, a6, a7, a8, 0);
}

void __45__EKConferenceUtils_invalidateConferenceURL___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Unable to find application record for URL %@, not invalidating.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __45__EKConferenceUtils_invalidateConferenceURL___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_13(&dword_1A2318000, v0, v1, "Could not load extension for extensionIdentifier: %@, error = %@");
  OUTLINED_FUNCTION_1_0();
}

void __45__EKConferenceUtils_invalidateConferenceURL___block_invoke_49_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Unable to invalidate URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)renewConferenceURL:toDate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_13(&dword_1A2318000, v0, v1, "ConferenceRenewal: Didn't receive required arguments. URL = %@, expirationDate = %@. Stopping.");
  OUTLINED_FUNCTION_1_0();
}

+ (void)renewConferenceURL:(uint64_t)a3 toDate:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, a1, a3, "ConferenceRenewal: Unrecognized URL type. Stopping.", a5, a6, a7, a8, 0);
}

void __47__EKConferenceUtils_renewConferenceURL_toDate___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "ConferenceRenewal: Unable to find application record for URL %@, not invalidating.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __47__EKConferenceUtils_renewConferenceURL_toDate___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_13(&dword_1A2318000, v0, v1, "ConferenceRenewal: Could not load extension for extensionIdentifier: %@, error = %@");
  OUTLINED_FUNCTION_1_0();
}

void __47__EKConferenceUtils_renewConferenceURL_toDate___block_invoke_58_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_13(&dword_1A2318000, v0, v1, "ConferenceRenewal: Unable to renew URL: %@, error = %@");
  OUTLINED_FUNCTION_1_0();
}

void __65__EKConferenceUtils__findRoomTypeForURL_queue_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Unable to find application record for URL %@, not generating a new URL.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
