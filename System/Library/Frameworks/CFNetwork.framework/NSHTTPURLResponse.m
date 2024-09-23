@implementation NSHTTPURLResponse

- (NSInteger)statusCode
{
  uint64_t v2;

  v2 = (uint64_t)-[NSURLResponse _inner](self, "_inner")[88];
  if (v2)
    return CFHTTPMessageGetResponseStatusCode((CFHTTPMessageRef)(v2 - 16));
  else
    return 0;
}

- (id)_allHTTPHeaderFieldsAsArrays
{
  uint64_t v2;
  uint64_t v3;
  CFDictionaryRef v4;

  if (self->super._internal
    && ((v2 = (uint64_t)-[NSURLResponse _inner](self, "_inner")[88]) != 0 ? (v3 = v2 - 16) : (v3 = 0), v2))
  {
    if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1)
      dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5133);
    v4 = HTTPMessage::copyAsMultiValueDict((HTTPMessage *)(v3 + 16));
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NSString)valueForHTTPHeaderField:(NSString *)field
{
  uint64_t v4;
  CFStringRef v5;

  v4 = (uint64_t)-[NSURLResponse _inner](self, "_inner")[88];
  if (!v4)
    return 0;
  v5 = CFHTTPMessageCopyHeaderFieldValue((CFHTTPMessageRef)(v4 - 16), (CFStringRef)field);
  return (NSString *)(id)CFMakeCollectable(v5);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v4;
  char v5;
  int v6;

  v5 = 0;
  v4.receiver = self;
  v4.super_class = (Class)NSHTTPURLResponse;
  -[NSURLResponse encodeWithCoder:](&v4, sel_encodeWithCoder_);
  v6 = 9;
  objc_msgSend(a3, "encodeValueOfObjCType:at:", "i", &v6);
  objc_msgSend(a3, "encodeValueOfObjCType:at:", "B", &v5);
}

- (NSHTTPURLResponse)initWithCoder:(id)a3
{
  NSHTTPURLResponse *v4;
  const void *v5;
  uint64_t v6;
  CFTypeID v7;
  const void *v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  uint64_t ExpectedContentLength;
  uint64_t v13;
  uint64_t v14;
  __CFString *MIMEType;
  double ExpirationTime;
  uint64_t v17;
  uint64_t v18;
  CFTypeID v20;
  char v21;
  uint64_t v22;
  char v23;
  __int16 v24;
  uint64_t v25;
  unsigned int v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)NSHTTPURLResponse;
  v4 = -[NSURLResponse initWithCoder:](&v27, sel_initWithCoder_);
  if (v4)
  {
    v26 = 0;
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "i", &v26, 4);
    if (v26 - 10 < 0xFFFFFFFC)
    {
LABEL_3:

      return 0;
    }
    if (v26 > 7)
    {
      if (!v4->_httpInternal)
        v4->_httpInternal = objc_alloc_init(NSHTTPURLResponseInternal);
      LOBYTE(v25) = 0;
      objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "B", &v25, 1);
    }
    else
    {
      v5 = (const void *)objc_msgSend(a3, "decodeObject");
      if (!v5)
        goto LABEL_3;
      v6 = (uint64_t)v5;
      v7 = CFGetTypeID(v5);
      if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1)
      {
        v20 = v7;
        dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5133);
        v7 = v20;
      }
      if (v7 != *(_QWORD *)(HTTPMessage::Class(void)::sClass_OBJTYPE + 96))
        goto LABEL_3;
      v25 = 0;
      v24 = 0;
      v23 = 0;
      v22 = 0;
      v21 = 0;
      objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "d", &v25, 8);
      objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "d", &v22, 8);
      objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "B", &v21, 1);
      objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "B", &v23, 1);
      objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "B", (char *)&v24 + 1, 1);
      objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "B", &v24, 1);
      if (!v4->_httpInternal)
        v4->_httpInternal = objc_alloc_init(NSHTTPURLResponseInternal);
      if (v26 == 7)
        objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "B", &v21, 1);
      v8 = (const void *)-[NSURLResponse _inner](v4, "_inner")[8];
      v9 = -[NSURLResponse _inner](v4, "_inner");
      v10 = (id *)CFURLResponseCreateWithHTTPResponse(v9, v8, v6, *(_DWORD *)(v9 + 72));
      v11 = v25;
      *(_QWORD *)(objc_msgSend(v10, "_inner") + 48) = v11;
      if ((_BYTE)v24)
      {
        ExpectedContentLength = CFURLResponseGetExpectedContentLength(v4);
        v13 = objc_msgSend(v10, "_inner");
        *(_QWORD *)(v13 + 32) = ExpectedContentLength;
        v14 = *(_QWORD *)(v13 + 88);
        if (v14)
        {
          *(_WORD *)(v14 + 297) |= 0x100u;
          *(_WORD *)(*(_QWORD *)(v13 + 88) + 297) |= 0x2000u;
        }
      }
      if (HIBYTE(v24))
      {
        MIMEType = URLResponse::getMIMEType(-[NSURLResponse _inner](v4, "_inner"));
        CFURLResponseSetMIMEType(v10, MIMEType);
      }
      if (v23)
      {
        ExpirationTime = CFURLResponseGetExpirationTime(v4);
        v17 = objc_msgSend(v10, "_inner");
        *(double *)(v17 + 40) = ExpirationTime;
        v18 = *(_QWORD *)(v17 + 88);
        if (v18)
          *(_WORD *)(v18 + 297) |= 0x1000u;
      }
      v4->super._internal = (NSURLResponseInternal *)v10[1];

    }
  }
  return v4;
}

