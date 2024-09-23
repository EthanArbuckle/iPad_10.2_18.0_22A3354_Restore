@implementation WKModelView

- (ASVInlinePreview)preview
{
  return (ASVInlinePreview *)self->_preview.m_ptr;
}

- (WKModelView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (WKModelView)initWithCoder:(id)a3
{
  return 0;
}

- (WKModelView)initWithModel:(void *)a3 layerID:()ProcessQualified<WTF:()WTF:(unsigned long long>>)a4 :(void *)a5 ObjectIdentifierMainThreadAccessTraits<uint64_t> :ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType page:
{
  unint64_t m_identifier;
  unint64_t v7;
  CGSize v9;
  double y;
  double width;
  double height;
  WKModelView *v13;
  WKModelView *v14;
  void *v15;
  unsigned int *v16;
  unsigned int v17;
  unsigned int *m_ptr;
  unsigned int v19;
  unsigned int v20;
  objc_super v22;

  m_identifier = a4.m_processIdentifier.m_identifier;
  v7 = a4.m_object.m_identifier;
  v9 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_lastBounds.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_lastBounds.size = v9;
  v9.width = self->_lastBounds.origin.x;
  y = self->_lastBounds.origin.y;
  width = self->_lastBounds.size.width;
  height = self->_lastBounds.size.height;
  v22.receiver = self;
  v22.super_class = (Class)WKModelView;
  v13 = -[WKModelView initWithFrame:](&v22, sel_initWithFrame_, v9.width, y, width, height);
  v14 = v13;
  if (v13)
  {
    v13->_layerID.m_object.m_identifier = v7;
    v13->_layerID.m_processIdentifier.m_identifier = m_identifier;
    WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a5 + 6, (uint64_t)a5 + 16);
    v16 = (unsigned int *)*((_QWORD *)a5 + 3);
    if (v16)
    {
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 + 1, v16));
    }
    m_ptr = (unsigned int *)v14->_page.m_impl.m_ptr;
    v14->_page.m_impl.m_ptr = (DefaultWeakPtrImpl *)v16;
    if (m_ptr)
    {
      do
      {
        v19 = __ldaxr(m_ptr);
        v20 = v19 - 1;
      }
      while (__stlxr(v20, m_ptr));
      if (!v20)
      {
        atomic_store(1u, m_ptr);
        WTF::fastFree((WTF *)m_ptr, v15);
      }
    }
    -[WKModelView createFileForModel:](v14, "createFileForModel:", a3);
    -[WKModelView updateBounds](v14, "updateBounds");
  }
  return v14;
}

