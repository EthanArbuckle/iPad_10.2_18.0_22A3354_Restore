@implementation AVAssetDownloadSession

- (id)_common_init
{
  AVAssetDownloadSessionInternal *v3;
  NSObject *v4;

  v3 = objc_alloc_init(AVAssetDownloadSessionInternal);
  self->_internal = v3;
  if (v3)
  {
    CFRetain(v3);
    self->_internal->weakReference = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", self);
    self->_internal->delegateStorage = objc_alloc_init(AVWeakReferencingDelegateStorage);
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    self->_internal->stateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avassetdownloadsession", v4);
    self->_internal->status = 0;
    self->_internal->error = 0;
    self->_internal->priority = 0;
  }
  else
  {

    return 0;
  }
  return self;
}

- (AVAssetDownloadSession)init
{
  AVAssetDownloadSession *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetDownloadSession;
  result = -[AVAssetDownloadSession init](&v3, sel_init);
  if (result)
    return (AVAssetDownloadSession *)-[AVAssetDownloadSession _common_init](result, "_common_init");
  return result;
}

- (AVAssetDownloadSession)initWithURL:(id)a3 destinationURL:(id)a4 options:(id)a5
{
  AVAssetDownloadSession *v9;
  AVAssetDownloadSession *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  AVAssetDownloadSession *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  AVAssetDownloadSession *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  const char *v55;
  AVAssetDownloadSession *v56;
  const __CFString *v57;
  objc_class *v58;
  const char *v59;
  void *v60;
  AVAssetDownloadSession *v61;
  uint64_t v62;
  SEL v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  objc_super v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v69.receiver = self;
  v69.super_class = (Class)AVAssetDownloadSession;
  v9 = -[AVAssetDownloadSession init](&v69, sel_init);
  if (v9)
  {
    v10 = -[AVAssetDownloadSession _common_init](v9, "_common_init");
    if (a3)
      goto LABEL_3;
LABEL_55:
    v47 = v10;
    v53 = (void *)MEMORY[0x1E0C99DA0];
    v54 = *MEMORY[0x1E0C99778];
    v55 = "URL != nil";
LABEL_57:
    v62 = (uint64_t)v55;
    v57 = CFSTR("invalid parameter not satisfying: %s");
    v58 = (objc_class *)v10;
    v59 = a2;
    goto LABEL_58;
  }
  v10 = 0;
  if (!a3)
    goto LABEL_55;
LABEL_3:
  if ((objc_msgSend(a4, "isFileURL") & 1) == 0)
  {
    v56 = v10;
    v53 = (void *)MEMORY[0x1E0C99DA0];
    v54 = *MEMORY[0x1E0C99778];
    v55 = "[destinationURL isFileURL]";
    goto LABEL_57;
  }
  if (!v10)
    return v10;
  v63 = a2;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
  figAssetCreationFlagsForAssetReferenceRestrictions(2);
  v10->_internal->URL = (NSURL *)objc_msgSend(a3, "copy");
  v10->_internal->destinationURL = (NSURL *)objc_msgSend(a4, "copy");
  v12 = (void *)objc_msgSend(a5, "objectForKey:", CFSTR("AVAssetDownloadSessionPriorityKey"));
  if (v12)
    v10->_internal->priority = (int)objc_msgSend(v12, "intValue");
  v10->_internal->cachePrimingDownloadTokenNum = (NSNumber *)objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("AVAssetDownloadSessionCachePrimingDownloadTokenKey")), "copy");
  v13 = objc_msgSend(a5, "objectForKey:", CFSTR("AVAssetDownloadSessionProtectedContentSupportStorageURLKey"));
  v14 = objc_msgSend(a5, "objectForKey:", CFSTR("AVAssetDownloadSessionPurchaseBundleKey"));
  v15 = objc_msgSend(a5, "objectForKey:", CFSTR("AVAssetDownloadSessionAirPlayAuthorizationInfoKey"));
  v16 = v15;
  if (v13 || v14 || v15)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    v18 = v17;
    if (v13)
      objc_msgSend(v17, "setValue:forKey:", v13, *MEMORY[0x1E0CC33E0]);
    if (v14)
      objc_msgSend(v18, "setValue:forKey:", v14, *MEMORY[0x1E0CC33E8]);
    if (v16)
      objc_msgSend(v18, "setValue:forKey:", v16, *MEMORY[0x1E0CC33D8]);
    objc_msgSend(v11, "setObject:forKey:", v18, *MEMORY[0x1E0CC3718]);

  }
  v19 = (void *)objc_msgSend(a5, "objectForKey:", CFSTR("AVAssetDownloadSessionHTTPCookiesKey"));
  if (objc_msgSend(v19, "count"))
  {
    v20 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v19, "count"));
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v66 != v23)
            objc_enumerationMutation(v19);
          v25 = objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "properties");
          if (v25)
            objc_msgSend(v20, "addObject:", v25);
        }
        v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
      }
      while (v22);
    }
    objc_msgSend(v11, "setObject:forKey:", v20, *MEMORY[0x1E0CC3698]);
  }
  v26 = objc_msgSend(a5, "objectForKey:", CFSTR("AVAssetDownloadSessionClientAuditTokenKey"));
  if (v26)
    objc_msgSend(v11, "setObject:forKey:", v26, *MEMORY[0x1E0CC3700]);
  v27 = objc_msgSend(a5, "objectForKey:", CFSTR("AVAssetDownloadSessionClientBundleIdentifierKey"));
  if (v27)
    objc_msgSend(v11, "setObject:forKey:", v27, *MEMORY[0x1E0CC3708]);
  objc_msgSend(v11, "setObject:forKey:", v10->_internal->destinationURL, *MEMORY[0x1E0CC3760]);
  if (v10->_internal->priority == -1)
    objc_msgSend(v11, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CC3768]);
  v28 = objc_msgSend(a5, "objectForKey:", CFSTR("AVAssetDownloadSessioniTunesStoreContentInfoKey"));
  if (v28)
  {
    v29 = (void *)v28;
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
    v31 = objc_msgSend(v29, "objectForKey:", CFSTR("AVAssetDownloadSessioniTunesStoreContentIDKey"));
    v32 = objc_msgSend(v29, "objectForKey:", CFSTR("AVAssetDownloadSessioniTunesStoreContentTypeKey"));
    v33 = v10;
    v34 = v11;
    v35 = objc_msgSend(v29, "objectForKey:", CFSTR("AVAssetDownloadSessioniTunesStoreContentUserAgentKey"));
    v36 = objc_msgSend(v29, "objectForKey:", CFSTR("AVAssetDownloadSessioniTunesStoreContentDownloadParametersKey"));
    v37 = objc_msgSend(v29, "objectForKey:", CFSTR("AVAssetDownloadSessioniTunesStoreContentDSIDKey"));
    v64 = objc_msgSend(v29, "objectForKey:", CFSTR("AVAssetDownloadSessioniTunesStoreContentPurchasedMediaKindKey"));
    v38 = objc_msgSend(v29, "objectForKey:", CFSTR("AVURLAssetiTunesStoreContentRentalIDKey"));
    objc_msgSend(v30, "setValue:forKey:", v31, *MEMORY[0x1E0CC3D70]);
    objc_msgSend(v30, "setValue:forKey:", v32, *MEMORY[0x1E0CC3D88]);
    v39 = v35;
    v11 = v34;
    v10 = v33;
    objc_msgSend(v30, "setValue:forKey:", v39, *MEMORY[0x1E0CC3D90]);
    objc_msgSend(v30, "setValue:forKey:", v36, *MEMORY[0x1E0CC3D60]);
    objc_msgSend(v30, "setValue:forKey:", v37, *MEMORY[0x1E0CC3D58]);
    objc_msgSend(v30, "setValue:forKey:", v64, *MEMORY[0x1E0CC3D78]);
    objc_msgSend(v30, "setValue:forKey:", v38, *MEMORY[0x1E0CC3D80]);
    objc_msgSend(v11, "setObject:forKey:", v30, *MEMORY[0x1E0CC38C8]);

  }
  v40 = objc_msgSend(a5, "objectForKey:", CFSTR("AVAssetDownloadSessionHTTPHeaderFieldsKey"));
  if (v40)
    objc_msgSend(v11, "setObject:forKey:", v40, *MEMORY[0x1E0CC3798]);
  v41 = (void *)objc_msgSend(a5, "objectForKey:", CFSTR("AVAssetDownloadSessionMaxSizeAllowedForCellularAccessKey"));
  v42 = (void *)objc_msgSend(a5, "objectForKey:", CFSTR("AVAssetDownloadSessionAllowsCellularAccessKey"));
  if (v42)
  {
    v43 = objc_msgSend(v42, "BOOLValue");
    if (!v41 || ((v43 ^ (objc_msgSend(v41, "longLongValue") == 0)) & 1) != 0)
    {
      if ((v43 & 1) == 0)
        v41 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
      goto LABEL_43;
    }
    v61 = v10;
    v53 = (void *)MEMORY[0x1E0C99DA0];
    v54 = *MEMORY[0x1E0C99778];
    v57 = CFSTR("AVAssetDownloadSessionMaxSizeAllowedForCellularAccessKey and AVAssetDownloadSessionAllowsCellularAccessKey options are incompatible");
    v58 = (objc_class *)v10;
    v59 = v63;
LABEL_58:
    v60 = (void *)objc_msgSend(v53, "exceptionWithName:reason:userInfo:", v54, AVMethodExceptionReasonWithObjectAndSelector(v58, v59, (uint64_t)v57, v48, v49, v50, v51, v52, v62), 0);
    objc_exception_throw(v60);
  }
