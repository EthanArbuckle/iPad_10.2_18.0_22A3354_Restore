@implementation _WKUserInitiatedAction

- (_WKUserInitiatedAction)init
{
  _WKUserInitiatedAction *v2;
  _WKUserInitiatedAction *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_WKUserInitiatedAction;
  v2 = -[_WKUserInitiatedAction init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = -[_WKUserInitiatedAction _apiObject](v2, "_apiObject");
    *(_OWORD *)v4 = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
    *(_OWORD *)(v4 + 32) = 0u;
    *(_OWORD *)(v4 + 48) = 0u;
    *(_QWORD *)v4 = off_1E34CC2A8;
    WebKit::InitializeWebKit2((WebKit *)v4);
    *(_BYTE *)(v4 + 16) = 0;
    *(_BYTE *)(v4 + 32) = 0;
    *(_BYTE *)(v4 + 48) = 0;
    *(_QWORD *)v4 = &off_1E34C4510;
    *(_QWORD *)(v4 + 8) = v3;
  }
  return v3;
}

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)_WKUserInitiatedAction;
    -[_WKUserInitiatedAction dealloc](&v4, sel_dealloc);
  }
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  _BOOL4 v6;
  const char *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = -[_WKUserInitiatedAction isConsumed](self, "isConsumed");
  v7 = "NO";
  if (v6)
    v7 = "YES";
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; consumed = %s>"), v5, self, v7);
}

- (void)consume
{
  self->_userInitiatedAction.data.__lx[16] = 1;
}

- (BOOL)isConsumed
{
  return self->_userInitiatedAction.data.__lx[16];
}

- (Object)_apiObject
{
  return (Object *)&self->_userInitiatedAction;
}

@end
