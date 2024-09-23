@implementation SCNSceneSource

- (SCNSceneSource)initWithData:(NSData *)data options:(NSDictionary *)options
{
  SCNSceneSource *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCNSceneSource;
  v6 = -[SCNSceneSource init](&v8, sel_init);
  if (v6)
  {
    v6->_sceneSourceOptions = options;
    v6->_sceneSource = (__C3DSceneSource *)C3DSceneSourceCreateWithData(data);
  }
  return v6;
}

+ (BOOL)_shouldCacheWithOptions:(id)a3
{
  return objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("kSceneSourceCacheScenesByURLKey")), "BOOLValue");
}

- (id)sceneSourceOptions
{
  return self->_sceneSourceOptions;
}

+ (id)_cachedSceneSourceForURL:(id)a3 options:(id)a4
{
  void *v7;
  id v8;

  objc_sync_enter(a1);
  if (a3)
  {
    if (!objc_msgSend(a1, "_shouldCacheWithOptions:", a4)
      || (v7 = (void *)objc_msgSend((id)_sceneSourceCache, "objectForKey:", a3), (a3 = v7) == 0)
      || (v8 = (id)objc_msgSend(v7, "sceneSourceOptions"), v8 != a4)
      && (!a4 || (objc_msgSend(v8, "isEqualToDictionary:", a4) & 1) == 0))
    {
      a3 = 0;
    }
  }
  objc_sync_exit(a1);
  return a3;
}

+ (void)_cacheSceneSource:(id)a3 forURL:(id)a4 options:(id)a5
{
  void *v9;

  objc_sync_enter(a1);
  if (objc_msgSend(a1, "_shouldCacheWithOptions:", a5))
  {
    v9 = (void *)_sceneSourceCache;
    if (!_sceneSourceCache)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0x10000, 5, 32);
      _sceneSourceCache = (uint64_t)v9;
    }
    objc_msgSend(v9, "setObject:forKey:", a3, a4);
  }
  objc_sync_exit(a1);
}

+ (void)_removeCachedSceneSourceIfNeededForURL:(id)a3
{
  objc_sync_enter(a1);
  if (a3)
    objc_msgSend((id)_sceneSourceCache, "removeObjectForKey:", a3);
  objc_sync_exit(a1);
}

- (SCNSceneSource)initWithURL:(NSURL *)url options:(NSDictionary *)options
{
  uint64_t v7;
  SCNSceneSource *v9;
  id v10;
  objc_super v11;

  v7 = objc_msgSend((id)objc_opt_class(), "_cachedSceneSourceForURL:options:", url, options);
  if (v7)
  {
    v10 = (id)v7;

    return (SCNSceneSource *)v10;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SCNSceneSource;
    v9 = -[SCNSceneSource init](&v11, sel_init);
    if (v9)
    {
      v9->_sceneSourceOptions = options;
      v9->_sceneSource = (__C3DSceneSource *)C3DSceneSourceCreateWithURL(url);
      objc_msgSend((id)objc_opt_class(), "_cacheSceneSource:forURL:options:", v9, url, options);
    }
    return v9;
  }
}

- (void)dealloc
{
  __C3DScene *lastLoadedScene;
  objc_super v4;

  if (self->_sceneSource)
  {
    objc_msgSend((id)objc_opt_class(), "_removeCachedSceneSourceIfNeededForURL:", -[SCNSceneSource url](self, "url"));
    CFRelease(self->_sceneSource);
  }
  lastLoadedScene = self->_lastLoadedScene;
  if (lastLoadedScene)
    CFRelease(lastLoadedScene);
  v4.receiver = self;
  v4.super_class = (Class)SCNSceneSource;
  -[SCNSceneSource dealloc](&v4, sel_dealloc);
}

+ (SCNSceneSource)sceneSourceWithURL:(NSURL *)url options:(NSDictionary *)options
{
  if (url)
    return (SCNSceneSource *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithURL:options:", url, options);
  NSLog(CFSTR("[SCNSceneSource scenesSourceWithURL:] nil URL"), a2, 0, options);
  return 0;
}

+ (SCNSceneSource)sceneSourceWithData:(NSData *)data options:(NSDictionary *)options
{
  return (SCNSceneSource *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithData:options:", data, options);
}

- (NSURL)url
{
  return (NSURL *)C3DSceneSourceGetURL((uint64_t)self->_sceneSource);
}

- (NSData)data
{
  return (NSData *)C3DSceneSourceGetData((uint64_t)self->_sceneSource);
}

- (int64_t)sceneCount
{
  return C3DSceneSourceGetSceneCount();
}

- (NSString)description
{
  NSURL *v3;
  void *v4;
  objc_class *v5;
  NSString *v6;
  uint64_t v8;

  v3 = -[SCNSceneSource url](self, "url");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  if (v3)
    return (NSString *)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p | URL='%@'>"), v6, self, -[SCNSceneSource url](self, "url"));
  else
    return (NSString *)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p>"), v6, self, v8);
}

- (id)sceneAtIndex:(unint64_t)a3 options:(id)a4
{
  void *v6;

  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a4);
  objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3), CFSTR("kSceneSourceSceneIndexKey"));
  return -[SCNSceneSource sceneWithOptions:error:](self, "sceneWithOptions:error:", v6, 0);
}

- (id)sceneAtIndex:(unint64_t)a3 options:(id)a4 error:(id *)a5
{
  void *v8;

  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a4);
  objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3), CFSTR("kSceneSourceSceneIndexKey"));
  return -[SCNSceneSource sceneWithOptions:error:](self, "sceneWithOptions:error:", v8, a5);
}

