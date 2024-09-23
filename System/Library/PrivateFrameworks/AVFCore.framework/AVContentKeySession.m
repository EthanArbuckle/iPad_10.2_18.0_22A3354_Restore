@implementation AVContentKeySession

uint64_t __46__AVContentKeySession_addContentKeyRecipient___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64);
  if (!v2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64) = (id)objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64);
  }
  result = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    {
      v4 = *(_QWORD *)(a1 + 48);
LABEL_6:
      *(_BYTE *)(*(_QWORD *)(v4 + 8) + 24) = 1;
      return result;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      result = objc_msgSend(*(id *)(a1 + 40), "_attachedToExternalContentKeySession");
      if ((_DWORD)result)
      {
        v4 = *(_QWORD *)(a1 + 56);
        goto LABEL_6;
      }
    }
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
    {
      result = objc_msgSend(*(id *)(a1 + 40), "_attachToContentKeySession:contentKeyBoss:failedSinceAlreadyAttachedToAnotherSession:");
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result;
    }
    if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64), "addObject:", *(_QWORD *)(a1 + 40));
      if (dword_1EE2B0250)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        return fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
  }
  return result;
}

void __41__AVContentKeySession_setDelegate_queue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;

  v2 = *(NSObject **)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 160);
  if (v2 != v3)
  {
    if (v3)
    {
      dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 160));
      v2 = *(NSObject **)(a1 + 32);
    }
    if (v2)
    {
      dispatch_retain(v2);
      v4 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v4 = 0;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 160) = v4;
  }
}

- (int)createAndInstallCustomURLHandlerForAsset:(id)a3 outHandler:(const OpaqueFigCustomURLHandler *)a4
{
  uint64_t CMBaseObject;
  uint64_t (*v7)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v8;
  NSObject *v9;
  NSObject *v10;
  CFTypeRef v11;
  uint64_t (*v12)(CFTypeRef, uint64_t, const char *, AVContentKeySession *, NSObject *, void *, _QWORD, CFTypeRef *);
  int v13;
  int v14;
  CFTypeRef v16;
  CFTypeRef cf;

  v16 = 0;
  cf = 0;
  if (!objc_msgSend(a3, "_figAsset"))
  {
    v8 = FigSignalErrorAt();
    goto LABEL_18;
  }
  CMBaseObject = FigAssetGetCMBaseObject();
  v7 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v7)
  {
    v10 = 0;
    goto LABEL_9;
  }
  v8 = v7(CMBaseObject, *MEMORY[0x1E0CC39A0], *MEMORY[0x1E0C9AE00], &cf);
  if (v8)
  {
LABEL_18:
    v14 = v8;
    v10 = 0;
    goto LABEL_10;
  }
  v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = dispatch_queue_create("com.apple.avfoundation.avcontentkeysession.handler", v9);
  v11 = cf;
  v12 = *(uint64_t (**)(CFTypeRef, uint64_t, const char *, AVContentKeySession *, NSObject *, void *, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
  if (!v12)
  {
LABEL_9:
    v14 = -12782;
    goto LABEL_10;
  }
  v13 = v12(v11, 400, "AVContentKeySession", self, v10, &createAndInstallCustomURLHandlerForAsset_outHandler__sHandlerCallbacks, 0, &v16);
  v14 = v13;
  if (a4 && !v13)
  {
    *a4 = (const OpaqueFigCustomURLHandler *)v16;
    v16 = 0;
  }
LABEL_10:
  if (cf)
    CFRelease(cf);
  if (v16)
    CFRelease(v16);
  if (v10)
    dispatch_release(v10);
  return v14;
}

- (id)_weakReference
{
  return self->_session->_weakReference;
}

- (id)_contentKeyGroups
{
  return self->_session->_contentKeyGroups;
}

- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)delegateQueue
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *delegateReadWriteQueue;
  void *v12;
  uint64_t v13[6];

  if (delegate && !delegateQueue)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("valid delegateQueue is required"), 0, v4, v5, v6, v7, v13[0]), 0);
    objc_exception_throw(v12);
  }
  delegateReadWriteQueue = self->_session->_delegateReadWriteQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = (uint64_t)__41__AVContentKeySession_setDelegate_queue___block_invoke;
  v13[3] = (uint64_t)&unk_1E302FCE8;
  v13[4] = (uint64_t)delegateQueue;
  v13[5] = (uint64_t)self;
  av_readwrite_dispatch_queue_write_async(delegateReadWriteQueue, v13);
  -[AVWeakReferencingDelegateStorage setDelegate:queue:](self->_session->_delegateStorage, "setDelegate:queue:", delegate, delegateQueue);
}

- (AVContentKeySystem)keySystem
{
  return self->_session->_keySystem;
}

- (AVContentKeySession)initWithKeySystem:(id)a3 storageDirectoryAtURL:(id)a4 legacyWebKitCompatibilityMode:(BOOL)a5
{
  _BOOL4 v5;
  char v10;
  AVContentKeySession *v11;
  AVContentKeySessionInternal *v12;
  NSObject *v13;
  void *v14;
  objc_class *v15;
  const char *v16;
  AVContentKeySessionInternal *session;
  OpaqueFigContentKeyBoss *contentKeyBoss;
  OS_dispatch_queue *threadSafetyQ;
  unsigned int (*v20)(OpaqueFigContentKeyBoss *, _OWORD *, AVContentKeySession *, OS_dispatch_queue *);
  uint64_t v21;
  AVContentKeySessionInternal *v22;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVContentKeySession *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  AVContentKeySession *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  objc_super v45;
  _OWORD v46[3];
  void (*v47)(void *, uint64_t, uint64_t);
  uint64_t v48;

  v5 = a5;
  v48 = *MEMORY[0x1E0C80C00];
  v46[0] = xmmword_1E3035AD8;
  v46[1] = *(_OWORD *)&off_1E3035AE8;
  v46[2] = xmmword_1E3035AF8;
  v47 = avcks_externalProtectionStateChangedCallback;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("FairPlayStreaming")) & 1) == 0
    && (objc_msgSend(a3, "isEqualToString:", CFSTR("ClearKeySystem")) & 1) == 0
    && (objc_msgSend(a3, "isEqualToString:", CFSTR("AuthorizationTokenSystem")) & 1) == 0)
  {
    v36 = self;
    v37 = (void *)MEMORY[0x1E0C99DA0];
    v38 = *MEMORY[0x1E0C99778];
    v33 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("input keySystem is not supported"), v39, v40, v41, v42, v43, v44);
    v34 = v37;
    v35 = v38;
LABEL_24:
    objc_exception_throw((id)objc_msgSend(v34, "exceptionWithName:reason:userInfo:", v35, v33, 0));
  }
  v10 = objc_msgSend(a3, "isEqualToString:", CFSTR("FairPlayStreaming"));
  if (a4 && (v10 & 1) == 0)
  {
    v25 = self;
    v26 = (void *)MEMORY[0x1E0C99DA0];
    v27 = *MEMORY[0x1E0C99778];
    v33 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("%@ does not support storage URL"), v28, v29, v30, v31, v32, (uint64_t)a3);
    v34 = v26;
    v35 = v27;
    goto LABEL_24;
  }
  v45.receiver = self;
  v45.super_class = (Class)AVContentKeySession;
  v11 = -[AVContentKeySession init](&v45, sel_init);
  if (!v11)
    goto LABEL_18;
  v12 = objc_alloc_init(AVContentKeySessionInternal);
  v11->_session = v12;
  if (!v12)
    goto LABEL_20;
  CFRetain(v12);
  v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11->_session->_threadSafetyQ = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AVContentKeySession._threadSafetyQ", v13);
  v11->_session->_weakReference = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v11);
  v11->_session->_delegateStorage = objc_alloc_init(AVWeakReferencingDelegateStorage);
  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = (objc_class *)objc_opt_class();
  v16 = (const char *)objc_msgSend((id)objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p> contentkeysession delegate serialization queue"), NSStringFromClass(v15), v11), "UTF8String");
  v11->_session->_delegateReadWriteQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create(v16);
  v11->_session->keyRequestsByRequestID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11->_session->_storageURL = (NSURL *)objc_msgSend(a4, "copy");
  v11->_session->_keySystem = (NSString *)a3;
  v11->_session->_contentKeyGroups = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11->_session->cryptorUUIDToContentKeyRequestMap = (NSMapTable *)(id)objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v11->_session->keyRequestParamsByRequestID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11->_session->keyRequestTrackerByRequestID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11->_session->cryptorsByIdentifer = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11->_session->contentKeyRequestByKeySpecifierMap = (NSMapTable *)(id)objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v11->_session->contentKeyByKeySpecifierMap = (NSMapTable *)(id)objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v11->_session->_useContentKeyBoss = PKDIsContentKeyBossEnabled() != 0;
  if (v5)
    v11->_session->_useContentKeyBoss = 0;
  if (v11->_session->_useContentKeyBoss)
  {
    if (FigContentKeyBossCreateRemote())
      goto LABEL_20;
    session = v11->_session;
    contentKeyBoss = session->_contentKeyBoss;
    threadSafetyQ = session->_threadSafetyQ;
    v20 = *(unsigned int (**)(OpaqueFigContentKeyBoss *, _OWORD *, AVContentKeySession *, OS_dispatch_queue *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56);
    if (!v20 || v20(contentKeyBoss, v46, v11, threadSafetyQ))
      goto LABEL_20;
    v21 = -[AVContentKeySession defaultGroupID](v11, "defaultGroupID");
  }
  else
  {
    v21 = 0;
  }
  v11->_session->_defaultContentKeyGroup = -[AVContentKeyReportGroup initWithKeySystem:keySession:contentKeyBoss:useContentKeyBoss:groupID:storageDirectoryAtURL:]([AVContentKeyReportGroup alloc], "initWithKeySystem:keySession:contentKeyBoss:useContentKeyBoss:groupID:storageDirectoryAtURL:", a3, v11, v11->_session->_contentKeyBoss, v11->_session->_useContentKeyBoss, v21, a4);
  v22 = v11->_session;
  if (!v22->_defaultContentKeyGroup)
  {
LABEL_20:

    return 0;
  }
  -[NSMutableArray addObject:](v22->_contentKeyGroups, "addObject:");
LABEL_18:
  if (dword_1EE2B0250)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v11;
}

- (unint64_t)defaultGroupID
{
  NSString *v2;

  v2 = -[AVContentKeySession keySystem](self, "keySystem");
  if (-[NSString isEqualToString:](v2, "isEqualToString:", CFSTR("FairPlayStreaming")))
    return 1;
  if (-[NSString isEqualToString:](v2, "isEqualToString:", CFSTR("ClearKeySystem")))
    return 2;
  if (-[NSString isEqualToString:](v2, "isEqualToString:", CFSTR("AuthorizationTokenSystem")))
    return 3;
  return 0;
}

- (void)addContentKeyRecipient:(id)recipient
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *threadSafetyQ;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD block[10];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  if ((objc_msgSend(recipient, "mayRequireContentKeysForMediaDataProcessing") & 1) == 0)
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("cannot add this object as an AVContentKeyRecipient"), v6, v7, v8, v9, v10, v22);
    v20 = (_QWORD *)MEMORY[0x1E0C99768];
    goto LABEL_13;
  }
  threadSafetyQ = self->_session->_threadSafetyQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__AVContentKeySession_addContentKeyRecipient___block_invoke;
  block[3] = &unk_1E3035B18;
  block[4] = self;
  block[5] = recipient;
  block[6] = &v36;
  block[7] = &v32;
  block[8] = &v24;
  block[9] = &v28;
  dispatch_sync(threadSafetyQ, block);
  if (*((_BYTE *)v37 + 24))
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v21 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Content key session is already expired or failed"), v12, v13, v14, v15, v16, v22);
LABEL_12:
    v19 = v21;
    v20 = (_QWORD *)MEMORY[0x1E0C99778];
LABEL_13:
    objc_exception_throw((id)objc_msgSend(v18, "exceptionWithName:reason:userInfo:", *v20, v19, 0));
  }
  if (*((_BYTE *)v33 + 24))
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v21 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Can't add object as an AVContentKeyRecipient after it has established its own content protection"), v12, v13, v14, v15, v16, v22);
    goto LABEL_12;
  }
  if (*((_BYTE *)v29 + 24))
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v21 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Content key recipient cannot be associated with more than one instance of AVContentKeySession"), v12, v13, v14, v15, v16, v22);
    goto LABEL_12;
  }
  if (*((_DWORD *)v25 + 6))
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

+ (AVContentKeySession)contentKeySessionWithKeySystem:(AVContentKeySystem)keySystem
{
  return -[AVContentKeySession initWithKeySystem:storageDirectoryAtURL:legacyWebKitCompatibilityMode:]([AVContentKeySession alloc], "initWithKeySystem:storageDirectoryAtURL:legacyWebKitCompatibilityMode:", keySystem, 0, 0);
}

