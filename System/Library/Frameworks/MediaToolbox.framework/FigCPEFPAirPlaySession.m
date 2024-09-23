@implementation FigCPEFPAirPlaySession

- (FigCPEFPAirPlaySession)initWithFairPlayContext:(unsigned int)a3 protectionInfo:(id)a4 routeInfo:(id)a5 playbackSession:(OpaqueFigEndpointPlaybackSession *)a6 mediaControlUUID:(id)a7
{
  FigCPEFPAirPlaySession *v8;

  v8 = -[FigCPEFPAirPlaySession initWithFairPlayContext:routeInfo:playbackSession:mediaControlUUID:](self, "initWithFairPlayContext:routeInfo:playbackSession:mediaControlUUID:", *(_QWORD *)&a3, a5, a6, a7);
  if (v8)
    v8->_protectionInfo = (NSDictionary *)a4;
  return v8;
}

- (FigCPEFPAirPlaySession)initWithFairPlayContext:(unsigned int)a3 contentInfo:(id)a4 routeInfo:(id)a5 playbackSession:(OpaqueFigEndpointPlaybackSession *)a6 mediaControlUUID:(id)a7
{
  FigCPEFPAirPlaySession *v8;

  v8 = -[FigCPEFPAirPlaySession initWithFairPlayContext:routeInfo:playbackSession:mediaControlUUID:](self, "initWithFairPlayContext:routeInfo:playbackSession:mediaControlUUID:", *(_QWORD *)&a3, a5, a6, a7);
  if (v8)
    v8->_contentInfo = (NSDictionary *)a4;
  return v8;
}

- (FigCPEFPAirPlaySession)initWithFairPlayContext:(unsigned int)a3 routeInfo:(id)a4 playbackSession:(OpaqueFigEndpointPlaybackSession *)a5 mediaControlUUID:(id)a6
{
  FigCPEFPAirPlaySession *v10;
  FigCPEFPAirPlaySession *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)FigCPEFPAirPlaySession;
  v10 = -[FigCPEFPAirPlaySession init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_invalid = 0;
    v10->_fairPlayContext = a3;
    v10->_protectionInfo = 0;
    v10->_contentInfo = 0;
    v10->_playbackSession = (OpaqueFigEndpointPlaybackSession *)CFRetain(a5);
    v11->_mediaControlUUID = (NSString *)a6;
    v11->_fairPlayDeallocator = (__CFAllocator *)FigFairPlayCopyDisposeStorageAllocator();
    v11->_vodkaVersion = 0;
    if (a4)
    {
      v12 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("AirPlayVodkaVersion"));
      if (v12)
        v11->_vodkaVersion = objc_msgSend(v12, "unsignedIntValue");
    }
    v11->_fairPlaySession = 0;
    v11->_serializationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coremedia.cpefpairplay", 0);
    if (sSSOnceToken != -1)
      dispatch_once(&sSSOnceToken, &__block_literal_global_127);
  }
  return v11;
}

void *__93__FigCPEFPAirPlaySession_initWithFairPlayContext_routeInfo_playbackSession_mediaControlUUID___block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/StoreServices.framework/StoreServices", 1);
  if (result)
  {
    sSSPlayInfoRequestContext = (uint64_t)objc_getClass("SSPlayInfoRequestContext");
    sSSAccountStore = (uint64_t)objc_getClass("SSAccountStore");
    result = objc_getClass("SSPlayInfoRequest");
    sSSPlayInfoRequest = (uint64_t)result;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  CFRelease(self->_playbackSession);
  CFRelease(self->_fairPlayDeallocator);
  if (self->_fairPlaySession)
  {
    TsbHVdUOnzCHizuzrAdwYFpb();
    FAIRPLAY_CALL_LOG(v3);
  }
  dispatch_release((dispatch_object_t)self->_serializationQueue);
  v4.receiver = self;
  v4.super_class = (Class)FigCPEFPAirPlaySession;
  -[FigCPEFPAirPlaySession dealloc](&v4, sel_dealloc);
}

