@implementation WKNavigationAction

- (Object)_apiObject
{
  return (Object *)&self->_navigationAction;
}

- (NSURLRequest)request
{
  return (NSURLRequest *)WebCore::ResourceRequest::nsURLRequest();
}

- (WKNavigationType)navigationType
{
  unint64_t isa_low;

  isa_low = SLOBYTE(self[5].super.isa);
  if (isa_low > 5)
    return -1;
  else
    return qword_1978CF530[isa_low];
}

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::NavigationAction::~NavigationAction((API::NavigationAction *)&self->_navigationAction);
    v4.receiver = self;
    v4.super_class = (Class)WKNavigationAction;
    -[WKNavigationAction dealloc](&v4, sel_dealloc);
  }
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  WKNavigationType v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = -[WKNavigationAction navigationType](self, "navigationType");
  v7 = -[WKNavigationAction _syntheticClickType](self, "_syntheticClickType");
  -[WKNavigationAction _clickLocationInRootViewCoordinates](self, "_clickLocationInRootViewCoordinates");
  v9 = v8;
  -[WKNavigationAction _clickLocationInRootViewCoordinates](self, "_clickLocationInRootViewCoordinates");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; navigationType = %ld; syntheticClickType = %ld; position x = %.2f y = %.2f request = %@; sourceFrame = %@; targetFrame = %@>"),
                       v5,
                       self,
                       v6,
                       v7,
                       v9,
                       v10,
                       -[WKNavigationAction request](self, "request"),
                       -[WKNavigationAction sourceFrame](self, "sourceFrame"),
                       -[WKNavigationAction targetFrame](self, "targetFrame"));
}

- (WKFrameInfo)sourceFrame
{
  uint64_t v2;

  v2 = *(_QWORD *)&self->_navigationAction.data.__lx[16];
  if (v2)
    return *(WKFrameInfo **)(v2 + 8);
  else
    return 0;
}

- (WKFrameInfo)targetFrame
{
  uint64_t v2;

  v2 = *(_QWORD *)&self->_navigationAction.data.__lx[24];
  if (v2)
    return *(WKFrameInfo **)(v2 + 8);
  else
    return 0;
}

- (BOOL)shouldPerformDownload
{
  return *(_QWORD *)self[6]._anon_8 != 0;
}

- (int64_t)_syntheticClickType
{
  int v2;

  v2 = BYTE3(self[5].super.isa);
  if (v2 == 2)
    return 2;
  else
    return v2 == 1;
}

- (CGPoint)_clickLocationInRootViewCoordinates
{
  double v2;
  double v3;
  CGPoint result;

  WebCore::FloatPoint::operator CGPoint();
  result.y = v3;
  result.x = v2;
  return result;
}

- (NSEventModifierFlags)modifierFlags
{
  return (BYTE1(self[5].super.isa) << 12) & 0x10000 | ((unint64_t)(BYTE1(self[5].super.isa) & 0xF) << 17);
}

- (NSURL)_originalURL
{
  if (!self[4].super.isa)
    WebCore::ResourceRequestBase::url((WebCore::ResourceRequestBase *)&self->_navigationAction.data.__lx[40]);
  return (NSURL *)WTF::URL::operator NSURL *();
}

- (BOOL)_isUserInitiated
{
  uint64_t (*v2)();

  v2 = WTF::RefPtr<API::UserInitiatedAction,WTF::RawPtrTraits<API::UserInitiatedAction>,WTF::DefaultRefDerefTraits<API::UserInitiatedAction>>::unspecifiedBoolTypeInstance;
  if (!*(_QWORD *)&self[4]._navigationAction.data.__lx[32])
    v2 = 0;
  return v2 != 0;
}

- (BOOL)_canHandleRequest
{
  return (BOOL)self[6].super.isa;
}

- (BOOL)_shouldOpenExternalSchemes
{
  return BYTE1(self[6].super.isa) - 1 < 2;
}

- (BOOL)_shouldOpenAppLinks
{
  return self[4]._navigationAction.data.__lx[24] && BYTE1(self[6].super.isa) == 2;
}

- (BOOL)_shouldPerformDownload
{
  return *(_QWORD *)self[6]._anon_8 != 0;
}

- (_WKUserInitiatedAction)_userInitiatedAction
{
  uint64_t v2;

  v2 = *(_QWORD *)&self[4]._navigationAction.data.__lx[32];
  if (v2)
    return *(_WKUserInitiatedAction **)(v2 + 8);
  else
    return 0;
}

- (BOOL)_isRedirect
{
  return (self[8]._navigationAction.data.__lx[18] & 1) == 0;
}

- (WKNavigation)_mainFrameNavigation
{
  Class isa;

  isa = self[45].super.isa;
  if (isa)
    return (WKNavigation *)*((_QWORD *)isa + 1);
  else
    return 0;
}

- (void)_storeSKAdNetworkAttribution
{
  Class isa;
  uint64_t v3;
  uint64_t v4;

  isa = self[45].super.isa;
  if (isa)
  {
    if (*((_BYTE *)isa + 1368))
    {
      if (*((_BYTE *)isa + 1104))
      {
        v3 = *(_QWORD *)&self->_navigationAction.data.__lx[16];
        if (v3)
        {
          v4 = *(_QWORD *)(v3 + 312);
          if (v4)
            WebKit::WebsiteDataStore::storePrivateClickMeasurement(*(WebKit::WebsiteDataStore **)(v4 + 264), (Class)((char *)isa + 1056));
        }
      }
    }
  }
}

- (_WKHitTestResult)_hitTestResult
{
  uint64_t v3;
  CFTypeRef *v4;
  const WebKit::WebHitTestResultData *v5;
  CFTypeRef *v6;
  API::HitTestResult *v7;
  const void *v8;
  _WKHitTestResult *v9;
  _WKHitTestResult *result;

  if (!LOBYTE(self[29].super.isa))
    return 0;
  v3 = *(_QWORD *)&self->_navigationAction.data.__lx[16];
  if (!v3)
    return 0;
  CFRetain(*(CFTypeRef *)(v3 + 8));
  v4 = *(CFTypeRef **)(v3 + 312);
  if (!v4)
  {
    v9 = 0;
LABEL_8:
    CFRelease(*(CFTypeRef *)(v3 + 8));
    return v9;
  }
  CFRetain(v4[1]);
  if (LOBYTE(self[29].super.isa))
  {
    v5 = (const WebKit::WebHitTestResultData *)&self[18]._navigationAction.data.__lx[24];
    v6 = (CFTypeRef *)API::Object::newObject(0x2B0uLL, 67);
    v7 = API::HitTestResult::HitTestResult((API::HitTestResult *)v6, v5, (WebKit::WebPageProxy *)v4);
    v8 = (const void *)*((_QWORD *)v7 + 1);
    if (v8)
      CFRetain(*((CFTypeRef *)v7 + 1));
    v9 = (id)CFMakeCollectable(v8);
    CFRelease(v6[1]);
    CFRelease(v4[1]);
    goto LABEL_8;
  }
  result = (_WKHitTestResult *)std::__throw_bad_optional_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (NSString)_targetFrameName
{
  NSString *result;

  result = *(NSString **)&self->_navigationAction.data.__lx[32];
  if (result)
    return (NSString *)WTF::StringImpl::operator NSString *();
  return result;
}

- (BOOL)_hasOpener
{
  return self[10]._navigationAction.data.__lx[12];
}

@end
