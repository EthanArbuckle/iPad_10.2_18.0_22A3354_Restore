@implementation CONNECTION_SessionTask

- (id)session
{
  return self->_session_ivar;
}

- (id)_loggableDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Task <%@>.<0>"), self->_uniqueIdentifier);
}

- (id)_effectiveConfiguration
{
  return self->_effectiveConfiguration;
}

- (void)set_protocolForTask:(id)a3
{
  self->_my_protocolForTask = (Class)a3;
}

- (id)_private_nw_activity
{
  return 0;
}

- (unint64_t)_cachePolicy
{
  return *(_QWORD *)(-[_CFURLRequest _inner](self->_currentRequest, "_inner") + 16);
}

- (id)currentRequest
{
  id result;

  result = self->_nsCurrentRequest;
  if (!result)
  {
    result = -[NSURLRequest _initWithCFURLRequest:]([NSMutableURLRequest alloc], "_initWithCFURLRequest:", self->_currentRequest);
    self->_nsCurrentRequest = (NSMutableURLRequest *)result;
  }
  return result;
}

- (unint64_t)_expectedProgressTarget
{
  return 0;
}

- (double)_timeoutInterval
{
  return *(double *)(-[_CFURLRequest _inner](self->_currentRequest, "_inner") + 24);
}

- (BOOL)_preventsAppSSO
{
  return self->_preventsAppSSO;
}

- (const)_TCPConnectionMetadata
{
  return 0;
}

- (const)_DuetActivityProperties
{
  return 0;
}

- (void)updateCurrentRequest:(id)a3
{
  _CFURLRequest *currentRequest;
  _CFURLRequest *v6;

  currentRequest = self->_currentRequest;
  if (currentRequest)
    CFRelease(currentRequest);
  if (a3)
    v6 = (_CFURLRequest *)CFRetain(a3);
  else
    v6 = 0;
  self->_currentRequest = v6;

  self->_nsCurrentRequest = 0;
}

- (id)taskIdentifier
{
  return 0;
}

- (double)startTime
{
  return self->_startTime;
}

- (BOOL)shouldHandleCookiesAndSchemeIsAppropriate
{
  return (*(_WORD *)(-[_CFURLRequest _inner](self->_currentRequest, "_inner") + 64) & 1) != 0
      && URLCanUseCookies(*(const __CFURL **)(-[_CFURLRequest _inner](self->_currentRequest, "_inner") + 8));
}

- (id)resumableUploadState
{
  return 0;
}

- (float)priority
{
  return 0.5;
}

- (BOOL)prefersIncrementalDelivery
{
  return 1;
}

- (id)originalRequest
{
  id result;

  result = self->_nsOriginalRequest;
  if (!result)
  {
    result = -[NSURLRequest _initWithCFURLRequest:]([NSURLRequest alloc], "_initWithCFURLRequest:", self->_originalRequest);
    self->_nsOriginalRequest = (NSURLRequest *)result;
  }
  return result;
}

