@implementation NWURLLoaderData

- (void)start:(id)a3
{
  void (**v4)(_QWORD);
  NSURL *URL;
  CFDataRef v6;
  void *v7;
  CFDictionaryRef v8;
  void *v9;
  void *v10;
  NSObject *v11;
  SInt32 errorCode;
  CFDictionaryRef properties;
  CFDataRef resourceData;
  uint8_t buf[4];
  SInt32 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  properties = 0;
  resourceData = 0;
  errorCode = 0;
  if (self)
    URL = self->_URL;
  else
    URL = 0;
  if (CFURLCreateDataAndPropertiesFromResource((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFURLRef)URL, &resourceData, &properties, 0, &errorCode))
  {
    v6 = resourceData;
    v7 = (void *)-[__CFData _createDispatchData](resourceData, "_createDispatchData");
    if (self)
      objc_storeStrong((id *)&self->_data, v7);

    v8 = properties;
    -[__CFDictionary objectForKeyedSubscript:](properties, "objectForKeyedSubscript:", CFSTR("kCFDataURLMimeType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      objc_storeStrong((id *)&self->_MIMEType, v9);

    -[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("kCFDataURLTextEncodingName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      objc_storeStrong((id *)&self->_textEncodingName, v10);

    v4[2](v4);
  }
  else
  {
    if (__nwlog_url_log::onceToken != -1)
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
    v11 = (id)gurlLogObj;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v16 = errorCode;
      _os_log_impl(&dword_182FBE000, v11, OS_LOG_TYPE_ERROR, "Failed to parse data URL %d", buf, 8u);
    }

    v4[2](v4);
  }

}

- (void)readResponse:(id)a3
{
  id v4;
  NWURLLoaderData *v5;
  NSString *v6;
  NSObject *data;
  size_t size;
  NSString *textEncodingName;
  NSObject *v10;
  void *v11;
  NWURLError *v12;
  uint64_t v13;
  NSURL *URL;
  void (**v15)(id, _QWORD, NWURLLoaderData *);
  objc_super v16;

  v15 = (void (**)(id, _QWORD, NWURLLoaderData *))a3;
  if (!self || !self->_data)
  {
    v12 = [NWURLError alloc];
    if (v12)
    {
      v13 = *MEMORY[0x1E0CB32E8];
      v16.receiver = v12;
      v16.super_class = (Class)NWURLError;
      v5 = -[NWURLLoaderData initWithDomain:code:userInfo:](&v16, sel_initWithDomain_code_userInfo_, v13, -1000, 0);
      if (self)
      {
LABEL_7:
        URL = self->_URL;
LABEL_8:
        -[NWURLLoaderData setFailingURL:](v5, "setFailingURL:", URL);
        v15[2](v15, 0, v5);
        goto LABEL_4;
      }
    }
    else
    {
      v5 = 0;
      if (self)
        goto LABEL_7;
    }
    URL = 0;
    goto LABEL_8;
  }
  v4 = objc_alloc(MEMORY[0x1E0C92C88]);
  v5 = self->_URL;
  v6 = self->_MIMEType;
  data = self->_data;
  size = dispatch_data_get_size(data);
  textEncodingName = self->_textEncodingName;
  v10 = data;
  v11 = (void *)objc_msgSend(v4, "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v5, v6, size, textEncodingName);
  ((void (**)(id, void *, NWURLLoaderData *))v15)[2](v15, v11, 0);

LABEL_4:
}

- (void)readDataOfMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5
{
  NSObject *data;
  size_t size;
  size_t offset;
  size_t v10;
  NWURLLoaderData *subrange;
  void (*v12)(void);
  NWURLError *v13;
  uint64_t v14;
  _QWORD *v15;
  objc_super v16;

  v15 = a5;
  if (self && (data = self->_data) != 0)
  {
    size = dispatch_data_get_size((dispatch_data_t)self->_data);
    offset = self->_offset;
    if (size - offset >= a4)
      v10 = a4;
    else
      v10 = size - offset;
    subrange = (NWURLLoaderData *)dispatch_data_create_subrange(data, offset, v10);
    self->_offset += v10;
    v12 = (void (*)(void))v15[2];
  }
  else
  {
    v13 = [NWURLError alloc];
    if (v13)
    {
      v14 = *MEMORY[0x1E0CB32E8];
      v16.receiver = v13;
      v16.super_class = (Class)NWURLError;
      subrange = -[NWURLLoaderData initWithDomain:code:userInfo:](&v16, sel_initWithDomain_code_userInfo_, v14, -1000, 0);
    }
    else
    {
      subrange = 0;
    }
    v12 = (void (*)(void))v15[2];
  }
  v12();

}

- (NSString)multipartMixedReplaceBoundary
{
  return 0;
}

- (OS_sec_trust)peerTrust
{
  return 0;
}

- (BOOL)requestComplete
{
  return 1;
}

- (void)notifyRequestCompletion:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (id)takeCachedResponse
{
  return 0;
}

- (OS_nw_http_fields)trailerFields
{
  return 0;
}

- (BOOL)allowsWrite
{
  return 0;
}

- (void)writeData:(id)a3 complete:(BOOL)a4 completionHandler:(id)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a5;
  _os_crash();
  __break(1u);
}

- (OS_nw_connection)underlyingConnection
{
  OS_nw_connection *result;

  result = (OS_nw_connection *)_os_crash();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textEncodingName, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (id)initWithURL:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)NWURLLoaderData;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

@end