LABEL_43:
  if (v41)
    objc_msgSend(v11, "setObject:forKey:", v41, *MEMORY[0x1E0CC37C0]);
  if (objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("AVAssetDownloadSessionOptimizeAccessForLinearMoviePlaybackKey")), "BOOLValue"))
  {
    v44 = *MEMORY[0x1E0C9AE50];
    objc_msgSend(v11, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CC37B8]);
    objc_msgSend(v11, "setObject:forKey:", v44, *MEMORY[0x1E0CC37A8]);
    objc_msgSend(v11, "setObject:forKey:", v44, *MEMORY[0x1E0CC3860]);
    objc_msgSend(v11, "setObject:forKey:", v44, *MEMORY[0x1E0CC3738]);
    objc_msgSend(v11, "setObject:forKey:", v44, *MEMORY[0x1E0CC3740]);
  }
  v45 = objc_msgSend(a5, "objectForKey:", CFSTR("AVAssetDownloadSessionAlternativeConfigurationOptionsKey"));
  if (v45)
    objc_msgSend(v11, "setObject:forKey:", v45, *MEMORY[0x1E0CC36C8]);
  if (!v10->_internal->figAsset)
  {
    FigAssetRemoteCreateWithURL();

    v10 = 0;
    if (objc_msgSend(0, "_setFileFigAsset:options:"))
    {

      v10 = 0;
    }
  }

  return v10;
}

- (AVAssetDownloadSession)initWithDownloadToken:(unint64_t)a3
{
  AVAssetDownloadSession *v5;
  uint64_t v6;
  AVAssetDownloadSession *v7;
  AVAssetDownloadSession *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AVAssetDownloadSession;
  v5 = -[AVAssetDownloadSession init](&v16, sel_init);
  if (!v5)
  {
    v7 = 0;
    if (a3)
      return v7;
LABEL_7:
    v9 = v7;
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v7, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v10, v11, v12, v13, v14, (uint64_t)"downloadToken > 0"), 0);
    objc_exception_throw(v15);
  }
  v6 = -[AVAssetDownloadSession _common_init](v5, "_common_init");
  v7 = (AVAssetDownloadSession *)v6;
  if (!a3)
    goto LABEL_7;
  if (v6)
  {
    *(_QWORD *)(*(_QWORD *)(v6 + 8) + 120) = a3;
    FigAssetRemoteCopyAssetWithDownloadToken();

    return 0;
  }
  return v7;
}

- (AVAssetDownloadSession)initWithAsset:(id)a3 mediaSelections:(id)a4 destinationURL:(id)a5 options:(id)a6
{
  AVAssetDownloadSession *v11;
  AVAssetDownloadSession *v12;
  AVAssetDownloadSession *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  AVURLAsset *v22;
  AVAssetDownloadSession *v24;
  AVAssetDownloadSession *v25;
  void *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)AVAssetDownloadSession;
  v11 = -[AVAssetDownloadSession init](&v27, sel_init);
  if (v11)
  {
    v12 = -[AVAssetDownloadSession _common_init](v11, "_common_init");
    if (a3)
      goto LABEL_3;
  }
  else
  {
    v12 = 0;
    if (a3)
    {
LABEL_3:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v13 = v12;
        v19 = (void *)MEMORY[0x1E0C99DA0];
        v20 = *MEMORY[0x1E0C99778];
        v21 = "(asset != nil && [asset isKindOfClass:[AVURLAsset class]]) || asset == nil";
        goto LABEL_17;
      }
      goto LABEL_7;
    }
  }
  if (!objc_msgSend(a6, "objectForKeyedSubscript:", CFSTR("AVAssetDownloadTaskDownloadConfigurationKey")))
  {
    v25 = v12;
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = "asset != nil || options[AVAssetDownloadTaskDownloadConfigurationKey] != nil";
LABEL_17:
    v26 = (void *)objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v12, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v14, v15, v16, v17, v18, (uint64_t)v21), 0);
    objc_exception_throw(v26);
  }
LABEL_7:
  if (a4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v24 = v12;
      v19 = (void *)MEMORY[0x1E0C99DA0];
      v20 = *MEMORY[0x1E0C99778];
      v21 = "mediaSelections == nil || [mediaSelections isKindOfClass:[NSArray class]]";
      goto LABEL_17;
    }
  }
  if (v12)
  {
    if (a3)
      v22 = (AVURLAsset *)a3;
    else
      v22 = (AVURLAsset *)(id)objc_msgSend((id)objc_msgSend(a6, "objectForKeyedSubscript:", CFSTR("AVAssetDownloadTaskDownloadConfigurationKey")), "_asset");
    v12->_internal->asset = v22;
    v12->_internal->URL = (NSURL *)objc_msgSend((id)objc_msgSend(a3, "URL"), "copy");
    v12->_internal->destinationURL = (NSURL *)objc_msgSend(a5, "copy");
    v12->_internal->downloadToken = -[AVURLAsset downloadToken](v12->_internal->asset, "downloadToken");
    v12->_internal->mediaSelections = (NSArray *)objc_msgSend(a4, "copy");
    -[AVAssetDownloadSession _setupFigClientObjectAsync:](v12, "_setupFigClientObjectAsync:", a6);
  }
  return v12;
}

- (void)dealloc
{
  uint64_t FigBaseObject;
  uint64_t v4;
  void (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  AVAssetDownloadSessionInternal *internal;
  NSObject *stateQueue;
  OpaqueFigAsset *figAsset;
  OpaqueFigPlaybackItem *playbackItem;
  OpaqueFigPlayer *player;
  CMBaseObject *assetDownloader;
  objc_super v15;

  if (self->_internal)
  {
    -[AVAssetDownloadSession _removeFigAssetListeners](self, "_removeFigAssetListeners");
    -[AVAssetDownloadSession _removeFigPlaybackItemListeners](self, "_removeFigPlaybackItemListeners");
    -[AVAssetDownloadSession cancelAndReleaseProgressTimerOnQueue](self, "cancelAndReleaseProgressTimerOnQueue");
    if (self->_internal->playbackItem)
    {
      FigBaseObject = FigPlaybackItemGetFigBaseObject();
      if (FigBaseObject)
      {
        v4 = FigBaseObject;
        v5 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
        if (v5)
          v5(v4);
      }
    }
    if (self->_internal->player)
    {
      v6 = FigPlayerGetFigBaseObject();
      if (v6)
      {
        v7 = v6;
        v8 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
        if (v8)
          v8(v7);
      }
    }

    internal = self->_internal;
    stateQueue = internal->stateQueue;
    if (stateQueue)
    {
      dispatch_release(stateQueue);
      internal = self->_internal;
    }
    figAsset = internal->figAsset;
    if (figAsset)
    {
      CFRelease(figAsset);
      internal = self->_internal;
    }
    playbackItem = internal->playbackItem;
    if (playbackItem)
    {
      CFRelease(playbackItem);
      internal = self->_internal;
    }
    player = internal->player;
    if (player)
    {
      CFRelease(player);
      internal = self->_internal;
    }
    assetDownloader = internal->assetDownloader;
    if (assetDownloader)
    {
      CFRelease(assetDownloader);
      internal = self->_internal;
    }

    CFRelease(self->_internal);
  }
  v15.receiver = self;
  v15.super_class = (Class)AVAssetDownloadSession;
  -[AVAssetDownloadSession dealloc](&v15, sel_dealloc);
}

+ (id)assetDownloadSessionWithURL:(id)a3 destinationURL:(id)a4 options:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithURL:destinationURL:options:", a3, a4, a5);
}

+ (id)assetDownloadSessionWithDownloadToken:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDownloadToken:", a3);
}

+ (id)assetDownloadSessionWithAsset:(id)a3 destinationURL:(id)a4 options:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAsset:mediaSelections:destinationURL:options:", a3, 0, a4, a5);
}

+ (void)registerDownloadLocation:(id)a3 forURLAsset:(id)a4
{
  objc_msgSend(a4, "_figAsset");
  FigAssetDownloaderRegisterDestinationLocation();
}

+ (id)assetDownloadSessionWithAsset:(id)a3 mediaSelections:(id)a4 destinationURL:(id)a5 options:(id)a6
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAsset:mediaSelections:destinationURL:options:", a3, a4, a5, a6);
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  -[AVWeakReferencingDelegateStorage setDelegate:queue:](self->_internal->delegateStorage, "setDelegate:queue:", a3, a4);
}

- (void)start
{
  NSObject *stateQueue;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__34;
  v9 = __Block_byref_object_dispose__34;
  v10 = 0;
  -[AVAssetDownloadSession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("status"));
  stateQueue = self->_internal->stateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31__AVAssetDownloadSession_start__block_invoke;
  v4[3] = &unk_1E302FD60;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(stateQueue, v4);
  -[AVAssetDownloadSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("status"));
  if (v6[5])
    -[AVAssetDownloadSession _transitionToTerminalStatus:error:](self, "_transitionToTerminalStatus:error:", 4);
  _Block_object_dispose(&v5, 8);
}

