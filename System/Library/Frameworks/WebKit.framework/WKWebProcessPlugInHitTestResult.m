@implementation WKWebProcessPlugInHitTestResult

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(ObjectStorage<WebKit::InjectedBundleHitTestResult> *))self->_hitTestResult.data.__lx)(&self->_hitTestResult);
    v4.receiver = self;
    v4.super_class = (Class)WKWebProcessPlugInHitTestResult;
    -[WKWebProcessPlugInHitTestResult dealloc](&v4, sel_dealloc);
  }
}

- (WKWebProcessPlugInNodeHandle)nodeHandle
{
  WebKit::InjectedBundleNodeHandle *v2;
  WebKit::InjectedBundleNodeHandle *v3;
  const void *v4;
  const void *v5;
  WebKit::InjectedBundleNodeHandle *v7;

  v2 = *(WebKit::InjectedBundleNodeHandle **)&self[1]._hitTestResult.data.__lx[40];
  if (v2 && (WebKit::InjectedBundleNodeHandle::getOrCreate(v2, &v7), (v3 = v7) != 0))
  {
    v4 = (const void *)*((_QWORD *)v7 + 1);
    if (v4)
    {
      CFRetain(*((CFTypeRef *)v7 + 1));
      v5 = (const void *)*((_QWORD *)v3 + 1);
    }
    else
    {
      v5 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v4 = 0;
  }
  return (WKWebProcessPlugInNodeHandle *)(id)CFMakeCollectable(v4);
}

- (Object)_apiObject
{
  return (Object *)&self->_hitTestResult;
}

@end