- (id)createPicRequestWithError:(id *)a3
{
  NSDictionary *protectionInfo;
  NSDictionary *contentInfo;
  char *v7;
  NSDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  const __CFDictionary *v14;
  void *LegacySinfFromSinfExtensions;
  void *ExtendedSinfFromSinfExtensions;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  CFDataRef v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _DWORD length[3];
  uint64_t v37;
  void *v38;
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v37 = 0;
  v38 = 0;
  v39 = 0;
  memset(length, 0, sizeof(length));
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  if (!self->_fairPlayContext
    || self->_fairPlaySession
    || (protectionInfo = self->_protectionInfo,
        contentInfo = self->_contentInfo,
        (protectionInfo != 0) ^ (contentInfo == 0))
    || !self->_fairPlayDeallocator)
  {
    v26 = 0;
    v27 = 4294955138;
    goto LABEL_30;
  }
  v31 = a3;
  if (protectionInfo)
  {
    LODWORD(v37) = 1;
    LODWORD(v39) = -[NSDictionary count](protectionInfo, "count");
    v7 = (char *)malloc_type_calloc(v39, 0x20uLL, 0x1050040E8CD93FDuLL);
    v38 = v7;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v8 = self->_protectionInfo;
    v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(v8);
          v14 = -[NSDictionary objectForKey:](self->_protectionInfo, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
          LegacySinfFromSinfExtensions = (void *)FigFairPlayGetLegacySinfFromSinfExtensions(v14);
          ExtendedSinfFromSinfExtensions = (void *)FigFairPlayGetExtendedSinfFromSinfExtensions(v14);
          v17 = 32 * (v11 + i);
          if (LegacySinfFromSinfExtensions)
          {
            *(_DWORD *)&v7[32 * (v11 + i)] = objc_msgSend(LegacySinfFromSinfExtensions, "length");
            v18 = objc_msgSend(LegacySinfFromSinfExtensions, "bytes");
            v7 = (char *)v38;
            *(_QWORD *)((char *)v38 + v17 + 8) = v18;
          }
          if (ExtendedSinfFromSinfExtensions)
          {
            *(_DWORD *)&v7[v17 + 16] = objc_msgSend(ExtendedSinfFromSinfExtensions, "length");
            v19 = objc_msgSend(ExtendedSinfFromSinfExtensions, "bytes");
            v7 = (char *)v38;
            *(_QWORD *)((char *)v38 + v17 + 24) = v19;
          }
        }
        v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        v11 += i;
      }
      while (v10);
    }
    goto LABEL_27;
  }
  LODWORD(v37) = 2;
  v20 = -[NSDictionary objectForKey:](contentInfo, "objectForKey:", 0x1E300AB58);
  if (v20)
    v38 = (void *)objc_msgSend(v20, "unsignedLongValue");
  v21 = -[NSDictionary objectForKey:](self->_contentInfo, "objectForKey:", 0x1E300AB98);
  if (!v21)
    goto LABEL_27;
  v22 = v21;
  if (objc_msgSend(v21, "isEqualToString:", 0x1E2FF57F8))
  {
    v23 = 1;
LABEL_25:
    HIDWORD(v37) = v23;
    goto LABEL_27;
  }
  if (objc_msgSend(v22, "isEqualToString:", 0x1E2FF57D8))
  {
    v23 = 2;
    goto LABEL_25;
  }
  HIDWORD(v37) = 0;
LABEL_27:
  J3NocDTIn(self->_vodkaVersion, self->_fairPlayContext, (uint64_t)&v37);
  v25 = FAIRPLAY_CALL_LOG(v24);
  if ((_DWORD)v25)
  {
    v27 = v25;
    v26 = 0;
    a3 = v31;
  }
  else
  {
    v26 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(const UInt8 **)&length[1], length[0], self->_fairPlayDeallocator);
    a3 = v31;
    if (v26)
    {
      v27 = 0;
      *(_QWORD *)&length[1] = 0;
    }
    else
    {
      v27 = 4294955145;
    }
  }