uint64_t __31__AVAssetDownloadSession_start__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_startOnQueue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)pause
{
  NSObject *stateQueue;
  _QWORD block[5];

  -[AVAssetDownloadSession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("status"));
  stateQueue = self->_internal->stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__AVAssetDownloadSession_pause__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_sync(stateQueue, block);
  -[AVAssetDownloadSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("status"));
}

uint64_t __31__AVAssetDownloadSession_pause__block_invoke(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, _QWORD, _QWORD);

  v1 = *(_QWORD **)(*(_QWORD *)(result + 32) + 8);
  if (v1[6] == 1)
  {
    v2 = result;
    v3 = v1[18];
    if (v3)
    {
      result = CMBaseObjectGetVTable();
      v4 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(result + 16) + 16);
      if (v4)
        result = v4(v3);
    }
    else
    {
      result = v1[3];
      if (result)
      {
        FigBaseObject = FigPlaybackItemGetFigBaseObject();
        v6 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
        if (v6)
          v6(FigBaseObject, *MEMORY[0x1E0CC5128], *MEMORY[0x1E0C9AE40]);
        result = objc_msgSend(*(id *)(v2 + 32), "cancelAndReleaseProgressTimerOnQueue");
      }
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 48) = 2;
  }
  return result;
}

- (void)stop
{
  NSObject *stateQueue;
  _QWORD block[5];

  -[AVAssetDownloadSession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("status"));
  stateQueue = self->_internal->stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__AVAssetDownloadSession_stop__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_sync(stateQueue, block);
  -[AVAssetDownloadSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("status"));
}

uint64_t __30__AVAssetDownloadSession_stop__block_invoke(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, _QWORD, _QWORD);

  v1 = *(_QWORD **)(*(_QWORD *)(result + 32) + 8);
  if ((uint64_t)v1[6] <= 2)
  {
    v2 = result;
    v3 = v1[18];
    if (v3)
    {
      result = CMBaseObjectGetVTable();
      v4 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(result + 16) + 24);
      if (v4)
        result = v4(v3);
    }
    else
    {
      result = v1[3];
      if (result)
      {
        FigBaseObject = FigPlaybackItemGetFigBaseObject();
        v6 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
        if (v6)
          v6(FigBaseObject, *MEMORY[0x1E0CC5128], *MEMORY[0x1E0C9AE40]);
        result = objc_msgSend(*(id *)(v2 + 32), "cancelAndReleaseProgressTimerOnQueue");
      }
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 48) = 5;
  }
  return result;
}

- (void)startLoadingMetadata
{
  NSObject *stateQueue;
  _QWORD block[5];

  stateQueue = self->_internal->stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__AVAssetDownloadSession_startLoadingMetadata__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

uint64_t __46__AVAssetDownloadSession_startLoadingMetadata__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startLoadingMetadataOnQueue");
}

- (int64_t)status
{
  NSObject *stateQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_internal->stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__AVAssetDownloadSession_status__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__AVAssetDownloadSession_status__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 48);
  return result;
}

- (NSError)error
{
  NSObject *stateQueue;
  NSError *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__34;
  v10 = __Block_byref_object_dispose__34;
  v11 = 0;
  stateQueue = self->_internal->stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__AVAssetDownloadSession_error__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (NSError *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __31__AVAssetDownloadSession_error__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSURL)URL
{
  return self->_internal->URL;
}

- (NSURL)destinationURL
{
  return self->_internal->destinationURL;
}

- (int64_t)priority
{
  return self->_internal->priority;
}

- (unint64_t)fileSize
{
  unint64_t result;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, _QWORD, CFNumberRef *);
  int v5;
  CFNumberRef v6;
  CFNumberRef number;
  unint64_t valuePtr;

  valuePtr = 0;
  result = (unint64_t)self->_internal->playbackItem;
  if (result)
  {
    number = 0;
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v4 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFNumberRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 48);
    if (v4)
    {
      v5 = v4(FigBaseObject, *MEMORY[0x1E0CC5148], *MEMORY[0x1E0C9AE00], &number);
      v6 = number;
      if (!v5)
      {
        CFNumberGetValue(number, kCFNumberLongLongType, &valuePtr);
        v6 = number;
      }
      if (v6)
        CFRelease(v6);
    }
    return valuePtr;
  }
  return result;
}

- (unint64_t)availableFileSize
{
  unint64_t result;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, _QWORD, CFNumberRef *);
  int v5;
  CFNumberRef v6;
  CFNumberRef number;
  unint64_t valuePtr;

  valuePtr = 0;
  result = (unint64_t)self->_internal->playbackItem;
  if (result)
  {
    number = 0;
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v4 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFNumberRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 48);
    if (v4)
    {
      v5 = v4(FigBaseObject, *MEMORY[0x1E0CC5088], *MEMORY[0x1E0C9AE00], &number);
      v6 = number;
      if (!v5)
      {
        CFNumberGetValue(number, kCFNumberLongLongType, &valuePtr);
        v6 = number;
      }
      if (v6)
        CFRelease(v6);
    }
    return valuePtr;
  }
  return result;
}

- (unint64_t)countOfBytesReceived
{
  uint64_t CMBaseObject;
  uint64_t (*v3)(uint64_t, _QWORD, _QWORD, CFNumberRef *);
  int v4;
  CFNumberRef v5;
  CFNumberRef number;
  unint64_t valuePtr;

  valuePtr = 0;
  if (!self->_internal->assetDownloader)
    return -[AVAssetDownloadSession availableFileSize](self, "availableFileSize");
  number = 0;
  CMBaseObject = FigAssetDownloaderGetCMBaseObject();
  v3 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFNumberRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v3)
  {
    v4 = v3(CMBaseObject, *MEMORY[0x1E0CC34A0], *MEMORY[0x1E0C9AE00], &number);
    v5 = number;
    if (!v4)
    {
      CFNumberGetValue(number, kCFNumberLongLongType, &valuePtr);
      v5 = number;
    }
    if (v5)
      CFRelease(v5);
  }
  return valuePtr;
}

- (unint64_t)downloadToken
{
  AVAssetDownloadSessionInternal *internal;
  unint64_t result;
  uint64_t CMBaseObject;
  uint64_t (*v6)(uint64_t, _QWORD, _QWORD, CFNumberRef *);
  int v7;
  CFNumberRef v8;
  BOOL v9;
  CFNumberRef number;

  internal = self->_internal;
  result = internal->downloadToken;
  if (!result)
  {
    result = (unint64_t)internal->figAsset;
    if (result)
    {
      number = 0;
      CMBaseObject = FigAssetGetCMBaseObject();
      v6 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFNumberRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                            + 48);
      if (v6)
      {
        v7 = v6(CMBaseObject, *MEMORY[0x1E0CC39B8], *MEMORY[0x1E0C9AE00], &number);
        v8 = number;
        if (v7)
          v9 = 1;
        else
          v9 = number == 0;
        if (!v9)
        {
          CFNumberGetValue(number, kCFNumberLongLongType, &self->_internal->downloadToken);
          v8 = number;
        }
        if (v8)
          CFRelease(v8);
      }
      return self->_internal->downloadToken;
    }
  }
  return result;
}

- (NSArray)loadedTimeRanges
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (AVMediaSelection)resolvedMediaSelection
{
  return 0;
}

- (void)_sendDownloadSuccessToDelegate
{
  AVWeakReferencingDelegateStorage *delegateStorage;
  _QWORD v3[5];

  delegateStorage = self->_internal->delegateStorage;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __96__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendDownloadSuccessToDelegate__block_invoke;
  v3[3] = &unk_1E3032B48;
  v3[4] = self;
  -[AVWeakReferencingDelegateStorage invokeDelegateCallbackWithBlock:](delegateStorage, "invokeDelegateCallbackWithBlock:", v3);
}

uint64_t __96__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendDownloadSuccessToDelegate__block_invoke(uint64_t result, void *a2)
{
  uint64_t v3;

  if (a2)
  {
    v3 = result;
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(a2, "assetDownloadSessionDidFinishDownload:", *(_QWORD *)(v3 + 32));
  }
  return result;
}

- (void)_sendDownloadFailureToDelegateWithError:(id)a3
{
  AVWeakReferencingDelegateStorage *delegateStorage;
  _QWORD v4[6];

  delegateStorage = self->_internal->delegateStorage;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __106__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendDownloadFailureToDelegateWithError___block_invoke;
  v4[3] = &unk_1E3034EA0;
  v4[4] = self;
  v4[5] = a3;
  -[AVWeakReferencingDelegateStorage invokeDelegateCallbackWithBlock:](delegateStorage, "invokeDelegateCallbackWithBlock:", v4);
}

uint64_t __106__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendDownloadFailureToDelegateWithError___block_invoke(uint64_t result, void *a2)
{
  uint64_t v3;

  if (a2)
  {
    v3 = result;
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(a2, "assetDownloadSession:didFailWithError:", *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40));
  }
  return result;
}