+ (OpaqueFigSecureStopManager)copyDefaultSecureStopManagerForAppIdentifier:(id)a3 storageDirectoryAtURL:(id)a4
{
  uint64_t v6;
  void (*v7)(uint64_t, id, id);

  if (!FigSecureStopManagerRemoteCopyDefaultRuntimeInstance())
  {
    v6 = copyDefaultSecureStopManagerForAppIdentifier_storageDirectoryAtURL__manager;
    v7 = *(void (**)(uint64_t, id, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v7)
      v7(v6, a3, a4);
  }
  return (OpaqueFigSecureStopManager *)copyDefaultSecureStopManagerForAppIdentifier_storageDirectoryAtURL__manager;
}

- (AVContentKeySession)init
{
  AVContentKeySession *v4;
  void *v5;
  uint64_t v6;
  NSString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = self;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  v7 = NSStringFromSelector(sel_contentKeySessionWithKeySystem_);
  v13 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Use %@ instead."), v8, v9, v10, v11, v12, (uint64_t)v7), 0);
  objc_exception_throw(v13);
}

- (AVContentKeySession)initWithStorageDirectoryAtURL:(id)a3
{
  return -[AVContentKeySession initWithKeySystem:storageDirectoryAtURL:legacyWebKitCompatibilityMode:](self, "initWithKeySystem:storageDirectoryAtURL:legacyWebKitCompatibilityMode:", CFSTR("FairPlayStreaming"), a3, 1);
}

- (void)didProvideKeyRequestWithBoss:(OpaqueFigContentKeyBoss *)a3 keySpecifier:(OpaqueFigContentKeySpecifier *)a4 requestID:(unint64_t)a5 renewalRequest:(BOOL)a6 supportsOfflineKey:(BOOL)a7
{
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t Identifier;
  AVContentKeyRequest *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL4 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v29 = a6;
  v35 = *MEMORY[0x1E0C80C00];
  v11 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_session->keyRequestParamsByRequestID, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5));
  v12 = objc_msgSend(v11, "initializationData");
  v13 = objc_msgSend(v11, "contentIdentifier");
  v14 = objc_msgSend(v11, "keyIDFromInitializationData");
  v15 = objc_msgSend(v11, "options");
  if (objc_msgSend(v11, "identifier"))
    Identifier = objc_msgSend(v11, "identifier");
  else
    Identifier = FigContentKeySpecifierGetIdentifier();
  LOBYTE(v27) = a7;
  LOBYTE(v26) = 0;
  LOBYTE(v25) = v29;
  v17 = -[AVContentKeyRequest initWithContentKeySession:contentKeyBoss:useContentKeyBoss:keySpecifier:initializationData:keyIDFromInitializationData:contentIdentifier:isRenewalRequest:requestID:providesPersistableKey:preloadingRequestOptions:identifier:supportsOfflineKey:]([AVContentKeyRequest alloc], "initWithContentKeySession:contentKeyBoss:useContentKeyBoss:keySpecifier:initializationData:keyIDFromInitializationData:contentIdentifier:isRenewalRequest:requestID:providesPersistableKey:preloadingRequestOptions:identifier:supportsOfflineKey:", self, a3, self->_session->_useContentKeyBoss, a4, v12, v14, v13, v25, a5, v26, v15, Identifier, v27);
  v18 = -[NSMutableDictionary objectForKeyedSubscript:](self->_session->keyRequestTrackerByRequestID, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5));
  if (v17)
  {
    v19 = (void *)v18;
    -[AVContentKeySession trackRequest:byRequestID:](self, "trackRequest:byRequestID:", v17, a5);
    if (v19)
    {
      objc_msgSend(v19, "addRequest:", v17);
      if (objc_msgSend(v19, "haveAllRequestsBeenReceived"))
      {
        v20 = (void *)objc_msgSend(v19, "requests");
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v31 != v23)
                objc_enumerationMutation(v20);
              -[NSMutableDictionary removeObjectForKey:](self->_session->keyRequestTrackerByRequestID, "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "_requestID")));
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          }
          while (v22);
        }
        -[AVContentKeySession issueContentKeyRequests:forInitializationData:](self, "issueContentKeyRequests:forInitializationData:", v20, v12);
      }
    }
    else if (v29)
    {
      -[AVContentKeySession issueRenewableContentKeyRequest:](self, "issueRenewableContentKeyRequest:", v17);
    }
    else
    {
      -[AVContentKeySession issueContentKeyRequest:](self, "issueContentKeyRequest:", v17);
    }

  }
}

- (void)removeResourcesForID:(unint64_t)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_session->keyRequestsByRequestID, "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:"));
  -[NSMutableDictionary removeObjectForKey:](self->_session->keyRequestParamsByRequestID, "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3));
}

- (void)contentKeyRequestDidSucceedWithBoss:(OpaqueFigContentKeyBoss *)a3 keySpecifier:(OpaqueFigContentKeySpecifier *)a4 requestID:(unint64_t)a5 cryptor:(OpaqueFigCPECryptor *)a6
{
  id v10;
  id v11;
  __CFString *v12;
  NSMutableDictionary *cryptorsByIdentifer;
  const void *Identifier;

  v10 = -[AVContentKeySession keyRequestByID:](self, "keyRequestByID:", a5);
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v10, "_handleKeyResponseSuccessWithCryptor:", a6);
    v12 = (__CFString *)CFCopyDescription(a4);
    -[NSMapTable setObject:forKey:](self->_session->contentKeyRequestByKeySpecifierMap, "setObject:forKey:", v11, v12);

  }
  if (a6)
  {
    cryptorsByIdentifer = self->_session->cryptorsByIdentifer;
    Identifier = (const void *)FigContentKeySpecifierGetIdentifier();
    CFDictionarySetValue((CFMutableDictionaryRef)cryptorsByIdentifer, Identifier, a6);
  }
  -[AVContentKeySession removeResourcesForID:](self, "removeResourcesForID:", a5);
}

- (void)externalProtectionStateChangedCallbackWithBoss:(OpaqueFigContentKeyBoss *)a3 keySpecifier:(OpaqueFigContentKeySpecifier *)a4
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83__AVContentKeySession_externalProtectionStateChangedCallbackWithBoss_keySpecifier___block_invoke;
  v5[3] = &unk_1E3035AB8;
  v5[4] = self;
  v5[5] = a4;
  if (a4)
    CFRetain(a4);
  -[AVContentKeySession _invokeDelegateCallbackWithBlock:synchronouslyWhenDelegateQueueIsNULL:](self, "_invokeDelegateCallbackWithBlock:synchronouslyWhenDelegateQueueIsNULL:", v5, 1);
}

void __83__AVContentKeySession_externalProtectionStateChangedCallbackWithBoss_keySpecifier___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;

  v4 = (__CFString *)CFCopyDescription(*(CFTypeRef *)(a1 + 40));
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 128), "objectForKey:", v4);
  if (a2)
  {
    v6 = v5;
    if (v5)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(a2, "contentKeySession:externalProtectionStatusDidChangeForContentKeyRequest:", *(_QWORD *)(a1 + 32), v6);
    }
  }
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 136), "objectForKey:", v4);
  if (a2)
  {
    v8 = v7;
    if (v7)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(a2, "contentKeySession:externalProtectionStatusDidChangeForContentKey:", *(_QWORD *)(a1 + 32), v8);
    }
  }

  v9 = *(const void **)(a1 + 40);
  if (v9)
    CFRelease(v9);
}

+ (AVContentKeySession)contentKeySessionWithLegacyWebKitCompatibilityModeAndKeySystem:(id)a3 storageDirectoryAtURL:(id)a4
{
  return -[AVContentKeySession initWithKeySystem:storageDirectoryAtURL:legacyWebKitCompatibilityMode:]([AVContentKeySession alloc], "initWithKeySystem:storageDirectoryAtURL:legacyWebKitCompatibilityMode:", a3, a4, 1);
}

+ (AVContentKeySession)contentKeySessionWithKeySystem:(AVContentKeySystem)keySystem storageDirectoryAtURL:(NSURL *)storageURL
{
  return -[AVContentKeySession initWithKeySystem:storageDirectoryAtURL:legacyWebKitCompatibilityMode:]([AVContentKeySession alloc], "initWithKeySystem:storageDirectoryAtURL:legacyWebKitCompatibilityMode:", keySystem, storageURL, 0);
}

- (void)_willDeallocOrFinalize
{
  dispatch_object_t *session;

  session = (dispatch_object_t *)self->_session;
  if (session)
  {
    if (session[7])
    {
      dispatch_release(session[7]);
      session = (dispatch_object_t *)self->_session;
    }
    CFRelease(session);
  }
}

- (void)dealloc
{
  AVContentKeySessionInternal *session;
  AVContentKeySessionInternal *v4;
  NSObject *delegateReadWriteQueue;
  NSObject *delegateQueue;
  OpaqueFigContentKeyBoss *contentKeyBoss;
  objc_super v8;

  -[AVContentKeySession _willDeallocOrFinalize](self, "_willDeallocOrFinalize");
  session = self->_session;
  if (session)
  {

    v4 = self->_session;
    delegateReadWriteQueue = v4->_delegateReadWriteQueue;
    if (delegateReadWriteQueue)
    {
      dispatch_release(delegateReadWriteQueue);
      v4 = self->_session;
    }
    delegateQueue = v4->_delegateQueue;
    if (delegateQueue)
    {
      dispatch_release(delegateQueue);
      v4 = self->_session;
    }
    contentKeyBoss = v4->_contentKeyBoss;
    if (contentKeyBoss)
    {
      CFRelease(contentKeyBoss);
      v4 = self->_session;
    }

  }
  v8.receiver = self;
  v8.super_class = (Class)AVContentKeySession;
  -[AVContentKeySession dealloc](&v8, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p expired:%d>"), NSStringFromClass(v4), self, self->_session->_isExpired);
}

- (id)delegate
{
  return -[AVWeakReferencingDelegateStorage delegate](self->_session->_delegateStorage, "delegate");
}

- (dispatch_queue_t)delegateQueue
{
  return (dispatch_queue_t)-[AVWeakReferencingDelegateStorage delegateQueue](self->_session->_delegateStorage, "delegateQueue");
}

- (NSURL)storageURL
{
  return self->_session->_storageURL;
}

- (BOOL)isInternal
{
  return self->_session->_internal;
}

- (void)removeContentKeyRecipient:(id)recipient
{
  NSObject *threadSafetyQ;
  _QWORD v4[6];

  threadSafetyQ = self->_session->_threadSafetyQ;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__AVContentKeySession_removeContentKeyRecipient___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = recipient;
  v4[5] = self;
  dispatch_sync(threadSafetyQ, v4);
}

uint64_t __49__AVContentKeySession_removeContentKeyRecipient___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    result = objc_msgSend(*(id *)(a1 + 32), "_attachToContentKeySession:contentKeyBoss:failedSinceAlreadyAttachedToAnotherSession:", 0, 0, 0);
  if (*(_QWORD *)(a1 + 32))
    result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 64), "removeObject:");
  if (dword_1EE2B0250)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (NSArray)contentKeyRecipients
{
  NSObject *threadSafetyQ;
  NSArray *v3;
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
  v9 = __Block_byref_object_copy__45;
  v10 = __Block_byref_object_dispose__45;
  v11 = 0;
  threadSafetyQ = self->_session->_threadSafetyQ;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__AVContentKeySession_contentKeyRecipients__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(threadSafetyQ, v5);
  v3 = (NSArray *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__AVContentKeySession_contentKeyRecipients__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64), "allObjects");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)expire
{
  NSObject *threadSafetyQ;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD block[7];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  uint64_t v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v32 = 0;
  v33 = &v32;
  v34 = 0x3052000000;
  v35 = __Block_byref_object_copy__45;
  v36 = __Block_byref_object_dispose__45;
  v37 = 0;
  v27 = &v26;
  v28 = 0x3052000000;
  v29 = __Block_byref_object_copy__45;
  v30 = __Block_byref_object_dispose__45;
  v31 = 0;
  threadSafetyQ = self->_session->_threadSafetyQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__AVContentKeySession_expire__block_invoke;
  block[3] = &unk_1E3031A40;
  block[4] = self;
  block[5] = &v32;
  block[6] = &v26;
  v26 = 0;
  dispatch_sync(threadSafetyQ, block);
  v4 = (void *)v27[5];
  if (v4)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v39, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v22 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "expire");
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v39, 16);
      }
      while (v5);
    }
  }
  if (v33[5])
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = (void *)v33[5];
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v38, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v9; ++j)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
          if (dword_1EE2B0250)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          objc_msgSend(v12, "expire", v15, v16);
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v38, 16);
      }
      while (v9);
    }
  }
  if (dword_1EE2B0250)
  {
    v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
}

uint64_t __29__AVContentKeySession_expire__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (!*(_BYTE *)(v1 + 40))
  {
    v2 = result;
    *(_BYTE *)(v1 + 40) = 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(result + 32)+ 8)+ 64), "allObjects");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 80), "removeAllObjects");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8)+ 88), "copy");
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 88), "removeAllObjects");
  }
  return result;
}

- (NSData)contentProtectionSessionIdentifier
{
  AVContentKeySessionInternal *session;
  NSObject *threadSafetyQ;
  _QWORD block[5];

  session = self->_session;
  if (!session->_contentKeyBoss)
    return -[AVContentKeyReportGroup contentProtectionSessionIdentifier](session->_defaultContentKeyGroup, "contentProtectionSessionIdentifier");
  threadSafetyQ = session->_threadSafetyQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__AVContentKeySession_contentProtectionSessionIdentifier__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_sync(threadSafetyQ, block);
  return self->_session->_protectorSessionIdentifier;
}

_QWORD *__57__AVContentKeySession_contentProtectionSessionIdentifier__block_invoke(_QWORD *result)
{
  _QWORD *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(result[4] + 8) + 144))
  {
    v1 = result;
    v2[0] = 0;
    v2[1] = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "getUUIDBytes:", v2);
    result = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v2, 16);
    *(_QWORD *)(*(_QWORD *)(v1[4] + 8) + 144) = result;
  }
  return result;
}

- (void)processContentKeyRequestForSinf:(id)a3 initializationData:(id)a4 groupID:(unint64_t)a5 options:(id)a6
{
  uint64_t v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  AVContentKeyRequestParams *v15;
  void *v16;
  void *v17;

  v16 = 0;
  v17 = 0;
  PKDCopyDefaultKeyIDFromSinfArray();
  v10 = objc_msgSend(0, "base64EncodedStringWithOptions:", 0);
  if (PKDCopyDecryptFormatTypeFromSinfArray()
    || ((v11 = +[AVContentKeyRequest _ensureProtocolVersionList:](AVContentKeyRequest, "_ensureProtocolVersionList:", objc_msgSend(a6, "objectForKeyedSubscript:", CFSTR("ProtocolVersionsKey"))), !FigCFEqual())? (v12 = 1): (v12 = 2), (v13 = -[AVContentKeySession _processContentKeyRequestWithIdentifier:encryptionMethod:supportedProtocolVersions:options:groupID:error:](self, "_processContentKeyRequestWithIdentifier:encryptionMethod:supportedProtocolVersions:options:groupID:error:", v10, v12, v11, a6, a5, 0, 0, 0)) == 0))
  {
    v15 = 0;
  }
  else
  {
    v14 = v13;
    v15 = -[AVContentKeyRequestParams initWithInitializationData:contentIdentifier:keyIDFromInitializationData:options:identifier:]([AVContentKeyRequestParams alloc], "initWithInitializationData:contentIdentifier:keyIDFromInitializationData:options:identifier:", a4, v16, v16, a6, v10);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_session->keyRequestParamsByRequestID, "setObject:forKeyedSubscript:", v15, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v14));
  }

}