- (CONNECTION_SessionTask)initWithRequest:(_CFURLRequest *)a3 mutableCurrent:(_CFURLRequest *)a4 connProps:(__CFDictionary *)a5 sockProps:(__CFDictionary *)a6 session:(id)a7
{
  CONNECTION_SessionTask *v12;
  _CFURLRequest *v13;
  _CFURLRequest *v14;
  const __CFDictionary *v15;
  const __CFBoolean *Value;
  const __CFBoolean *v17;
  CFTypeID v18;
  double v19;
  __CFDictionary *v20;
  NSURLSession *v21;
  NSURLSessionConfiguration *local_immutable_configuration_ivar;
  NSURLSession *session_ivar;
  NSURLSessionConfiguration *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CONNECTION_SessionTask;
  v12 = -[CONNECTION_SessionTask init](&v26, sel_init);
  if (v12)
  {
    if (a3)
      v13 = (_CFURLRequest *)CFRetain(a3);
    else
      v13 = 0;
    v12->_originalRequest = v13;
    if (a4)
      v14 = (_CFURLRequest *)CFRetain(a4);
    else
      v14 = 0;
    v12->_currentRequest = v14;
    if (a6)
    {
      v15 = (const __CFDictionary *)CFRetain(a6);
      v12->_socketProperties = v15;
      if (v15)
      {
        Value = (const __CFBoolean *)CFDictionaryGetValue(v15, &unk_1EDCFA790);
        if (Value)
        {
          v17 = Value;
          v18 = CFGetTypeID(Value);
          if (v18 == CFBooleanGetTypeID())
          {
            if (CFBooleanGetValue(v17))
              v12->_preventsAppSSO = 1;
          }
        }
      }
    }
    else
    {
      v12->_socketProperties = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v12->_startTime = v19;
    if (a5)
    {
      v20 = (__CFDictionary *)CFRetain(a5);
      v12->_connectionProperties = v20;
      if (v20)
        -[CONNECTION_SessionTask _processConnectionProperties](v12, "_processConnectionProperties");
    }
    else
    {
      v12->_connectionProperties = 0;
    }
    v21 = (NSURLSession *)a7;
    v12->_session_ivar = v21;
    if (v21)
      local_immutable_configuration_ivar = v21->_local_immutable_configuration_ivar;
    else
      local_immutable_configuration_ivar = 0;
    v12->_effectiveConfiguration = local_immutable_configuration_ivar;
    v12->_uniqueIdentifier = (NSUUID *)(id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    if (!v12->_atsStateCache)
    {
      session_ivar = v12->_session_ivar;
      if (session_ivar)
        v24 = session_ivar->_local_immutable_configuration_ivar;
      else
        v24 = 0;
      v12->_atsStateCache = createDictionaryFromData((const __CFData *)-[NSURLSessionConfiguration _atsContext](v24, "_atsContext"));
    }
    v12->_metrics = (__CFN_TaskMetrics *)-[__CFN_TaskMetrics initWithTask:]((char *)[__CFN_TaskMetrics alloc], v12);
  }
  return v12;
}

- (__CFURL)currentRequest_mainDocumentURL
{
  return *(__CFURL **)(-[_CFURLRequest _inner](self->_currentRequest, "_inner") + 32);
}

- (__CFURL)currentRequest_URL
{
  return *(__CFURL **)(-[_CFURLRequest _inner](self->_currentRequest, "_inner") + 8);
}

- (void)_withXURLCache:(id)a3
{
  const void *v5;
  os_unfair_lock_s *v6;
  os_unfair_lock_s *v7;
  XURLCache *v8;
  NSURLSession *v9;
  CFXURLCache *CFXURLCache;
  CFXURLCache *v11;

  v5 = *(const void **)(-[_CFURLRequest _inner](self->_currentRequest, "_inner") + 224);
  if (!v5)
    goto LABEL_9;
  v6 = (os_unfair_lock_s *)CFRetain(v5);
  if (!v6)
    goto LABEL_9;
  v7 = v6;
  if (StorageSession::Class(void)::sOnce_StorageSession != -1)
    dispatch_once(&StorageSession::Class(void)::sOnce_StorageSession, &__block_literal_global_16297);
  v8 = (XURLCache *)StorageSession::copyCacheStorage(v7 + 4);
  CFRelease(v7);
  if (v8)
  {
    CFXURLCache = XURLCache::createCFXURLCache(v8, self->_session_ivar, v9);
    if (CFXURLCache)
    {
      v11 = CFXURLCache;
      (*((void (**)(id, CFXURLCache *))a3 + 2))(a3, CFXURLCache);
      (*(void (**)(CFXURLCache *))(*(_QWORD *)v11 + 8))(v11);
    }
    CFRelease(v8);
  }
  else
  {
LABEL_9:
    -[__NSURLSessionLocal _withXURLCache:]((id *)&self->_session_ivar->super.isa, (uint64_t)a3);
  }
}

- (id)_uniqueIdentifier
{
  return (id)-[NSUUID copy](self->_uniqueIdentifier, "copy");
}

- (int64_t)_suspensionThreshhold
{
  __CFDictionary *connectionProperties;
  void *Value;

  connectionProperties = self->_connectionProperties;
  if (connectionProperties
    && (Value = (void *)CFDictionaryGetValue(connectionProperties, CFSTR("kCFURLConnectionSuspensionThreshold"))) != 0)
  {
    return objc_msgSend(Value, "longLongValue");
  }
  else
  {
    return 0x200000;
  }
}

- (unsigned)_strictContentLength
{
  const __CFDictionary *connectionProperties;

  connectionProperties = self->_connectionProperties;
  if (connectionProperties)
    connectionProperties = (const __CFDictionary *)CFDictionaryGetValue(connectionProperties, &unk_1EDCFED90);
  return !connectionProperties || connectionProperties == (const __CFDictionary *)*MEMORY[0x1E0C9AE50];
}

- (id)_storagePartitionIdentifier
{
  void *v3;

  v3 = (void *)objc_msgSend((id)-[objc_class propertyForKey:inRequest:](self->_my_protocolForTask, "propertyForKey:inRequest:", CFSTR("__STORAGE_PARTITION_IDENTIFIER"), -[CONNECTION_SessionTask originalRequest](self, "originalRequest")), "copy");
  if (!v3)
  {
    v3 = _CFURLRequestCopyProtocolPropertyForKey(self->_originalRequest, CFSTR("__STORAGE_PARTITION_IDENTIFIER"));
    if (v3)
      v3 = (void *)CFMakeCollectable(v3);
  }
  return v3;
}

- (__CFDictionary)_sslSettings
{
  return *(__CFDictionary **)(-[_CFURLRequest _inner](self->_currentRequest, "_inner") + 72);
}

- (id)_siteForCookies
{
  return _CFURLRequestCopyProtocolPropertyForKey(self->_currentRequest, CFSTR("_kCFHTTPCookiePolicyPropertySiteForCookies"));
}

- (unsigned)_shouldUsePipelineHeuristics
{
  uint64_t v2;

  v2 = *(_QWORD *)(-[_CFURLRequest _inner](self->_currentRequest, "_inner") + 56);
  return v2 && *(_BYTE *)(v2 + 217) != 0;
}

- (unsigned)_shouldSkipPipelineProbe
{
  uint64_t v2;

  v2 = *(_QWORD *)(-[_CFURLRequest _inner](self->_currentRequest, "_inner") + 56);
  return v2 && *(_BYTE *)(v2 + 219) != 0;
}

- (unsigned)_shouldPipelineHTTP
{
  uint64_t v2;
  const __CFString *v3;
  const __CFString *v4;
  unsigned __int8 result;
  uint8_t v6[16];

  v2 = *(_QWORD *)(-[_CFURLRequest _inner](self->_currentRequest, "_inner") + 56);
  if (!v2 || !*(_BYTE *)(v2 + 216))
    return 0;
  v3 = *(const __CFString **)(v2 + 152);
  result = v3
        && (CFStringCompare(v3, (CFStringRef)&gConstantCFStringValueTable[2590], 0) == kCFCompareEqualTo
         || ((v4 = *(const __CFString **)(v2 + 152)) != 0
          || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT)
          && (*(_WORD *)v6 = 0,
              _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "these should always be initialized now", v6, 2u), (v4 = *(const __CFString **)(v2 + 152)) != 0))&& CFStringCompare(v4, (CFStringRef)&gConstantCFStringValueTable[2597], 0) == kCFCompareEqualTo)|| *(_BYTE *)(v2 + 218) != 0;
  return result;
}