- (BOOL)createFileForModel:(void *)a3
{
  const WTF::String *v5;
  const WTF::String *v6;
  uint64_t v7;
  BOOL v8;
  BOOL result;
  unsigned int *v10;
  unsigned int v11;
  void *v12;
  int *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  uint64_t v19[2];
  WTF::StringImpl *v20;

  WebKit::WebsiteDataStore::defaultModelElementCacheDirectory(MEMORY[0x1E0CBF6F0], (const WTF::String *)a2);
  if (!v18)
    return 0;
  if (!*((_DWORD *)v18 + 1))
    goto LABEL_16;
  if (!WTF::FileSystemImpl::fileExists((WTF::FileSystemImpl *)&v18, v5))
  {
    if (WTF::FileSystemImpl::makeAllDirectories((WTF::FileSystemImpl *)&v18, v6))
      goto LABEL_8;
LABEL_16:
    v8 = 0;
    goto LABEL_23;
  }
  v7 = WTF::FileSystemImpl::fileTypeFollowingSymlinks((WTF::FileSystemImpl *)&v18, v6);
  v8 = 0;
  if ((v7 & 0xFF00000000) == 0 || v7 != 1)
  {
LABEL_23:
    v16 = v18;
    v18 = 0;
    if (v16)
    {
      if (*(_DWORD *)v16 == 2)
        WTF::StringImpl::destroy(v16, v5);
      else
        *(_DWORD *)v16 -= 2;
    }
    return v8;
  }
LABEL_8:
  WTF::UUID::UUID((WTF::UUID *)&v20);
  v19[0] = (uint64_t)".usdz";
  v19[1] = 6;
  result = WTF::tryMakeString<WTF::UUID,WTF::ASCIILiteral>(&v20, v19, &v17);
  if (v17)
  {
    WTF::FileSystemImpl::pathByAppendingComponent();
    LODWORD(v19[0]) = WTF::FileSystemImpl::openFile();
    v8 = SLODWORD(v19[0]) > 0;
    if (SLODWORD(v19[0]) > 0)
    {
      v10 = (unsigned int *)*((_QWORD *)a3 + 1);
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 + 1, v10));
      WebCore::SharedBuffer::data((WebCore::SharedBuffer *)v10);
      WTF::FileSystemImpl::writeToFile();
      WTF::ThreadSafeRefCounted<WebCore::FragmentedSharedBuffer,(WTF::DestructionThread)0>::deref(v10, v12);
      WTF::FileSystemImpl::closeFile((WTF::FileSystemImpl *)v19, v13);
      WTF::String::operator=((WTF::StringImpl **)&self->_filePath, (WTF::StringImpl *)&v20);
    }
    v14 = v20;
    v20 = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2)
        WTF::StringImpl::destroy(v14, v5);
      else
        *(_DWORD *)v14 -= 2;
    }
    v15 = v17;
    v17 = 0;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2)
        WTF::StringImpl::destroy(v15, v5);
      else
        *(_DWORD *)v15 -= 2;
    }
    goto LABEL_23;
  }
  __break(0xC471u);
  return result;
}

- (void)createPreview
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *m_ptr;
  id v9;
  const __CFString *v10;
  const void *v11;
  const void *v12;
  void *v13;
  WKModelInteractionGestureRecognizer *v14;
  void *v15;
  CFTypeRef v16;
  uint64_t v17;
  uint64_t v18;
  WTF::StringImpl *(*v19)(uint64_t, uint64_t);
  void *v20;
  WKModelView *v21;
  CFTypeRef cf;

  if (self->_filePath.m_impl.m_ptr)
  {
    -[WKModelView bounds](self, "bounds");
    v7 = (void *)objc_msgSend(objc_alloc((Class)getASVInlinePreviewClass()), "initWithFrame:", v3, v4, v5, v6);
    m_ptr = self->_preview.m_ptr;
    self->_preview.m_ptr = v7;
    if (m_ptr)
      CFRelease(m_ptr);
    objc_msgSend((id)-[WKModelView layer](self, "layer"), "addSublayer:", objc_msgSend(self->_preview.m_ptr, "layer"));
    v9 = objc_alloc(MEMORY[0x1E0C99E98]);
    if (self->_filePath.m_impl.m_ptr)
      v10 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v10 = &stru_1E351F1B8;
    v11 = (const void *)objc_msgSend(v9, "initFileURLWithPath:", v10);
    v12 = v11;
    v13 = self->_preview.m_ptr;
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3321888768;
    v19 = __28__WKModelView_createPreview__block_invoke;
    v20 = &unk_1E34CDEE8;
    v21 = self;
    cf = v11;
    if (v11)
      CFRetain(v11);
    objc_msgSend(v13, "setupRemoteConnectionWithCompletionHandler:", &v17);
    v14 = objc_alloc_init(WKModelInteractionGestureRecognizer);
    v15 = self->_modelInteractionGestureRecognizer.m_ptr;
    self->_modelInteractionGestureRecognizer.m_ptr = v14;
    if (v15)
    {
      CFRelease(v15);
      v14 = (WKModelInteractionGestureRecognizer *)self->_modelInteractionGestureRecognizer.m_ptr;
    }
    -[WKModelView addGestureRecognizer:](self, "addGestureRecognizer:", v14, v17, v18, v19, v20, v21);
    v16 = cf;
    cf = 0;
    if (!v16)
    {
      if (!v12)
        return;
LABEL_14:
      CFRelease(v12);
      return;
    }
    CFRelease(v16);
    if (v12)
      goto LABEL_14;
  }
}