- (void)_sendLoadedTimeRangesChangedToDelegateWithNewlyLoadedTimeRange:(id)a3 currentLoadedTimeRanges:(id)a4 timeRangeExpectedToLoad:(id)a5 selectedMediaArray:(id)a6
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFDictionary *v15;
  id v16;
  AVWeakReferencingDelegateStorage *delegateStorage;
  _QWORD v19[7];
  CMTimeRange v20;
  CMTimeRange v21;
  CMTimeRange v22;
  CMTimeRange v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CMTimeRange v28;
  CMTimeRange v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  memset(&v29, 0, sizeof(v29));
  memset(&v28, 0, sizeof(v28));
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (a3)
    CMTimeRangeMakeFromDictionary(&v29, (CFDictionaryRef)a3);
  if (a4)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(a4);
          v15 = *(const __CFDictionary **)(*((_QWORD *)&v24 + 1) + 8 * v14);
          memset(&v23, 0, sizeof(v23));
          CMTimeRangeMakeFromDictionary(&v23, v15);
          v22 = v23;
          objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTimeRange:", &v22));
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      }
      while (v12);
    }
  }
  if (a5)
    CMTimeRangeMakeFromDictionary(&v28, (CFDictionaryRef)a5);
  v16 = -[AVMediaSelection _initWithAsset:selectedMediaArray:]([AVMediaSelection alloc], "_initWithAsset:selectedMediaArray:", self->_internal->asset, a6);
  delegateStorage = self->_internal->delegateStorage;
  v19[1] = 3221225472;
  v20 = v29;
  v21 = v28;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[2] = __196__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendLoadedTimeRangesChangedToDelegateWithNewlyLoadedTimeRange_currentLoadedTimeRanges_timeRangeExpectedToLoad_selectedMediaArray___block_invoke;
  v19[3] = &unk_1E3034EC8;
  v19[4] = self;
  v19[5] = v10;
  v19[6] = v16;
  -[AVWeakReferencingDelegateStorage invokeDelegateCallbackWithBlock:](delegateStorage, "invokeDelegateCallbackWithBlock:", v19);
}

uint64_t __196__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendLoadedTimeRangesChangedToDelegateWithNewlyLoadedTimeRange_currentLoadedTimeRanges_timeRangeExpectedToLoad_selectedMediaArray___block_invoke(uint64_t result, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[3];
  _OWORD v10[3];

  if (a2)
  {
    v3 = result;
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
    {
      v4 = *(_QWORD *)(v3 + 32);
      v5 = *(_QWORD *)(v3 + 40);
      v6 = *(_QWORD *)(v3 + 48);
      v7 = *(_OWORD *)(v3 + 72);
      v10[0] = *(_OWORD *)(v3 + 56);
      v10[1] = v7;
      v10[2] = *(_OWORD *)(v3 + 88);
      v8 = *(_OWORD *)(v3 + 120);
      v9[0] = *(_OWORD *)(v3 + 104);
      v9[1] = v8;
      v9[2] = *(_OWORD *)(v3 + 136);
      return objc_msgSend(a2, "assetDownloadSession:didLoadTimeRange:totalTimeRangesLoaded:timeRangeExpectedToLoad:forMediaSelection:", v4, v10, v5, v9, v6);
    }
  }
  return result;
}

- (void)_sendDidResolveMediaSelectionWithMediaSelection:(id)a3
{
  id v4;
  AVWeakReferencingDelegateStorage *delegateStorage;
  _QWORD v6[6];

  v4 = -[AVMediaSelection _initWithAsset:selectedMediaArray:]([AVMediaSelection alloc], "_initWithAsset:selectedMediaArray:", self->_internal->asset, a3);
  delegateStorage = self->_internal->delegateStorage;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __114__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendDidResolveMediaSelectionWithMediaSelection___block_invoke;
  v6[3] = &unk_1E3034EA0;
  v6[4] = self;
  v6[5] = v4;
  -[AVWeakReferencingDelegateStorage invokeDelegateCallbackWithBlock:](delegateStorage, "invokeDelegateCallbackWithBlock:", v6);
}

uint64_t __114__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendDidResolveMediaSelectionWithMediaSelection___block_invoke(uint64_t result, void *a2)
{
  uint64_t v3;

  if (a2)
  {
    v3 = result;
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(a2, "assetDownloadSession:didResolveMediaSelection:", *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40));
  }
  return result;
}

- (void)_sendDidFinishDownloadForMediaSelectionWithMediaSelection:(id)a3
{
  id v4;
  AVWeakReferencingDelegateStorage *delegateStorage;
  _QWORD v6[6];

  v4 = -[AVMediaSelection _initWithAsset:selectedMediaArray:]([AVMediaSelection alloc], "_initWithAsset:selectedMediaArray:", self->_internal->asset, a3);
  delegateStorage = self->_internal->delegateStorage;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __124__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendDidFinishDownloadForMediaSelectionWithMediaSelection___block_invoke;
  v6[3] = &unk_1E3034EA0;
  v6[4] = self;
  v6[5] = v4;
  -[AVWeakReferencingDelegateStorage invokeDelegateCallbackWithBlock:](delegateStorage, "invokeDelegateCallbackWithBlock:", v6);
}

uint64_t __124__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendDidFinishDownloadForMediaSelectionWithMediaSelection___block_invoke(uint64_t result, void *a2)
{
  uint64_t v3;

  if (a2)
  {
    v3 = result;
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(a2, "assetDownloadSession:didFinishDownloadForMediaSelection:", *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40));
  }
  return result;
}

- (void)_sendProgessUpdateWithExpectedBytesToDownload:(unint64_t)a3 bytesDownloaded:(unint64_t)a4
{
  AVWeakReferencingDelegateStorage *delegateStorage;
  _QWORD v5[7];

  delegateStorage = self->_internal->delegateStorage;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __128__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendProgessUpdateWithExpectedBytesToDownload_bytesDownloaded___block_invoke;
  v5[3] = &unk_1E3034EF0;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  -[AVWeakReferencingDelegateStorage invokeDelegateCallbackWithBlock:](delegateStorage, "invokeDelegateCallbackWithBlock:", v5);
}

uint64_t __128__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendProgessUpdateWithExpectedBytesToDownload_bytesDownloaded___block_invoke(uint64_t result, void *a2)
{
  _QWORD *v3;

  if (a2)
  {
    v3 = (_QWORD *)result;
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(a2, "assetDownloadSession:didUpdateProgressWithExpectedBytes:bytesDownloaded:", v3[4], v3[5], v3[6]);
  }
  return result;
}

- (void)_sendWillDownloadVariants:(id)a3
{
  AVWeakReferencingDelegateStorage *delegateStorage;
  _QWORD v4[6];

  delegateStorage = self->_internal->delegateStorage;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __92__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendWillDownloadVariants___block_invoke;
  v4[3] = &unk_1E3034EA0;
  v4[4] = self;
  v4[5] = a3;
  -[AVWeakReferencingDelegateStorage invokeDelegateCallbackWithBlock:](delegateStorage, "invokeDelegateCallbackWithBlock:", v4);
}

uint64_t __92__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendWillDownloadVariants___block_invoke(uint64_t result, void *a2)
{
  uint64_t v3;

  if (a2)
  {
    v3 = result;
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(a2, "assetDownloadSession:willDownloadVariants:", *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40));
  }
  return result;
}

- (void)_downloadSuccessCallback
{
  -[AVAssetDownloadSession _transitionToTerminalStatus:error:](self, "_transitionToTerminalStatus:error:", 3, 0);
}

- (void)_downloadFailureCallbackWithError:(id)a3
{
  -[AVAssetDownloadSession _transitionToTerminalStatus:error:](self, "_transitionToTerminalStatus:error:", 4, a3);
}

- (BOOL)ensureProgressTimerIsRunningOnQueueWithError:(id *)a3
{
  AVAssetDownloadSessionInternal *internal;
  NSObject *fileDownloadProgressTimer;
  _QWORD v7[4];
  id v8;
  id location;

  internal = self->_internal;
  if (!internal->fileDownloadProgressTimer)
  {
    self->_internal->fileDownloadProgressTimer = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)internal->stateQueue);
    if (!self->_internal->fileDownloadProgressTimer)
      return AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11801, 0) == 0;
    objc_initWeak(&location, self);
    fileDownloadProgressTimer = self->_internal->fileDownloadProgressTimer;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __101__AVAssetDownloadSession_AVAssetDownloadSession_Local__ensureProgressTimerIsRunningOnQueueWithError___block_invoke;
    v7[3] = &unk_1E3034F18;
    objc_copyWeak(&v8, &location);
    dispatch_source_set_event_handler(fileDownloadProgressTimer, v7);
    dispatch_source_set_timer((dispatch_source_t)self->_internal->fileDownloadProgressTimer, 0, 0x1DCD6500uLL, 0x5F5E100uLL);
    dispatch_resume((dispatch_object_t)self->_internal->fileDownloadProgressTimer);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return 1;
}

