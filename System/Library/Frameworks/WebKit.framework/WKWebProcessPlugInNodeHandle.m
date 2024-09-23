@implementation WKWebProcessPlugInNodeHandle

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(ObjectStorage<WebKit::InjectedBundleNodeHandle> *))self->_nodeHandle.data.__lx)(&self->_nodeHandle);
    v4.receiver = self;
    v4.super_class = (Class)WKWebProcessPlugInNodeHandle;
    -[WKWebProcessPlugInNodeHandle dealloc](&v4, sel_dealloc);
  }
}

+ (WKWebProcessPlugInNodeHandle)nodeHandleWithJSValue:(id)a3 inContext:(id)a4
{
  const OpaqueJSContext *v4;
  JSValue v5;
  WebKit::InjectedBundleNodeHandle *v6;
  CFTypeRef v7;
  const void *v8;
  CFTypeRef *v10;

  v4 = JSValueToObject((JSContextRef)objc_msgSend(a4, "JSGlobalContextRef"), (JSValueRef)objc_msgSend(a3, "JSValueRef"), 0);
  WebKit::InjectedBundleNodeHandle::getOrCreate(v4, v5, (WebKit::InjectedBundleNodeHandle **)&v10);
  v6 = (WebKit::InjectedBundleNodeHandle *)v10;
  if (v10)
  {
    v7 = v10[1];
    if (v7)
    {
      CFRetain(v10[1]);
      v8 = (const void *)*((_QWORD *)v6 + 1);
    }
    else
    {
      v8 = 0;
    }
    CFRelease(v8);
  }
  else
  {
    v7 = 0;
  }
  return (WKWebProcessPlugInNodeHandle *)(id)CFMakeCollectable(v7);
}

- (id)htmlIFrameElementContentFrame
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  CFTypeRef v5;
  uint64_t v6;
  uint64_t v8;

  WebKit::InjectedBundleNodeHandle::htmlIFrameElementContentFrame((uint64_t)&self->_nodeHandle, &v8);
  v2 = v8;
  if (v8)
  {
    v8 = 0;
    v3 = *(const void **)(v2 + 8);
    if (v3)
    {
      CFRetain(*(CFTypeRef *)(v2 + 8));
      v4 = *(const void **)(v2 + 8);
    }
    else
    {
      v4 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v3 = 0;
  }
  v5 = (id)CFMakeCollectable(v3);
  v6 = v8;
  v8 = 0;
  if (v6)
    CFRelease(*(CFTypeRef *)(v6 + 8));
  return (id)v5;
}

- (id)renderedImageWithOptions:(unsigned int)a3
{
  return -[WKWebProcessPlugInNodeHandle renderedImageWithOptions:width:](self, "renderedImageWithOptions:width:", *(_QWORD *)&a3, 0);
}

- (id)renderedImageWithOptions:(unsigned int)a3 width:(id)a4
{
  int v6;
  uint64_t v7;
  id v8;
  const void *v9;
  void *v10;
  CFTypeRef v11;
  WebCore::NativeImage *v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  int v19;
  uint64_t v20;
  uint64_t v22;
  WebCore::NativeImage *v23;
  uint64_t v24;
  int v25;
  char v26;

  LOBYTE(v25) = 0;
  v26 = 0;
  if (a4)
  {
    objc_msgSend(a4, "floatValue");
    v25 = v6;
    v26 = 1;
  }
  WebKit::InjectedBundleNodeHandle::renderedImage((WebCore::RenderObject *)&self->_nodeHandle, a3 & 0xF | (((a3 >> 4) & 7) << 6), (a3 >> 7) & 1, (uint64_t)&v25, &v24);
  if (!v24)
    return 0;
  v7 = *(_QWORD *)(v24 + 16);
  if (!v7 || ((*(void (**)(WebCore::NativeImage **__return_ptr))(*(_QWORD *)v7 + 56))(&v23), !v23))
  {
    v11 = 0;
    goto LABEL_25;
  }
  v8 = objc_alloc(MEMORY[0x1E0CEA638]);
  v9 = (const void *)objc_msgSend(v8, "initWithCGImage:", *(_QWORD *)WebCore::NativeImage::platformImage(v23));
  v11 = (id)CFMakeCollectable(v9);
  v12 = v23;
  v23 = 0;
  if (!v12)
    goto LABEL_25;
  v13 = *((_QWORD *)v12 + 1);
  if (__ldaxr((unsigned __int8 *)v13))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v13))
  {
    goto LABEL_13;
  }
  MEMORY[0x19AEABB3C](v13);