- (void)_setConnectionIsCellular:(BOOL)a3
{
  self->_is_cellular = a3;
}

- (BOOL)_requiresSecureHTTPSProxyConnection
{
  return 0;
}

- (int64_t)_requestPriority
{
  return *(_QWORD *)(-[_CFURLRequest _inner](self->_currentRequest, "_inner") + 88);
}

- (__CFDictionary)_proxySettings
{
  return *(__CFDictionary **)(-[_CFURLRequest _inner](self->_currentRequest, "_inner") + 48);
}

- (id)_protocolForTask
{
  return self->_my_protocolForTask;
}

- (BOOL)_preconnect
{
  return 0;
}

- (__CFN_TaskMetrics)_metrics
{
  return self->_metrics;
}

- (BOOL)_isAVAssetTask
{
  return 0;
}

- (id)_httpConnectionInfoCompletionBlock
{
  return 0;
}

- (__CFSet)_getAuthenticatorStatusCodes
{
  return 0;
}

- (__CFDictionary)_dependencyInfo
{
  return 0;
}

- (const)_createXCredentialStorage
{
  const void *v3;
  char *v4;
  char *v5;
  XCredentialStorage *v6;
  _CFURLCredentialStorage *v7;
  char *CFXCredentialStorage;

  v3 = *(const void **)(-[_CFURLRequest _inner](self->_currentRequest, "_inner") + 224);
  if (!v3)
    return (const XCredentialStorage *)-[__NSURLSessionLocal _createXCredentialStorage]((uint64_t)self->_session_ivar);
  v4 = (char *)CFRetain(v3);
  if (!v4)
    return (const XCredentialStorage *)-[__NSURLSessionLocal _createXCredentialStorage]((uint64_t)self->_session_ivar);
  v5 = v4;
  if (StorageSession::Class(void)::sOnce_StorageSession != -1)
    dispatch_once(&StorageSession::Class(void)::sOnce_StorageSession, &__block_literal_global_16297);
  v6 = (XCredentialStorage *)StorageSession::copyCredStorage((StorageSession *)(v5 + 16));
  CFRelease(v5);
  if (!v6)
    return (const XCredentialStorage *)-[__NSURLSessionLocal _createXCredentialStorage]((uint64_t)self->_session_ivar);
  CFXCredentialStorage = XCredentialStorage::createCFXCredentialStorage(v6, v7);
  CFRelease(v6);
  return (const XCredentialStorage *)CFXCredentialStorage;
}

