@implementation _NSCFWikipediaProtocol

- (_NSCFWikipediaProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5
{
  _NSCFWikipediaProtocol *v5;
  _NSCFWikipediaProtocol *v6;
  const CFURLProtocolInstanceCallbacks **p_callbacks;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_NSCFWikipediaProtocol;
  v5 = -[NSURLProtocol initWithRequest:cachedResponse:client:](&v9, sel_initWithRequest_cachedResponse_client_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    p_callbacks = &v5->_callbacks;
    v5->_instance = (const void *)off_1EDD011A8(v5, &v5->_callbacks, *((_QWORD *)&_wikipediaProtocol + 1));
    if ((*p_callbacks)->var0 != 2)
      __assert_rtn("-[_NSCFWikipediaProtocol initWithRequest:cachedResponse:client:]", "CFURLProtocol.mm", 122, "_callbacks->version == 2");
    if (!(*p_callbacks)->var6)
      __assert_rtn("-[_NSCFWikipediaProtocol initWithRequest:cachedResponse:client:]", "CFURLProtocol.mm", 123, "_callbacks->start != NULL");
  }
  return v6;
}

- (void)dealloc
{
  void (*var2)(void);
  objc_super v4;

  if (self->_instance)
  {
    var2 = (void (*)(void))self->_callbacks->var2;
    if (var2)
      var2();
  }
  v4.receiver = self;
  v4.super_class = (Class)_NSCFWikipediaProtocol;
  -[NSURLProtocol dealloc](&v4, sel_dealloc);
}

- (void)startLoading
{
  ((void (*)(_NSCFWikipediaProtocol *, const void *))self->_callbacks->var6)(self, self->_instance);
}

- (void)stopLoading
{
  ((void (*)(_NSCFWikipediaProtocol *, const void *))self->_callbacks->var7)(self, self->_instance);
}

+ (BOOL)canInitWithRequest:(id)a3
{
  return (*((unsigned int (**)(id, _QWORD))&xmmword_1EDD01188 + 1))(a3, *((_QWORD *)&_wikipediaProtocol + 1)) != 0;
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
