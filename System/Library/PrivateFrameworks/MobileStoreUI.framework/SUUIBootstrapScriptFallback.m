@implementation SUUIBootstrapScriptFallback

+ (id)defaultCacheFolder
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v12;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v2, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 0, &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;

  if (!v3)
  {
    NSLog(CFSTR("*** Could not find caches directory, reason: %@"), v4);
    v5 = (void *)MEMORY[0x24BDBCF48];
    NSTemporaryDirectory();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURLWithPath:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(v3, "URLByAppendingPathComponent:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v9;
  }
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("SUUIBootstrapScriptFallback"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)cacheFilenameForStoreFrontIdentifier:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@.%@"), v3, CFSTR("v1"), CFSTR("js"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SUUIBootstrapScriptFallback)initWithCacheFolder:(id)a3 filename:(id)a4
{
  id v8;
  id v9;
  SUUIBootstrapScriptFallback *v10;
  SUUIBootstrapScriptFallback *v11;
  uint64_t v12;
  NSString *cacheFilename;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  void *v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v8, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUUIBootstrapScriptFallback.m"), 105, CFSTR("cacheFolder is not a file URL: %@"), v8);

  }
  v18.receiver = self;
  v18.super_class = (Class)SUUIBootstrapScriptFallback;
  v10 = -[SUUIBootstrapScriptFallback init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_cacheFolder, a3);
    v12 = objc_msgSend(v9, "copy");
    cacheFilename = v11->_cacheFilename;
    v11->_cacheFilename = (NSString *)v12;

    v11->_maximumAge = 604800.0;
    v14 = dispatch_queue_create("SUUIBootstrapScriptFallback", 0);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v14;

    -[SUUIBootstrapScriptFallback _createCacheDirectoriesIfNeeded](v11, "_createCacheDirectoriesIfNeeded");
  }

  return v11;
}

- (SUUIBootstrapScriptFallback)initWithFilename:(id)a3
{
  id v4;
  void *v5;
  SUUIBootstrapScriptFallback *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultCacheFolder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SUUIBootstrapScriptFallback initWithCacheFolder:filename:](self, "initWithCacheFolder:filename:", v5, v4);

  return v6;
}

- (SUUIBootstrapScriptFallback)init
{
  -[SUUIBootstrapScriptFallback doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (int64_t)state
{
  NSObject *v3;
  NSObject *v4;
  int64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[SUUIBootstrapScriptFallback queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[SUUIBootstrapScriptFallback queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__SUUIBootstrapScriptFallback_state__block_invoke;
  v7[3] = &unk_2511F4720;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __36__SUUIBootstrapScriptFallback_state__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_unsynchronizedState");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSURL)cachedFileLocation
{
  void *v3;
  void *v4;
  void *v5;

  -[SUUIBootstrapScriptFallback cacheFolder](self, "cacheFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIBootstrapScriptFallback cacheFilename](self, "cacheFilename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v5;
}

- (BOOL)isBagAvailable
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLBagForContext:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)canFallbackForError:(id)a3
{
  id v4;
  int64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  BOOL v15;

  v4 = a3;
  v5 = -[SUUIBootstrapScriptFallback state](self, "state");
  if (v5)
  {
    if (v5 == -1)
      -[SUUIBootstrapScriptFallback invalidate](self, "invalidate");
    goto LABEL_14;
  }
  v6 = v4;
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDD1308]) & 1) != 0)
  {
    v8 = objc_msgSend(v6, "code");

    if (v8 == -1001)
    {
LABEL_12:
      v15 = -[SUUIBootstrapScriptFallback isBagAvailable](self, "isBagAvailable");
      goto LABEL_15;
    }
  }
  else
  {

  }
  v9 = v6;
  objc_msgSend(v9, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BEB24A8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  objc_msgSend(v9, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BEB24A0]) & 1) == 0)
  {

LABEL_14:
    v15 = 0;
    goto LABEL_15;
  }
  v14 = objc_msgSend(v9, "code");

  v15 = 0;
  if (v14 == 109 && v12 >= 500 && v12 <= 599)
    goto LABEL_12;
LABEL_15:

  return v15;
}