LABEL_30:
  if ((_DWORD)v37 == 1)
    free(v38);
  if (*(_QWORD *)&length[1])
  {
    jEHf8Xzsv8K(*(uint64_t *)&length[1]);
    FAIRPLAY_CALL_LOG(v28);
  }
  if (a3 && (_DWORD)v27)
  {
    if (dword_1EE2A3248)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    *a3 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], (int)FigFairPlayMapFairPlayErrorToCPEError(v27), 0);
  }
  return v26;
}

- (id)sicWithPic:(id)a3
{
  FPStreamOpaque_ *fairPlaySession;
  uint64_t v5;
  int v6;
  uint64_t v7;
  CFDataRef v8;
  uint64_t v10;
  _DWORD length[3];

  *(_QWORD *)&length[1] = 0;
  if (!a3 || (fairPlaySession = self->_fairPlaySession) == 0 || !self->_fairPlayDeallocator)
  {
LABEL_11:
    v8 = 0;
    return v8;
  }
  OflR7BMjGok3A7mYQFt9((uint64_t)fairPlaySession, objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), 0, 0, (uint64_t)&length[1]);
  v6 = FAIRPLAY_CALL_LOG(v5);
  v7 = *(_QWORD *)&length[1];
  if (v6)
  {
LABEL_9:
    if (v7)
    {
      jEHf8Xzsv8K(v7);
      FAIRPLAY_CALL_LOG(v10);
    }
    goto LABEL_11;
  }
  v8 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(const UInt8 **)&length[1], 0, self->_fairPlayDeallocator);
  if (!v8)
  {
    v7 = *(_QWORD *)&length[1];
    goto LABEL_9;
  }
  *(_QWORD *)&length[1] = 0;
  return v8;
}

- (id)mediaControlParamsWithStoreResponse:(id)a3
{
  id v3;
  FPStreamOpaque_ *fairPlaySession;
  CFDataRef v6;
  uint64_t v7;
  CFDataRef v8;
  uint64_t v9;
  _DWORD length[3];

  v3 = a3;
  *(_QWORD *)&length[1] = 0;
  if (!a3)
  {
    v6 = 0;
    fairPlaySession = 0;
    goto LABEL_12;
  }
  fairPlaySession = self->_fairPlaySession;
  if (fairPlaySession)
  {
    if (!self->_fairPlayDeallocator)
      goto LABEL_13;
    if (self->_protectionInfo)
    {
      fairPlaySession = (FPStreamOpaque_ *)*MEMORY[0x1E0CA3C28];
      v6 = (CFDataRef)a3;
LABEL_9:
      v3 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v6, fairPlaySession);
      goto LABEL_10;
    }
    length[0] = 0;
    TBGzuU3p5n1n((uint64_t)fairPlaySession, objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), (uint64_t)&length[1], (uint64_t)length);
    if (FAIRPLAY_CALL_LOG(v7))
    {
LABEL_13:
      fairPlaySession = 0;
    }
    else
    {
      fairPlaySession = (FPStreamOpaque_ *)*MEMORY[0x1E0CA3C20];
      v8 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(const UInt8 **)&length[1], length[0], self->_fairPlayDeallocator);
      if (v8)
      {
        v6 = v8;
        *(_QWORD *)&length[1] = 0;
        goto LABEL_9;
      }
    }
  }
  v6 = 0;
  v3 = 0;
LABEL_10:
  if (*(_QWORD *)&length[1])
  {
    jEHf8Xzsv8K(*(uint64_t *)&length[1]);
    FAIRPLAY_CALL_LOG(v9);
  }
LABEL_12:

  return v3;
}

- (id)legacySinfs
{
  void *v3;
  NSDictionary *protectionInfo;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSDictionary count](self->_protectionInfo, "count"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  protectionInfo = self->_protectionInfo;
  v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](protectionInfo, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(protectionInfo);
        objc_msgSend(v3, "addObject:", FigFairPlayGetLegacySinfFromSinfExtensions((const __CFDictionary *)-[NSDictionary objectForKey:](self->_protectionInfo, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i))));
      }
      v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](protectionInfo, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v3;
}

