@implementation NSURLSessionTask

void __52__NSURLSessionTask__addAdditionalHeaders_toRequest___block_invoke(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  const __CFDictionary *v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = *(const __CFDictionary **)(a1 + 32);
      if (!v6 || !CFDictionaryContainsKey(v6, a2))
        CFURLRequestSetHTTPHeaderFieldValue(*(void **)(a1 + 40), a2, a3);
    }
  }
}

- (double)_timeoutInterval
{
  return self->_timeoutInterval;
}

- (NSDictionary)_DuetActivityProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 488, 1);
}

- (NSData)_TCPConnectionMetadata
{
  return (NSData *)objc_getProperty(self, a2, 496, 1);
}

- (int64_t)_suspensionThreshhold
{
  return self->_suspensionThreshhold;
}

- (int64_t)_bytesPerSecondLimit
{
  return self->_bytesPerSecondLimitValue;
}

- (void)set_resolvedCNAMEChain:(id)a3
{

  self->_resolvedCNAMEChain = (NSArray *)objc_msgSend(a3, "copy");
}

- (void)set_TLSNegotiatedCipherSuite:(unsigned __int16)a3
{
  self->_TLSNegotiatedCipherSuite = a3;
}

- (float)priority
{
  if (self)
    return self->_priorityAPIStorage;
  else
    return 0.0;
}

- (BOOL)prefersIncrementalDelivery
{
  if (self)
    LOBYTE(self) = self->_prefersIncrementalDeliveryAPIStorage;
  return (char)self;
}

- (BOOL)_shouldUsePipelineHeuristics
{
  return self->_shouldUsePipelineHeuristics;
}

- (BOOL)_shouldSkipPipelineProbe
{
  return self->_shouldSkipPipelineProbe;
}

- (BOOL)_shouldPipelineHTTP
{
  return self->_shouldPipelineHTTP;
}

- (int64_t)_requestPriority
{
  return self->_requestPriority;
}

- (unint64_t)_allowedProtocolTypes
{
  return self->_allowedProtocolTypes;
}

- (NSString)_APSRelayTopic
{
  return self->_APSRelayTopic;
}

- (BOOL)shouldHandleCookiesAndSchemeIsAppropriate
{
  _BOOL4 v3;
  NSURLRequest *v4;

  v3 = -[NSURLSessionTask _shouldHandleCookies](self, "_shouldHandleCookies");
  if (v3)
  {
    v4 = -[NSURLSessionTask currentRequest](self, "currentRequest");
    if (v4)
      LOBYTE(v3) = URLCanUseCookies((const __CFURL *)-[NSURLRequest URL](v4, "URL"));
    else
      LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)_shouldHandleCookies
{
  return self->_shouldHandleCookies;
}

- (void)set_connectionIsCompanionLink:(BOOL)a3
{
  self->_connectionIsCompanionLink = a3;
}

- (void)_takePreventIdleSleepAssertionIfAppropriate
{
  const __CFAllocator *v3;
  NSUUID *v4;
  CFStringRef v5;
  CFNumberRef v6;
  const __CFDictionary *v7;
  IOReturn v8;
  NSObject *v9;
  NSString *v10;
  IOPMAssertionID AssertionID;
  int v12;
  int valuePtr;
  void *values;
  CFTypeRef cf;
  CFStringRef v16;
  CFTypeRef v17;
  const __CFString *v18;
  __int128 keys;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (-[NSURLSessionTask state](self, "state") <= NSURLSessionTaskStateSuspended
    && -[NSURLSessionConfiguration _preventsIdleSleepOnceConnected](self->_effectiveConfiguration, "_preventsIdleSleepOnceConnected"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sPowerAssertionSetLock);
    if (!-[NSURLSessionTask _powerAssertion](self, "_powerAssertion"))
    {
      v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v4 = -[NSURLSessionTask _uniqueIdentifier](self, "_uniqueIdentifier");
      if (!v4)
        v4 = (NSUUID *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSURLSessionTask taskIdentifier](self, "taskIdentifier"));
      v5 = CFStringCreateWithFormat(v3, 0, CFSTR("NSURLSessionTask %@"), v4);
      AssertionID = 0;
      values = CFSTR("PreventUserIdleSystemSleep");
      *(_QWORD *)&keys = CFSTR("AssertType");
      *((_QWORD *)&keys + 1) = CFSTR("AssertLevel");
      valuePtr = 255;
      cf = CFNumberCreate(v3, kCFNumberIntType, &valuePtr);
      v16 = v5;
      v20 = CFSTR("AssertName");
      v21 = CFSTR("TimeoutSeconds");
      v12 = 10800;
      v6 = CFNumberCreate(v3, kCFNumberIntType, &v12);
      v22 = CFSTR("TimeoutAction");
      v17 = v6;
      v18 = CFSTR("TimeoutActionTurnOff");
      v7 = CFDictionaryCreate(v3, (const void **)&keys, (const void **)&values, 5, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      if (cf)
        CFRelease(cf);
      if (v17)
        CFRelease(v17);
      v8 = IOPMAssertionCreateWithProperties(v7, &AssertionID);
      if (v7)
        CFRelease(v7);
      if (!v8)
      {
        -[NSURLSessionTask set_powerAssertion:](self, "set_powerAssertion:", AssertionID);
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v9 = CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
        {
          v10 = -[NSURLSessionTask _loggableDescription](self, "_loggableDescription");
          LODWORD(keys) = 138543362;
          *(_QWORD *)((char *)&keys + 4) = v10;
          _os_log_impl(&dword_183ECA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ TAKING power assertion.", (uint8_t *)&keys, 0xCu);
        }
      }
      if (v5)
        CFRelease(v5);
    }
    -[NSURLSessionTask set_powerAssertionReleaseTime:](self, "set_powerAssertionReleaseTime:", -1);
    os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
  }
}

- (void)_setConnectionIsCellular:(BOOL)a3
{
  self->_connectionIsCellular = a3;
}

- (NSDictionary)_dependencyInfo
{
  NSDictionary *result;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  result = self->_dependencyInfo_ivar;
  if (!result)
  {
    v4 = CFSTR("TaskIdentifier");
    v5[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSURLSessionTask taskIdentifier](self, "taskIdentifier"));
    result = (NSDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1), "copy");
    self->_dependencyInfo_ivar = result;
  }
  return result;
}

- (BOOL)_requiresSecureHTTPSProxyConnection
{
  return self->_requiresSecureHTTPSProxyConnection;
}

- (BOOL)_assumesHTTP3Capable
{
  return self->_assumesHTTP3Capable;
}

- (void)updateCurrentRequest:(id)a3
{
  uint64_t v4;
  NSURLSessionConfiguration *v5;
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  _BOOL8 v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  _BOOL8 v13;
  __int16 v14;
  CFTypeID TypeID;
  CFNumberRef v16;
  int Value;
  uint64_t v18;
  _BOOL8 v19;
  __int16 v20;
  CFTypeID v21;
  int v22;
  CFNumberRef v23;
  CFTypeID v24;
  NSDictionary *v25;
  const __CFAllocator *v26;
  __CFDictionary *MutableCopy;
  __CFDictionary *v28;
  CFNumberRef v29;
  CFTypeID v30;
  const void *v31;
  CFDictionaryRef Copy;
  int v33;
  int v34;
  int v35;
  CFTypeRef v36;
  uint64_t v37;
  const void *v38;
  id v39;
  const void *valuePtr;
  CFNumberRef number[2];

  if (!a3)
  {
    -[NSURLSessionTask setCurrentRequest:](self, "setCurrentRequest:");
    return;
  }
  v39 = (id)objc_msgSend(a3, "mutableCopy");
  v4 = objc_msgSend(v39, "_inner");
  v5 = -[NSURLSessionTask _effectiveConfiguration](self, "_effectiveConfiguration");
  -[NSURLSessionTask set_cachePolicy:](self, "set_cachePolicy:", *(_QWORD *)(v4 + 16));
  -[NSURLSessionTask set_timeoutInterval:](self, "set_timeoutInterval:", *(double *)(v4 + 24));
  v6 = *(_QWORD *)(v4 + 56);
  if (v6 && *(_BYTE *)(v6 + 216))
  {
    v7 = *(const __CFString **)(v6 + 152);
    v9 = v7
      && (CFStringCompare(v7, (CFStringRef)&gConstantCFStringValueTable[2590], 0) == kCFCompareEqualTo
       || ((v8 = *(const __CFString **)(v6 + 152)) != 0
        || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT)
        && (LOWORD(number[0]) = 0,
            _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "these should always be initialized now", (uint8_t *)number, 2u), (v8 = *(const __CFString **)(v6 + 152)) != 0))&& CFStringCompare(v8, (CFStringRef)&gConstantCFStringValueTable[2597], 0) == kCFCompareEqualTo)|| *(_BYTE *)(v6 + 218) != 0;
  }
  else
  {
    v9 = 0;
  }
  -[NSURLSessionTask set_shouldPipelineHTTP:](self, "set_shouldPipelineHTTP:", v9);
  v10 = *(_QWORD *)(v4 + 56);
  if (v10)
    v11 = *(unsigned __int8 *)(v10 + 217) != 0;
  else
    v11 = 0;
  -[NSURLSessionTask set_shouldUsePipelineHeuristics:](self, "set_shouldUsePipelineHeuristics:", v11);
  v12 = *(_QWORD *)(v4 + 56);
  if (v12)
    v13 = *(unsigned __int8 *)(v12 + 219) != 0;
  else
    v13 = 0;
  -[NSURLSessionTask set_shouldSkipPipelineProbe:](self, "set_shouldSkipPipelineProbe:", v13);
  -[NSURLSessionTask set_shouldHandleCookies:](self, "set_shouldHandleCookies:", *(_WORD *)(v4 + 64) & 1);
  v14 = *(_WORD *)(v4 + 64);
  if ((v14 & 0x400) == 0)
  {
    number[0] = 0;
    if (hasConfigValue((uint64_t *)number, v5, (const __CFString *)&qword_1EDD006B8[42]) && number[0])
      -[NSURLSessionTask set_cachePolicy:](self, "set_cachePolicy:");
    v14 = *(_WORD *)(v4 + 64);
  }
  if ((v14 & 0x800) == 0)
  {
    valuePtr = 0;
    number[0] = 0;
    TypeID = CFNumberGetTypeID();
    if ((hasConfigValue((const void **)number, TypeID, v5, (const __CFString *)&qword_1EDD006B8[70]) & 1) != 0)
    {
      v16 = number[0];
      Value = CFNumberGetValue(number[0], kCFNumberDoubleType, &valuePtr);
      if (v16)
        CFRelease(v16);
      if (Value)
        -[NSURLSessionTask set_timeoutInterval:](self, "set_timeoutInterval:", *(double *)&valuePtr);
    }
  }
  if ((*(_QWORD *)(v4 + 56) || _urlIsHTTPish(*(const __CFURL **)(v4 + 8))) && (*(_WORD *)(v4 + 64) & 0x200) == 0)
  {
    LOBYTE(number[0]) = 0;
    LOBYTE(valuePtr) = 0;
    if ((hasConfigValue((BOOL *)&valuePtr, v5, (const __CFString *)&qword_1EDD006B8[56]) & 1) == 0)
      LOBYTE(valuePtr) = 0;
    if (hasConfigValue((BOOL *)number, v5, (const __CFString *)&qword_1EDD006B8[28]))
    {
      -[NSURLSessionTask set_shouldPipelineHTTP:](self, "set_shouldPipelineHTTP:", LOBYTE(number[0]));
      -[NSURLSessionTask set_shouldUsePipelineHeuristics:](self, "set_shouldUsePipelineHeuristics:", valuePtr);
      v18 = *(_QWORD *)(v4 + 56);
      if (v18)
        v19 = *(unsigned __int8 *)(v18 + 219) != 0;
      else
        v19 = 0;
      -[NSURLSessionTask set_shouldSkipPipelineProbe:](self, "set_shouldSkipPipelineProbe:", v19);
    }
  }
  if ((*(_QWORD *)(v4 + 56) || _urlIsHTTPish(*(const __CFURL **)(v4 + 8))) && (*(_WORD *)(v4 + 64) & 0x20) == 0)
  {
    LOBYTE(number[0]) = 0;
    if (hasConfigValue((BOOL *)number, v5, (const __CFString *)&qword_1EDD006B8[21]))
      -[NSURLSessionTask set_shouldHandleCookies:](self, "set_shouldHandleCookies:", LOBYTE(number[0]));
  }
  if (*(_QWORD *)(v4 + 56) || _urlIsHTTPish(*(const __CFURL **)(v4 + 8)))
  {
    number[0] = 0;
    if (hasConfigValue((uint64_t *)number, v5, (const __CFString *)&qword_1EDD006B8[14]))
      -[NSURLSessionTask set_cookieAcceptPolicy:](self, "set_cookieAcceptPolicy:", LODWORD(number[0]));
  }
  v20 = *(_WORD *)(v4 + 64);
  if ((v20 & 0x100) != 0)
  {
    if ((v20 & 0x80) != 0)
      goto LABEL_53;
  }
  else
  {
    LOBYTE(number[0]) = 0;
    if (hasConfigValue((BOOL *)number, v5, (const __CFString *)&qword_1EDD006B8[49]))
      -[NSURLSessionTask set_preventsIdleSystemSleep:](self, "set_preventsIdleSystemSleep:", LOBYTE(number[0]));
    v20 = *(_WORD *)(v4 + 64);
    if ((v20 & 0x80) != 0)
    {
LABEL_53:
      if ((v20 & 0x40) == 0)
        goto LABEL_62;
      goto LABEL_59;
    }
  }
  LOBYTE(number[0]) = 0;
  if (hasConfigValue((BOOL *)number, v5, (const __CFString *)&unk_1EDD005D8))
    -[NSURLSessionTask set_allowsCellular:](self, "set_allowsCellular:", LOBYTE(number[0]));
  v20 = *(_WORD *)(v4 + 64);
  if ((v20 & 0x40) == 0)
  {
LABEL_62:
    number[0] = 0;
    if (hasConfigValue((uint64_t *)number, v5, (const __CFString *)&qword_1EDD006B8[35]))
      -[NSURLSessionTask set_networkServiceType:](self, "set_networkServiceType:", LODWORD(number[0]));
    if ((*(_WORD *)(v4 + 64) & 0x1000) == 0)
      goto LABEL_67;
    goto LABEL_65;
  }
LABEL_59:
  if (!*(_DWORD *)(v4 + 104))
    goto LABEL_62;
  if ((v20 & 0x1000) == 0)
  {
LABEL_67:
    number[0] = 0;
    v21 = CFDictionaryGetTypeID();
    v22 = hasConfigValue((const void **)number, v21, v5, CFSTR("ConnectionProxyDictionaryAttribute"));
    v23 = number[0];
    if (v22)
      -[NSURLSessionTask set_proxySettings:](self, "set_proxySettings:", number[0]);
    if (v23)
      CFRelease(v23);
    goto LABEL_71;
  }
LABEL_65:
  if (!*(_QWORD *)(v4 + 48))
    goto LABEL_67;
  -[NSURLSessionTask set_proxySettings:](self, "set_proxySettings:");
LABEL_71:
  if ((*(_WORD *)(v4 + 64) & 0x2000) != 0)
  {
    -[NSURLSessionTask set_sslSettings:](self, "set_sslSettings:", *(_QWORD *)(v4 + 72));
  }
  else
  {
    valuePtr = 0;
    number[0] = 0;
    v24 = CFNumberGetTypeID();
    if (hasConfigValue((const void **)number, v24, v5, (const __CFString *)&qword_1EDD006B8[84]))
    {
      v25 = -[NSURLSessionTask _sslSettings](self, "_sslSettings");
      v26 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      if (v25)
        MutableCopy = CFDictionaryCreateMutableCopy(v26, 0, (CFDictionaryRef)-[NSURLSessionTask _sslSettings](self, "_sslSettings"));
      else
        MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v28 = MutableCopy;
      v29 = number[0];
      CFDictionaryAddValue(MutableCopy, &unk_1EDCFB3D0, number[0]);
      v30 = CFNumberGetTypeID();
      if (hasConfigValue(&valuePtr, v30, v5, (const __CFString *)&qword_1EDD006B8[77]))
      {
        v31 = valuePtr;
        CFDictionaryAddValue(v28, &unk_1EDCFB398, valuePtr);
        CFRelease(v31);
      }
      Copy = CFDictionaryCreateCopy(v26, v28);
      -[NSURLSessionTask set_sslSettings:](self, "set_sslSettings:", Copy);
      CFRelease(v29);
      if (Copy)
        CFRelease(Copy);
      if (v28)
        CFRelease(v28);
    }
  }
  if (*(_QWORD *)(v4 + 224))
  {
    -[NSURLSessionTask _setExplicitStorageSession:](self, "_setExplicitStorageSession:");
  }
  else
  {
    v37 = *(_QWORD *)(v4 + 56);
    if (v37)
    {
      v38 = *(const void **)(v37 + 192);
      if (v38)
      {
        CFRetain(*(CFTypeRef *)(v37 + 192));
        -[NSURLSessionTask _setExplicitCookieStorage:](self, "_setExplicitCookieStorage:", v38);
        CFRelease(v38);
      }
    }
  }
  if (*(_QWORD *)(v4 + 112))
    -[NSURLSessionTask set_boundInterfaceIdentifier:](self, "set_boundInterfaceIdentifier:");
  v33 = *(unsigned __int16 *)(v4 + 64);
  v34 = v33 << 24;
  if ((v33 & 8) != 0)
    v35 = 1;
  else
    v35 = 2;
  -[NSURLSessionTask set_allowsCellularOverride:](self, "set_allowsCellularOverride:", v35 & (v34 >> 31));
  -[NSURLSessionTask set_allowsConstrainedOverride:](self, "set_allowsConstrainedOverride:", *(unsigned int *)(v4 + 212));
  -[NSURLSessionTask set_allowsExpensiveOverride:](self, "set_allowsExpensiveOverride:", *(unsigned int *)(v4 + 208));
  -[NSURLSessionTask set_allowsUCAOverride:](self, "set_allowsUCAOverride:", *(unsigned int *)(v4 + 216));
  -[NSURLSessionTask set_assumesHTTP3Capable:](self, "set_assumesHTTP3Capable:", *(_BYTE *)(v4 + 156) != 0);
  -[NSURLSessionTask set_requiresDNSSECValidation:](self, "set_requiresDNSSECValidation:", *(unsigned int *)(v4 + 168));
  -[NSURLSessionTask set_allowsPersistentDNS:](self, "set_allowsPersistentDNS:", *(_BYTE *)(v4 + 172) != 0);
  if (*(_DWORD *)(v4 + 104))
    -[NSURLSessionTask set_networkServiceType:](self, "set_networkServiceType:");
  -[NSURLSessionTask set_allowedProtocolTypes:](self, "set_allowedProtocolTypes:", *(_QWORD *)(v4 + 96));
  if (*(_QWORD *)(v4 + 88) != -1)
    -[NSURLSessionTask set_requestPriority:](self, "set_requestPriority:");
  if (*(double *)(v4 + 128) != 0.0 || *(double *)(v4 + 136) != 0.0)
  {
    -[NSURLSessionTask set_timeWindowDelay:](self, "set_timeWindowDelay:");
    -[NSURLSessionTask set_timeWindowDuration:](self, "set_timeWindowDuration:", *(double *)(v4 + 136));
  }
  -[NSURLSessionTask set_attribution:](self, "set_attribution:", *(_QWORD *)(v4 + 176));
  -[NSURLSessionTask set_isKnownTracker:](self, "set_isKnownTracker:", *(_BYTE *)(v4 + 157) != 0);
  v36 = *(CFTypeRef *)(v4 + 120);
  if (!v36)
    v36 = (id)URLRequest::copyMainDocumentRegistrableDomain((URLRequest *)v4);
  -[NSURLSessionTask set_trackerContext:](self, "set_trackerContext:", v36);
  -[NSURLSessionTask set_privacyProxyFailClosed:](self, "set_privacyProxyFailClosed:", *(_BYTE *)(v4 + 158) != 0);
  -[NSURLSessionTask set_privacyProxyFailClosedForUnreachableNonMainHosts:](self, "set_privacyProxyFailClosedForUnreachableNonMainHosts:", *(_BYTE *)(v4 + 159) != 0);
  -[NSURLSessionTask set_privacyProxyFailClosedForUnreachableHosts:](self, "set_privacyProxyFailClosedForUnreachableHosts:", *(_BYTE *)(v4 + 160) != 0);
  -[NSURLSessionTask set_prohibitPrivacyProxy:](self, "set_prohibitPrivacyProxy:", *(_BYTE *)(v4 + 161) != 0);
  -[NSURLSessionTask set_useEnhancedPrivacyMode:](self, "set_useEnhancedPrivacyMode:", *(_BYTE *)(v4 + 163) != 0);
  -[NSURLSessionTask set_blockTrackers:](self, "set_blockTrackers:", *(_BYTE *)(v4 + 164) != 0);
  -[NSURLSessionTask set_failInsecureLoadWithHTTPSDNSRecord:](self, "set_failInsecureLoadWithHTTPSDNSRecord:", *(_BYTE *)(v4 + 165) != 0);
  -[NSURLSessionTask set_isWebSearchContent:](self, "set_isWebSearchContent:", *(_BYTE *)(v4 + 166) != 0);
  if (self)
  {
    -[NSURLSessionTask _addAdditionalHeaders:toRequest:](-[NSURLSessionConfiguration HTTPAdditionalHeaders](self->_effectiveConfiguration, "HTTPAdditionalHeaders"), v39);
    if (os_variant_allows_internal_security_policies())
    {
      if (-[NSURLSessionTask addAdditionalHeadersToRequest:]::onceToken != -1)
        dispatch_once(&-[NSURLSessionTask addAdditionalHeadersToRequest:]::onceToken, &__block_literal_global_17954);
      -[NSURLSessionTask _addAdditionalHeaders:toRequest:]((void *)-[NSURLSessionTask addAdditionalHeadersToRequest:]::additionalHeaders, v39);
    }
  }
  -[NSURLSessionTask setCurrentRequest:](self, "setCurrentRequest:", v39);

}