uint64_t __101__AVAssetDownloadSession_AVAssetDownloadSession_Local__ensureProgressTimerIsRunningOnQueueWithError___block_invoke(uint64_t a1)
{
  id Weak;

  Weak = objc_loadWeak((id *)(a1 + 32));
  return objc_msgSend(Weak, "_sendProgessUpdateWithExpectedBytesToDownload:bytesDownloaded:", objc_msgSend(Weak, "fileSize"), objc_msgSend(Weak, "countOfBytesReceived"));
}

- (void)cancelAndReleaseProgressTimerOnQueue
{
  NSObject *fileDownloadProgressTimer;
  NSObject *v4;

  fileDownloadProgressTimer = self->_internal->fileDownloadProgressTimer;
  if (fileDownloadProgressTimer)
  {
    dispatch_source_cancel(fileDownloadProgressTimer);
    v4 = self->_internal->fileDownloadProgressTimer;
    if (v4)
    {
      dispatch_release(v4);
      self->_internal->fileDownloadProgressTimer = 0;
    }
  }
}

- (id)_setupFigClientObjectForFileDownload:(id)a3
{
  OpaqueFigAsset *v5;
  int v6;
  signed int v7;
  NSURL *URL;
  void *v9;
  void *v10;

  v5 = -[AVAssetDownloadSession _createDuplicateFigAssetFromAVAsset:options:](self, "_createDuplicateFigAssetFromAVAsset:options:", self->_internal->asset, a3);
  self->_internal->cachePrimingDownloadTokenNum = (NSNumber *)(id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[AVURLAsset downloadToken](self->_internal->asset, "downloadToken"));
  v6 = -[AVAssetDownloadSession _setFileFigAsset:options:](self, "_setFileFigAsset:options:", v5, a3);
  if (!v6)
  {
    v10 = 0;
    if (!v5)
      return v10;
    goto LABEL_8;
  }
  v7 = v6;
  URL = self->_internal->URL;
  if (URL)
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", URL, *MEMORY[0x1E0CB3308]);
  else
    v9 = 0;
  v10 = (void *)AVLocalizedErrorWithUnderlyingOSStatus(v7, v9);
  if (v5)
LABEL_8:
    CFRelease(v5);
  return v10;
}

- (id)_setupFigClientObjectForStreaming:(id)a3
{
  id v5;
  id v6;
  OpaqueFigAsset *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  CFDictionaryRef DictionaryRepresentation;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSArray *mediaSelections;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  const void *v47;
  AVAssetDownloadSessionInternal *internal;
  signed int v49;
  void *v50;
  OS_dispatch_queue *stateQueue;
  CMBaseObject **p_assetDownloader;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  CGSize v62;
  _OWORD v63[5];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v63[2] = xmmword_1E3034F58;
  v63[3] = unk_1E3034F68;
  v63[4] = xmmword_1E3034F78;
  v63[0] = xmmword_1E3034F38;
  v63[1] = *(_OWORD *)&off_1E3034F48;
  v7 = -[AVAsset _figAsset](self->_internal->asset, "_figAsset");
  if (v7)
    v7 = (OpaqueFigAsset *)CFRetain(v7);
  self->_internal->figAsset = v7;
  v8 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVMediaCharacteristicAudible"));
  if (v8)
    objc_msgSend(v5, "setObject:forKey:", objc_msgSend(v8, "figDictionary"), AVTranslateAVMediaCharacteristicToFigMediaCharacteristic((uint64_t)CFSTR("AVMediaCharacteristicAudible")));
  v9 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVMediaCharacteristicLegible"));
  if (v9)
    objc_msgSend(v5, "setObject:forKey:", objc_msgSend(v9, "figDictionary"), AVTranslateAVMediaCharacteristicToFigMediaCharacteristic((uint64_t)CFSTR("AVMediaCharacteristicLegible")));
  v10 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVMediaCharacteristicVisual"));
  if (v10)
    objc_msgSend(v5, "setObject:forKey:", objc_msgSend(v10, "figDictionary"), AVTranslateAVMediaCharacteristicToFigMediaCharacteristic((uint64_t)CFSTR("AVMediaCharacteristicVisual")));
  if (v5)
    objc_msgSend(v6, "setObject:forKey:", v5, *MEMORY[0x1E0CC3450]);

  v11 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetDownloadSessionDeleteDownloadWhenAssetFinalizesKey")), "BOOLValue");
  v12 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if (v11)
    objc_msgSend(v6, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CC3420]);
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetDownloadSessionLinkAssetURLToDestinationURLKey")), "BOOLValue"))objc_msgSend(v6, "setObject:forKey:", *v12, *MEMORY[0x1E0CC3440]);
  v13 = objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetDownloadSessionMinimumRequiredMediaBitrateKey"));
  if (v13 || (v13 = objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetDownloadTaskMinimumRequiredMediaBitrateKey"))) != 0)
    objc_msgSend(v6, "setObject:forKey:", v13, *MEMORY[0x1E0CC3458]);
  v14 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetDownloadTaskMinimumRequiredPresentationSizeKey"));
  if (v14)
  {
    v62 = (CGSize)*MEMORY[0x1E0C9D820];
    if (AVCGSizeFromNSValue(v14, &v62))
    {
      DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v62);
      objc_msgSend(v6, "setObject:forKey:", DictionaryRepresentation, *MEMORY[0x1E0CC3468]);

    }
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetDownloadSessionShouldStoreEligibleContentKeysKey")), "BOOLValue") & 1) != 0|| objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetDownloadTaskShouldStoreEligibleContentKeysKey")), "BOOLValue"))
  {
    objc_msgSend(v6, "setObject:forKey:", *v12, *MEMORY[0x1E0CC3498]);
  }
  v16 = objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetDownloadSessionClientBundleIdentifierKey"));
  if (v16)
    objc_msgSend(v6, "setObject:forKey:", v16, *MEMORY[0x1E0CC3408]);
  v17 = objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetDownloadSessionAssetNameKey"));
  if (v17)
    objc_msgSend(v6, "setObject:forKey:", v17, *MEMORY[0x1E0CC3400]);
  v18 = objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetDownloadSessionAssetImageDataKey"));
  if (v18)
    objc_msgSend(v6, "setObject:forKey:", v18, *MEMORY[0x1E0CC33F8]);
  v19 = objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetDownloadTaskClientIsCatalyst"));
  if (v19)
    objc_msgSend(v6, "setObject:forKey:", v19, *MEMORY[0x1E0CC3410]);
  v20 = objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetDownloadTaskPrefersHDRKey"));
  if (v20 || (v20 = objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetDownloadTaskAllowHighDynamicRangeKey"))) != 0)
    objc_msgSend(v6, "setObject:forKey:", v20, *MEMORY[0x1E0CC33F0]);
  v21 = objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetDownloadTaskMediaSelectionPrefersMultichannelOnlyKey"));
  if (v21)
  {
    v22 = v21;
    v23 = (_QWORD *)MEMORY[0x1E0CC3488];
LABEL_40:
    objc_msgSend(v6, "setObject:forKey:", v22, *v23);
    goto LABEL_41;
  }
  v24 = objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetDownloadSessionMediaSelectionPrefersMultichannelKey"));
  if (v24
    || (v24 = objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetDownloadTaskMediaSelectionPrefersMultichannelKey"))) != 0)
  {
    v22 = v24;
    v23 = (_QWORD *)MEMORY[0x1E0CC3480];
    goto LABEL_40;
  }
LABEL_41:
  v25 = objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetDownloadTaskPrefersLosslessAudioKey"));
  if (v25)
    objc_msgSend(v6, "setObject:forKey:", v25, *MEMORY[0x1E0CC3470]);
  v26 = objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetDownloadTaskMaximumAudioSampleRateKey"));
  if (v26)
    objc_msgSend(v6, "setObject:forKey:", v26, *MEMORY[0x1E0CC3448]);
  v27 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetDownloadSessionAllowsExpensiveNetworkAccessKey"));
  if (v27 && (objc_msgSend(v27, "BOOLValue") & 1) == 0)
    objc_msgSend(v6, "setObject:forKey:", *v12, *MEMORY[0x1E0CC3430]);
  v28 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetDownloadSessionAllowsConstrainedNetworkAccessKey"));
  if (v28 && (objc_msgSend(v28, "BOOLValue") & 1) == 0)
    objc_msgSend(v6, "setObject:forKey:", *v12, *MEMORY[0x1E0CC3428]);
  v29 = objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetDownloadSessionDebugIdentifierKey"));
  if (v29)
    objc_msgSend(v6, "setObject:forKey:", v29, *MEMORY[0x1E0CC3418]);
  if (objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetDownloadSessionDownloadInterstitials")))
    objc_msgSend(v6, "setObject:forKey:", *v12, *MEMORY[0x1E0CC3438]);
  v30 = objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetDownloadSessionRetryErrorKey"));
  if (v30)
    objc_msgSend(v6, "setObject:forKey:", v30, *MEMORY[0x1E0CC3490]);
  v31 = objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetDownloadTaskMinimumRequiredMediaBitrateForHEVCKey"));
  if (v31)
    objc_msgSend(v6, "setObject:forKey:", v31, *MEMORY[0x1E0CC3460]);
  v32 = objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetDownloadTaskPrefersMostCompatibleRenditionKey"));
  if (v32)
    objc_msgSend(v6, "setObject:forKey:", v32, *MEMORY[0x1E0CC3478]);
  if (!objc_msgSend(v6, "count"))
  {

    v6 = 0;
  }
  v33 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetDownloadSessionMediaSelectionKey"));
  if (v34)
    objc_msgSend(v33, "addObject:", objc_msgSend(v34, "_selectedMediaArray"));
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  mediaSelections = self->_internal->mediaSelections;
  v36 = -[NSArray countByEnumeratingWithState:objects:count:](mediaSelections, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v59 != v38)
          objc_enumerationMutation(mediaSelections);
        objc_msgSend(v33, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i), "_selectedMediaArray"));
      }
      v37 = -[NSArray countByEnumeratingWithState:objects:count:](mediaSelections, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
    }
    while (v37);
  }
  v40 = objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetDownloadTaskMediaSelectionsForMultichannelKey"));
  if (v40)
  {
    v41 = (void *)v40;
    v42 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v55;
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v55 != v45)
            objc_enumerationMutation(v41);
          objc_msgSend(v42, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * j), "_selectedMediaArray"));
        }
        v44 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
      }
      while (v44);
    }
  }
  v47 = (const void *)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVAssetDownloadTaskDownloadConfigurationKey")), "_copyFigDownloadConfig");
  internal = self->_internal;
  p_assetDownloader = &internal->assetDownloader;
  stateQueue = internal->stateQueue;
  v49 = FigRemoteStreamingAssetDownloadOrchestratorCreate();
  if (v49)
    v50 = (void *)AVLocalizedErrorWithUnderlyingOSStatus(v49, 0);
  else
    v50 = 0;
  -[AVAssetDownloadSession _addFigAssetListeners](self, "_addFigAssetListeners", stateQueue, v63, p_assetDownloader);

  if (v47)
    CFRelease(v47);
  return v50;
}