- (void)processContentKeyRequestForPSSHEntries:(id)a3 initializationData:(id)a4 groupID:(unint64_t)a5 options:(id)a6
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  AVContentKeyRequestParams *v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v26;
  AVContentKeyPSSHRequestTracker *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v33 = 0;
  v34 = 0;
  if (FigPKDParsePSSHAndCopyContentKeyInfo())
  {

  }
  else
  {
    if (FigCFEqual())
      v8 = 2;
    else
      v8 = 1;
    v26 = v8;
    v28 = -[AVContentKeyPSSHRequestTracker initWithRequestCount:]([AVContentKeyPSSHRequestTracker alloc], "initWithRequestCount:", objc_msgSend(v33, "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v33;
    v9 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v9)
    {
      v10 = v9;
      v24 = *(_QWORD *)v30;
      v23 = *MEMORY[0x1E0CC49C0];
      v22 = *MEMORY[0x1E0CC49B8];
      v21 = *MEMORY[0x1E0CC49B0];
LABEL_7:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v11);
        v13 = +[AVContentKeyRequest _ensureProtocolVersionList:](AVContentKeyRequest, "_ensureProtocolVersionList:", objc_msgSend(v12, "objectForKeyedSubscript:", v23));
        v14 = (void *)objc_msgSend(v12, "objectForKeyedSubscript:", v22);
        v15 = objc_msgSend(v12, "objectForKeyedSubscript:", v21);
        v16 = objc_msgSend(v14, "base64EncodedStringWithOptions:", 0);
        v17 = -[AVContentKeySession _processContentKeyRequestWithIdentifier:encryptionMethod:supportedProtocolVersions:options:groupID:error:](self, "_processContentKeyRequestWithIdentifier:encryptionMethod:supportedProtocolVersions:options:groupID:error:", v16, v26, v13, a6, a5, 0);
        if (!v17)
          break;
        v18 = v17;
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_session->keyRequestTrackerByRequestID, "setObject:forKeyedSubscript:", v28, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v17));
        v19 = -[AVContentKeyRequestParams initWithInitializationData:contentIdentifier:keyIDFromInitializationData:options:identifier:]([AVContentKeyRequestParams alloc], "initWithInitializationData:contentIdentifier:keyIDFromInitializationData:options:identifier:", a4, v15, v14, a6, v16);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_session->keyRequestParamsByRequestID, "setObject:forKeyedSubscript:", v19, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v18));

        if (v10 == ++v11)
        {
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
          if (v10)
            goto LABEL_7;
          break;
        }
      }
    }

  }
}

- (void)processContentKeyRequestForTransportStreamWithCodecType:(id)a3 initializationData:(id)a4 groupID:(unint64_t)a5 options:(id)a6
{
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  AVContentKeyRequestParams *v13;

  objc_msgSend(a3, "integerValue");
  if (PKDCopyDecryptFormatTypeFromCodecType()
    || (!FigCFEqual() ? (v10 = 1) : (v10 = 2),
        (v11 = -[AVContentKeySession _processContentKeyRequestWithIdentifier:encryptionMethod:supportedProtocolVersions:options:groupID:error:](self, "_processContentKeyRequestWithIdentifier:encryptionMethod:supportedProtocolVersions:options:groupID:error:", PKDGetIdentifierForTransportStream(), v10, +[AVContentKeyRequest _ensureProtocolVersionList:](AVContentKeyRequest, "_ensureProtocolVersionList:", 0), a6, a5, 0)) == 0))
  {
    v13 = 0;
  }
  else
  {
    v12 = v11;
    v13 = -[AVContentKeyRequestParams initWithInitializationData:contentIdentifier:keyIDFromInitializationData:options:identifier:]([AVContentKeyRequestParams alloc], "initWithInitializationData:contentIdentifier:keyIDFromInitializationData:options:identifier:", a4, 0, 0, a6, PKDGetIdentifierForTransportStream());
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_session->keyRequestParamsByRequestID, "setObject:forKeyedSubscript:", v13, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12));
  }

}

- (void)_processContentKeyRequestWithIdentifier:(id)a3 initializationData:(id)a4 options:(id)a5 groupID:(unint64_t)a6
{
  AVContentKeySessionInternal *session;
  NSObject *threadSafetyQ;
  _QWORD block[9];

  session = self->_session;
  if (session->_contentKeyBoss)
  {
    threadSafetyQ = session->_threadSafetyQ;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __98__AVContentKeySession__processContentKeyRequestWithIdentifier_initializationData_options_groupID___block_invoke;
    block[3] = &unk_1E3035B40;
    block[4] = self;
    block[5] = a3;
    block[7] = a5;
    block[8] = a6;
    block[6] = a4;
    dispatch_async(threadSafetyQ, block);
  }
  else
  {
    -[AVContentKeyReportGroup processContentKeyRequestWithIdentifier:initializationData:options:](session->_defaultContentKeyGroup, "processContentKeyRequestWithIdentifier:initializationData:options:", a3, a4, a5, a6);
  }
}

uint64_t __98__AVContentKeySession__processContentKeyRequestWithIdentifier_initializationData_options_groupID___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = 0;
  v9 = 0;
  v10 = 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v13 = *MEMORY[0x1E0C9AFA8];
    v14[0] = CFSTR("An expired content key session cannot process content key request");
    LOBYTE(v8) = 0;
    return -[AVContentKeyRequest _setError:](-[AVContentKeyRequest initWithContentKeySession:reportGroup:identifier:contentIdentifier:keyIDFromInitializationData:initializationData:preloadingRequestOptions:providesPersistableKey:]([AVContentKeyRequest alloc], "initWithContentKeySession:reportGroup:identifier:contentIdentifier:keyIDFromInitializationData:initializationData:preloadingRequestOptions:providesPersistableKey:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 48), 0, v8), "_setError:", AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11862, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1)));
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
    {
      result = avcks_decodeInitializationDataAndCopyInformation(v3, &v11, &v9, 0, (uint64_t *)&v10, &v12);
      if (!(_DWORD)result)
      {
        if (v12)
        {
          return objc_msgSend(*(id *)(a1 + 32), "processContentKeyRequestForPSSHEntries:initializationData:groupID:options:", v12, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
        }
        else if (v11)
        {
          return objc_msgSend(*(id *)(a1 + 32), "processContentKeyRequestForSinf:initializationData:groupID:options:", v11, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
        }
        else
        {
          result = objc_msgSend(v10, "isEqual:", CFSTR("mpts"));
          if ((_DWORD)result)
            return objc_msgSend(*(id *)(a1 + 32), "processContentKeyRequestForTransportStreamWithCodecType:initializationData:groupID:options:", v9, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
        }
      }
    }
    else
    {
      v4 = (void *)objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", CFSTR("HLSMethodKey"));
      +[AVContentKeyRequest _validateHLSEncryptionMethod:](AVContentKeyRequest, "_validateHLSEncryptionMethod:", v4);
      v5 = (id)objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", CFSTR("ProtocolVersionsKey"));
      v6 = *(_QWORD **)(a1 + 32);
      if (*(__CFString **)(v6[1] + 72) == CFSTR("FairPlayStreaming"))
      {
        if (objc_msgSend(v4, "isEqual:", CFSTR("ISO_23001_7")))
          v7 = 2;
        else
          v7 = 1;
        v5 = +[AVContentKeyRequest _ensureProtocolVersionList:](AVContentKeyRequest, "_ensureProtocolVersionList:", v5);
        v6 = *(_QWORD **)(a1 + 32);
      }
      else
      {
        v7 = 0;
      }
      return objc_msgSend(v6, "_processContentKeyRequestWithIdentifier:encryptionMethod:supportedProtocolVersions:options:groupID:error:", *(_QWORD *)(a1 + 40), v7, v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 0);
    }
  }
  return result;
}

- (void)processContentKeyRequestWithIdentifier:(id)identifier initializationData:(NSData *)initializationData options:(NSDictionary *)options
{
  -[AVContentKeySession _processContentKeyRequestWithIdentifier:initializationData:options:groupID:](self, "_processContentKeyRequestWithIdentifier:initializationData:options:groupID:", identifier, initializationData, options, -[AVContentKeySession defaultGroupID](self, "defaultGroupID"));
}

- (void)renewExpiringResponseDataForContentKeyRequest:(AVContentKeyRequest *)contentKeyRequest
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v11;
  const __CFString **v12;
  uint64_t *v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  NSString *v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v21 = 0;
  if (!contentKeyRequest)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v17 = CFSTR("valid contentKeyRequest is required");
    goto LABEL_25;
  }
  if (!-[NSString isEqualToString:](-[AVContentKeySession keySystem](self, "keySystem"), "isEqualToString:", CFSTR("FairPlayStreaming")))
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v19 = -[AVContentKeySession keySystem](self, "keySystem");
    v17 = CFSTR("%@ does not support key renewal");
LABEL_25:
    v18 = (void *)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v17, v3, v4, v5, v6, v7, (uint64_t)v19), 0);
    objc_exception_throw(v18);
  }
  if (!-[AVContentKeySession delegate](self, "delegate"))
  {
    v28 = *MEMORY[0x1E0C9AFA8];
    v29[0] = CFSTR("Cannot renew content key request since there's no delegate set on the content key session");
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = (const __CFString **)v29;
    v13 = &v28;
    goto LABEL_13;
  }
  if (self->_session->_isExpired)
  {
    v26 = *MEMORY[0x1E0C9AFA8];
    v27 = CFSTR("Cannot renew content key request using an expired content key session");
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = &v27;
    v13 = &v26;
    goto LABEL_13;
  }
  if (-[AVContentKeyRequest status](contentKeyRequest, "status") >= AVContentKeyRequestStatusCancelled)
  {
    v24 = *MEMORY[0x1E0C9AFA8];
    v25 = CFSTR("Cannot renew content key request that was previously cancelled or failed");
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = &v25;
    v13 = &v24;
    goto LABEL_13;
  }
  if (-[AVContentKeyRequest status](contentKeyRequest, "status") == AVContentKeyRequestStatusRequestingResponse)
  {
    v22 = *MEMORY[0x1E0C9AFA8];
    v23 = CFSTR("Cannot renew while content key request is waiting for a response");
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = &v23;
    v13 = &v22;
LABEL_13:
    v21 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11862, (void *)objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 1));
    if (!v21)
      goto LABEL_15;
    goto LABEL_14;
  }
  if (self->_session->_contentKeyBoss)
  {
    -[AVContentKeySession _renewKeyWithIdentifier:encryptionMethod:initializationData:contentIdentifier:keyIDFromInitializationData:options:error:](self, "_renewKeyWithIdentifier:encryptionMethod:initializationData:contentIdentifier:keyIDFromInitializationData:options:error:", -[AVContentKeyRequest identifierString](contentKeyRequest, "identifierString"), -[AVContentKeyRequest _encryptionMethod](contentKeyRequest, "_encryptionMethod"), -[AVContentKeyRequest initializationData](contentKeyRequest, "initializationData"), -[AVContentKeyRequest contentIdentifier](contentKeyRequest, "contentIdentifier"), -[AVContentKeyRequest keyIDFromInitializationData](contentKeyRequest, "keyIDFromInitializationData"), -[AVContentKeyRequest options](contentKeyRequest, "options"), &v21);
  }
  else
  {
    if (!-[AVContentKeyRequest _prepareForKeyRenewalReturningError:](contentKeyRequest, "_prepareForKeyRenewalReturningError:", &v21))goto LABEL_21;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __69__AVContentKeySession_renewExpiringResponseDataForContentKeyRequest___block_invoke;
    v20[3] = &unk_1E3035A40;
    v20[4] = self;
    v20[5] = contentKeyRequest;
    -[AVContentKeySession _invokeDelegateCallbackWithBlock:synchronouslyWhenDelegateQueueIsNULL:](self, "_invokeDelegateCallbackWithBlock:synchronouslyWhenDelegateQueueIsNULL:", v20, 1);
  }
  -[AVContentKeyRequest _setStatus:](contentKeyRequest, "_setStatus:", 2);
LABEL_21:
  if (v21)
LABEL_14:
    -[AVContentKeyRequest _setError:](contentKeyRequest, "_setError:");
LABEL_15:
  if (dword_1EE2B0250)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

uint64_t __69__AVContentKeySession_renewExpiringResponseDataForContentKeyRequest___block_invoke(uint64_t result, void *a2)
{
  uint64_t v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = result;
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
    {
      if (dword_1EE2B0250)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return objc_msgSend(a2, "contentKeySession:didProvideRenewingContentKeyRequest:", *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40), v5, v6);
    }
  }
  return result;
}

- (void)makeSecureTokenForExpirationDateOfPersistableContentKey:(NSData *)persistableContentKeyData completionHandler:(void *)handler
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  signed int v12;
  OpaqueFigContentKeyBoss *contentKeyBoss;
  uint64_t (*v14)(OpaqueFigContentKeyBoss *, CFTypeRef, _QWORD *);
  signed int v15;
  NSObject *global_queue;
  _QWORD *v17;
  uint64_t v18;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  NSString *keySystem;
  _QWORD v25[7];
  _QWORD block[7];
  os_log_type_t type;
  int v28;
  CFTypeRef cf;
  _QWORD v30[25];

  v30[24] = *MEMORY[0x1E0C80C00];
  if (!handler)
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99778];
    v22 = CFSTR("valid completion handler is required");
    goto LABEL_21;
  }
  if (!persistableContentKeyData)
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99778];
    v22 = CFSTR("valid persistableContentKeyData is required");
    goto LABEL_21;
  }
  if (!-[NSString isEqualToString:](self->_session->_keySystem, "isEqualToString:", CFSTR("FairPlayStreaming")))
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99778];
    keySystem = self->_session->_keySystem;
    v22 = CFSTR("%@ does not support this operation");
LABEL_21:
    v23 = (void *)objc_msgSend(v20, "exceptionWithName:reason:userInfo:", v21, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v22, (uint64_t)handler, v4, v5, v6, v7, (uint64_t)keySystem), 0);
    objc_exception_throw(v23);
  }
  if (!self->_session->_contentKeyBoss)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __97__AVContentKeySession_makeSecureTokenForExpirationDateOfPersistableContentKey_completionHandler___block_invoke_2;
    v25[3] = &unk_1E3031070;
    v25[4] = persistableContentKeyData;
    v25[5] = self;
    v25[6] = handler;
    v17 = v25;
    goto LABEL_17;
  }
  cf = 0;
  v30[0] = 0;
  v12 = FigContentKeySecureTokenRequestParamsCreate();
  if (!v12)
  {
    contentKeyBoss = self->_session->_contentKeyBoss;
    v14 = *(uint64_t (**)(OpaqueFigContentKeyBoss *, CFTypeRef, _QWORD *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 16)
                                                                                   + 96);
    if (!v14)
    {
      v15 = -12782;
      goto LABEL_11;
    }
    v12 = v14(contentKeyBoss, cf, v30);
  }
  v15 = v12;
LABEL_11:
  if (v15)
    v18 = AVLocalizedErrorWithUnderlyingOSStatusAndUnderlyingError(v15, 0, 0, 1);
  else
    v18 = 0;
  if (dword_1EE2B0250)
  {
    v28 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__AVContentKeySession_makeSecureTokenForExpirationDateOfPersistableContentKey_completionHandler___block_invoke;
  block[3] = &unk_1E3031B30;
  block[5] = v18;
  block[6] = handler;
  block[4] = v30[0];
  v17 = block;
LABEL_17:
  dispatch_async(global_queue, v17);
}