- (NSDictionary)_sslSettings
{
  return (NSDictionary *)objc_getProperty(self, a2, 376, 1);
}

- (void)_addAdditionalHeaders:(void *)a1 toRequest:(void *)a2
{
  HTTPMessage *v4;
  CFMutableDictionaryRef v5;
  _QWORD v6[6];

  if (a1)
  {
    v4 = *(HTTPMessage **)(objc_msgSend(a2, "_inner") + 56);
    if (v4)
      v5 = HTTPMessage::copyAllHeaderFields(v4);
    else
      v5 = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __52__NSURLSessionTask__addAdditionalHeaders_toRequest___block_invoke;
    v6[3] = &__block_descriptor_48_e15_v32__0_8_16_B24l;
    v6[4] = v5;
    v6[5] = a2;
    objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v6);
    if (v5)
      CFRelease(v5);
  }
}

- (void)set_shouldUsePipelineHeuristics:(BOOL)a3
{
  self->_shouldUsePipelineHeuristics = a3;
}

- (void)set_shouldSkipPipelineProbe:(BOOL)a3
{
  self->_shouldSkipPipelineProbe = a3;
}

- (void)set_shouldPipelineHTTP:(BOOL)a3
{
  self->_shouldPipelineHTTP = a3;
}

- (void)set_shouldHandleCookies:(BOOL)a3
{
  self->_shouldHandleCookies = a3;
}

- (void)set_timeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (void)set_trackerContext:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 736);
}

- (void)set_cachePolicy:(unint64_t)a3
{
  self->_cachePolicy = a3;
}

- (void)set_isWebSearchContent:(BOOL)a3
{
  self->_isWebSearchContent = a3;
}

- (void)set_failInsecureLoadWithHTTPSDNSRecord:(BOOL)a3
{
  self->_failInsecureLoadWithHTTPSDNSRecord = a3;
}

- (void)set_blockTrackers:(BOOL)a3
{
  self->_blockTrackers = a3;
}

- (void)set_useEnhancedPrivacyMode:(BOOL)a3
{
  self->_useEnhancedPrivacyMode = a3;
}

- (void)set_sslSettings:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 376);
}

- (void)set_requiresDNSSECValidation:(int)a3
{
  self->_requiresDNSSECValidation = a3;
}

- (void)set_prohibitPrivacyProxy:(BOOL)a3
{
  self->_prohibitPrivacyProxy = a3;
}

- (void)set_privacyProxyFailClosedForUnreachableNonMainHosts:(BOOL)a3
{
  self->_privacyProxyFailClosedForUnreachableNonMainHosts = a3;
}

- (void)set_privacyProxyFailClosedForUnreachableHosts:(BOOL)a3
{
  self->_privacyProxyFailClosedForUnreachableHosts = a3;
}

- (void)set_privacyProxyFailClosed:(BOOL)a3
{
  self->_privacyProxyFailClosed = a3;
}

- (void)set_preventsIdleSystemSleep:(BOOL)a3
{
  self->_preventsIdleSystemSleep = a3;
}

- (void)set_isKnownTracker:(BOOL)a3
{
  self->_isKnownTracker = a3;
}

- (void)set_attribution:(unint64_t)a3
{
  self->_attribution = a3;
}

- (void)set_assumesHTTP3Capable:(BOOL)a3
{
  self->_assumesHTTP3Capable = a3;
}

- (void)set_allowsExpensiveOverride:(int)a3
{
  -[NSURLSessionTask set_cachedSocketStreamProperties:](self, "set_cachedSocketStreamProperties:", 0);
  self->_allowsExpensiveOverride = a3;
}

- (void)set_allowsConstrainedOverride:(int)a3
{
  -[NSURLSessionTask set_cachedSocketStreamProperties:](self, "set_cachedSocketStreamProperties:", 0);
  self->_allowsConstrainedOverride = a3;
}

- (void)set_allowsCellularOverride:(int)a3
{
  -[NSURLSessionTask set_cachedSocketStreamProperties:](self, "set_cachedSocketStreamProperties:", 0);
  self->_allowsCellularOverride = a3;
}

- (void)set_cachedSocketStreamProperties:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 648);
}

- (void)set_allowedProtocolTypes:(unint64_t)a3
{
  self->_allowedProtocolTypes = a3;
}

- (void)set_networkServiceType:(int)a3
{
  -[NSURLSessionTask set_cachedSocketStreamProperties:](self, "set_cachedSocketStreamProperties:", 0);
  self->_networkServiceType = a3;
}

- (void)set_cookieAcceptPolicy:(int)a3
{
  self->_cookieAcceptPolicy = a3;
}

- (void)set_allowsCellular:(BOOL)a3
{
  self->_allowsCellular = a3;
}

- (void)setCurrentRequest:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (__CFDictionary)_copySocketStreamProperties
{
  NSDictionary *cachedSocketStreamProperties;
  NSDictionary *v5;
  const __CFAllocator *v6;
  CFMutableDictionaryRef MutableCopy;
  __CFDictionary *v8;
  BOOL v9;
  const void **v10;
  _BOOL4 v11;
  const void **v12;
  NSString *v13;
  const __CFDictionary *Value;
  __CFDictionary *v15;
  __CFDictionary *v16;
  const void *v17;
  double v18;
  void *v19;
  const __CFDictionary *v20;
  const __CFAllocator *v21;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v23;
  NSDictionary *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  const void **v29;
  const void **v30;
  const void **v31;
  const void **v32;
  unint64_t v33;
  const void *NetworkServiceTypeString;
  CFNumberRef v35;
  CFNumberRef v36;
  int v37;
  const void **v38;
  const void **v39;
  const void *v40;
  __CFDictionary *v41;
  const __CFDictionary *v42;
  const __CFDictionary *v43;
  const __CFDictionary *v44;
  CFStringRef v45;
  uint64_t v46;
  double v47;
  CFNumberRef v48;
  CFNumberRef v49;
  CFNumberRef v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  NSDictionary *legacySocketStreamProperties;
  void *v56;
  void *v57;
  NSDictionary *v58;
  NSURLRequest *v59;
  const __CFURL *v60;
  _QWORD v61[5];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  double v66;
  uint64_t valuePtr;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  cachedSocketStreamProperties = self->_cachedSocketStreamProperties;
  if (cachedSocketStreamProperties)
    return (__CFDictionary *)CFRetain(cachedSocketStreamProperties);
  v5 = -[NSURLSessionConfiguration _socketStreamProperties](self->_effectiveConfiguration, "_socketStreamProperties");
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (v5)
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, (CFDictionaryRef)v5);
  else
    MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v8 = MutableCopy;
  v9 = -[NSURLSessionConfiguration allowsExpensiveNetworkAccess](self->_effectiveConfiguration, "allowsExpensiveNetworkAccess");
  v10 = (const void **)MEMORY[0x1E0C9AE40];
  if (!v9)
    CFDictionaryAddValue(v8, &unk_1EDCFB788, (const void *)*MEMORY[0x1E0C9AE40]);
  if (!-[NSURLSessionConfiguration allowsConstrainedNetworkAccess](self->_effectiveConfiguration, "allowsConstrainedNetworkAccess"))CFDictionaryAddValue(v8, &unk_1EDCFB750, *v10);
  v11 = -[NSURLSessionConfiguration _allowsUCA](self->_effectiveConfiguration, "_allowsUCA");
  v12 = (const void **)MEMORY[0x1E0C9AE50];
  if (v11)
    CFDictionaryAddValue(v8, &unk_1EDCFA090, (const void *)*MEMORY[0x1E0C9AE50]);
  if (!-[NSURLSessionConfiguration _allowsVirtualInterfaces](self->_effectiveConfiguration, "_allowsVirtualInterfaces"))
    CFDictionaryAddValue(v8, &unk_1EDCFA0C8, *v10);
  if (-[NSURLSessionConfiguration _multipathAlternatePort](self->_effectiveConfiguration, "_multipathAlternatePort"))
    CFDictionaryAddValue(v8, &unk_1EDCF9AA8, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSURLSessionConfiguration _multipathAlternatePort](self->_effectiveConfiguration, "_multipathAlternatePort")));
  if (-[NSURLSessionConfiguration _TCPAdaptiveReadTimeout](self->_effectiveConfiguration, "_TCPAdaptiveReadTimeout"))
    CFDictionaryAddValue(v8, &unk_1EDCFACD0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSURLSessionConfiguration _TCPAdaptiveReadTimeout](self->_effectiveConfiguration, "_TCPAdaptiveReadTimeout")));
  if (-[NSURLSessionConfiguration _TCPAdaptiveWriteTimeout](self->_effectiveConfiguration, "_TCPAdaptiveWriteTimeout"))
    CFDictionaryAddValue(v8, &unk_1EDCFAD08, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSURLSessionConfiguration _TCPAdaptiveWriteTimeout](self->_effectiveConfiguration, "_TCPAdaptiveWriteTimeout")));
  if (-[NSURLSessionConfiguration _allowsPowerNapScheduling](self->_effectiveConfiguration, "_allowsPowerNapScheduling"))
  {
    CFDictionaryAddValue(v8, &unk_1EDCFBD00, *v12);
  }
  if (-[NSURLSessionConfiguration _tcpConnectionPoolName](self->_effectiveConfiguration, "_tcpConnectionPoolName"))
  {
    CFDictionaryAddValue(v8, &unk_1EDCFA218, -[NSURLSessionConfiguration _tcpConnectionPoolName](self->_effectiveConfiguration, "_tcpConnectionPoolName"));
    CFDictionaryAddValue(v8, &unk_1EDCFA250, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[NSURLSessionTask computeAdjustedPoolPriority](self, "computeAdjustedPoolPriority")));
  }
  if (-[NSURLSessionTask _sourceApplicationBundleIdentifierForMobileAsset](self, "_sourceApplicationBundleIdentifierForMobileAsset"))
  {
    v13 = -[NSURLSessionTask _sourceApplicationBundleIdentifierForMobileAsset](self, "_sourceApplicationBundleIdentifierForMobileAsset");
  }
  else
  {
    if (!-[NSURLSessionConfiguration _sourceApplicationBundleIdentifier](self->_effectiveConfiguration, "_sourceApplicationBundleIdentifier"))goto LABEL_29;
    v13 = -[NSURLSessionConfiguration _sourceApplicationBundleIdentifier](self->_effectiveConfiguration, "_sourceApplicationBundleIdentifier");
  }
  CFDictionaryAddValue(v8, &unk_1EDCFBFA0, v13);
LABEL_29:
  if (-[NSURLSessionConfiguration _companionAppBundleIdentifier](self->_effectiveConfiguration, "_companionAppBundleIdentifier"))
  {
    CFDictionaryAddValue(v8, &unk_1EDCF9418, -[NSURLSessionConfiguration _companionAppBundleIdentifier](self->_effectiveConfiguration, "_companionAppBundleIdentifier"));
  }
  if (-[NSURLSessionConfiguration _sourceApplicationSecondaryIdentifier](self->_effectiveConfiguration, "_sourceApplicationSecondaryIdentifier"))
  {
    CFDictionaryAddValue(v8, &unk_1EDCFB718, -[NSURLSessionConfiguration _sourceApplicationSecondaryIdentifier](self->_effectiveConfiguration, "_sourceApplicationSecondaryIdentifier"));
  }
  if (-[NSURLSessionConfiguration _sourceApplicationAuditTokenData](self->_effectiveConfiguration, "_sourceApplicationAuditTokenData"))
  {
    CFDictionaryAddValue(v8, &unk_1EDCFBF68, -[NSURLSessionConfiguration _sourceApplicationAuditTokenData](self->_effectiveConfiguration, "_sourceApplicationAuditTokenData"));
  }
  if (-[NSURLSessionConfiguration _attributedBundleIdentifier](self->_effectiveConfiguration, "_attributedBundleIdentifier"))
  {
    CFDictionaryAddValue(v8, &unk_1EDCFB7C0, -[NSURLSessionConfiguration _attributedBundleIdentifier](self->_effectiveConfiguration, "_attributedBundleIdentifier"));
  }
  if (-[NSURLSessionConfiguration _preventsIdleSleepOnceConnected](self->_effectiveConfiguration, "_preventsIdleSleepOnceConnected"))
  {
    CFDictionaryAddValue(v8, &unk_1EDCF9C30, *v12);
  }
  if (-[NSURLSessionConfiguration _forcesNewConnections](self->_effectiveConfiguration, "_forcesNewConnections"))
    CFDictionaryAddValue(v8, CFSTR("uniqueTaskIdentifier"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSURLSessionTask taskIdentifier](self, "taskIdentifier")));
  if (!-[NSURLSessionConfiguration allowsCellularAccess](self->_effectiveConfiguration, "allowsCellularAccess"))
    CFDictionarySetValue(v8, &unk_1EDCFBC58, *v12);
  if (-[NSURLSessionConfiguration shouldUseExtendedBackgroundIdleMode](self->_effectiveConfiguration, "shouldUseExtendedBackgroundIdleMode"))
  {
    CFDictionarySetValue(v8, &unk_1EDCFBD70, *v12);
  }
  if (-[NSURLSessionConfiguration _allowsMultipathTCP](self->_effectiveConfiguration, "_allowsMultipathTCP"))
    CFDictionarySetValue(v8, &unk_1EDCFBAD0, *v12);
  if (-[NSURLSessionConfiguration _allowsResponseMonitoringDuringBodyTranmission](self->_effectiveConfiguration, "_allowsResponseMonitoringDuringBodyTranmission"))
  {
    CFDictionarySetValue(v8, &unk_1EDCFE230, *v12);
  }
  if (-[NSURLSessionConfiguration waitsForConnectivity](self->_effectiveConfiguration, "waitsForConnectivity")
    || -[NSURLSessionConfiguration _allowsIndefiniteConnections](self->_effectiveConfiguration, "_allowsIndefiniteConnections"))
  {
    CFDictionarySetValue(v8, &unk_1EDCFBB08, *v12);
  }
  if (-[NSURLSessionConfiguration _CTDataConnectionServiceType](self->_effectiveConfiguration, "_CTDataConnectionServiceType"))
  {
    CFDictionarySetValue(v8, &unk_1EDCFB9F0, -[NSURLSessionConfiguration _CTDataConnectionServiceType](self->_effectiveConfiguration, "_CTDataConnectionServiceType"));
  }
  if (-[NSURLSessionConfiguration _allowsTCPFastOpen](self->_effectiveConfiguration, "_allowsTCPFastOpen"))
    CFDictionarySetValue(v8, &unk_1EDCF9F40, *v12);
  if (-[NSURLSessionConfiguration _allowsTLSSessionTickets](self->_effectiveConfiguration, "_allowsTLSSessionTickets"))
    CFDictionarySetValue(v8, &unk_1EDCF9F08, *v12);
  if (!-[NSURLSessionConfiguration _allowsTLSSessionResumption](self->_effectiveConfiguration, "_allowsTLSSessionResumption"))CFDictionarySetValue(v8, &unk_1EDCF9ED0, *v10);
  if (-[NSURLSessionConfiguration _allowsTLSFalseStart](self->_effectiveConfiguration, "_allowsTLSFalseStart"))
  {
    Value = (const __CFDictionary *)CFDictionaryGetValue(v8, CFSTR("kCFStreamPropertySSLSettings"));
    v15 = Value
        ? CFDictionaryCreateMutableCopy(v6, 0, Value)
        : CFDictionaryCreateMutable(v6, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v16 = v15;
    if (v15)
    {
      v17 = *v12;
      CFDictionarySetValue(v15, &unk_1EDCFB328, *v12);
      CFDictionarySetValue(v16, &unk_1EDCFB360, v17);
      CFDictionarySetValue(v8, CFSTR("kCFStreamPropertySSLSettings"), v16);
      CFRelease(v16);
    }
  }
  if (-[NSURLSessionConfiguration _tlsTrustPinningPolicyName](self->_effectiveConfiguration, "_tlsTrustPinningPolicyName"))
  {
    CFDictionarySetValue(v8, &unk_1EDCFAC60, -[NSURLSessionConfiguration _tlsTrustPinningPolicyName](self->_effectiveConfiguration, "_tlsTrustPinningPolicyName"));
  }
  if (-[NSURLSessionConfiguration _allowsTLSECH](self->_effectiveConfiguration, "_allowsTLSECH"))
    CFDictionarySetValue(v8, &unk_1EDCF9F78, *v12);
  if (-[NSURLSessionConfiguration _customReadBufferSize](self->_effectiveConfiguration, "_customReadBufferSize"))
    CFDictionarySetValue(v8, &unk_1EDCFA918, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSURLSessionConfiguration _customReadBufferSize](self->_effectiveConfiguration, "_customReadBufferSize")));
  -[NSURLSessionConfiguration _customReadBufferTimeout](self->_effectiveConfiguration, "_customReadBufferTimeout");
  if (v18 > 0.0)
  {
    v19 = (void *)MEMORY[0x1E0CB37E8];
    -[NSURLSessionConfiguration _customReadBufferTimeout](self->_effectiveConfiguration, "_customReadBufferTimeout");
    CFDictionarySetValue(v8, &unk_1EDCFA950, (const void *)objc_msgSend(v19, "numberWithDouble:"));
  }
  if (-[NSURLSessionConfiguration multipathServiceType](self->_effectiveConfiguration, "multipathServiceType"))
    CFDictionarySetValue(v8, &unk_1EDCF9AE0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSURLSessionConfiguration multipathServiceType](self->_effectiveConfiguration, "multipathServiceType")));
  if (-[NSURLSessionConfiguration _expiredDNSBehavior](self->_effectiveConfiguration, "_expiredDNSBehavior"))
    CFDictionarySetValue(v8, &unk_1EDCFA4B8, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[NSURLSessionConfiguration _expiredDNSBehavior](self->_effectiveConfiguration, "_expiredDNSBehavior")));
  if (-[NSURLSessionTask _sslSettings](self, "_sslSettings"))
  {
    v20 = (const __CFDictionary *)CFDictionaryGetValue(v8, CFSTR("kCFStreamPropertySSLSettings"));
    v21 = v6;
    if (v20)
      Mutable = CFDictionaryCreateMutableCopy(v6, 0, v20);
    else
      Mutable = CFDictionaryCreateMutable(v6, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v23 = Mutable;
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v24 = -[NSURLSessionTask _sslSettings](self, "_sslSettings");
    v25 = -[NSDictionary countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v63 != v27)
            objc_enumerationMutation(v24);
          CFDictionarySetValue(v23, *(const void **)(*((_QWORD *)&v62 + 1) + 8 * i), -[NSDictionary objectForKeyedSubscript:](-[NSURLSessionTask _sslSettings](self, "_sslSettings"), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i)));
        }
        v26 = -[NSDictionary countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
      }
      while (v26);
    }
    CFDictionarySetValue(v8, CFSTR("kCFStreamPropertySSLSettings"), v23);
    v6 = v21;
    v12 = (const void **)MEMORY[0x1E0C9AE50];
    v10 = (const void **)MEMORY[0x1E0C9AE40];
    if (v23)
      CFRelease(v23);
  }
  if (-[NSURLSessionTask _boundInterfaceIdentifier](self, "_boundInterfaceIdentifier"))
    CFDictionaryAddValue(v8, &unk_1EDCFB830, -[NSURLSessionTask _boundInterfaceIdentifier](self, "_boundInterfaceIdentifier"));
  if (-[NSURLSessionTask _allowsCellularOverride](self, "_allowsCellularOverride"))
  {
    if (-[NSURLSessionTask _allowsCellularOverride](self, "_allowsCellularOverride") == 2)
      v29 = v12;
    else
      v29 = v10;
    CFDictionarySetValue(v8, &unk_1EDCFBC58, *v29);
  }
  if (-[NSURLSessionTask _disallowCellular](self, "_disallowCellular"))
    CFDictionarySetValue(v8, &unk_1EDCFBC58, *v12);
  if (-[NSURLSessionTask _allowsExpensiveOverride](self, "_allowsExpensiveOverride"))
  {
    if (-[NSURLSessionTask _allowsExpensiveOverride](self, "_allowsExpensiveOverride") == 1)
      v30 = v12;
    else
      v30 = v10;
    CFDictionarySetValue(v8, &unk_1EDCFB788, *v30);
  }
  if (-[NSURLSessionTask _allowsConstrainedOverride](self, "_allowsConstrainedOverride"))
  {
    if (-[NSURLSessionTask _allowsConstrainedOverride](self, "_allowsConstrainedOverride") == 1)
      v31 = v12;
    else
      v31 = v10;
    CFDictionarySetValue(v8, &unk_1EDCFB750, *v31);
  }
  if (-[NSURLSessionTask _allowsUCAOverride](self, "_allowsUCAOverride"))
  {
    if (-[NSURLSessionTask _allowsUCAOverride](self, "_allowsUCAOverride") == 1)
      v32 = v12;
    else
      v32 = v10;
    CFDictionarySetValue(v8, &unk_1EDCFA090, *v32);
  }
  v33 = -[NSURLSessionConfiguration _forcedNetworkServiceType](self->_effectiveConfiguration, "_forcedNetworkServiceType");
  if (!v33)
    LODWORD(v33) = -[NSURLSessionTask _networkServiceType](self, "_networkServiceType");
  if ((_DWORD)v33)
  {
    NetworkServiceTypeString = (const void *)ClassicURLConnection::getNetworkServiceTypeString(v33);
    CFDictionarySetValue(v8, &unk_1EDCFB478, NetworkServiceTypeString);
  }
  if (-[NSURLRequest _requiresShortConnectionTimeout](-[NSURLSessionTask currentRequest](self, "currentRequest"), "_requiresShortConnectionTimeout"))
  {
    valuePtr = 0x4024000000000000;
    v35 = CFNumberCreate(v6, kCFNumberDoubleType, &valuePtr);
    if (v35)
    {
      v36 = v35;
      CFDictionarySetValue(v8, &unk_1EDCF94C0, v35);
      CFRelease(v36);
    }
  }
  if (-[NSURLSessionTask _hostOverride](self, "_hostOverride"))
    CFDictionarySetValue(v8, &unk_1EDCF9760, -[NSURLSessionTask _hostOverride](self, "_hostOverride"));
  v37 = -[NSURLSessionConfiguration _allowsHTTP3Internal](-[NSURLSessionTask _effectiveConfiguration](self, "_effectiveConfiguration"), "_allowsHTTP3Internal");
  if (v37 == 1
    || !v37 && (nw_settings_get_quic_enabled() & 1) != 0
    || -[NSURLSessionTask _assumesHTTP3Capable](self, "_assumesHTTP3Capable"))
  {
    CFDictionarySetValue(v8, &unk_1EDCF9990, *v12);
  }
  if (-[NSURLSessionTask _allowsPersistentDNS](self, "_allowsPersistentDNS"))
    CFDictionarySetValue(v8, &unk_1EDCF9258, *v12);
  if (-[NSURLSessionTask _isKnownTracker](self, "_isKnownTracker"))
    CFDictionaryAddValue(v8, &unk_1EDCF9A70, *v12);
  if (-[NSURLSessionTask _attribution](self, "_attribution"))
    CFDictionaryAddValue(v8, &unk_1EDCF9338, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSURLSessionTask _attribution](self, "_attribution")));
  if (-[NSURLSessionTask _trackerContext](self, "_trackerContext"))
    CFDictionaryAddValue(v8, &unk_1EDCF9FB0, -[NSURLSessionTask _trackerContext](self, "_trackerContext"));
  if (-[NSURLSessionTask _privacyProxyFailClosed](self, "_privacyProxyFailClosed"))
    CFDictionaryAddValue(v8, &unk_1EDCF9C68, *v12);
  if (-[NSURLSessionTask _privacyProxyFailClosedForUnreachableNonMainHosts](self, "_privacyProxyFailClosedForUnreachableNonMainHosts"))
  {
    CFDictionaryAddValue(v8, &unk_1EDCF9CD8, *v12);
  }
  if (-[NSURLSessionTask _privacyProxyFailClosedForUnreachableHosts](self, "_privacyProxyFailClosedForUnreachableHosts"))
  {
    CFDictionaryAddValue(v8, &unk_1EDCF9CA0, *v12);
  }
  if (-[NSURLSessionConfiguration _enablesL4SInternal](-[NSURLSessionTask _effectiveConfiguration](self, "_effectiveConfiguration"), "_enablesL4SInternal"))
  {
    if (-[NSURLSessionConfiguration _enablesL4SInternal](-[NSURLSessionTask _effectiveConfiguration](self, "_effectiveConfiguration"), "_enablesL4SInternal") == 1)v38 = v12;
    else
      v38 = v10;
    CFDictionaryAddValue(v8, &unk_1EDCF9728, *v38);
  }
  if (-[NSURLSessionTask _prohibitPrivacyProxy](self, "_prohibitPrivacyProxy"))
    CFDictionaryAddValue(v8, &unk_1EDCF9D48, *v12);
  if (-[NSURLSessionTask _useEnhancedPrivacyMode](self, "_useEnhancedPrivacyMode"))
    CFDictionaryAddValue(v8, &unk_1EDCF9FE8, *v12);
  if (-[NSURLSessionTask _blockTrackers](self, "_blockTrackers"))
    CFDictionaryAddValue(v8, &unk_1EDCF9370, *v12);
  if (-[NSURLSessionTask _failInsecureLoadWithHTTPSDNSRecord](self, "_failInsecureLoadWithHTTPSDNSRecord"))
    CFDictionaryAddValue(v8, &unk_1EDCF98E8, *v12);
  if (-[NSURLSessionTask _isWebSearchContent](self, "_isWebSearchContent")
    && -[NSURLSessionTask _useEnhancedPrivacyMode](self, "_useEnhancedPrivacyMode"))
  {
    CFDictionaryAddValue(v8, &unk_1EDCF9A38, *v12);
  }
  if (-[NSURLSessionTask _requiresDNSSECValidation](self, "_requiresDNSSECValidation"))
  {
    if (-[NSURLSessionTask _requiresDNSSECValidation](self, "_requiresDNSSECValidation") == 1)
      v39 = v12;
    else
      v39 = v10;
    v40 = *v39;
    v41 = v8;
  }
  else
  {
    if (!-[NSURLSessionConfiguration requiresDNSSECValidation](-[NSURLSessionTask _effectiveConfiguration](self, "_effectiveConfiguration"), "requiresDNSSECValidation"))goto LABEL_167;
    v40 = *v12;
    v41 = v8;
  }
  CFDictionaryAddValue(v41, &unk_1EDCF9E28, v40);
