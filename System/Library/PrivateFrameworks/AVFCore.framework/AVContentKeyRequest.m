@implementation AVContentKeyRequest

- (AVContentKeyRequest)initWithContentKeySession:(id)a3 reportGroup:(id)a4 identifier:(id)a5 contentIdentifier:(id)a6 keyIDFromInitializationData:(id)a7 initializationData:(id)a8 preloadingRequestOptions:(id)a9 providesPersistableKey:(BOOL)a10
{
  AVContentKeyRequest *v17;
  id v18;
  AVContentKeyRequestInternal *v19;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  objc_super v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)AVContentKeyRequest;
  v17 = -[AVContentKeyRequest init](&v31, sel_init);
  if (!v17)
    goto LABEL_18;
  if ((objc_msgSend((id)objc_msgSend(a3, "keySystem"), "isEqual:", CFSTR("FairPlayStreaming")) & 1) == 0 && a10)
  {
    v22 = (void *)MEMORY[0x1E0C99DA0];
    v23 = *MEMORY[0x1E0C99778];
    v24 = objc_msgSend(a3, "keySystem");
    v30 = (void *)objc_msgSend(v22, "exceptionWithName:reason:userInfo:", v23, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v17, a2, (uint64_t)CFSTR("%@ does not support key persistence"), v25, v26, v27, v28, v29, v24), 0);
    objc_exception_throw(v30);
  }
  v18 = a9;
  +[AVContentKeyRequest _validateProtocolVersionList:](AVContentKeyRequest, "_validateProtocolVersionList:", objc_msgSend(a9, "objectForKeyedSubscript:", CFSTR("ProtocolVersionsKey")));
  +[AVContentKeyRequest _validateHLSEncryptionMethod:](AVContentKeyRequest, "_validateHLSEncryptionMethod:", objc_msgSend(a9, "objectForKeyedSubscript:", CFSTR("HLSMethodKey")));
  v19 = objc_alloc_init(AVContentKeyRequestInternal);
  v17->_contentKeyRequest = v19;
  if (v19)
  {
    v19->status = 0;
    objc_storeWeak((id *)&v17->_contentKeyRequest->weakSession, a3);
    v17->_contentKeyRequest->reportGroup = (AVContentKeyReportGroup *)a4;
    v17->_contentKeyRequest->identifier = (id)objc_msgSend(a5, "copy");
    v17->_contentKeyRequest->initializationData = (NSData *)objc_msgSend(a8, "copy");
    v17->_contentKeyRequest->providesPersistableKey = a10;
    v17->_contentKeyRequest->preloadingRequestOptions = (NSDictionary *)objc_msgSend(a9, "copy");
    v17->_contentKeyRequest->isRenewalRequest = 0;
    v17->_contentKeyRequest->stateMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    if (!a9)
      v18 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    if (a5)
      v17->_contentKeyRequest->contentKeySpecifier = (AVContentKeySpecifier *)-[AVContentKeySpecifier initForKeySystem:identifier:initializationData:options:]([AVContentKeySpecifier alloc], "initForKeySystem:identifier:initializationData:options:", objc_msgSend(a3, "keySystem"), a5, a8, v18);
    v17->_contentKeyRequest->contentKey = 0;
    v17->_contentKeyRequest->contentIdentifier = (NSData *)objc_msgSend(a6, "copy");
    v17->_contentKeyRequest->keyIDFromInitializationData = (NSData *)objc_msgSend(a7, "copy");
    if (dword_1EE2B0250)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
LABEL_18:
    if (FigSignalErrorAt())
    {

      return 0;
    }
  }
  return v17;
}

+ (BOOL)_prepareCryptor:(OpaqueFigCPECryptor *)a3 forRenewal:(BOOL)a4 andReturnKeyRequestID:(unint64_t *)a5 isInchargeOfKeyRequest:(BOOL *)a6 error:(id *)a7
{
  uint64_t v11;
  _QWORD *v12;
  uint64_t (*v13)(OpaqueFigCPECryptor *, uint64_t, uint64_t, BOOL *, unint64_t *);
  signed int v14;

  if (!a3)
  {
    v14 = 0;
    return v14 == 0;
  }
  if (a4)
    v11 = 3;
  else
    v11 = 1;
  v12 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
  if (*v12 >= 6uLL
    && (v13 = (uint64_t (*)(OpaqueFigCPECryptor *, uint64_t, uint64_t, BOOL *, unint64_t *))v12[20]) != 0)
  {
    v14 = v13(a3, v11, 2, a6, a5);
    if (!a7)
      return v14 == 0;
  }
  else
  {
    v14 = -12782;
    if (!a7)
      return v14 == 0;
  }
  if (v14)
  {
    *a7 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v14, 0);
    v14 = 1;
  }
  return v14 == 0;
}