WTF::StringImpl *__28__WKModelView_createPreview__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  WTF::StringImpl *result;
  uint64_t v9;
  uint64_t v10;
  WTF::StringImpl *v11;
  CFTypeRef v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  _QWORD v15[5];
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  CFTypeRef cf;
  _QWORD v20[2];
  _QWORD v21[2];

  v2 = *(_QWORD **)(a1 + 32);
  if (a2)
  {
    v3 = v2[61];
    if (v3)
    {
      v4 = *(_QWORD *)(v3 + 8);
      if (v4)
        v5 = v4 - 16;
      else
        v5 = 0;
    }
    else
    {
      v5 = 0;
    }
    v9 = v2[59];
    v10 = v2[60];
    MEMORY[0x19AEADCC0](&v16);
    v21[0] = v9;
    v21[1] = v10;
    v20[0] = v21;
    v20[1] = &v16;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::ModelInlinePreviewDidFailToLoad>(*(_QWORD *)(v5 + 208), (uint64_t)v20, *(_QWORD *)(*(_QWORD *)(v5 + 32) + 1896), 0);
    v12 = cf;
    cf = 0;
    if (v12)
      CFRelease(v12);
    v13 = v18;
    v18 = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2)
        WTF::StringImpl::destroy(v13, v11);
      else
        *(_DWORD *)v13 -= 2;
    }
    v14 = v17;
    v17 = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2)
        WTF::StringImpl::destroy(v14, v11);
      else
        *(_DWORD *)v14 -= 2;
    }
    result = v16;
    v16 = 0;
    if (result)
    {
      if (*(_DWORD *)result == 2)
        return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v11);
      else
        *(_DWORD *)result -= 2;
    }
  }
  else
  {
    v6 = (void *)v2[52];
    v7 = *(_QWORD *)(a1 + 40);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __28__WKModelView_createPreview__block_invoke_2;
    v15[3] = &unk_1E34CDEC0;
    v15[4] = v2;
    return (WTF::StringImpl *)objc_msgSend(v6, "preparePreviewOfFileAtURL:completionHandler:", v7, v15);
  }
  return result;
}

WTF::StringImpl *__28__WKModelView_createPreview__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  WTF::StringImpl *result;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t *v11;
  WTF::StringImpl *v12;
  CFTypeRef v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16[2];
  WTF::StringImpl *v17;
  CFTypeRef cf;
  _QWORD v19[2];
  uint64_t *v20[2];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 488);
  if (a2)
  {
    if (v3)
    {
      v4 = *(_QWORD *)(v3 + 8);
      if (v4)
        v5 = v4 - 16;
      else
        v5 = 0;
    }
    else
    {
      v5 = 0;
    }
    v9 = (uint64_t **)(v2 + 472);
    v10 = *v9;
    v11 = v9[1];
    MEMORY[0x19AEADCC0](v16);
    v20[0] = v10;
    v20[1] = v11;
    v19[0] = v20;
    v19[1] = v16;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::ModelInlinePreviewDidFailToLoad>(*(_QWORD *)(v5 + 208), (uint64_t)v19, *(_QWORD *)(*(_QWORD *)(v5 + 32) + 1896), 0);
    v13 = cf;
    cf = 0;
    if (v13)
      CFRelease(v13);
    v14 = v17;
    v17 = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2)
        WTF::StringImpl::destroy(v14, v12);
      else
        *(_DWORD *)v14 -= 2;
    }
    v15 = v16[1];
    v16[1] = 0;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2)
        WTF::StringImpl::destroy(v15, v12);
      else
        *(_DWORD *)v15 -= 2;
    }
    result = v16[0];
    v16[0] = 0;
    if (result)
    {
      if (*(_DWORD *)result == 2)
        return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v12);
      else
        *(_DWORD *)result -= 2;
    }
  }
  else
  {
    v6 = *(_QWORD *)(v3 + 8);
    if (v6)
      v7 = v6 - 16;
    else
      v7 = 0;
    *(_OWORD *)v16 = *(_OWORD *)(v2 + 472);
    v20[0] = (uint64_t *)v16;
    return (WTF::StringImpl *)WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::ModelInlinePreviewDidLoad>(*(_QWORD *)(v7 + 208), v20, *(_QWORD *)(*(_QWORD *)(v7 + 32) + 1896), 0);
  }
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WKModelView;
  -[WKModelView layoutSubviews](&v3, sel_layoutSubviews);
  -[WKModelView updateBounds](self, "updateBounds");
}