- (void)authorizeItemCompletionHandler_objc:(id *)a3 picData:(__CFData *)a4 playerGUID:(__CFString *)a5 error:(int)a6
{
  NSObject *var2;
  id var3;
  _QWORD *v8;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  _QWORD block[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[7];
  _QWORD v21[5];
  int v22;

  var2 = a3->var2;
  var3 = a3->var3;
  if (self->_invalid)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_8;
    v16[3] = &unk_1E2F98E38;
    v16[4] = var3;
    v8 = v16;
LABEL_14:
    dispatch_async(var2, v8);
    return;
  }
  if (a6)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke;
    v21[3] = &unk_1E2FBB538;
    v22 = a6;
    v21[4] = var3;
    v8 = v21;
    goto LABEL_14;
  }
  if (!-[__CFString length](a5, "length") || !-[__CFData length](a4, "length"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_7;
    block[3] = &unk_1E2F98E38;
    block[4] = var3;
    v8 = block;
    goto LABEL_14;
  }
  v12 = -[FigCPEFPAirPlaySession sicWithPic:](self, "sicWithPic:", a4);
  if (!v12)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_6;
    v18[3] = &unk_1E2F98E38;
    v18[4] = var3;
    v8 = v18;
    goto LABEL_14;
  }
  if (!sSSPlayInfoRequest || !sSSAccountStore || (v13 = v12, !sSSPlayInfoRequestContext))
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_5;
    v19[3] = &unk_1E2F98E38;
    v19[4] = var3;
    v8 = v19;
    goto LABEL_14;
  }
  v14 = objc_alloc_init((Class)sSSPlayInfoRequestContext);
  objc_msgSend(v14, "setPlayerGUID:", a5);
  objc_msgSend(v14, "setSICData:", v13);
  if (self->_protectionInfo)
  {
    objc_msgSend(v14, "setSinfs:", -[FigCPEFPAirPlaySession legacySinfs](self, "legacySinfs"));
  }
  else
  {
    objc_msgSend(v14, "setAccountIdentifier:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)sSSAccountStore, "defaultStore"), "activeAccount"), "uniqueIdentifier"));
    objc_msgSend(v14, "setContentIdentifier:", -[NSDictionary objectForKey:](self->_contentInfo, "objectForKey:", 0x1E300AB58));
  }
  v15 = (id)objc_msgSend(objc_alloc((Class)sSSPlayInfoRequest), "initWithPlayInfoContext:", v14);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_2;
  v20[3] = &unk_1E2FBB5B0;
  v20[4] = self;
  v20[5] = var2;
  v20[6] = var3;
  objc_msgSend(v15, "startWithPlayInfoResponseBlock:", v20);
}

void __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x19403137C]();
  v3 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v4 = (id)objc_msgSend(v3, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], *(int *)(a1 + 40), 0);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v4, CFSTR("Error"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  NSObject *v4;
  _QWORD block[7];
  __int128 v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 72);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_3;
  block[3] = &unk_1E2FBB588;
  block[4] = v3;
  block[5] = a2;
  block[6] = a3;
  v6 = *(_OWORD *)(a1 + 40);
  dispatch_async(v4, block);
}

void __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_3(uint64_t a1)
{
  _BYTE *v1;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD block[7];

  v1 = *(_BYTE **)(a1 + 32);
  if (!v1[8])
  {
    v3 = *(void **)(a1 + 40);
    if (!v3 || (v4 = objc_msgSend(v1, "mediaControlParamsWithStoreResponse:", objc_msgSend(v3, "playInfoData"))) == 0)
      v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v5 = *(void **)(a1 + 48);
    if (v5)
    {
      if (objc_msgSend(v5, "code") != 110 && objc_msgSend(*(id *)(a1 + 48), "code") != 3)
      {
        v9 = *(_QWORD *)(a1 + 48);
        goto LABEL_11;
      }
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v7 = *MEMORY[0x1E0CB2F90];
      v8 = -16222;
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v7 = *MEMORY[0x1E0CB2F90];
      v8 = 0;
    }
    v9 = objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, v8, 0);
LABEL_11:
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_4;
    block[3] = &unk_1E2FBB560;
    v10 = *(NSObject **)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 64);
    block[5] = v9;
    block[6] = v11;
    block[4] = v4;
    dispatch_async(v10, block);
  }
}