- (id)retrieveScript:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  -[SUUIBootstrapScriptFallback queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__42;
  v14 = __Block_byref_object_dispose__42;
  v15 = 0;
  -[SUUIBootstrapScriptFallback queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SUUIBootstrapScriptFallback_retrieveScript___block_invoke;
  block[3] = &unk_2511F98C8;
  block[5] = &v10;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(v6, block);

  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_24);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __46__SUUIBootstrapScriptFallback_retrieveScript___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[2];
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_unsynchronizedState");
  if (v2)
  {
    if (!*(_QWORD *)(a1 + 48))
      return;
    if (v2 == -2)
    {
      v15 = (void *)MEMORY[0x24BDD1540];
      v19 = *MEMORY[0x24BDD0FC8];
      v20 = CFSTR("No cached script to retrieve.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v5 = v15;
      v6 = 560145512;
    }
    else
    {
      if (v2 != -1)
        return;
      v3 = (void *)MEMORY[0x24BDD1540];
      v21 = *MEMORY[0x24BDD0FC8];
      v22[0] = CFSTR("Cached script too old to retrieve.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v5 = v3;
      v6 = 1869374497;
    }
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("SUUIBootstrapScriptFallbackErrorDomain"), v6, v4);
    **(_QWORD **)(a1 + 48) = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(*(id *)(a1 + 32), "cachedFileLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v9 = objc_msgSend(v7, "initWithContentsOfURL:encoding:error:", v8, 4, &v16);
    v4 = v16;
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      if (*(_QWORD *)(a1 + 48))
      {
        v12 = (void *)MEMORY[0x24BDD1540];
        v13 = *MEMORY[0x24BDD0FC8];
        v17[0] = *MEMORY[0x24BDD1398];
        v17[1] = v13;
        v18[0] = v4;
        v18[1] = CFSTR("Could not retrieve script.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("SUUIBootstrapScriptFallbackErrorDomain"), 561149042, v14);
        **(_QWORD **)(a1 + 48) = (id)objc_claimAutoreleasedReturnValue();

      }
    }
  }

}

uint64_t __46__SUUIBootstrapScriptFallback_retrieveScript___block_invoke_2()
{
  return +[SUUIMetricsAppLaunchEvent withPendingLaunchEvent:](SUUIMetricsAppLaunchEvent, "withPendingLaunchEvent:", &__block_literal_global_37);
}

uint64_t __46__SUUIBootstrapScriptFallback_retrieveScript___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUsedBootstrapFallback:", 1);
}

- (void)scriptEvaluated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SUUIBootstrapScriptFallback *v9;

  v4 = a3;
  -[SUUIBootstrapScriptFallback queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__SUUIBootstrapScriptFallback_scriptEvaluated___block_invoke;
  v7[3] = &unk_2511F46D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __47__SUUIBootstrapScriptFallback_scriptEvaluated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cachedFileLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v4 = objc_msgSend(v2, "writeToURL:atomically:encoding:error:", v3, 1, 4, &v6);
  v5 = v6;

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "_logError:forOperation:", v5, CFSTR("writing new JS file to cache"));

}

- (void)invalidate
{
  NSObject *v3;
  _QWORD block[5];

  -[SUUIBootstrapScriptFallback queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SUUIBootstrapScriptFallback_invalidate__block_invoke;
  block[3] = &unk_2511F47C0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __41__SUUIBootstrapScriptFallback_invalidate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  char v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cacheFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v2, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, 0, 1, &v29);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v29;

  if (v4)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v7)
    {
      v8 = v7;
      v21 = a1;
      v22 = v4;
      v23 = v5;
      v9 = 0;
      v10 = *(_QWORD *)v26;
      v11 = *MEMORY[0x24BDD0B88];
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          v13 = v9;
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v6);
          v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          v24 = v9;
          v15 = objc_msgSend(v2, "removeItemAtURL:error:", v14, &v24, v21);
          v9 = v24;

          if ((v15 & 1) == 0)
          {
            v16 = v9;
            objc_msgSend(v16, "domain");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v17, "isEqualToString:", v11) & 1) == 0)
            {

LABEL_19:
              objc_msgSend(*(id *)(v21 + 32), "_logError:forOperation:", v16, CFSTR("invalidating cached JS files"));
              goto LABEL_20;
            }
            if (objc_msgSend(v16, "code") == 4)
            {

            }
            else
            {
              v18 = objc_msgSend(v16, "code");

              if (v18 != 260)
                goto LABEL_19;
            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v8)
          continue;
        break;
      }