- (__C3DScene)_createSceneRefWithOptions:(id)a3 statusHandler:(id)a4
{
  NSDictionary *v5;
  uint64_t v7;
  NSURL *v8;
  NSURL *v9;
  NSDictionary *v10;
  uint64_t v11;
  SCNScene *MDLAssetWithURL;
  __C3DScene *v13;
  __C3DScene *SceneAtIndex;
  __C3DScene *lastLoadedScene;
  int v16;
  __C3DScene *v17;
  NSDictionary *lastOptions;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, int, CFErrorRef, uint64_t, float);
  void *v23;
  NSURL *v24;
  id v25;

  v5 = (NSDictionary *)a3;
  if (a3 && objc_msgSend(a3, "objectForKey:", CFSTR("kSceneSourceSceneIndexKey")))
    v7 = objc_msgSend(-[NSDictionary objectForKey:](v5, "objectForKey:", CFSTR("kSceneSourceSceneIndexKey")), "unsignedIntegerValue");
  else
    v7 = 0;
  v8 = -[SCNSceneSource url](self, "url");
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __59__SCNSceneSource__createSceneRefWithOptions_statusHandler___block_invoke;
  v23 = &unk_1EA5A2950;
  v24 = v8;
  v25 = a4;
  if (v8)
  {
    v9 = v8;
    if (!-[NSString isEqualToString:](-[NSString lowercaseString](-[NSURL pathExtension](v8, "pathExtension", v20, v21, v22, v23, v24, v25), "lowercaseString"), "isEqualToString:", CFSTR("dae"))|| objc_msgSend(-[NSDictionary valueForKey:](v5, "valueForKey:", CFSTR("SCNSceneSourceUseModelIOToLoadDAEFiles")), "BOOLValue"))
    {
      if (objc_msgSend(MEMORY[0x1E0CC7780], "canImportFileExtension:", -[NSURL pathExtension](v9, "pathExtension")))
      {
        if (objc_msgSend(-[NSDictionary valueForKey:](v5, "valueForKey:", CFSTR("triggerOptionsForRealtimeViewer")), "BOOLValue"))
        {
          if (v5)
            v10 = (NSDictionary *)(id)-[NSDictionary mutableCopy](v5, "mutableCopy");
          else
            v10 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v5 = v10;
          v11 = MEMORY[0x1E0C9AAB0];
          -[NSDictionary setValue:forKey:](v10, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("kSceneSourceCreateCameraIfAbsent"));
          -[NSDictionary setValue:forKey:](v5, "setValue:forKey:", v11, CFSTR("kSceneSourceCreateNormalsIfAbsent"));
          -[NSDictionary setValue:forKey:](v5, "setValue:forKey:", v11, CFSTR("kSceneSourceCreateLightIfAbsent"));
          -[NSDictionary setValue:forKey:](v5, "setValue:forKey:", v11, CFSTR("kSceneSourceAdjustInvalidClippingPlanes"));
          -[NSDictionary setValue:forKey:](v5, "setValue:forKey:", v11, CFSTR("kSceneSourceFlattenScene"));
          -[NSDictionary setValue:forKey:](v5, "setValue:forKey:", v11, 0x1EA5A5940);
          -[NSDictionary setValue:forKey:](v5, "setValue:forKey:", CFSTR("playUsingSceneTime"), CFSTR("kSceneSourceAnimationLoadingMode"));
        }
        +[SCNTransaction begin](SCNTransaction, "begin");
        +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
        MDLAssetWithURL = loadMDLAssetWithURL(v9, v5);
        v13 = -[SCNScene sceneRef](MDLAssetWithURL, "sceneRef");
        if (v13)
        {
          SceneAtIndex = v13;
          CFRetain(v13);
          -[SCNScene _clearSceneRef](MDLAssetWithURL, "_clearSceneRef");
          +[SCNTransaction commit](SCNTransaction, "commit");
          +[SCNTransaction flush](SCNTransaction, "flush");
          C3DIOFinalizeLoadScene((uint64_t)SceneAtIndex, 0, (const __CFDictionary *)v5, 0, -1);
          -[SCNNode _syncObjCModelAfterC3DIOSceneLoadingWithNodeRef:](-[SCNScene rootNode](MDLAssetWithURL, "rootNode"), "_syncObjCModelAfterC3DIOSceneLoadingWithNodeRef:", C3DSceneGetRootNode((uint64_t)SceneAtIndex));
          if (v7)
            goto LABEL_21;
          goto LABEL_19;
        }
        -[SCNScene _clearSceneRef](MDLAssetWithURL, "_clearSceneRef");
        +[SCNTransaction commit](SCNTransaction, "commit");
      }
    }
  }
  SceneAtIndex = (__C3DScene *)C3DSceneSourceCreateSceneAtIndex(self->_sceneSource, v7, (const __CFDictionary *)v5, (uint64_t)&v20);
  if (v7)
    goto LABEL_21;
LABEL_19:
  if (SceneAtIndex)
    self->_sceneLoaded = 1;
LABEL_21:
  lastLoadedScene = self->_lastLoadedScene;
  if (lastLoadedScene != SceneAtIndex)
  {
    if (lastLoadedScene)
      CFRelease(lastLoadedScene);
    self->_lastLoadedScene = SceneAtIndex;
    if (SceneAtIndex)
    {
      v16 = objc_msgSend((id)objc_opt_class(), "_shouldCacheWithOptions:", v5);
      v17 = self->_lastLoadedScene;
      if (v16)
        self->_lastLoadedScene = (__C3DScene *)C3DSceneCreateCopy((uint64_t)v17);
      else
        CFRetain(v17);
    }
  }
  lastOptions = self->_lastOptions;
  if (lastOptions != v5)
  {

    self->_lastOptions = v5;
  }
  return SceneAtIndex;
}