- (const)_createXCookieStorage
{
  uint64_t v3;
  void *v4;
  const void *v5;
  os_unfair_lock_s *v6;
  os_unfair_lock_s *v7;
  XCookieStorage *v8;

  v3 = *(_QWORD *)(-[_CFURLRequest _inner](self->_currentRequest, "_inner") + 56);
  if (v3)
  {
    v4 = *(void **)(v3 + 192);
    if (v4)
    {
      CFRetain(*(CFTypeRef *)(v3 + 192));
LABEL_9:
      v8 = (XCookieStorage *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 40, 0);
      *(_OWORD *)&v8->var0 = 0u;
      *(_OWORD *)&v8->var2 = 0u;
      v8[1].var1 = 0;
      CFXCookieStorage::CFXCookieStorage((CFXCookieStorage *)v8, v4);
      CFRelease(v4);
      return v8;
    }
  }
  v5 = *(const void **)(-[_CFURLRequest _inner](self->_currentRequest, "_inner") + 224);
  if (v5)
  {
    v6 = (os_unfair_lock_s *)CFRetain(v5);
    if (v6)
    {
      v7 = v6;
      if (StorageSession::Class(void)::sOnce_StorageSession != -1)
        dispatch_once(&StorageSession::Class(void)::sOnce_StorageSession, &__block_literal_global_16297);
      v4 = (void *)StorageSession::copyCookieStorage(v7 + 4);
      CFRelease(v7);
      if (v4)
        goto LABEL_9;
    }
  }
  return (const XCookieStorage *)-[__NSURLSessionLocal _createXCookieStorage]((uint64_t)self->_session_ivar);
}

- (__CFDictionary)_copySocketStreamProperties
{
  __CFDictionary *result;

  result = self->_socketProperties;
  if (result)
    return (__CFDictionary *)CFRetain(result);
  return result;
}

- (_CFHSTSPolicy)_copyHSTSPolicy
{
  const void *v3;
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  _CFHSTSPolicy *v6;
  NSURLSession *session_ivar;

  v3 = *(const void **)(-[_CFURLRequest _inner](self->_currentRequest, "_inner") + 224);
  if (v3)
  {
    v4 = (os_unfair_lock_s *)CFRetain(v3);
    if (v4)
    {
      v5 = v4;
      if (StorageSession::Class(void)::sOnce_StorageSession != -1)
        dispatch_once(&StorageSession::Class(void)::sOnce_StorageSession, &__block_literal_global_16297);
      v6 = (_CFHSTSPolicy *)StorageSession::copyHSTSStorage(v5 + 4);
      CFRelease(v5);
      if (v6)
        return v6;
    }
  }
  session_ivar = self->_session_ivar;
  if (!session_ivar)
    return 0;
  return -[NSURLSessionConfiguration copyHSTSPolicy](session_ivar->_local_immutable_configuration_ivar, "copyHSTSPolicy");
}

- (__CFDictionary)_copyATSState
{
  __CFDictionary *result;

  result = self->_atsStateCache;
  if (result)
    return (__CFDictionary *)CFRetain(result);
  return result;
}

- (int)_cookieAcceptPolicy
{
  const XCookieStorage *v2;
  const XCookieStorage *v3;
  int v4;

  v2 = -[CONNECTION_SessionTask _createXCookieStorage](self, "_createXCookieStorage");
  if (!v2)
    return 3;
  v3 = v2;
  v4 = (*((uint64_t (**)(const XCookieStorage *))v2->var0 + 12))(v2);
  (*((void (**)(const XCookieStorage *))v3->var0 + 6))(v3);
  return v4;
}

- (int64_t)_bytesPerSecondLimit
{
  return 0;
}

- (id)_backtrace
{
  return 0;
}

- (id)_assumesHTTP3Capable
{
  return 0;
}

- (unint64_t)_allowedProtocolTypes
{
  return *(_QWORD *)(-[_CFURLRequest _inner](self->_currentRequest, "_inner") + 96);
}

