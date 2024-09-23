@implementation WKWebProcessPlugInRangeHandle

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(ObjectStorage<WebKit::InjectedBundleRangeHandle> *))self->_rangeHandle.data.__lx)(&self->_rangeHandle);
    v4.receiver = self;
    v4.super_class = (Class)WKWebProcessPlugInRangeHandle;
    -[WKWebProcessPlugInRangeHandle dealloc](&v4, sel_dealloc);
  }
}

+ (id)rangeHandleWithJSValue:(id)x2_0 inContext:(id)a4
{
  WebCore::JSRange **v5;
  JSC::VM *v6;
  WTF *v7;
  WebCore::Range *v8;
  uint64_t v9;
  const void *v10;
  const void *v11;
  uint64_t v13;
  JSValue v14;

  v5 = (WebCore::JSRange **)objc_msgSend(a4, "JSGlobalContextRef");
  v6 = JSValueToObject((JSContextRef)v5, (JSValueRef)objc_msgSend(x2_0, "JSValueRef"), 0);
  v7 = (WTF *)WebCore::JSRange::toWrapped(v5[7], v6, v14);
  WebKit::InjectedBundleRangeHandle::getOrCreate(v7, v8, &v13);
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

- (WKWebProcessPlugInFrame)frame
{
  WebKit::InjectedBundleNodeHandle *v2;
  uint64_t v3;
  const void *v4;
  const void *v5;
  WKWebProcessPlugInFrame *v6;
  uint64_t v7;
  WebKit::InjectedBundleNodeHandle *v9;
  uint64_t v10;

  WebKit::InjectedBundleNodeHandle::getOrCreate(*(WebKit::InjectedBundleNodeHandle **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)&self->_rangeHandle.data.__lx[24] + 32)+ 40)+ 8), &v9);
  v2 = v9;
  WebKit::InjectedBundleNodeHandle::documentFrame((uint64_t)v9, &v10);
  v3 = v10;
  if (v10)
  {
    v10 = 0;
    v4 = *(const void **)(v3 + 8);
    if (v4)
    {
      CFRetain(*(CFTypeRef *)(v3 + 8));
      v5 = *(const void **)(v3 + 8);
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
  v6 = (id)CFMakeCollectable(v4);
  v7 = v10;
  v10 = 0;
  if (v7)
    CFRelease(*(CFTypeRef *)(v7 + 8));
  if (v2)
    CFRelease(*((CFTypeRef *)v2 + 1));
  return v6;
}

- (NSString)text
{
  WTF::StringImpl *v2;
  NSString *v3;
  WTF::StringImpl *v5;

  WebKit::InjectedBundleRangeHandle::text((WebKit::InjectedBundleRangeHandle *)&self->_rangeHandle);
  if (!v5)
    return (NSString *)&stru_1E351F1B8;
  v3 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v5 == 2)
    WTF::StringImpl::destroy(v5, v2);
  else
    *(_DWORD *)v5 -= 2;
  return v3;
}

- (id)detectDataWithTypes:(unint64_t)a3 context:(id)a4
{
  NSDictionary *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;

  WebCore::makeSimpleRange(*(WebCore **)&self->_rangeHandle.data.__lx[24], (const Range *)a2);
  WebCore::DataDetection::extractReferenceDate((WebCore::DataDetection *)a4, v5);
  v6 = (void *)WebCore::DataDetection::detectContentInRange();
  WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(&v9);
  WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(&v8);
  return v6;
}

- (void)_rangeHandle
{
  return &self->_rangeHandle;
}

- (Object)_apiObject
{
  return (Object *)&self->_rangeHandle;
}

@end