uint64_t __59__SCNSceneSource__createSceneRefWithOptions_statusHandler___block_invoke(uint64_t a1, int a2, CFErrorRef err, uint64_t a4, float a5)
{
  __CFError *v9;
  CFErrorDomain Domain;
  void *v12;
  const __CFString *v13;
  CFIndex Code;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  CFErrorDomain v19;
  const __CFString *v20;
  const __CFDictionary *v21;
  uint64_t v22;
  __CFError *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  NSObject *v30;
  uint64_t result;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  if (a2 != -1)
    goto LABEL_2;
  if (!err)
  {
    v32 = *MEMORY[0x1E0CB2D50];
    v33[0] = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "localizedStringForKey:value:table:", CFSTR("Failed to retrieve scene from XPC service."), &stru_1EA5A6480, 0);
    v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = CFSTR("SCNKitErrorDomain");
    v18 = 0;
LABEL_24:
    v23 = (__CFError *)objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, v18, v15);
    goto LABEL_25;
  }
  Domain = CFErrorGetDomain(err);
  if (CFEqual(Domain, (CFTypeRef)*MEMORY[0x1E0C9AFD0]))
  {
    if (!*(_QWORD *)(a1 + 32))
    {
LABEL_2:
      v9 = 0;
      goto LABEL_26;
    }
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = (const __CFString *)*MEMORY[0x1E0CB2FE0];
    Code = CFErrorGetCode(err);
    v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB3308]);
    v16 = v12;
    v17 = v13;
    v18 = Code;
    goto LABEL_24;
  }
  v19 = CFErrorGetDomain(err);
  if (CFEqual(v19, CFSTR("SCNKitErrorDomain")))
  {
    v20 = (id)CFErrorCopyRecoverySuggestion(err);
    v21 = CFErrorCopyUserInfo(err);
    if (*(_QWORD *)(a1 + 32))
      v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "localizedStringForKey:value:table:", CFSTR("The document \"%@\" could not be opened."), &stru_1EA5A6480, 0), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "path"), "lastPathComponent"));
    else
      v22 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "localizedStringForKey:value:table:", CFSTR("The document data could not be read."), &stru_1EA5A6480, 0);
    v24 = *MEMORY[0x1E0CB2D50];
    v25 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v22, *MEMORY[0x1E0CB2D50], v20, *MEMORY[0x1E0CB2D80], 0);
    v26 = v25;
    v27 = *(_QWORD *)(a1 + 32);
    if (v27)
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0CB3308]);
    v28 = -[__CFDictionary objectForKey:](v21, "objectForKey:", CFSTR("SCNDetailedErrorsKey"));
    if (v28)
      objc_msgSend(v26, "setObject:forKey:", v28, CFSTR("SCNDetailedErrorsKey"));
    v29 = CFErrorGetCode(err);
    switch(v29)
    {
      case -8:
        objc_msgSend(v26, "setObject:forKeyedSubscript:", -[__CFDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AFE0]), v24);
        v16 = (void *)MEMORY[0x1E0CB35C8];
        v17 = (const __CFString *)*MEMORY[0x1E0CB28A8];
        v18 = 4864;
        break;
      case -6:
      case -5:
      case 1:
        v16 = (void *)MEMORY[0x1E0CB35C8];
        v17 = (const __CFString *)*MEMORY[0x1E0CB28A8];
        v18 = 259;
        break;
      case -1:
        objc_msgSend(v26, "setObject:forKeyedSubscript:", -[__CFDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AFE0]), v24);
        v16 = (void *)MEMORY[0x1E0CB35C8];
        v17 = (const __CFString *)*MEMORY[0x1E0CB28A8];
        v18 = 260;
        break;
      default:
        v30 = scn_default_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          __59__SCNSceneSource__createSceneRefWithOptions_statusHandler___block_invoke_cold_1(v29, v30);
        goto LABEL_2;
    }
    v15 = (uint64_t)v26;
    goto LABEL_24;
  }
  CFRetain(err);
  v23 = err;
LABEL_25:
  v9 = v23;
LABEL_26:
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, __CFError *, uint64_t, float))(result + 16))(result, a2, v9, a4, a5);
  return result;
}

- (id)_sceneWithClass:(Class)a3 options:(id)a4 statusHandler:(id)a5
{
  id *ObjCWrapper;
  void *URL;
  void *Data;
  int v12;
  id v13;
  void *v14;
  objc_class *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  __C3DScene *lastLoadedScene;
  __C3DScene *v23;
  int v24;
  __C3DScene *v25;
  NSDictionary *lastOptions;
  __C3DScene *v27;
  __C3DScene *v28;
  void *context;
  __CFDictionary *cf;
  char v32;
  uint64_t v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  if (!-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
    return 0;
  if (!a4)
    a4 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  if (self->_lastLoadedScene && objc_msgSend(a4, "isEqual:", self->_lastOptions))
  {
    ObjCWrapper = (id *)objc_msgSend(MEMORY[0x1E0CB3710], "unarchiveObjectWithData:", objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", C3DEntityGetObjCWrapper((id *)self->_lastLoadedScene), 0, 0));
    objc_msgSend(ObjCWrapper, "setSceneSource:", self);
    return ObjCWrapper;
  }
  URL = (void *)C3DSceneSourceGetURL((uint64_t)self->_sceneSource);
  Data = (void *)C3DSceneSourceGetData((uint64_t)self->_sceneSource);
  v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(URL, "pathExtension"), "lowercaseString"), "isEqualToString:", CFSTR("scnz"));
  if ((objc_msgSend((id)objc_msgSend(a4, "valueForKey:", CFSTR("kSceneSourceFormat")), "isEqualToString:", CFSTR("scn")) & 1) != 0|| ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(URL, "pathExtension"), "lowercaseString"), "isEqualToString:", CFSTR("scn")) | v12) & 1) != 0|| (unint64_t)objc_msgSend(Data, "length") >= 7&& !strncmp((const char *)objc_msgSend(Data, "bytes"), "bplist", 6uLL))
  {
    v33 = 0;
    if (!Data)
    {
      Data = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", URL, 0, &v33);
      if (!Data)
      {
        if (a5)
        {
          v32 = 1;
          (*((void (**)(id, uint64_t, uint64_t, char *, float))a5 + 2))(a5, -1, v33, &v32, 1.0);
        }
        return 0;
      }
    }
    if (v12)
    {
      Data = (void *)objc_msgSend(Data, "scn_uncompressedDataUsingCompressionAlgorithm:", 517);
      if (!Data)
        return 0;
    }
    v13 = -[SCNKeyedUnarchiver initForReadingWithData:secure:]([SCNKeyedUnarchiver alloc], "initForReadingWithData:secure:", Data, C3DIOShouldActivateSecurityChecks((const __CFURL *)URL, (CFDictionaryRef)a4));
    v14 = v13;
    if (v13)
    {
      context = (void *)MEMORY[0x1DF0D4CF4](objc_msgSend(v13, "setDelegate:", self));
      if (URL)
      {
        cf = C3DIOCreateImportContextFromOptions((CFDictionaryRef)a4, (const __CFURL *)URL);
        objc_msgSend(v14, "setContext:", cf);
        objc_msgSend(v14, "setAssetCatalog:", +[SCNAssetCatalog assetCatalogForResourceURL:](SCNAssetCatalog, "assetCatalogForResourceURL:", URL));
        objc_msgSend(v14, "setDocumentURL:", URL);
      }
      else
      {
        cf = 0;
      }
      if ((Class)objc_opt_class() != a3)
      {
        v15 = (objc_class *)objc_opt_class();
        objc_msgSend(v14, "setClass:forClassName:", a3, NSStringFromClass(v15));
      }
      v16 = (void *)MEMORY[0x1E0C99E60];
      v34[0] = objc_opt_class();
      v34[1] = objc_opt_class();
      v17 = objc_msgSend(v16, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2));
      v18 = objc_msgSend(v14, "decodeObjectOfClasses:forKey:", v17, *MEMORY[0x1E0CB2CD0]);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = (void *)v18;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = (void *)-[objc_class scene](a3, "scene");
          objc_msgSend((id)objc_msgSend(v19, "rootNode"), "addChildNode:", v18);
        }
        else
        {
          v20 = scn_default_log();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            -[SCNSceneSource _sceneWithClass:options:statusHandler:].cold.2();
          v19 = 0;
        }
      }
      v21 = v19;
      objc_msgSend(v14, "finishDecoding");

      if (cf)
        CFRelease(cf);
      objc_autoreleasePoolPop(context);
      if (v19)
      {
        self->_sceneLoaded = 1;
        lastLoadedScene = self->_lastLoadedScene;
        if (lastLoadedScene)
          CFRelease(lastLoadedScene);
        v23 = (__C3DScene *)objc_msgSend(v19, "sceneRef");
        self->_lastLoadedScene = v23;
        if (v23)
        {
          v24 = objc_msgSend((id)objc_opt_class(), "_shouldCacheWithOptions:", a4);
          v25 = self->_lastLoadedScene;
          if (v24)
            self->_lastLoadedScene = (__C3DScene *)C3DSceneCreateCopy((uint64_t)v25);
          else
            CFRetain(v25);
        }
        lastOptions = self->_lastOptions;
        if (lastOptions != a4)
        {

          self->_lastOptions = (NSDictionary *)a4;
        }
        objc_msgSend(v19, "setSceneSource:", self);
        return v19;
      }
    }
  }
  v27 = -[SCNSceneSource _createSceneRefWithOptions:statusHandler:](self, "_createSceneRefWithOptions:statusHandler:", a4, a5);
  v28 = v27;
  if (!v27)
    return 0;
  ObjCWrapper = C3DEntityGetObjCWrapper((id *)v27);
  if (!ObjCWrapper)
    ObjCWrapper = (id *)-[objc_class sceneWithSceneRef:](a3, "sceneWithSceneRef:", v28);
  CFRelease(v28);
  objc_msgSend(ObjCWrapper, "setSceneSource:", self);
  return ObjCWrapper;
}