- (id)_APSRelayTopic
{
  return 0;
}

- (void)dealloc
{
  __CFDictionary *atsStateCache;
  _CFURLRequest *originalRequest;
  _CFURLRequest *currentRequest;
  __CFDictionary *socketProperties;
  __CFDictionary *connectionProperties;
  NSMutableURLRequest *nsCurrentRequest;
  NSURLRequest *nsOriginalRequest;
  NSURLSession *session_ivar;
  NSURLSessionConfiguration *effectiveConfiguration;
  NSUUID *uniqueIdentifier;
  objc_super v13;

  atsStateCache = self->_atsStateCache;
  self->_atsStateCache = 0;
  if (atsStateCache)
    CFRelease(atsStateCache);
  originalRequest = self->_originalRequest;
  if (originalRequest)
    CFRelease(originalRequest);
  currentRequest = self->_currentRequest;
  if (currentRequest)
    CFRelease(currentRequest);
  socketProperties = self->_socketProperties;
  if (socketProperties)
    CFRelease(socketProperties);
  connectionProperties = self->_connectionProperties;
  if (connectionProperties)
    CFRelease(connectionProperties);
  nsCurrentRequest = self->_nsCurrentRequest;
  if (nsCurrentRequest)
  {

    self->_nsCurrentRequest = 0;
  }
  nsOriginalRequest = self->_nsOriginalRequest;
  if (nsOriginalRequest)
  {

    self->_nsOriginalRequest = 0;
  }
  session_ivar = self->_session_ivar;
  if (session_ivar)
  {

    self->_session_ivar = 0;
  }
  effectiveConfiguration = self->_effectiveConfiguration;
  if (effectiveConfiguration)
  {

    self->_effectiveConfiguration = 0;
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
  {

    self->_uniqueIdentifier = 0;
  }
  -[CONNECTION_SessionTask set_metrics:](self, "set_metrics:", 0);
  v13.receiver = self;
  v13.super_class = (Class)CONNECTION_SessionTask;
  -[CONNECTION_SessionTask dealloc](&v13, sel_dealloc);
}

- (void)_adoptEffectiveConfiguration:(id)a3
{
  NSURLSessionConfiguration *effectiveConfiguration;
  NSURLSessionConfiguration *v6;

  effectiveConfiguration = self->_effectiveConfiguration;
  if (effectiveConfiguration != a3)
  {
    v6 = effectiveConfiguration;
    self->_effectiveConfiguration = (NSURLSessionConfiguration *)objc_msgSend(a3, "copy");
  }
}

- (void)_processConnectionProperties
{
  const __CFBoolean *Value;
  const __CFNumber *v4;
  __CFN_TaskMetrics *metrics;
  __CFDictionary *atsStateCache;
  const __CFData *v7;
  uint64_t valuePtr;

  Value = (const __CFBoolean *)CFDictionaryGetValue(self->_connectionProperties, &unk_1EDCFE6C8);
  if (Value && CFBooleanGetValue(Value))
    self->__shouldSkipPreferredClientCertificateLookup = 1;
  v4 = (const __CFNumber *)CFDictionaryGetValue(self->_connectionProperties, &unk_1EDCFE738);
  if (v4)
  {
    valuePtr = 0;
    CFNumberGetValue(v4, kCFNumberSInt64Type, &valuePtr);
    metrics = self->_metrics;
    if (metrics)
      metrics->_options |= valuePtr;
  }
  atsStateCache = self->_atsStateCache;
  self->_atsStateCache = 0;
  if (atsStateCache)
    CFRelease(atsStateCache);
  v7 = (const __CFData *)CFDictionaryGetValue(self->_connectionProperties, &unk_1EDCFE5E8);
  self->_atsStateCache = createDictionaryFromData(v7);
}

- (id)workQueue
{
  NSURLSession *session_ivar;

  session_ivar = self->_session_ivar;
  if (session_ivar)
    return session_ivar->_workQueue;
  else
    return 0;
}

- (id)countOfBytesReceived
{
  return 0;
}

- (id)_countOfPendingBytesReceivedEncoded
{
  return 0;
}

- (id)_countOfBytesReceivedEncoded
{
  return 0;
}

- (id)countOfBytesSent
{
  return 0;
}

- (id)countOfBytesExpectedToSend
{
  return 0;
}

- (id)countOfBytesExpectedToReceive
{
  return 0;
}

- (id)state
{
  return 0;
}

- (id)error
{
  return 0;
}

- (id)_priorityValue
{
  return 0;
}

- (id)_connectionPropertyDuet
{
  return 0;
}

- (BOOL)hasExtractor
{
  return 0;
}

- (id)_backgroundTransactionMetrics
{
  return 0;
}

- (id)_cfHSTS
{
  return 0;
}

- (id)_cfCache
{
  return 0;
}

- (id)_cfCreds
{
  return 0;
}

- (id)_cfCookies
{
  return 0;
}

- (id)_shouldHandleCookies
{
  return 0;
}

- (id)_allowsCellular
{
  return 0;
}

- (id)_networkServiceType
{
  return 0;
}

- (id)_prohibitAuthUI
{
  return 0;
}

- (id)_boundInterfaceIdentifier
{
  return 0;
}

- (id)_disallowCellular
{
  return 0;
}

- (id)_allowsExpensiveOverride
{
  return 0;
}

- (id)_allowsConstrainedOverride
{
  return 0;
}

- (id)_allowsUCAOverride
{
  return 0;
}

- (id)_allowsCellularOverride
{
  return 0;
}

- (id)_allowsPersistentDNS
{
  return 0;
}

- (id)_timeWindowDelay
{
  return 0;
}

- (id)_timeWindowDuration
{
  return 0;
}

- (id)_attribution
{
  return 0;
}

- (id)_isKnownTracker
{
  return 0;
}

- (id)_trackerContext
{
  return 0;
}

- (id)_privacyProxyFailClosed
{
  return 0;
}

- (id)_privacyProxyFailClosedForUnreachableNonMainHosts
{
  return 0;
}

- (id)_privacyProxyFailClosedForUnreachableHosts
{
  return 0;
}

- (id)_prohibitPrivacyProxy
{
  return 0;
}

- (id)_useEnhancedPrivacyMode
{
  return 0;
}

- (id)_blockTrackers
{
  return 0;
}

- (id)_failInsecureLoadWithHTTPSDNSRecord
{
  return 0;
}

- (id)_isWebSearchContent
{
  return 0;
}

- (unsigned)_preventsIdleSystemSleep
{
  return (*(unsigned __int8 *)(-[_CFURLRequest _inner](self->_currentRequest, "_inner") + 64) >> 4) & 1;
}

- (unsigned)_proxyHandshakePending
{
  return 0;
}

- (BOOL)_shouldSkipPreferredClientCertificateLookup
{
  return self->__shouldSkipPreferredClientCertificateLookup;
}

- (BOOL)_cacheOnly
{
  return 0;
}

- (BOOL)_preventsSystemHTTPProxyAuthentication
{
  return 0;
}

- (void)set_preventsAppSSO:(BOOL)a3
{
  self->_preventsAppSSO = a3;
}

- (BOOL)_appSSOFallback
{
  return self->_appSSOFallback;
}

- (void)set_appSSOFallback:(BOOL)a3
{
  self->_appSSOFallback = a3;
}

- (BOOL)_appleIDContextRedirect
{
  return 0;
}

- (void)_getAuthenticationHeadersForResponse:(_CFURLResponse *)a3 completionHandler:(id)a4
{
  (*((void (**)(id, uint64_t, _QWORD, _QWORD))a4 + 2))(a4, 1, 0, 0);
}

- (unsigned)_TLSNegotiatedCipherSuite
{
  return 0;
}

- (id)_trailers
{
  return 0;
}

- (unsigned)_TLSMinimumSupportedProtocolVersion
{
  return 0;
}

- (unsigned)_TLSMaximumSupportedProtocolVersion
{
  return 0;
}

- (BOOL)_allowsQUIC
{
  return 0;
}

- (int64_t)_discretionaryOverrride
{
  return 0;
}

- (id)_incompleteTaskMetrics
{
  return 0;
}

- (id)_incompleteCurrentTaskTransactionMetrics
{
  return 0;
}

- (id)_hostOverride
{
  return 0;
}

- (BOOL)_isTopLevelNavigation
{
  return -[__CFURL BOOLValue](_CFURLRequestCopyProtocolPropertyForKey(self->_originalRequest, CFSTR("_kCFHTTPCookiePolicyPropertyIsTopLevelNavigation")), "BOOLValue");
}

- (BOOL)_connectionIsCompanionLink
{
  return 0;
}

- (id)_resolvedCNAMEChain
{
  return 0;
}

- (id)_cookieTransformCallback
{
  return 0;
}

- (int)_requiresDNSSECValidation
{
  return 0;
}

- (void)set_metrics:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

@end