LABEL_167:
  if (-[NSURLSessionConfiguration _prohibitEncryptedDNS](-[NSURLSessionTask _effectiveConfiguration](self, "_effectiveConfiguration"), "_prohibitEncryptedDNS"))
  {
    CFDictionaryAddValue(v8, &unk_1EDCF9D10, *v12);
  }
  if (-[NSURLSessionConfiguration _disableAPWakeOnIdleConnections](-[NSURLSessionTask _effectiveConfiguration](self, "_effectiveConfiguration"), "_disableAPWakeOnIdleConnections"))
  {
    CFDictionaryAddValue(v8, &unk_1EDCF9680, *v12);
  }
  v42 = (const __CFDictionary *)CFDictionaryGetValue(v8, &unk_1EDCFB868);
  if (v42)
    v43 = CFDictionaryCreateMutableCopy(v6, 0, v42);
  else
    v43 = CFDictionaryCreateMutable(v6, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v44 = v43;
  if (v43
    && !CFDictionaryGetValue(v43, CFSTR("kConditionalConnectionIdentifier"))
    && CFDictionaryGetValue(v44, CFSTR("kConditionalConnectionLaunchOnDemand"))
    && (v59 = -[NSURLSessionTask currentRequest](self, "currentRequest")) != 0
    && (v60 = -[NSURLRequest URL](v59, "URL")) != 0)
  {
    v45 = CFURLGetString(v60);
  }
  else
  {
    v45 = 0;
  }
  -[NSURLSessionTask _timeWindowDelay](self, "_timeWindowDelay");
  valuePtr = v46;
  -[NSURLSessionTask _timeWindowDuration](self, "_timeWindowDuration");
  v66 = v47;
  if (v47 == 0.0)
    goto LABEL_185;
  v48 = CFNumberCreate(v6, kCFNumberDoubleType, &valuePtr);
  v49 = CFNumberCreate(v6, kCFNumberDoubleType, &v66);
  v50 = v49;
  if (v48 && v49)
  {
    CFDictionarySetValue(v44, CFSTR("kConditionalConnectionRequirementTimeWindowDelay"), v48);
    CFDictionarySetValue(v44, CFSTR("kConditionalConnectionRequirementTimeWindowDuration"), v50);
    v51 = (void *)MEMORY[0x1E0C99D68];
    -[NSURLSessionTask startTime](self, "startTime");
    v53 = v52;
    -[NSURLSessionTask _timeWindowDelay](self, "_timeWindowDelay");
    CFDictionarySetValue(v44, CFSTR("kConditionalConnectionRequirementTimeWindowStartTime"), (const void *)objc_msgSend(v51, "dateWithTimeIntervalSinceReferenceDate:", v53 + v54));
  }
  else if (!v48)
  {
    goto LABEL_183;
  }
  CFRelease(v48);
LABEL_183:
  if (v50)
    CFRelease(v50);
LABEL_185:
  if (v45)
    CFDictionarySetValue(v44, CFSTR("kConditionalConnectionIdentifier"), v45);
  if (-[NSURLSessionConfiguration _requiresPowerPluggedIn](self->_effectiveConfiguration, "_requiresPowerPluggedIn"))
  {
    CFDictionarySetValue(v44, CFSTR("kConditionalConnectionRequirementPowerPluggedIn"), *v12);
    legacySocketStreamProperties = self->_legacySocketStreamProperties;
    if (legacySocketStreamProperties)
    {
      if (-[NSDictionary objectForKeyedSubscript:](legacySocketStreamProperties, "objectForKeyedSubscript:", 0x1EDCFB868))
      {
        v56 = (void *)-[NSDictionary mutableCopy](self->_legacySocketStreamProperties, "mutableCopy");
        v57 = (void *)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_legacySocketStreamProperties, "objectForKeyedSubscript:", 0x1EDCFB868), "mutableCopy");
        objc_msgSend(v57, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("kConditionalConnectionRequirementPowerPluggedIn"));
        objc_msgSend(v56, "setObject:forKeyedSubscript:", v57, 0x1EDCFB868);
        -[NSURLSessionTask set_legacySocketStreamProperties:](self, "set_legacySocketStreamProperties:", v56);

      }
    }
  }
  if (v44)
  {
    if (CFDictionaryGetCount(v44))
      CFDictionarySetValue(v8, &unk_1EDCFB868, v44);
    CFRelease(v44);
  }
  if (-[NSURLSessionTask _legacySocketStreamProperties](self, "_legacySocketStreamProperties"))
  {
    v58 = -[NSURLSessionTask _legacySocketStreamProperties](self, "_legacySocketStreamProperties");
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __47__NSURLSessionTask__copySocketStreamProperties__block_invoke;
    v61[3] = &__block_descriptor_40_e15_v32__0_8_16_B24l;
    v61[4] = v8;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v58, "enumerateKeysAndObjectsUsingBlock:", v61);
  }
  -[NSURLSessionTask set_cachedSocketStreamProperties:](self, "set_cachedSocketStreamProperties:", v8);
  return v8;
}

- (NSURLSessionConfiguration)_effectiveConfiguration
{
  return self->_effectiveConfiguration;
}

- (int)_allowsExpensiveOverride
{
  return self->_allowsExpensiveOverride;
}

- (unint64_t)_attribution
{
  return self->_attribution;
}

- (int)_allowsConstrainedOverride
{
  return self->_allowsConstrainedOverride;
}

- (BOOL)_preventsAppSSO
{
  return self->_preventsAppSSO;
}

- (NSURL)currentRequest_URL
{
  return -[NSURLRequest URL](-[NSURLSessionTask currentRequest](self, "currentRequest"), "URL");
}

- (NSURLRequest)currentRequest
{
  return (NSURLRequest *)objc_getProperty(self, a2, 168, 1);
}

- (NSString)_trackerContext
{
  return (NSString *)objc_getProperty(self, a2, 736, 1);
}

- (NSDictionary)_legacySocketStreamProperties
{
  return self->_legacySocketStreamProperties;
}

- (int)_allowsCellularOverride
{
  return self->_allowsCellularOverride;
}

- (BOOL)_useEnhancedPrivacyMode
{
  return self->_useEnhancedPrivacyMode;
}

- (double)_timeWindowDuration
{
  return self->_timeWindowDuration;
}

- (double)_timeWindowDelay
{
  return self->_timeWindowDelay;
}

- (NSString)_sourceApplicationBundleIdentifierForMobileAsset
{
  return self->_sourceApplicationBundleIdentifierForMobileAsset;
}

- (int)_requiresDNSSECValidation
{
  return self->_requiresDNSSECValidation;
}

- (BOOL)_prohibitPrivacyProxy
{
  return self->_prohibitPrivacyProxy;
}

- (BOOL)_privacyProxyFailClosed
{
  return self->_privacyProxyFailClosed;
}

- (BOOL)_privacyProxyFailClosedForUnreachableNonMainHosts
{
  return self->_privacyProxyFailClosedForUnreachableNonMainHosts;
}

- (BOOL)_privacyProxyFailClosedForUnreachableHosts
{
  return self->_privacyProxyFailClosedForUnreachableHosts;
}

- (BOOL)_isWebSearchContent
{
  return self->_isWebSearchContent;
}

- (BOOL)_isKnownTracker
{
  return self->_isKnownTracker;
}

- (OS_nw_endpoint)_hostOverride
{
  return self->_hostOverride;
}

- (BOOL)_failInsecureLoadWithHTTPSDNSRecord
{
  return self->_failInsecureLoadWithHTTPSDNSRecord;
}

- (BOOL)_disallowCellular
{
  return self->_disallowCellular;
}

- (NSString)_boundInterfaceIdentifier
{
  return self->_boundInterfaceIdentifier;
}

- (BOOL)_blockTrackers
{
  return self->_blockTrackers;
}

- (int)_networkServiceType
{
  return self->_networkServiceType;
}

- (NSURLSessionTask)initWithOriginalRequest:(id)a3 ident:(unint64_t)a4 taskGroup:(id)a5
{
  NSURLSessionTask *v8;
  uint64_t v9;
  double v10;
  double v11;
  _BOOL4 v12;
  uint64_t v13;
  __NSCFResumableUploadState *v14;
  NSURLRequest *v15;
  NSURLRequest *v16;
  NSURLSessionTask *v17;
  const char *v18;
  __NSCFResumableUploadState *v19;
  SEL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  char v25;
  NSObject *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  uint8_t buf[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = -[NSURLSessionTask initWithTaskGroup:](self, "initWithTaskGroup:", a5);
  if (v8)
  {
    v8->_effectiveConfiguration = (NSURLSessionConfiguration *)(id)objc_msgSend(a5, "_groupConfiguration");
    v9 = objc_msgSend(a3, "copy");
    v8->_originalRequest = (NSURLRequest *)v9;
    -[NSURLSessionTask updateCurrentRequest:](v8, "updateCurrentRequest:", v9);
    v8->_taskIdentifier = a4;
    v8->_uniqueIdentifier = (NSUUID *)(id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v8->_startTime = v10;
    v8->_state = 1;
    -[NSURLSessionConfiguration timeoutIntervalForResource](v8->_effectiveConfiguration, "timeoutIntervalForResource");
    v8->_timeoutIntervalForResource_ivar = v11;
    if (-[NSURLSessionConfiguration _appleIDContext](v8->_effectiveConfiguration, "_appleIDContext")
      || -[NSURLSessionConfiguration _authenticatorStatusCodes](v8->_effectiveConfiguration, "_authenticatorStatusCodes"))
    {
      -[NSURLSessionTask initializeHTTPAuthenticatorWithAppleIDContext:statusCodes:](v8, "initializeHTTPAuthenticatorWithAppleIDContext:statusCodes:", -[NSURLSessionConfiguration _appleIDContext](v8->_effectiveConfiguration, "_appleIDContext"), -[NSURLSessionConfiguration _authenticatorStatusCodes](v8->_effectiveConfiguration, "_authenticatorStatusCodes"));
    }
    v8->_countOfBytesClientExpectsToSend = -1;
    v8->_countOfBytesClientExpectsToReceive = -1;
    v12 = -[NSURLSessionConfiguration _requiresSustainedDataDelivery](v8->_effectiveConfiguration, "_requiresSustainedDataDelivery");
    v8->_legacySocketStreamProperties = 0;
    v13 = 0x200000;
    if (v12)
      v13 = 0x10000;
    v8->_strictContentLength = 1;
    v8->_qos = 0;
    v8->_voucher = 0;
    v8->_suspensionThreshhold = v13;
    v8->_requestPriority = -1;
    v8->_priorityValue = 300;
    v8->_loadingPriorityValue = 0.5;
    v8->_networkServiceType = 0;
    v8->_priorityAPIStorage = 0.5;
    v8->_prefersIncrementalDeliveryAPIStorage = 1;
    *(_DWORD *)&v8->__TLSMinimumSupportedProtocolVersion = 0;
    v8->_shouldSkipPreferredClientCertificateLookup = -[NSURLSessionConfiguration _shouldSkipPreferredClientCertificateLookup](v8->_effectiveConfiguration, "_shouldSkipPreferredClientCertificateLookup");
    v8->_preventsSystemHTTPProxyAuthentication = -[NSURLSessionConfiguration _preventsSystemHTTPProxyAuthentication](v8->_effectiveConfiguration, "_preventsSystemHTTPProxyAuthentication");
    v8->_requiresSecureHTTPSProxyConnection = -[NSURLSessionConfiguration _requiresSecureHTTPSProxyConnection](v8->_effectiveConfiguration, "_requiresSecureHTTPSProxyConnection");
    v8->_preventsAppSSO = -[NSURLSessionConfiguration _preventsAppSSO](v8->_effectiveConfiguration, "_preventsAppSSO");
    v8->_discretionaryOverride = 0;
    v8->_unfair_lock._os_unfair_lock_opaque = 0;
    *(_DWORD *)&v8->_extractorFinishedDecoding = 0;
    if (__CFNIsRunningInXcode::envCheckOnce != -1)
      dispatch_once(&__CFNIsRunningInXcode::envCheckOnce, &__block_literal_global_29);
    if ((__CFNIsRunningInXcode::runningInXcode & 1) != 0 || ne_tracker_should_save_stacktrace())
    {
      *(_QWORD *)buf = 0;
      -[NSURLSessionTask set_backtrace:](v8, "set_backtrace:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", ne_tracker_copy_current_stacktrace(), 0));
    }
    v8->_metrics = (__CFN_TaskMetrics *)-[__CFN_TaskMetrics initWithTask:]((char *)[__CFN_TaskMetrics alloc], v8);
    v14 = [__NSCFResumableUploadState alloc];
    v15 = v8->_originalRequest;
    v16 = v15;
    if (!v14)
    {
      v19 = 0;
      goto LABEL_31;
    }
    if (v15)
    {
      v32.receiver = v14;
      v32.super_class = (Class)__NSCFResumableUploadState;
      v17 = -[NSURLSessionTask init](&v32, sel_init);
      v19 = (__NSCFResumableUploadState *)v17;
      if (!v17)
      {
LABEL_31:

        v8->_resumableUploadState = v19;
        return v8;
      }
      HIDWORD(v17->_uploadProgress) = 0;
      objc_setProperty_atomic(v17, v18, CFSTR("5"), 56);
      objc_setProperty_atomic_copy(v19, v20, v16, 32);
      v19->_bodyType = -1;
      v19->_offset = 0;
      v19->_streamLength = -1;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      -[NSURLRequest allHTTPHeaderFields](v16, "allHTTPHeaderFields", 0);
      v14 = (__NSCFResumableUploadState *)objc_claimAutoreleasedReturnValue();
      v21 = -[__NSCFResumableUploadState countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, buf, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v29;
        while (2)
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v29 != v22)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "lowercaseString");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "hasPrefix:", CFSTR("upload-"));

            if ((v25 & 1) != 0)
            {
              v19->_userOverride = 1;
              goto LABEL_30;
            }
          }
          v21 = -[__NSCFResumableUploadState countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, buf, 16);
          if (v21)
            continue;
          break;
        }
      }
    }
    else
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v26 = (id)CFNLog::logger;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_183ECA000, v26, OS_LOG_TYPE_ERROR, "ResumableUploadState: cannot initWithOriginalRequest with nil request", buf, 2u);
      }

      v19 = 0;
    }
LABEL_30:

    goto LABEL_31;
  }
  return v8;
}

- (_CFHSTSPolicy)_copyHSTSPolicy
{
  _CFHSTSPolicy *result;

  if (!-[NSURLSessionTask _cfHSTS](self, "_cfHSTS"))
    return (_CFHSTSPolicy *)objc_msgSend((id)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration](-[NSURLSessionTask _taskGroup](self, "_taskGroup"), "_groupConfiguration"), "copyHSTSPolicy");
  result = -[NSURLSessionTask _cfHSTS](self, "_cfHSTS");
  if (result)
    return (_CFHSTSPolicy *)CFRetain(result);
  return result;
}

- (_CFHSTSPolicy)_cfHSTS
{
  return (_CFHSTSPolicy *)objc_getProperty(self, a2, 312, 1);
}

- (NSURLSessionTask)initWithTaskGroup:(id)a3
{
  NSURLSessionTask *v4;
  _QWORD *v5;
  id *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSURLSessionTask;
  v4 = -[NSURLSessionTask init](&v9, sel_init);
  if (v4)
  {
    v4->__taskGroup = (__NSURLSessionTaskGroupForConfiguration *)a3;
    v5 = (_QWORD *)objc_msgSend(a3, "_groupSession");
    v6 = -[__NSCFURLSessionDelegateWrapper initWithSession:]((id *)[__NSCFURLSessionDelegateWrapper alloc], v5);
    v4->_publicDelegateWrapper = (__NSCFURLSessionDelegateWrapper *)v6;
    if (v5)
      v7 = (void *)v5[9];
    else
      v7 = 0;
    -[__NSCFURLSessionDelegateWrapper setFallbackDelegateWrapper:]((uint64_t)v6, v7);
  }
  return v4;
}