void __97__AVContentKeySession_makeSecureTokenForExpirationDateOfPersistableContentKey_completionHandler___block_invoke(uint64_t a1)
{
  const void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
}

void __97__AVContentKeySession_makeSecureTokenForExpirationDateOfPersistableContentKey_completionHandler___block_invoke_2(_QWORD *a1)
{
  signed int v2;
  uint64_t v3;
  const void *v4;
  id v5;
  _QWORD *v6;
  uint64_t (*v7)(const void *, id, _QWORD, id *);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v9;
  char v10;
  id v11;
  void *v12[25];

  v12[24] = *(void **)MEMORY[0x1E0C80C00];
  v11 = 0;
  v12[0] = 0;
  v10 = 0;
  v9 = 0;
  v2 = PKDPersistentKeyIsForCTRModeDecryption();
  if (v2)
  {
    v4 = 0;
    goto LABEL_10;
  }
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 48), "createCryptorIfNecessaryForIdentifier:initializationData:formatDescription:hlsMethod:error:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"), 0, 0, 0, v12);
  v4 = (const void *)v3;
  if (v12[0])
    goto LABEL_11;
  if (!v3)
  {
    v2 = -12158;
    goto LABEL_10;
  }
  if (!+[AVContentKeyRequest _prepareCryptor:forRenewal:andReturnKeyRequestID:isInchargeOfKeyRequest:error:](AVContentKeyRequest, "_prepareCryptor:forRenewal:andReturnKeyRequestID:isInchargeOfKeyRequest:error:", v3, 0, &v9, 0, v12))goto LABEL_11;
  v5 = +[AVContentKeyRequest _createKeyRequestDictionaryForApp:persistentKey:serverChallenge:cryptorKeyRequestID:purpose:](AVContentKeyRequest, "_createKeyRequestDictionaryForApp:persistentKey:serverChallenge:cryptorKeyRequestID:purpose:", 0, a1[4], 0, v9, 1);
  v6 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
  if (*v6 < 4uLL || (v7 = (uint64_t (*)(const void *, id, _QWORD, id *))v6[11]) == 0)
  {
    v2 = -12782;
    goto LABEL_10;
  }
  v2 = v7(v4, v5, *MEMORY[0x1E0C9AE00], &v11);
  if (v2)
LABEL_10:
    v12[0] = (void *)AVLocalizedErrorWithUnderlyingOSStatusAndUnderlyingError(v2, 0, v12[0], 1);
LABEL_11:
  if (dword_1EE2B0250)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  (*(void (**)(_QWORD, id))(a1[6] + 16))(a1[6], v11);
  if (v4)
    CFRelease(v4);

}

- (void)invalidatePersistableContentKey:(NSData *)persistableContentKeyData options:(NSDictionary *)options completionHandler:(void *)handler
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  signed int v16;
  OpaqueFigContentKeyBoss *contentKeyBoss;
  uint64_t (*v18)(OpaqueFigContentKeyBoss *, CFTypeRef, _QWORD *);
  signed int v19;
  NSObject *global_queue;
  _QWORD *v21;
  uint64_t v22;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  NSString *keySystem;
  _QWORD v29[8];
  _QWORD block[7];
  os_log_type_t type;
  int v32;
  char v33;
  CFTypeRef cf;
  _QWORD v35[25];

  v35[24] = *MEMORY[0x1E0C80C00];
  v9 = -[NSDictionary objectForKeyedSubscript:](options, "objectForKeyedSubscript:", CFSTR("ServerChallenge"));
  if (!handler)
  {
    v24 = (void *)MEMORY[0x1E0C99DA0];
    v25 = *MEMORY[0x1E0C99778];
    v26 = CFSTR("valid completion handler is required");
    goto LABEL_22;
  }
  if (!persistableContentKeyData)
  {
    v24 = (void *)MEMORY[0x1E0C99DA0];
    v25 = *MEMORY[0x1E0C99778];
    v26 = CFSTR("valid persistableContentKeyData is required");
    goto LABEL_22;
  }
  v15 = v9;
  if (!-[NSString isEqualToString:](self->_session->_keySystem, "isEqualToString:", CFSTR("FairPlayStreaming")))
  {
    v24 = (void *)MEMORY[0x1E0C99DA0];
    v25 = *MEMORY[0x1E0C99778];
    keySystem = self->_session->_keySystem;
    v26 = CFSTR("%@ does not support this operation");
LABEL_22:
    v27 = (void *)objc_msgSend(v24, "exceptionWithName:reason:userInfo:", v25, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v26, v10, v11, v12, v13, v14, (uint64_t)keySystem), 0);
    objc_exception_throw(v27);
  }
  +[AVContentKeyRequest _validateServerChallenge:](AVContentKeyRequest, "_validateServerChallenge:", v15);
  if (!self->_session->_contentKeyBoss)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __81__AVContentKeySession_invalidatePersistableContentKey_options_completionHandler___block_invoke_2;
    v29[3] = &unk_1E3033FE0;
    v29[4] = persistableContentKeyData;
    v29[5] = self;
    v29[6] = v15;
    v29[7] = handler;
    v21 = v29;
    goto LABEL_18;
  }
  cf = 0;
  v35[0] = 0;
  v33 = 0;
  v16 = PKDPersistentKeyIsForCTRModeDecryption();
  if (!v16)
  {
    v16 = FigContentKeySecureTokenRequestParamsCreate();
    if (!v16)
    {
      contentKeyBoss = self->_session->_contentKeyBoss;
      v18 = *(uint64_t (**)(OpaqueFigContentKeyBoss *, CFTypeRef, _QWORD *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                 + 16)
                                                                                     + 96);
      if (!v18)
      {
        v19 = -12782;
        goto LABEL_12;
      }
      v16 = v18(contentKeyBoss, cf, v35);
    }
  }
  v19 = v16;
LABEL_12:
  if (v19)
    v22 = AVLocalizedErrorWithUnderlyingOSStatusAndUnderlyingError(v19, 0, 0, 1);
  else
    v22 = 0;
  if (dword_1EE2B0250)
  {
    v32 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__AVContentKeySession_invalidatePersistableContentKey_options_completionHandler___block_invoke;
  block[3] = &unk_1E3031B30;
  block[5] = v22;
  block[6] = handler;
  block[4] = v35[0];
  v21 = block;
LABEL_18:
  dispatch_async(global_queue, v21);
}

void __81__AVContentKeySession_invalidatePersistableContentKey_options_completionHandler___block_invoke(uint64_t a1)
{
  const void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
}

void __81__AVContentKeySession_invalidatePersistableContentKey_options_completionHandler___block_invoke_2(_QWORD *a1)
{
  signed int v2;
  uint64_t v3;
  const void *v4;
  id v5;
  _QWORD *v6;
  uint64_t (*v7)(const void *, id, _QWORD, id *);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v9;
  char v10;
  id v11;
  void *v12[25];

  v12[24] = *(void **)MEMORY[0x1E0C80C00];
  v11 = 0;
  v12[0] = 0;
  v10 = 0;
  v9 = 0;
  v2 = PKDPersistentKeyIsForCTRModeDecryption();
  if (v2)
  {
    v4 = 0;
    goto LABEL_10;
  }
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 48), "createCryptorIfNecessaryForIdentifier:initializationData:formatDescription:hlsMethod:error:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"), 0, 0, 0, v12);
  v4 = (const void *)v3;
  if (v12[0])
    goto LABEL_11;
  if (!v3)
  {
    v2 = -12158;
    goto LABEL_10;
  }
  if (!+[AVContentKeyRequest _prepareCryptor:forRenewal:andReturnKeyRequestID:isInchargeOfKeyRequest:error:](AVContentKeyRequest, "_prepareCryptor:forRenewal:andReturnKeyRequestID:isInchargeOfKeyRequest:error:", v3, 0, &v9, 0, v12))goto LABEL_11;
  v5 = +[AVContentKeyRequest _createKeyRequestDictionaryForApp:persistentKey:serverChallenge:cryptorKeyRequestID:purpose:](AVContentKeyRequest, "_createKeyRequestDictionaryForApp:persistentKey:serverChallenge:cryptorKeyRequestID:purpose:", 0, a1[4], a1[6], v9, 2);
  v6 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
  if (*v6 < 4uLL || (v7 = (uint64_t (*)(const void *, id, _QWORD, id *))v6[11]) == 0)
  {
    v2 = -12782;
    goto LABEL_10;
  }
  v2 = v7(v4, v5, *MEMORY[0x1E0C9AE00], &v11);
  if (v2)
LABEL_10:
    v12[0] = (void *)AVLocalizedErrorWithUnderlyingOSStatusAndUnderlyingError(v2, 0, v12[0], 1);
LABEL_11:
  if (dword_1EE2B0250)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  (*(void (**)(_QWORD, id))(a1[7] + 16))(a1[7], v11);
  if (v4)
    CFRelease(v4);

}

- (void)invalidateAllPersistableContentKeysForApp:(NSData *)appIdentifier options:(NSDictionary *)options completionHandler:(void *)handler
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  signed int v19;
  OpaqueFigContentKeyBoss *contentKeyBoss;
  uint64_t (*v21)(OpaqueFigContentKeyBoss *, CFTypeRef, _QWORD *);
  signed int v22;
  NSObject *global_queue;
  _QWORD *v24;
  uint64_t v25;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  void *v30;
  NSString *keySystem;
  _QWORD v32[10];
  _QWORD block[7];
  os_log_type_t type;
  int v35;
  CFTypeRef cf;
  _QWORD v37[25];

  v37[24] = *MEMORY[0x1E0C80C00];
  v10 = -[NSDictionary objectForKeyedSubscript:](options, "objectForKeyedSubscript:", CFSTR("ProtocolVersionsKey"));
  v11 = -[NSDictionary objectForKeyedSubscript:](options, "objectForKeyedSubscript:", CFSTR("HLSMethodKey"));
  v12 = -[NSDictionary objectForKeyedSubscript:](options, "objectForKeyedSubscript:", CFSTR("ServerChallenge"));
  if (!handler)
  {
    v27 = (void *)MEMORY[0x1E0C99DA0];
    v28 = *MEMORY[0x1E0C99778];
    v29 = CFSTR("valid completion handler is required");
    goto LABEL_21;
  }
  if (!appIdentifier)
  {
    v27 = (void *)MEMORY[0x1E0C99DA0];
    v28 = *MEMORY[0x1E0C99778];
    v29 = CFSTR("valid application certificate is required");
    goto LABEL_21;
  }
  v18 = v12;
  if (!-[NSString isEqualToString:](self->_session->_keySystem, "isEqualToString:", CFSTR("FairPlayStreaming")))
  {
    v27 = (void *)MEMORY[0x1E0C99DA0];
    v28 = *MEMORY[0x1E0C99778];
    keySystem = self->_session->_keySystem;
    v29 = CFSTR("%@ does not support this operation");
LABEL_21:
    v30 = (void *)objc_msgSend(v27, "exceptionWithName:reason:userInfo:", v28, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v29, v13, v14, v15, v16, v17, (uint64_t)keySystem), 0);
    objc_exception_throw(v30);
  }
  +[AVContentKeyRequest _validateProtocolVersionList:](AVContentKeyRequest, "_validateProtocolVersionList:", v10);
  +[AVContentKeyRequest _validateHLSEncryptionMethod:](AVContentKeyRequest, "_validateHLSEncryptionMethod:", v11);
  +[AVContentKeyRequest _validateServerChallenge:](AVContentKeyRequest, "_validateServerChallenge:", v18);
  if (!self->_session->_contentKeyBoss)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __91__AVContentKeySession_invalidateAllPersistableContentKeysForApp_options_completionHandler___block_invoke_2;
    v32[3] = &unk_1E3035B68;
    v32[4] = self;
    v32[5] = v11;
    v32[6] = v10;
    v32[7] = appIdentifier;
    v32[8] = v18;
    v32[9] = handler;
    v24 = v32;
    goto LABEL_17;
  }
  cf = 0;
  v37[0] = 0;
  v19 = FigContentKeySecureTokenRequestParamsCreate();
  if (!v19)
  {
    contentKeyBoss = self->_session->_contentKeyBoss;
    v21 = *(uint64_t (**)(OpaqueFigContentKeyBoss *, CFTypeRef, _QWORD *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 16)
                                                                                   + 96);
    if (!v21)
    {
      v22 = -12782;
      goto LABEL_11;
    }
    v19 = v21(contentKeyBoss, cf, v37);
  }
  v22 = v19;
LABEL_11:
  if (v22)
    v25 = AVLocalizedErrorWithUnderlyingOSStatusAndUnderlyingError(v22, 0, 0, 1);
  else
    v25 = 0;
  if (dword_1EE2B0250)
  {
    v35 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__AVContentKeySession_invalidateAllPersistableContentKeysForApp_options_completionHandler___block_invoke;
  block[3] = &unk_1E3031B30;
  block[5] = v25;
  block[6] = handler;
  block[4] = v37[0];
  v24 = block;
LABEL_17:
  dispatch_async(global_queue, v24);
}

void __91__AVContentKeySession_invalidateAllPersistableContentKeysForApp_options_completionHandler___block_invoke(uint64_t a1)
{
  const void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
}

void __91__AVContentKeySession_invalidateAllPersistableContentKeysForApp_options_completionHandler___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  const void *v3;
  id v4;
  uint64_t (*v5)(const void *, _QWORD, id);
  signed int v6;
  id v7;
  _QWORD *v8;
  uint64_t (*v9)(const void *, id, _QWORD, id *);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v11;
  id v12;
  void *v13[25];

  v13[24] = *(void **)MEMORY[0x1E0C80C00];
  v12 = 0;
  v13[0] = 0;
  v11 = 0;
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 48), "createCryptorIfNecessaryForIdentifier:initializationData:formatDescription:hlsMethod:error:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"), 0, 0, a1[5], v13);
  v3 = (const void *)v2;
  if (!v13[0])
  {
    if (!v2)
    {
      v6 = -12158;
      goto LABEL_11;
    }
    v4 = +[AVContentKeyRequest _ensureProtocolVersionList:](AVContentKeyRequest, "_ensureProtocolVersionList:", a1[6]);
    v5 = *(uint64_t (**)(const void *, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v5)
    {
      v6 = v5(v3, *MEMORY[0x1E0CA3208], v4);
      if (v6)
        goto LABEL_11;
      if (!+[AVContentKeyRequest _prepareCryptor:forRenewal:andReturnKeyRequestID:isInchargeOfKeyRequest:error:](AVContentKeyRequest, "_prepareCryptor:forRenewal:andReturnKeyRequestID:isInchargeOfKeyRequest:error:", v3, 0, &v11, 0, v13))goto LABEL_12;
      v7 = +[AVContentKeyRequest _createKeyRequestDictionaryForApp:persistentKey:serverChallenge:cryptorKeyRequestID:purpose:](AVContentKeyRequest, "_createKeyRequestDictionaryForApp:persistentKey:serverChallenge:cryptorKeyRequestID:purpose:", a1[7], 0, a1[8], v11, 3);
      v8 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
      if (*v8 >= 4uLL)
      {
        v9 = (uint64_t (*)(const void *, id, _QWORD, id *))v8[11];
        if (v9)
        {
          v6 = v9(v3, v7, *MEMORY[0x1E0C9AE00], &v12);
          if (!v6)
            goto LABEL_12;
LABEL_11:
          v13[0] = (void *)AVLocalizedErrorWithUnderlyingOSStatusAndUnderlyingError(v6, 0, v13[0], 1);
          goto LABEL_12;
        }
      }
    }
    v6 = -12782;
    goto LABEL_11;
  }
LABEL_12:
  if (dword_1EE2B0250)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  (*(void (**)(_QWORD, id))(a1[9] + 16))(a1[9], v12);
  if (v3)
    CFRelease(v3);

}