- (id)sceneWithClass:(Class)a3 options:(id)a4 statusHandler:(id)a5
{
  int v9;
  int v10;
  id v11;
  NSURL *v12;

  v9 = sceneWithClass_options_statusHandler__nestCounter;
  v10 = sceneWithClass_options_statusHandler__nestCounter;
  if (sceneWithClass_options_statusHandler__nestCounter <= 0)
  {
    kdebug_trace();
    v10 = sceneWithClass_options_statusHandler__nestCounter;
  }
  sceneWithClass_options_statusHandler__nestCounter = v10 + 1;
  v11 = -[SCNSceneSource _sceneWithClass:options:statusHandler:](self, "_sceneWithClass:options:statusHandler:", a3, a4, a5);
  v12 = -[SCNSceneSource url](self, "url");
  if (v12)
    objc_msgSend(v11, "_setSourceURL:", v12);
  --sceneWithClass_options_statusHandler__nestCounter;
  if (v9 <= 0)
    kdebug_trace();
  return v11;
}

- (SCNScene)sceneWithOptions:(NSDictionary *)options statusHandler:(SCNSceneSourceStatusHandler)statusHandler
{
  return (SCNScene *)-[SCNSceneSource sceneWithClass:options:statusHandler:](self, "sceneWithClass:options:statusHandler:", objc_opt_class(), options, statusHandler);
}

- (id)sceneWithClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  _QWORD v9[5];

  if (a5)
    *a5 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__SCNSceneSource_sceneWithClass_options_error___block_invoke;
  v9[3] = &__block_descriptor_40_e27_v36__0f8q12__NSError_20_B28l;
  v9[4] = a5;
  v6 = -[SCNSceneSource sceneWithClass:options:statusHandler:](self, "sceneWithClass:options:statusHandler:", a3, a4, v9);
  if (a5)
    v7 = *a5;
  return v6;
}

_QWORD *__47__SCNSceneSource_sceneWithClass_options_error___block_invoke(_QWORD *result, uint64_t a2, void *a3)
{
  _QWORD *v3;

  if (a3)
  {
    v3 = result;
    if (result[4])
    {
      result = a3;
      *(_QWORD *)v3[4] = result;
    }
  }
  return result;
}

- (SCNScene)sceneWithOptions:(NSDictionary *)options error:(NSError *)error
{
  return (SCNScene *)-[SCNSceneSource sceneWithClass:options:error:](self, "sceneWithClass:options:error:", objc_opt_class(), options, error);
}

- (id)copyPropertiesAtIndex:(int64_t)a3 options:(id)a4
{
  return C3DSceneSourceCopyPropertiesAtIndex((uint64_t)self->_sceneSource, a3);
}

- (id)propertyForKey:(NSString *)key
{
  uint64_t Library;
  uint64_t v6;
  void *TypeID;
  uint64_t v8;
  _QWORD *MemoryUsageForKind;
  id v11;
  void *v12;
  id v13;

  if (!self->_sceneLoaded)
    -[SCNSceneSource sceneWithOptions:error:](self, "sceneWithOptions:error:", self->_sceneSourceOptions, 0);
  if (-[NSString isEqualToString:](key, "isEqualToString:", CFSTR("geometryMemory")))
  {
    Library = C3DSceneSourceGetLibrary((uint64_t)self->_sceneSource);
    if (Library)
    {
      v6 = Library;
      TypeID = (void *)C3DGeometryGetTypeID();
LABEL_9:
      MemoryUsageForKind = C3DLibraryGetMemoryUsageForKind(v6, TypeID);
      return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", MemoryUsageForKind);
    }
    goto LABEL_10;
  }
  if (-[NSString isEqualToString:](key, "isEqualToString:", CFSTR("textureMemory")))
  {
    v8 = C3DSceneSourceGetLibrary((uint64_t)self->_sceneSource);
    if (v8)
    {
      v6 = v8;
      TypeID = (void *)C3DImageGetTypeID();
      goto LABEL_9;
    }
LABEL_10:
    MemoryUsageForKind = 0;
    return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", MemoryUsageForKind);
  }
  v11 = -[SCNSceneSource copyPropertiesAtIndex:options:](self, "copyPropertiesAtIndex:options:", 0, 0);
  v12 = (void *)objc_msgSend(v11, "objectForKey:", key);
  v13 = v11;
  return v12;
}

- (__C3DSceneSource)sceneSourceRef
{
  return self->_sceneSource;
}

- (__C3DLibrary)library
{
  __C3DLibrary *result;

  result = (__C3DLibrary *)self->_sceneSource;
  if (result)
    return (__C3DLibrary *)C3DSceneSourceGetLibrary((uint64_t)result);
  return result;
}