- (NSString)_description
{
  NSURLSession *v3;
  const __CFString *v4;
  NSURLSession *v5;
  const __CFString *v6;
  double v7;

  v3 = -[NSURLSessionTask session](self, "session");
  if (v3)
  {
    v4 = CFSTR("Local");
    if (CFEqual(-[NSURLSessionConfiguration disposition](v3->_local_immutable_configuration_ivar, "disposition"), &unk_1EDD00610))
    {
      v5 = -[NSURLSessionTask session](self, "session");
      if (v5)
      {
        if (!-[NSURLSessionConfiguration _isProxySession](v5->_local_immutable_configuration_ivar, "_isProxySession"))
          v4 = CFSTR("Background");
      }
      else
      {
        v4 = CFSTR("Background");
      }
    }
  }
  else
  {
    v4 = CFSTR("Local");
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = CFSTR("Upload");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = CFSTR("WebSocket");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = CFSTR("Data");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v6 = CFSTR("Download");
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v6 = CFSTR("Stream");
          }
          else
          {
            v6 = &stru_1E1500C68;
            if (objc_opt_class())
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v6 = CFSTR("AVAssetDownload");
              }
              else
              {
                gotLoadHelper_x8__OBJC_CLASS___AVAggregateAssetDownloadTask(v7);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v6 = CFSTR("AVAggregateAssetDownload");
              }
            }
          }
        }
      }
    }
  }
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v4, v6, -[NSURLSessionTask _loggableDescription](self, "_loggableDescription"));
}

- (NSString)_loggableDescription
{
  NSURLSession *v3;
  NSString *v4;
  char v6[50];
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if (!self->_loggableDescription)
  {
    v3 = -[NSURLSessionTask session](self, "session");
    if (v3 && -[NSURLSessionConfiguration _isProxySession](v3->_local_immutable_configuration_ivar, "_isProxySession"))
    {
      v7 = 0;
      v8 = 0;
      strcpy(v6, "PDTask <00000000-0000-0000-0000-000000000000>.<0>");
      -[NSURLSessionTask fillTaskDescriptionWithTaskIdentifier:uniqueIdentifier:FixedTemplate:]((uint64_t)self, -[NSURLSessionTask taskIdentifier](self, "taskIdentifier", *(_OWORD *)v6, *(_QWORD *)&v6[16], *(_QWORD *)&v6[24], *(_QWORD *)&v6[32], *(_QWORD *)&v6[40], *(unsigned __int16 *)&v6[48], 0, 0, 0), -[NSURLSessionTask _uniqueIdentifier](self, "_uniqueIdentifier"), (uint64_t)&v6[7]);
      v4 = (NSString *)(id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v6, 1);
    }
    else
    {
      strcpy(v6, "Task <00000000-0000-0000-0000-000000000000>.<0>");
      -[NSURLSessionTask fillTaskDescriptionWithTaskIdentifier:uniqueIdentifier:FixedTemplate:]((uint64_t)self, -[NSURLSessionTask taskIdentifier](self, "taskIdentifier", *(_QWORD *)v6, *(_QWORD *)&v6[8], *(_QWORD *)&v6[16], *(_QWORD *)&v6[24], *(_QWORD *)&v6[32], *(_QWORD *)&v6[40], 0, unk_18411E4D8, 0, 0), -[NSURLSessionTask _uniqueIdentifier](self, "_uniqueIdentifier"), (uint64_t)&v6[5]);
      v4 = (NSString *)(id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v6, 1);
    }
    self->_loggableDescription = v4;
  }
  objc_sync_exit(self);
  return self->_loggableDescription;
}

- (OS_dispatch_queue)workQueue
{
  OS_dispatch_queue *result;

  result = -[NSURLSessionTask session](self, "session");
  if (result)
    return (OS_dispatch_queue *)*((_QWORD *)result + 15);
  return result;
}

- (NSURLSession)session
{
  return (NSURLSession *)-[__NSURLSessionTaskGroupForConfiguration _groupSession](-[NSURLSessionTask _taskGroup](self, "_taskGroup"), "_groupSession");
}

- (__NSURLSessionTaskGroupForConfiguration)_taskGroup
{
  return (__NSURLSessionTaskGroupForConfiguration *)objc_getProperty(self, a2, 584, 1);
}

- (__CFDictionary)_copyATSState
{
  __CFDictionary *result;
  NSURLSession *v4;
  NSURLSession *v5;
  NSDictionary *atsState_ivar;
  const __CFData *DictionaryFromData;

  result = self->_atsStateCache;
  if (result)
    return (__CFDictionary *)CFRetain(result);
  result = createDictionaryFromData((const __CFData *)objc_msgSend((id)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration](-[NSURLSessionTask _taskGroup](self, "_taskGroup"), "_groupConfiguration"), "_atsContext"));
  if (result)
    goto LABEL_9;
  v4 = -[NSURLSessionTask session](self, "session");
  if (v4)
  {
    v5 = v4;
    atsState_ivar = v4->_atsState_ivar;
    if (atsState_ivar)
      goto LABEL_14;
    DictionaryFromData = createDictionaryFromData((const __CFData *)-[NSURLSessionConfiguration _atsContext](v5->_local_immutable_configuration_ivar, "_atsContext"));
    if (DictionaryFromData)
    {
      v5->_atsState_ivar = (NSDictionary *)DictionaryFromData;
      CFRelease(DictionaryFromData);
    }
    atsState_ivar = v5->_atsState_ivar;
    if (atsState_ivar)
    {
LABEL_14:
      result = (__CFDictionary *)CFRetain(atsState_ivar);
      if (result)
      {
LABEL_9:
        self->_atsStateCache = result;
        return (__CFDictionary *)CFRetain(result);
      }
    }
  }
  result = self->_atsStateCache;
  if (result)
    return (__CFDictionary *)CFRetain(result);
  return result;
}

- (NSUInteger)taskIdentifier
{
  return self->_taskIdentifier;
}

- (NSUUID)_uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (unint64_t)_expectedProgressTarget
{
  return self->_expectedProgressTargetValue;
}

- (__CFSet)_getAuthenticatorStatusCodes
{
  return (__CFSet *)-[NSURLSessionTaskHTTPAuthenticator statusCodes](-[NSURLSessionTask authenticator](self, "authenticator"), "statusCodes");
}

- (NSURLSessionTaskHTTPAuthenticator)authenticator
{
  return (NSURLSessionTaskHTTPAuthenticator *)objc_getProperty(self, a2, 456, 1);
}

- (id)_httpConnectionInfoCompletionBlock
{
  return self->_httpConnectionInfoCompletionBlock;
}

- (const)_createXCredentialStorage
{
  _CFURLCredentialStorage *v3;
  _CFURLCredentialStorage *v4;
  const XCredentialStorage *result;
  NSURLCredentialStorage *v6;
  NSURLCredentialStorage *v7;
  NSXCredentialStorage *v8;

  if (-[NSURLSessionTask _cfCreds](self, "_cfCreds"))
  {
    v3 = -[NSURLSessionTask _cfCreds](self, "_cfCreds");
    return (const XCredentialStorage *)XCredentialStorage::createCFXCredentialStorage((XCredentialStorage *)v3, v4);
  }
  else
  {
    v6 = -[NSURLSessionConfiguration URLCredentialStorage](self->_effectiveConfiguration, "URLCredentialStorage");
    if (v6)
    {
      v7 = v6;
      v8 = (NSXCredentialStorage *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 32, 0);
      *(_OWORD *)v8 = 0u;
      *((_OWORD *)v8 + 1) = 0u;
      NSXCredentialStorage::NSXCredentialStorage(v8, v7);
    }
    else
    {
      return (const XCredentialStorage *)XCredentialStorage::createEmptyXCredentialStorage(0);
    }
  }
  return result;
}

- (_CFURLCredentialStorage)_cfCreds
{
  return (_CFURLCredentialStorage *)objc_getProperty(self, a2, 328, 1);
}

- (NSData)_backtrace
{
  return self->_backtrace;
}

- (void)fillTaskDescriptionWithTaskIdentifier:(void *)a3 uniqueIdentifier:(uint64_t)a4 FixedTemplate:
{
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  unsigned __int8 uu[8];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    *(_QWORD *)uu = 0;
    v13 = 0;
    objc_msgSend(a3, "getUUIDBytes:", uu);
    uuid_unparse(uu, (char *)(a4 + 1));
    *(_BYTE *)(a4 + 37) = 62;
    if (a2)
    {
      v6 = 39;
      v7 = a2;
      do
      {
        ++v6;
        v8 = v7 >= 0xA;
        v7 /= 0xAuLL;
      }
      while (v8);
      v9 = v6 - 40;
      do
      {
        *(_BYTE *)(a4 + v6) = (a2 % 0xA) | 0x30;
        v10 = v6 - 39;
        --v6;
        a2 /= 0xAuLL;
      }
      while (v10 > 1);
      v11 = (v9 + 41);
    }
    else
    {
      v11 = 40;
    }
    *(_BYTE *)(a4 + v11) = 62;
  }
}

- (double)startTime
{
  return self->_startTime;
}

- (NSDictionary)_proxySettings
{
  return (NSDictionary *)objc_getProperty(self, a2, 368, 1);
}

- (OS_nw_activity)_private_nw_activity
{
  return (OS_nw_activity *)objc_getProperty(self, a2, 632, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 256, 1);
}

- (__CFN_TaskMetrics)_metrics
{
  return (__CFN_TaskMetrics *)objc_getProperty(self, a2, 616, 1);
}

- (void)_finishProgressReporting
{
  if (!self->_progressReportingFinished)
  {
    self->_progressReportingFinished = 1;
    if (!-[NSURLSessionTask error](self, "error"))
    {
      -[NSURLSessionTask _completeUploadProgress](self, "_completeUploadProgress");
      -[NSProgress setCompletedUnitCount:](self->_downloadProgress, "setCompletedUnitCount:", -[NSProgress totalUnitCount](self->_downloadProgress, "totalUnitCount"));
    }
    objc_sync_enter(self);
    -[NSProgress setCancellationHandler:](self->_progress, "setCancellationHandler:", 0);
    -[NSProgress setPausingHandler:](self->_progress, "setPausingHandler:", 0);
    -[NSProgress setResumingHandler:](self->_progress, "setResumingHandler:", 0);
    objc_sync_exit(self);
  }
}

- (void)_completeUploadProgress
{
  -[NSProgress setCompletedUnitCount:](self->_uploadProgress, "setCompletedUnitCount:", -[NSProgress totalUnitCount](self->_uploadProgress, "totalUnitCount"));
}

- (void)_logUnlistedTracker:(id)a3
{
  _BYTE *Property;

  if (a3)
  {
    Property = objc_getProperty(a3, a2, 88, 1);
    if (Property)
    {
      if (Property[20]
        && -[NSURLSessionTask _backtrace](self, "_backtrace")
        && !-[NSURLSessionConfiguration _skipsStackTraceCapture](-[NSURLSessionTask _effectiveConfiguration](self, "_effectiveConfiguration"), "_skipsStackTraceCapture"))
      {
        -[NSString UTF8String](-[NSURL host](-[NSURLRequest URL](-[NSURLSessionTask originalRequest](self, "originalRequest"), "URL"), "host"), "UTF8String");
        -[NSData bytes](-[NSURLSessionTask _backtrace](self, "_backtrace"), "bytes");
        -[NSData length](-[NSURLSessionTask _backtrace](self, "_backtrace"), "length");
        ne_tracker_create_xcode_issue();
      }
    }
  }
}

- (void)_resetTaskDelegate
{
  void *v3;
  void *v4;

  if (a1)
  {
    v3 = *(void **)(a1 + 696);
    if (v3)
      objc_setProperty_atomic(v3, a2, 0, 32);
    v4 = *(void **)(a1 + 704);
    if (v4)
      objc_setProperty_atomic(v4, a2, 0, 32);
  }
}

- (BOOL)_callCompletionHandlerInline
{
  return self->_callCompletionHandlerInline;
}

- (id)_protocolForTask
{
  return self->_protocolForTask;
}

- (void)set_protocolForTask:(id)a3
{
  self->_protocolForTask = a3;
}

- (unint64_t)_cachePolicy
{
  return self->_cachePolicy;
}

- (BOOL)_preconnect
{
  return self->_preconnect;
}

- (void)_withXURLCache:(id)a3
{
  _CFURLCache *v5;
  NSURLSession *v6;
  NSURLSession *v7;
  CFXURLCache *CFXURLCache;
  NSURLCache *v9;
  XURLCache *v10;
  NSURLSession *v11;
  NSURLSession *v12;
  CFXURLCache *v13;

  if (-[NSURLSessionTask _cfCache](self, "_cfCache"))
  {
    v5 = -[NSURLSessionTask _cfCache](self, "_cfCache");
    v6 = -[NSURLSessionTask session](self, "session");
    CFXURLCache = XURLCache::createCFXURLCache((XURLCache *)v5, v6, v7);
  }
  else
  {
    v9 = -[NSURLSessionConfiguration URLCache](self->_effectiveConfiguration, "URLCache");
    if (!v9)
      return;
    v10 = (XURLCache *)v9;
    v11 = -[NSURLSessionTask session](self, "session");
    CFXURLCache = XURLCache::createNSXURLCache(v10, v11, v12);
  }
  v13 = CFXURLCache;
  if (CFXURLCache)
  {
    (*((void (**)(id, CFXURLCache *))a3 + 2))(a3, CFXURLCache);
    (*(void (**)(CFXURLCache *))(*(_QWORD *)v13 + 8))(v13);
  }
}

- (_CFURLCache)_cfCache
{
  return (_CFURLCache *)objc_getProperty(self, a2, 320, 1);
}

- (BOOL)_strictContentLength
{
  return self->_strictContentLength;
}

- (void)set_proxyHandshakePending:(BOOL)a3
{
  self->_proxyHandshakePending = a3;
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 256);
}

- (void)setResponse:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (void)setCountOfBytesExpectedToReceive:(int64_t)a3
{
  self->_countOfBytesExpectedToReceive = a3;
}

- (void)setCountOfBytesSent:(int64_t)a3
{
  self->_countOfBytesSent = a3;
}

- (void)setCountOfBytesExpectedToSend:(int64_t)a3
{
  self->_countOfBytesExpectedToSend = a3;
}

- (void)set_trailers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 504);
}

- (void)set_TCPConnectionMetadata:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 496);
}

- (void)dealloc
{
  _CFHSTSPolicy *cfHSTS;
  _CFURLCache *cfCache;
  _CFURLCredentialStorage *cfCreds;
  OpaqueCFHTTPCookieStorage *cfCookies;
  NSProgress *uploadProgress;
  NSProgress *downloadProgress;
  __CFDictionary *atsStateCache;
  objc_super v10;

  -[NSURLSessionTask _onSessionQueue_cleanupAndBreakCycles](self, "_onSessionQueue_cleanupAndBreakCycles");

  cfHSTS = self->_cfHSTS;
  if (cfHSTS)
    CFRelease(cfHSTS);
  cfCache = self->_cfCache;
  if (cfCache)
    CFRelease(cfCache);
  cfCreds = self->_cfCreds;
  if (cfCreds)
    CFRelease(cfCreds);
  cfCookies = self->_cfCookies;
  if (cfCookies)
    CFRelease(cfCookies);

  uploadProgress = self->_uploadProgress;
  if (uploadProgress)
  {
    -[NSURLSessionTask removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, CFSTR("countOfBytesSent"));
    -[NSURLSessionTask removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, CFSTR("countOfBytesExpectedToSend"));
    uploadProgress = self->_uploadProgress;
  }

  downloadProgress = self->_downloadProgress;
  if (downloadProgress)
  {
    -[NSURLSessionTask removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, CFSTR("countOfBytesReceived"));
    -[NSURLSessionTask removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, CFSTR("countOfBytesExpectedToReceive"));
    downloadProgress = self->_downloadProgress;
  }

  -[NSURLSessionTask set_extractor:](self, "set_extractor:", 0);
  -[NSURLSessionTask set_hasSZExtractor:](self, "set_hasSZExtractor:", 0);
  -[NSURLSessionTask set_doesSZExtractorConsumeExtractedData:](self, "set_doesSZExtractorConsumeExtractedData:", 0);

  -[NSURLSessionTask set_APSRelayTopic:](self, "set_APSRelayTopic:", 0);
  atsStateCache = self->_atsStateCache;
  self->_atsStateCache = 0;
  if (atsStateCache)
    CFRelease(atsStateCache);
  -[NSURLSessionTask set_voucher:](self, "set_voucher:", 0);
  -[NSURLSessionTask set_httpConnectionInfoCompletionBlock:](self, "set_httpConnectionInfoCompletionBlock:", 0);

  -[NSURLSessionTask setEarliestBeginDate:](self, "setEarliestBeginDate:", 0);
  -[NSURLSessionTask set_nw_activity:](self, "set_nw_activity:", 0);
  -[NSURLSessionTask set_private_nw_activity:](self, "set_private_nw_activity:", 0);

  -[NSURLSessionTask set_cookieTransformCallback:](self, "set_cookieTransformCallback:", 0);
  -[NSURLSessionTask set_trackerContext:](self, "set_trackerContext:", 0);

  v10.receiver = self;
  v10.super_class = (Class)NSURLSessionTask;
  -[NSURLSessionTask dealloc](&v10, sel_dealloc);
}

- (void)set_hasSZExtractor:(BOOL)a3
{
  self->_hasSZExtractor = a3;
}

- (void)set_extractor:(id)a3
{
  STExtractor *extractor;
  id v6;

  extractor = self->_extractor;
  if (a3)
  {
    if (extractor != a3)
    {
      v6 = a3;

      self->_extractor = (STExtractor *)a3;
    }
    self->_hasSZExtractor = 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      self->_doesSZExtractorConsumeExtractedData = objc_msgSend(a3, "doesConsumeExtractedData");
    else
      self->_doesSZExtractorConsumeExtractedData = 0;
  }
  else
  {
    if (extractor)
    {

      self->_extractor = 0;
    }
    *(_WORD *)&self->_hasSZExtractor = 0;
  }
}

- (void)set_doesSZExtractorConsumeExtractedData:(BOOL)a3
{
  self->_doesSZExtractorConsumeExtractedData = a3;
}

- (void)setEarliestBeginDate:(NSDate *)earliestBeginDate
{
  objc_setProperty_atomic_copy(self, a2, earliestBeginDate, 600);
}

- (void)set_nw_activity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 624);
}

- (void)set_cookieTransformCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 720);
}

- (void)set_httpConnectionInfoCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (void)set_APSRelayTopic:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (void)setTaskDescription:(NSString *)taskDescription
{
  objc_setProperty_atomic_copy(self, a2, taskDescription, 144);
}

- (void)set_uniqueIdentifier:(id)a3
{
  NSString *loggableDescription;
  NSUUID *uniqueIdentifier;
  __CFN_TaskMetrics *v7;

  loggableDescription = self->_loggableDescription;
  self->_loggableDescription = 0;

  uniqueIdentifier = self->_uniqueIdentifier;
  self->_uniqueIdentifier = (NSUUID *)objc_msgSend(a3, "copy");

  v7 = -[NSURLSessionTask _metrics](self, "_metrics");
  if (v7)
    objc_storeStrong((id *)&v7->_UUID, a3);
}

- (void)set_metrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 616);
}

- (void)set_backgroundTransactionMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (void)setCountOfBytesClientExpectsToSend:(int64_t)countOfBytesClientExpectsToSend
{
  self->_countOfBytesClientExpectsToSend = countOfBytesClientExpectsToSend;
}

- (void)setCountOfBytesClientExpectsToReceive:(int64_t)countOfBytesClientExpectsToReceive
{
  self->_countOfBytesClientExpectsToReceive = countOfBytesClientExpectsToReceive;
}

- (const)_createXCookieStorage
{
  OpaqueCFHTTPCookieStorage *v3;
  _OWORD *v4;
  const XCookieStorage *result;
  NSHTTPCookieStorage *v6;
  const XCookieStorage *v7;

  if (-[NSURLSessionTask _cfCookies](self, "_cfCookies"))
  {
    v3 = -[NSURLSessionTask _cfCookies](self, "_cfCookies");
    v4 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 40, 0);
    *v4 = 0u;
    v4[1] = 0u;
    *((_QWORD *)v4 + 4) = 0;
    CFXCookieStorage::CFXCookieStorage((CFXCookieStorage *)v4, v3);
  }
  else
  {
    v6 = -[NSURLSessionConfiguration HTTPCookieStorage](self->_effectiveConfiguration, "HTTPCookieStorage");
    if (v6)
      XCookieStorage::createNSXCookieStorage((XCookieStorage *)v6, v7);
    else
      return (const XCookieStorage *)XCookieStorage::createEmptyXCookieStorage(0, v7);
  }
  return result;
}

- (OpaqueCFHTTPCookieStorage)_cfCookies
{
  return (OpaqueCFHTTPCookieStorage *)objc_getProperty(self, a2, 336, 1);
}

- (NSString)_storagePartitionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 424, 1);
}

- (NSURL)_siteForCookies
{
  return (NSURL *)objc_getProperty(self, a2, 560, 1);
}

- (NSURL)currentRequest_mainDocumentURL
{
  return -[NSURLRequest mainDocumentURL](-[NSURLSessionTask currentRequest](self, "currentRequest"), "mainDocumentURL");
}

- (int)_cookieAcceptPolicy
{
  return self->_cookieAcceptPolicy;
}

- (NSURLResponse)response
{
  return (NSURLResponse *)objc_getProperty(self, a2, 176, 1);
}

- (void)set_requestPriority:(int64_t)a3
{
  self->_requestPriority = a3;
}

