@implementation NSURLRequestInternal

- (id).cxx_construct
{
  self->_request._vptr$CoreLoggable = (void **)&off_1E14E4C50;
  self->_request.fRequiresDNSSECValidation = 0;
  self->_request.fHSTSPolicy.__ptr_.__value_ = 0;
  *(_QWORD *)&self->_request.fAllowsExpensiveNetworkAccess = 0;
  self->_request.fCachePolicy = 0;
  self->_request.fTimeout = 0.0;
  *(_OWORD *)&self->_request.fRequestPriority = xmmword_1841E3940;
  *(_WORD *)&self->_request.fFlags = 0;
  self->_request.fBoundInterfaceIdentifier = 0;
  self->_request.fProtocolProperties = 0;
  self->_request._explicitStorageSession = 0;
  self->_request.fAllowsUCA = 0;
  self->_request.fTimeWindowDuration = 0.0;
  self->_request.fStartTimeoutTime = 0.0;
  self->_request.fTimeWindowDelay = 0.0;
  *(_DWORD *)&self->_request.fRequiresShortConnectionTimeout = 0;
  self->_request.fPayloadTransmissionTimeout = 0.0;
  self->_request.fATSOverrides = 0;
  if (__CFNGetHTTP3Override::onceToken != -1)
    dispatch_once(&__CFNGetHTTP3Override::onceToken, &__block_literal_global_45);
  self->_request.fAssumesHTTP3Capable = __CFNGetHTTP3Override::value == 2;
  self->_request.fAttribution = 0;
  self->_request.fTrackerContext = 0;
  *(_QWORD *)&self->_request.fKnownTracker = 0;
  *(_WORD *)&self->_request.fFailInsecureLoadWithHTTPSDNSRecord = 0;
  return self;
}

- (void).cxx_destruct
{
  URLRequest::~URLRequest(&self->_request);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NSURLRequestInternal;
  -[NSURLRequestInternal dealloc](&v2, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  URLRequest::initialize((URLRequest *)objc_msgSend(v4, "_inner"), (const URLRequest *)-[NSURLRequestInternal _inner](self, "_inner"));
  return v4;
}

- (void)_inner
{
  return &self->_request;
}

- (NSURLRequestInternal)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSURLRequestInternal;
  return -[NSURLRequestInternal init](&v3, sel_init);
}

