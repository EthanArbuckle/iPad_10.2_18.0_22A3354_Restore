@implementation _WKContentRuleListAction

- (void)dealloc
{
  objc_class *v3;
  void *v4;
  objc_super v5;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_action.data.__lx[24], v4);
    v5.receiver = self;
    v5.super_class = (Class)_WKContentRuleListAction;
    -[_WKContentRuleListAction dealloc](&v5, sel_dealloc);
  }
}

- (BOOL)blockedLoad
{
  return self->_action.data.__lx[16];
}

- (BOOL)blockedCookies
{
  return self->_action.data.__lx[18];
}

- (BOOL)madeHTTPS
{
  return self->_action.data.__lx[17];
}

- (BOOL)redirected
{
  return self->_action.data.__lx[20];
}

- (BOOL)modifiedHeaders
{
  return self->_action.data.__lx[19];
}

- (NSArray)notifications
{
  CFTypeRef v2;
  NSArray *v3;
  CFTypeRef v4;
  CFTypeRef cf;

  if (!*(_DWORD *)&self->_action.data.__lx[36])
    return 0;
  WTF::createNSArray<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&>((uint64_t)&self->_action.data.__lx[24], (uint64_t *)&cf);
  v2 = cf;
  cf = 0;
  v3 = (id)CFMakeCollectable(v2);
  v4 = cf;
  cf = 0;
  if (v4)
    CFRelease(v4);
  return v3;
}

- (Object)_apiObject
{
  return (Object *)&self->_action;
}

@end