- (id)_initWithCFURLResponse:(_CFURLResponse *)a3
{
  _QWORD *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSHTTPURLResponse;
  v3 = -[NSURLResponse _initWithCFURLResponse:](&v5, sel__initWithCFURLResponse_, a3);
  if (v3)
    v3[3] = objc_alloc_init(NSHTTPURLResponseInternal);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSHTTPURLResponse;
  -[NSURLResponse dealloc](&v3, sel_dealloc);
}

- (NSDictionary)allHeaderFields
{
  uint64_t v2;
  CFDictionaryRef v3;
  CFDictionaryRef v4;
  NSDictionary *v5;

  v2 = (uint64_t)-[NSURLResponse _inner](self, "_inner")[88];
  if (v2
    && (v3 = CFHTTPMessageCopyAllHeaderFields((CFHTTPMessageRef)(v2 - 16))) != 0
    && (v4 = v3, v5 = (NSDictionary *)(id)-[__CFDictionary copy](v3, "copy"), CFRelease(v4), v5))
  {
    return v5;
  }
  else
  {
    return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  }
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSHTTPURLResponse;
  return (id)objc_msgSend(-[NSURLResponse description](&v3, sel_description), "stringByAppendingFormat:", CFSTR(" { Status Code: %ld, Headers %@ }"), -[NSHTTPURLResponse statusCode](self, "statusCode"), -[NSHTTPURLResponse _allHTTPHeaderFieldsAsArrays](self, "_allHTTPHeaderFieldsAsArrays"));
}