- (id)_incompleteCurrentTaskTransactionMetrics
{
  NSURLSessionTaskTransactionMetrics *v3;
  __CFN_TaskMetrics *v4;
  const char *v5;
  id Property;

  v3 = [NSURLSessionTaskTransactionMetrics alloc];
  v4 = -[NSURLSessionTask _metrics](self, "_metrics");
  if (v4)
    Property = objc_getProperty(v4, v5, 96, 1);
  else
    Property = 0;
  return -[NSURLSessionTaskTransactionMetrics initWithMetrics:forCache:](v3, Property, 0);
}

void __26__NSURLSessionTask_resume__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;

  v2 = (void *)MEMORY[0x186DB8C8C]();
  v3 = objc_msgSend(*(id *)(a1 + 32), "_metrics");
  if (v3)
    v4 = *(double *)(v3 + 56);
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_resume", v4);
  objc_autoreleasePoolPop(v2);
}

- (__NSCFResumableUploadState)resumableUploadState
{
  return (__NSCFResumableUploadState *)objc_getProperty(self, a2, 264, 1);
}

- (BOOL)_cacheOnly
{
  return self->_cacheOnly;
}

- (void)setAuthenticator:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 456);
}

- (void)initializeHTTPAuthenticatorWithAppleIDContext:(id)a3 statusCodes:(id)a4
{
  -[NSURLSessionTask setAuthenticator:](self, "setAuthenticator:", +[NSURLSessionTaskHTTPAuthenticator sessionTaskHTTPAuthenticatorWithContext:statusCodes:](NSURLSessionTaskHTTPAuthenticator, "sessionTaskHTTPAuthenticatorWithContext:statusCodes:", a3, a4));
}

- (void)set_powerAssertionReleaseTime:(unint64_t)a3
{
  self->_powerAssertionReleaseTime = a3;
}

void __93__NSURLSessionTask_HTTPConnectionInfo__getUnderlyingHTTPConnectionInfoWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id Weak;
  uint64_t v5;
  _QWORD v6[6];

  Weak = objc_loadWeak((id *)(a1 + 40));
  if (a2)
    objc_storeWeak((id *)(a2 + 24), Weak);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __93__NSURLSessionTask_HTTPConnectionInfo__getUnderlyingHTTPConnectionInfoWithCompletionHandler___block_invoke_4;
  v6[3] = &unk_1E14FDF00;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  -[NSURLSession runDelegateBlock:]((uint64_t)Weak, v6);
}

- (BOOL)_isTopLevelNavigation
{
  return self->_isTopLevelNavigation;
}

- (void)getUnderlyingHTTPConnectionInfoWithCompletionHandler:(id)a3
{
  OS_dispatch_queue *v5;
  _QWORD v6[6];

  v5 = -[NSURLSessionTask workQueue](self, "workQueue");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __93__NSURLSessionTask_HTTPConnectionInfo__getUnderlyingHTTPConnectionInfoWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E14FDF00;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async((dispatch_queue_t)v5, v6);
}

- (STExtractor)_extractor
{
  return self->_extractor;
}

- (NSString)_pathToDownloadTaskFile
{
  return (NSString *)objc_getProperty(self, a2, 304, 1);
}

- (id)_cookieTransformCallback
{
  return self->_cookieTransformCallback;
}

- (void)set_bytesPerSecondLimit:(int64_t)a3
{
  OS_dispatch_queue *v5;
  _QWORD v6[6];

  self->_bytesPerSecondLimitValue = a3;
  if (-[NSURLSessionTask session](self, "session"))
  {
    v5 = -[NSURLSessionTask workQueue](self, "workQueue");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __44__NSURLSessionTask_set_bytesPerSecondLimit___block_invoke;
    v6[3] = &unk_1E14FE140;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async((dispatch_queue_t)v5, v6);
  }
}

void __93__NSURLSessionTask_HTTPConnectionInfo__getUnderlyingHTTPConnectionInfoWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id location;
  _QWORD v7[5];

  if (objc_msgSend(*(id *)(a1 + 32), "state") < 2)
  {
    objc_initWeak(&location, (id)objc_msgSend(*(id *)(a1 + 32), "session"));
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __93__NSURLSessionTask_HTTPConnectionInfo__getUnderlyingHTTPConnectionInfoWithCompletionHandler___block_invoke_3;
    v4[3] = &unk_1E14FDED8;
    objc_copyWeak(&v5, &location);
    v3 = *(void **)(a1 + 32);
    v4[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "set_httpConnectionInfoCompletionBlock:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "session");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __93__NSURLSessionTask_HTTPConnectionInfo__getUnderlyingHTTPConnectionInfoWithCompletionHandler___block_invoke_2;
    v7[3] = &unk_1E14FDEB0;
    v7[4] = *(_QWORD *)(a1 + 40);
    -[NSURLSession runDelegateBlock:](v2, v7);
  }
}

- (void)_adoptEffectiveConfiguration:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  _QWORD v6[6];

  v4 = +[NSURLSessionConfiguration immutableEffectiveConfigurationFromConfig:](NSURLSessionConfiguration, "immutableEffectiveConfigurationFromConfig:", a3);
  if (-[NSURLSessionTask workQueue](self, "workQueue"))
  {
    v5 = -[NSURLSessionTask workQueue](self, "workQueue");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __74__NSURLSessionTask__EffectiveConfiguration___adoptEffectiveConfiguration___block_invoke;
    v6[3] = &unk_1E14FDE88;
    v6[4] = self;
    v6[5] = v4;
    dispatch_async((dispatch_queue_t)v5, v6);
  }
  else
  {
    -[NSURLSessionTask _onqueue_adoptEffectiveConfiguration:](self, "_onqueue_adoptEffectiveConfiguration:", v4);
  }
}

- (void)cancel
{
  NSProgress *progress;
  OS_dispatch_queue *v4;
  _QWORD block[5];

  if (-[NSURLSessionTask state](self, "state") <= NSURLSessionTaskStateSuspended)
  {
    -[NSURLSessionTask setState:](self, "setState:", 2);
    objc_sync_enter(self);
    progress = self->_progress;
    if (progress)
    {
      if (!-[NSProgress isCancelled](progress, "isCancelled"))
        -[NSProgress cancel](self->_progress, "cancel");
    }
    objc_sync_exit(self);
    v4 = -[NSURLSessionTask workQueue](self, "workQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__NSURLSessionTask_cancel__block_invoke;
    block[3] = &unk_1E14FE118;
    block[4] = self;
    dispatch_async((dispatch_queue_t)v4, block);
  }
}

- (void)setPriority:(float)priority
{
  OS_dispatch_queue *v6;
  _QWORD v7[5];
  float v8;

  if (priority >= 0.0 && priority <= 1.0)
  {
    if (self)
    {
      if (self->_priorityAPIStorage == priority)
        return;
      self->_priorityAPIStorage = priority;
    }
    else if (priority == 0.0)
    {
      return;
    }
    if (-[NSURLSessionTask session](self, "session"))
    {
      v6 = -[NSURLSessionTask workQueue](self, "workQueue");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __32__NSURLSessionTask_setPriority___block_invoke;
      v7[3] = &unk_1E14FDF30;
      v7[4] = self;
      v8 = priority;
      dispatch_async((dispatch_queue_t)v6, v7);
    }
  }
}

- (void)set_priority:(int64_t)a3
{
  OS_dispatch_queue *v4;
  _QWORD block[5];

  -[NSURLSessionTask set_priorityValue:](self, "set_priorityValue:", a3);
  if (-[NSURLSessionTask session](self, "session"))
  {
    v4 = -[NSURLSessionTask workQueue](self, "workQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__NSURLSessionTask_set_priority___block_invoke;
    block[3] = &unk_1E14FE118;
    block[4] = self;
    dispatch_async((dispatch_queue_t)v4, block);
  }
}

- (void)set_priorityValue:(int64_t)a3
{
  self->_priorityValue = a3;
}

- (void)setDelegate:(id)delegate
{
  const char *v5;
  __NSCFURLSessionDelegateWrapper *publicDelegateWrapper;

  objc_sync_enter(self);
  if (self->_seenFirstResume)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Cannot set task delegate after resumption"), 0));
  publicDelegateWrapper = self->_publicDelegateWrapper;
  if (publicDelegateWrapper)
    objc_setProperty_atomic(publicDelegateWrapper, v5, delegate, 32);
  objc_sync_exit(self);
}

- (void)set_suspensionThreshhold:(int64_t)a3
{
  self->_suspensionThreshhold = a3;
}

- (NSURLSessionTaskState)state
{
  return self->_state;
}

- (void)setCountOfBytesReceived:(int64_t)a3
{
  self->_countOfBytesReceived = a3;
}

- (int64_t)countOfBytesReceived
{
  return self->_countOfBytesReceived;
}

- (void)_appendCountOfPendingBytesReceivedEncoded:(int64_t)a3
{
  os_unfair_lock_s *p_unfair_lock;

  p_unfair_lock = &self->_unfair_lock;
  os_unfair_lock_lock(&self->_unfair_lock);
  -[NSURLSessionTask set_countOfPendingBytesReceivedEncoded:](self, "set_countOfPendingBytesReceivedEncoded:", -[NSURLSessionTask _countOfPendingBytesReceivedEncoded](self, "_countOfPendingBytesReceivedEncoded") + a3);
  os_unfair_lock_unlock(p_unfair_lock);
}

- (void)_consumePendingBytesReceivedEncoded
{
  os_unfair_lock_s *p_unfair_lock;
  int64_t v4;

  p_unfair_lock = &self->_unfair_lock;
  os_unfair_lock_lock(&self->_unfair_lock);
  if (-[NSURLSessionTask _countOfPendingBytesReceivedEncoded](self, "_countOfPendingBytesReceivedEncoded"))
  {
    v4 = -[NSURLSessionTask _countOfPendingBytesReceivedEncoded](self, "_countOfPendingBytesReceivedEncoded");
    -[NSURLSessionTask set_countOfPendingBytesReceivedEncoded:](self, "set_countOfPendingBytesReceivedEncoded:", 0);
    os_unfair_lock_unlock(p_unfair_lock);
    if (v4)
      -[NSURLSessionTask set_countOfBytesReceivedEncoded:](self, "set_countOfBytesReceivedEncoded:", -[NSURLSessionTask _countOfBytesReceivedEncoded](self, "_countOfBytesReceivedEncoded") + v4);
  }
  else
  {
    os_unfair_lock_unlock(p_unfair_lock);
  }
}

- (int64_t)_countOfPendingBytesReceivedEncoded
{
  return self->__countOfPendingBytesReceivedEncoded;
}

- (void)set_countOfPendingBytesReceivedEncoded:(int64_t)a3
{
  self->__countOfPendingBytesReceivedEncoded = a3;
}

- (void)_onSessionQueue_cleanupAndBreakCycles
{
  unsigned int v3;
  NSString *v4;
  dispatch_time_t v5;
  OS_dispatch_queue *v6;
  unsigned int v7;
  dispatch_time_t v8;
  OS_dispatch_queue *v9;
  _QWORD v10[4];
  unsigned int v11;
  _QWORD block[5];
  unsigned int v13;

  if (-[NSURLSessionTask _powerAssertion](self, "_powerAssertion"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sPowerAssertionSetLock);
    if (-[NSURLSessionTask _powerAssertion](self, "_powerAssertion"))
    {
      v3 = -[NSURLSessionTask _powerAssertion](self, "_powerAssertion");
      -[NSURLSessionTask set_powerAssertion:](self, "set_powerAssertion:", 0);
      os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
      if (v3)
      {
        v4 = -[NSURLSessionTask _loggableDescription](self, "_loggableDescription");
        v5 = dispatch_time(0, 3000000000);
        v6 = -[NSURLSessionTask workQueue](self, "workQueue");
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __57__NSURLSessionTask__onSessionQueue_cleanupAndBreakCycles__block_invoke;
        block[3] = &unk_1E14FDF30;
        block[4] = v4;
        v13 = v3;
        dispatch_after(v5, (dispatch_queue_t)v6, block);
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
    }
  }
  if (-[NSURLSessionTask _darkWakePowerAssertion](self, "_darkWakePowerAssertion"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sPowerAssertionSetLock);
    if (-[NSURLSessionTask _darkWakePowerAssertion](self, "_darkWakePowerAssertion"))
    {
      v7 = -[NSURLSessionTask _darkWakePowerAssertion](self, "_darkWakePowerAssertion");
      -[NSURLSessionTask set_darkWakePowerAssertion:](self, "set_darkWakePowerAssertion:", 0);
      os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
      if (v7)
      {
        v8 = dispatch_time(0, 3000000000);
        v9 = -[NSURLSessionTask workQueue](self, "workQueue");
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __57__NSURLSessionTask__onSessionQueue_cleanupAndBreakCycles__block_invoke_82;
        v10[3] = &__block_descriptor_36_e5_v8__0l;
        v11 = v7;
        dispatch_after(v8, (dispatch_queue_t)v9, v10);
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
    }
  }
}

- (void)_releasePreventIdleSleepAssertionIfAppropriate
{
  dispatch_time_t v3;
  OS_dispatch_queue *v4;
  dispatch_time_t v5;
  OS_dispatch_queue *v6;
  _QWORD v7[5];
  _QWORD block[5];

  if (-[NSURLSessionTask _powerAssertion](self, "_powerAssertion"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sPowerAssertionSetLock);
    if (-[NSURLSessionTask _powerAssertion](self, "_powerAssertion"))
    {
      -[NSURLSessionTask set_powerAssertionReleaseTime:](self, "set_powerAssertionReleaseTime:", clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) + 3000000000u);
      v3 = dispatch_time(0, 3000000000);
      v4 = -[NSURLSessionTask workQueue](self, "workQueue");
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __66__NSURLSessionTask__releasePreventIdleSleepAssertionIfAppropriate__block_invoke;
      block[3] = &unk_1E14FE118;
      block[4] = self;
      dispatch_after(v3, (dispatch_queue_t)v4, block);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
  }
  if (-[NSURLSessionTask _darkWakePowerAssertion](self, "_darkWakePowerAssertion"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sPowerAssertionSetLock);
    if (-[NSURLSessionTask _darkWakePowerAssertion](self, "_darkWakePowerAssertion"))
    {
      -[NSURLSessionTask set_darkWakePowerAssertionReleaseTime:](self, "set_darkWakePowerAssertionReleaseTime:", clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) + 3000000000u);
      v5 = dispatch_time(0, 3000000000);
      v6 = -[NSURLSessionTask workQueue](self, "workQueue");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __66__NSURLSessionTask__releasePreventIdleSleepAssertionIfAppropriate__block_invoke_81;
      v7[3] = &unk_1E14FE118;
      v7[4] = self;
      dispatch_after(v5, (dispatch_queue_t)v6, v7);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
  }
}

- (unsigned)_powerAssertion
{
  return self->_powerAssertion;
}

- (unsigned)_darkWakePowerAssertion
{
  return self->_darkWakePowerAssertion;
}

- (int64_t)_countOfBytesReceivedEncoded
{
  return self->__countOfBytesReceivedEncoded;
}

- (void)set_countOfBytesReceivedEncoded:(int64_t)a3
{
  self->__countOfBytesReceivedEncoded = a3;
}

- (void)resume
{
  NSObject *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSURLSessionTask *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  NSURLSessionTask *v13;
  uint64_t v14;
  _BYTE *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  NSObject *v46;
  int v47;
  uint64_t v48;
  NSProgress *progress;
  uint64_t v50;
  uint64_t v51;
  int is_selected_for_reporting;
  NSObject *v53;
  _BOOL4 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  os_signpost_id_t spid;
  os_signpost_id_t spida;
  _QWORD block[5];
  uint8_t buf[4];
  _BYTE v69[20];
  _BYTE v70[10];
  _BYTE v71[6];
  _BYTE v72[10];
  int v73;
  __int16 v74;
  _QWORD *v75;
  _QWORD v76[2];
  _QWORD v77[2];
  _QWORD v78[4];

  v78[2] = *MEMORY[0x1E0C80C00];
  if (-[NSURLSessionTask state](self, "state") > NSURLSessionTaskStateSuspended
    || !-[NSURLSessionTask workQueue](self, "workQueue"))
  {
    return;
  }
  -[NSURLSessionTask setState:](self, "setState:", 0);
  -[NSURLSessionTask set_qos:](self, "set_qos:", qos_class_self());
  -[NSURLSessionTask set_voucher:](self, "set_voucher:", (id)voucher_copy());
  v76[0] = 0;
  v76[1] = 0;
  if (-[NSURLSessionTask _nw_activity](self, "_nw_activity"))
  {
    -[NSURLSessionTask _nw_activity](self, "_nw_activity");
    nw_activity_activate();
    -[NSURLSessionTask _nw_activity](self, "_nw_activity");
    nw_activity_get_token();
  }
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v3 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[NSURLSessionTask _loggableDescription](self, "_loggableDescription");
    -[NSURLSessionTask _timeoutInterval](self, "_timeoutInterval");
    v6 = v5;
    -[NSURLSessionTask _timeoutIntervalForResource](self, "_timeoutIntervalForResource");
    *(_DWORD *)buf = 138544898;
    *(_QWORD *)v69 = v4;
    *(_WORD *)&v69[8] = 2048;
    *(_QWORD *)&v69[10] = v6;
    *(_WORD *)&v69[18] = 2048;
    *(_QWORD *)v70 = v7;
    *(_WORD *)&v70[8] = 1024;
    *(_DWORD *)v71 = -[NSURLSessionTask _qos](self, "_qos");
    *(_WORD *)&v71[4] = 2112;
    *(_QWORD *)v72 = -[NSURLSessionTask _voucher](self, "_voucher");
    *(_WORD *)&v72[8] = 1042;
    v73 = 16;
    v74 = 2098;
    v75 = v76;
    _os_log_impl(&dword_183ECA000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ resuming, timeouts(%.1f, %.1f) qos(0x%x) voucher(%@) activity(%{public,uuid_t}.16P)", buf, 0x40u);
  }
  v8 = self;
  -[NSURLSessionTask _effectiveConfiguration](v8, "_effectiveConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = HARLoggingEnabled(objc_msgSend(v9, "_pidForHAR"));

  if (!v10 || -[NSURLSessionTask _isAVAssetTask](v8, "_isAVAssetTask"))
    goto LABEL_32;
  instrumentsTaskLog();
  v11 = objc_claimAutoreleasedReturnValue();
  -[NSURLSessionTask _uniqueIdentifier](v8, "_uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_make_with_pointer(v11, v12);

  v13 = v8;
  -[NSURLSessionTask session](v13, "session");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (_BYTE *)v14;
  if (v14)
    v16 = *(void **)(v14 + 112);
  else
    v16 = 0;
  v17 = v16;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSURLSessionTask taskIdentifier](v13, "taskIdentifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("taskIdentifier"));

  -[NSURLSessionTask taskDescription](v13, "taskDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("taskDescription"));

  -[NSURLSessionTask originalRequest](v13, "originalRequest");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "URL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "absoluteString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, CFSTR("url"));

  -[NSURLSessionTask originalRequest](v13, "originalRequest");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "HTTPMethod");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v25, CFSTR("method"));

  v26 = (void *)MEMORY[0x1E0CB37E8];
  -[NSURLSessionTask originalRequest](v13, "originalRequest");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v27, "attribution"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v28, CFSTR("attribution"));

  if (v15)
    v29 = v15[68] & 1;
  else
    v29 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v29, spid);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v30, CFSTR("isSharedSession"));

  objc_msgSend(v15, "sessionDescription");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v31, CFSTR("sessionDescription"));

  v32 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v17, "disposition");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "numberWithBool:", objc_msgSend(v33, "isEqualToString:", 0x1EDD006B8));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v34, CFSTR("isEphemeralSession"));

  objc_msgSend(v17, "identifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v35, CFSTR("backgroundIdentifier"));

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = CFSTR("Data");
LABEL_25:
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v36, CFSTR("taskType"));
    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = CFSTR("Upload");
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = CFSTR("Download");
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = CFSTR("Stream");
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = CFSTR("WebSocket");
    goto LABEL_25;
  }