- (id)_initWithMessage:(__CFHTTPMessage *)a3 bodyParts:(__CFArray *)a4 cachePolicy:(unint64_t)a5 timeout:(double)a6 mainDocumentURL:(__CFURL *)a7 mutable:(unsigned __int8)a8
{
  int v8;
  NSURLRequestInternal *v14;
  NSURLRequestInternal *v15;
  CFURLRef v16;
  __int16 v17;
  __int16 v18;
  __CFURL *v19;
  _OWORD *Instance;
  _OWORD *v21;
  const HTTPRequestMessage *v22;
  const __CFAllocator *v23;
  CFIndex Count;
  objc_super v26;
  uint8_t buf[16];

  v8 = a8;
  v26.receiver = self;
  v26.super_class = (Class)NSURLRequestInternal;
  v14 = -[NSURLRequestInternal init](&v26, sel_init);
  v15 = v14;
  if (v14)
  {
    if (v8)
      *(_WORD *)&v14->_request.fFlags |= 2u;
    v16 = CFHTTPMessageCopyRequestURL(a3);
    if (a5)
      v17 = 1033;
    else
      v17 = 9;
    v18 = *(_WORD *)&v15->_request.fFlags & 0xFFEF | v17;
    *(_WORD *)&v15->_request.fFlags = v18;
    v15->_request.fURL = v16;
    v15->_request.fCachePolicy = a5;
    if (a6 != 60.0)
      *(_WORD *)&v15->_request.fFlags = v18 | 0x800;
    v15->_request.fTimeout = a6;
    if (a7)
      v19 = (__CFURL *)CFRetain(a7);
    else
      v19 = 0;
    v15->_request.fMainDocumentURL = v19;
    if (v15->_request.fHTTPRequest && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "can't be here", buf, 2u);
    }
    if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1)
      dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5133);
    Instance = (_OWORD *)_CFRuntimeCreateInstance();
    v21 = Instance;
    if (Instance)
    {
      Instance[1] = 0u;
      v21 = Instance + 1;
      Instance[13] = 0u;
      Instance[14] = 0u;
      Instance[11] = 0u;
      Instance[12] = 0u;
      Instance[9] = 0u;
      Instance[10] = 0u;
      Instance[7] = 0u;
      Instance[8] = 0u;
      Instance[5] = 0u;
      Instance[6] = 0u;
      Instance[3] = 0u;
      Instance[4] = 0u;
      Instance[2] = 0u;
    }
    if (a3)
    {
      if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1)
        dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5133);
      if (*((_BYTE *)a3 + 40))
        v22 = 0;
      else
        v22 = (__CFHTTPMessage *)((char *)a3 + 16);
    }
    else
    {
      v22 = 0;
    }
    HTTPRequestMessage::HTTPRequestMessage((HTTPRequestMessage *)v21, v22);
    *(_QWORD *)v21 = &off_1E14E5170;
    *((_QWORD *)v21 + 1) = &unk_1E14E51F0;
    *((_QWORD *)v21 + 2) = &unk_1E14E5210;
    *((_QWORD *)v21 + 16) = &unk_1E14E5240;
    *(_OWORD *)((char *)v21 + 184) = 0u;
    *(_OWORD *)((char *)v21 + 200) = 0u;
    *((_DWORD *)v21 + 54) = 256;
    if (a4)
    {
      v23 = CFGetAllocator(v21 - 1);
      Count = CFArrayGetCount(a4);
      *((_QWORD *)v21 + 26) = CFArrayCreateMutableCopy(v23, Count, a4);
      (*(void (**)(_OWORD *, _QWORD))(*(_QWORD *)v21 + 64))(v21, 0);
    }
    v15->_request.fHTTPRequest = (HTTPRequest *)v21;
  }
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  HTTPRequest *fHTTPRequest;
  const void *v7;
  CFTypeRef v8;
  uint64_t v9;
  const void *v10;
  CFTypeRef v11;
  int v12;
  __CFURLStorageSession *explicitStorageSession;
  const void *v14;
  int v15;
  HTTPRequest *v16;
  uint64_t v17;
  _BOOL4 isEffectivelyEmpty;
  const __CFArray *v19;
  CFIndex Count;
  CFIndex v21;
  const __CFArray *v22;
  uint64_t (***v23)(_QWORD, uint64_t);
  uint64_t v24;
  const __CFArray *v25;
  CFTypeRef *v26;
  const __CFArray *v27;
  int v28;
  uint64_t v29;
  const void *v30;
  const void *v31;
  int v33;

  v4 = objc_msgSend(a3, "_inner");
  if (self->_request.fCachePolicy != *(_QWORD *)(v4 + 16))
    goto LABEL_90;
  v5 = v4;
  if (((*(unsigned __int16 *)(v4 + 64) ^ *(_WORD *)&self->_request.fFlags) & 1) != 0
    || typesNotEqualWithAppropriateNullChecks(self->_request.fURL, *(const void **)(v4 + 8))
    || typesNotEqualWithAppropriateNullChecks(self->_request.fMainDocumentURL, *(const void **)(v5 + 32))
    || dictsNotEqualWithAppropriateNullAndEmptyDictionaryChecks(self->_request.fProtocolProperties, *(const __CFDictionary **)(v5 + 40))|| typesNotEqualWithAppropriateNullChecks(self->_request.fMainDocumentURL, *(const void **)(v5 + 32))|| dictsNotEqualWithAppropriateNullAndEmptyDictionaryChecks(self->_request.fSSLProps, *(const __CFDictionary **)(v5 + 72)))
  {
    goto LABEL_90;
  }
  fHTTPRequest = self->_request.fHTTPRequest;
  if (!fHTTPRequest)
  {
    v7 = CFSTR("GET");
    goto LABEL_10;
  }
  CFGetAllocator((char *)fHTTPRequest - 16);
  v7 = (const void *)*((_QWORD *)fHTTPRequest + 19);
  if (v7)
  {
LABEL_10:
    v8 = CFRetain(v7);
    goto LABEL_13;
  }
  v8 = 0;