- (id)c3dDataRepresentation
{
  __C3DScene *lastLoadedScene;
  __C3DLibrary *v4;
  uint64_t v5;
  __CFDictionary *v6;
  __CFDictionary *v7;
  CFDataRef Data;

  if (!self->_sceneLoaded)
    -[SCNSceneSource sceneWithOptions:error:](self, "sceneWithOptions:error:", self->_sceneSourceOptions, 0);
  lastLoadedScene = self->_lastLoadedScene;
  v4 = -[SCNSceneSource library](self, "library");
  v6 = C3DCreatePropertyListFromScene(lastLoadedScene, v4, MEMORY[0x1E0C9AA70], v5);
  if (v6)
  {
    v7 = v6;
    Data = CFPropertyListCreateData(0, v6, kCFPropertyListBinaryFormat_v1_0, 0, 0);
    CFRelease(v7);
  }
  else
  {
    Data = 0;
  }
  return Data;
}

- (id)entryWithIdentifier:(NSString *)uid withClass:(Class)entryClass
{
  __C3DSceneSource *sceneSource;
  uint64_t Library;
  const __CFDictionary *EntryWithDocumentID;
  id *v10;
  CFTypeID v11;
  void *URL;
  BOOL v13;
  SCNGeometry *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t TypeID;
  __n128 *v19;
  id *v20;
  __n128 *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  SCNScene *v29;
  SCNNode *v30;
  _QWORD *v31;
  NSObject *v32;
  NSObject *v33;
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];

  if (!self->_sceneLoaded)
    -[SCNSceneSource sceneWithOptions:error:](self, "sceneWithOptions:error:", self->_sceneSourceOptions, 0);
  sceneSource = self->_sceneSource;
  if (!sceneSource)
    return 0;
  Library = C3DSceneSourceGetLibrary((uint64_t)sceneSource);
  if (!Library)
    return 0;
  EntryWithDocumentID = C3DLibraryGetEntryWithDocumentID(Library, uid);
  if (!EntryWithDocumentID)
    return 0;
  v10 = (id *)EntryWithDocumentID;
  v11 = CFGetTypeID(EntryWithDocumentID);
  if ((Class)objc_opt_class() == entryClass)
  {
    if (v11 != C3DGeometryGetTypeID())
    {
      v15 = scn_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[SCNSceneSource entryWithIdentifier:withClass:].cold.1();
      return 0;
    }
    v13 = C3DEntityGetObjCWrapper(v10) != 0;
    v14 = +[SCNGeometry geometryWithGeometryRef:](SCNGeometry, "geometryWithGeometryRef:", v10);
    goto LABEL_70;
  }
  if ((Class)objc_opt_class() == entryClass)
  {
    if (v11 != C3DMaterialGetTypeID())
    {
      v16 = scn_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[SCNSceneSource entryWithIdentifier:withClass:].cold.2();
      return 0;
    }
    v13 = C3DEntityGetObjCWrapper(v10) != 0;
    v14 = +[SCNMaterial materialWithMaterialRef:](SCNMaterial, "materialWithMaterialRef:", v10);
    goto LABEL_70;
  }
  if ((Class)objc_opt_class() != entryClass)
  {
    if ((Class)objc_opt_class() != entryClass)
    {
      if ((Class)objc_opt_class() == entryClass)
      {
        if (v11 != C3DNodeGetTypeID())
        {
          v22 = scn_default_log();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            -[SCNSceneSource entryWithIdentifier:withClass:].cold.5();
          return 0;
        }
        v13 = C3DEntityGetObjCWrapper(v10) != 0;
        v14 = +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:", v10);
      }
      else if ((Class)objc_opt_class() == entryClass)
      {
        if (v11 != C3DLightGetTypeID())
        {
          v24 = scn_default_log();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            -[SCNSceneSource entryWithIdentifier:withClass:].cold.6();
          return 0;
        }
        v13 = C3DEntityGetObjCWrapper(v10) != 0;
        v14 = +[SCNLight lightWithLightRef:](SCNLight, "lightWithLightRef:", v10);
      }
      else if ((Class)objc_opt_class() == entryClass)
      {
        if (v11 != C3DCameraGetTypeID())
        {
          v26 = scn_default_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            -[SCNSceneSource entryWithIdentifier:withClass:].cold.7();
          return 0;
        }
        v13 = C3DEntityGetObjCWrapper(v10) != 0;
        v14 = +[SCNCamera cameraWithCameraRef:](SCNCamera, "cameraWithCameraRef:", v10);
      }
      else if ((Class)objc_opt_class() == entryClass)
      {
        if (v11 != C3DSceneGetTypeID())
        {
          v27 = scn_default_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            -[SCNSceneSource entryWithIdentifier:withClass:].cold.8();
          return 0;
        }
        v13 = C3DEntityGetObjCWrapper(v10) != 0;
        v14 = +[SCNScene sceneWithSceneRef:](SCNScene, "sceneWithSceneRef:", v10);
      }
      else if ((Class)objc_opt_class() == entryClass)
      {
        if (v11 != C3DSkinnerGetTypeID())
        {
          v28 = scn_default_log();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            -[SCNSceneSource entryWithIdentifier:withClass:].cold.9();
          return 0;
        }
        v13 = C3DEntityGetObjCWrapper(v10) != 0;
        v14 = +[SCNSkinner skinnerWithSkinnerRef:](SCNSkinner, "skinnerWithSkinnerRef:", v10);
      }
      else if ((Class)objc_opt_class() == entryClass)
      {
        if (v11 != C3DMorphGetTypeID())
        {
          v32 = scn_default_log();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            -[SCNSceneSource entryWithIdentifier:withClass:].cold.10();
          return 0;
        }
        v13 = C3DEntityGetObjCWrapper(v10) != 0;
        v14 = +[SCNMorpher morpherWithMorphRef:](SCNMorpher, "morpherWithMorphRef:", v10);
      }
      else
      {
        if ((Class)objc_opt_class() != entryClass)
        {
          if ((Class)objc_opt_class() == entryClass && v11 == C3DImageGetTypeID())
          {
            URL = (void *)C3DImageGetURL((uint64_t)v10);
            v13 = 0;
            goto LABEL_71;
          }
          return 0;
        }
        if (v11 != C3DImageGetTypeID())
        {
          v33 = scn_default_log();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            -[SCNSceneSource entryWithIdentifier:withClass:].cold.11();
          return 0;
        }
        v13 = C3DEntityGetObjCWrapper(v10) != 0;
        v14 = (SCNGeometry *)+[SCNMaterialProperty copyImageFromC3DImage:](SCNMaterialProperty, "copyImageFromC3DImage:", v10);
      }
LABEL_70:
      URL = v14;
      goto LABEL_71;
    }
    if (v11 == C3DKeyframedAnimationGetTypeID()
      || v11 == C3DAnimationGroupGetTypeID()
      || v11 == C3DAnimationClusterGetTypeID())
    {
      v13 = C3DEntityGetObjCWrapper(v10) != 0;
      TypeID = C3DAnimationGroupGetTypeID();
      if (TypeID == CFGetTypeID(v10))
      {
        v19 = C3DAnimationClusterCreateWithAnimationGroup((uint64_t)v10);
        if (v19)
        {
          v20 = (id *)v19;
          v21 = v19;
          v10 = v20;
        }
      }
      v14 = +[SCNAnimation animationWithC3DAnimation:](SCNAnimation, "animationWithC3DAnimation:", v10);
      goto LABEL_70;
    }
    v25 = scn_default_log();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      return 0;
LABEL_51:
    -[SCNSceneSource entryWithIdentifier:withClass:].cold.3();
    return 0;
  }
  if (v11 != C3DKeyframedAnimationGetTypeID()
    && v11 != C3DAnimationGroupGetTypeID()
    && v11 != C3DAnimationClusterGetTypeID())
  {
    v23 = scn_default_log();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      return 0;
    goto LABEL_51;
  }
  v13 = C3DEntityGetObjCWrapper(v10) != 0;
  URL = C3DAnimationToCAAnimation(v10);
  if (C3DWasLinkedBeforeMajorOSYear2014())
  {
    objc_msgSend(URL, "setUsesSceneTimeBase:", 0);
    objc_msgSend(URL, "setRemovedOnCompletion:", 1);
  }