LABEL_26:
  -[NSURLSessionTask _effectiveConfiguration](v13, "_effectiveConfiguration");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "_sourceApplicationBundleIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v38, CFSTR("sourceApplicationBundleIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v18, 0, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = 0;
  v78[1] = 0;
  -[NSURLSessionTask _uniqueIdentifier](v13, "_uniqueIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "getUUIDBytes:", v78);

  v77[0] = 0;
  v77[1] = 0;
  -[NSURLSessionTask session](v13, "session");
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = (void *)v41;
  if (v41)
    v43 = *(void **)(v41 + 128);
  else
    v43 = 0;
  v44 = v43;
  objc_msgSend(v44, "getUUIDBytes:", v77);

  instrumentsTaskLog();
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = v45;
  if (spida - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
  {
    v47 = objc_msgSend(v39, "length");
    v48 = objc_msgSend(objc_retainAutorelease(v39), "bytes");
    *(_DWORD *)buf = 68290050;
    *(_DWORD *)v69 = 16;
    *(_WORD *)&v69[4] = 2098;
    *(_QWORD *)&v69[6] = v78;
    *(_WORD *)&v69[14] = 1042;
    *(_DWORD *)&v69[16] = 16;
    *(_WORD *)v70 = 2098;
    *(_QWORD *)&v70[2] = v77;
    *(_WORD *)v71 = 1040;
    *(_DWORD *)&v71[2] = v47;
    *(_WORD *)v72 = 2082;
    *(_QWORD *)&v72[2] = v48;
    _os_signpost_emit_with_name_impl(&dword_183ECA000, v46, OS_SIGNPOST_EVENT, spida, "Task Resume", "Task UUID: %{public,uuid_t}.16P, Session UUID: %{public,uuid_t}.16P, Additional Info: %{public,xcode:data}.*s", buf, 0x32u);
  }

LABEL_32:
  objc_sync_enter(v8);
  progress = v8->_progress;
  if (progress
    && !-[NSProgress isCancelled](progress, "isCancelled")
    && -[NSProgress isPaused](v8->_progress, "isPaused"))
  {
    -[NSProgress resume](v8->_progress, "resume");
  }
  if (v8->_seenFirstResume)
    goto LABEL_73;
  v8->_seenFirstResume = 1;
  v50 = -[NSURLSessionTask session](v8, "session");
  if (v50 && CFEqual((CFTypeRef)objc_msgSend(*(id *)(v50 + 112), "disposition"), &unk_1EDD00610)
    || (-[NSURLSessionTask set_private_nw_activity:](v8, "set_private_nw_activity:", -[NSURLSessionTask _nw_activity](v8, "_nw_activity")), !-[NSURLSessionTask _nw_activity](v8, "_nw_activity")))
  {
    -[NSURLSessionTask set_private_nw_activity:](v8, "set_private_nw_activity:", (id)nw_activity_create());
  }
  if (-[NSURLSessionTask _nw_activity](v8, "_nw_activity"))
  {
    v51 = -[NSURLSessionTask session](v8, "session");
    if (v51)
    {
      if (CFEqual((CFTypeRef)objc_msgSend(*(id *)(v51 + 112), "disposition"), &unk_1EDD00610))
      {
        -[NSURLSessionTask _private_nw_activity](v8, "_private_nw_activity");
        -[NSURLSessionTask _nw_activity](v8, "_nw_activity");
        nw_activity_set_parent_activity();
      }
    }
  }
  if (-[NSURLSessionTask _private_nw_activity](v8, "_private_nw_activity"))
  {
    -[NSURLSessionTask _private_nw_activity](v8, "_private_nw_activity");
    nw_activity_activate();
    -[NSURLSessionTask _private_nw_activity](v8, "_private_nw_activity");
    is_selected_for_reporting = nw_activity_is_selected_for_reporting();
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v53 = CFNLog::logger;
    v54 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG);
    if (!is_selected_for_reporting)
    {
      if (v54)
      {
        v57 = -[NSURLSessionTask _private_nw_activity](v8, "_private_nw_activity");
        v58 = -[NSURLSessionTask _loggableDescription](v8, "_loggableDescription");
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)v69 = v57;
        *(_WORD *)&v69[8] = 2114;
        *(_QWORD *)&v69[10] = v58;
        _os_log_debug_impl(&dword_183ECA000, v53, OS_LOG_TYPE_DEBUG, "[Telemetry]: Activity %{public}@ on %{public}@ was not selected for reporting", buf, 0x16u);
      }
      goto LABEL_67;
    }
    if (v54)
    {
      v63 = -[NSURLSessionTask _private_nw_activity](v8, "_private_nw_activity");
      v64 = -[NSURLSessionTask _loggableDescription](v8, "_loggableDescription");
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)v69 = v63;
      *(_WORD *)&v69[8] = 2114;
      *(_QWORD *)&v69[10] = v64;
      _os_log_debug_impl(&dword_183ECA000, v53, OS_LOG_TYPE_DEBUG, "[Telemetry]: Activity %{public}@ on %{public}@ was selected for reporting", buf, 0x16u);
    }
    if (-[NSURLSessionTask _DuetActivityProperties](v8, "_DuetActivityProperties"))
    {
      if (objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[NSURLSessionTask _legacySocketStreamProperties](v8, "_legacySocketStreamProperties"), "objectForKeyedSubscript:", 0x1EDCFB868), "objectForKeyedSubscript:", CFSTR("kConditionalConnectionInTransitionalDiscretionaryPeriod")))
      {
        v55 = -[NSURLSessionTask _metrics](v8, "_metrics");
        if (v55)
        {
          v56 = 5;
LABEL_66:
          *(_QWORD *)(v55 + 88) = v56;
        }
      }
      else
      {
        if (-[NSURLSessionConfiguration isDiscretionary](v8->_effectiveConfiguration, "isDiscretionary"))
        {
          if (-[NSURLSessionConfiguration _clientIsNotExplicitlyDiscretionary](v8->_effectiveConfiguration, "_clientIsNotExplicitlyDiscretionary"))
          {
            v59 = 3;
          }
          else
          {
            v59 = 2;
          }
          v60 = -[NSURLSessionTask _metrics](v8, "_metrics");
          if (v60)
            *(_QWORD *)(v60 + 88) = v59;
          goto LABEL_67;
        }
        v55 = -[NSURLSessionTask _metrics](v8, "_metrics");
        if (v55)
        {
          v56 = 4;
          goto LABEL_66;
        }
      }
    }
  }
LABEL_67:
  if (!-[NSURLSessionTask _isAVAssetTask](v8, "_isAVAssetTask")
    && !-[NSURLSessionTask currentRequest_URL](v8, "currentRequest_URL"))
  {
    if (__CFNAPIMisuseFaultLogHandle::onceToken != -1)
      dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_7_4765);
    v61 = __CFNAPIMisuseFaultLogHandle::logger;
    if (os_log_type_enabled((os_log_t)__CFNAPIMisuseFaultLogHandle::logger, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_183ECA000, v61, OS_LOG_TYPE_FAULT, "API MISUSE: Resuming an NSURLSessionTask with nil URL.", buf, 2u);
    }
  }
LABEL_73:
  objc_sync_exit(v8);
  if (nw_settings_get_signposts_enabled())
    kdebug_trace();
  v62 = -[NSURLSessionTask workQueue](v8, "workQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__NSURLSessionTask_resume__block_invoke;
  block[3] = &unk_1E14FE118;
  block[4] = v8;
  dispatch_async(v62, block);
}

- (OS_voucher)_voucher
{
  return (OS_voucher *)objc_getProperty(self, a2, 384, 1);
}

- (unsigned)_qos
{
  return self->_qos;
}

- (OS_nw_activity)_nw_activity
{
  return (OS_nw_activity *)objc_getProperty(self, a2, 624, 1);
}

- (void)set_private_nw_activity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 632);
}

- (double)_timeoutIntervalForResource
{
  return self->_timeoutIntervalForResource_ivar;
}

- (void)set_voucher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void)set_qos:(unsigned int)a3
{
  self->_qos = a3;
}

- (BOOL)_isAVAssetTask
{
  return 0;
}

- (int64_t)computeAdjustedPoolPriority
{
  double v3;
  double v4;

  v3 = (double)-[NSURLSessionTask _priorityValue](self, "_priorityValue");
  -[NSURLSessionTask _loadingPriorityValue](self, "_loadingPriorityValue");
  return (uint64_t)(v3 + (0.5 - v4) * 50.0);
}

- (int64_t)_priorityValue
{
  return self->_priorityValue;
}

- (double)_loadingPriorityValue
{
  return self->_loadingPriorityValue;
}

- (NSURLRequest)originalRequest
{
  return (NSURLRequest *)objc_getProperty(self, a2, 160, 1);
}

- (BOOL)_appleIDContextRedirect
{
  return self->_appleIDContextRedirect;
}

- (BOOL)_appSSOFallback
{
  return self->_appSSOFallback;
}

- (void)_getAuthenticationHeadersForResponse:(_CFURLResponse *)a3 completionHandler:(id)a4
{
  OS_dispatch_queue *v7;
  _QWORD block[7];

  if (-[NSURLSessionTask authenticator](self, "authenticator"))
  {
    if (a3)
      a3 = +[NSURLResponse _responseWithCFURLResponse:](NSHTTPURLResponse, "_responseWithCFURLResponse:", a3);
    v7 = -[NSURLSessionTask workQueue](self, "workQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__NSURLSessionTask__getAuthenticationHeadersForResponse_completionHandler___block_invoke;
    block[3] = &unk_1E14FE070;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async((dispatch_queue_t)v7, block);
  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD, _QWORD))a4 + 2))(a4, 1, 0, 0);
  }
}

- (int64_t)countOfBytesSent
{
  return self->_countOfBytesSent;
}

uint64_t __33__NSURLSessionTask_set_priority___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_adjustPoolPriority");
}

- (int64_t)countOfBytesExpectedToSend
{
  return self->_countOfBytesExpectedToSend;
}

- (int64_t)countOfBytesExpectedToReceive
{
  return self->_countOfBytesExpectedToReceive;
}

- (BOOL)_hasSZExtractor
{
  return self->_hasSZExtractor;
}

- (BOOL)_doesSZExtractorConsumeExtractedData
{
  return self->_doesSZExtractorConsumeExtractedData;
}

- (id)_timingData
{
  __CFN_TaskMetrics *Property;
  const char *v3;

  Property = -[NSURLSessionTask _metrics](self, "_metrics");
  if (Property)
    Property = (__CFN_TaskMetrics *)objc_getProperty(Property, v3, 96, 1);
  return -[__CFN_TransactionMetrics legacyStaticMetrics]((uint64_t)Property);
}

uint64_t __32__NSURLSessionTask_setPriority___block_invoke(uint64_t a1, double a2)
{
  _BYTE *v3;
  uint64_t v4;

  v3 = *(_BYTE **)(a1 + 32);
  if (v3)
    v4 = v3[69] & 1;
  else
    v4 = 0;
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return objc_msgSend(v3, "_onqueue_adjustPriorityHint:incremental:", v4, a2);
}

- (void)_onqueue_adoptEffectiveConfiguration:(id)a3
{
  NSURLRequest *v5;
  NSURLSessionConfiguration *v6;
  __CFDictionary *atsStateCache;
  int v8;
  __CFN_TaskMetrics *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v10 = 138412290;
    v11 = a3;
    _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Not an actual effective configuration: %@", (uint8_t *)&v10, 0xCu);
  }
  if (!-[NSURLSessionConfiguration isEqual:](self->_effectiveConfiguration, "isEqual:", a3))
  {
    v6 = self->_effectiveConfiguration;
    self->_effectiveConfiguration = (NSURLSessionConfiguration *)a3;
    atsStateCache = self->_atsStateCache;
    self->_atsStateCache = 0;
    if (atsStateCache)
      CFRelease(atsStateCache);
    -[NSURLSessionTask set_cachedSocketStreamProperties:](self, "set_cachedSocketStreamProperties:", 0);
    v5 = -[NSURLSessionTask currentRequest](self, "currentRequest");
    if (v5 || (v5 = -[NSURLSessionTask originalRequest](self, "originalRequest")) != 0)
      -[NSURLSessionTask updateCurrentRequest:](self, "updateCurrentRequest:", v5);
  }
  v8 = objc_msgSend(a3, "_pidForHAR", v5);
  v9 = -[NSURLSessionTask _metrics](self, "_metrics");
  if (v9)
    v9->_pidForHAR = v8;
}

- (NSString)taskDescription
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)set_callCompletionHandlerInline:(BOOL)a3
{
  self->_callCompletionHandlerInline = a3;
}

uint64_t __75__NSURLSessionTask__getAuthenticationHeadersForResponse_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __75__NSURLSessionTask__getAuthenticationHeadersForResponse_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[5];

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "authenticator");
  v3 = objc_msgSend(*(id *)(a1 + 32), "session");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__NSURLSessionTask__getAuthenticationHeadersForResponse_completionHandler___block_invoke_2;
  v7[3] = &unk_1E14FE048;
  v7[4] = *(_QWORD *)(a1 + 48);
  return objc_msgSend(v2, "getAuthenticationHeadersForTask:task:response:completionHandler:", v3, v4, v5, v7);
}

- (id)_incompleteTaskMetrics
{
  return -[NSURLSessionTaskMetrics initWithMetrics:]((id *)[NSURLSessionTaskMetrics alloc], -[NSURLSessionTask _metrics](self, "_metrics"));
}

uint64_t __44__NSURLSessionTask_set_bytesPerSecondLimit___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_adjustBytesPerSecondLimit:", *(_QWORD *)(a1 + 40));
}

uint64_t __26__NSURLSessionTask_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_cancel");
}

uint64_t __93__NSURLSessionTask_HTTPConnectionInfo__getUnderlyingHTTPConnectionInfoWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __74__NSURLSessionTask__EffectiveConfiguration___adoptEffectiveConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_adoptEffectiveConfiguration:", *(_QWORD *)(a1 + 40));
}

CFPropertyListRef __50__NSURLSessionTask_addAdditionalHeadersToRequest___block_invoke()
{
  CFPropertyListRef result;

  result = CFPreferencesCopyValue(CFSTR("HTTPAdditionalHeaders"), CFSTR("com.apple.CFNetwork"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  -[NSURLSessionTask addAdditionalHeadersToRequest:]::additionalHeaders = (uint64_t)result;
  return result;
}

void __47__NSURLSessionTask__copySocketStreamProperties__block_invoke(uint64_t a1, const void *a2, const void *a3)
{
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), a2, a3);
}

- (void)set_siteForCookies:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 560);
}

- (void)set_legacySocketStreamProperties:(id)a3
{
  -[NSURLSessionTask set_cachedSocketStreamProperties:](self, "set_cachedSocketStreamProperties:", 0);

  self->_legacySocketStreamProperties = (NSDictionary *)objc_msgSend(a3, "copy");
}

- (void)set_isTopLevelNavigation:(BOOL)a3
{
  self->_isTopLevelNavigation = a3;
}

- (void)set_expectedProgressTarget:(unint64_t)a3
{
  OS_dispatch_queue *v4;
  _QWORD block[5];

  if (self->_expectedProgressTargetValue != a3)
  {
    self->_expectedProgressTargetValue = a3;
    if (-[NSURLSessionTask session](self, "session"))
    {
      v4 = -[NSURLSessionTask workQueue](self, "workQueue");
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __47__NSURLSessionTask_set_expectedProgressTarget___block_invoke;
      block[3] = &unk_1E14FE118;
      block[4] = self;
      dispatch_async((dispatch_queue_t)v4, block);
    }
  }
}

- (void)set_DuetActivityProperties:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 488);
}

uint64_t __50__NSURLSessionTask_setPrefersIncrementalDelivery___block_invoke(uint64_t a1, double a2)
{
  _DWORD *v3;

  v3 = *(_DWORD **)(a1 + 32);
  if (v3)
    LODWORD(a2) = v3[31];
  else
    LODWORD(a2) = 0;
  return objc_msgSend(v3, "_onqueue_adjustPriorityHint:incremental:", *(unsigned __int8 *)(a1 + 40), a2);
}

- (void)set_storagePartitionIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 424);
}

- (void)set_sourceApplicationBundleIdentifierForMobileAsset:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 752);
}

- (void)set_publishingURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 536);
}

- (void)set_proxySettings:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 368);
}

- (void)set_preconnect:(BOOL)a3
{
  self->_preconnect = a3;
}

- (void)set_powerAssertion:(unsigned int)a3
{
  self->_powerAssertion = a3;
}

- (void)set_pathToDownloadTaskFile:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 304);
}

- (void)set_internalDelegate:(id)a3
{
  __NSCFURLSessionDelegateWrapper *internalDelegateWrapper;
  id *v6;
  const char *v7;

  if (a3)
  {
    if (self)
    {
      internalDelegateWrapper = self->_internalDelegateWrapper;
      if (internalDelegateWrapper)
        goto LABEL_7;
    }
    v6 = -[__NSCFURLSessionDelegateWrapper initWithSession:]((id *)[__NSCFURLSessionDelegateWrapper alloc], -[NSURLSessionTask session](self, "session"));
    if (self)
      objc_setProperty_nonatomic(self, v7, v6, 704);
    -[__NSCFURLSessionDelegateWrapper setFallbackDelegateWrapper:]((uint64_t)self->_internalDelegateWrapper, self->_publicDelegateWrapper);
    internalDelegateWrapper = self->_internalDelegateWrapper;
    if (internalDelegateWrapper)
LABEL_7:
      objc_setProperty_atomic(internalDelegateWrapper, a2, a3, 32);
  }
  else if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 704);
  }
}

- (void)set_hostOverride:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 576);
}

- (void)set_extractorPreparedForExtraction:(BOOL)a3
{
  self->_extractorPreparedForExtraction = a3;
}

- (void)set_extractorFinishedDecoding:(BOOL)a3
{
  self->_extractorFinishedDecoding = a3;
}

- (void)set_discretionaryOverride:(int64_t)a3
{
  self->_discretionaryOverride = a3;
}

- (void)set_boundInterfaceIdentifier:(id)a3
{
  -[NSURLSessionTask set_cachedSocketStreamProperties:](self, "set_cachedSocketStreamProperties:", 0);

  self->_boundInterfaceIdentifier = (NSString *)objc_msgSend(a3, "copy");
}

- (void)set_backtrace:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 744);
}

- (void)set_backgroundPublishingURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 544);
}

- (void)set_authenticatorConfiguredViaTaskProperty:(BOOL)a3
{
  self->_authenticatorConfiguredViaTaskProperty = a3;
}