- (void)_copyAndStoreCryptorUUID
{
  AVContentKeyRequestInternal *contentKeyRequest;
  OpaqueFigCPECryptor *figCryptor;
  unsigned int (*v5)(OpaqueFigCPECryptor *, _QWORD, _QWORD, NSString **);

  if (objc_msgSend(-[AVContentKeyRequest _keySystem](self, "_keySystem"), "isEqualToString:", CFSTR("FairPlayStreaming")))
  {

    self->_contentKeyRequest->cryptorUUID = 0;
    contentKeyRequest = self->_contentKeyRequest;
    figCryptor = contentKeyRequest->figCryptor;
    v5 = *(unsigned int (**)(OpaqueFigCPECryptor *, _QWORD, _QWORD, NSString **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                           + 48);
    if (v5)
    {
      if (!v5(figCryptor, *MEMORY[0x1E0CA3230], *MEMORY[0x1E0C9AE00], &contentKeyRequest->cryptorUUID))
        objc_msgSend(-[AVContentKeyRequest session](self, "session"), "_setWeakReferenceForContentKeyRequest:withCryptorUUID:", self, self->_contentKeyRequest->cryptorUUID);
    }
  }
}

- (AVContentKeyRequest)initWithContentKeySession:(id)a3 reportGroup:(id)a4 customURLHandler:(OpaqueFigCustomURLHandler *)a5 identifier:(id)a6 requestInfo:(__CFDictionary *)a7 requestID:(unint64_t)a8 providesPersistableKey:(BOOL)a9 isRenewalRequest:(BOOL)a10
{
  AVContentKeyRequest *v13;
  OpaqueFigCustomURLHandler *v14;
  __CFDictionary *v15;
  NSObject *v16;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v19;

  LOBYTE(v19) = a9;
  v13 = -[AVContentKeyRequest initWithContentKeySession:reportGroup:identifier:contentIdentifier:keyIDFromInitializationData:initializationData:preloadingRequestOptions:providesPersistableKey:](self, "initWithContentKeySession:reportGroup:identifier:contentIdentifier:keyIDFromInitializationData:initializationData:preloadingRequestOptions:providesPersistableKey:", a3, a4, a6, 0, 0, 0, 0, v19);
  if (!v13)
  {
    if (!FigSignalErrorAt())
      return 0;
LABEL_5:

    return 0;
  }
  if (a5)
    v14 = (OpaqueFigCustomURLHandler *)CFRetain(a5);
  else
    v14 = 0;
  v13->_contentKeyRequest->customURLHandler = v14;
  if (a7)
    v15 = (__CFDictionary *)CFRetain(a7);
  else
    v15 = 0;
  v13->_contentKeyRequest->requestInfo = v15;
  v13->_contentKeyRequest->customURLRequestID = a8;
  v13->_contentKeyRequest->responseParamsSent = 0;
  v13->_contentKeyRequest->isRenewalRequest = a10;
  if (FigCustomURLRequestInfoCopyCryptor())
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_5;
  }
  -[AVContentKeyRequest _copyAndStoreCryptorUUID](v13, "_copyAndStoreCryptorUUID");
  FigCustomURLRequestInfoGetCryptorKeyRequestID();
  if (dword_1EE2B0250)
  {
    v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v13;
}

- (AVContentKeyRequest)initWithContentKeySession:(id)a3 contentKeyBoss:(OpaqueFigContentKeyBoss *)a4 useContentKeyBoss:(BOOL)a5 keySpecifier:(OpaqueFigContentKeySpecifier *)a6 initializationData:(id)a7 keyIDFromInitializationData:(id)a8 contentIdentifier:(id)a9 isRenewalRequest:(BOOL)a10 requestID:(unint64_t)a11 providesPersistableKey:(BOOL)a12 preloadingRequestOptions:(id)a13 identifier:(id)a14 supportsOfflineKey:(BOOL)a15
{
  AVContentKeyRequest *v17;
  AVContentKeyRequest *v18;
  OpaqueFigContentKeySpecifier *v19;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v22;

  LOBYTE(v22) = a12;
  v17 = -[AVContentKeyRequest initWithContentKeySession:reportGroup:identifier:contentIdentifier:keyIDFromInitializationData:initializationData:preloadingRequestOptions:providesPersistableKey:](self, "initWithContentKeySession:reportGroup:identifier:contentIdentifier:keyIDFromInitializationData:initializationData:preloadingRequestOptions:providesPersistableKey:", a3, 0, a14, a9, a8, a7, a13, v22);
  v18 = v17;
  if (v17)
  {
    v17->_contentKeyRequest->requestID = a11;
    v17->_contentKeyRequest->isRenewalRequest = a10;
    if (a6)
      v19 = (OpaqueFigContentKeySpecifier *)CFRetain(a6);
    else
      v19 = 0;
    v18->_contentKeyRequest->keySpecifier = v19;
    v18->_contentKeyRequest->weakContentKeyBoss = (OpaqueFigCFWeakReferenceHolder *)FigCFWeakReferenceHolderCreateWithReferencedObject();
    v18->_contentKeyRequest->useContentKeyBoss = a5;
    v18->_contentKeyRequest->supportsOfflineKey = a15;
    if (dword_1EE2B0250)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    FigSignalErrorAt();
  }
  return v18;
}

- (void)dealloc
{
  AVContentKeyRequestInternal *contentKeyRequest;
  OpaqueFigCPECryptor *figCryptor;
  OpaqueFigCustomURLHandler *customURLHandler;
  __CFDictionary *requestInfo;
  OpaqueFigCFWeakReferenceHolder *weakContentKeyBoss;
  OpaqueFigContentKeySpecifier *keySpecifier;
  objc_super v9;

  contentKeyRequest = self->_contentKeyRequest;
  figCryptor = contentKeyRequest->figCryptor;
  if (figCryptor)
  {
    CFRelease(figCryptor);
    contentKeyRequest = self->_contentKeyRequest;
  }
  customURLHandler = contentKeyRequest->customURLHandler;
  if (customURLHandler)
  {
    CFRelease(customURLHandler);
    contentKeyRequest = self->_contentKeyRequest;
  }
  requestInfo = contentKeyRequest->requestInfo;
  if (requestInfo)
  {
    CFRelease(requestInfo);
    contentKeyRequest = self->_contentKeyRequest;
  }
  weakContentKeyBoss = contentKeyRequest->weakContentKeyBoss;
  if (weakContentKeyBoss)
  {
    CFRelease(weakContentKeyBoss);
    contentKeyRequest = self->_contentKeyRequest;
  }
  keySpecifier = contentKeyRequest->keySpecifier;
  if (keySpecifier)
    CFRelease(keySpecifier);
  FigSimpleMutexDestroy();

  v9.receiver = self;
  v9.super_class = (Class)AVContentKeyRequest;
  -[AVContentKeyRequest dealloc](&v9, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p status:%d>"), NSStringFromClass(v4), self, self->_contentKeyRequest->status);
}

- (id)_keySystem
{
  return (id)objc_msgSend(-[AVContentKeyRequest session](self, "session"), "keySystem");
}

- (unint64_t)_requestID
{
  AVContentKeyRequestInternal *contentKeyRequest;
  unint64_t requestID;

  MEMORY[0x194033BF8](self->_contentKeyRequest->stateMutex, a2);
  contentKeyRequest = self->_contentKeyRequest;
  requestID = contentKeyRequest->requestID;
  MEMORY[0x194033C04](contentKeyRequest->stateMutex);
  return requestID;
}

- (OpaqueFigContentKeyBoss)_copyContentKeyBoss
{
  OpaqueFigContentKeyBoss *result;

  result = (OpaqueFigContentKeyBoss *)self->_contentKeyRequest->weakContentKeyBoss;
  if (result)
    return (OpaqueFigContentKeyBoss *)FigCFWeakReferenceHolderCopyReferencedObject();
  return result;
}

- (id)identifier
{
  AVContentKeyRequestInternal *contentKeyRequest;
  id result;

  contentKeyRequest = self->_contentKeyRequest;
  result = contentKeyRequest->keyIDFromInitializationData;
  if (!result)
    return contentKeyRequest->identifier;
  return result;
}

- (id)identifierString
{
  return self->_contentKeyRequest->identifier;
}

- (NSData)initializationData
{
  return self->_contentKeyRequest->initializationData;
}

- (AVContentKeyRequestStatus)status
{
  return self->_contentKeyRequest->status;
}

- (NSDictionary)options
{
  NSDictionary *result;

  result = self->_contentKeyRequest->preloadingRequestOptions;
  if (!result)
    return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  return result;
}

- (int)_encryptionMethod
{
  return FigContentKeySpecifierGetEncryptionMethod();
}

- (void)_setStatus:(int64_t)a3
{
  OpaqueFigContentKeyBoss *v5;
  AVContentKeyRequestInternal *contentKeyRequest;
  int64_t status;
  AVContentKeySpecifier *v9;

  v5 = -[AVContentKeyRequest _copyContentKeyBoss](self, "_copyContentKeyBoss");
  MEMORY[0x194033BF8](self->_contentKeyRequest->stateMutex);
  contentKeyRequest = self->_contentKeyRequest;
  status = contentKeyRequest->status;
  if (status <= 3 && status != a3)
  {
    if (status <= a3)
      status = a3;
    contentKeyRequest->status = status;
    contentKeyRequest = self->_contentKeyRequest;
    if (contentKeyRequest->status == 1)
    {
      if (-[AVContentKeyRequest figCryptor](self, "figCryptor"))
      {
        v9 = -[AVContentKeyRequest contentKeySpecifier](self, "contentKeySpecifier");
        contentKeyRequest = self->_contentKeyRequest;
        if (v9 && !contentKeyRequest->contentKey)
        {
          self->_contentKeyRequest->contentKey = -[AVContentKey initWithSpecifier:cryptor:contentKeyBoss:contentKeySpecifier:]([AVContentKey alloc], "initWithSpecifier:cryptor:contentKeyBoss:contentKeySpecifier:", -[AVContentKeyRequest contentKeySpecifier](self, "contentKeySpecifier"), -[AVContentKeyRequest figCryptor](self, "figCryptor"), v5, self->_contentKeyRequest->keySpecifier);
          MEMORY[0x194033C04](self->_contentKeyRequest->stateMutex);
          if (v5)
            CFRelease(v5);
          objc_msgSend(-[AVContentKeyRequest session](self, "session"), "contentKeyRequestDidProduceContentKey:", self->_contentKeyRequest->contentKey);
          return;
        }
      }
      else
      {
        contentKeyRequest = self->_contentKeyRequest;
      }
    }
  }
  MEMORY[0x194033C04](contentKeyRequest->stateMutex);
  if (v5)
    CFRelease(v5);
}

- (void)_clearContext
{
  AVContentKeyRequestInternal *contentKeyRequest;
  OpaqueFigCustomURLHandler *customURLHandler;
  __CFDictionary *requestInfo;

  contentKeyRequest = self->_contentKeyRequest;
  customURLHandler = contentKeyRequest->customURLHandler;
  if (customURLHandler)
  {
    CFRelease(customURLHandler);
    self->_contentKeyRequest->customURLHandler = 0;
    contentKeyRequest = self->_contentKeyRequest;
  }
  requestInfo = contentKeyRequest->requestInfo;
  if (requestInfo)
  {
    CFRelease(requestInfo);
    self->_contentKeyRequest->requestInfo = 0;
    contentKeyRequest = self->_contentKeyRequest;
  }
  contentKeyRequest->customURLRequestID = 0;
}

- (BOOL)_prepareForKeyRenewalReturningError:(id *)a3
{
  -[AVContentKeyRequest _clearContext](self, "_clearContext");
  self->_contentKeyRequest->isRenewalRequest = 1;
  return +[AVContentKeyRequest _prepareCryptor:forRenewal:andReturnKeyRequestID:isInchargeOfKeyRequest:error:](AVContentKeyRequest, "_prepareCryptor:forRenewal:andReturnKeyRequestID:isInchargeOfKeyRequest:error:", self->_contentKeyRequest->figCryptor, 1, &self->_contentKeyRequest->cryptorKeyRequestID, &self->_contentKeyRequest->isInchargeOfKeyRequest, a3);
}

- (BOOL)renewsExpiringResponseData
{
  return self->_contentKeyRequest->isRenewalRequest;
}

- (NSError)error
{
  return self->_contentKeyRequest->error;
}

- (void)_setError:(id)a3
{
  AVContentKeyRequestInternal *contentKeyRequest;
  id v6;
  OpaqueFigCPECryptor *figCryptor;
  void (*v8)(OpaqueFigCPECryptor *, _QWORD, id);
  _QWORD v9[6];

  -[AVContentKeyRequest _setStatus:](self, "_setStatus:", 5);
  MEMORY[0x194033BF8](self->_contentKeyRequest->stateMutex);
  if (self->_contentKeyRequest->error)
    JUMPOUT(0x194033C04);
  self->_contentKeyRequest->error = (NSError *)objc_msgSend(a3, "copy");
  MEMORY[0x194033C04](self->_contentKeyRequest->stateMutex);
  contentKeyRequest = self->_contentKeyRequest;
  if (contentKeyRequest->customURLHandler)
  {
    -[AVContentKeyRequest _finishLoadingCustomURLRequestWithError:](self, "_finishLoadingCustomURLRequestWithError:", contentKeyRequest->error);
  }
  else
  {
    figCryptor = contentKeyRequest->figCryptor;
    if (figCryptor)
    {
      if (contentKeyRequest->isInchargeOfKeyRequest)
      {
        v8 = *(void (**)(OpaqueFigCPECryptor *, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
        if (v8)
          v8(figCryptor, *MEMORY[0x1E0CA31E0], a3);
      }
    }
  }
  v6 = -[AVContentKeyRequest session](self, "session");
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __33__AVContentKeyRequest__setError___block_invoke;
    v9[3] = &unk_1E3035A40;
    v9[4] = v6;
    v9[5] = self;
    objc_msgSend(v6, "_invokeDelegateCallbackWithBlock:synchronouslyWhenDelegateQueueIsNULL:", v9, 0);
  }
}

uint64_t __33__AVContentKeyRequest__setError___block_invoke(uint64_t result, void *a2)
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
      return objc_msgSend(a2, "contentKeySession:contentKeyRequest:didFailWithError:", *(_QWORD *)(v3 + 32), v5, v6);
    }
  }
  return result;
}

