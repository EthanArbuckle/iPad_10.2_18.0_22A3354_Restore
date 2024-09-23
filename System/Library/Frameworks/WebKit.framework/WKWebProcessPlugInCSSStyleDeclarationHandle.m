@implementation WKWebProcessPlugInCSSStyleDeclarationHandle

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(ObjectStorage<WebKit::InjectedBundleCSSStyleDeclarationHandle> *))self->_cssStyleDeclarationHandle.data.__lx)(&self->_cssStyleDeclarationHandle);
    v4.receiver = self;
    v4.super_class = (Class)WKWebProcessPlugInCSSStyleDeclarationHandle;
    -[WKWebProcessPlugInCSSStyleDeclarationHandle dealloc](&v4, sel_dealloc);
  }
}

+ (id)cssStyleDeclarationHandleWithJSValue:(id)a3 inContext:(id)a4
{
  JSC::VM *v4;
  JSValue v5;
  WebCore::JSCSSStyleDeclaration **v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const void *v10;
  const void *v11;
  uint64_t v13;

  v4 = JSValueToObject((JSContextRef)objc_msgSend(a4, "JSGlobalContextRef"), (JSValueRef)objc_msgSend(a3, "JSValueRef"), 0);
  v6 = (WebCore::JSCSSStyleDeclaration **)((char *)v4 - 16);
  if ((v4 & 8) == 0)
    v6 = (WebCore::JSCSSStyleDeclaration **)((unint64_t)v4 & 0xFFFFFFFFFFFFC000 | 8);
  v7 = WebCore::JSCSSStyleDeclaration::toWrapped(*v6, v4, v5);
  WebKit::InjectedBundleCSSStyleDeclarationHandle::getOrCreate(v7, v8, &v13);
  v9 = v13;
  if (v13)
  {
    v10 = *(const void **)(v13 + 8);
    if (v10)
    {
      CFRetain(*(CFTypeRef *)(v13 + 8));
      v11 = *(const void **)(v9 + 8);
    }
    else
    {
      v11 = 0;
    }
    CFRelease(v11);
  }
  else
  {
    v10 = 0;
  }
  return (id)(id)CFMakeCollectable(v10);
}

- (void)_cssStyleDeclarationHandle
{
  return &self->_cssStyleDeclarationHandle;
}

- (Object)_apiObject
{
  return (Object *)&self->_cssStyleDeclarationHandle;
}

@end
