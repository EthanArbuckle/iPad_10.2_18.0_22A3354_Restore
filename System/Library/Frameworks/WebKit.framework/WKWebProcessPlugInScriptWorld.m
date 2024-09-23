@implementation WKWebProcessPlugInScriptWorld

- (Object)_apiObject
{
  return (Object *)&self->_world;
}

+ (id)world
{
  WebKit::InjectedBundleScriptWorld *v2;
  CFTypeRef v3;
  CFTypeRef v4;
  CFTypeRef *v6;

  WebKit::InjectedBundleScriptWorld::create((WebKit::InjectedBundleScriptWorld **)&v6);
  v2 = (WebKit::InjectedBundleScriptWorld *)v6;
  v3 = v6[1];
  if (v3)
    CFRetain(v6[1]);
  v4 = (id)CFMakeCollectable(v3);
  CFRelease(*((CFTypeRef *)v2 + 1));
  return (id)v4;
}

+ (id)normalWorld
{
  return (id)*((_QWORD *)WebKit::InjectedBundleScriptWorld::normalWorld((WebKit::InjectedBundleScriptWorld *)a1) + 1);
}

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(ObjectStorage<WebKit::InjectedBundleScriptWorld> *))self->_world.data.__lx)(&self->_world);
    v4.receiver = self;
    v4.super_class = (Class)WKWebProcessPlugInScriptWorld;
    -[WKWebProcessPlugInScriptWorld dealloc](&v4, sel_dealloc);
  }
}

- (void)clearWrappers
{
  WebCore::DOMWrapperWorld::clearWrappers(*(WebCore::DOMWrapperWorld **)&self->_world.data.__lx[24]);
}

- (void)makeAllShadowRootsOpen
{
  *(_BYTE *)(*(_QWORD *)&self->_world.data.__lx[24] + 52) = 1;
}

- (void)disableOverrideBuiltinsBehavior
{
  *(_BYTE *)(*(_QWORD *)&self->_world.data.__lx[24] + 53) = 1;
}

- (NSString)name
{
  if (*(_QWORD *)&self->_world.data.__lx[32])
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (void)_scriptWorld
{
  return &self->_world;
}

@end