- (BOOL)canProvidePersistableContentKey
{
  return self->_contentKeyRequest->providesPersistableKey;
}

- (AVContentKeySpecifier)contentKeySpecifier
{
  return self->_contentKeyRequest->contentKeySpecifier;
}

- (AVContentKey)contentKey
{
  return self->_contentKeyRequest->contentKey;
}

- (OpaqueFigCPECryptor)figCryptor
{
  return self->_contentKeyRequest->figCryptor;
}

- (id)session
{
  return objc_loadWeak((id *)&self->_contentKeyRequest->weakSession);
}

- (id)keyIDFromInitializationData
{
  return self->_contentKeyRequest->keyIDFromInitializationData;
}

- (id)contentIdentifier
{
  return self->_contentKeyRequest->contentIdentifier;
}

- (id)_getRetryReasonForError:(int)a3
{
  if (a3 <= -42670)
  {
    if (a3 != -42800)
    {
      if (a3 == -42799)
        return CFSTR("ReceivedObsoleteKeyResponse");
      else
        return 0;
    }
    return CFSTR("ReceivedKeyResponseWithExpiredLease");
  }
  if (a3 == -42668)
    return CFSTR("ReceivedKeyResponseWithExpiredLease");
  if (a3 == -42669)
    return CFSTR("ReceivedKeyResponseAfterSPCTimedOut");
  else
    return 0;
}

- (void)_handleKeyResponseError:(id)a3
{
  id v5;
  id v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[7];
  os_log_type_t type;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "code"))
  {
    v5 = -[AVContentKeyRequest _getRetryReasonForError:](self, "_getRetryReasonForError:");
    if (v5)
    {
      v6 = v5;
      if (dword_1EE2B0250)
      {
        v13 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v8 = -[AVContentKeyRequest session](self, "session", v9, v10);
      if (v8)
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __47__AVContentKeyRequest__handleKeyResponseError___block_invoke;
        v11[3] = &unk_1E3035A68;
        v11[4] = v8;
        v11[5] = self;
        v11[6] = v6;
        objc_msgSend(v8, "_invokeDelegateCallbackWithBlock:synchronouslyWhenDelegateQueueIsNULL:", v11, 0);
      }
    }
    else
    {
      -[AVContentKeyRequest _setError:](self, "_setError:", a3);
    }
  }
}

uint64_t __47__AVContentKeyRequest__handleKeyResponseError___block_invoke(uint64_t a1, void *a2)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (a2
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(a2, "contentKeySession:shouldRetryContentKeyRequest:reason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))
  {
    return objc_msgSend(*(id *)(a1 + 40), "_setStatus:", 3);
  }
  if (dword_1EE2B0250)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend(*(id *)(a1 + 40), "_setError:", AVLocalizedErrorWithUnderlyingOSStatus(-11835, 0));
}

- (void)_handleKeyResponseSuccessWithCryptor:(OpaqueFigCPECryptor *)a3
{
  OpaqueFigContentKeyBoss *v5;
  id v6;
  void *v7;
  int v8;
  AVContentKeyRequestInternal *contentKeyRequest;
  OpaqueFigCPECryptor *figCryptor;
  _QWORD v11[6];

  v5 = -[AVContentKeyRequest _copyContentKeyBoss](self, "_copyContentKeyBoss");
  MEMORY[0x194033BF8](self->_contentKeyRequest->stateMutex);
  self->_contentKeyRequest->hasAnyKeyRequestSucceeded = 1;
  v6 = -[AVContentKeyRequest session](self, "session");
  v7 = v6;
  v8 = 0;
  contentKeyRequest = self->_contentKeyRequest;
  if (a3 && v6)
  {
    figCryptor = contentKeyRequest->figCryptor;
    contentKeyRequest->figCryptor = a3;
    CFRetain(a3);
    if (figCryptor)
      CFRelease(figCryptor);
    contentKeyRequest = self->_contentKeyRequest;
    if (contentKeyRequest->contentKey)
    {
      v8 = 0;
    }
    else
    {
      self->_contentKeyRequest->contentKey = -[AVContentKey initWithSpecifier:cryptor:contentKeyBoss:contentKeySpecifier:]([AVContentKey alloc], "initWithSpecifier:cryptor:contentKeyBoss:contentKeySpecifier:", -[AVContentKeyRequest contentKeySpecifier](self, "contentKeySpecifier"), -[AVContentKeyRequest figCryptor](self, "figCryptor"), v5, self->_contentKeyRequest->keySpecifier);
      contentKeyRequest = self->_contentKeyRequest;
      v8 = 1;
    }
  }
  MEMORY[0x194033C04](contentKeyRequest->stateMutex);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__AVContentKeyRequest__handleKeyResponseSuccessWithCryptor___block_invoke;
  v11[3] = &unk_1E3035A40;
  v11[4] = v7;
  v11[5] = self;
  objc_msgSend(v7, "_invokeDelegateCallbackWithBlock:synchronouslyWhenDelegateQueueIsNULL:", v11, 0);
  if (v8)
    objc_msgSend(v7, "contentKeyRequestDidProduceContentKey:", self->_contentKeyRequest->contentKey);
  if (v5)
    CFRelease(v5);
}

uint64_t __60__AVContentKeyRequest__handleKeyResponseSuccessWithCryptor___block_invoke(uint64_t result, void *a2)
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
      return objc_msgSend(a2, "contentKeySession:contentKeyRequestDidSucceed:", *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40), v5, v6);
    }
  }
  return result;
}

- (BOOL)ensureCryptorWithFormatDescription:(opaqueCMFormatDescription *)a3 error:(id *)a4
{
  id v7;
  id v8;
  AVContentKeyRequestInternal *contentKeyRequest;
  id v10;
  OpaqueFigCPECryptor *figCryptor;
  uint64_t (*v12)(OpaqueFigCPECryptor *, _QWORD, id);
  signed int v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v15;
  void *v17[27];

  v17[26] = *(void **)MEMORY[0x1E0C80C00];
  v17[0] = 0;
  v7 = -[NSDictionary objectForKeyedSubscript:](self->_contentKeyRequest->preloadingRequestOptions, "objectForKeyedSubscript:", CFSTR("ProtocolVersionsKey"));
  v8 = -[NSDictionary objectForKeyedSubscript:](self->_contentKeyRequest->preloadingRequestOptions, "objectForKeyedSubscript:", CFSTR("HLSMethodKey"));
  MEMORY[0x194033BF8](self->_contentKeyRequest->stateMutex);
  contentKeyRequest = self->_contentKeyRequest;
  if (contentKeyRequest->figCryptor)
    goto LABEL_8;
  self->_contentKeyRequest->figCryptor = -[AVContentKeyReportGroup createCryptorIfNecessaryForIdentifier:initializationData:formatDescription:hlsMethod:error:](contentKeyRequest->reportGroup, "createCryptorIfNecessaryForIdentifier:initializationData:formatDescription:hlsMethod:error:", contentKeyRequest->identifier, contentKeyRequest->initializationData, a3, v8, v17);
  if (!self->_contentKeyRequest->figCryptor)
  {
LABEL_7:
    v13 = FigSignalErrorAt();
    goto LABEL_10;
  }
  if (!objc_msgSend(-[AVContentKeyRequest _keySystem](self, "_keySystem"), "isEqualToString:", CFSTR("FairPlayStreaming")))
  {
LABEL_8:
    v13 = 0;
  }
  else
  {
    v10 = +[AVContentKeyRequest _ensureProtocolVersionList:](AVContentKeyRequest, "_ensureProtocolVersionList:", v7);
    figCryptor = self->_contentKeyRequest->figCryptor;
    v12 = *(uint64_t (**)(OpaqueFigCPECryptor *, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v12)
    {
      v13 = v12(figCryptor, *MEMORY[0x1E0CA3208], v10);
      if (!v13)
      {
        -[AVContentKeyRequest _copyAndStoreCryptorUUID](self, "_copyAndStoreCryptorUUID");
        if (!+[AVContentKeyRequest _prepareCryptor:forRenewal:andReturnKeyRequestID:isInchargeOfKeyRequest:error:](AVContentKeyRequest, "_prepareCryptor:forRenewal:andReturnKeyRequestID:isInchargeOfKeyRequest:error:", self->_contentKeyRequest->figCryptor, 0, &self->_contentKeyRequest->cryptorKeyRequestID, &self->_contentKeyRequest->isInchargeOfKeyRequest, v17))goto LABEL_7;
      }
    }
    else
    {
      v13 = -12782;
    }
  }
LABEL_10:
  MEMORY[0x194033C04](self->_contentKeyRequest->stateMutex);
  if (dword_1EE2B0250)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a4 && v13)
  {
    if (v17[0])
      v15 = (void *)AVLocalizedErrorWithUnderlyingOSStatusAndUnderlyingError(v13, 0, v17[0], 1);
    else
      v15 = (void *)AVLocalizedErrorWithUnderlyingOSStatus(v13, 0);
    *a4 = v15;
  }
  return v13 == 0;
}

