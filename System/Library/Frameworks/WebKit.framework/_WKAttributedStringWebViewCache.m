@implementation _WKAttributedStringWebViewCache

+ (id)cache
{
  id result;

  if (byte_1ECE72831 == 1)
    return (id)qword_1ECE72848;
  result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  qword_1ECE72848 = (uint64_t)result;
  byte_1ECE72831 = 1;
  return result;
}

+ (id)configuration
{
  WKWebViewConfiguration *v2;
  const void *v3;
  _WKProcessPoolConfiguration *v4;
  WKProcessPool *v5;
  WKProcessPool *v6;
  const void *v7;
  id v8;
  WKWebsiteDataStore *v9;
  WKWebsiteDataStore *v11;

  if ((byte_1ECE72833 & 1) != 0)
  {
    if (qword_1ECE72858)
      return (id)qword_1ECE72858;
  }
  else
  {
    qword_1ECE72858 = 0;
    byte_1ECE72833 = 1;
  }
  v2 = objc_alloc_init(WKWebViewConfiguration);
  v3 = (const void *)qword_1ECE72858;
  qword_1ECE72858 = (uint64_t)v2;
  if (v3)
    CFRelease(v3);
  if (!objc_msgSend((id)readOnlyAccessPaths(), "count"))
  {
    v6 = objc_alloc_init(WKProcessPool);
    v5 = v6;
    if (!v6)
      goto LABEL_12;
    CFRetain(v6);
    v4 = (_WKProcessPoolConfiguration *)v5;
    goto LABEL_11;
  }
  if ((unint64_t)objc_msgSend((id)readOnlyAccessPaths(), "count") >= 3)
  {
    __break(0xC471u);
    JUMPOUT(0x19707E428);
  }
  v4 = objc_alloc_init(_WKProcessPoolConfiguration);
  -[_WKProcessPoolConfiguration setAdditionalReadAccessAllowedURLs:](v4, "setAdditionalReadAccessAllowedURLs:", readOnlyAccessPaths());
  v5 = -[WKProcessPool _initWithConfiguration:]([WKProcessPool alloc], "_initWithConfiguration:", v4);
  if (v4)
LABEL_11:
    CFRelease(v4);
LABEL_12:
  if ((byte_1ECE72835 & 1) == 0)
  {
    qword_1ECE72868 = 0;
    byte_1ECE72835 = 1;
LABEL_27:
    v11 = +[WKWebsiteDataStore nonPersistentDataStore](WKWebsiteDataStore, "nonPersistentDataStore");
    v9 = v11;
    if (v11)
      CFRetain(v11);
    goto LABEL_17;
  }
  v7 = (const void *)qword_1ECE72868;
  if (!qword_1ECE72868)
    goto LABEL_27;
  CFRetain((CFTypeRef)qword_1ECE72868);
  v8 = -[_WKWebsiteDataStoreConfiguration initNonPersistentConfiguration]([_WKWebsiteDataStoreConfiguration alloc], "initNonPersistentConfiguration");
  objc_msgSend(v8, "setSourceApplicationBundleIdentifier:", v7);
  v9 = -[WKWebsiteDataStore _initWithConfiguration:]([WKWebsiteDataStore alloc], "_initWithConfiguration:", v8);
  if (v8)
    CFRelease(v8);
  CFRelease(v7);
LABEL_17:
  objc_msgSend((id)qword_1ECE72858, "setProcessPool:", v5);
  objc_msgSend((id)qword_1ECE72858, "setWebsiteDataStore:", v9);
  objc_msgSend((id)qword_1ECE72858, "setMediaTypesRequiringUserActionForPlayback:", -1);
  objc_msgSend((id)qword_1ECE72858, "_setAllowsJavaScriptMarkup:", 0);
  objc_msgSend((id)qword_1ECE72858, "_setAllowsMetaRefresh:", 0);
  objc_msgSend((id)qword_1ECE72858, "_setAttachmentElementEnabled:", 1);
  objc_msgSend((id)objc_msgSend((id)qword_1ECE72858, "preferences"), "_setExtensibleSSOEnabled:", 0);
  objc_msgSend((id)qword_1ECE72858, "_setInvisibleAutoplayNotPermitted:", 1);
  objc_msgSend((id)qword_1ECE72858, "_setMediaDataLoadsAutomatically:", 0);
  objc_msgSend((id)qword_1ECE72858, "_setNeedsStorageAccessFromFileURLsQuirk:", 0);
  objc_msgSend((id)qword_1ECE72858, "setAllowsInlineMediaPlayback:", 0);
  objc_msgSend((id)qword_1ECE72858, "_setClientNavigationsRunAtForegroundPriority:", 1);
  objc_msgSend((id)objc_msgSend((id)qword_1ECE72858, "preferences"), "_setDefaultFontSize:", 12);
  if (!shouldAllowNetworkLoads)
    objc_msgSend((id)qword_1ECE72858, "_setAllowedNetworkHosts:", objc_msgSend(MEMORY[0x1E0C99E60], "set"));
  if (v9)
    CFRelease(v9);
  if (v5)
    CFRelease(v5);
  return (id)qword_1ECE72858;
}