LABEL_13:
  v15 = *(_QWORD *)(v13 + 8);
  v16 = v15 - 1;
  *(_QWORD *)(v13 + 8) = v15 - 1;
  if (v15 == 1)
  {
    v22 = *(_QWORD *)(v13 + 16);
    v17 = *(_QWORD *)(v13 + 24);
    *(_QWORD *)(v13 + 24) = 0;
    v18 = v22 != 0;
  }
  else
  {
    v17 = 0;
    v18 = 1;
  }
  v19 = __ldxr((unsigned __int8 *)v13);
  if (v19 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v13))
    {
      if (!v16)
        goto LABEL_21;
      goto LABEL_25;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)v13);
  if (!v16)
  {
LABEL_21:
    if (v17)
      (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
    if (!v18)
      WTF::fastFree((WTF *)v13, v10);
  }
LABEL_25:
  v20 = v24;
  v24 = 0;
  if (v20)
    CFRelease(*(CFTypeRef *)(v20 + 8));
  return (id)v11;
}

- (CGRect)elementBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  WebKit::InjectedBundleNodeHandle::elementBounds((WebKit::InjectedBundleNodeHandle *)&self->_nodeHandle);
  WebCore::IntRect::operator CGRect();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)HTMLInputElementIsAutoFilled
{
  return WebKit::InjectedBundleNodeHandle::isHTMLInputElementAutoFilled((WebKit::InjectedBundleNodeHandle *)&self->_nodeHandle);
}

- (BOOL)HTMLInputElementIsAutoFilledAndViewable
{
  return WebKit::InjectedBundleNodeHandle::isHTMLInputElementAutoFilledAndViewable((WebKit::InjectedBundleNodeHandle *)&self->_nodeHandle);
}

- (BOOL)HTMLInputElementIsAutoFilledAndObscured
{
  return WebKit::InjectedBundleNodeHandle::isHTMLInputElementAutoFilledAndObscured((WebKit::InjectedBundleNodeHandle *)&self->_nodeHandle);
}

- (void)setHTMLInputElementIsAutoFilled:(BOOL)a3
{
  WebKit::InjectedBundleNodeHandle::setHTMLInputElementAutoFilled((uint64_t)&self->_nodeHandle);
}

- (void)setHTMLInputElementIsAutoFilledAndViewable:(BOOL)a3
{
  WebKit::InjectedBundleNodeHandle::setHTMLInputElementAutoFilledAndViewable((uint64_t)&self->_nodeHandle);
}

- (void)setHTMLInputElementIsAutoFilledAndObscured:(BOOL)a3
{
  WebKit::InjectedBundleNodeHandle::setHTMLInputElementAutoFilledAndObscured((uint64_t)&self->_nodeHandle);
}

- (BOOL)isHTMLInputElementAutoFillButtonEnabled
{
  return WebKit::InjectedBundleNodeHandle::isHTMLInputElementAutoFillButtonEnabled((WebKit::InjectedBundleNodeHandle *)&self->_nodeHandle);
}

- (void)setHTMLInputElementAutoFillButtonEnabledWithButtonType:(int64_t)a3
{
  WebKit::InjectedBundleNodeHandle::setHTMLInputElementAutoFillButtonEnabled((uint64_t)&self->_nodeHandle);
}

- (int64_t)htmlInputElementAutoFillButtonType
{
  int v2;

  v2 = WebKit::InjectedBundleNodeHandle::htmlInputElementAutoFillButtonType((WebKit::InjectedBundleNodeHandle *)&self->_nodeHandle);
  if ((v2 - 1) < 5)
    return (v2 - 1) + 1;
  else
    return 0;
}