+ (NSString)localizedStringForStatusCode:(NSInteger)statusCode
{
  const __CFString *v4;
  NSInteger v5;
  __CFString **v6;

  if ((unint64_t)(statusCode - 601) < 0xFFFFFFFFFFFFFE0BLL)
    return (NSString *)CFSTR("server error");
  if ((unint64_t)statusCode > 0xC7)
  {
    if ((unint64_t)statusCode > 0x12B)
    {
      if ((unint64_t)statusCode > 0x18F)
      {
        if ((unint64_t)statusCode > 0x1F3)
        {
          if ((unint64_t)statusCode > 0x257)
            return (NSString *)&stru_1E1500C68;
          v5 = statusCode - 500;
          if ((unint64_t)(statusCode - 500) >= 6)
            return (NSString *)CFSTR("server error");
          v6 = off_1E14F6880;
        }
        else
        {
          v5 = statusCode - 400;
          if ((unint64_t)(statusCode - 400) >= 0x12)
            return (NSString *)CFSTR("client error");
          v6 = off_1E14F67F0;
        }
      }
      else
      {
        v5 = statusCode - 300;
        if ((unint64_t)(statusCode - 300) >= 8)
          return (NSString *)CFSTR("redirected");
        v6 = off_1E14F67B0;
      }
    }
    else
    {
      v5 = statusCode - 200;
      if ((unint64_t)(statusCode - 200) >= 7)
        return (NSString *)CFSTR("success");
      v6 = off_1E14F6778;
    }
    return &v6[v5]->isa;
  }
  v4 = CFSTR("informational");
  if (statusCode == 101)
    v4 = CFSTR("switching protocols");
  if (statusCode == 100)
    return (NSString *)CFSTR("continue");
  else
    return &v4->isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSHTTPURLResponse)initWithURL:(NSURL *)url statusCode:(NSInteger)statusCode HTTPVersion:(NSString *)HTTPVersion headerFields:(NSDictionary *)headerFields
{
  char *ResponseNoParser;
  __CFHTTPMessage *v10;
  id v11;
  const void *v12;
  NSHTTPURLResponse *v13;

  ResponseNoParser = _CFHTTPMessageCreateResponseNoParser(*MEMORY[0x1E0C9AE00], statusCode, 0, (const __CFString *)HTTPVersion);
  if (ResponseNoParser)
  {
    v10 = (__CFHTTPMessage *)ResponseNoParser;
    if (headerFields)
    {
      ResponseNoParser = -[NSDictionary count](headerFields, "count");
      if (ResponseNoParser)
        _CFHTTPMessageSetMultipleHeaderFields(v10, (CFDictionaryRef)headerFields);
    }
    v11 = CFURLResponseCreateWithHTTPResponse((uint64_t)ResponseNoParser, url, (uint64_t)v10, 0);
    if (v11)
    {
      v12 = v11;
      v13 = -[NSHTTPURLResponse _initWithCFURLResponse:](self, "_initWithCFURLResponse:", v11);
      CFRelease(v12);
    }
    else
    {

      v13 = 0;
    }
    CFRelease(v10);
  }
  else
  {

    return 0;
  }
  return v13;
}

- (NSHTTPURLResponse)initWithURL:(id)a3 statusCode:(int64_t)a4 headerFields:(id)a5 requestTime:(double)a6
{
  return -[NSHTTPURLResponse initWithURL:statusCode:HTTPVersion:headerFields:](self, "initWithURL:statusCode:HTTPVersion:headerFields:", a3, a4, CFSTR("HTTP/1.1"), a5, a6);
}

- (id)_peerCertificateChain
{
  const __CFDictionary *v2;
  const void *Value;

  v2 = (const __CFDictionary *)-[NSURLResponse _inner](self, "_inner")[64];
  if (v2 && (Value = CFDictionaryGetValue(v2, CFSTR("kCFStreamPropertySSLPeerCertificates"))) != 0)
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", Value);
  else
    return 0;
}

+ (BOOL)isErrorStatusCode:(int64_t)a3
{
  return (unint64_t)(a3 - 400) < 0xFFFFFFFFFFFFFED4;
}