LABEL_71:
  if (URL && !v13 && self->_lastLoadedScene)
  {
    v29 = +[SCNScene sceneWithSceneRef:](SCNScene, "sceneWithSceneRef:");
    if ((Class)objc_opt_class() == entryClass)
    {
      v30 = -[SCNScene rootNode](v29, "rootNode");
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __48__SCNSceneSource_entryWithIdentifier_withClass___block_invoke;
      v38[3] = &unk_1EA5A2998;
      v38[4] = URL;
      v31 = v38;
      goto LABEL_84;
    }
    if ((Class)objc_opt_class() == entryClass)
    {
      v30 = -[SCNScene rootNode](v29, "rootNode");
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __48__SCNSceneSource_entryWithIdentifier_withClass___block_invoke_2;
      v37[3] = &unk_1EA5A2998;
      v37[4] = URL;
      v31 = v37;
      goto LABEL_84;
    }
    if ((Class)objc_opt_class() == entryClass)
    {
      v30 = -[SCNScene rootNode](v29, "rootNode");
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __48__SCNSceneSource_entryWithIdentifier_withClass___block_invoke_3;
      v36[3] = &unk_1EA5A2998;
      v36[4] = URL;
      v31 = v36;
      goto LABEL_84;
    }
    if ((Class)objc_opt_class() == entryClass)
    {
      v30 = -[SCNScene rootNode](v29, "rootNode");
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __48__SCNSceneSource_entryWithIdentifier_withClass___block_invoke_4;
      v35[3] = &unk_1EA5A2998;
      v35[4] = URL;
      v31 = v35;
      goto LABEL_84;
    }
    if ((Class)objc_opt_class() == entryClass)
    {
      v30 = -[SCNScene rootNode](v29, "rootNode");
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __48__SCNSceneSource_entryWithIdentifier_withClass___block_invoke_5;
      v34[3] = &unk_1EA5A2998;
      v34[4] = URL;
      v31 = v34;
LABEL_84:
      -[SCNNode childNodesPassingTest:](v30, "childNodesPassingTest:", v31);
    }
  }
  return URL;
}

uint64_t __48__SCNSceneSource_entryWithIdentifier_withClass___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  if (objc_msgSend(a2, "light") == *(_QWORD *)(a1 + 32))
    *a3 = 1;
  return 0;
}

uint64_t __48__SCNSceneSource_entryWithIdentifier_withClass___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  if (objc_msgSend(a2, "camera") == *(_QWORD *)(a1 + 32))
    *a3 = 1;
  return 0;
}

uint64_t __48__SCNSceneSource_entryWithIdentifier_withClass___block_invoke_3(uint64_t a1, void *a2, _BYTE *a3)
{
  if (objc_msgSend(a2, "geometry") == *(_QWORD *)(a1 + 32))
    *a3 = 1;
  return 0;
}

uint64_t __48__SCNSceneSource_entryWithIdentifier_withClass___block_invoke_4(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  if (*(_QWORD *)(a1 + 32) == a2)
    *a3 = 1;
  return 0;
}

uint64_t __48__SCNSceneSource_entryWithIdentifier_withClass___block_invoke_5(uint64_t a1, void *a2, _BYTE *a3)
{
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "geometry"), "materials"), "containsObject:", *(_QWORD *)(a1 + 32)))*a3 = 1;
  return 0;
}

- (NSArray)identifiersOfEntriesWithClass:(Class)entryClass
{
  NSArray *v5;
  NSObject *v6;
  void *v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  __C3DSceneSource *sceneSource;
  uint64_t Library;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  const void **v18;
  CFIndex j;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CFIndex v26;
  _BYTE v27[128];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[3];
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if ((Class)objc_opt_class() == entryClass)
  {
    v36[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", C3DGeometryGetTypeID());
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = v36;
LABEL_17:
    v9 = 1;
    goto LABEL_18;
  }
  if ((Class)objc_opt_class() == entryClass)
  {
    v35 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", C3DMaterialGetTypeID());
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = &v35;
    goto LABEL_17;
  }
  if ((Class)objc_opt_class() != entryClass && (Class)objc_opt_class() != entryClass)
  {
    if ((Class)objc_opt_class() == entryClass)
    {
      v33 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", C3DNodeGetTypeID());
      v7 = (void *)MEMORY[0x1E0C99D20];
      v8 = &v33;
    }
    else if ((Class)objc_opt_class() == entryClass)
    {
      v32 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", C3DLightGetTypeID());
      v7 = (void *)MEMORY[0x1E0C99D20];
      v8 = &v32;
    }
    else if ((Class)objc_opt_class() == entryClass)
    {
      v31 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", C3DCameraGetTypeID());
      v7 = (void *)MEMORY[0x1E0C99D20];
      v8 = &v31;
    }
    else if ((Class)objc_opt_class() == entryClass)
    {
      v30 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", C3DSceneGetTypeID());
      v7 = (void *)MEMORY[0x1E0C99D20];
      v8 = &v30;
    }
    else if ((Class)objc_opt_class() == entryClass)
    {
      v29 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", C3DMorpherGetTypeID());
      v7 = (void *)MEMORY[0x1E0C99D20];
      v8 = &v29;
    }
    else
    {
      if ((Class)objc_opt_class() != entryClass)
      {
        v6 = scn_default_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          -[SCNSceneSource identifiersOfEntriesWithClass:].cold.1();
        return (NSArray *)MEMORY[0x1E0C9AA60];
      }
      v28 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", C3DSkinnerGetTypeID());
      v7 = (void *)MEMORY[0x1E0C99D20];
      v8 = &v28;
    }
    goto LABEL_17;
  }
  v34[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", C3DAnimationGroupGetTypeID());
  v34[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", C3DAnimationClusterGetTypeID());
  v34[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", C3DKeyframedAnimationGetTypeID());
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = v34;
  v9 = 3;
LABEL_18:
  v10 = (void *)objc_msgSend(v7, "arrayWithObjects:count:", v8, v9);
  if (!self->_sceneLoaded)
    -[SCNSceneSource sceneWithOptions:error:](self, "sceneWithOptions:error:", self->_sceneSourceOptions, 0);
  sceneSource = self->_sceneSource;
  if (sceneSource)
  {
    Library = C3DSceneSourceGetLibrary((uint64_t)sceneSource);
    if (Library)
    {
      v13 = Library;
      v26 = 0;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v23 != v16)
              objc_enumerationMutation(v10);
            v18 = C3DLibraryCopyIDsWithKind(v13, (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "longValue"), &v26);
            if (v26 >= 1)
            {
              for (j = 0; j < v26; ++j)
              {
                v20 = (void *)objc_msgSend((id)v18[j], "copy");
                -[NSArray addObject:](v5, "addObject:", v20);

              }
            }
            free(v18);
          }
          v15 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v15);
      }
    }
  }
  return v5;
}