- (int64_t)htmlInputElementLastAutoFillButtonType
{
  int AutoFillButtonType;

  AutoFillButtonType = WebKit::InjectedBundleNodeHandle::htmlInputElementLastAutoFillButtonType((WebKit::InjectedBundleNodeHandle *)&self->_nodeHandle);
  if ((AutoFillButtonType - 1) < 5)
    return (AutoFillButtonType - 1) + 1;
  else
    return 0;
}

- (BOOL)HTMLInputElementIsUserEdited
{
  return WebKit::InjectedBundleNodeHandle::htmlInputElementLastChangeWasUserEdit((WebKit::InjectedBundleNodeHandle *)&self->_nodeHandle);
}

- (BOOL)HTMLTextAreaElementIsUserEdited
{
  return WebKit::InjectedBundleNodeHandle::htmlTextAreaElementLastChangeWasUserEdit((WebKit::InjectedBundleNodeHandle *)&self->_nodeHandle);
}

- (BOOL)isSelectElement
{
  Class isa;

  isa = self[1].super.isa;
  return isa
      && (*((_WORD *)isa + 14) & 0x10) != 0
      && *(_QWORD *)(*((_QWORD *)isa + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD6218] + 24);
}

- (BOOL)isSelectableTextNode
{
  return WebKit::InjectedBundleNodeHandle::isSelectableTextNode((WebKit::InjectedBundleNodeHandle *)&self->_nodeHandle);
}

- (BOOL)isTextField
{
  return WebKit::InjectedBundleNodeHandle::isTextField((WebKit::InjectedBundleNodeHandle *)&self->_nodeHandle);
}

- (WKWebProcessPlugInNodeHandle)HTMLTableCellElementCellAbove
{
  WebKit::InjectedBundleNodeHandle *v2;
  CFTypeRef v3;
  const void *v4;
  CFTypeRef *v6;

  WebKit::InjectedBundleNodeHandle::htmlTableCellElementCellAbove((WebKit::InjectedBundleNodeHandle *)&self->_nodeHandle, (WebKit::InjectedBundleNodeHandle **)&v6);
  v2 = (WebKit::InjectedBundleNodeHandle *)v6;
  if (v6)
  {
    v3 = v6[1];
    if (v3)
    {
      CFRetain(v6[1]);
      v4 = (const void *)*((_QWORD *)v2 + 1);
    }
    else
    {
      v4 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v3 = 0;
  }
  return (WKWebProcessPlugInNodeHandle *)(id)CFMakeCollectable(v3);
}

- (WKWebProcessPlugInFrame)frame
{
  Class isa;
  WebKit::InjectedBundleNodeHandle *v3;
  uint64_t v4;
  const void *v5;
  const void *v6;
  WKWebProcessPlugInFrame *v7;
  uint64_t v8;
  uint64_t v10;
  WebKit::InjectedBundleNodeHandle *v11;

  isa = self[1].super.isa;
  if (isa)
  {
    WebKit::InjectedBundleNodeHandle::getOrCreate(*(WebKit::InjectedBundleNodeHandle **)(*((_QWORD *)isa + 5) + 8), &v11);
    v3 = v11;
  }
  else
  {
    v3 = 0;
  }
  WebKit::InjectedBundleNodeHandle::documentFrame((uint64_t)v3, &v10);
  v4 = v10;
  if (v10)
  {
    v10 = 0;
    v5 = *(const void **)(v4 + 8);
    if (v5)
    {
      CFRetain(*(CFTypeRef *)(v4 + 8));
      v6 = *(const void **)(v4 + 8);
    }
    else
    {
      v6 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    v5 = 0;
  }
  v7 = (id)CFMakeCollectable(v5);
  v8 = v10;
  v10 = 0;
  if (v8)
    CFRelease(*(CFTypeRef *)(v8 + 8));
  if (v3)
    CFRelease(*((CFTypeRef *)v3 + 1));
  return v7;
}

- (void)_nodeHandle
{
  return &self->_nodeHandle;
}

- (Object)_apiObject
{
  return (Object *)&self->_nodeHandle;
}

@end