+ (NSArray)pendingExpiredSessionReportsWithAppIdentifier:(NSData *)appIdentifier storageDirectoryAtURL:(NSURL *)storageURL
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  OpaqueFigSecureStopManager *v8;
  unsigned int (*v9)(OpaqueFigSecureStopManager *, CFTypeRef *);
  NSArray *v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  CFTypeRef cf[27];

  cf[25] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  cf[0] = 0;
  if (!appIdentifier)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = CFSTR("valid appIdentifier is required");
    goto LABEL_19;
  }
  if (!storageURL)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = CFSTR("valid storageURL is required");
LABEL_19:
    v16 = (void *)objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)v15, (uint64_t)storageURL, v4, v5, v6, v7, v17), 0);
    objc_exception_throw(v16);
  }
  v8 = +[AVContentKeySession copyDefaultSecureStopManagerForAppIdentifier:storageDirectoryAtURL:](AVContentKeySession, "copyDefaultSecureStopManagerForAppIdentifier:storageDirectoryAtURL:");
  if (!v8)
  {
    FigSignalErrorAt();
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  v9 = *(unsigned int (**)(OpaqueFigSecureStopManager *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 16);
  if (!v9 || v9(v8, cf))
    goto LABEL_9;
  v10 = (NSArray *)objc_msgSend((id)cf[0], "allValues");
  if (dword_1EE2B0250)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_10:
  if (cf[0])
    CFRelease(cf[0]);
  if (v8)
    CFRelease(v8);
  if (!v10)
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return v10;
}

+ (void)removePendingExpiredSessionReports:(NSArray *)expiredSessionReports withAppIdentifier:(NSData *)appIdentifier storageDirectoryAtURL:(NSURL *)storageURL
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  OpaqueFigSecureStopManager *v11;
  OpaqueFigSecureStopManager *v12;
  unsigned int (*v13)(OpaqueFigSecureStopManager *, NSArray *);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[30];

  v21[29] = *MEMORY[0x1E0C80C00];
  if (!appIdentifier)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = CFSTR("valid appIdentifier is required");
    goto LABEL_20;
  }
  if (!storageURL)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = CFSTR("valid storageURL is required");
LABEL_20:
    v19 = (void *)objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)v18, (uint64_t)appIdentifier, (uint64_t)storageURL, v5, v6, v7, v20), 0);
    objc_exception_throw(v19);
  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __147__AVContentKeySession_AVContentKeySessionPendingExpiredSessionReports__removePendingExpiredSessionReports_withAppIdentifier_storageDirectoryAtURL___block_invoke;
  v21[3] = &unk_1E3035B90;
  v21[4] = a1;
  v21[5] = a2;
  -[NSArray enumerateObjectsUsingBlock:](expiredSessionReports, "enumerateObjectsUsingBlock:", v21);
  if (!-[NSArray count](expiredSessionReports, "count"))
  {
    if (!dword_1EE2B0250)
      return;
    v12 = 0;
LABEL_14:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (!v12)
      return;
    goto LABEL_15;
  }
  v11 = +[AVContentKeySession copyDefaultSecureStopManagerForAppIdentifier:storageDirectoryAtURL:](AVContentKeySession, "copyDefaultSecureStopManagerForAppIdentifier:storageDirectoryAtURL:", appIdentifier, storageURL);
  if (!v11)
  {
    FigSignalErrorAt();
    return;
  }
  v12 = v11;
  v13 = *(unsigned int (**)(OpaqueFigSecureStopManager *, NSArray *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 24);
  if (v13)
  {
    if (!v13(v12, expiredSessionReports) && dword_1EE2B0250 != 0)
      goto LABEL_14;
  }
LABEL_15:
  CFRelease(v12);
}

uint64_t __147__AVContentKeySession_AVContentKeySessionPendingExpiredSessionReports__removePendingExpiredSessionReports_withAppIdentifier_storageDirectoryAtURL___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) == 0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(*(objc_class **)(a1 + 32), *(const char **)(a1 + 40), (uint64_t)CFSTR("expiredSessionReports should be an array of NSData objects"), v3, v4, v5, v6, v7, v9), 0);
    objc_exception_throw(v8);
  }
  return result;
}

- (void)_handleSecureStopDidFinalizeRecordCallback
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __114__AVContentKeySession_AVContentKeySessionPendingExpiredSessionReports___handleSecureStopDidFinalizeRecordCallback__block_invoke;
  v2[3] = &unk_1E3035BB8;
  v2[4] = self;
  -[AVContentKeySession _invokeDelegateCallbackWithBlock:synchronouslyWhenDelegateQueueIsNULL:](self, "_invokeDelegateCallbackWithBlock:synchronouslyWhenDelegateQueueIsNULL:", v2, 0);
}

uint64_t __114__AVContentKeySession_AVContentKeySessionPendingExpiredSessionReports___handleSecureStopDidFinalizeRecordCallback__block_invoke(uint64_t result, void *a2)
{
  uint64_t v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = result;
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
    {
      if (dword_1EE2B0250)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return objc_msgSend(a2, "contentKeySessionDidGenerateExpiredSessionReport:", *(_QWORD *)(v3 + 32), v5, v6);
    }
  }
  return result;
}

- (void)_handleExternalProtectionStateChangedCallbackForCryptKeyIdentifier:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __139__AVContentKeySession_AVContentKeySessionPendingExpiredSessionReports___handleExternalProtectionStateChangedCallbackForCryptKeyIdentifier___block_invoke;
  v3[3] = &unk_1E3035A40;
  v3[4] = self;
  v3[5] = a3;
  -[AVContentKeySession _invokeDelegateCallbackWithBlock:synchronouslyWhenDelegateQueueIsNULL:](self, "_invokeDelegateCallbackWithBlock:synchronouslyWhenDelegateQueueIsNULL:", v3, 1);
}

uint64_t __139__AVContentKeySession_AVContentKeySessionPendingExpiredSessionReports___handleExternalProtectionStateChangedCallbackForCryptKeyIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v5;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 96), "objectForKey:", *(_QWORD *)(a1 + 40));
  if (a2)
  {
    v5 = result;
    if (result)
    {
      result = objc_opt_respondsToSelector();
      if ((result & 1) != 0)
        return objc_msgSend(a2, "contentKeySession:externalProtectionStatusDidChangeForContentKeyRequest:", *(_QWORD *)(a1 + 32), v5);
    }
  }
  return result;
}

- (id)_internalQueue
{
  return self->_session->_threadSafetyQ;
}

+ (id)_uniqueIDForCyptorUUID:(id)a3 cryptorKeyRequestID:(unint64_t)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%llu"), a3, a4);
}

- (void)_setContentKeyRequest:(id)a3 forCryptorUUID:(id)a4 cryptorKeyRequestID:(unint64_t)a5
{
  NSObject *threadSafetyQ;
  _QWORD v6[8];

  threadSafetyQ = self->_session->_threadSafetyQ;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __117__AVContentKeySession_AVContentKeySessionPrivateUtilities___setContentKeyRequest_forCryptorUUID_cryptorKeyRequestID___block_invoke;
  v6[3] = &unk_1E3031940;
  v6[4] = a3;
  v6[5] = a4;
  v6[6] = self;
  v6[7] = a5;
  dispatch_async(threadSafetyQ, v6);
}

_QWORD *__117__AVContentKeySession_AVContentKeySessionPrivateUtilities___setContentKeyRequest_forCryptorUUID_cryptorKeyRequestID___block_invoke(_QWORD *result)
{
  uint64_t v1;

  if (result[4])
  {
    v1 = result[5];
    if (v1)
      return (_QWORD *)objc_msgSend(*(id *)(*(_QWORD *)(result[6] + 8) + 80), "setObject:forKey:", result[4], +[AVContentKeySession _uniqueIDForCyptorUUID:cryptorKeyRequestID:](AVContentKeySession, "_uniqueIDForCyptorUUID:cryptorKeyRequestID:", v1, result[7]));
  }
  return result;
}

- (id)_contentKeyRequestForCryptorUUID:(id)a3 cryptorKeyRequestID:(unint64_t)a4
{
  NSObject *threadSafetyQ;
  id v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__45;
  v12 = __Block_byref_object_dispose__45;
  v13 = 0;
  threadSafetyQ = self->_session->_threadSafetyQ;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __113__AVContentKeySession_AVContentKeySessionPrivateUtilities___contentKeyRequestForCryptorUUID_cryptorKeyRequestID___block_invoke;
  v7[3] = &unk_1E30351A0;
  v7[6] = &v8;
  v7[7] = a4;
  v7[4] = a3;
  v7[5] = self;
  dispatch_sync(threadSafetyQ, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

_QWORD *__113__AVContentKeySession_AVContentKeySessionPrivateUtilities___contentKeyRequestForCryptorUUID_cryptorKeyRequestID___block_invoke(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;

  v1 = result[4];
  if (v1)
  {
    v2 = result;
    result = (id)objc_msgSend(*(id *)(*(_QWORD *)(result[5] + 8) + 80), "objectForKey:", +[AVContentKeySession _uniqueIDForCyptorUUID:cryptorKeyRequestID:](AVContentKeySession, "_uniqueIDForCyptorUUID:cryptorKeyRequestID:", v1, result[7]));
    *(_QWORD *)(*(_QWORD *)(v2[6] + 8) + 40) = result;
  }
  return result;
}

- (void)_removeContentKeyRequestForCryptorUUID:(id)a3 cryptorKeyRequestID:(unint64_t)a4
{
  NSObject *threadSafetyQ;
  _QWORD block[7];

  threadSafetyQ = self->_session->_threadSafetyQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __119__AVContentKeySession_AVContentKeySessionPrivateUtilities___removeContentKeyRequestForCryptorUUID_cryptorKeyRequestID___block_invoke;
  block[3] = &unk_1E302FEE0;
  block[5] = self;
  block[6] = a4;
  block[4] = a3;
  dispatch_async(threadSafetyQ, block);
}

_QWORD *__119__AVContentKeySession_AVContentKeySessionPrivateUtilities___removeContentKeyRequestForCryptorUUID_cryptorKeyRequestID___block_invoke(_QWORD *result)
{
  uint64_t v1;

  v1 = result[4];
  if (v1)
    return (_QWORD *)objc_msgSend(*(id *)(*(_QWORD *)(result[5] + 8) + 80), "removeObjectForKey:", +[AVContentKeySession _uniqueIDForCyptorUUID:cryptorKeyRequestID:](AVContentKeySession, "_uniqueIDForCyptorUUID:cryptorKeyRequestID:", v1, result[6]));
  return result;
}

- (void)_setWeakReferenceForContentKeyRequest:(id)a3 withCryptorUUID:(id)a4
{
  -[NSMapTable setObject:forKey:](self->_session->cryptorUUIDToContentKeyRequestMap, "setObject:forKey:", a3, a4);
}

- (void)_invokeDelegateCallbackWithBlock:(id)a3 synchronouslyWhenDelegateQueueIsNULL:(BOOL)a4
{
  _BOOL4 v4;
  AVContentKeySessionInternal *session;
  AVWeakReferencingDelegateStorage *delegateStorage;
  NSObject *delegateReadWriteQueue;
  uint64_t v9;
  NSObject *global_queue;
  _QWORD *v11;
  _QWORD v12[7];
  _QWORD v13[6];
  _QWORD block[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;

  v4 = a4;
  session = self->_session;
  delegateStorage = session->_delegateStorage;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__45;
  v19 = __Block_byref_object_dispose__45;
  v20 = 0;
  delegateReadWriteQueue = session->_delegateReadWriteQueue;
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __130__AVContentKeySession_AVContentKeySessionPrivateUtilities___invokeDelegateCallbackWithBlock_synchronouslyWhenDelegateQueueIsNULL___block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = self;
  block[5] = &v15;
  av_readwrite_dispatch_queue_read(delegateReadWriteQueue, block);
  global_queue = v16[5];
  if (!v4)
  {
    if (!global_queue)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      v13[0] = v9;
      v13[1] = 3221225472;
      v13[2] = __130__AVContentKeySession_AVContentKeySessionPrivateUtilities___invokeDelegateCallbackWithBlock_synchronouslyWhenDelegateQueueIsNULL___block_invoke_2;
      v13[3] = &unk_1E3031550;
      v13[4] = delegateStorage;
      v13[5] = a3;
      v11 = v13;
      goto LABEL_7;
    }
LABEL_5:
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __130__AVContentKeySession_AVContentKeySessionPrivateUtilities___invokeDelegateCallbackWithBlock_synchronouslyWhenDelegateQueueIsNULL___block_invoke_3;
    v12[3] = &unk_1E3030A28;
    v12[4] = delegateStorage;
    v12[5] = a3;
    v12[6] = &v15;
    v11 = v12;
LABEL_7:
    dispatch_async(global_queue, v11);
    goto LABEL_8;
  }
  if (global_queue)
    goto LABEL_5;
  -[AVWeakReferencingDelegateStorage invokeDelegateCallbackWithBlock:synchronouslyIfDelegateQueueIsQueue:](delegateStorage, "invokeDelegateCallbackWithBlock:synchronouslyIfDelegateQueueIsQueue:", a3, 0);
LABEL_8:
  _Block_object_dispose(&v15, 8);
}

void __130__AVContentKeySession_AVContentKeySessionPrivateUtilities___invokeDelegateCallbackWithBlock_synchronouslyWhenDelegateQueueIsNULL___block_invoke(uint64_t a1)
{
  NSObject *v1;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 160);
  v1 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v1)
    dispatch_retain(v1);
}