+ (id)_mergePreloadingRequestOptions:(id)a3 withCreateKeyRequestOptions:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a3)
    v6 = (id)objc_msgSend(a3, "mutableCopy");
  else
    v6 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = v6;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (void *)objc_msgSend(a4, "allKeys", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (!objc_msgSend(a3, "objectForKeyedSubscript:", v13))
          objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a4, "objectForKeyedSubscript:", v13), v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v7);
}

+ (void)_validateProtocolVersionList:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_12:
      v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)CFSTR("value against AVContentKeyRequestProtocolVersionsKey should be an array of NSNumber objects"), v6, v7, v8, v9, v10, v16), 0);
      objc_exception_throw(v15);
    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(a3);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_12;
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }
  }
}

+ (void)_validateHLSEncryptionMethod:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  if (a3
    && (objc_msgSend(a3, "isEqualToString:", CFSTR("ISO_23001_7")) & 1) == 0
    && (objc_msgSend(a3, "isEqualToString:", CFSTR("SAMPLE-AES")) & 1) == 0)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)CFSTR("value against AVContentKeyRequestHLSMethodKey is not recognized"), v6, v7, v8, v9, v10, v12), 0);
    objc_exception_throw(v11);
  }
}

+ (void)_validateServerChallenge:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(a3, "length") == 8)
        return;
      v11 = (void *)MEMORY[0x1E0C99DA0];
      v12 = *MEMORY[0x1E0C99778];
      v13 = CFSTR("Server challenge should be 8 bytes in length");
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0C99DA0];
      v12 = *MEMORY[0x1E0C99778];
      v13 = CFSTR("value against AVContentKeySessionServerPlaybackContextOptionServerChallenge should be a NSData instance");
    }
    v14 = (void *)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)v13, v6, v7, v8, v9, v10, v15), 0);
    objc_exception_throw(v14);
  }
}

+ (id)_ensureProtocolVersionList:(id)a3
{
  void *v3;

  v3 = &unk_1E3093CD0;
  if (a3 && objc_msgSend(a3, "count"))
    return a3;
  return v3;
}

+ (id)_createKeyRequestDictionaryForApp:(id)a3 persistentKey:(id)a4 serverChallenge:(id)a5 cryptorKeyRequestID:(unint64_t)a6 purpose:(int)a7
{
  uint64_t v7;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v7 = *(_QWORD *)&a7;
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = v12;
  if (a3)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", a3, *MEMORY[0x1E0CA4D10]);
  if (a4)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", a4, *MEMORY[0x1E0CA4D38]);
  if (a5)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", a5, *MEMORY[0x1E0CA4D68]);
  v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a6);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CA4D30]);
  v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CA4D50]);
  return v13;
}

- (id)contentKeyRequestDataForApp:(id)a3 contentIdentifier:(id)a4 options:(id)a5 error:(id *)a6
{
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  signed int v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  AVContentKeyRequestInternal *contentKeyRequest;
  OpaqueFigCPECryptor *figCryptor;
  uint64_t (*v34)(OpaqueFigCPECryptor *, _QWORD, _QWORD);
  OpaqueFigCPECryptor *v35;
  _QWORD *v36;
  uint64_t (*v37)(OpaqueFigCPECryptor *, id, _QWORD, id *);
  void *v38;
  void *v40;
  uint64_t v42;
  int v43;
  uint64_t v44;
  id v45;
  void *v46;

  v45 = 0;
  v46 = 0;
  v11 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("StreamingContentKeyIsForAirPlayKey")), "BOOLValue");
  v12 = objc_msgSend(a5, "objectForKey:", CFSTR("CSKRO_RemoteContext"));
  v42 = *MEMORY[0x1E0CA4D00];
  v13 = objc_msgSend(a5, "objectForKey:");
  v14 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("ServerChallenge"));
  +[AVContentKeyRequest _validateServerChallenge:](AVContentKeyRequest, "_validateServerChallenge:", v14);
  v15 = objc_msgSend(-[AVContentKeyRequest session](self, "session"), "setAppIdentifier:", a3);
  if (v15
    || (v15 = -[AVContentKeyReportGroup configureAppIdentifier:](self->_contentKeyRequest->reportGroup, "configureAppIdentifier:", a3)) != 0)
  {
LABEL_32:
    v38 = (void *)AVLocalizedErrorWithUnderlyingOSStatusAndUnderlyingError(v15, 0, v46, 1);
    v46 = v38;
    if (!v38)
      return v45;
    goto LABEL_33;
  }
  v44 = v12;
  v16 = a4;
  v17 = +[AVContentKeyRequest _mergePreloadingRequestOptions:withCreateKeyRequestOptions:](AVContentKeyRequest, "_mergePreloadingRequestOptions:withCreateKeyRequestOptions:", self->_contentKeyRequest->preloadingRequestOptions, a5);

  self->_contentKeyRequest->preloadingRequestOptions = (NSDictionary *)v17;
  if (!-[AVContentKeyRequest ensureCryptorWithFormatDescription:error:](self, "ensureCryptorWithFormatDescription:error:", objc_msgSend(a5, "objectForKey:", CFSTR("CreateDecryptorUsingFormatDescription")), &v46))goto LABEL_29;
  v43 = v11;
  v18 = v13;
  v19 = objc_msgSend(a5, "objectForKey:", CFSTR("RequiresValidationDataInSecureTokenKey"));
  if (v19 || (v19 = objc_msgSend(a5, "objectForKey:", CFSTR("RequiresExtendedValidationDataInSecureTokenKey"))) != 0)
  {
    v20 = a6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v40 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("AVContentKeyRequestRequiresExtendedValidationDataInSecureTokenKey value should be an object of NSData class"), v21, v22, v23, v24, v25, (uint64_t)a2), 0);
      objc_exception_throw(v40);
    }
    v26 = 4;
  }
  else
  {
    v20 = a6;
    v26 = 0;
  }
  if (objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("SupportsAirPlayDecryptionKey")), "BOOLValue"))v27 = 5;
  else
    v27 = v26;
  v28 = +[AVContentKeyRequest _createKeyRequestDictionaryForApp:persistentKey:serverChallenge:cryptorKeyRequestID:purpose:](AVContentKeyRequest, "_createKeyRequestDictionaryForApp:persistentKey:serverChallenge:cryptorKeyRequestID:purpose:", a3, v19, v14, self->_contentKeyRequest->cryptorKeyRequestID, v27);
  v29 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_contentKeyRequest->customURLRequestID);
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0CA4D20]);
  if (v16)
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CA4D18]);
  a6 = v20;
  if (v44)
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v44, *MEMORY[0x1E0CA4D58]);
  if (objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("StreamingContentKeyRequiresiTunesProvisioningKey")), "BOOLValue"))
  {
    v30 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0CA4D60]);
  }
  if (v43)
  {
    v31 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0CA4D28]);
  }
  if (v18)
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v18, v42);
  contentKeyRequest = self->_contentKeyRequest;
  if (contentKeyRequest->providesPersistableKey)
  {
    figCryptor = contentKeyRequest->figCryptor;
    v34 = *(uint64_t (**)(OpaqueFigCPECryptor *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 56);
    if (!v34)
    {
LABEL_31:
      v15 = -12782;
      goto LABEL_32;
    }
    v15 = v34(figCryptor, *MEMORY[0x1E0CA3238], *MEMORY[0x1E0C9AE50]);
    if (v15)
      goto LABEL_32;
    contentKeyRequest = self->_contentKeyRequest;
  }
  v35 = contentKeyRequest->figCryptor;
  v36 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
  if (*v36 < 4uLL)
    goto LABEL_31;
  v37 = (uint64_t (*)(OpaqueFigCPECryptor *, id, _QWORD, id *))v36[11];
  if (!v37)
    goto LABEL_31;
  v15 = v37(v35, v28, *MEMORY[0x1E0C9AE00], &v45);
  if (v15)
    goto LABEL_32;
  -[AVContentKeyReportGroup createProtectorSessionIdentifierIfNecessary](self->_contentKeyRequest->reportGroup, "createProtectorSessionIdentifierIfNecessary");
LABEL_29:
  v38 = v46;
  if (!v46)
    return v45;
LABEL_33:
  if (a6)
    *a6 = v38;

  return 0;
}