- (BOOL)_appendToEntries:(id)a3 entriesWithType:(unint64_t)a4 passingTest:(id)a5 entryObjectConstructor:(id)a6
{
  uint64_t Library;
  const void **v11;
  CFIndex i;
  void *v13;
  const __CFDictionary *EntryWithDocumentID;
  void *v15;
  uint64_t v16;
  BOOL v17;
  char v19;
  CFIndex v20;

  Library = C3DSceneSourceGetLibrary((uint64_t)self->_sceneSource);
  v20 = 0;
  v11 = C3DLibraryCopyIDsWithKind(Library, (void *)a4, &v20);
  v19 = 0;
  if (v20 < 1)
  {
    v17 = 0;
  }
  else
  {
    for (i = 0; i < v20; ++i)
    {
      v13 = (void *)v11[i];
      EntryWithDocumentID = C3DLibraryGetEntryWithDocumentID(Library, v13);
      v15 = (void *)objc_msgSend(v13, "copy");
      v16 = (*((uint64_t (**)(id, const __CFDictionary *))a6 + 2))(a6, EntryWithDocumentID);
      if ((*((unsigned int (**)(id, uint64_t, void *, char *))a5 + 2))(a5, v16, v15, &v19))
        objc_msgSend(a3, "addObject:", v16);

      if (v19)
        break;
    }
    v17 = v19 != 0;
  }
  free(v11);
  return v17;
}

- (NSArray)entriesPassingTest:(void *)predicate
{
  NSArray *v5;
  __C3DSceneSource *sceneSource;

  v5 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (!self->_sceneLoaded)
    -[SCNSceneSource sceneWithOptions:error:](self, "sceneWithOptions:error:", self->_sceneSourceOptions, 0);
  sceneSource = self->_sceneSource;
  if (sceneSource
    && C3DSceneSourceGetLibrary((uint64_t)sceneSource)
    && !-[SCNSceneSource _appendToEntries:entriesWithType:passingTest:entryObjectConstructor:](self, "_appendToEntries:entriesWithType:passingTest:entryObjectConstructor:", v5, C3DGeometryGetTypeID(), predicate, &__block_literal_global_76)&& !-[SCNSceneSource _appendToEntries:entriesWithType:passingTest:entryObjectConstructor:](self, "_appendToEntries:entriesWithType:passingTest:entryObjectConstructor:", v5, C3DMaterialGetTypeID(), predicate, &__block_literal_global_162_0)&& !-[SCNSceneSource _appendToEntries:entriesWithType:passingTest:entryObjectConstructor:](self, "_appendToEntries:entriesWithType:passingTest:entryObjectConstructor:", v5, C3DAnimationGroupGetTypeID(), predicate,
          &__block_literal_global_163)
    && !-[SCNSceneSource _appendToEntries:entriesWithType:passingTest:entryObjectConstructor:](self, "_appendToEntries:entriesWithType:passingTest:entryObjectConstructor:", v5, C3DAnimationClusterGetTypeID(), predicate, &__block_literal_global_164)&& !-[SCNSceneSource _appendToEntries:entriesWithType:passingTest:entryObjectConstructor:](self, "_appendToEntries:entriesWithType:passingTest:entryObjectConstructor:", v5, C3DNodeGetTypeID(), predicate, &__block_literal_global_165)&& !-[SCNSceneSource _appendToEntries:entriesWithType:passingTest:entryObjectConstructor:](self, "_appendToEntries:entriesWithType:passingTest:entryObjectConstructor:", v5, C3DLightGetTypeID(), predicate,
          &__block_literal_global_166_0)
    && !-[SCNSceneSource _appendToEntries:entriesWithType:passingTest:entryObjectConstructor:](self, "_appendToEntries:entriesWithType:passingTest:entryObjectConstructor:", v5, C3DCameraGetTypeID(), predicate, &__block_literal_global_167_0)&& !-[SCNSceneSource _appendToEntries:entriesWithType:passingTest:entryObjectConstructor:](self, "_appendToEntries:entriesWithType:passingTest:entryObjectConstructor:", v5, C3DSceneGetTypeID(), predicate, &__block_literal_global_168)&& !-[SCNSceneSource _appendToEntries:entriesWithType:passingTest:entryObjectConstructor:](self, "_appendToEntries:entriesWithType:passingTest:entryObjectConstructor:", v5, C3DSkinnerGetTypeID(), predicate,
          &__block_literal_global_169))
  {
    -[SCNSceneSource _appendToEntries:entriesWithType:passingTest:entryObjectConstructor:](self, "_appendToEntries:entriesWithType:passingTest:entryObjectConstructor:", v5, C3DMorphGetTypeID(), predicate, &__block_literal_global_170_0);
  }
  return v5;
}

SCNGeometry *__37__SCNSceneSource_entriesPassingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SCNGeometry geometryWithGeometryRef:](SCNGeometry, "geometryWithGeometryRef:", a2);
}