- (void)set_TLSMinimumSupportedProtocolVersion:(unsigned __int16)a3
{
  id v5;
  id v6;

  -[NSURLSessionTask set_cachedSocketStreamProperties:](self, "set_cachedSocketStreamProperties:", 0);
  self->__TLSMinimumSupportedProtocolVersion = a3;
  if (-[NSURLSessionTask _sslSettings](self, "_sslSettings"))
    v5 = (id)-[NSDictionary mutableCopy](-[NSURLSessionTask _sslSettings](self, "_sslSettings"), "mutableCopy");
  else
    v5 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = v5;
  objc_msgSend(v5, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", SSLProtocolFromVersionCodepoint()), 0x1EDCFB3D0);
  -[NSURLSessionTask set_sslSettings:](self, "set_sslSettings:", v6);
}

- (void)set_TLSMaximumSupportedProtocolVersion:(unsigned __int16)a3
{
  id v5;
  id v6;

  -[NSURLSessionTask set_cachedSocketStreamProperties:](self, "set_cachedSocketStreamProperties:", 0);
  self->__TLSMaximumSupportedProtocolVersion = a3;
  if (-[NSURLSessionTask _sslSettings](self, "_sslSettings"))
    v5 = (id)-[NSDictionary mutableCopy](-[NSURLSessionTask _sslSettings](self, "_sslSettings"), "mutableCopy");
  else
    v5 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = v5;
  objc_msgSend(v5, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", SSLProtocolFromVersionCodepoint()), 0x1EDCFB398);
  -[NSURLSessionTask set_sslSettings:](self, "set_sslSettings:", v6);
}

- (void)setTaskIdentifier:(unint64_t)a3
{
  NSString *loggableDescription;
  __CFN_TaskMetrics *v6;

  loggableDescription = self->_loggableDescription;
  self->_loggableDescription = 0;

  self->_taskIdentifier = a3;
  v6 = -[NSURLSessionTask _metrics](self, "_metrics");
  if (v6)
    v6->_identifier = a3;
}

- (void)setResumableUploadState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (void)setPrefersIncrementalDelivery:(BOOL)prefersIncrementalDelivery
{
  OS_dispatch_queue *v5;
  _QWORD v6[5];
  BOOL v7;

  if (self)
  {
    if (self->_prefersIncrementalDeliveryAPIStorage == prefersIncrementalDelivery)
      return;
    self->_prefersIncrementalDeliveryAPIStorage = prefersIncrementalDelivery;
  }
  else if (!prefersIncrementalDelivery)
  {
    return;
  }
  if (-[NSURLSessionTask session](self, "session"))
  {
    v5 = -[NSURLSessionTask workQueue](self, "workQueue");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __50__NSURLSessionTask_setPrefersIncrementalDelivery___block_invoke;
    v6[3] = &unk_1E14FDF58;
    v6[4] = self;
    v7 = prefersIncrementalDelivery;
    dispatch_async((dispatch_queue_t)v5, v6);
  }
}

- (void)setOriginalRequest:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (NSURLSessionTask)initWithTask:(id)a3
{
  NSURLSessionTask *v4;
  double v5;
  NSURLSessionConfiguration *v6;
  double v7;
  const char *v8;
  void *v9;
  id Property;
  __NSCFURLSessionDelegateWrapper *publicDelegateWrapper;
  BOOL v12;
  _CFHSTSPolicy *v13;
  _CFURLCache *v14;
  _CFURLCredentialStorage *v15;
  OpaqueCFHTTPCookieStorage *v16;
  double v17;
  double v18;
  double v19;
  __NSCFURLSessionDelegateWrapper *v21;

  v4 = -[NSURLSessionTask initWithTaskGroup:](self, "initWithTaskGroup:", objc_msgSend(a3, "_taskGroup"));
  if (v4)
  {
    v4->_originalRequest = (NSURLRequest *)objc_msgSend((id)objc_msgSend(a3, "originalRequest"), "copy");
    v4->_currentRequest = (NSURLRequest *)objc_msgSend((id)objc_msgSend(a3, "currentRequest"), "mutableCopy");
    v4->_taskIdentifier = objc_msgSend(a3, "taskIdentifier");
    v4->_response = (NSURLResponse *)objc_msgSend((id)objc_msgSend(a3, "response"), "copy");
    -[NSURLSessionTask setEarliestBeginDate:](v4, "setEarliestBeginDate:", objc_msgSend(a3, "earliestBeginDate"));
    v4->_countOfBytesClientExpectsToSend = objc_msgSend(a3, "countOfBytesClientExpectsToSend");
    v4->_countOfBytesClientExpectsToReceive = objc_msgSend(a3, "countOfBytesClientExpectsToReceive");
    v4->_countOfBytesReceived = objc_msgSend(a3, "countOfBytesReceived");
    v4->__countOfPendingBytesReceivedEncoded = objc_msgSend(a3, "_countOfPendingBytesReceivedEncoded");
    v4->__countOfBytesReceivedEncoded = objc_msgSend(a3, "_countOfBytesReceivedEncoded");
    v4->_countOfBytesSent = objc_msgSend(a3, "countOfBytesSent");
    v4->_countOfBytesExpectedToSend = objc_msgSend(a3, "countOfBytesExpectedToSend");
    v4->_countOfBytesExpectedToReceive = objc_msgSend(a3, "countOfBytesExpectedToReceive");
    v4->_taskDescription = (NSString *)objc_msgSend((id)objc_msgSend(a3, "taskDescription"), "copy");
    objc_msgSend(a3, "startTime");
    v4->_startTime = v5;
    v6 = (NSURLSessionConfiguration *)objc_msgSend((id)objc_msgSend(a3, "_effectiveConfiguration"), "copy");
    v4->_effectiveConfiguration = v6;
    -[NSURLSessionConfiguration timeoutIntervalForResource](v6, "timeoutIntervalForResource");
    v4->_timeoutIntervalForResource_ivar = v7;
    v4->_priorityValue = objc_msgSend(a3, "_priorityValue");
    if (a3)
    {
      v9 = (void *)*((_QWORD *)a3 + 87);
      if (v9)
        Property = objc_getProperty(v9, v8, 32, 1);
      else
        Property = 0;
      publicDelegateWrapper = v4->_publicDelegateWrapper;
      if (publicDelegateWrapper)
        objc_setProperty_atomic(publicDelegateWrapper, v8, Property, 32);
      -[NSURLSessionTask set_internalDelegate:](v4, "set_internalDelegate:", objc_msgSend(a3, "_internalDelegate", Property));
      v4->_priorityAPIStorage = *((float *)a3 + 31);
      v12 = *((_BYTE *)a3 + 69) & 1;
    }
    else
    {
      v21 = v4->_publicDelegateWrapper;
      if (v21)
        objc_setProperty_atomic(v21, v8, 0, 32);
      -[NSURLSessionTask set_internalDelegate:](v4, "set_internalDelegate:", objc_msgSend(0, "_internalDelegate"));
      v12 = 0;
      v4->_priorityAPIStorage = 0.0;
    }
    v4->_prefersIncrementalDeliveryAPIStorage = v12;
    -[NSURLSessionTask set_legacySocketStreamProperties:](v4, "set_legacySocketStreamProperties:", objc_msgSend(a3, "_legacySocketStreamProperties"));
    v13 = (_CFHSTSPolicy *)objc_msgSend(a3, "_cfHSTS");
    if (v13)
      v13 = (_CFHSTSPolicy *)CFRetain(v13);
    v4->_cfHSTS = v13;
    v14 = (_CFURLCache *)objc_msgSend(a3, "_cfCache");
    if (v14)
      v14 = (_CFURLCache *)CFRetain(v14);
    v4->_cfCache = v14;
    v15 = (_CFURLCredentialStorage *)objc_msgSend(a3, "_cfCreds");
    if (v15)
      v15 = (_CFURLCredentialStorage *)CFRetain(v15);
    v4->_cfCreds = v15;
    v16 = (OpaqueCFHTTPCookieStorage *)objc_msgSend(a3, "_cfCookies");
    if (v16)
      v16 = (OpaqueCFHTTPCookieStorage *)CFRetain(v16);
    v4->_cfCookies = v16;
    v4->_cachePolicy = objc_msgSend(a3, "_cachePolicy");
    objc_msgSend(a3, "_timeoutInterval");
    v4->_timeoutInterval = v17;
    v4->_pathToDownloadTaskFile = (NSString *)objc_msgSend((id)objc_msgSend(a3, "_pathToDownloadTaskFile"), "copy");
    -[NSURLSessionTask set_proxySettings:](v4, "set_proxySettings:", objc_msgSend(a3, "_proxySettings"));
    -[NSURLSessionTask set_proxyHandshakePending:](v4, "set_proxyHandshakePending:", objc_msgSend(a3, "_proxyHandshakePending"));
    -[NSURLSessionTask set_sslSettings:](v4, "set_sslSettings:", objc_msgSend(a3, "_sslSettings"));
    v4->_shouldPipelineHTTP = objc_msgSend(a3, "_shouldPipelineHTTP");
    v4->_shouldUsePipelineHeuristics = objc_msgSend(a3, "_shouldUsePipelineHeuristics");
    v4->_shouldSkipPipelineProbe = objc_msgSend(a3, "_shouldSkipPipelineProbe");
    v4->_shouldHandleCookies = objc_msgSend(a3, "_shouldHandleCookies");
    v4->_cookieAcceptPolicy = objc_msgSend(a3, "_cookieAcceptPolicy");
    v4->_preventsIdleSystemSleep = objc_msgSend(a3, "_preventsIdleSystemSleep");
    v4->_allowsCellular = objc_msgSend(a3, "_allowsCellular");
    v4->_networkServiceType = objc_msgSend(a3, "_networkServiceType");
    v4->_qos = objc_msgSend(a3, "_qos");
    -[NSURLSessionTask set_voucher:](v4, "set_voucher:", objc_msgSend(a3, "_voucher"));
    v4->_suspensionThreshhold = objc_msgSend(a3, "_suspensionThreshhold");
    v4->_strictContentLength = objc_msgSend(a3, "_strictContentLength");
    -[NSURLSessionTask set_boundInterfaceIdentifier:](v4, "set_boundInterfaceIdentifier:", objc_msgSend(a3, "_boundInterfaceIdentifier"));
    v4->_disallowCellular = objc_msgSend(a3, "_disallowCellular");
    v4->_allowsExpensiveOverride = objc_msgSend(a3, "_allowsExpensiveOverride");
    v4->_allowsConstrainedOverride = objc_msgSend(a3, "_allowsConstrainedOverride");
    v4->_allowsUCAOverride = objc_msgSend(a3, "_allowsUCAOverride");
    v4->_allowsCellularOverride = objc_msgSend(a3, "_allowsCellularOverride");
    v4->_assumesHTTP3Capable = objc_msgSend(a3, "_assumesHTTP3Capable");
    v4->_allowedProtocolTypes = objc_msgSend(a3, "_allowedProtocolTypes");
    v4->_requestPriority = objc_msgSend(a3, "_requestPriority");
    objc_msgSend(a3, "_timeWindowDelay");
    v4->_timeWindowDelay = v18;
    objc_msgSend(a3, "_timeWindowDuration");
    v4->_timeWindowDuration = v19;
    v4->_DuetActivityProperties = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "_DuetActivityProperties"), "copy");
    v4->__TCPConnectionMetadata = (NSData *)objc_msgSend((id)objc_msgSend(a3, "_TCPConnectionMetadata"), "copy");
    -[NSURLSessionTask set_TLSMinimumSupportedProtocolVersion:](v4, "set_TLSMinimumSupportedProtocolVersion:", objc_msgSend(a3, "_TLSMinimumSupportedProtocolVersion"));
    -[NSURLSessionTask set_TLSMaximumSupportedProtocolVersion:](v4, "set_TLSMaximumSupportedProtocolVersion:", objc_msgSend(a3, "_TLSMaximumSupportedProtocolVersion"));
    v4->_TLSNegotiatedCipherSuite = objc_msgSend(a3, "_TLSNegotiatedCipherSuite");
    -[NSURLSessionTask set_uniqueIdentifier:](v4, "set_uniqueIdentifier:", objc_msgSend(a3, "_uniqueIdentifier"));
    -[NSURLSessionTask set_storagePartitionIdentifier:](v4, "set_storagePartitionIdentifier:", objc_msgSend(a3, "_storagePartitionIdentifier"));
    v4->_shouldSkipPreferredClientCertificateLookup = objc_msgSend(a3, "_shouldSkipPreferredClientCertificateLookup");
    v4->_preventsSystemHTTPProxyAuthentication = objc_msgSend(a3, "_preventsSystemHTTPProxyAuthentication");
    v4->_requiresSecureHTTPSProxyConnection = objc_msgSend(a3, "_requiresSecureHTTPSProxyConnection");
    v4->_preventsAppSSO = objc_msgSend(a3, "_preventsAppSSO");
    v4->_appSSOFallback = objc_msgSend(a3, "_appSSOFallback");
    v4->_appleIDContextRedirect = objc_msgSend(a3, "_appleIDContextRedirect");
    -[NSURLSessionTask setAuthenticator:](v4, "setAuthenticator:", objc_msgSend(a3, "authenticator"));
    -[NSURLSessionTask set_bytesPerSecondLimit:](v4, "set_bytesPerSecondLimit:", objc_msgSend(a3, "_bytesPerSecondLimit"));
    -[NSURLSessionTask set_expectedProgressTarget:](v4, "set_expectedProgressTarget:", objc_msgSend(a3, "_expectedProgressTarget"));
    -[NSURLSessionTask set_trailers:](v4, "set_trailers:", objc_msgSend(a3, "_trailers"));
    -[NSURLSessionTask set_discretionaryOverride:](v4, "set_discretionaryOverride:", objc_msgSend(a3, "_discretionaryOverride"));
    -[NSURLSessionTask set_extractor:](v4, "set_extractor:", objc_msgSend(a3, "_extractor"));
    -[NSURLSessionTask set_extractorFinishedDecoding:](v4, "set_extractorFinishedDecoding:", objc_msgSend(a3, "_extractorFinishedDecoding"));
    -[NSURLSessionTask set_extractorPreparedForExtraction:](v4, "set_extractorPreparedForExtraction:", objc_msgSend(a3, "_extractorPreparedForExtraction"));
    -[NSURLSessionTask set_hasSZExtractor:](v4, "set_hasSZExtractor:", objc_msgSend(a3, "_hasSZExtractor"));
    -[NSURLSessionTask set_doesSZExtractorConsumeExtractedData:](v4, "set_doesSZExtractorConsumeExtractedData:", objc_msgSend(a3, "_doesSZExtractorConsumeExtractedData"));
    -[NSURLSessionTask _setAppleIDContext:](v4, "_setAppleIDContext:", objc_msgSend(a3, "_appleIDContext"));
    -[NSURLSessionTask set_authenticatorConfiguredViaTaskProperty:](v4, "set_authenticatorConfiguredViaTaskProperty:", objc_msgSend(a3, "_authenticatorConfiguredViaTaskProperty"));
    -[NSURLSessionTask set_publishingURL:](v4, "set_publishingURL:", objc_msgSend(a3, "_publishingURL"));
    -[NSURLSessionTask set_preconnect:](v4, "set_preconnect:", objc_msgSend(a3, "_preconnect"));
    -[NSURLSessionTask set_backgroundPublishingURL:](v4, "set_backgroundPublishingURL:", objc_msgSend(a3, "_backgroundPublishingURL"));
    -[NSURLSessionTask set_nw_activity:](v4, "set_nw_activity:", objc_msgSend(a3, "_nw_activity"));
    -[NSURLSessionTask set_private_nw_activity:](v4, "set_private_nw_activity:", objc_msgSend(a3, "_private_nw_activity"));
    -[NSURLSessionTask set_metrics:](v4, "set_metrics:", objc_msgSend(a3, "_metrics"));
    -[NSURLSessionTask set_APSRelayTopic:](v4, "set_APSRelayTopic:", objc_msgSend(a3, "_APSRelayTopic"));
    -[NSURLSessionTask set_isTopLevelNavigation:](v4, "set_isTopLevelNavigation:", objc_msgSend(a3, "_isTopLevelNavigation"));
    -[NSURLSessionTask set_siteForCookies:](v4, "set_siteForCookies:", objc_msgSend(a3, "_siteForCookies"));
    -[NSURLSessionTask set_hostOverride:](v4, "set_hostOverride:", objc_msgSend(a3, "_hostOverride"));
    v4->_atsStateCache = (__CFDictionary *)objc_msgSend(a3, "_copyATSState");
    -[NSURLSessionTask set_resolvedCNAMEChain:](v4, "set_resolvedCNAMEChain:", objc_msgSend(a3, "_resolvedCNAMEChain"));
    -[NSURLSessionTask set_cookieTransformCallback:](v4, "set_cookieTransformCallback:", objc_msgSend(a3, "_cookieTransformCallback"));
    -[NSURLSessionTask set_attribution:](v4, "set_attribution:", objc_msgSend(a3, "_attribution"));
    -[NSURLSessionTask set_isKnownTracker:](v4, "set_isKnownTracker:", objc_msgSend(a3, "_isKnownTracker"));
    -[NSURLSessionTask set_trackerContext:](v4, "set_trackerContext:", objc_msgSend(a3, "_trackerContext"));
    -[NSURLSessionTask set_privacyProxyFailClosed:](v4, "set_privacyProxyFailClosed:", objc_msgSend(a3, "_privacyProxyFailClosed"));
    -[NSURLSessionTask set_privacyProxyFailClosedForUnreachableNonMainHosts:](v4, "set_privacyProxyFailClosedForUnreachableNonMainHosts:", objc_msgSend(a3, "_privacyProxyFailClosedForUnreachableNonMainHosts"));
    -[NSURLSessionTask set_privacyProxyFailClosedForUnreachableHosts:](v4, "set_privacyProxyFailClosedForUnreachableHosts:", objc_msgSend(a3, "_privacyProxyFailClosedForUnreachableHosts"));
    -[NSURLSessionTask set_requiresDNSSECValidation:](v4, "set_requiresDNSSECValidation:", objc_msgSend(a3, "_requiresDNSSECValidation"));
    -[NSURLSessionTask set_allowsPersistentDNS:](v4, "set_allowsPersistentDNS:", objc_msgSend(a3, "_allowsPersistentDNS"));
    -[NSURLSessionTask set_backtrace:](v4, "set_backtrace:", objc_msgSend(a3, "_backtrace"));
    -[NSURLSessionTask set_callCompletionHandlerInline:](v4, "set_callCompletionHandlerInline:", objc_msgSend(a3, "_callCompletionHandlerInline"));
    -[NSURLSessionTask set_prohibitPrivacyProxy:](v4, "set_prohibitPrivacyProxy:", objc_msgSend(a3, "_prohibitPrivacyProxy"));
    -[NSURLSessionTask set_useEnhancedPrivacyMode:](v4, "set_useEnhancedPrivacyMode:", objc_msgSend(a3, "_useEnhancedPrivacyMode"));
    -[NSURLSessionTask set_blockTrackers:](v4, "set_blockTrackers:", objc_msgSend(a3, "_blockTrackers"));
    -[NSURLSessionTask set_failInsecureLoadWithHTTPSDNSRecord:](v4, "set_failInsecureLoadWithHTTPSDNSRecord:", objc_msgSend(a3, "_failInsecureLoadWithHTTPSDNSRecord"));
    -[NSURLSessionTask set_isWebSearchContent:](v4, "set_isWebSearchContent:", objc_msgSend(a3, "_isWebSearchContent"));
    -[NSURLSessionTask setResumableUploadState:](v4, "setResumableUploadState:", objc_msgSend(a3, "resumableUploadState"));
    -[NSURLSessionTask set_sourceApplicationBundleIdentifierForMobileAsset:](v4, "set_sourceApplicationBundleIdentifierForMobileAsset:", objc_msgSend(a3, "_sourceApplicationBundleIdentifierForMobileAsset"));
  }
  return v4;
}

- (NSDate)earliestBeginDate
{
  return (NSDate *)objc_getProperty(self, a2, 600, 1);
}

- (int64_t)countOfBytesClientExpectsToSend
{
  return self->_countOfBytesClientExpectsToSend;
}

- (int64_t)countOfBytesClientExpectsToReceive
{
  return self->_countOfBytesClientExpectsToReceive;
}

- (NSDictionary)_trailers
{
  return self->_trailers;
}

- (BOOL)_shouldSkipPreferredClientCertificateLookup
{
  return self->_shouldSkipPreferredClientCertificateLookup;
}

- (void)_setAppleIDContext:(id)a3
{
  id v5;

  v5 = a3;

  self->_appleIDContext = (NSURLSessionAppleIDContext *)a3;
  if (a3)
    -[NSURLSessionTask initializeHTTPAuthenticatorWithAppleIDContext:statusCodes:](self, "initializeHTTPAuthenticatorWithAppleIDContext:statusCodes:", a3, objc_msgSend(a3, "relevantHTTPStatusCodes"));
  self->_authenticatorConfiguredViaTaskProperty = 1;
}

- (NSArray)_resolvedCNAMEChain
{
  return self->_resolvedCNAMEChain;
}

- (NSURL)_publishingURL
{
  return self->_publishingURL;
}

- (BOOL)_proxyHandshakePending
{
  return self->_proxyHandshakePending;
}

- (BOOL)_preventsSystemHTTPProxyAuthentication
{
  return self->_preventsSystemHTTPProxyAuthentication;
}

- (BOOL)_preventsIdleSystemSleep
{
  return self->_preventsIdleSystemSleep;
}

- (NSURLSessionTaskDelegate)_internalDelegate
{
  __NSCFURLSessionDelegateWrapper *internalDelegateWrapper;

  if (self && (internalDelegateWrapper = self->_internalDelegateWrapper) != 0)
    return (NSURLSessionTaskDelegate *)objc_getProperty(internalDelegateWrapper, a2, 32, 1);
  else
    return 0;
}

- (BOOL)_extractorPreparedForExtraction
{
  return self->_extractorPreparedForExtraction;
}

- (BOOL)_extractorFinishedDecoding
{
  return self->_extractorFinishedDecoding;
}

- (int64_t)_discretionaryOverride
{
  return self->_discretionaryOverride;
}

- (NSURL)_backgroundPublishingURL
{
  return self->_backgroundPublishingURL;
}

- (BOOL)_authenticatorConfiguredViaTaskProperty
{
  return self->_authenticatorConfiguredViaTaskProperty;
}

- (NSURLSessionAppleIDContext)_appleIDContext
{
  return self->_appleIDContext;
}

- (BOOL)_allowsCellular
{
  return self->_allowsCellular;
}

- (unsigned)_TLSNegotiatedCipherSuite
{
  return self->_TLSNegotiatedCipherSuite;
}

- (unsigned)_TLSMinimumSupportedProtocolVersion
{
  return self->__TLSMinimumSupportedProtocolVersion;
}

- (unsigned)_TLSMaximumSupportedProtocolVersion
{
  return self->__TLSMaximumSupportedProtocolVersion;
}

- (NSURLSessionTask)init
{
  return -[NSURLSessionTask initWithTaskGroup:](self, "initWithTaskGroup:", objc_msgSend((id)+[NSURLSession _sharedSessionForConnection](), "defaultTaskGroup"));
}

- (BOOL)_needSendingMetrics
{
  return 0;
}

- (BOOL)_seenFirstResume
{
  return self->_seenFirstResume;
}

- (void)set_timeoutIntervalForResource:(double)a3
{
  self->_timeoutIntervalForResource_ivar = a3;
}

- (void)suspend
{
  NSProgress *progress;
  OS_dispatch_queue *v4;
  _QWORD block[5];

  if (-[NSURLSessionTask state](self, "state") <= NSURLSessionTaskStateSuspended
    && -[NSURLSessionTask workQueue](self, "workQueue"))
  {
    -[NSURLSessionTask setState:](self, "setState:", 1);
    objc_sync_enter(self);
    progress = self->_progress;
    if (progress
      && !-[NSProgress isCancelled](progress, "isCancelled")
      && !-[NSProgress isPaused](self->_progress, "isPaused"))
    {
      -[NSProgress pause](self->_progress, "pause");
    }
    objc_sync_exit(self);
    v4 = -[NSURLSessionTask workQueue](self, "workQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__NSURLSessionTask_suspend__block_invoke;
    block[3] = &unk_1E14FE118;
    block[4] = self;
    dispatch_async((dispatch_queue_t)v4, block);
  }
}

- (id)delegate
{
  const char *v3;
  void *publicDelegateWrapper;
  id v5;

  objc_sync_enter(self);
  if (self)
  {
    publicDelegateWrapper = self->_publicDelegateWrapper;
    if (publicDelegateWrapper)
      publicDelegateWrapper = objc_getProperty(publicDelegateWrapper, v3, 32, 1);
  }
  else
  {
    publicDelegateWrapper = 0;
  }
  v5 = publicDelegateWrapper;
  objc_sync_exit(self);
  return v5;
}

- (void)set_loadingPriority:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  OS_dispatch_queue *v7;
  _QWORD block[9];

  if (a3 >= 0.0 && a3 <= 1.0)
  {
    block[7] = v3;
    block[8] = v4;
    -[NSURLSessionTask set_loadingPriorityValue:](self, "set_loadingPriorityValue:");
    if (-[NSURLSessionTask session](self, "session"))
    {
      v7 = -[NSURLSessionTask workQueue](self, "workQueue");
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __40__NSURLSessionTask_set_loadingPriority___block_invoke;
      block[3] = &unk_1E14FE118;
      block[4] = self;
      dispatch_async((dispatch_queue_t)v7, block);
    }
  }
}

- (void)set_timeWindowDelay:(double)a3
{
  -[NSURLSessionTask set_cachedSocketStreamProperties:](self, "set_cachedSocketStreamProperties:", 0);
  self->_timeWindowDelay = a3;
}

- (void)set_timeWindowDuration:(double)a3
{
  -[NSURLSessionTask set_cachedSocketStreamProperties:](self, "set_cachedSocketStreamProperties:", 0);
  self->_timeWindowDuration = a3;
}

- (void)set_disallowCellular:(BOOL)a3
{
  -[NSURLSessionTask set_cachedSocketStreamProperties:](self, "set_cachedSocketStreamProperties:", 0);
  self->_disallowCellular = a3;
}

