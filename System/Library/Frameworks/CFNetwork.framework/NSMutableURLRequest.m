@implementation NSMutableURLRequest

- (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field
{
  CFURLRequestSetHTTPHeaderFieldValue(self, (const __CFString *)field, (const __CFString *)value);
}

- (void)setHTTPBody:(NSData *)HTTPBody
{
  CFURLRequestSetHTTPRequestBody(self, (uint64_t)HTTPBody);
}

- (void)setHTTPBodyStream:(NSInputStream *)HTTPBodyStream
{
  CFURLRequestSetHTTPRequestBodyStream(self, HTTPBodyStream);
}

- (void)addValue:(NSString *)value forHTTPHeaderField:(NSString *)field
{
  CFURLRequestAppendHTTPHeaderFieldValue(self, (const __CFString *)field, (const __CFString *)value);
}

- (void)setHTTPMethod:(NSString *)HTTPMethod
{
  uint8_t v5[16];

  if (!HTTPMethod && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "assertion failure", v5, 2u);
  }
  CFURLRequestSetHTTPRequestMethod(self, (const __CFString *)HTTPMethod);
}

- (void)setHTTPShouldHandleCookies:(BOOL)HTTPShouldHandleCookies
{
  _BOOL4 v3;
  _WORD *v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;

  v3 = HTTPShouldHandleCookies;
  v4 = -[NSURLRequest _inner](self, "_inner");
  v5 = v4[32];
  v6 = v5 | 0x21;
  v7 = v5 & 0xFFDE | 0x20;
  if (v3)
    v7 = v6;
  v4[32] = v7;
}

- (void)setURL:(NSURL *)URL
{
  CFURLRequestSetURL(self, URL);
}

- (void)setAttribution:(NSURLRequestAttribution)attribution
{
  *(_QWORD *)(-[NSURLRequest _inner](self, "_inner") + 176) = attribution;
}

- (void)setTimeoutInterval:(NSTimeInterval)timeoutInterval
{
  _WORD *v4;

  v4 = -[NSURLRequest _inner](self, "_inner");
  v4[32] |= 0x800u;
  *((NSTimeInterval *)v4 + 3) = timeoutInterval;
}

- (void)setContentDispositionEncodingFallbackArray:(id)a3
{
  __CFArray *v4;

  v4 = +[NSURLRequest newCFContentDispositionEncodingFallbackArray:]((uint64_t)NSURLRequest, a3);
  _CFURLRequestSetContentDispositionEncodingFallbackArray(self, v4);
  if (v4)
    CFRelease(v4);
}

- (void)setCachePolicy:(NSURLRequestCachePolicy)cachePolicy
{
  int v3;
  _WORD *v4;

  v3 = cachePolicy;
  v4 = -[NSURLRequest _inner](self, "_inner");
  v4[32] |= 0x400u;
  *((_QWORD *)v4 + 2) = v3;
}

- (void)_setPrivacyProxyFailClosedForUnreachableNonMainHosts:(BOOL)a3
{
  *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 159) = a3;
}

- (void)_setUseEnhancedPrivacyMode:(BOOL)a3
{
  *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 163) = a3;
}

- (void)setAllHTTPHeaderFields:(NSDictionary *)allHTTPHeaderFields
{
  if (allHTTPHeaderFields)
    CFURLRequestSetMultipleHTTPHeaderFields(self, (const __CFDictionary *)allHTTPHeaderFields);
}

- (void)setMainDocumentURL:(NSURL *)mainDocumentURL
{
  CFURLRequestSetMainDocumentURL(self, mainDocumentURL);
}

- (void)setAllowsExpensiveNetworkAccess:(BOOL)allowsExpensiveNetworkAccess
{
  int v3;

  if (allowsExpensiveNetworkAccess)
    v3 = 1;
  else
    v3 = 2;
  *(_DWORD *)(-[NSURLRequest _inner](self, "_inner") + 208) = v3;
}

- (void)setAllowsConstrainedNetworkAccess:(BOOL)allowsConstrainedNetworkAccess
{
  int v3;

  if (allowsConstrainedNetworkAccess)
    v3 = 1;
  else
    v3 = 2;
  *(_DWORD *)(-[NSURLRequest _inner](self, "_inner") + 212) = v3;
}

- (void)setNetworkServiceType:(NSURLRequestNetworkServiceType)networkServiceType
{
  int v3;
  _WORD *v4;

  v3 = networkServiceType;
  v4 = -[NSURLRequest _inner](self, "_inner");
  v4[32] |= 0x40u;
  *((_DWORD *)v4 + 26) = v3;
}

- (void)_setNonAppInitiated:(BOOL)a3
{
  *(_QWORD *)(-[NSURLRequest _inner](self, "_inner") + 176) = a3;
}