uint64_t __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(a1[6] + 16))(a1[6], objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a1[4], CFSTR("AirPlayParams"), a1[5], CFSTR("Error"), 0));
}

uint64_t __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -12162, 0), CFSTR("Error")));
}

uint64_t __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -12162, 0), CFSTR("Error")));
}

uint64_t __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_7(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0C99D50], "data");
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, objc_msgSend(v2, "dictionaryWithObject:forKey:", objc_msgSend(v2, "dictionaryWithObject:forKey:", v3, *MEMORY[0x1E0CA3C28]), CFSTR("AirPlayParams")));
}

uint64_t __87__FigCPEFPAirPlaySession_authorizeItemCompletionHandler_objc_picData_playerGUID_error___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -12162, 0), CFSTR("Error")));
}

- (void)beginSessionWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  NSObject *serializationQueue;
  _QWORD block[7];

  serializationQueue = self->_serializationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__FigCPEFPAirPlaySession_beginSessionWithCompletionQueue_completionHandler___block_invoke;
  block[3] = &unk_1E2FBB600;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(serializationQueue, block);
}

void __76__FigCPEFPAirPlaySession_beginSessionWithCompletionQueue_completionHandler___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  NSObject *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t, void (*)(CFTypeRef, CFTypeRef, int, uint64_t), _QWORD *);
  uint64_t v13;
  _QWORD block[5];
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[8])
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__FigCPEFPAirPlaySession_beginSessionWithCompletionQueue_completionHandler___block_invoke_4;
    block[3] = &unk_1E2F98E38;
    v3 = *(NSObject **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 48);
    v4 = block;
LABEL_3:
    dispatch_async(v3, v4);
    return;
  }
  v17 = 0;
  v5 = objc_msgSend(v2, "createPicRequestWithError:", &v17);
  if (!v5)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __76__FigCPEFPAirPlaySession_beginSessionWithCompletionQueue_completionHandler___block_invoke_3;
    v15[3] = &unk_1E2FBB5D8;
    v3 = *(NSObject **)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 48);
    v15[4] = v17;
    v15[5] = v13;
    v4 = v15;
    goto LABEL_3;
  }
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __76__FigCPEFPAirPlaySession_beginSessionWithCompletionQueue_completionHandler___block_invoke_2;
    v16[3] = &unk_1E2F98E38;
    v3 = *(NSObject **)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 48);
    v4 = v16;
    goto LABEL_3;
  }
  v6 = v5;
  v7 = malloc_type_malloc(0x20uLL, 0xE00409EA085F3uLL);
  *v7 = *(id *)(a1 + 32);
  v8 = (const void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", 0x1E300AB78);
  v7[1] = v8;
  if (v8)
    CFRetain(v8);
  v7[3] = *(id *)(a1 + 48);
  v7[2] = *(_QWORD *)(a1 + 40);
  dispatch_retain(*(dispatch_object_t *)(a1 + 40));
  v9 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(v9 + 40);
  v10 = *(_QWORD *)(v9 + 48);
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t, void (*)(CFTypeRef, CFTypeRef, int, uint64_t), _QWORD *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
  if (v12)
    v12(v11, v6, v10, authorizeItemCompletionHandler, v7);
}

uint64_t __76__FigCPEFPAirPlaySession_beginSessionWithCompletionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -12150, 0), CFSTR("Error")));
}

uint64_t __76__FigCPEFPAirPlaySession_beginSessionWithCompletionQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0C99D80];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (!v2)
    v2 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -12162, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, objc_msgSend(v1, "dictionaryWithObject:forKey:", v2, CFSTR("Error")));
}

uint64_t __76__FigCPEFPAirPlaySession_beginSessionWithCompletionQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -12162, 0), CFSTR("Error")));
}

- (void)endSession
{
  NSObject *serializationQueue;
  _QWORD block[5];

  serializationQueue = self->_serializationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__FigCPEFPAirPlaySession_endSession__block_invoke;
  block[3] = &unk_1E2F88548;
  block[4] = self;
  dispatch_sync(serializationQueue, block);
}

uint64_t __36__FigCPEFPAirPlaySession_endSession__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = 1;
  return result;
}

@end
