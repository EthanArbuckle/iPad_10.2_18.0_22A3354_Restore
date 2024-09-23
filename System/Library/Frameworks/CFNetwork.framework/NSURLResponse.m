@implementation NSURLResponse

- (URLResponse)_inner
{
  return -[NSURLResponseInternal _inner](self->_internal, "_inner");
}

- (id)_initWithInternal:(id)a3
{
  NSURLResponse *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSURLResponse;
  v4 = -[NSURLResponse init](&v6, sel_init);
  if (v4)
    v4->_internal = (NSURLResponseInternal *)a3;
  return v4;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  uint64_t v5;
  objc_super v7;

  v5 = objc_opt_class();
  if (v5 == objc_opt_class() && (sel_isEqual(a3, sel_statusCode) || sel_isEqual(a3, sel_allHeaderFields)))
    return 0;
  v7.receiver = self;
  v7.super_class = (Class)NSURLResponse;
  return -[NSURLResponse respondsToSelector:](&v7, sel_respondsToSelector_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  const __CFAllocator *Default;
  uint64_t v6;
  int v7;
  unint64_t v8;
  const void *v9;
  NSURLResponse *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  v13 = 8;
  Default = CFAllocatorGetDefault();
  if (self)
  {
    v11 = 0;
    v12 = 0;
    v10 = 0;
    URLResponse::createArchiveList(-[NSURLResponse _inner](self, "_inner"), Default, &v12, (const void ***)&v10, &v11);
    self = v10;
    v6 = v11;
    v7 = v12;
  }
  else
  {
    v7 = 0;
    v6 = 7;
  }
  objc_msgSend(a3, "encodeValueOfObjCType:at:", "i", &v13);
  v13 = v7;
  objc_msgSend(a3, "encodeValueOfObjCType:at:", "i", &v13);
  v13 = v6;
  objc_msgSend(a3, "encodeValueOfObjCType:at:", "i", &v13);
  if (v6 >= 1)
  {
    v8 = 0;
    while (1)
    {
      v9 = (const void *)*((_QWORD *)&self->super.isa + v8);
      if (objc_msgSend(a3, "requiresSecureCoding"))
      {
        if (objc_msgSend(a3, "allowsKeyedCoding"))
          break;
      }
      objc_msgSend(a3, "encodeObject:", v9);
      if (v9)
        goto LABEL_11;
LABEL_12:
      if (v6 == ++v8)
        goto LABEL_13;
    }
    objc_msgSend(a3, "encodeObject:forKey:", v9, +[NSURLResponse getObjectKeyWithIndex:]((uint64_t)NSURLResponse, v8));
    if (!v9)
      goto LABEL_12;
LABEL_11:
    CFRelease(v9);
    goto LABEL_12;
  }
LABEL_13:
  CFAllocatorDeallocate(Default, self);
}

- (NSURLResponse)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSURLResponse *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const void **v15;
  int64_t v16;
  int v17;
  uint64_t v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;

  v22 = 0;
  objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "i", &v22, 4);
  if (v22 <= 6)
    goto LABEL_17;
  if (v22 == 7)
  {
    v5 = objc_msgSend(a3, "decodeObject");
    if (!v5 || (objc_opt_self(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v6 = objc_msgSend(a3, "decodeObject");
      if (v6)
      {
        v7 = v6;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = objc_msgSend(a3, "decodeObject");
          if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v21 = 0;
            objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "q", &v21, 8);
            v9 = -[NSURLResponse initWithURL:MIMEType:expectedContentLength:textEncodingName:](self, "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v5, v7, v21, v8);
            v20 = 0;
            objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "d", &v20, 8);
            v10 = -[NSURLResponse _inner](v9, "_inner");
            *(_QWORD *)(v10 + 40) = v20;
            v11 = *(_QWORD *)(v10 + 88);
            if (v11)
              *(_WORD *)(v11 + 297) |= 0x1000u;
            return v9;
          }
        }
      }
    }
LABEL_17:

    return 0;
  }
  LODWORD(v21) = 0;
  LODWORD(v20) = 0;
  if (objc_msgSend(a3, "requiresSecureCoding"))
  {
    if (-[NSURLResponse initWithCoder:]::onceToken != -1)
      dispatch_once(&-[NSURLResponse initWithCoder:]::onceToken, &__block_literal_global_261);
    v12 = (void *)objc_msgSend(a3, "allowedClasses");
    v13 = objc_msgSend(v12, "setByAddingObjectsFromSet:", -[NSURLResponse initWithCoder:]::plistClasses);
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "i", &v21, 4);
  objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "i", &v20, 4);
  if (v20 > 7)
    goto LABEL_17;
  v15 = (const void **)malloc_type_malloc(8 * v20, 0xC0040B8AA526DuLL);
  if ((int)v20 < 1)
    goto LABEL_29;
  v16 = 0;
  v17 = 0;
  do
  {
    if (objc_msgSend(a3, "requiresSecureCoding"))
      v18 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v13, +[NSURLResponse getObjectKeyWithIndex:]((uint64_t)NSURLResponse, v16));
    else
      v18 = objc_msgSend(a3, "decodeObject");
    v15[v16] = (const void *)v18;
    if (v18)
      ++v17;
    ++v16;
  }
  while (v16 < (int)v20);
  if (v17)
  {
    v19 = (const void *)_CFURLResponseCreateFromArchiveList(v18, (int)v21, v15, (int)v20);
    v9 = -[NSURLResponse _initWithCFURLResponse:](self, "_initWithCFURLResponse:", v19);
    CFRelease(v19);
  }
  else
  {
LABEL_29:

    v9 = 0;
  }
  free(v15);
  return v9;
}