- (void)setHTTPShouldUsePipelining:(BOOL)HTTPShouldUsePipelining
{
  CFURLRequestSetShouldPipelineHTTP(self, HTTPShouldUsePipelining, 1);
}

- (void)setAllowsCellularAccess:(BOOL)allowsCellularAccess
{
  _BOOL4 v3;
  _WORD *v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;

  v3 = allowsCellularAccess;
  v4 = -[NSURLRequest _inner](self, "_inner");
  v5 = v4[32];
  v6 = v5 | 0x88;
  v7 = v5 & 0xFF77 | 0x80;
  if (v3)
    v7 = v6;
  v4[32] = v7;
}

- (void)setAssumesHTTP3Capable:(BOOL)assumesHTTP3Capable
{
  *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 156) = assumesHTTP3Capable;
}

- (void)setRequiresDNSSECValidation:(BOOL)requiresDNSSECValidation
{
  _BOOL4 v3;
  _DWORD *v4;
  int v5;

  v3 = requiresDNSSECValidation;
  v4 = -[NSURLRequest _inner](self, "_inner");
  if (v3)
    v5 = 1;
  else
    v5 = 2;
  v4[42] = v5;
}

- (void)setAllowsPersistentDNS:(BOOL)a3
{
  *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 172) = a3;
}

- (void)setBoundInterfaceIdentifier:(id)a3
{
  URLRequest::setBoundInterfaceIdentifier((URLRequest *)-[NSURLRequest _inner](self, "_inner"), (__CFString *)a3);
}

- (void)_setKnownTracker:(BOOL)a3
{
  *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 157) = a3;
}

- (void)set_trackerContext:(id)a3
{
  _QWORD *v4;
  id v5;
  CFTypeRef v6;

  v4 = -[NSURLRequest _inner](self, "_inner");
  v5 = (id)v4[15];
  if (v5 != a3)
  {
    if (v5)
      CFRelease(v5);
    if (a3)
      v6 = CFRetain(a3);
    else
      v6 = 0;
    v4[15] = v6;
  }
}

- (void)_setPrivacyProxyFailClosed:(BOOL)a3
{
  *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 158) = a3;
}

- (void)_setPrivacyProxyFailClosedForUnreachableHosts:(BOOL)a3
{
  *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 160) = a3;
}

- (void)_setProhibitPrivacyProxy:(BOOL)a3
{
  *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 161) = a3;
}

- (void)_setAllowPrivateAccessTokensForThirdParty:(BOOL)a3
{
  *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 162) = a3;
}

- (void)_setBlockTrackers:(BOOL)a3
{
  *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 164) = a3;
}

- (void)_setFailInsecureLoadWithHTTPSDNSRecord:(BOOL)a3
{
  *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 165) = a3;
}

- (void)_setWebSearchContent:(BOOL)a3
{
  *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 166) = a3;
}

- (void)_removeAllProtocolProperties
{
  _QWORD *v2;
  const void *v3;

  v2 = -[NSURLRequest _inner](self, "_inner");
  v3 = (const void *)v2[5];
  if (v3)
    CFRelease(v3);
  v2[5] = 0;
}

- (void)_setAllowsUCA:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1;
  else
    v3 = 2;
  *(_DWORD *)(-[NSURLRequest _inner](self, "_inner") + 216) = v3;
}

- (BOOL)_explicitlySetShouldHandleCookies
{
  return (*(unsigned __int16 *)(-[NSURLRequest _inner](self, "_inner") + 64) >> 5) & 1;
}

- (BOOL)_explicitlySetCachePolicy
{
  return (*(unsigned __int16 *)(-[NSURLRequest _inner](self, "_inner") + 64) >> 10) & 1;
}

- (BOOL)_explicitlySetTimeoutInterval
{
  return (*(unsigned __int16 *)(-[NSURLRequest _inner](self, "_inner") + 64) >> 11) & 1;
}

- (BOOL)_explicitlySetNetworkServiceType
{
  return (*(unsigned __int16 *)(-[NSURLRequest _inner](self, "_inner") + 64) >> 6) & 1;
}

- (BOOL)_explicitlySetAllowsCellularAccess
{
  return (*(unsigned __int16 *)(-[NSURLRequest _inner](self, "_inner") + 64) >> 7) & 1;
}

- (BOOL)_explicitlySetAllowsExpensiveNetworkAccess
{
  return *(_DWORD *)(-[NSURLRequest _inner](self, "_inner") + 208) != 0;
}

- (BOOL)_explicitlySetAllowsConstrainedNetworkAccess
{
  return *(_DWORD *)(-[NSURLRequest _inner](self, "_inner") + 212) != 0;
}