LABEL_13:
  v9 = *(_QWORD *)(v5 + 56);
  if (!v9)
  {
    v10 = CFSTR("GET");
    goto LABEL_15;
  }
  CFGetAllocator((CFTypeRef)(v9 - 16));
  v10 = *(const void **)(v9 + 152);
  if (v10)
  {
LABEL_15:
    v11 = CFRetain(v10);
    goto LABEL_18;
  }
  v11 = 0;
LABEL_18:
  v12 = CFEqual(v8, v11);
  if (v8)
    CFRelease(v8);
  if (v11)
    CFRelease(v11);
  if (!v12)
    goto LABEL_90;
  explicitStorageSession = self->_request._explicitStorageSession;
  v14 = *(const void **)(v5 + 224);
  if ((explicitStorageSession != 0) == (v14 == 0))
    goto LABEL_90;
  if (!explicitStorageSession || !v14 || (v15 = CFEqual(explicitStorageSession, v14)) != 0)
  {
    v16 = self->_request.fHTTPRequest;
    v17 = *(_QWORD *)(v5 + 56);
    if (!v16)
    {
      if (v17 && !HTTPRequest::isEffectivelyEmpty(*(HTTPRequest **)(v5 + 56)))
        goto LABEL_90;
LABEL_40:
      if (((*(unsigned __int16 *)(v5 + 64) ^ *(_WORD *)&self->_request.fFlags) & 8) == 0
        && self->_request.fTimeWindowDuration == *(double *)(v5 + 136)
        && self->_request.fTimeWindowDelay == *(double *)(v5 + 128)
        && self->_request.fRequestPriority == *(_QWORD *)(v5 + 88)
        && self->_request.fStartTimeoutTime == *(double *)(v5 + 144)
        && self->_request.fRequiresShortConnectionTimeout == *(unsigned __int8 *)(v5 + 152)
        && self->_request.fPayloadTransmissionTimeout == *(double *)(v5 + 184)
        && self->_request.fAllowedProtocolTypes == *(_QWORD *)(v5 + 96)
        && self->_request.fAllowsExpensiveNetworkAccess == *(_DWORD *)(v5 + 208)
        && self->_request.fAllowsConstrainedNetworkAccess == *(_DWORD *)(v5 + 212)
        && self->_request.fAllowsUCA == *(_DWORD *)(v5 + 216)
        && self->_request.fAssumesHTTP3Capable == *(unsigned __int8 *)(v5 + 156)
        && self->_request.fAttribution == *(_QWORD *)(v5 + 176)
        && self->_request.fKnownTracker == *(unsigned __int8 *)(v5 + 157)
        && !typesNotEqualWithAppropriateNullChecks(self->_request.fTrackerContext, *(const void **)(v5 + 120))
        && self->_request.fPrivacyProxyFailClosed == *(unsigned __int8 *)(v5 + 158)
        && self->_request.fPrivacyProxyFailClosedForUnreachableNonMainHosts == *(unsigned __int8 *)(v5 + 159)
        && self->_request.fPrivacyProxyFailClosedForUnreachableHosts == *(unsigned __int8 *)(v5 + 160)
        && self->_request.fRequiresDNSSECValidation == *(_DWORD *)(v5 + 168)
        && self->_request.fAllowsPersistentDNS == *(unsigned __int8 *)(v5 + 172)
        && self->_request.fProhibitPrivacyProxy == *(unsigned __int8 *)(v5 + 161)
        && self->_request.fAllowPrivateAccessTokensForThirdParty == *(unsigned __int8 *)(v5 + 162)
        && self->_request.fUseEnhancedPrivacyMode == *(unsigned __int8 *)(v5 + 163)
        && self->_request.fBlockTrackers == *(unsigned __int8 *)(v5 + 164)
        && self->_request.fFailInsecureLoadWithHTTPSDNSRecord == *(unsigned __int8 *)(v5 + 165))
      {
        LOBYTE(v15) = self->_request.fIsWebSearchContent == *(unsigned __int8 *)(v5 + 166);
        return v15;
      }
LABEL_90:
      LOBYTE(v15) = 0;
      return v15;
    }
    isEffectivelyEmpty = HTTPRequest::isEffectivelyEmpty(self->_request.fHTTPRequest);
    if (!v17)
    {
      if (!isEffectivelyEmpty)
        goto LABEL_90;
      goto LABEL_40;
    }
    if (isEffectivelyEmpty != HTTPRequest::isEffectivelyEmpty((HTTPRequest *)v17))
      goto LABEL_90;
    v19 = (const __CFArray *)*((_QWORD *)v16 + 23);
    if (v19)
    {
      Count = CFArrayGetCount(v19);
      if (*(_QWORD *)(v17 + 184))
      {
        v21 = Count;
        if ((Count != 0) != (CFArrayGetCount(*(CFArrayRef *)(v17 + 184)) != 0))
          goto LABEL_90;
        if (v21)
        {
          v15 = CFEqual(*((CFTypeRef *)v16 + 23), *(CFTypeRef *)(v17 + 184));
          if (!v15)
            return v15;
        }
LABEL_69:
        if ((*((_QWORD *)v16 + 11) != 0) == (*(_QWORD *)(v17 + 88) == 0))
          goto LABEL_90;
        v23 = (uint64_t (***)(_QWORD, uint64_t))HTTPMessage::headers((os_unfair_lock_s *)v16);
        v24 = HTTPMessage::headers((os_unfair_lock_s *)v17);
        if ((v23 != 0) == (v24 == 0))
          goto LABEL_90;
        if (v23)
        {
          v15 = (**v23)(v23, v24);
          if (!v15)
            return v15;
        }
        v25 = (const __CFArray *)*((_QWORD *)v16 + 26);
        if (v25)
        {
          v26 = (CFTypeRef *)(v17 + 208);
          if (!*(_QWORD *)(v17 + 208) && !*(_QWORD *)(v17 + 200))
            goto LABEL_90;
          v33 = CFArrayGetCount(v25) != 0;
          v27 = (const __CFArray *)*v26;
          if (!*v26)
          {
            v28 = 0;
LABEL_81:
            if (v28 != v33)
              goto LABEL_90;
            if (v33)
            {
              v15 = CFEqual(*((CFTypeRef *)v16 + 26), *v26);
              if (!v15)
                return v15;
            }
            goto LABEL_86;
          }
        }
        else
        {
          v29 = *((_QWORD *)v16 + 25);
          v26 = (CFTypeRef *)(v17 + 208);
          v27 = *(const __CFArray **)(v17 + 208);
          if (!v27)
          {
            if ((v29 != 0) != (*(_QWORD *)(v17 + 200) != 0))
              goto LABEL_90;
LABEL_86:
            v30 = (const void *)*((_QWORD *)v16 + 25);
            v31 = *(const void **)(v17 + 200);
            if ((v30 != 0) == (v31 == 0))
              goto LABEL_90;
            if (v30)
            {
              v15 = CFEqual(v30, v31);
              if (!v15)
                return v15;
            }
            goto LABEL_40;
          }
          v33 = 0;
          if (!v29)
          {
            LOBYTE(v15) = 0;
            return v15;
          }
        }
        v28 = CFArrayGetCount(v27) != 0;
        goto LABEL_81;
      }
    }
    else
    {
      v22 = *(const __CFArray **)(v17 + 184);
      if (!v22)
        goto LABEL_69;
      Count = CFArrayGetCount(v22);
    }
    if (Count)
      goto LABEL_90;
    goto LABEL_69;
  }
  return v15;
}

- (unint64_t)hash
{
  return (*((uint64_t (**)(URLRequest *))self->_request._vptr$CoreLoggable + 4))(&self->_request);
}

@end