- (id)_makeStreamingContentKeyRequestDataForApp:(id)a3 contentIdentifier:(id)a4 options:(id)a5 error:(id *)a6
{
  void *v9;
  OpaqueFigContentKeyBoss *v10;
  signed int v11;
  unint64_t requestID;
  uint64_t (*v13)(OpaqueFigContentKeyBoss *, unint64_t, CFTypeRef, CFTypeRef *);
  signed int v14;
  void *v15;
  id result;
  CFTypeRef v17;
  CFTypeRef cf;

  v17 = 0;
  cf = 0;
  v9 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("HLSMethodKey"));
  +[AVContentKeyRequest _validateHLSEncryptionMethod:](AVContentKeyRequest, "_validateHLSEncryptionMethod:", v9);
  v10 = -[AVContentKeyRequest _copyContentKeyBoss](self, "_copyContentKeyBoss");
  if (v10)
  {
    objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("ProtocolVersionsKey"));
    if (!objc_msgSend(a5, "objectForKey:", CFSTR("RequiresValidationDataInSecureTokenKey")))
      objc_msgSend(a5, "objectForKey:", CFSTR("RequiresExtendedValidationDataInSecureTokenKey"));
    objc_msgSend(a5, "objectForKey:", CFSTR("CSKRO_RemoteContext"));
    objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("SupportsAirPlayDecryptionKey")), "BOOLValue");
    if (v9)
      objc_msgSend(v9, "isEqual:", CFSTR("ISO_23001_7"));
    v11 = FigContentKeyRequestDataParamsCreate();
    if (v11)
      goto LABEL_9;
    requestID = self->_contentKeyRequest->requestID;
    v13 = *(uint64_t (**)(OpaqueFigContentKeyBoss *, unint64_t, CFTypeRef, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
    if (v13)
    {
      v11 = v13(v10, requestID, cf, &v17);
LABEL_9:
      v14 = v11;
      v15 = 0;
      goto LABEL_11;
    }
    v15 = 0;
    v14 = -12782;
  }
  else
  {
    v15 = (void *)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11862, 0);
    v14 = 0;
  }
LABEL_11:
  if (cf)
    CFRelease(cf);
  if (v10)
    CFRelease(v10);
  if (v14)
    v15 = (void *)AVLocalizedErrorWithUnderlyingOSStatus(v14, 0);
  if (!v15)
    return (id)(id)v17;
  if (a6)
    *a6 = v15;
  result = (id)v17;
  if (v17)
  {
    CFRelease(v17);
    return 0;
  }
  return result;
}

- (void)makeStreamingContentKeyRequestDataForApp:(NSData *)appIdentifier contentIdentifier:(NSData *)contentIdentifier options:(NSDictionary *)options completionHandler:(void *)handler
{
  uint64_t v6;
  uint64_t v7;
  NSData *v13;
  uint64_t (*v14)(uint64_t);
  uint64_t *v15;
  NSObject *global_queue;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;

  if (!handler)
  {
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v19 = CFSTR("valid completionHandler is required");
    goto LABEL_11;
  }
  if (!appIdentifier)
  {
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v19 = CFSTR("valid appIdentifier is required");
LABEL_11:
    v20 = (void *)objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v19, (uint64_t)contentIdentifier, (uint64_t)options, (uint64_t)handler, v6, v7, v21), 0);
    objc_exception_throw(v20);
  }
  +[AVContentKeyRequest _validateProtocolVersionList:](AVContentKeyRequest, "_validateProtocolVersionList:", -[NSDictionary objectForKeyedSubscript:](options, "objectForKeyedSubscript:", CFSTR("ProtocolVersionsKey")));
  +[AVContentKeyRequest _validateHLSEncryptionMethod:](AVContentKeyRequest, "_validateHLSEncryptionMethod:", -[NSDictionary objectForKeyedSubscript:](options, "objectForKeyedSubscript:", CFSTR("HLSMethodKey")));
  MEMORY[0x194033BF8](self->_contentKeyRequest->stateMutex);
  if (contentIdentifier)
  {
    v13 = (NSData *)-[NSData copy](contentIdentifier, "copy");

    self->_contentKeyRequest->contentIdentifier = v13;
  }
  if (self->_contentKeyRequest->requestID)
  {
    v22 = MEMORY[0x1E0C809B0];
    v14 = __108__AVContentKeyRequest_makeStreamingContentKeyRequestDataForApp_contentIdentifier_options_completionHandler___block_invoke;
    v15 = &v22;
  }
  else
  {
    v21 = MEMORY[0x1E0C809B0];
    v14 = __108__AVContentKeyRequest_makeStreamingContentKeyRequestDataForApp_contentIdentifier_options_completionHandler___block_invoke_123;
    v15 = &v21;
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v15[1] = 3221225472;
  v15[2] = (uint64_t)v14;
  v15[3] = (uint64_t)&unk_1E3035A90;
  v15[4] = (uint64_t)self;
  v15[5] = (uint64_t)appIdentifier;
  v15[6] = (uint64_t)options;
  v15[7] = (uint64_t)contentIdentifier;
  v15[8] = (uint64_t)handler;
  dispatch_async(global_queue, v15);
  MEMORY[0x194033C04](self->_contentKeyRequest->stateMutex);
}

uint64_t __108__AVContentKeyRequest_makeStreamingContentKeyRequestDataForApp_contentIdentifier_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD v5[27];

  v5[26] = *MEMORY[0x1E0C80C00];
  v5[0] = 0;
  v2 = objc_msgSend(*(id *)(a1 + 32), "_makeStreamingContentKeyRequestDataForApp:contentIdentifier:options:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 176), *(_QWORD *)(a1 + 48), v5);
  if (dword_1EE2B0250)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v2);
}

