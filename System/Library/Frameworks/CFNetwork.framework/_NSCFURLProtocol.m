@implementation _NSCFURLProtocol

+ (id)canonicalRequestForRequest:(id)a3 task:(id)a4
{
  uint64_t v6;
  const void *v7;
  id v8;

  v6 = objc_msgSend(a1, "_cf_internalImpl");
  v7 = (const void *)(*(uint64_t (**)(_QWORD, id, id, _QWORD))(v6 + 48))(*MEMORY[0x1E0C9AE00], a3, a4, 0);
  v8 = -[NSURLRequest _initWithCFURLRequest:]([NSURLRequest alloc], "_initWithCFURLRequest:", v7);
  if (v7)
    CFRelease(v7);
  return v8;
}

+ (BOOL)canInitWithTask:(id)a3
{
  uint64_t v4;
  uint64_t (*v5)(id, _QWORD);
  int v6;

  v4 = objc_msgSend(a1, "_cf_internalImpl");
  v5 = *(uint64_t (**)(id, _QWORD))(v4 + 72);
  if (v5)
    v6 = v5(a3, 0);
  else
    v6 = (*(uint64_t (**)(uint64_t, _QWORD))(v4 + 40))(objc_msgSend(a3, "currentRequest"), 0);
  return v6 != 0;
}

+ (BOOL)canInitWithRequest:(id)a3
{
  return (*(unsigned int (**)(id, _QWORD))(objc_msgSend(a1, "_cf_internalImpl") + 40))(a3, 0) != 0;
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  return (*(unsigned int (**)(id, id, _QWORD))(objc_msgSend(a1, "_cf_internalImpl") + 56))(a3, a4, 0) != 0;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  NSURLSessionTask *v5;
  void *v6;

  v5 = -[NSURLSessionTask initWithOriginalRequest:ident:taskGroup:]([NSURLSessionTask alloc], "initWithOriginalRequest:ident:taskGroup:", a3, 0, objc_msgSend((id)+[NSURLSession _sharedSessionForConnection](), "defaultTaskGroup"));
  v6 = (void *)objc_msgSend(a1, "canonicalRequestForRequest:task:", a3, v5);

  return v6;
}

- (_NSCFURLProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5
{
  _NSCFURLProtocol *v7;
  uint64_t v8;
  NSCFURLProtocolClient *v9;
  NSURLSessionTask *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_NSCFURLProtocol;
  v7 = -[NSURLProtocol initWithRequest:cachedResponse:client:](&v12, sel_initWithRequest_cachedResponse_client_, a3, a4);
  if (v7)
  {
    v8 = objc_msgSend((id)objc_opt_class(), "_cf_internalImpl");
    v9 = (NSCFURLProtocolClient *)operator new();
    v9->var0 = (void **)&off_1E14EBFE8;
    v9->var1 = (void **)&unk_1E14EC0A8;
    v9->var2 = a5;
    v9->var3 = v7;
    v7->_client = v9;
    v10 = -[NSURLSessionTask initWithOriginalRequest:ident:taskGroup:]([NSURLSessionTask alloc], "initWithOriginalRequest:ident:taskGroup:", a3, 0, objc_msgSend((id)+[NSURLSession _sharedSessionForConnection](), "defaultTaskGroup"));
    v7->_prot = (_CFURLProtocol *)(*(uint64_t (**)(_QWORD, NSURLSessionTask *, NSCFURLProtocolClient *, uint64_t))(v8 + 64))(*MEMORY[0x1E0C9AE00], v10, v7->_client, v8);

  }
  return v7;
}

- (void)dealloc
{
  _CFURLProtocol *prot;
  NSCFURLProtocolClient *client;
  objc_super v5;

  prot = self->_prot;
  if (prot)
    CFRelease(prot);
  client = self->_client;
  if (client)
    (*((void (**)(NSCFURLProtocolClient *, SEL))client->var0 + 1))(client, a2);
  v5.receiver = self;
  v5.super_class = (Class)_NSCFURLProtocol;
  -[NSURLProtocol dealloc](&v5, sel_dealloc);
}

- (void)startLoading
{
  _CFURLProtocol *prot;

  prot = self->_prot;
  if (prot)
  {
    if (TCFObject<URLProtocol>::Class(void)::sOnce != -1)
      dispatch_once(&TCFObject<URLProtocol>::Class(void)::sOnce, &__block_literal_global_3299);
    prot = (_CFURLProtocol *)((char *)prot + 16);
  }
  (*(void (**)(_CFURLProtocol *, _CFCachedURLResponse *))(*(_QWORD *)prot + 88))(prot, -[NSCachedURLResponse _CFCachedURLResponse](-[NSURLProtocol cachedResponse](self, "cachedResponse"), "_CFCachedURLResponse"));
}

- (void)stopLoading
{
  _CFURLProtocol *prot;

  prot = self->_prot;
  if (TCFObject<URLProtocol>::Class(void)::sOnce != -1)
    dispatch_once(&TCFObject<URLProtocol>::Class(void)::sOnce, &__block_literal_global_3299);
  (*(void (**)(uint64_t))(*((_QWORD *)prot + 2) + 96))((uint64_t)prot + 16);
}

+ (const)_cf_internalImpl
{
  abort();
}

@end