uint64_t __130__AVContentKeySession_AVContentKeySessionPrivateUtilities___invokeDelegateCallbackWithBlock_synchronouslyWhenDelegateQueueIsNULL___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeDelegateCallbackWithBlock:synchronouslyIfDelegateQueueIsQueue:", *(_QWORD *)(a1 + 40), 0);
}

void __130__AVContentKeySession_AVContentKeySessionPrivateUtilities___invokeDelegateCallbackWithBlock_synchronouslyWhenDelegateQueueIsNULL___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invokeDelegateCallbackWithBlock:synchronouslyIfDelegateQueueIsQueue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

- (void)_handleKeyResponseError:(id)a3 forCryptorUUID:(id)a4 andCryptorKeyRequestID:(unint64_t)a5
{
  objc_msgSend(-[AVContentKeySession _contentKeyRequestForCryptorUUID:cryptorKeyRequestID:](self, "_contentKeyRequestForCryptorUUID:cryptorKeyRequestID:", a4, a5), "_handleKeyResponseError:", a3);
  -[AVContentKeySession _removeContentKeyRequestForCryptorUUID:cryptorKeyRequestID:](self, "_removeContentKeyRequestForCryptorUUID:cryptorKeyRequestID:", a4, a5);
}

- (void)_handleKeyResponseSuccessfullyProcessedForCryptorUUID:(id)a3 andCryptorKeyRequestID:(unint64_t)a4
{
  objc_msgSend(-[AVContentKeySession _contentKeyRequestForCryptorUUID:cryptorKeyRequestID:](self, "_contentKeyRequestForCryptorUUID:cryptorKeyRequestID:"), "_handleKeyResponseSuccessWithCryptor:", 0);
  -[AVContentKeySession _removeContentKeyRequestForCryptorUUID:cryptorKeyRequestID:](self, "_removeContentKeyRequestForCryptorUUID:cryptorKeyRequestID:", a3, a4);
}

- (void)_handleUpdateToPersistentKey:(id)a3 forKeyIdentifier:(id)a4
{
  _QWORD v4[7];

  if (a3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __106__AVContentKeySession_AVContentKeySessionPrivateUtilities___handleUpdateToPersistentKey_forKeyIdentifier___block_invoke;
    v4[3] = &unk_1E3035A68;
    v4[4] = self;
    v4[5] = a3;
    v4[6] = a4;
    -[AVContentKeySession _invokeDelegateCallbackWithBlock:synchronouslyWhenDelegateQueueIsNULL:](self, "_invokeDelegateCallbackWithBlock:synchronouslyWhenDelegateQueueIsNULL:", v4, 0);
  }
}

uint64_t __106__AVContentKeySession_AVContentKeySessionPrivateUtilities___handleUpdateToPersistentKey_forKeyIdentifier___block_invoke(uint64_t result, void *a2)
{
  _QWORD *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = (_QWORD *)result;
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
    {
      if (dword_1EE2B0250)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return objc_msgSend(a2, "contentKeySession:didUpdatePersistableContentKey:forContentKeyIdentifier:", v3[4], v3[5], v3[6], v5, v6);
    }
  }
  return result;
}

- (void)_handleContentProtectionSessionIdentifierDidChange:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __111__AVContentKeySession_AVContentKeySessionPrivateUtilities___handleContentProtectionSessionIdentifierDidChange___block_invoke;
  v3[3] = &unk_1E3035A40;
  v3[4] = self;
  v3[5] = a3;
  -[AVContentKeySession _invokeDelegateCallbackWithBlock:synchronouslyWhenDelegateQueueIsNULL:](self, "_invokeDelegateCallbackWithBlock:synchronouslyWhenDelegateQueueIsNULL:", v3, 1);
}

uint64_t __111__AVContentKeySession_AVContentKeySessionPrivateUtilities___handleContentProtectionSessionIdentifierDidChange___block_invoke(uint64_t result, void *a2)
{
  uint64_t v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = result;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (dword_1EE2B0250)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return objc_msgSend(a2, "contentKeySession:contentProtectionSessionIdentifierDidChangeForReportGroup:", *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40), v6, v7);
    }
    else
    {
      result = objc_opt_respondsToSelector();
      if ((result & 1) != 0)
      {
        if (dword_1EE2B0250)
        {
          v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        return objc_msgSend(a2, "contentKeySessionContentProtectionSessionIdentifierDidChange:", *(_QWORD *)(v3 + 32), v6, v7);
      }
    }
  }
  return result;
}

- (int)setAppIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *threadSafetyQ;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD block[7];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  if (!a3)
  {
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("valid appIdentifier is required"), v3, v4, v5, v6, v7, v19);
    goto LABEL_6;
  }
  threadSafetyQ = self->_session->_threadSafetyQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__AVContentKeySession_AVContentKeyRequestSupport__setAppIdentifier___block_invoke;
  block[3] = &unk_1E302FE00;
  block[4] = self;
  block[5] = a3;
  block[6] = &v21;
  dispatch_sync(threadSafetyQ, block);
  if (*((_BYTE *)v22 + 24))
  {
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("appIdentifier can't change once set"), v11, v12, v13, v14, v15, v19);
LABEL_6:
    objc_exception_throw((id)objc_msgSend(v17, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v18, 0));
  }
  _Block_object_dispose(&v21, 8);
  return 0;
}

uint64_t __68__AVContentKeySession_AVContentKeyRequestSupport__setAppIdentifier___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  v2 = (void *)a1[5];
  v3 = *(void **)(*(_QWORD *)(a1[4] + 8) + 32);
  if (v3)
  {
    result = objc_msgSend(v3, "isEqual:", v2);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result ^ 1;
  }
  else
  {
    result = objc_msgSend(v2, "copy");
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 32) = result;
  }
  return result;
}

- (BOOL)clientCanReceivePersistableContentKeyRequest
{
  -[AVContentKeySession delegate](self, "delegate");
  return objc_opt_respondsToSelector() & 1;
}

- (void)issueContentKeyRequests:(id)a3 forInitializationData:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  _QWORD v11[8];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x3052000000;
  v19 = __Block_byref_object_copy__45;
  v20 = __Block_byref_object_dispose__45;
  v21 = 0;
  if (a3)
  {
    if (-[AVContentKeySession delegate](self, "delegate"))
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __97__AVContentKeySession_AVContentKeyRequestSupport__issueContentKeyRequests_forInitializationData___block_invoke;
      v11[3] = &unk_1E3035BE0;
      v11[4] = self;
      v11[5] = a3;
      v11[6] = a4;
      v11[7] = &v16;
      -[AVContentKeySession _invokeDelegateCallbackWithBlock:synchronouslyWhenDelegateQueueIsNULL:](self, "_invokeDelegateCallbackWithBlock:synchronouslyWhenDelegateQueueIsNULL:", v11, 1);
    }
    else
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v22, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v13 != v8)
              objc_enumerationMutation(a3);
            v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
            v17[5] = (uint64_t)v10;
            objc_msgSend(v10, "_setError:", AVLocalizedErrorWithUnderlyingOSStatus(-11835, 0));
          }
          v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v22, 16);
        }
        while (v7);
      }
      v17[5] = 0;
    }
  }
  _Block_object_dispose(&v16, 8);
}

uint64_t __97__AVContentKeySession_AVContentKeyRequestSupport__issueContentKeyRequests_forInitializationData___block_invoke(uint64_t result, void *a2)
{
  _QWORD *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  os_log_type_t type;
  unsigned int v29;
  _BYTE v30[128];
  _BYTE v31[128];
  int v32;
  const char *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = (_QWORD *)result;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (dword_1EE2B0250)
      {
        v29 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return objc_msgSend(a2, "contentKeySession:didProvideContentKeyRequests:forInitializationData:", v3[4], v3[5], v3[6], v18, v19);
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v26 = 0uLL;
        v27 = 0uLL;
        v24 = 0uLL;
        v25 = 0uLL;
        v5 = (void *)v3[5];
        result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
        if (result)
        {
          v6 = result;
          v7 = *(_QWORD *)v25;
          do
          {
            v8 = 0;
            do
            {
              if (*(_QWORD *)v25 != v7)
                objc_enumerationMutation(v5);
              *(_QWORD *)(*(_QWORD *)(v3[7] + 8) + 40) = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v8);
              if (dword_1EE2B0250)
              {
                v29 = 0;
                type = OS_LOG_TYPE_DEFAULT;
                v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                v10 = v29;
                if (os_log_type_enabled(v9, type))
                  v11 = v10;
                else
                  v11 = v10 & 0xFFFFFFFE;
                if (v11)
                {
                  v12 = v3[4];
                  v13 = *(_QWORD *)(*(_QWORD *)(v3[7] + 8) + 40);
                  v32 = 136315650;
                  v33 = "-[AVContentKeySession(AVContentKeyRequestSupport) issueContentKeyRequests:forInitializationData:]_block_invoke";
                  v34 = 2048;
                  v35 = v12;
                  v36 = 2048;
                  v37 = v13;
                  LODWORD(v19) = 32;
                  v18 = &v32;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              objc_msgSend(a2, "contentKeySession:didProvideContentKeyRequest:", v3[4], *(_QWORD *)(*(_QWORD *)(v3[7] + 8) + 40), v18, v19);
              ++v8;
            }
            while (v6 != v8);
            result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
            v6 = result;
          }
          while (result);
        }
      }
      else
      {
        v22 = 0uLL;
        v23 = 0uLL;
        v20 = 0uLL;
        v21 = 0uLL;
        v14 = (void *)v3[5];
        result = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
        if (result)
        {
          v15 = result;
          v16 = *(_QWORD *)v21;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v21 != v16)
                objc_enumerationMutation(v14);
              *(_QWORD *)(*(_QWORD *)(v3[7] + 8) + 40) = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v17);
              objc_msgSend(*(id *)(*(_QWORD *)(v3[7] + 8) + 40), "_setError:", AVLocalizedErrorWithUnderlyingOSStatus(-11835, 0));
              ++v17;
            }
            while (v15 != v17);
            result = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
            v15 = result;
          }
          while (result);
        }
      }
      *(_QWORD *)(*(_QWORD *)(v3[7] + 8) + 40) = 0;
    }
  }
  return result;
}

- (void)issueContentKeyRequest:(id)a3 toDelegateWithCallbackSelector:(SEL)a4
{
  _QWORD v7[7];

  if (a3)
  {
    if (-[AVContentKeySession delegate](self, "delegate"))
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __105__AVContentKeySession_AVContentKeyRequestSupport__issueContentKeyRequest_toDelegateWithCallbackSelector___block_invoke;
      v7[3] = &unk_1E3035C08;
      v7[5] = a3;
      v7[6] = a4;
      v7[4] = self;
      -[AVContentKeySession _invokeDelegateCallbackWithBlock:synchronouslyWhenDelegateQueueIsNULL:](self, "_invokeDelegateCallbackWithBlock:synchronouslyWhenDelegateQueueIsNULL:", v7, 1);
    }
    else
    {
      objc_msgSend(a3, "_setError:", AVLocalizedErrorWithUnderlyingOSStatus(-11835, 0));
    }
  }
}

uint64_t __105__AVContentKeySession_AVContentKeyRequestSupport__issueContentKeyRequest_toDelegateWithCallbackSelector___block_invoke(uint64_t result, void *a2)
{
  uint64_t v3;

  if (a2)
  {
    v3 = result;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (sel_isEqual(*(SEL *)(v3 + 48), sel_contentKeySession_didProvidePersistableContentKeyRequest_))
      {
        return objc_msgSend(a2, "contentKeySession:didProvidePersistableContentKeyRequest:", *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40));
      }
      else
      {
        result = sel_isEqual(*(SEL *)(v3 + 48), sel_contentKeySession_didProvideRenewingContentKeyRequest_);
        if ((_DWORD)result)
          return objc_msgSend(a2, "contentKeySession:didProvideRenewingContentKeyRequest:", *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40));
      }
    }
    else
    {
      return objc_msgSend(*(id *)(v3 + 40), "_setError:", AVLocalizedErrorWithUnderlyingOSStatus(-11835, 0));
    }
  }
  return result;
}

- (void)issueContentKeyRequest:(id)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a3;
  -[AVContentKeySession issueContentKeyRequests:forInitializationData:](self, "issueContentKeyRequests:forInitializationData:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1), 0);
}

- (void)issuePersistableContentKeyRequest:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (dword_1EE2B0250)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVContentKeySession issueContentKeyRequest:toDelegateWithCallbackSelector:](self, "issueContentKeyRequest:toDelegateWithCallbackSelector:", a3, sel_contentKeySession_didProvidePersistableContentKeyRequest_, v6, v7);
}

- (void)issueRenewableContentKeyRequest:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (dword_1EE2B0250)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVContentKeySession issueContentKeyRequest:toDelegateWithCallbackSelector:](self, "issueContentKeyRequest:toDelegateWithCallbackSelector:", a3, sel_contentKeySession_didProvideRenewingContentKeyRequest_, v6, v7);
}

- (void)issueContentKeyRequestWithCustomURLHandler:(OpaqueFigCustomURLHandler *)a3 identifier:(id)a4 requestInfo:(__CFDictionary *)a5 requestID:(unint64_t)a6 providesPersistableKey:(BOOL)a7
{
  _BOOL4 v7;
  AVContentKeyRequest *v13;
  uint64_t v14;

  v7 = a7;
  FigCustomURLRequestInfoGetIsRenewalRequest();
  if (v7)
  {
    LOWORD(v14) = 1;
    -[AVContentKeySession issuePersistableContentKeyRequest:](self, "issuePersistableContentKeyRequest:", -[AVContentKeyRequest initWithContentKeySession:reportGroup:customURLHandler:identifier:requestInfo:requestID:providesPersistableKey:isRenewalRequest:]([AVPersistableContentKeyRequest alloc], "initWithContentKeySession:reportGroup:customURLHandler:identifier:requestInfo:requestID:providesPersistableKey:isRenewalRequest:", self, self->_session->_defaultContentKeyGroup, a3, a4, a5, a6, v14));
  }
  else
  {
    LOWORD(v14) = 0;
    v13 = -[AVContentKeyRequest initWithContentKeySession:reportGroup:customURLHandler:identifier:requestInfo:requestID:providesPersistableKey:isRenewalRequest:]([AVContentKeyRequest alloc], "initWithContentKeySession:reportGroup:customURLHandler:identifier:requestInfo:requestID:providesPersistableKey:isRenewalRequest:", self, self->_session->_defaultContentKeyGroup, a3, a4, a5, a6, v14);
    if (v13)
      -[AVContentKeySession issueContentKeyRequest:](self, "issueContentKeyRequest:", v13);
  }
}