uint64_t __108__AVContentKeyRequest_makeStreamingContentKeyRequestDataForApp_contentIdentifier_options_completionHandler___block_invoke_123(uint64_t a1)
{
  uint64_t v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v6 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "status") >= 4)
  {
    v7 = *MEMORY[0x1E0C9AFA8];
    v8[0] = CFSTR("content key request cancelled or already failed");
    v5 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11862, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
LABEL_8:
    v2 = 0;
    v6 = v5;
    return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v2);
  }
  if ((objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_keySystem"), "isEqualToString:", CFSTR("FairPlayStreaming")) & 1) == 0)
  {
    v5 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AVFoundationErrorDomain"), -11862, 0);
    goto LABEL_8;
  }
  v2 = objc_msgSend(*(id *)(a1 + 32), "contentKeyRequestDataForApp:contentIdentifier:options:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 176), *(_QWORD *)(a1 + 48), &v6);
  if (dword_1EE2B0250)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v2);
}

- (void)processContentKeyResponseData:(id)a3
{
  -[AVContentKeyRequest processContentKeyResponseData:renewalDate:error:](self, "processContentKeyResponseData:renewalDate:error:", a3, 0, 0);
}

- (BOOL)processContentKeyResponseData:(id)a3 renewalDate:(id)a4 error:(id *)a5
{
  OpaqueFigCPECryptor *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  OpaqueFigCPECryptor *v16;
  void *v17;
  BOOL result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  signed int v20;
  uint64_t (*v21)(OpaqueFigCPECryptor *, _QWORD, _QWORD);
  uint64_t (*v22)(OpaqueFigCPECryptor *, id, id);
  id v23;
  OpaqueFigCPECryptor *v24;
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  unsigned int (*v28)(OpaqueFigCPECryptor *, uint64_t, uint64_t, char *, _QWORD);
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  char v34[128];
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v10 = -[AVContentKeyRequest figCryptor](self, "figCryptor");
  if (!a3)
  {
    v29 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("valid responseData is required"), v11, v12, v13, v14, v15, v30), 0);
    objc_exception_throw(v29);
  }
  v16 = v10;
  if (-[AVContentKeyRequest status](self, "status") < AVContentKeyRequestStatusCancelled)
  {
    if (dword_1EE2B0250)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(-[AVContentKeyRequest session](self, "session", v30, v31), "_setContentKeyRequest:forCryptorUUID:cryptorKeyRequestID:", self, self->_contentKeyRequest->cryptorUUID, self->_contentKeyRequest->cryptorKeyRequestID);
    if (self->_contentKeyRequest->customURLHandler)
    {
      -[AVContentKeyRequest _finishLoadingCustomURLRequestWithResponseData:renewalDate:](self, "_finishLoadingCustomURLRequestWithResponseData:renewalDate:", a3, a4);
LABEL_10:
      v20 = 0;
      return v20 == 0;
    }
    v20 = objc_msgSend(-[AVContentKeyRequest _keySystem](self, "_keySystem"), "isEqualToString:", CFSTR("FairPlayStreaming"));
    if (!v20)
      return v20 == 0;
    v34[0] = 0;
    if (a4)
    {
      v32 = *MEMORY[0x1E0CA4D70];
      v33 = a4;
      a4 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    }
    if (self->_contentKeyRequest->providesPersistableKey)
    {
      v21 = *(uint64_t (**)(OpaqueFigCPECryptor *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                            + 56);
      if (v21)
      {
        v20 = v21(v16, *MEMORY[0x1E0CA3238], *MEMORY[0x1E0C9AE50]);
        if (v20)
          goto LABEL_29;
        v22 = *(uint64_t (**)(OpaqueFigCPECryptor *, id, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
        if (v22)
        {
          v23 = (id)*MEMORY[0x1E0CA31F0];
          v24 = v16;
          v25 = a3;
          goto LABEL_22;
        }
      }
    }
    else
    {
      v26 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
      if (*v26 >= 4uLL)
      {
        v22 = (uint64_t (*)(OpaqueFigCPECryptor *, id, id))v26[12];
        if (v22)
        {
          v24 = v16;
          v23 = a3;
          v25 = a4;
LABEL_22:
          v20 = v22(v24, v23, v25);
          if (!v20)
          {
            v27 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
            if (*v27 >= 6uLL)
            {
              v28 = (unsigned int (*)(OpaqueFigCPECryptor *, uint64_t, uint64_t, char *, _QWORD))v27[20];
              if (v28)
              {
                if (!v28(v16, 2, 3, v34, 0) && v34[0])
                  goto LABEL_10;
              }
            }
            v20 = FigSignalErrorAt();
          }
LABEL_29:
          if (a5 && v20)
          {
            *a5 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v20, 0);
            v20 = 1;
          }
          return v20 == 0;
        }
      }
    }
    v20 = -12782;
    goto LABEL_29;
  }
  if (!a5)
    return 0;
  v35 = *MEMORY[0x1E0C9AFA8];
  v36[0] = CFSTR("content key request cancelled or already failed");
  v17 = (void *)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11862, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1));
  result = 0;
  *a5 = v17;
  return result;
}

- (BOOL)_processContentKeyResponse:(id)a3 renewalDate:(id)a4 initializationVector:(id)a5 error:(id *)a6
{
  OpaqueFigContentKeyBoss *v8;
  OpaqueFigContentKeyBoss *v9;
  signed int v10;
  unint64_t v11;
  uint64_t (*v12)(OpaqueFigContentKeyBoss *, unint64_t, _QWORD);
  signed int v13;

  v8 = -[AVContentKeyRequest _copyContentKeyBoss](self, "_copyContentKeyBoss");
  if (v8)
  {
    v9 = v8;
    v10 = FigContentKeyResponseParamsCreate();
    if (!v10)
    {
      v11 = -[AVContentKeyRequest _requestID](self, "_requestID");
      v12 = *(uint64_t (**)(OpaqueFigContentKeyBoss *, unint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                          + 32);
      if (!v12)
      {
        v13 = -12782;
LABEL_7:
        CFRelease(v9);
        if (!a6)
          return v13 == 0;
        goto LABEL_8;
      }
      v10 = v12(v9, v11, 0);
    }
    v13 = v10;
    goto LABEL_7;
  }
  v13 = FigSignalErrorAt();
  if (!a6)
    return v13 == 0;
LABEL_8:
  if (v13)
    *a6 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v13, 0);
  return v13 == 0;
}

- (void)processContentKeyResponse:(AVContentKeyResponse *)keyResponse
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVContentKeyRequest *v25;
  NSObject *v26;
  OpaqueFigCPECryptor *figCryptor;
  Class isa;
  uint64_t (*v29)(OpaqueFigCPECryptor *, _QWORD, Class);
  signed int v30;
  AVContentKeyResponseInternal *v31;
  OpaqueFigCPECryptor *v32;
  uint64_t (*v33)(OpaqueFigCPECryptor *, _QWORD, AVContentKeyResponseInternal *);
  AVContentKeyRequestInternal *contentKeyRequest;
  void *v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v46 = 0;
  v6 = -[AVContentKeyRequest _keySystem](self, "_keySystem");
  if (!keyResponse)
  {
    v35 = (void *)MEMORY[0x1E0C99DA0];
    v36 = *MEMORY[0x1E0C99778];
    v37 = CFSTR("valid keyResponse is required");
    goto LABEL_61;
  }
  v12 = v6;
  if (!-[AVContentKeyRequest session](self, "session"))
  {
    v35 = (void *)MEMORY[0x1E0C99DA0];
    v36 = *MEMORY[0x1E0C99778];
    v38 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Bug in client of AVContentKeySession: this AVContentKeyRequest (%p) can no longer process key responses, as its managing AVContentKeySession was released"), v13, v14, v15, v16, v17, (uint64_t)self);
LABEL_62:
    v41 = v38;
    v42 = v35;
    v43 = v36;
LABEL_63:
    objc_exception_throw((id)objc_msgSend(v42, "exceptionWithName:reason:userInfo:", v43, v41, 0));
  }
  if ((objc_msgSend(-[AVContentKeyResponse keySystem](keyResponse, "keySystem"), "isEqualToString:", v12) & 1) == 0)
  {
    v35 = (void *)MEMORY[0x1E0C99DA0];
    v36 = *MEMORY[0x1E0C99778];
    v37 = CFSTR("AVContentKeySession's keySystem is not same as that of keyResponse");
    goto LABEL_61;
  }
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("FairPlayStreaming")) & 1) == 0
    && (objc_msgSend(v12, "isEqualToString:", CFSTR("ClearKeySystem")) & 1) == 0
    && (objc_msgSend(v12, "isEqualToString:", CFSTR("AuthorizationTokenSystem")) & 1) == 0)
  {
    v39 = (void *)MEMORY[0x1E0C99DA0];
    v40 = *MEMORY[0x1E0C99768];
    v41 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("%@ does not support this operation"), v18, v19, v20, v21, v22, (uint64_t)v12);
    v42 = v39;
    v43 = v40;
    goto LABEL_63;
  }
  if (-[AVContentKeyRequest status](self, "status") >= AVContentKeyRequestStatusCancelled)
  {
    v47 = *MEMORY[0x1E0C9AFA8];
    v48[0] = CFSTR("content key request cancelled or already failed");
    v23 = (void *)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11862, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1));
LABEL_41:
    -[AVContentKeyRequest _handleKeyResponseError:](self, "_handleKeyResponseError:", v23, v44);
    return;
  }
  if (objc_msgSend(-[AVContentKeyResponse keySystem](keyResponse, "keySystem"), "isEqualToString:", CFSTR("FairPlayStreaming")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (keyResponse[1].super.isa)
      {
        if (-[AVContentKeyRequest _requestID](self, "_requestID"))
        {
          if (dword_1EE2B0250)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          v25 = self;
LABEL_38:
          if (!-[AVContentKeyRequest _processContentKeyResponse:renewalDate:initializationVector:error:](v25, "_processContentKeyResponse:renewalDate:initializationVector:error:", v44, v45))goto LABEL_40;
          goto LABEL_39;
        }
        if (!-[AVContentKeyRequest ensureCryptorWithFormatDescription:error:](self, "ensureCryptorWithFormatDescription:error:", 0, &v46))goto LABEL_40;
        -[AVContentKeyRequest processContentKeyResponseData:renewalDate:error:](self, "processContentKeyResponseData:renewalDate:error:", keyResponse[1].super.isa, keyResponse[1]._keyResponse, 0);
        goto LABEL_39;
      }
      v35 = (void *)MEMORY[0x1E0C99DA0];
      v36 = *MEMORY[0x1E0C99778];
      v37 = CFSTR("valid FPS key response data is required");
    }
    else
    {
      v35 = (void *)MEMORY[0x1E0C99DA0];
      v36 = *MEMORY[0x1E0C99778];
      v37 = CFSTR("keyResponse should be an object of AVContentKeyResponseFairPlayStreaming class");
    }
    goto LABEL_61;
  }
  if (!objc_msgSend(-[AVContentKeyResponse keySystem](keyResponse, "keySystem"), "isEqualToString:", CFSTR("ClearKeySystem")))
  {
    if (!objc_msgSend(-[AVContentKeyResponse keySystem](keyResponse, "keySystem"), "isEqualToString:", CFSTR("AuthorizationTokenSystem")))goto LABEL_39;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (self->_contentKeyRequest->identifier && keyResponse[1].super.isa)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (dword_1EE2B0250)
          {
            v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          contentKeyRequest = self->_contentKeyRequest;
          if (contentKeyRequest->requestID)
          {
            v25 = self;
            goto LABEL_38;
          }
          if (-[AVContentKeyReportGroup _setAuthorizationToken:forIdentifier:error:](contentKeyRequest->reportGroup, "_setAuthorizationToken:forIdentifier:error:", keyResponse[1].super.isa, contentKeyRequest->identifier, &v46))
          {
LABEL_39:
            -[AVContentKeyRequest _setStatus:](self, "_setStatus:", 1, v44);
          }
LABEL_40:
          v23 = v46;
          if (!v46)
            return;
          goto LABEL_41;
        }
        v35 = (void *)MEMORY[0x1E0C99DA0];
        v36 = *MEMORY[0x1E0C99778];
        v37 = CFSTR("identifier should be an object of NSString class");
      }
      else
      {
        v35 = (void *)MEMORY[0x1E0C99DA0];
        v36 = *MEMORY[0x1E0C99778];
        v37 = CFSTR("identifier and authorizationTokenData must be valid");
      }
    }
    else
    {
      v35 = (void *)MEMORY[0x1E0C99DA0];
      v36 = *MEMORY[0x1E0C99778];
      v37 = CFSTR("keyResponse should be an object of AVContentKeyResponseAuthorizationToken class");
    }