LABEL_20:

      v4 = v22;
      v5 = v23;
    }
    goto LABEL_21;
  }
  v6 = v5;
  objc_msgSend(v6, "domain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "isEqualToString:", *MEMORY[0x24BDD0B88]) & 1) == 0)
  {

    goto LABEL_24;
  }
  if (objc_msgSend(v6, "code") != 4)
  {
    v20 = objc_msgSend(v6, "code");

    if (v20 == 260)
      goto LABEL_25;
LABEL_24:
    objc_msgSend(*(id *)(a1 + 32), "_logError:forOperation:", v6, CFSTR("getting listing of cached JS files for invalidation"));
    goto LABEL_25;
  }

LABEL_21:
LABEL_25:

}

- (void)_createCacheDirectoriesIfNeeded
{
  NSObject *v3;
  _QWORD block[5];

  -[SUUIBootstrapScriptFallback queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__SUUIBootstrapScriptFallback__createCacheDirectoriesIfNeeded__block_invoke;
  block[3] = &unk_2511F47C0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __62__SUUIBootstrapScriptFallback__createCacheDirectoriesIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cacheFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v4 = objc_msgSend(v2, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v6);
  v5 = v6;

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_logError:forOperation:", v5, CFSTR("creating cache directory structure"));

}

- (int64_t)_unsynchronizedState
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  int64_t v13;
  id v15;
  id v16;

  -[SUUIBootstrapScriptFallback queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUUIBootstrapScriptFallback cachedFileLocation](self, "cachedFileLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v5 = *MEMORY[0x24BDBCBE0];
  v15 = 0;
  v6 = objc_msgSend(v4, "getResourceValue:forKey:error:", &v16, v5, &v15);
  v7 = v16;
  v8 = v15;

  if (v6)
  {
    -[SUUIBootstrapScriptFallback cachedFileLocation](self, "cachedFileLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeCachedResourceValueForKey:", v5);

    objc_msgSend(v7, "timeIntervalSinceNow");
    v11 = fabs(v10);
    -[SUUIBootstrapScriptFallback maximumAge](self, "maximumAge");
    if (v11 <= v12)
      v13 = 0;
    else
      v13 = -1;
  }
  else
  {
    v13 = -2;
  }

  return v13;
}

- (void)_logError:(id)a3 forOperation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  objc_msgSend(v7, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    v9 &= 2u;
  if (!v9)
    goto LABEL_9;
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v14 = 138412802;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = 2112;
  v17 = v6;
  v18 = 2112;
  v19 = v5;
  LODWORD(v13) = 32;
  v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, &v14, v13);
    v10 = objc_claimAutoreleasedReturnValue();
    free(v12);
    SSFileLog();
LABEL_9:

  }
}

- (void)_runWhenBackgroundWorkFinished:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;

  v4 = a3;
  -[SUUIBootstrapScriptFallback queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[SUUIBootstrapScriptFallback queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_barrier_async(v6, v4);

}

- (BOOL)_setCacheAge:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  id *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  -[SUUIBootstrapScriptFallback queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[SUUIBootstrapScriptFallback queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__SUUIBootstrapScriptFallback__setCacheAge_error___block_invoke;
  v11[3] = &unk_2511F9950;
  v11[4] = self;
  v12 = v6;
  v13 = &v15;
  v14 = a4;
  v9 = v6;
  dispatch_sync(v8, v11);

  LOBYTE(self) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return (char)self;
}

void __50__SUUIBootstrapScriptFallback__setCacheAge_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "cachedFileLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *MEMORY[0x24BDBCBE0];
  v7 = 0;
  v5 = objc_msgSend(v2, "setResourceValue:forKey:error:", v3, v4, &v7);
  v6 = v7;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) && *(_QWORD *)(a1 + 56))
    **(_QWORD **)(a1 + 56) = objc_retainAutorelease(v6);

}

- (NSURL)cacheFolder
{
  return self->_cacheFolder;
}

- (NSString)cacheFilename
{
  return self->_cacheFilename;
}

- (double)maximumAge
{
  return self->_maximumAge;
}

- (void)setMaximumAge:(double)a3
{
  self->_maximumAge = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cacheFilename, 0);
  objc_storeStrong((id *)&self->_cacheFolder, 0);
}

@end