- (void)set_allowsUCAOverride:(int)a3
{
  -[NSURLSessionTask set_cachedSocketStreamProperties:](self, "set_cachedSocketStreamProperties:", 0);
  self->_allowsUCAOverride = a3;
}

- (int)_allowsUCAOverride
{
  return self->_allowsUCAOverride;
}

- (BOOL)_keepDownloadTaskFile
{
  return 0;
}

- (void)_setSocketProperties:(__CFDictionary *)a3 connectionProperties:(__CFDictionary *)a4
{
  void *Value;
  const void *v7;
  const void *v8;
  BOOL v9;
  uint64_t v10;
  const void *v11;

  -[NSURLSessionTask set_legacySocketStreamProperties:](self, "set_legacySocketStreamProperties:", a3);
  if (a4)
  {
    Value = (void *)CFDictionaryGetValue(a4, CFSTR("kCFURLConnectionSuspensionThreshold"));
    if (Value)
      -[NSURLSessionTask set_suspensionThreshhold:](self, "set_suspensionThreshhold:", objc_msgSend(Value, "longLongValue"));
    v7 = CFDictionaryGetValue(a4, CFSTR("kCFURLConnectionProhibitAuthChallengeUI"));
    v8 = (const void *)*MEMORY[0x1E0C9AE50];
    if (v7)
      v9 = v7 == v8;
    else
      v9 = 0;
    v10 = v9;
    -[NSURLSessionTask set_prohibitAuthUI:](self, "set_prohibitAuthUI:", v10);
    v11 = CFDictionaryGetValue(a4, &unk_1EDCFED90);
    if (v11)
      -[NSURLSessionTask set_strictContentLength:](self, "set_strictContentLength:", v11 == v8);
  }
}

- (void)_setExplicitStorageSession:(__CFURLStorageSession *)a3
{
  CFTypeRef v5;
  CFTypeRef v6;
  CFTypeRef v7;
  CFTypeRef v8;

  if (a3)
  {
    if (StorageSession::Class(void)::sOnce_StorageSession != -1)
      dispatch_once(&StorageSession::Class(void)::sOnce_StorageSession, &__block_literal_global_16297);
    v5 = StorageSession::copyHSTSStorage((os_unfair_lock_s *)a3 + 4);
    v6 = _CFURLStorageSessionCopyCookieStorage((uint64_t)v5, (os_unfair_lock_s *)a3);
    v7 = _CFURLStorageSessionCopyCache((uint64_t)v6, (os_unfair_lock_s *)a3);
    v8 = _CFURLStorageSessionCopyCredentialStorage((uint64_t)v7, (uint64_t)a3);
    -[NSURLSessionTask set_cfHSTS:](self, "set_cfHSTS:", v5);
    -[NSURLSessionTask set_cfCookies:](self, "set_cfCookies:", v6);
    -[NSURLSessionTask set_cfCache:](self, "set_cfCache:", v7);
    -[NSURLSessionTask set_cfCreds:](self, "set_cfCreds:", v8);
    if (v5)
      CFRelease(v5);
    if (v6)
      CFRelease(v6);
    if (v7)
      CFRelease(v7);
    if (v8)
      CFRelease(v8);
  }
  else
  {
    -[NSURLSessionTask set_cfCache:](self, "set_cfCache:");
    -[NSURLSessionTask set_cfCreds:](self, "set_cfCreds:", 0);
    -[NSURLSessionTask set_cfCookies:](self, "set_cfCookies:", 0);
    -[NSURLSessionTask set_cfHSTS:](self, "set_cfHSTS:", 0);
  }
}

- (void)setTaskDependency:(id)a3
{
  void *v5;
  id v6;
  NSURLSessionTaskDependency *taskDependency;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  -[NSURLSessionTask set_dependencyInfo:](self, "set_dependencyInfo:", v5);
  v6 = a3;

  self->_taskDependency = (NSURLSessionTaskDependency *)a3;
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSURLSessionTask taskIdentifier](self, "taskIdentifier")), CFSTR("TaskIdentifier"));
  taskDependency = self->_taskDependency;
  if (taskDependency)
  {
    if (-[NSURLSessionTaskDependency parentTask](taskDependency, "parentTask"))
      objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSURLSessionTask taskIdentifier](-[NSURLSessionTaskDependency parentTask](self->_taskDependency, "parentTask"), "taskIdentifier")), CFSTR("ParentTaskIdentifier"));
    if (-[NSURLSessionTaskDependency mainDocumentTask](self->_taskDependency, "mainDocumentTask"))
      objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSURLSessionTask taskIdentifier](-[NSURLSessionTaskDependency mainDocumentTask](self->_taskDependency, "mainDocumentTask"), "taskIdentifier")), CFSTR("MainDocumentTaskIdentifier"));
    if (-[NSURLSessionTask dependencyTree](-[NSURLSessionTaskDependency mainDocumentTask](self->_taskDependency, "mainDocumentTask"), "dependencyTree"))
    {
      objc_msgSend(v5, "setObject:forKey:", -[NSURLSessionTask dependencyTree](-[NSURLSessionTaskDependency mainDocumentTask](self->_taskDependency, "mainDocumentTask"), "dependencyTree"), CFSTR("DependencyTree"));
    }
    if (-[NSURLSessionTaskDependency taskDependencyDescription](self->_taskDependency, "taskDependencyDescription"))
      objc_msgSend(v5, "setObject:forKey:", -[NSURLSessionTaskDependency taskDependencyDescription](self->_taskDependency, "taskDependencyDescription"), CFSTR("DependencyDescription"));
    -[NSURLSessionTask set_dependencyInfo:](self, "set_dependencyInfo:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v5));
  }
}

- (NSProgress)progress
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  NSURL *v8;
  NSURL *v9;
  uint64_t v10;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  objc_sync_enter(self);
  if (!self->_progress)
  {
    self->_progress = (NSProgress *)(id)objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
    if (-[NSURLSessionTask countOfBytesExpectedToSend](self, "countOfBytesExpectedToSend") <= 0)
    {
      self->_undeterminedUploadProgressState = 1;
      v3 = 100;
    }
    else if (self->_undeterminedUploadProgressState)
    {
      v3 = 100;
    }
    else
    {
      v3 = -1;
    }
    self->_uploadProgress = (NSProgress *)(id)objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v3);
    -[NSProgress setCompletedUnitCount:](self->_uploadProgress, "setCompletedUnitCount:", -[NSURLSessionTask countOfBytesSent](self, "countOfBytesSent"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || -[NSURLRequest HTTPBody](-[NSURLSessionTask originalRequest](self, "originalRequest"), "HTTPBody")
      || -[NSURLRequest HTTPBodyStream](-[NSURLSessionTask originalRequest](self, "originalRequest"), "HTTPBodyStream")
      || -[NSString isEqualToString:](-[NSString uppercaseString](-[NSURLRequest HTTPMethod](-[NSURLSessionTask originalRequest](self, "originalRequest"), "HTTPMethod"), "uppercaseString"), "isEqualToString:", CFSTR("POST"))|| -[NSString isEqualToString:](-[NSString uppercaseString](-[NSURLRequest HTTPMethod](-[NSURLSessionTask originalRequest](self, "originalRequest"), "HTTPMethod"), "uppercaseString"), "isEqualToString:", CFSTR("PUT")))
    {
      self->_isInUpload = 1;
      v4 = 5;
      v5 = 95;
    }
    else
    {
      v4 = 95;
      v5 = 5;
    }
    -[NSProgress addChild:withPendingUnitCount:](self->_progress, "addChild:withPendingUnitCount:", self->_uploadProgress, v5);
    if (-[NSURLSessionTask countOfBytesExpectedToReceive](self, "countOfBytesExpectedToReceive") <= 0)
    {
      self->_undeterminedDownloadProgressState = 1;
      v6 = 100;
    }
    else if (self->_undeterminedDownloadProgressState)
    {
      v6 = 100;
    }
    else
    {
      v6 = -1;
    }
    self->_downloadProgress = (NSProgress *)(id)objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v6);
    -[NSProgress setCompletedUnitCount:](self->_downloadProgress, "setCompletedUnitCount:", -[NSURLSessionTask countOfBytesReceived](self, "countOfBytesReceived"));
    if (self->_isInUpload && -[NSProgress completedUnitCount](self->_downloadProgress, "completedUnitCount") >= 1)
    {
      self->_isInUpload = 0;
      -[NSURLSessionTask _completeUploadProgress](self, "_completeUploadProgress");
    }
    -[NSProgress addChild:withPendingUnitCount:](self->_progress, "addChild:withPendingUnitCount:", self->_downloadProgress, v4);
    -[NSProgress setKind:](self->_progress, "setKind:", *MEMORY[0x1E0CB30F8]);
    -[NSProgress setFileTotalCount:](self->_progress, "setFileTotalCount:", &unk_1E152A748);
    if (self->_isInUpload)
      v7 = (_QWORD *)MEMORY[0x1E0CB30E0];
    else
      v7 = (_QWORD *)MEMORY[0x1E0CB30B8];
    -[NSProgress setFileOperationKind:](self->_progress, "setFileOperationKind:", *v7);
    if (-[NSURLSessionTask _backgroundPublishingURL](self, "_backgroundPublishingURL"))
      v8 = -[NSURLSessionTask _backgroundPublishingURL](self, "_backgroundPublishingURL");
    else
      v8 = -[NSURLSessionTask _publishingURL](self, "_publishingURL");
    v9 = v8;
    if (!v8)
      v9 = -[NSURLRequest URL](-[NSURLSessionTask originalRequest](self, "originalRequest"), "URL");
    -[NSProgress setFileURL:](self->_progress, "setFileURL:", v9);
    -[NSURLSessionTask addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", self, CFSTR("countOfBytesSent"), 1, &PrivateKVOCountOfBytesSentProgressContext);
    -[NSURLSessionTask addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", self, CFSTR("countOfBytesExpectedToSend"), 1, &PrivateKVOCountOfBytesExpectedToSendProgressContext);
    -[NSURLSessionTask addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", self, CFSTR("countOfBytesReceived"), 1, &PrivateKVOCountOfBytesReceivedProgressContext);
    -[NSURLSessionTask addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", self, CFSTR("countOfBytesExpectedToReceive"), 1, &PrivateKVOCountOfBytesExpectedToReceiveProgressContext);
    v10 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __28__NSURLSessionTask_progress__block_invoke;
    v14[3] = &unk_1E14FE118;
    v14[4] = self;
    -[NSProgress setCancellationHandler:](self->_progress, "setCancellationHandler:", v14);
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __28__NSURLSessionTask_progress__block_invoke_2;
    v13[3] = &unk_1E14FE118;
    v13[4] = self;
    -[NSProgress setPausingHandler:](self->_progress, "setPausingHandler:", v13);
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __28__NSURLSessionTask_progress__block_invoke_3;
    v12[3] = &unk_1E14FE118;
    v12[4] = self;
    -[NSProgress setResumingHandler:](self->_progress, "setResumingHandler:", v12);
    if (-[NSURLSessionTask _backgroundPublishingURL](self, "_backgroundPublishingURL"))
      -[NSProgress publish](self->_progress, "publish");
  }
  objc_sync_exit(self);
  return self->_progress;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v11;
  int64_t v12;
  NSProgress *v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  NSProgress *downloadProgress;
  uint64_t v18;
  NSProgress *uploadProgress;
  objc_super v20;

  v11 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("new"));
  if (a6 == &PrivateKVOCountOfBytesReceivedProgressContext)
  {
    if (self->_progressReportingFinished)
      return;
    -[NSProgress setByteCompletedCount:](self->_progress, "setByteCompletedCount:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[NSURLSessionTask countOfBytesReceived](self, "countOfBytesReceived")));
    if (!self->_undeterminedDownloadProgressState)
    {
      v16 = objc_msgSend(v11, "longLongValue");
      downloadProgress = self->_downloadProgress;
      goto LABEL_29;
    }
    v12 = -[NSProgress completedUnitCount](self->_downloadProgress, "completedUnitCount");
    if (v12 >= -[NSProgress totalUnitCount](self->_downloadProgress, "totalUnitCount") - 1)
      return;
    v13 = self->_downloadProgress;
LABEL_18:
    v16 = -[NSProgress completedUnitCount](v13, "completedUnitCount") + 1;
    downloadProgress = v13;
LABEL_29:
    -[NSProgress setCompletedUnitCount:](downloadProgress, "setCompletedUnitCount:", v16);
    return;
  }
  if (a6 != &PrivateKVOCountOfBytesExpectedToReceiveProgressContext)
  {
    if (a6 != &PrivateKVOCountOfBytesSentProgressContext)
    {
      if (a6 == &PrivateKVOCountOfBytesExpectedToSendProgressContext)
      {
        if (!self->_progressReportingFinished)
        {
          -[NSProgress setByteTotalCount:](self->_progress, "setByteTotalCount:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[NSURLSessionTask countOfBytesExpectedToSend](self, "countOfBytesExpectedToSend")));
          if (v11)
          {
            if (objc_msgSend(v11, "longLongValue") <= 0)
            {
              self->_undeterminedUploadProgressState = 1;
              uploadProgress = self->_uploadProgress;
              v18 = 100;
            }
            else
            {
              self->_undeterminedUploadProgressState = 0;
              v18 = objc_msgSend(v11, "longLongValue");
              uploadProgress = self->_uploadProgress;
            }
            -[NSProgress setTotalUnitCount:](uploadProgress, "setTotalUnitCount:", v18);
          }
        }
      }
      else
      {
        v20.receiver = self;
        v20.super_class = (Class)NSURLSessionTask;
        -[NSURLSessionTask observeValueForKeyPath:ofObject:change:context:](&v20, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5, a6);
      }
      return;
    }
    if (self->_progressReportingFinished)
      return;
    -[NSProgress setByteCompletedCount:](self->_progress, "setByteCompletedCount:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[NSURLSessionTask countOfBytesSent](self, "countOfBytesSent")));
    if (!self->_undeterminedUploadProgressState)
    {
      v16 = objc_msgSend(v11, "longLongValue");
      downloadProgress = self->_uploadProgress;
      goto LABEL_29;
    }
    v15 = -[NSProgress completedUnitCount](self->_uploadProgress, "completedUnitCount");
    if (v15 >= -[NSProgress totalUnitCount](self->_uploadProgress, "totalUnitCount") - 1)
      return;
    v13 = self->_uploadProgress;
    goto LABEL_18;
  }
  if (!self->_progressReportingFinished)
  {
    -[NSProgress setByteTotalCount:](self->_progress, "setByteTotalCount:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[NSURLSessionTask countOfBytesExpectedToReceive](self, "countOfBytesExpectedToReceive")));
    if (v11)
    {
      if (objc_msgSend(v11, "longLongValue") <= 0)
      {
        self->_undeterminedDownloadProgressState = 1;
        v14 = 100;
      }
      else
      {
        self->_undeterminedDownloadProgressState = 0;
        v14 = objc_msgSend(v11, "longLongValue");
      }
      -[NSProgress setTotalUnitCount:](self->_downloadProgress, "setTotalUnitCount:", v14);
    }
    -[NSURLSessionTask _completeUploadProgress](self, "_completeUploadProgress");
    -[NSProgress setFileOperationKind:](self->_progress, "setFileOperationKind:", *MEMORY[0x1E0CB30B8]);
  }
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (void)set_loadingPriorityValue:(double)a3
{
  self->_loadingPriorityValue = a3;
}

- (__CFN_TransactionMetrics)_backgroundTransactionMetrics
{
  return (__CFN_TransactionMetrics *)objc_getProperty(self, a2, 296, 1);
}

- (void)set_shouldSkipPreferredClientCertificateLookup:(BOOL)a3
{
  self->_shouldSkipPreferredClientCertificateLookup = a3;
}

- (void)set_cacheOnly:(BOOL)a3
{
  self->_cacheOnly = a3;
}

- (void)set_preventsSystemHTTPProxyAuthentication:(BOOL)a3
{
  self->_preventsSystemHTTPProxyAuthentication = a3;
}

- (void)set_requiresSecureHTTPSProxyConnection:(BOOL)a3
{
  self->_requiresSecureHTTPSProxyConnection = a3;
}

- (void)set_preventsAppSSO:(BOOL)a3
{
  self->_preventsAppSSO = a3;
}

- (void)set_appSSOFallback:(BOOL)a3
{
  self->_appSSOFallback = a3;
}

- (void)set_appleIDContextRedirect:(BOOL)a3
{
  self->_appleIDContextRedirect = a3;
}

- (void)set_cfHSTS:(_CFHSTSPolicy *)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (void)set_cfCache:(_CFURLCache *)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (void)set_cfCreds:(_CFURLCredentialStorage *)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (void)set_cfCookies:(OpaqueCFHTTPCookieStorage *)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (BOOL)_prohibitAuthUI
{
  return self->_prohibitAuthUI;
}

- (void)set_prohibitAuthUI:(BOOL)a3
{
  self->_prohibitAuthUI = a3;
}

- (void)set_strictContentLength:(BOOL)a3
{
  self->_strictContentLength = a3;
}

- (void)set_darkWakePowerAssertion:(unsigned int)a3
{
  self->_darkWakePowerAssertion = a3;
}

- (unint64_t)_powerAssertionReleaseTime
{
  return self->_powerAssertionReleaseTime;
}

- (unint64_t)_darkWakePowerAssertionReleaseTime
{
  return self->_darkWakePowerAssertionReleaseTime;
}

- (void)set_darkWakePowerAssertionReleaseTime:(unint64_t)a3
{
  self->_darkWakePowerAssertionReleaseTime = a3;
}

- (BOOL)_connectionIsCellular
{
  return self->_connectionIsCellular;
}

- (BOOL)_connectionIsCompanionLink
{
  return self->_connectionIsCompanionLink;
}

- (void)set_dependencyInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 464);
}

- (NSURLSessionTaskDependencyTree)dependencyTree
{
  return self->_dependencyTree;
}

- (void)setDependencyTree:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 472);
}

- (NSURLSessionTaskDependency)taskDependency
{
  return self->_taskDependency;
}

- (BOOL)_allowsQUIC
{
  return self->_allowsQUIC;
}

- (void)set_allowsQUIC:(BOOL)a3
{
  self->_allowsQUIC = a3;
}

- (void)set_effectiveConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 592);
}

- (NSDictionary)_cachedSocketStreamProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 648, 1);
}

- (BOOL)_allowsPersistentDNS
{
  return self->_allowsPersistentDNS;
}

- (void)set_allowsPersistentDNS:(BOOL)a3
{
  self->_allowsPersistentDNS = a3;
}

uint64_t __28__NSURLSessionTask_progress__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

uint64_t __28__NSURLSessionTask_progress__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "suspend");
}

uint64_t __28__NSURLSessionTask_progress__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resume");
}

uint64_t __57__NSURLSessionTask__onSessionQueue_cleanupAndBreakCycles__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v2 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_183ECA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ RELEASING power assertion.", (uint8_t *)&v5, 0xCu);
  }
  return IOPMAssertionRelease(*(_DWORD *)(a1 + 40));
}

uint64_t __57__NSURLSessionTask__onSessionQueue_cleanupAndBreakCycles__block_invoke_82(uint64_t a1)
{
  return IOPMAssertionRelease(*(_DWORD *)(a1 + 32));
}

void __66__NSURLSessionTask__releasePreventIdleSleepAssertionIfAppropriate__block_invoke(uint64_t a1)
{
  __uint64_t v2;
  IOPMAssertionID v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&sPowerAssertionSetLock);
  if (objc_msgSend(*(id *)(a1 + 32), "_powerAssertion")
    && (v2 = objc_msgSend(*(id *)(a1 + 32), "_powerAssertionReleaseTime"), v2 <= clock_gettime_nsec_np(_CLOCK_UPTIME_RAW)))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "_powerAssertion");
    objc_msgSend(*(id *)(a1 + 32), "set_powerAssertion:", 0);
    os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
    if (v3)
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v4 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
      {
        v5 = objc_msgSend(*(id *)(a1 + 32), "_loggableDescription");
        v6 = 138543362;
        v7 = v5;
        _os_log_impl(&dword_183ECA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ RELEASING power assertion.", (uint8_t *)&v6, 0xCu);
      }
      IOPMAssertionRelease(v3);
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
  }
}

void __66__NSURLSessionTask__releasePreventIdleSleepAssertionIfAppropriate__block_invoke_81(uint64_t a1)
{
  __uint64_t v2;
  IOPMAssertionID v3;

  os_unfair_lock_lock((os_unfair_lock_t)&sPowerAssertionSetLock);
  if (objc_msgSend(*(id *)(a1 + 32), "_darkWakePowerAssertion")
    && (v2 = objc_msgSend(*(id *)(a1 + 32), "_darkWakePowerAssertionReleaseTime"),
        v2 <= clock_gettime_nsec_np(_CLOCK_UPTIME_RAW)))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "_darkWakePowerAssertion");
    objc_msgSend(*(id *)(a1 + 32), "set_darkWakePowerAssertion:", 0);
    os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
    if (v3)
      IOPMAssertionRelease(v3);
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
  }
}

uint64_t __40__NSURLSessionTask_set_loadingPriority___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_adjustLoadingPoolPriority");
}

uint64_t __47__NSURLSessionTask_set_expectedProgressTarget___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_expectedProgressTargetChanged");
}

uint64_t __27__NSURLSessionTask_suspend__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_metrics");
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_suspend");
}

uint64_t __93__NSURLSessionTask_HTTPConnectionInfo__getUnderlyingHTTPConnectionInfoWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