- (NSHTTPURLResponse)initWithHTTPPropertyList:(id)a3 URL:(id)a4
{
  const void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char *ResponseNoParser;
  unint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  NSHTTPURLResponse *v19;
  id v21;
  _QWORD v22[5];
  _QWORD v23[2];
  void (*v24)(uint64_t);
  void *v25;
  char *v26;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (const void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("statusDescription"));
    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v8 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("headerFields"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v8, "count"))
        {
          v9 = 0;
          v10 = -1;
          while (1)
          {
            v11 = (void *)objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              break;
            v12 = (void *)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("name"));
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              break;
            v13 = (void *)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("value"));
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              break;
            if (objc_msgSend(v12, "hasPrefix:", CFSTR(":")))
            {
              if (objc_msgSend(v12, "isEqualToString:", CFSTR(":status")))
                v10 = objc_msgSend(v13, "integerValue");
              if (++v9 < objc_msgSend(v8, "count"))
                continue;
            }
            if (v10 == -1)
              break;
            ResponseNoParser = _CFHTTPMessageCreateResponseNoParser(*MEMORY[0x1E0C9AE00], v10, v7, CFSTR("HTTP/1.1"));
            v23[0] = MEMORY[0x1E0C809B0];
            v23[1] = 3221225472;
            v24 = __62__NSHTTPURLResponse_SwiftTypes__initWithHTTPPropertyList_URL___block_invoke;
            v25 = &__block_descriptor_40_e5_v8__0l;
            v26 = ResponseNoParser;
            while (1)
            {
              v15 = objc_msgSend(v8, "count");
              if (v9 >= v15)
              {
                v21 = CFURLResponseCreateWithHTTPResponse(v15, a4, (uint64_t)ResponseNoParser, 0);
                v22[0] = MEMORY[0x1E0C809B0];
                v22[1] = 3221225472;
                v22[2] = __62__NSHTTPURLResponse_SwiftTypes__initWithHTTPPropertyList_URL___block_invoke_2;
                v22[3] = &__block_descriptor_40_e5_v8__0l;
                v22[4] = v21;
                v19 = -[NSHTTPURLResponse _initWithCFURLResponse:](self, "_initWithCFURLResponse:", v21);
                __62__NSHTTPURLResponse_SwiftTypes__initWithHTTPPropertyList_URL___block_invoke_2((uint64_t)v22);
                goto LABEL_27;
              }
              v16 = (void *)objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                break;
              v17 = (__CFString *)objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("name"));
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                break;
              v18 = (__CFString *)objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("value"));
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0
                || (-[__CFString hasPrefix:](v17, "hasPrefix:", CFSTR(":")) & 1) != 0)
              {
                break;
              }
              _CFHTTPMessageAddHeaderFieldValue((uint64_t)ResponseNoParser, v17, v18);
              ++v9;
            }

            v19 = 0;
LABEL_27:
            v24((uint64_t)v23);
            return v19;
          }
        }
      }
    }
  }

  return 0;
}

- (id)HTTPPropertyList
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  _QWORD v14[2];
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD v18[2];
  void (*v19)(uint64_t);
  void *v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  v4 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v19 = __49__NSHTTPURLResponse_SwiftTypes__HTTPPropertyList__block_invoke;
  v20 = &unk_1E14FE118;
  v21 = v3;
  v5 = (uint64_t)-[NSURLResponse _inner](self, "_inner")[88];
  if (v5)
    v6 = v5 - 16;
  else
    v6 = 0;
  if (v5)
  {
    if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1)
      dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5133);
    if (*(_BYTE *)(v6 + 40))
    {
      v7 = *(_QWORD *)(v6 + 152);
      if (v7)
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("statusDescription"));
    }
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14[0] = v4;
  v14[1] = 3221225472;
  v15 = __49__NSHTTPURLResponse_SwiftTypes__HTTPPropertyList__block_invoke_2;
  v16 = &unk_1E14FE118;
  v17 = v8;
  v22[0] = CFSTR("name");
  v22[1] = CFSTR("value");
  v23[0] = CFSTR(":status");
  v23[1] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), CFHTTPMessageGetResponseStatusCode((CFHTTPMessageRef)v6));
  objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2));
  if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1)
    dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5133);
  if (v5)
    v9 = v6 + 16;
  else
    v9 = 0;
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __49__NSHTTPURLResponse_SwiftTypes__HTTPPropertyList__block_invoke_3;
  v13[3] = &unk_1E14FC1E8;
  v13[4] = v8;
  (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v9 + 56))(v9, v13);
  v10 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("headerFields"));

  v11 = (id)objc_msgSend(v3, "copy");
  v15((uint64_t)v14);
  v19((uint64_t)v18);
  return v11;
}

void __49__NSHTTPURLResponse_SwiftTypes__HTTPPropertyList__block_invoke(uint64_t a1)
{

}

void __49__NSHTTPURLResponse_SwiftTypes__HTTPPropertyList__block_invoke_2(uint64_t a1)
{

}

uint64_t __49__NSHTTPURLResponse_SwiftTypes__HTTPPropertyList__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v5[0] = CFSTR("name");
  v5[1] = CFSTR("value");
  v6[0] = a2;
  v6[1] = a3;
  return objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2));
}

void __62__NSHTTPURLResponse_SwiftTypes__initWithHTTPPropertyList_URL___block_invoke(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

void __62__NSHTTPURLResponse_SwiftTypes__initWithHTTPPropertyList_URL___block_invoke_2(uint64_t a1)
{

}

@end