- (void)_setupFigClientObjectAsync:(id)a3
{
  AVURLAsset *asset;
  _QWORD v4[6];

  asset = self->_internal->asset;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__AVAssetDownloadSession_AVAssetDownloadSession_Local___setupFigClientObjectAsync___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = self;
  v4[5] = a3;
  -[AVAsset loadValuesAsynchronouslyForKeys:completionHandler:](asset, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E3093C10, v4);
}

void __83__AVAssetDownloadSession_AVAssetDownloadSession_Local___setupFigClientObjectAsync___block_invoke(uint64_t a1)
{
  __int128 v1;
  NSObject *v2;
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v1 = *(_OWORD *)(a1 + 32);
  v2 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 80);
  v3[1] = 3221225472;
  v3[2] = __83__AVAssetDownloadSession_AVAssetDownloadSession_Local___setupFigClientObjectAsync___block_invoke_2;
  v3[3] = &unk_1E302FCE8;
  v4 = v1;
  dispatch_async(v2, v3);
}

_QWORD *__83__AVAssetDownloadSession_AVAssetDownloadSession_Local___setupFigClientObjectAsync___block_invoke_2(uint64_t a1)
{
  int v2;
  _QWORD *result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v7 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 136), "statusOfValueForKey:error:", CFSTR("streaming"), &v7);
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 136), "_isStreaming");
  result = *(_QWORD **)(a1 + 32);
  if (*(_QWORD *)(result[1] + 40) != 2)
    goto LABEL_10;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = v2
     ? objc_msgSend(result, "_setupFigClientObjectForStreaming:", v4)
     : objc_msgSend(result, "_setupFigClientObjectForFileDownload:", v4);
  v7 = (_QWORD *)v5;
  result = *(_QWORD **)(a1 + 32);
  v6 = result[1];
  if (*(_BYTE *)(v6 + 56))
  {
    objc_msgSend(result, "_startLoadingMetadataOnQueue");
    result = *(_QWORD **)(a1 + 32);
    v6 = result[1];
  }
  if (*(_QWORD *)(v6 + 48) != 1)
  {
LABEL_10:
    if (!v7)
      return result;
    return (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "_transitionToTerminalStatus:error:", 4);
  }
  result = (_QWORD *)objc_msgSend(result, "_startOnQueueFirstTime");
  v7 = result;
  if (result)
    return (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "_transitionToTerminalStatus:error:", 4);
  return result;
}

- (id)_weakReference
{
  return self->_internal->weakReference;
}

- (OpaqueFigAsset)_figAsset
{
  return self->_internal->figAsset;
}

- (int)_setFileFigAsset:(OpaqueFigAsset *)a3 options:(id)a4
{
  uint64_t CMBaseObject;
  void (*v7)(uint64_t, _QWORD, _QWORD);
  int result;
  AVAssetDownloadSessionInternal *internal;
  OpaqueFigPlayer *player;
  OpaqueFigAsset *figAsset;
  uint64_t (*v12)(OpaqueFigPlayer *, OpaqueFigAsset *, uint64_t, _QWORD, OpaqueFigPlaybackItem **);
  uint64_t v13;
  uint64_t v14;
  uint64_t FigBaseObject;
  void (*v16)(uint64_t, _QWORD, uint64_t);
  uint64_t v17;
  void (*v18)(uint64_t, _QWORD, uint64_t);
  OpaqueFigPlaybackItem *v19;
  _BYTE v20[12];

  if (!a3 || self->_internal->figAsset)
    return FigSignalErrorAt();
  self->_internal->figAsset = (OpaqueFigAsset *)CFRetain(a3);
  -[AVAssetDownloadSession _addFigAssetListeners](self, "_addFigAssetListeners");
  CMBaseObject = FigAssetGetCMBaseObject();
  v7 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v7)
    v7(CMBaseObject, *MEMORY[0x1E0CC3A20], *MEMORY[0x1E0C9AE50]);
  *(_DWORD *)&v20[8] = 0;
  FigSharedPlayerGetDefaultEngineTopology();
  *(_QWORD *)v20 = 320;
  result = FigSharedPlayerCreate();
  if (!result)
  {
    self->_internal->player = *(OpaqueFigPlayer **)&v20[4];
    v19 = 0;
    internal = self->_internal;
    player = internal->player;
    figAsset = internal->figAsset;
    v12 = *(uint64_t (**)(OpaqueFigPlayer *, OpaqueFigAsset *, uint64_t, _QWORD, OpaqueFigPlaybackItem **))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 96);
    if (v12)
    {
      result = v12(player, figAsset, 64, 0, &v19);
      if (!result)
      {
        self->_internal->playbackItem = v19;
        v13 = objc_msgSend(a4, "objectForKey:", CFSTR("AVAssetDownloadSessionAssetNameKey"));
        v14 = objc_msgSend(a4, "objectForKey:", CFSTR("AVAssetDownloadSessionAssetImageDataKey"));
        FigBaseObject = FigPlaybackItemGetFigBaseObject();
        v16 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
        if (v16)
          v16(FigBaseObject, *MEMORY[0x1E0CC5040], v13);
        v17 = FigPlaybackItemGetFigBaseObject();
        v18 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
        if (v18)
          v18(v17, *MEMORY[0x1E0CC5038], v14);
        -[AVAssetDownloadSession _addFigPlaybackItemListeners](self, "_addFigPlaybackItemListeners");
        return 0;
      }
    }
    else
    {
      return -12782;
    }
  }
  return result;
}

- (OpaqueFigPlaybackItem)_playbackItem
{
  return self->_internal->playbackItem;
}