- (void)issueContentKeyRequestWithPreloadingRequestOptions:(id)a3 identifier:(id)a4 initializationData:(id)a5 providesPersistableKey:(BOOL)a6
{
  _BOOL4 v6;
  void *v11;
  AVContentKeyRequest *v12;
  AVPersistableContentKeyRequest *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v6 = a6;
  v15 = 0;
  v16 = 0;
  if (a5)
  {
    avcks_decodeInitializationDataAndCopyInformation((uint64_t)a5, &v15, 0, 0, 0, 0);
    if (v15)
    {
      if (PKDCopyDefaultKeyIDFromSinfArray())
      {
        v11 = 0;
        goto LABEL_8;
      }
      v11 = (void *)objc_msgSend(v16, "copy");
      if (!v6)
        goto LABEL_5;
LABEL_7:
      v13 = [AVPersistableContentKeyRequest alloc];
      LOBYTE(v14) = 1;
      -[AVContentKeySession issuePersistableContentKeyRequest:](self, "issuePersistableContentKeyRequest:", -[AVContentKeyRequest initWithContentKeySession:reportGroup:identifier:contentIdentifier:keyIDFromInitializationData:initializationData:preloadingRequestOptions:providesPersistableKey:](v13, "initWithContentKeySession:reportGroup:identifier:contentIdentifier:keyIDFromInitializationData:initializationData:preloadingRequestOptions:providesPersistableKey:", self, self->_session->_defaultContentKeyGroup, a4, v11, v16, a5, a3, v14));
      goto LABEL_8;
    }
  }
  v11 = 0;
  if (v6)
    goto LABEL_7;
LABEL_5:
  v12 = [AVContentKeyRequest alloc];
  LOBYTE(v14) = 0;
  -[AVContentKeySession issueContentKeyRequest:](self, "issueContentKeyRequest:", -[AVContentKeyRequest initWithContentKeySession:reportGroup:identifier:contentIdentifier:keyIDFromInitializationData:initializationData:preloadingRequestOptions:providesPersistableKey:](v12, "initWithContentKeySession:reportGroup:identifier:contentIdentifier:keyIDFromInitializationData:initializationData:preloadingRequestOptions:providesPersistableKey:", self, self->_session->_defaultContentKeyGroup, a4, v11, v16, a5, a3, v14));
LABEL_8:

}

- (void)contentKeyRequestDidProduceContentKey:(id)a3
{
  NSObject *threadSafetyQ;
  _QWORD v4[6];

  threadSafetyQ = self->_session->_threadSafetyQ;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __89__AVContentKeySession_AVContentKeyRequestSupport__contentKeyRequestDidProduceContentKey___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(threadSafetyQ, v4);
}

uint64_t __89__AVContentKeySession_AVContentKeyRequestSupport__contentKeyRequestDidProduceContentKey___block_invoke(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *global_queue;
  uint64_t v11;
  _QWORD block[7];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (__CFString *)CFCopyDescription((CFTypeRef)objc_msgSend(*(id *)(a1 + 32), "_internalContentKeySpecifier"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 136), "setObject:forKey:", *(_QWORD *)(a1 + 32), v2);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 64);
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v14;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        global_queue = dispatch_get_global_queue(0, 0);
        block[0] = v7;
        block[1] = 3221225472;
        block[2] = __89__AVContentKeySession_AVContentKeyRequestSupport__contentKeyRequestDidProduceContentKey___block_invoke_2;
        block[3] = &unk_1E302FD88;
        v11 = *(_QWORD *)(a1 + 32);
        block[4] = *(_QWORD *)(a1 + 40);
        block[5] = v9;
        block[6] = v11;
        dispatch_async(global_queue, block);
        ++v8;
      }
      while (v5 != v8);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __89__AVContentKeySession_AVContentKeyRequestSupport__contentKeyRequestDidProduceContentKey___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40))
  {
    v1 = result;
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
    {
      if (dword_1EE2B0250)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return objc_msgSend(*(id *)(v1 + 40), "contentKeySession:didProvideContentKey:", *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 48), v3, v4);
    }
  }
  return result;
}

- (void)issuePersistableContentKeyRequestForKeySpecifier:(OpaqueFigContentKeySpecifier *)a3 initializationData:(id)a4 keyIDFromInitializationData:(id)a5 contentIdentifier:(id)a6 requestID:(unint64_t)a7 preloadingRequestOptions:(id)a8 identifier:(id)a9
{
  AVPersistableContentKeyRequest *v10;
  AVPersistableContentKeyRequest *v11;
  NSObject *threadSafetyQ;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  AVPersistableContentKeyRequest *v16;
  _QWORD block[6];

  LOBYTE(v15) = 1;
  LOBYTE(v14) = 1;
  LOBYTE(v13) = 0;
  v10 = -[AVContentKeyRequest initWithContentKeySession:contentKeyBoss:useContentKeyBoss:keySpecifier:initializationData:keyIDFromInitializationData:contentIdentifier:isRenewalRequest:requestID:providesPersistableKey:preloadingRequestOptions:identifier:supportsOfflineKey:]([AVPersistableContentKeyRequest alloc], "initWithContentKeySession:contentKeyBoss:useContentKeyBoss:keySpecifier:initializationData:keyIDFromInitializationData:contentIdentifier:isRenewalRequest:requestID:providesPersistableKey:preloadingRequestOptions:identifier:supportsOfflineKey:", self, self->_session->_contentKeyBoss, self->_session->_useContentKeyBoss, a3, a4, a5, a6, v13, a7, v14, a8, a9, v15);
  if (v10)
  {
    v11 = v10;
    threadSafetyQ = self->_session->_threadSafetyQ;
    block[1] = 3221225472;
    block[2] = __211__AVContentKeySession_AVContentKeyRequestSupport__issuePersistableContentKeyRequestForKeySpecifier_initializationData_keyIDFromInitializationData_contentIdentifier_requestID_preloadingRequestOptions_identifier___block_invoke;
    block[3] = &unk_1E302FCE8;
    block[4] = self;
    block[5] = v11;
    v16 = v11;
    block[0] = MEMORY[0x1E0C809B0];
    dispatch_sync(threadSafetyQ, block);
    -[AVContentKeySession issuePersistableContentKeyRequest:](self, "issuePersistableContentKeyRequest:", v16);

  }
}

uint64_t __211__AVContentKeySession_AVContentKeyRequestSupport__issuePersistableContentKeyRequestForKeySpecifier_initializationData_keyIDFromInitializationData_contentIdentifier_requestID_preloadingRequestOptions_identifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "trackRequest:byRequestID:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 40), "_requestID"));
}

- (id)keyRequestByID:(unint64_t)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_session->keyRequestsByRequestID, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3));
}

- (void)trackRequest:(id)a3 byRequestID:(unint64_t)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_session->keyRequestsByRequestID, "setObject:forKeyedSubscript:", a3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4));
}

- (AVContentKeySession)initWithKeySystem:(id)a3 storageDirectoryAtURL:(id)a4 internal:(BOOL)a5
{
  AVContentKeySession *result;

  result = -[AVContentKeySession initWithKeySystem:storageDirectoryAtURL:legacyWebKitCompatibilityMode:](self, "initWithKeySystem:storageDirectoryAtURL:legacyWebKitCompatibilityMode:", a3, a4, 0);
  if (result)
    result->_session->_internal = a5;
  return result;
}

- (void)setDelegate:(id)a3
{
  -[AVWeakReferencingDelegateStorage setDelegate:queue:](self->_session->_delegateStorage, "setDelegate:queue:", a3, 0);
}

- (BOOL)hasProtector
{
  return -[AVContentKeyReportGroup hasProtector](self->_session->_defaultContentKeyGroup, "hasProtector");
}

- (id)issueContentKeyRequestForInitializationData:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  AVContentKeyRequest *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[6];
  uint64_t v20;
  id v21;

  v20 = 0;
  v21 = 0;
  if (!-[AVContentKeySession delegate](self, "delegate"))
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("valid delegate is required to deliver a key request"), v6, v7, v8, v9, v10, v17), 0);
    objc_exception_throw(v16);
  }
  if (a3 && (avcks_decodeInitializationDataAndCopyInformation((uint64_t)a3, &v20, 0, 0, 0, 0), v20))
  {
    if (PKDCopyDefaultKeyIDFromSinfArray())
    {
      v11 = 0;
      v14 = 0;
      goto LABEL_9;
    }
    v11 = (void *)objc_msgSend(v21, "copy");
  }
  else
  {
    v11 = 0;
  }
  v12 = [AVContentKeyRequest alloc];
  LOBYTE(v18) = 0;
  v13 = -[AVContentKeyRequest initWithContentKeySession:reportGroup:identifier:contentIdentifier:keyIDFromInitializationData:initializationData:preloadingRequestOptions:providesPersistableKey:](v12, "initWithContentKeySession:reportGroup:identifier:contentIdentifier:keyIDFromInitializationData:initializationData:preloadingRequestOptions:providesPersistableKey:", self, self->_session->_defaultContentKeyGroup, 0, v11, v21, a3, 0, v18);
  v14 = (void *)v13;
  if (v13)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __97__AVContentKeySession_AVContentKeySession_Internal__issueContentKeyRequestForInitializationData___block_invoke;
    v19[3] = &unk_1E3035A40;
    v19[4] = self;
    v19[5] = v13;
    -[AVContentKeySession _invokeDelegateCallbackWithBlock:synchronouslyWhenDelegateQueueIsNULL:](self, "_invokeDelegateCallbackWithBlock:synchronouslyWhenDelegateQueueIsNULL:", v19, 1);
  }
LABEL_9:

  return v14;
}

uint64_t __97__AVContentKeySession_AVContentKeySession_Internal__issueContentKeyRequestForInitializationData___block_invoke(uint64_t result, void *a2)
{
  uint64_t v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = result;
    if (dword_1EE2B0250)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return objc_msgSend(a2, "contentKeySession:didProvideContentKeyRequest:", *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40), v5, v6);
  }
  return result;
}

- (void)_sendFinishLoadingForPreloadedKeyRequest:(__CFDictionary *)a3 withRequestID:(unint64_t)a4 fromHandler:(OpaqueFigCustomURLHandler *)a5 error:(id)a6
{
  unsigned int (*v9)(OpaqueFigCustomURLHandler *, unint64_t, _QWORD);
  void (*v10)(OpaqueFigCustomURLHandler *, unint64_t, id, _QWORD);

  if (!FigCustomURLResponseInfoCreateMutable()
    && (!objc_msgSend((id)objc_msgSend(a6, "domain"), "isEqual:", CFSTR("CoreMediaErrorDomain"))
     || objc_msgSend(a6, "code") != -17297 && objc_msgSend(a6, "code") != -17296
     || !FigCustomURLResponseInfoSetSuppressErrorLogging()))
  {
    v9 = *(unsigned int (**)(OpaqueFigCustomURLHandler *, unint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                              + 8);
    if (v9 && !v9(a5, a4, 0))
    {
      v10 = *(void (**)(OpaqueFigCustomURLHandler *, unint64_t, id, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                             + 24);
      if (v10)
        v10(a5, a4, a6, 0);
    }
  }
}

- (OpaqueFigCPECryptor)copyCryptorForInitializationData:(id)a3
{
  NSObject *threadSafetyQ;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  OpaqueFigCPECryptor *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD block[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x3052000000;
  v19 = __Block_byref_object_copy__45;
  v20 = __Block_byref_object_dispose__45;
  v21 = 0;
  threadSafetyQ = self->_session->_threadSafetyQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__AVContentKeySession_AVContentKeySession_Internal__copyCryptorForInitializationData___block_invoke;
  block[3] = &unk_1E302FDB0;
  block[4] = self;
  block[5] = &v16;
  dispatch_sync(threadSafetyQ, block);
  v5 = (void *)v17[5];
  if (v5
    && (v13 = 0u,
        v14 = 0u,
        v11 = 0u,
        v12 = 0u,
        (v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v22, 16)) != 0))
  {
    v7 = *(_QWORD *)v12;
LABEL_4:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v5);
      v9 = (OpaqueFigCPECryptor *)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "copyCryptorForIdentifier:initializationData:", 0, a3);
      if (v9)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
        v9 = 0;
        if (v6)
          goto LABEL_4;
        break;
      }
    }
  }
  else
  {
    v9 = 0;
  }

  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t __86__AVContentKeySession_AVContentKeySession_Internal__copyCryptorForInitializationData___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (!*(_BYTE *)(v1 + 40))
  {
    v2 = result;
    result = objc_msgSend(*(id *)(v1 + 88), "copy");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 40) = result;
  }
  return result;
}

- (BOOL)copyCryptorForFormatDescription:(opaqueCMFormatDescription *)a3 cryptorOut:(const OpaqueFigCPECryptor *)a4 errorOut:(id *)a5
{
  signed int v7;
  signed int v8;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = PKDCopyIdentifierForFormatDescription();
  if (v7)
    v8 = v7;
  else
    v8 = 0;
  if (a5 && v8)
    *a5 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v8, 0);
  if (a4)
    *a4 = 0;
  return v8 == 0;
}

- (OpaqueFigCPECryptor)createCryptorIfNecessaryForInitializationData:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 error:(id *)a5
{
  OpaqueFigCPECryptor *result;

  result = -[AVContentKeySession copyCryptorForInitializationData:](self, "copyCryptorForInitializationData:");
  if (!result)
    return -[AVContentKeyReportGroup createCryptorIfNecessaryForIdentifier:initializationData:formatDescription:hlsMethod:error:](self->_session->_defaultContentKeyGroup, "createCryptorIfNecessaryForIdentifier:initializationData:formatDescription:hlsMethod:error:", 0, a3, a4, 0, a5);
  return result;
}

- (OpaqueFigCPECryptor)copyCryptorForCryptKeyAttributes:(id)a3
{
  NSObject *threadSafetyQ;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  OpaqueFigCPECryptor *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD block[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x3052000000;
  v19 = __Block_byref_object_copy__45;
  v20 = __Block_byref_object_dispose__45;
  v21 = 0;
  threadSafetyQ = self->_session->_threadSafetyQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__AVContentKeySession_AVContentKeySession_Internal__copyCryptorForCryptKeyAttributes___block_invoke;
  block[3] = &unk_1E302FDB0;
  block[4] = self;
  block[5] = &v16;
  dispatch_sync(threadSafetyQ, block);
  v5 = (void *)v17[5];
  if (v5
    && (v13 = 0u,
        v14 = 0u,
        v11 = 0u,
        v12 = 0u,
        (v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v22, 16)) != 0))
  {
    v7 = *(_QWORD *)v12;
LABEL_4:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v5);
      v9 = (OpaqueFigCPECryptor *)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "copyCryptorForCryptKeyAttributes:", a3);
      if (v9)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
        v9 = 0;
        if (v6)
          goto LABEL_4;
        break;
      }
    }
  }
  else
  {
    v9 = 0;
  }

  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t __86__AVContentKeySession_AVContentKeySession_Internal__copyCryptorForCryptKeyAttributes___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (!*(_BYTE *)(v1 + 40))
  {
    v2 = result;
    result = objc_msgSend(*(id *)(v1 + 88), "copy");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 40) = result;
  }
  return result;
}