- (void)updateBounds
{
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  void *m_ptr;
  _QWORD v12[9];
  CGRect v13;

  -[WKModelView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v13.origin.x = v3;
  v13.origin.y = v5;
  v13.size.width = v7;
  v13.size.height = v9;
  if (!CGRectEqualToRect(self->_lastBounds, v13))
  {
    self->_lastBounds.origin.x = v4;
    self->_lastBounds.origin.y = v6;
    self->_lastBounds.size.width = v8;
    self->_lastBounds.size.height = v10;
    m_ptr = self->_preview.m_ptr;
    if (m_ptr)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __27__WKModelView_updateBounds__block_invoke;
      v12[3] = &unk_1E34CDF48;
      v12[4] = self;
      *(double *)&v12[5] = v4;
      *(double *)&v12[6] = v6;
      *(double *)&v12[7] = v8;
      *(double *)&v12[8] = v10;
      objc_msgSend(m_ptr, "updateFrame:completionHandler:", v12, v4, v6, v8, v10);
    }
    else
    {
      -[WKModelView createPreview](self, "createPreview");
    }
  }
}

void __27__WKModelView_updateBounds__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  _QWORD v6[6];
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  if (a3)
  {
    objc_msgSend(a2, "invalidate");
  }
  else
  {
    v9 = v3;
    v10 = v4;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __27__WKModelView_updateBounds__block_invoke_2;
    v6[3] = &unk_1E34CDF20;
    v6[4] = *(_QWORD *)(a1 + 32);
    v6[5] = a2;
    v5 = *(_OWORD *)(a1 + 56);
    v7 = *(_OWORD *)(a1 + 40);
    v8 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v6);
  }
}

uint64_t __27__WKModelView_updateBounds__block_invoke_2(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "layer"), "context"), "addFence:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setFrameWithinFencedTransaction:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  if (-[WKModelView pointInside:withEvent:](self, "pointInside:withEvent:", a4, a3.x, a3.y))
    return self;
  else
    return 0;
}

- (void).cxx_destruct
{
  unsigned int *m_ptr;
  unsigned int v4;
  unsigned int v5;
  StringImpl *v6;
  void *v7;
  void *v8;

  m_ptr = (unsigned int *)self->_page.m_impl.m_ptr;
  self->_page.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    do
    {
      v4 = __ldaxr(m_ptr);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, m_ptr));
    if (!v5)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
  v6 = self->_filePath.m_impl.m_ptr;
  self->_filePath.m_impl.m_ptr = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy((WTF::StringImpl *)v6, (WTF::StringImpl *)a2);
    else
      *(_DWORD *)v6 -= 2;
  }
  v7 = self->_modelInteractionGestureRecognizer.m_ptr;
  self->_modelInteractionGestureRecognizer.m_ptr = 0;
  if (v7)
    CFRelease(v7);
  v8 = self->_preview.m_ptr;
  self->_preview.m_ptr = 0;
  if (v8)
    CFRelease(v8);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 52) = 0;
  *((_QWORD *)self + 53) = 0;
  *((_QWORD *)self + 54) = 0;
  *((_QWORD *)self + 59) = 0;
  *((_QWORD *)self + 60) = 0;
  *((_QWORD *)self + 61) = 0;
  return self;
}

@end