- (void)_startLoadingMetadataOnQueue
{
  CMBaseObject *assetDownloader;
  void (*v4)(CMBaseObject *);

  assetDownloader = self->_internal->assetDownloader;
  if (assetDownloader)
  {
    v4 = *(void (**)(CMBaseObject *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
    if (v4)
      v4(assetDownloader);
  }
  self->_internal->didStartLoadingMetadata = 1;
}

- (id)_startOnQueueFirstTime
{
  AVAssetDownloadSessionInternal *internal;
  CMBaseObject *assetDownloader;
  uint64_t (*v5)(CMBaseObject *);
  signed int v6;
  OpaqueFigAsset *figAsset;
  uint64_t (*v8)(OpaqueFigAsset *, _QWORD, char *);
  int v9;
  id result;
  AVAssetDownloadSessionInternal *v11;
  OpaqueFigAsset *v12;
  uint64_t (*v13)(OpaqueFigAsset *, _QWORD, char *);
  NSURL *URL;
  void *v15;
  uint64_t FigBaseObject;
  void (*v17)(uint64_t, _QWORD, _QWORD);
  OpaqueFigPlaybackItem *playbackItem;
  uint64_t (*v19)(OpaqueFigPlaybackItem *, _QWORD, char *);
  uint64_t CMBaseObject;
  void (*v21)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  char v22;
  char v23;
  CFTypeRef cf;
  int valuePtr;
  id v26;

  v26 = 0;
  valuePtr = 0;
  cf = 0;
  internal = self->_internal;
  assetDownloader = internal->assetDownloader;
  if (assetDownloader)
  {
    v5 = *(uint64_t (**)(CMBaseObject *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v5)
      v6 = v5(assetDownloader);
    else
      v6 = -12782;
    result = 0;
    goto LABEL_17;
  }
  if (!internal->playbackItem || (figAsset = internal->figAsset) == 0)
  {
    result = 0;
    goto LABEL_25;
  }
  v23 = 0;
  v8 = *(uint64_t (**)(OpaqueFigAsset *, _QWORD, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (v8)
  {
    v9 = v8(figAsset, *MEMORY[0x1E0CC3920], &v23);
    valuePtr = v9;
    if (v9)
      goto LABEL_44;
    if (v23)
    {
      result = -[AVAssetDownloadSession _verifyDownloadConfigurationForAssetType](self, "_verifyDownloadConfigurationForAssetType");
      v26 = result;
      if (result)
      {
        v6 = 0;
        goto LABEL_18;
      }
    }
    v11 = self->_internal;
    if (!v11->cachePrimingDownloadTokenNum)
    {
      v22 = 0;
      FigBaseObject = FigPlaybackItemGetFigBaseObject();
      v17 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
      if (v17)
        v17(FigBaseObject, *MEMORY[0x1E0CC5128], *MEMORY[0x1E0C9AE50]);
      playbackItem = self->_internal->playbackItem;
      v19 = *(uint64_t (**)(OpaqueFigPlaybackItem *, _QWORD, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                              + 48);
      if (!v19)
      {
        v6 = -12782;
        valuePtr = -12782;
LABEL_42:
        result = 0;
        goto LABEL_18;
      }
      v9 = v19(playbackItem, 0, &v22);
      valuePtr = v9;
      if (!v9)
      {
        if (!v22)
          goto LABEL_36;
        v9 = -[AVAssetDownloadSession _readyForInspection](self, "_readyForInspection");
LABEL_35:
        valuePtr = v9;
        if (!v9)
        {
LABEL_36:
          CMBaseObject = FigAssetGetCMBaseObject();
          v21 = *(void (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                            + 48);
          if (v21)
          {
            v21(CMBaseObject, *MEMORY[0x1E0CC39B0], *MEMORY[0x1E0C9AE00], &cf);
            if (cf)
            {
              CFNumberGetValue((CFNumberRef)cf, kCFNumberIntType, &valuePtr);
              if (!valuePtr)
                -[AVAssetDownloadSession _transitionToTerminalStatus:error:](self, "_transitionToTerminalStatus:error:", 3, 0);
            }
          }
          -[AVAssetDownloadSession ensureProgressTimerIsRunningOnQueueWithError:](self, "ensureProgressTimerIsRunningOnQueueWithError:", &v26);
          v6 = valuePtr;
          result = v26;
          goto LABEL_18;
        }
      }
LABEL_44:
      v6 = v9;
      goto LABEL_42;
    }
    v12 = v11->figAsset;
    v13 = *(uint64_t (**)(OpaqueFigAsset *, _QWORD, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
    if (v13)
    {
      v9 = v13(v12, *MEMORY[0x1E0CC3970], &v23);
      valuePtr = v9;
      if (!v9)
      {
        if (!v23)
          goto LABEL_36;
        v9 = -[AVAssetDownloadSession _primeCache](self, "_primeCache");
        goto LABEL_35;
      }
      goto LABEL_44;
    }
  }
  result = 0;
  v6 = -12782;
LABEL_17:
  valuePtr = v6;
LABEL_18:
  if (v6 && !result)
  {
    URL = self->_internal->URL;
    if (URL)
      v15 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", URL, *MEMORY[0x1E0CB3308]);
    else
      v15 = 0;
    result = (id)AVLocalizedErrorWithUnderlyingOSStatus(v6, v15);
    v26 = result;
  }
LABEL_25:
  if (cf)
  {
    CFRelease(cf);
    return v26;
  }
  return result;
}

- (id)_startOnQueue
{
  AVAssetDownloadSessionInternal *internal;
  int64_t status;
  id result;
  CMBaseObject *assetDownloader;
  uint64_t (*v7)(CMBaseObject *);
  signed int v8;
  signed int v9;
  uint64_t FigBaseObject;
  void (*v11)(uint64_t, _QWORD, _QWORD);
  NSURL *URL;
  void *v13;
  id v14;

  v14 = 0;
  internal = self->_internal;
  status = internal->status;
  if (status != 2)
  {
    result = 0;
    if (status)
      goto LABEL_13;
    result = -[AVAssetDownloadSession _startOnQueueFirstTime](self, "_startOnQueueFirstTime");
    v14 = result;
LABEL_12:
    self->_internal->status = 1;
LABEL_13:
    if (self->_internal->playbackItem)
    {
      -[AVAssetDownloadSession ensureProgressTimerIsRunningOnQueueWithError:](self, "ensureProgressTimerIsRunningOnQueueWithError:", &v14);
      return v14;
    }
    return result;
  }
  assetDownloader = internal->assetDownloader;
  if (!assetDownloader)
  {
    result = internal->playbackItem;
    if (!result)
      goto LABEL_12;
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v11 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v11)
      v11(FigBaseObject, *MEMORY[0x1E0CC5128], *MEMORY[0x1E0C9AE50]);
    goto LABEL_11;
  }
  v7 = *(uint64_t (**)(CMBaseObject *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v7)
  {
    v9 = -12782;
    goto LABEL_17;
  }
  v8 = v7(assetDownloader);
  if (!v8)
  {
LABEL_11:
    result = 0;
    goto LABEL_12;
  }
  v9 = v8;
LABEL_17:
  URL = self->_internal->URL;
  if (URL)
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", URL, *MEMORY[0x1E0CB3308]);
  else
    v13 = 0;
  return (id)AVLocalizedErrorWithUnderlyingOSStatus(v9, v13);
}

- (void)_transitionToTerminalStatus:(int64_t)a3 error:(id)a4
{
  NSObject *stateQueue;
  _QWORD v5[8];
  _QWORD v6[3];
  char v7;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v7 = 0;
  stateQueue = self->_internal->stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __90__AVAssetDownloadSession_AVAssetDownloadSession_Local___transitionToTerminalStatus_error___block_invoke;
  v5[3] = &unk_1E3034F90;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = v6;
  v5[7] = a3;
  dispatch_async(stateQueue, v5);
  _Block_object_dispose(v6, 8);
}

uint64_t __90__AVAssetDownloadSession_AVAssetDownloadSession_Local___transitionToTerminalStatus_error___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *global_queue;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("status"));
  result = objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("error"));
  v3 = *(_QWORD *)(a1 + 56);
  if (v3 >= 3)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(_QWORD *)(v4 + 48);
    if (v5 != v3 && v5 <= 2)
    {
      v7 = *(void **)(v4 + 64);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64) = *(id *)(a1 + 40);

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(a1 + 56);
      if ((unint64_t)(*(_QWORD *)(a1 + 56) - 3) <= 1)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    objc_msgSend(*(id *)(a1 + 32), "cancelAndReleaseProgressTimerOnQueue");
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 72), "delegate"))
      {
        v8 = *(void **)(a1 + 32);
        if (*(_QWORD *)(a1 + 40))
          objc_msgSend(v8, "_sendDownloadFailureToDelegateWithError:");
        else
          objc_msgSend(v8, "_sendDownloadSuccessToDelegate");
      }
      else
      {
        if (*(_QWORD *)(a1 + 56) == 3)
          v9 = CFSTR("AVAssetDownloadSessionDownloadSucceededNotification");
        else
          v9 = CFSTR("AVAssetDownloadSessionDownloadFailedNotification");
        v10 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", v9, *(_QWORD *)(a1 + 32), 0);
        global_queue = dispatch_get_global_queue(21, 0);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __90__AVAssetDownloadSession_AVAssetDownloadSession_Local___transitionToTerminalStatus_error___block_invoke_2;
        block[3] = &unk_1E302FA10;
        block[4] = v10;
        dispatch_async(global_queue, block);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("error"));
    return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("status"));
  }
  return result;
}

uint64_t __90__AVAssetDownloadSession_AVAssetDownloadSession_Local___transitionToTerminalStatus_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", *(_QWORD *)(a1 + 32));
}

- (id)_errorForFigNotificationPayload:(__CFDictionary *)a3 key:(__CFString *)a4
{
  CFTypeID v6;
  const __CFNumber *Value;
  const __CFNumber *v8;
  CFTypeID v9;
  signed int valuePtr;

  if (!a3)
    return 0;
  v6 = CFGetTypeID(a3);
  if (v6 != CFDictionaryGetTypeID())
    return 0;
  Value = (const __CFNumber *)CFDictionaryGetValue(a3, a4);
  valuePtr = 0;
  if (!Value)
    return 0;
  v8 = Value;
  v9 = CFGetTypeID(Value);
  if (v9 != CFNumberGetTypeID())
    return 0;
  CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr);
  return (id)AVLocalizedErrorWithUnderlyingOSStatus(valuePtr, 0);
}

- (void)_primeCacheOnDispatchQueue
{
  NSObject *stateQueue;
  signed int v4;
  NSURL *URL;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  stateQueue = self->_internal->stateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__AVAssetDownloadSession_AVAssetDownloadSession_Local___primeCacheOnDispatchQueue__block_invoke;
  v7[3] = &unk_1E302FDB0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(stateQueue, v7);
  v4 = *((_DWORD *)v9 + 6);
  if (v4)
  {
    URL = self->_internal->URL;
    if (URL)
      v6 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", URL, *MEMORY[0x1E0CB3308]);
    else
      v6 = 0;
    -[AVAssetDownloadSession _transitionToTerminalStatus:error:](self, "_transitionToTerminalStatus:error:", 4, AVLocalizedErrorWithUnderlyingOSStatus(v4, v6));
  }
  _Block_object_dispose(&v8, 8);
}