LABEL_61:
    v38 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v37, v7, v8, v9, v10, v11, v44);
    goto LABEL_62;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v35 = (void *)MEMORY[0x1E0C99DA0];
    v36 = *MEMORY[0x1E0C99778];
    v37 = CFSTR("keyResponse should be an object of AVContentKeyResponseClearKey class");
    goto LABEL_61;
  }
  if (!keyResponse[1].super.isa)
  {
    v35 = (void *)MEMORY[0x1E0C99DA0];
    v36 = *MEMORY[0x1E0C99778];
    v37 = CFSTR("valid ClearKey key data is required");
    goto LABEL_61;
  }
  if (self->_contentKeyRequest->requestID)
  {
    v25 = self;
    goto LABEL_38;
  }
  if (!-[AVContentKeyRequest ensureCryptorWithFormatDescription:error:](self, "ensureCryptorWithFormatDescription:error:", 0, &v46))goto LABEL_40;
  figCryptor = self->_contentKeyRequest->figCryptor;
  isa = keyResponse[1].super.isa;
  v29 = *(uint64_t (**)(OpaqueFigCPECryptor *, _QWORD, Class))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (!v29)
    goto LABEL_43;
  v30 = v29(figCryptor, *MEMORY[0x1E0CA31D8], isa);
  if (v30)
    goto LABEL_44;
  v31 = keyResponse[1]._keyResponse;
  if (!v31)
    goto LABEL_35;
  v32 = self->_contentKeyRequest->figCryptor;
  v33 = *(uint64_t (**)(OpaqueFigCPECryptor *, _QWORD, AVContentKeyResponseInternal *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                                + 56);
  if (v33)
  {
    v30 = v33(v32, *MEMORY[0x1E0CA31C8], v31);
    if (!v30)
    {
LABEL_35:
      if (-[AVContentKeyRequest processContentKeyResponseData:renewalDate:error:](self, "processContentKeyResponseData:renewalDate:error:", keyResponse[1].super.isa, 0, &v46))
      {
        goto LABEL_39;
      }
      goto LABEL_40;
    }
  }
  else
  {
LABEL_43:
    v30 = -12782;
  }
LABEL_44:
  v23 = (void *)AVLocalizedErrorWithUnderlyingOSStatusAndUnderlyingError(v30, 0, v46, 1);
  v46 = v23;
  if (v23)
    goto LABEL_41;
}

- (void)_processContentKeyResponseError:(id)a3
{
  OpaqueFigContentKeyBoss *v5;
  OpaqueFigContentKeyBoss *v6;
  unint64_t requestID;
  void (*v8)(OpaqueFigContentKeyBoss *, unint64_t, id);

  v5 = -[AVContentKeyRequest _copyContentKeyBoss](self, "_copyContentKeyBoss");
  if (v5)
  {
    v6 = v5;
    requestID = self->_contentKeyRequest->requestID;
    v8 = *(void (**)(OpaqueFigContentKeyBoss *, unint64_t, id))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 40);
    if (v8)
      v8(v6, requestID, a3);
    CFRelease(v6);
  }
  else
  {
    FigSignalErrorAt();
  }
}

- (void)processContentKeyResponseError:(NSError *)error
{
  uint64_t v3;

  v3 = (uint64_t)error;
  if (!error)
    v3 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11800, 0);
  if (self->_contentKeyRequest->requestID)
    -[AVContentKeyRequest _processContentKeyResponseError:](self, "_processContentKeyResponseError:", v3);
  -[AVContentKeyRequest _setError:](self, "_setError:", v3);
}

- (void)renewExpiringContentKeyResponseData
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  if ((objc_msgSend(-[AVContentKeyRequest _keySystem](self, "_keySystem"), "isEqualToString:", CFSTR("FairPlayStreaming")) & 1) == 0)
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99778];
    v6 = -[AVContentKeyRequest _keySystem](self, "_keySystem");
    v12 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("%@ does not support key renewal"), v7, v8, v9, v10, v11, (uint64_t)v6), 0);
    objc_exception_throw(v12);
  }
  objc_msgSend(-[AVContentKeyRequest session](self, "session"), "renewExpiringResponseDataForContentKeyRequest:", self);
}

- (BOOL)_canRespondByRequestingPersistableContentKeyRequest
{
  AVContentKeyRequestInternal *contentKeyRequest;
  char v3;

  contentKeyRequest = self->_contentKeyRequest;
  if (contentKeyRequest->requestInfo)
  {
    FigCustomURLRequestInfoCopyAllowedUniversalTypeIdentifiers();
    v3 = objc_msgSend(0, "containsObject:", CFSTR("com.apple.streamingkeydelivery.persistentcontentkey"));
  }
  else
  {
    v3 = !contentKeyRequest->useContentKeyBoss || contentKeyRequest->supportsOfflineKey;
  }

  return v3;
}

- (BOOL)respondByRequestingPersistableContentKeyRequestAndReturnError:(NSError *)outError
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVContentKeyRequestInternal *contentKeyRequest;
  unint64_t requestID;
  BOOL v16;
  OpaqueFigCustomURLHandler *customURLHandler;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(-[AVContentKeyRequest _keySystem](self, "_keySystem"), "isEqualToString:", CFSTR("FairPlayStreaming")) & 1) == 0)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v28 = -[AVContentKeyRequest _keySystem](self, "_keySystem");
    v26 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("%@ does not support key persistence"), v21, v22, v23, v24, v25, (uint64_t)v28);
    goto LABEL_19;
  }
  v6 = -[AVContentKeyRequest session](self, "session");
  if (!v6)
    return 1;
  v7 = v6;
  if ((objc_msgSend(v6, "clientCanReceivePersistableContentKeyRequest") & 1) == 0)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99768];
    v26 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("client's delegate should respond to contentKeySession:didProvidePersistableContentKeyRequest: method in order to be able to request persistable content key request"), v8, v9, v10, v11, v12, v27);
LABEL_19:
    objc_exception_throw((id)objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, v26, 0));
  }
  if (dword_1EE2B0250)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (-[AVContentKeyRequest _canRespondByRequestingPersistableContentKeyRequest](self, "_canRespondByRequestingPersistableContentKeyRequest", v27, v29))
  {
    -[AVContentKeyRequest _setStatus:](self, "_setStatus:", 4);
    contentKeyRequest = self->_contentKeyRequest;
    requestID = contentKeyRequest->requestID;
    if (requestID)
    {
      objc_msgSend(v7, "issuePersistableContentKeyRequestForKeySpecifier:initializationData:keyIDFromInitializationData:contentIdentifier:requestID:preloadingRequestOptions:identifier:", contentKeyRequest->keySpecifier, contentKeyRequest->initializationData, contentKeyRequest->keyIDFromInitializationData, contentKeyRequest->contentIdentifier, requestID, contentKeyRequest->preloadingRequestOptions, contentKeyRequest->identifier);
      return 1;
    }
    customURLHandler = contentKeyRequest->customURLHandler;
    v16 = 1;
    if (customURLHandler)
      objc_msgSend(v7, "issueContentKeyRequestWithCustomURLHandler:identifier:requestInfo:requestID:providesPersistableKey:", customURLHandler, contentKeyRequest->identifier, contentKeyRequest->requestInfo, contentKeyRequest->customURLRequestID, 1);
    else
      objc_msgSend(v7, "issueContentKeyRequestWithPreloadingRequestOptions:identifier:initializationData:providesPersistableKey:", contentKeyRequest->preloadingRequestOptions, contentKeyRequest->identifier, contentKeyRequest->initializationData, 1);
  }
  else
  {
    v16 = 0;
    if (outError)
      *outError = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AVFoundationErrorDomain"), -11862, 0);
  }
  return v16;
}