+ (void)clearConfiguration
{
  const void *v2;

  if ((byte_1ECE72833 & 1) != 0)
  {
    v2 = (const void *)qword_1ECE72858;
    qword_1ECE72858 = 0;
    if (v2)
      CFRelease(v2);
  }
  else
  {
    byte_1ECE72833 = 1;
    qword_1ECE72858 = 0;
  }
}

+ (void)clearConfigurationAndRaiseExceptionIfNecessary:(id)a3
{
  if (a3)
  {
    if (objc_msgSend((id)readOnlyAccessPaths(), "count"))
    {
      objc_msgSend((id)readOnlyAccessPaths(), "removeAllObjects");
      objc_msgSend(a1, "clearConfiguration");
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@"), a3);
  }
}

+ (void)validateEntry:(id)a3
{
  char isKindOfClass;
  const __CFString *v6;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = CFSTR("The NSArray associated with _WKReadAccessFileURLsOption may only contain NSURL objects.");
  if (a3 && (isKindOfClass & 1) != 0)
  {
    if (objc_msgSend(a3, "isFileURL", CFSTR("The NSArray associated with _WKReadAccessFileURLsOption may only contain NSURL objects.")))v6 = 0;
    else
      v6 = CFSTR("_WKReadAccessFileURLsOption requires its NSURL objects to be file URLs.");
  }
  objc_msgSend(a1, "clearConfigurationAndRaiseExceptionIfNecessary:", v6);
}

+ (void)maybeUpdateShouldAllowNetworkLoads:(id)a3
{
  id v4;
  int v5;
  char v6;

  if (a3)
  {
    v4 = a3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v4 = 0;
    if (!v4)
      objc_msgSend(a1, "clearConfigurationAndRaiseExceptionIfNecessary:", CFSTR("The value associated with _WKAllowNetworkLoadsOption must be an NSNumber."));
    v5 = objc_msgSend(v4, "BOOLValue");
    if (shouldAllowNetworkLoads != v5)
    {
      v6 = objc_msgSend(v4, "BOOLValue");
LABEL_11:
      shouldAllowNetworkLoads = v6;
      objc_msgSend(a1, "clearConfiguration");
    }
  }
  else if (!shouldAllowNetworkLoads)
  {
    v6 = 1;
    goto LABEL_11;
  }
}

+ (void)maybeUpdateSourceApplicationBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  const void *v6;

  if (a3)
  {
    v4 = a3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v4 = 0;
    if (!v4)
      objc_msgSend(a1, "clearConfigurationAndRaiseExceptionIfNecessary:", CFSTR("The value associated with _WKSourceApplicationBundleIdentifierOption must be an NSString."));
    if (byte_1ECE72835 == 1)
    {
      v5 = (void *)qword_1ECE72868;
    }
    else
    {
      v5 = 0;
      qword_1ECE72868 = 0;
      byte_1ECE72835 = 1;
    }
    if ((objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
    {
      if ((byte_1ECE72835 & 1) != 0)
      {
        if (!v4)
          goto LABEL_12;
      }
      else
      {
        qword_1ECE72868 = 0;
        byte_1ECE72835 = 1;
        if (!v4)
        {
LABEL_12:
          v6 = (const void *)qword_1ECE72868;
          qword_1ECE72868 = (uint64_t)v4;
          if (!v6)
            goto LABEL_18;
          goto LABEL_17;
        }
      }
      CFRetain(v4);
      goto LABEL_12;
    }
  }
  else if ((byte_1ECE72835 & 1) != 0)
  {
    v6 = (const void *)qword_1ECE72868;
    if (qword_1ECE72868)
    {
      qword_1ECE72868 = 0;
LABEL_17:
      CFRelease(v6);
LABEL_18:
      objc_msgSend(a1, "clearConfiguration");
    }
  }
  else
  {
    qword_1ECE72868 = 0;
    byte_1ECE72835 = 1;
  }
}

+ (void)maybeConsumeBundlePaths:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *OnlyAccessPaths;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    a3 = 0;
  if (a3)
  {
    if ((unint64_t)objc_msgSend(a3, "count") <= 2)
      v5 = 0;
    else
      v5 = CFSTR("_WKReadAccessFileURLsOption may have at most two additional directories.");
  }
  else
  {
    v5 = CFSTR("The value associated with _WKReadAccessFileURLsOption must be an NSArray of NSURL objects.");
  }
  objc_msgSend(a1, "clearConfigurationAndRaiseExceptionIfNecessary:", v5);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(a3);
        objc_msgSend(a1, "validateEntry:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  if ((objc_msgSend(a3, "isEqualToArray:", readOnlyAccessPaths()) & 1) == 0)
  {
    OnlyAccessPaths = (void *)readOnlyAccessPaths();
    if (a3)
      objc_msgSend(OnlyAccessPaths, "setArray:", a3);
    else
      objc_msgSend(OnlyAccessPaths, "removeAllObjects");
    objc_msgSend(a1, "clearConfiguration");
  }
}

+ (void)invalidateGlobalConfigurationIfNeeded:(id)a3
{
  uint64_t v5;

  v5 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("_WKReadAccessFileURLsOption"));
  if (v5)
    objc_msgSend(a1, "maybeConsumeBundlePaths:", v5);
  objc_msgSend(a1, "maybeUpdateShouldAllowNetworkLoads:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("_WKAllowNetworkLoadsOption")));
  objc_msgSend(a1, "maybeUpdateSourceApplicationBundleIdentifier:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("_WKSourceApplicationBundleIdentifierOption")));
}

+ (RetainPtr<WKWebView>)retrieveOrCreateWebView
{
  WKWebView **v2;
  WKWebView **v4;
  void *v5;
  WKWebView *v6;
  WKWebView *v7;
  _QWORD block[5];

  v4 = v2;
  objc_msgSend(a1, "resetPurgeDelay");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58___WKAttributedStringWebViewCache_retrieveOrCreateWebView__block_invoke;
  block[3] = &unk_1E34BAF80;
  block[4] = a1;
  if (+[_WKAttributedStringWebViewCache retrieveOrCreateWebView]::onceToken != -1)
    dispatch_once(&+[_WKAttributedStringWebViewCache retrieveOrCreateWebView]::onceToken, block);
  v5 = (void *)objc_msgSend(a1, "cache");
  if (objc_msgSend(v5, "count"))
  {
    v6 = (WKWebView *)objc_msgSend(v5, "lastObject");
    *v4 = v6;
    if (v6)
      CFRetain(v6);
    return (RetainPtr<WKWebView>)objc_msgSend(v5, "removeLastObject");
  }
  else
  {
    v7 = -[WKWebView initWithFrame:configuration:]([WKWebView alloc], "initWithFrame:configuration:", objc_msgSend(a1, "configuration"), 0.0, 0.0, 800.0, 600.0);
    *v4 = v7;
  }
  return (RetainPtr<WKWebView>)v7;
}

+ (void)cacheWebView:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a1, "cache");
  if ((unint64_t)objc_msgSend(v4, "count") <= 2)
    objc_msgSend(v4, "addObject:", a3);
}

+ (void)resetPurgeDelay
{
  char *v3;

  if (byte_1ECE72832 == 1)
  {
    v3 = (char *)qword_1ECE72850;
  }
  else
  {
    v3 = sel_purgeSingleWebView;
    qword_1ECE72850 = (uint64_t)sel_purgeSingleWebView;
    byte_1ECE72832 = 1;
  }
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", a1, v3, 0);
  objc_msgSend(a1, "performSelector:withObject:afterDelay:", qword_1ECE72850, 0, 15.0);
}

+ (void)purgeSingleWebView
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", a1, a2, 0);
  v4 = (void *)objc_msgSend(a1, "cache");
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend((id)objc_msgSend(v4, "lastObject"), "_close");
    objc_msgSend(v4, "removeLastObject");
    if (objc_msgSend(v4, "count"))
      objc_msgSend(a1, "performSelector:withObject:afterDelay:", a2, 0, 15.0);
    else
      objc_msgSend(a1, "clearConfiguration");
  }
}

+ (void)purgeAllWebViews
{
  void *v3;

  v3 = (void *)objc_msgSend(a1, "cache");
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "makeObjectsPerformSelector:", sel__close);
    objc_msgSend(v3, "removeAllObjects");
    objc_msgSend(a1, "clearConfiguration");
  }
}

@end