- (BOOL)_explicitlySetAllowsUCA
{
  return *(_DWORD *)(-[NSURLRequest _inner](self, "_inner") + 216) != 0;
}

- (BOOL)_explicitlySetPreventsIdleSystemSleep
{
  return HIBYTE(*(unsigned __int16 *)(-[NSURLRequest _inner](self, "_inner") + 64)) & 1;
}

- (BOOL)_explicitlySetProxySettings
{
  return (*(unsigned __int16 *)(-[NSURLRequest _inner](self, "_inner") + 64) >> 12) & 1;
}

- (BOOL)_explicitlySetSSLProperties
{
  return (*(unsigned __int16 *)(-[NSURLRequest _inner](self, "_inner") + 64) >> 13) & 1;
}

- (void)setHTTPContentType:(id)a3
{
  -[NSMutableURLRequest setValue:forHTTPHeaderField:](self, "setValue:forHTTPHeaderField:", a3, CFSTR("Content-Type"));
}

- (void)setHTTPExtraCookies:(id)a3
{
  URLRequest *v4;
  HTTPRequest *fHTTPRequest;
  CFArrayRef Copy;
  CFArrayRef v7;
  CFTypeRef v8;
  URLRequest *v9;
  const void *v10;
  void (**v11)(StringSerializable *__hidden);
  CFTypeRef cf;

  v4 = -[NSURLRequest _inner](self, "_inner");
  fHTTPRequest = v4->fHTTPRequest;
  if (fHTTPRequest)
  {
    if (a3)
    {
LABEL_3:
      Copy = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFArrayRef)a3);
      v7 = (CFArrayRef)*((_QWORD *)fHTTPRequest + 23);
      if (v7 != Copy)
      {
        if (v7)
          CFRelease(v7);
        if (Copy)
          v8 = CFRetain(Copy);
        else
          v8 = 0;
        *((_QWORD *)fHTTPRequest + 23) = v8;
      }
      if (Copy)
        CFRelease(Copy);
      return;
    }
  }
  else
  {
    v9 = v4;
    HTTPMethodMixedValue::HTTPMethodMixedValue(&v11);
    URLRequest::createHTTPRequest(v9, (CFTypeRef *)&v11);
    v11 = &off_1E14E9A00;
    if (cf)
      CFRelease(cf);
    fHTTPRequest = v9->fHTTPRequest;
    if (a3)
      goto LABEL_3;
  }
  v10 = (const void *)*((_QWORD *)fHTTPRequest + 23);
  if (v10)
  {
    CFRelease(v10);
    *((_QWORD *)fHTTPRequest + 23) = 0;
  }
}

- (void)setHTTPReferrer:(id)a3
{
  id v5;

  if (objc_msgSend(a3, "rangeOfString:options:", CFSTR("file:"), 9) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(a3, "length"))
      v5 = a3;
    else
      v5 = 0;
    -[NSMutableURLRequest setValue:forHTTPHeaderField:](self, "setValue:forHTTPHeaderField:", v5, CFSTR("Referer"));
  }
}

- (void)setHTTPUserAgent:(id)a3
{
  -[NSMutableURLRequest setValue:forHTTPHeaderField:](self, "setValue:forHTTPHeaderField:", a3, CFSTR("User-Agent"));
}

- (void)setRequestPriority:(unint64_t)a3
{
  *(_QWORD *)(-[NSURLRequest _inner](self, "_inner") + 88) = a3;
}

- (unint64_t)requestPriority
{
  return *(_QWORD *)(-[NSURLRequest _inner](self, "_inner") + 88);
}

- (void)_setTimeWindowDelay:(double)a3
{
  *(double *)(-[NSURLRequest _inner](self, "_inner") + 128) = a3;
}

- (void)_setTimeWindowDuration:(double)a3
{
  *(double *)(-[NSURLRequest _inner](self, "_inner") + 136) = a3;
}

- (void)_setStartTimeoutDate:(id)a3
{
  _QWORD *v4;
  uint64_t v5;

  v4 = -[NSURLRequest _inner](self, "_inner");
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  v4[18] = v5;
}

- (void)_setRequiresShortConnectionTimeout:(BOOL)a3
{
  *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 152) = a3;
}

- (void)_setPreventHSTSStorage:(BOOL)a3
{
  *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 153) = a3;
}

- (void)_setIgnoreHSTS:(BOOL)a3
{
  *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 154) = a3;
}

- (void)_setSchemeWasUpgradedDueToDynamicHSTS:(BOOL)a3
{
  *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 155) = a3;
}

- (void)_setPayloadTransmissionTimeout:(double)a3
{
  *(double *)(-[NSURLRequest _inner](self, "_inner") + 184) = a3;
}

@end