+ (__CFString)getObjectKeyWithIndex:(uint64_t)a1
{
  objc_opt_self();
  if (a2 >= 0x1F)
    __assert_rtn("+[NSURLResponse getObjectKeyWithIndex:]", "NSURLResponse.mm", 210, "false");
  return _objectKeys[a2];
}

+ (id)_responseWithCFURLResponse:(_CFURLResponse *)a3
{
  uint64_t v4;
  __objc2_class **v5;

  v4 = -[_CFURLResponse _inner](a3, "_inner");
  v5 = off_1E14E1738;
  if (*(_QWORD *)(v4 + 88))
    v5 = &off_1E14E15E8;
  return (id)objc_msgSend(objc_alloc(*v5), "_initWithCFURLResponse:", a3);
}

- (id)_initWithCFURLResponse:(_CFURLResponse *)a3
{
  NSURLResponse *v4;
  objc_super v6;

  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)NSURLResponse;
    v4 = -[NSURLResponse init](&v6, sel_init);
    if (v4)
      v4->_internal = (NSURLResponseInternal *)*((id *)a3 + 1);
  }
  else
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSURLResponse;
  -[NSURLResponse dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSURLResponse;
  return (id)objc_msgSend(-[NSURLResponse description](&v3, sel_description), "stringByAppendingFormat:", CFSTR(" { URL: %@ }"), -[NSURLResponse URL](self, "URL"));
}

- (NSURL)URL
{
  return (NSURL *)-[NSURLResponse _inner](self, "_inner")[8];
}

- (NSString)MIMEType
{
  return (NSString *)URLResponse::getMIMEType(-[NSURLResponse _inner](self, "_inner"));
}

id __31__NSURLResponse_initWithCoder___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id result;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  result = (id)objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  -[NSURLResponse initWithCoder:]::plistClasses = (uint64_t)result;
  return result;
}

- (void)_setMIMEType:(id)a3
{
  CFURLResponseSetMIMEType(self, (const __CFString *)a3);
}

- (NSURLResponse)initWithURL:(NSURL *)URL MIMEType:(NSString *)MIMEType expectedContentLength:(NSInteger)length textEncodingName:(NSString *)name
{
  NSURLResponse *v10;
  NSURLResponseInternal *v11;
  uint64_t v12;
  uint64_t v13;
  CFHTTPMessageRef Empty;
  uint64_t Instance;
  uint64_t v16;
  const char **v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)NSURLResponse;
  v10 = -[NSURLResponse init](&v19, sel_init);
  if (v10)
  {
    if (!MIMEType)
      MIMEType = (NSString *)CFSTR("application/octet-stream");
    v11 = objc_alloc_init(NSURLResponseInternal);
    v10->_internal = v11;
    URLResponse::initialize((uint64_t)-[NSURLResponseInternal _inner](v11, "_inner"), URL, (const __CFString *)MIMEType, length, (const __CFString *)name, 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[NSURLResponseInternal _inner](v10->_internal, "_inner");
      if (!*(_QWORD *)(v12 + 88))
      {
        v13 = v12;
        Empty = CFHTTPMessageCreateEmpty((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
        if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1)
          dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5133);
        Instance = _CFRuntimeCreateInstance();
        v16 = Instance;
        if (Instance)
        {
          *(_OWORD *)(Instance + 16) = 0u;
          v16 = Instance + 16;
          *(_QWORD *)(Instance + 352) = 0;
          *(_OWORD *)(Instance + 320) = 0u;
          *(_OWORD *)(Instance + 336) = 0u;
          *(_OWORD *)(Instance + 288) = 0u;
          *(_OWORD *)(Instance + 304) = 0u;
          *(_OWORD *)(Instance + 256) = 0u;
          *(_OWORD *)(Instance + 272) = 0u;
          *(_OWORD *)(Instance + 224) = 0u;
          *(_OWORD *)(Instance + 240) = 0u;
          *(_OWORD *)(Instance + 192) = 0u;
          *(_OWORD *)(Instance + 208) = 0u;
          *(_OWORD *)(Instance + 160) = 0u;
          *(_OWORD *)(Instance + 176) = 0u;
          *(_OWORD *)(Instance + 128) = 0u;
          *(_OWORD *)(Instance + 144) = 0u;
          *(_OWORD *)(Instance + 96) = 0u;
          *(_OWORD *)(Instance + 112) = 0u;
          *(_OWORD *)(Instance + 64) = 0u;
          *(_OWORD *)(Instance + 80) = 0u;
          *(_OWORD *)(Instance + 32) = 0u;
          *(_OWORD *)(Instance + 48) = 0u;
        }
        if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1)
          dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5133);
        if (*((_BYTE *)Empty + 40))
          v17 = (const char **)((char *)Empty + 16);
        else
          v17 = 0;
        HTTPResponseMessage::HTTPResponseMessage((HTTPResponseMessage *)v16, v17);
        *(_QWORD *)v16 = &off_1E14E6048;
        *(_QWORD *)(v16 + 8) = &unk_1E14E60B8;
        *(_QWORD *)(v16 + 16) = &unk_1E14E60D8;
        *(_WORD *)(v16 + 297) = 0;
        *(_BYTE *)(v16 + 299) = 0;
        *(_QWORD *)(v13 + 88) = v16;
        *(_WORD *)(v16 + 297) |= 0x200u;
        *(_WORD *)(*(_QWORD *)(v13 + 88) + 297) |= 0x4000u;
        *(_WORD *)(*(_QWORD *)(v13 + 88) + 297) |= 0x100u;
        *(_WORD *)(*(_QWORD *)(v13 + 88) + 297) |= 0x2000u;
        CFRelease(Empty);
      }
    }
  }
  return v10;
}