SCNMaterial *__37__SCNSceneSource_entriesPassingTest___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[SCNMaterial materialWithMaterialRef:](SCNMaterial, "materialWithMaterialRef:", a2);
}

id __37__SCNSceneSource_entriesPassingTest___block_invoke_3(uint64_t a1, const void *a2)
{
  return C3DAnimationToCAAnimation(a2);
}

id __37__SCNSceneSource_entriesPassingTest___block_invoke_4(uint64_t a1, const void *a2)
{
  return C3DAnimationToCAAnimation(a2);
}

SCNNode *__37__SCNSceneSource_entriesPassingTest___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:", a2);
}

SCNLight *__37__SCNSceneSource_entriesPassingTest___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return +[SCNLight lightWithLightRef:](SCNLight, "lightWithLightRef:", a2);
}

SCNCamera *__37__SCNSceneSource_entriesPassingTest___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return +[SCNCamera cameraWithCameraRef:](SCNCamera, "cameraWithCameraRef:", a2);
}

SCNScene *__37__SCNSceneSource_entriesPassingTest___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return +[SCNScene sceneWithSceneRef:](SCNScene, "sceneWithSceneRef:", a2);
}

SCNSkinner *__37__SCNSceneSource_entriesPassingTest___block_invoke_9(uint64_t a1, uint64_t a2)
{
  return +[SCNSkinner skinnerWithSkinnerRef:](SCNSkinner, "skinnerWithSkinnerRef:", a2);
}

SCNMorpher *__37__SCNSceneSource_entriesPassingTest___block_invoke_10(uint64_t a1, uint64_t a2)
{
  return +[SCNMorpher morpherWithMorphRef:](SCNMorpher, "morpherWithMorphRef:", a2);
}

- (int64_t)sourceStatus
{
  return (int)C3DSceneSourceGetStatus((uint64_t)self->_sceneSource);
}

- (BOOL)canExportToColladaWithNoDataLoss
{
  return 0;
}

+ (id)sceneTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("org.khronos.collada.digital-asset-exchange"));
}

+ (id)sceneFileTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("dae"));
}

- (id)performConsistencyCheck
{
  void *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  uint64_t v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3052000000;
  v7 = __Block_byref_object_copy__7;
  v8 = __Block_byref_object_dispose__7;
  v9 = 0;
  C3DSceneSourcePerformConsistencyCheck(self->_sceneSource);
  v2 = (void *)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

_QWORD *__41__SCNSceneSource_performConsistencyCheck__block_invoke(_QWORD *result, int a2, void *cf)
{
  _QWORD *v4;

  if (cf)
  {
    v4 = result;
    CFRetain(cf);
    result = cf;
    *(_QWORD *)(*(_QWORD *)(v4[4] + 8) + 40) = result;
  }
  return result;
}

- (Class)unarchiver:(id)a3 cannotDecodeObjectOfClassName:(id)a4 originalClasses:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = (void *)SCNGetSceneKitBundle();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (!v8)
    return 0;
  v9 = v8;
  v10 = *(_QWORD *)v30;
  while (2)
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v30 != v10)
        objc_enumerationMutation(a5);
      v12 = objc_msgSend(v7, "classNamed:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
      if (v12)
      {
        v13 = (objc_class *)v12;
        if (!objc_msgSend(a3, "requiresSecureCoding"))
          return v13;
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v14 = (void *)objc_msgSend(a3, "allowedClasses");
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v26;
          v24 = v9;
LABEL_10:
          v18 = a3;
          v19 = a5;
          v20 = v7;
          v21 = v10;
          v22 = 0;
          while (1)
          {
            if (*(_QWORD *)v26 != v17)
              objc_enumerationMutation(v14);
            if ((-[objc_class isSubclassOfClass:](v13, "isSubclassOfClass:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v22)) & 1) != 0)return v13;
            if (v16 == ++v22)
            {
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
              v10 = v21;
              v7 = v20;
              a5 = v19;
              a3 = v18;
              v9 = v24;
              if (v16)
                goto LABEL_10;
              break;
            }
          }
        }
      }
    }
    v9 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    v13 = 0;
    if (v9)
      continue;
    return v13;
  }
}

- (id)debugQuickLookObject
{
  return -[SCNScene debugQuickLookObject](-[SCNSceneSource sceneWithOptions:error:](self, "sceneWithOptions:error:", 0, 0), "debugQuickLookObject");
}

- (id)debugQuickLookData
{
  return UIImagePNGRepresentation((UIImage *)-[SCNSceneSource debugQuickLookObject](self, "debugQuickLookObject"));
}

void __59__SCNSceneSource__createSceneRefWithOptions_statusHandler___block_invoke_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Unreachable code: Unhandled SceneKit error code (%d)", (uint8_t *)v2, 8u);
}

- (void)_sceneWithClass:options:statusHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DCCB8000, v0, v1, "Error: failed to unarchive scene at %@ (%@)");
  OUTLINED_FUNCTION_1();
}

- (void)_sceneWithClass:options:statusHandler:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DCCB8000, v0, v1, "Error: failed to unarchive scene at %@ - unknown decoded object class (%@)");
  OUTLINED_FUNCTION_1();
}

- (void)_sceneWithClass:options:statusHandler:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DCCB8000, v0, v1, "Error: failed to unarchive data at %@ (%@)");
  OUTLINED_FUNCTION_1();
}

- (void)entryWithIdentifier:withClass:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: entryWithUID:withClass: object with uid %@ exists but is not a geometry", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)entryWithIdentifier:withClass:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: entryWithUID:withClass: object with uid %@ exists but is not a material", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)entryWithIdentifier:withClass:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: entryWithUID:withClass: object with uid %@ exists but is not an animation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)entryWithIdentifier:withClass:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: entryWithUID:withClass: object with uid %@ exists but is not a node", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)entryWithIdentifier:withClass:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: entryWithUID:withClass: object with uid %@ exists but is not a light", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)entryWithIdentifier:withClass:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: entryWithUID:withClass: object with uid %@ exists but is not a camera", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)entryWithIdentifier:withClass:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: entryWithUID:withClass: object with uid %@ exists but is not a scene", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)entryWithIdentifier:withClass:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: entryWithUID:withClass: object with uid %@ exists but is not a skinner", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)entryWithIdentifier:withClass:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: entryWithUID:withClass: object with uid %@ exists but is not a morpher", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)entryWithIdentifier:withClass:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: entryWithUID:withClass: object with uid %@ exists but is not an image", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)identifiersOfEntriesWithClass:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: entrieswithClass: class %@ is not a known C3D class", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