_QWORD *__82__AVAssetDownloadSession_AVAssetDownloadSession_Local___primeCacheOnDispatchQueue__block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (*(_QWORD *)(result[1] + 48) == 1)
  {
    result = (_QWORD *)objc_msgSend(result, "_primeCache");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_DWORD)result;
  }
  return result;
}

- (int)_primeCache
{
  AVAssetDownloadSessionInternal *internal;
  NSNumber *cachePrimingDownloadTokenNum;
  uint64_t FigBaseObject;
  uint64_t (*v6)(uint64_t, _QWORD, NSNumber *);

  internal = self->_internal;
  cachePrimingDownloadTokenNum = internal->cachePrimingDownloadTokenNum;
  if (cachePrimingDownloadTokenNum)
  {
    if (internal->playbackItem)
    {
      FigBaseObject = FigPlaybackItemGetFigBaseObject();
      v6 = *(uint64_t (**)(uint64_t, _QWORD, NSNumber *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
      if (v6)
        LODWORD(cachePrimingDownloadTokenNum) = v6(FigBaseObject, *MEMORY[0x1E0CC50B0], cachePrimingDownloadTokenNum);
      else
        LODWORD(cachePrimingDownloadTokenNum) = -12782;

      self->_internal->cachePrimingDownloadTokenNum = 0;
    }
    else
    {
      LODWORD(cachePrimingDownloadTokenNum) = 0;
    }
  }
  return (int)cachePrimingDownloadTokenNum;
}

- (int)_readyForInspection
{
  uint64_t v2;

  v2 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AVAssetDownloadSessionFileSizeAvailableNotification"), self, 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v2);
  return 0;
}

- (id)_verifyDownloadConfigurationForAssetType
{
  uint64_t CMBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  signed int v5;
  void *v6;
  uint64_t v7;
  CFTypeRef cf;

  cf = 0;
  CMBaseObject = FigAssetGetCMBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v4)
  {
    v5 = -12782;
    goto LABEL_7;
  }
  v5 = v4(CMBaseObject, *MEMORY[0x1E0CC3920], *MEMORY[0x1E0C9AE00], &cf);
  if (v5)
  {
LABEL_7:
    v7 = AVLocalizedErrorWithUnderlyingOSStatus(v5, 0);
    goto LABEL_9;
  }
  if (!FigCFEqual() || self->_internal->assetDownloader)
  {
    v6 = 0;
    goto LABEL_10;
  }
  v7 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11838, 0);
LABEL_9:
  v6 = (void *)v7;
LABEL_10:
  if (cf)
    CFRelease(cf);
  return v6;
}

- (OpaqueFigAsset)_createDuplicateFigAssetFromAVAsset:(id)a3 options:(id)a4
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t CMBaseObject;
  void (*v9)(uint64_t, _QWORD, _QWORD, id *);
  id v10;
  void *v11;
  uint64_t v12;
  id v14;
  OpaqueFigAsset *v15;

  v6 = objc_msgSend(a3, "_figAsset");
  v14 = 0;
  v15 = 0;
  figAssetCreationFlagsForAssetReferenceRestrictions(2);
  v7 = (_QWORD *)MEMORY[0x1E0C9AE00];
  if (v6
    && (CMBaseObject = FigAssetGetCMBaseObject(),
        (v9 = *(void (**)(uint64_t, _QWORD, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48)) != 0)
    && (v9(CMBaseObject, *MEMORY[0x1E0CC3990], *v7, &v14), v14))
  {
    v10 = (id)objc_msgSend(v14, "mutableCopy");
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  v11 = v10;
  objc_msgSend(v10, "setObject:forKey:", self->_internal->destinationURL, *MEMORY[0x1E0CC3760], v14);
  v12 = objc_msgSend(a4, "objectForKey:", CFSTR("AVAssetDownloadSessionClientBundleIdentifierKey"));
  if (v12)
    objc_msgSend(v11, "setObject:forKey:", v12, *MEMORY[0x1E0CC3708]);
  FigAssetRemoteCreateWithURL();

  return v15;
}

- (id)_errorFromAssetNotificationPayload:(id)a3
{
  void *v5;

  v5 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC38D8]);
  if (v5)
    return (id)AVErrorWithNSErrorAndOSStatus((uint64_t)v5, objc_msgSend(v5, "code"), 0);
  else
    return -[AVAssetDownloadSession _errorForFigNotificationPayload:key:](self, "_errorForFigNotificationPayload:key:", a3, *MEMORY[0x1E0CC3908]);
}

- (id)_figAssetNotificationNames
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3668], *MEMORY[0x1E0CC3660], *MEMORY[0x1E0CC3678], *MEMORY[0x1E0CC3670], *MEMORY[0x1E0CC3688], 0);
}

- (void)_addFigAssetListeners
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[AVAssetDownloadSession _figAsset](self, "_figAsset"))
  {
    v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v4 = -[AVAssetDownloadSession _weakReference](self, "_weakReference");
    CFRetain(v4);
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = -[AVAssetDownloadSession _figAssetNotificationNames](self, "_figAssetNotificationNames", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", v4, avAssetDownloadSession_figAssetNotificationCallback, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), -[AVAssetDownloadSession _figAsset](self, "_figAsset"), 0);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
  }
}

- (void)_removeFigAssetListeners
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[AVAssetDownloadSession _figAsset](self, "_figAsset"))
  {
    v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v4 = -[AVAssetDownloadSession _weakReference](self, "_weakReference");
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = -[AVAssetDownloadSession _figAssetNotificationNames](self, "_figAssetNotificationNames", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", v4, avAssetDownloadSession_figAssetNotificationCallback, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), -[AVAssetDownloadSession _figAsset](self, "_figAsset"));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
    CFRelease(v4);
  }
}

- (id)_figPlaybackItemNotificationNames
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC4CE0], *MEMORY[0x1E0CC4DC8], 0);
}

- (void)_addFigPlaybackItemListeners
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_internal->playbackItem)
  {
    v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v4 = -[AVAssetDownloadSession _weakReference](self, "_weakReference");
    CFRetain(v4);
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = -[AVAssetDownloadSession _figPlaybackItemNotificationNames](self, "_figPlaybackItemNotificationNames", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", v4, avAssetDownloadSession_figPlaybackItemNotificationCallback, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), self->_internal->playbackItem, 0);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
  }
}

- (void)_removeFigPlaybackItemListeners
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_internal->playbackItem)
  {
    v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v4 = -[AVAssetDownloadSession _weakReference](self, "_weakReference");
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = -[AVAssetDownloadSession _figPlaybackItemNotificationNames](self, "_figPlaybackItemNotificationNames", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", v4, avAssetDownloadSession_figPlaybackItemNotificationCallback, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), self->_internal->playbackItem);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
    CFRelease(v4);
  }
}

- (BOOL)isDefunct
{
  OpaqueFigAsset *figAsset;
  _QWORD *v4;
  uint64_t (*v5)(OpaqueFigAsset *, unsigned __int8 *);
  int v6;
  int v7;
  OpaqueFigPlayer *player;
  _QWORD *v9;
  uint64_t (*v10)(OpaqueFigPlayer *, unsigned __int8 *);
  int v11;
  CMBaseObject *assetDownloader;
  _QWORD *v13;
  unsigned int (*v14)(CMBaseObject *, unsigned __int8 *);
  BOOL v15;
  unsigned __int8 v17;

  v17 = 0;
  figAsset = self->_internal->figAsset;
  v4 = *(_QWORD **)(CMBaseObjectGetVTable() + 8);
  if (*v4 < 5uLL)
    goto LABEL_17;
  v5 = (uint64_t (*)(OpaqueFigAsset *, unsigned __int8 *))v4[11];
  if (!v5)
    goto LABEL_17;
  v6 = v5(figAsset, &v17);
  v7 = v17;
  if (!v17)
  {
    if (v6)
      goto LABEL_17;
    player = self->_internal->player;
    v9 = *(_QWORD **)(CMBaseObjectGetVTable() + 8);
    if (*v9 >= 5uLL && (v10 = (uint64_t (*)(OpaqueFigPlayer *, unsigned __int8 *))v9[11]) != 0)
      v11 = v10(player, &v17);
    else
      v11 = -12782;
    v7 = v17;
    if (!v17)
    {
      if (v11
        || ((assetDownloader = self->_internal->assetDownloader,
             v13 = *(_QWORD **)(CMBaseObjectGetVTable() + 8),
             *v13 < 5uLL)
         || (v14 = (unsigned int (*)(CMBaseObject *, unsigned __int8 *))v13[11]) == 0
          ? (v15 = 0)
          : (v15 = v14(assetDownloader, &v17) == 0),
            (v7 = v17) == 0 && !v15))
      {
LABEL_17:
        v7 = 1;
      }
    }
  }
  return v7 == 1;
}

@end