- (NSURLResponse)init
{
  return -[NSURLResponse initWithURL:MIMEType:expectedContentLength:textEncodingName:](self, "initWithURL:MIMEType:expectedContentLength:textEncodingName:", 0, 0, -1, 0);
}

- (NSString)suggestedFilename
{
  return (NSString *)(id)URLResponse::copySuggestedFilename(-[NSURLResponse _inner](self, "_inner"));
}

- (int64_t)statusCode
{
  NSObject *v2;
  uint8_t v4[16];

  if (dyld_program_sdk_at_least())
  {
    if (__CFNAPIMisuseFaultLogHandle::onceToken != -1)
      dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_7_4765);
    v2 = __CFNAPIMisuseFaultLogHandle::logger;
    if (os_log_type_enabled((os_log_t)__CFNAPIMisuseFaultLogHandle::logger, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_fault_impl(&dword_183ECA000, v2, OS_LOG_TYPE_FAULT, "-statusCode called on NSURLResponse", v4, 2u);
    }
  }
  return 200;
}

- (NSDictionary)allHeaderFields
{
  NSObject *v2;
  uint8_t v4[16];

  if (dyld_program_sdk_at_least())
  {
    if (__CFNAPIMisuseFaultLogHandle::onceToken != -1)
      dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_7_4765);
    v2 = __CFNAPIMisuseFaultLogHandle::logger;
    if (os_log_type_enabled((os_log_t)__CFNAPIMisuseFaultLogHandle::logger, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_fault_impl(&dword_183ECA000, v2, OS_LOG_TYPE_FAULT, "-allHeaderFields called on NSURLResponse", v4, 2u);
    }
  }
  return (NSDictionary *)MEMORY[0x1E0C9AA70];
}

- (URLResponse)_cf_resp_data
{
  return self->__cf_resp_data;
}

- (void)set_cf_resp_data:(URLResponse *)a3
{
  self->__cf_resp_data = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1 && (sel_isEqual(a3, sel_statusCode) || sel_isEqual(a3, sel_allHeaderFields)))
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___NSURLResponse;
  return objc_msgSendSuper2(&v6, sel_instancesRespondToSelector_, a3);
}

- (void)_setExpectedContentLength:(int64_t)a3
{
  URLResponse *v4;
  HTTPResponse *fHTTP;

  v4 = -[NSURLResponse _inner](self, "_inner");
  v4->fExpectedContentLength = a3;
  fHTTP = v4->fHTTP;
  if (fHTTP)
  {
    *(_WORD *)((char *)fHTTP + 297) |= 0x100u;
    *(_WORD *)((char *)v4->fHTTP + 297) |= 0x2000u;
  }
}

- (void)_setSSLCertificateContext:(id)a3
{
  URLResponse *v4;
  __CFDictionary *fSSLCertContext;
  __CFDictionary *v6;

  v4 = -[NSURLResponse _inner](self, "_inner");
  fSSLCertContext = v4->fSSLCertContext;
  if (fSSLCertContext)
    CFRelease(fSSLCertContext);
  if (a3)
    v6 = (__CFDictionary *)CFRetain(a3);
  else
    v6 = 0;
  v4->fSSLCertContext = v6;
}

- (id)_lastModifiedDate
{
  if (URLResponse::getLastModifiedDate(-[NSURLResponse _inner](self, "_inner")) == 0.0)
    return 0;
  else
    return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
}

- (BOOL)_mustRevalidate
{
  return _CFURLResponseMustRevalidate(self) != 0;
}

- (double)_freshnessLifetime
{
  URLResponse *v2;
  double result;

  v2 = -[NSURLResponse _inner](self, "_inner");
  if (!v2->fHTTP)
    return 1.79769313e308;
  URLResponse::freshnessLifetimeForResponse(v2);
  return result;
}

- (id)_peerCertificateChain
{
  return 0;
}

@end
