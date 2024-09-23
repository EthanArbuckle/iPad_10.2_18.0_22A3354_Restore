@implementation _NSCFTranslatedFileURLProtocol

- (_NSCFTranslatedFileURLProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5
{
  _NSCFTranslatedFileURLProtocol *v5;
  uint64_t (*v6)(_NSCFTranslatedFileURLProtocol *, const CFURLProtocolInstanceCallbacks **, _QWORD);
  uint64_t v7;
  void (*var1)(void);
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_NSCFTranslatedFileURLProtocol;
  v5 = -[NSURLProtocol initWithRequest:cachedResponse:client:](&v10, sel_initWithRequest_cachedResponse_client_, a3, a4, a5);
  if (v5)
  {
    v6 = *(uint64_t (**)(_NSCFTranslatedFileURLProtocol *, const CFURLProtocolInstanceCallbacks **, _QWORD))(objc_msgSend((id)objc_opt_class(), "pimpl") + 64);
    v7 = objc_msgSend((id)objc_opt_class(), "pimpl");
    v5->_info = (const void *)v6(v5, &v5->_callbacks, *(_QWORD *)(v7 + 8));
    if (!v5->_callbacks->var6)
      __assert_rtn("-[_NSCFTranslatedFileURLProtocol initWithRequest:cachedResponse:client:]", "CFURLProtocol.mm", 32, "_callbacks->start != NULL");
    var1 = (void (*)(void))v5->_callbacks->var1;
    if (var1)
      var1();
    v5->_cfurlClient.didReceiveResponse = _CFURLProtocolSendDidReceiveResponseCallback;
    v5->_cfurlClient.didLoadData = _CFURLProtocolSendDidLoadDataCallback;
    v5->_cfurlClient.didFinishLoading = _CFURLProtocolSendDidFinishLoadingCallback;
    v5->_cfurlClient.didFail = _CFURLProtocolSendDidFailCallback;
  }
  return v5;
}

- (void)dealloc
{
  const CFURLProtocolInstanceCallbacks *callbacks;
  void (*var2)(void);
  objc_super v5;

  callbacks = self->_callbacks;
  if (callbacks)
  {
    if (self->_info)
    {
      var2 = (void (*)(void))callbacks->var2;
      if (var2)
      {
        var2();
        self->_info = 0;
      }
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)_NSCFTranslatedFileURLProtocol;
  -[NSURLProtocol dealloc](&v5, sel_dealloc);
}

- (void)startLoading
{
  const CFURLProtocolInstanceCallbacks *callbacks;
  void (*var6)(_NSCFTranslatedFileURLProtocol *, const void *);

  callbacks = self->_callbacks;
  if (callbacks)
  {
    var6 = (void (*)(_NSCFTranslatedFileURLProtocol *, const void *))callbacks->var6;
    if (var6)
      var6(self, self->_info);
  }
}

- (void)stopLoading
{
  const CFURLProtocolInstanceCallbacks *callbacks;
  void (*var7)(_NSCFTranslatedFileURLProtocol *, const void *);

  callbacks = self->_callbacks;
  if (callbacks)
  {
    var7 = (void (*)(_NSCFTranslatedFileURLProtocol *, const void *))callbacks->var7;
    if (var7)
      var7(self, self->_info);
  }
}

+ (const)pimpl
{
  return 0;
}

+ (BOOL)canInitWithRequest:(id)a3
{
  unsigned int (*v4)(id, _QWORD);
  uint64_t v5;

  v4 = *(unsigned int (**)(id, _QWORD))(objc_msgSend((id)objc_opt_class(), "pimpl") + 40);
  v5 = objc_msgSend((id)objc_opt_class(), "pimpl");
  return v4(a3, *(_QWORD *)(v5 + 8)) != 0;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  return a3;
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  return 0;
}

@end