- (void)respondByRequestingPersistableContentKeyRequest
{
  -[AVContentKeyRequest respondByRequestingPersistableContentKeyRequestAndReturnError:](self, "respondByRequestingPersistableContentKeyRequestAndReturnError:", 0);
}

- (void)_sendResponseInfoToCustomURLHandlerWithRenewalDate:(id)a3
{
  AVContentKeyRequestInternal *contentKeyRequest;
  OpaqueFigCustomURLHandler *customURLHandler;
  unint64_t customURLRequestID;
  void (*v7)(OpaqueFigCustomURLHandler *, unint64_t, _QWORD);

  if (!FigCustomURLResponseInfoCreateMutable()
    && !FigCustomURLResponseInfoSetUniversalTypeIdentifier()
    && !FigCustomURLResponseInfoSetContentRenewalDate())
  {
    contentKeyRequest = self->_contentKeyRequest;
    customURLRequestID = contentKeyRequest->customURLRequestID;
    customURLHandler = contentKeyRequest->customURLHandler;
    v7 = *(void (**)(OpaqueFigCustomURLHandler *, unint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                  + 16)
                                                                                      + 8);
    if (v7)
      v7(customURLHandler, customURLRequestID, 0);
  }
}

- (void)_finishLoadingCustomURLRequestWithResponseData:(id)a3 renewalDate:(id)a4
{
  AVContentKeyRequestInternal *contentKeyRequest;
  OpaqueFigCustomURLHandler *customURLHandler;
  unint64_t customURLRequestID;
  unsigned int (*v8)(OpaqueFigCustomURLHandler *, unint64_t, _QWORD);
  AVContentKeyRequestInternal *v9;
  OpaqueFigCustomURLHandler *v10;
  unint64_t v11;
  void (*v12)(OpaqueFigCustomURLHandler *, unint64_t, _QWORD, _QWORD);

  -[AVContentKeyRequest _sendResponseInfoToCustomURLHandlerWithRenewalDate:](self, "_sendResponseInfoToCustomURLHandlerWithRenewalDate:", a4);
  if (!FigCreateBlockBufferWithCFDataNoCopy())
  {
    contentKeyRequest = self->_contentKeyRequest;
    customURLRequestID = contentKeyRequest->customURLRequestID;
    customURLHandler = contentKeyRequest->customURLHandler;
    v8 = *(unsigned int (**)(OpaqueFigCustomURLHandler *, unint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                              + 16);
    if (v8)
    {
      if (!v8(customURLHandler, customURLRequestID, 0))
      {
        v9 = self->_contentKeyRequest;
        v11 = v9->customURLRequestID;
        v10 = v9->customURLHandler;
        v12 = *(void (**)(OpaqueFigCustomURLHandler *, unint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
        if (v12)
          v12(v10, v11, 0, 0);
      }
    }
  }
}

- (void)_finishLoadingCustomURLRequestWithError:(id)a3
{
  AVContentKeyRequestInternal *contentKeyRequest;
  OpaqueFigCustomURLHandler *customURLHandler;
  unint64_t customURLRequestID;
  void (*v8)(OpaqueFigCustomURLHandler *, unint64_t, id, _QWORD);

  -[AVContentKeyRequest _sendResponseInfoToCustomURLHandlerWithRenewalDate:](self, "_sendResponseInfoToCustomURLHandlerWithRenewalDate:", 0);
  contentKeyRequest = self->_contentKeyRequest;
  customURLRequestID = contentKeyRequest->customURLRequestID;
  customURLHandler = contentKeyRequest->customURLHandler;
  v8 = *(void (**)(OpaqueFigCustomURLHandler *, unint64_t, id, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                        + 24);
  if (v8)
    v8(customURLHandler, customURLRequestID, a3, 0);
}

- (BOOL)willOutputBeObscuredDueToInsufficientExternalProtectionForDisplays:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AVContentKeyRequestInternal *contentKeyRequest;
  OpaqueFigContentKeyBoss *v10;
  OpaqueFigContentKeyBoss *v11;
  OpaqueFigContentKeySpecifier *keySpecifier;
  _QWORD *v13;
  void (*v14)(OpaqueFigContentKeyBoss *, OpaqueFigContentKeySpecifier *, int *);
  int v15;
  OpaqueFigCPECryptor *figCryptor;
  void *v19;
  uint64_t v20;
  int v21;

  v21 = 1;
  if (!a3)
  {
    v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("displays is nil"), v3, v4, v5, v6, v7, v20), 0);
    objc_exception_throw(v19);
  }
  contentKeyRequest = self->_contentKeyRequest;
  if (!contentKeyRequest->hasAnyKeyRequestSucceeded)
    goto LABEL_12;
  if (!contentKeyRequest->useContentKeyBoss)
  {
    figCryptor = contentKeyRequest->figCryptor;
    if (figCryptor)
    {
      v15 = -[AVContentKeyReportGroup externalProtectionStatusForCryptor:withDisplays:](contentKeyRequest->reportGroup, "externalProtectionStatusForCryptor:withDisplays:", figCryptor, a3);
      return v15 != 2;
    }
LABEL_12:
    FigSignalErrorAt();
    v15 = 1;
    return v15 != 2;
  }
  v10 = -[AVContentKeyRequest _copyContentKeyBoss](self, "_copyContentKeyBoss");
  if (!v10)
    goto LABEL_12;
  v11 = v10;
  keySpecifier = self->_contentKeyRequest->keySpecifier;
  v13 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
  v14 = (void (*)(OpaqueFigContentKeyBoss *, OpaqueFigContentKeySpecifier *, int *))v13[14];
  if (v14 && *v13 >= 3uLL)
    v14(v11, keySpecifier, &v21);
  CFRelease(v11);
  v15 = v21;
  return v15 != 2;
}

- (int64_t)externalContentProtectionStatus
{
  AVContentKeyRequestInternal *contentKeyRequest;
  OpaqueFigContentKeyBoss *v4;
  OpaqueFigContentKeyBoss *v5;
  OpaqueFigContentKeySpecifier *keySpecifier;
  _QWORD *v7;
  unsigned int (*v8)(OpaqueFigContentKeyBoss *, OpaqueFigContentKeySpecifier *, int *);
  int64_t v9;
  OpaqueFigCPECryptor *figCryptor;
  int v11;
  int v13;

  v13 = 1;
  contentKeyRequest = self->_contentKeyRequest;
  if (!contentKeyRequest->hasAnyKeyRequestSucceeded)
    goto LABEL_17;
  if (!contentKeyRequest->useContentKeyBoss)
  {
    figCryptor = contentKeyRequest->figCryptor;
    if (figCryptor)
    {
      v11 = -[AVContentKeyReportGroup externalProtectionStatusForCryptor:withDisplays:](contentKeyRequest->reportGroup, "externalProtectionStatusForCryptor:withDisplays:", figCryptor, MEMORY[0x1E0C9AA60]);
      if (v11 == 2)
        return 1;
      else
        return 2 * (v11 == 3);
    }
LABEL_17:
    FigSignalErrorAt();
    return 0;
  }
  v4 = -[AVContentKeyRequest _copyContentKeyBoss](self, "_copyContentKeyBoss");
  if (!v4)
    goto LABEL_17;
  v5 = v4;
  keySpecifier = self->_contentKeyRequest->keySpecifier;
  v7 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
  v8 = (unsigned int (*)(OpaqueFigContentKeyBoss *, OpaqueFigContentKeySpecifier *, int *))v7[14];
  if (!v8 || *v7 < 3uLL || v8(v5, keySpecifier, &v13))
  {
    v9 = 0;
  }
  else if (v13 == 2)
  {
    v9 = 1;
  }
  else
  {
    v9 = 2 * (v13 == 3);
  }
  CFRelease(v5);
  return v9;
}

- (BOOL)setReportGroup:(id)a3
{
  AVContentKeyRequestInternal *contentKeyRequest;
  OpaqueFigCPECryptor *figCryptor;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  MEMORY[0x194033BF8](self->_contentKeyRequest->stateMutex, a2);
  contentKeyRequest = self->_contentKeyRequest;
  figCryptor = contentKeyRequest->figCryptor;
  if (!figCryptor)
  {

    self->_contentKeyRequest->reportGroup = (AVContentKeyReportGroup *)a3;
  }
  if (dword_1EE2B0250)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  MEMORY[0x194033C04](self->_contentKeyRequest->stateMutex);
  return figCryptor == 0;
}

@end