- (void)_handleRequest:(__CFDictionary *)a3 withRequestID:(unint64_t)a4 fromHandler:(OpaqueFigCustomURLHandler *)a5 willHandleRequest:(BOOL *)a6
{
  unint64_t v11;
  _BOOL4 useContentKeyBoss;
  int v13;
  char v14;
  int v15;
  _BOOL4 v16;
  void *v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  OpaqueFigCPECryptor *v21;
  void (*v22)(CFTypeRef, _QWORD, _QWORD, unint64_t *);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  id v27;
  CFTypeRef cf;
  id v29;
  CFTypeRef v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v29 = 0;
  v30 = 0;
  v27 = 0;
  cf = 0;
  v26 = 0;
  *a6 = 0;
  if (self->_session->_isExpired)
    goto LABEL_10;
  v11 = -[AVContentKeySession defaultGroupID](self, "defaultGroupID");
  useContentKeyBoss = self->_session->_useContentKeyBoss;
  v13 = FigCustomURLRequestInfoCopyCryptor();
  if (useContentKeyBoss)
  {
    FigCustomURLRequestInfoCopyCryptKeyAttributes();
    if ((unint64_t)v30 | v26 && !FigCustomURLRequestInfoCopyURL())
    {
      FigCustomURLRequestInfoCopyAllowedUniversalTypeIdentifiers();
      v14 = objc_msgSend(v27, "containsObject:", CFSTR("com.apple.streamingkeydelivery.persistentcontentkey"));
      v15 = objc_msgSend(v27, "containsObject:", CFSTR("com.apple.streamingkeydelivery.contentkey"));
      if (v26)
      {
        v17 = (void *)objc_msgSend((id)v26, "objectForKeyedSubscript:", *MEMORY[0x1E0CC3ED0]);
        v18 = +[AVContentKeyRequest _ensureProtocolVersionList:](AVContentKeyRequest, "_ensureProtocolVersionList:", 0);
        if (objc_msgSend(v17, "isEqual:", *MEMORY[0x1E0CC3EC0]))
          v19 = 2;
        else
          v19 = 1;
        v20 = -[AVContentKeySession _processContentKeyRequestWithIdentifier:encryptionMethod:supportedProtocolVersions:options:groupID:error:](self, "_processContentKeyRequestWithIdentifier:encryptionMethod:supportedProtocolVersions:options:groupID:error:", objc_msgSend(v29, "absoluteString"), v19, v18, 0, v11, 0);
        *a6 = 1;
        -[AVContentKeySession _sendFinishLoadingForPreloadedKeyRequest:withRequestID:fromHandler:error:](self, "_sendFinishLoadingForPreloadedKeyRequest:withRequestID:fromHandler:error:", a3, v20, a5, 0);
        goto LABEL_10;
      }
      if ((v14 & 1) != 0 || (v16 = v30 != 0, (_os_feature_enabled_impl() ^ 1 | v16 & ~v15) != 1))
        -[AVContentKeySession _sendFinishLoadingForPreloadedKeyRequest:withRequestID:fromHandler:error:](self, "_sendFinishLoadingForPreloadedKeyRequest:withRequestID:fromHandler:error:", a3, a4, a5, objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreMediaErrorDomain"), -17297, 0));
      else
        -[AVContentKeySession issueContentKeyRequestWithCustomURLHandler:identifier:requestInfo:requestID:providesPersistableKey:](self, "issueContentKeyRequestWithCustomURLHandler:identifier:requestInfo:requestID:providesPersistableKey:", a5, objc_msgSend(v29, "absoluteString"), a3, a4, 0);
      v21 = 0;
      goto LABEL_28;
    }
LABEL_10:
    v21 = 0;
    goto LABEL_29;
  }
  if (v13)
    goto LABEL_10;
  v22 = *(void (**)(CFTypeRef, _QWORD, _QWORD, unint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48);
  if (v22)
    v22(v30, *MEMORY[0x1E0CA31B0], *MEMORY[0x1E0C9AE00], &v26);
  if (FigCustomURLRequestInfoCopyCryptor())
    goto LABEL_10;
  if (v26)
  {
    v21 = -[AVContentKeySession copyCryptorForCryptKeyAttributes:](self, "copyCryptorForCryptKeyAttributes:");
    if (v21 && !FigCFEqual())
    {
      if (dword_1EE2B0250)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      -[AVContentKeySession _sendFinishLoadingForPreloadedKeyRequest:withRequestID:fromHandler:error:](self, "_sendFinishLoadingForPreloadedKeyRequest:withRequestID:fromHandler:error:", a3, a4, a5, objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreMediaErrorDomain"), -17296, 0, v24, v25));
      goto LABEL_28;
    }
  }
  else
  {
    v21 = 0;
  }
  if (FigCustomURLRequestInfoCopyURL())
    goto LABEL_29;
  -[AVContentKeySession issueContentKeyRequestWithCustomURLHandler:identifier:requestInfo:requestID:providesPersistableKey:](self, "issueContentKeyRequestWithCustomURLHandler:identifier:requestInfo:requestID:providesPersistableKey:", a5, objc_msgSend(v29, "absoluteString"), a3, a4, 0);
LABEL_28:
  *a6 = 1;
LABEL_29:
  if (cf)
    CFRelease(cf);
  if (v30)
    CFRelease(v30);
  if (v21)
    CFRelease(v21);

}

- (AVContentKeyReportGroup)defaultContentKeyGroup
{
  return self->_session->_defaultContentKeyGroup;
}

- (id)makeContentKeyGroup
{
  NSObject *threadSafetyQ;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v5;
  _QWORD block[7];
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__45;
  v13 = __Block_byref_object_dispose__45;
  v14 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3052000000;
  v8[3] = __Block_byref_object_copy__45;
  v8[4] = __Block_byref_object_dispose__45;
  v8[5] = 0;
  threadSafetyQ = self->_session->_threadSafetyQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__AVContentKeySession_AVContentKeyGroup_Support__makeContentKeyGroup__block_invoke;
  block[3] = &unk_1E3031A40;
  block[4] = self;
  block[5] = v8;
  block[6] = &v9;
  dispatch_sync(threadSafetyQ, block);
  if (dword_1EE2B0250)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v5 = (id)v10[5];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);
  return v5;
}

AVContentKeyReportGroup *__69__AVContentKeySession_AVContentKeyGroup_Support__makeContentKeyGroup__block_invoke(_QWORD *a1)
{
  AVContentKeyReportGroup *result;
  AVWeakReference *contentKeySessionWeakReference;
  uint64_t v4;

  result = (AVContentKeyReportGroup *)a1[4];
  contentKeySessionWeakReference = result->_contentKeySessionWeakReference;
  if (!LOBYTE(contentKeySessionWeakReference[5].super.isa))
  {
    v4 = 0;
    if (!contentKeySessionWeakReference[21].super.isa
      || (result = (AVContentKeyReportGroup *)-[AVContentKeyReportGroup _makeContentKeyGroupWithIDOut:error:](result, "_makeContentKeyGroupWithIDOut:error:", &v4, *(_QWORD *)(a1[5] + 8) + 40), (_DWORD)result))
    {
      result = -[AVContentKeyReportGroup initWithKeySystem:keySession:contentKeyBoss:useContentKeyBoss:groupID:storageDirectoryAtURL:]([AVContentKeyReportGroup alloc], "initWithKeySystem:keySession:contentKeyBoss:useContentKeyBoss:groupID:storageDirectoryAtURL:", *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 72));
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
      if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
        return (AVContentKeyReportGroup *)objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 88), "addObject:");
    }
  }
  return result;
}

- (unint64_t)_processContentKeyRequestWithIdentifier:(id)a3 encryptionMethod:(int)a4 supportedProtocolVersions:(id)a5 options:(id)a6 groupID:(unint64_t)a7 error:(id *)a8
{
  void *v13;
  unint64_t result;
  signed int v15;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v17;
  signed int v18;
  OpaqueFigContentKeyBoss *contentKeyBoss;
  uint64_t (*v20)(OpaqueFigContentKeyBoss *, CFTypeRef, unint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, unint64_t *, CFMutableDictionaryRef, CFTypeRef *);
  signed int v21;
  AVContentKeyRequestParams *v22;
  CFTypeRef v23;
  unint64_t v24;
  CFTypeRef cf;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v24 = 0;
  cf = 0;
  v23 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a8)
        return 0;
      v26 = *MEMORY[0x1E0C9AFA8];
      v27[0] = CFSTR("identifier is not string or url");
      v13 = (void *)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11862, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1));
      result = 0;
      *a8 = v13;
      return result;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a3, "absoluteString");
  v15 = FigContentKeySpecifierCreate();
  if (v15)
    goto LABEL_27;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
  {
    v15 = FigSignalErrorAt();
LABEL_27:
    v21 = v15;
    goto LABEL_16;
  }
  v17 = Mutable;
  FigCFDictionarySetBoolean();
  v18 = FigContentKeyRequestParamsCreate();
  if (v18)
  {
    v21 = v18;
    goto LABEL_29;
  }
  contentKeyBoss = self->_session->_contentKeyBoss;
  v20 = *(uint64_t (**)(OpaqueFigContentKeyBoss *, CFTypeRef, unint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, unint64_t *, CFMutableDictionaryRef, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v20)
  {
    v22 = 0;
    v21 = -12782;
    goto LABEL_15;
  }
  v21 = v20(contentKeyBoss, v23, a7, 0, 0, 0, 0, 0, 0, &v24, v17, &v23);
  if (v21)
  {
LABEL_29:
    v22 = 0;
    goto LABEL_15;
  }
  v22 = -[AVContentKeyRequestParams initWithInitializationData:contentIdentifier:keyIDFromInitializationData:options:identifier:]([AVContentKeyRequestParams alloc], "initWithInitializationData:contentIdentifier:keyIDFromInitializationData:options:identifier:", 0, 0, 0, a6, a3);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_session->keyRequestParamsByRequestID, "setObject:forKeyedSubscript:", v22, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v24));
LABEL_15:

  CFRelease(v17);
LABEL_16:
  if (cf)
    CFRelease(cf);
  if (v23)
    CFRelease(v23);
  if (a8)
  {
    if (v21)
      *a8 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v21, 0);
  }
  return v24;
}

- (BOOL)_renewKeyWithIdentifier:(id)a3 encryptionMethod:(int)a4 initializationData:(id)a5 contentIdentifier:(id)a6 keyIDFromInitializationData:(id)a7 options:(id)a8 error:(id *)a9
{
  signed int v15;
  OpaqueFigContentKeyBoss *contentKeyBoss;
  uint64_t (*v17)(OpaqueFigContentKeyBoss *, CFTypeRef, _QWORD, _QWORD, _QWORD, id *);
  AVContentKeyRequestParams *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  signed int v24;
  BOOL v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CFTypeRef cf;
  id v33;
  _BYTE v34[128];
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  cf = 0;
  v33 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a9)
        return 0;
      v35 = *MEMORY[0x1E0C9AFA8];
      v36[0] = CFSTR("identifier is not string or url");
      v26 = (void *)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11862, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1));
      v25 = 0;
      goto LABEL_24;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a3, "absoluteString");
  v15 = FigContentKeySpecifierCreate();
  if (v15)
    goto LABEL_27;
  contentKeyBoss = self->_session->_contentKeyBoss;
  v17 = *(uint64_t (**)(OpaqueFigContentKeyBoss *, CFTypeRef, _QWORD, _QWORD, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
  if (!v17)
  {
    v25 = 0;
    v18 = 0;
    v24 = -12782;
    goto LABEL_17;
  }
  v15 = v17(contentKeyBoss, cf, 0, 0, 0, &v33);
  if (v15)
  {
LABEL_27:
    v24 = v15;
    v25 = 0;
    v18 = 0;
  }
  else
  {
    v18 = -[AVContentKeyRequestParams initWithInitializationData:contentIdentifier:keyIDFromInitializationData:options:identifier:]([AVContentKeyRequestParams alloc], "initWithInitializationData:contentIdentifier:keyIDFromInitializationData:options:identifier:", a5, a6, a7, a8, a3);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v19 = v33;
    v20 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(v19);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_session->keyRequestParamsByRequestID, "setObject:forKeyedSubscript:", v18, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v21);
    }
    v24 = 0;
    v25 = 1;
  }
LABEL_17:

  if (cf)
    CFRelease(cf);
  if (a9 && v24)
  {
    v26 = (void *)AVLocalizedErrorWithUnderlyingOSStatus(v24, 0);
LABEL_24:
    *a9 = v26;
  }
  return v25;
}

- (BOOL)_makeContentKeyGroupWithIDOut:(unint64_t *)a3 error:(id *)a4
{
  OpaqueFigContentKeyBoss *contentKeyBoss;
  uint64_t (*v7)(OpaqueFigContentKeyBoss *, unint64_t *);
  signed int v8;

  contentKeyBoss = self->_session->_contentKeyBoss;
  v7 = *(uint64_t (**)(OpaqueFigContentKeyBoss *, unint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 64);
  if (v7)
  {
    v8 = v7(contentKeyBoss, a3);
    if (!a4)
      return v8 == 0;
  }
  else
  {
    v8 = -12782;
    if (!a4)
      return v8 == 0;
  }
  if (v8)
    *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v8, 0);
  return v8 == 0;
}

- (BOOL)isDefunct
{
  OpaqueFigContentKeyBoss *contentKeyBoss;
  _QWORD *v3;
  unsigned int (*v4)(OpaqueFigContentKeyBoss *, unsigned __int8 *);
  BOOL v5;
  int v6;
  unsigned __int8 v8;

  v8 = 0;
  contentKeyBoss = self->_session->_contentKeyBoss;
  v3 = *(_QWORD **)(CMBaseObjectGetVTable() + 8);
  if (*v3 < 5uLL)
  {
    LODWORD(v4) = 0;
  }
  else
  {
    v4 = (unsigned int (*)(OpaqueFigContentKeyBoss *, unsigned __int8 *))v3[11];
    if (v4)
    {
      v5 = v4(contentKeyBoss, &v8) == 0;
      LODWORD(v4) = v8;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  if (v5)
    v6 = (int)v4;
  else
    v6 = 1;
  if (!(_DWORD)v4)
    LODWORD(v4) = v6;
  return (_DWORD)v4 == 1;
}

@end
