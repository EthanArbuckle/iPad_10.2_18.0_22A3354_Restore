@implementation WKUSDPreviewView

- (id)web_initWithFrame:(CGRect)a3 webView:(id)a4 mimeType:(id)a5
{
  WKUSDPreviewView *v7;
  uint64_t v8;
  void *m_ptr;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WKUSDPreviewView;
  v7 = -[WKApplicationStateTrackingView initWithFrame:webView:](&v12, sel_initWithFrame_webView_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v7)
  {
    v8 = objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.149019608, 0.149019608, 0.149019608, 1.0);
    -[WKUSDPreviewView setBackgroundColor:](v7, "setBackgroundColor:", v8);
    v7->_webView = (WKWebView *)a4;
    if (a5)
      CFRetain(a5);
    m_ptr = v7->_mimeType.m_ptr;
    v7->_mimeType.m_ptr = a5;
    if (m_ptr)
      CFRelease(m_ptr);
    v10 = (void *)objc_msgSend(a4, "scrollView");
    objc_msgSend(v10, "setMinimumZoomScale:", 1.0);
    objc_msgSend(v10, "setMaximumZoomScale:", 1.0);
    objc_msgSend(v10, "setBackgroundColor:", v8);
  }
  return v7;
}

- (void)web_setContentProviderData:(id)a3 suggestedFilename:(id)a4
{
  void *v6;
  void *m_ptr;
  void *v8;
  void *v9;
  const WTF::String *v10;
  const WTF::String *v11;
  const __CFString *v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  WTF::StringImpl *v23;
  WTF::StringImpl *v24;

  v6 = (void *)objc_msgSend(a4, "copy");
  m_ptr = self->_suggestedFilename.m_ptr;
  self->_suggestedFilename.m_ptr = v6;
  if (m_ptr)
    CFRelease(m_ptr);
  v8 = (void *)objc_msgSend(a3, "copy");
  v9 = self->_data.m_ptr;
  self->_data.m_ptr = v8;
  if (v9)
    CFRelease(v9);
  MEMORY[0x19AEABCC8](&v23, self->_mimeType.m_ptr);
  if (WebCore::MIMETypeRegistry::isUSDMIMEType((WebCore::MIMETypeRegistry *)&v23, v10))
  {
    WebCore::UTIFromMIMEType((WebCore *)&v23, v11);
    if (v24)
    {
      v12 = (const __CFString *)WTF::StringImpl::operator NSString *();
      v13 = v24;
      v24 = 0;
      if (v13)
      {
        if (*(_DWORD *)v13 == 2)
          WTF::StringImpl::destroy(v13, v11);
        else
          *(_DWORD *)v13 -= 2;
      }
    }
    else
    {
      v12 = &stru_1E351F1B8;
    }
  }
  else
  {
    v12 = 0;
  }
  v14 = v23;
  v23 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2)
      v14 = (WTF::StringImpl *)WTF::StringImpl::destroy(v14, v11);
    else
      *(_DWORD *)v14 -= 2;
  }
  v15 = objc_alloc((Class)((uint64_t (*)(WTF::StringImpl *))*MEMORY[0x1E0DCDEF0])(v14));
  v16 = (void *)objc_msgSend(v15, "initWithDataProvider:contentType:previewTitle:", self, v12, self->_suggestedFilename.m_ptr, v23);
  v17 = self->_item.m_ptr;
  self->_item.m_ptr = v16;
  if (v17)
  {
    CFRelease(v17);
    v16 = self->_item.m_ptr;
  }
  objc_msgSend(v16, "setUseLoadingTimeout:", 0);
  v18 = (void *)objc_msgSend(objc_alloc((Class)getASVThumbnailViewClass()), "init");
  v19 = self->_thumbnailView.m_ptr;
  self->_thumbnailView.m_ptr = v18;
  if (v19)
  {
    CFRelease(v19);
    v18 = self->_thumbnailView.m_ptr;
  }
  objc_msgSend(v18, "setDelegate:", self);
  -[WKUSDPreviewView setAutoresizingMask:](self, "setAutoresizingMask:", 18);
  -[WKUSDPreviewView setAutoresizesSubviews:](self, "setAutoresizesSubviews:", 1);
  -[WKUSDPreviewView setClipsToBounds:](self, "setClipsToBounds:", 1);
  -[WKUSDPreviewView addSubview:](self, "addSubview:", self->_thumbnailView.m_ptr);
  -[WKUSDPreviewView _layoutThumbnailView](self, "_layoutThumbnailView");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen"), "bounds");
  if (v20 >= v21)
    v22 = v21;
  else
    v22 = v20;
  objc_msgSend(self->_thumbnailView.m_ptr, "setMaxThumbnailSize:", v22, v22);
  objc_msgSend(self->_thumbnailView.m_ptr, "setThumbnailItem:", self->_item.m_ptr);
}

- (void)_layoutThumbnailView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  if (self->_thumbnailView.m_ptr)
  {
    -[WKWebView _computedUnobscuredSafeAreaInset](self->_webView, "_computedUnobscuredSafeAreaInset");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[WKWebView _computedObscuredInset](self->_webView, "_computedObscuredInset");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    -[WKUSDPreviewView frame](self, "frame");
    objc_msgSend(self->_thumbnailView.m_ptr, "setFrame:", v6 + v19, v4 + v20, v21 - (v6 + v10) - (v14 + v18), v22 - (v4 + v8) - (v12 + v16));
    objc_msgSend(self->_thumbnailView.m_ptr, "setAutoresizingMask:", 18);
  }
}

- (void)thumbnailView:(id)a3 wantsToPresentPreviewController:(id)a4 forItem:(id)a5
{
  WebPageProxy *m_ptr;

  m_ptr = self->_webView->_page.m_ptr;
  if (m_ptr)
    CFRetain(*((CFTypeRef *)m_ptr + 1));
  objc_msgSend((id)(*(uint64_t (**)(_QWORD, SEL, id, id, id))(**((_QWORD **)m_ptr + 13) + 488))(*((_QWORD *)m_ptr + 13), a2, a3, a4, a5), "presentViewController:animated:completion:", a4, 1, 0);
  CFRelease(*((CFTypeRef *)m_ptr + 1));
}

+ (BOOL)web_requiresCustomSnapshotting
{
  return 0;
}

- (void)web_countStringMatches:(id)a3 options:(unint64_t)a4 maxCount:(unint64_t)a5
{
  WebPageProxy *m_ptr;
  uint64_t v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  m_ptr = self->_webView->_page.m_ptr;
  if (m_ptr)
    CFRetain(*((CFTypeRef *)m_ptr + 1));
  v7 = *((_QWORD *)m_ptr + 14);
  MEMORY[0x19AEABCC8](&v10, a3, a3, a4, a5);
  (*(void (**)(uint64_t, WebPageProxy *, WTF::StringImpl **, _QWORD))(*(_QWORD *)v7 + 16))(v7, m_ptr, &v10, 0);
  v9 = v10;
  v10 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      WTF::StringImpl::destroy(v9, v8);
    else
      *(_DWORD *)v9 -= 2;
  }
  CFRelease(*((CFTypeRef *)m_ptr + 1));
}

- (void)web_findString:(id)a3 options:(unint64_t)a4 maxCount:(unint64_t)a5
{
  WebPageProxy *m_ptr;
  uint64_t v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  m_ptr = self->_webView->_page.m_ptr;
  if (m_ptr)
    CFRetain(*((CFTypeRef *)m_ptr + 1));
  v7 = *((_QWORD *)m_ptr + 14);
  MEMORY[0x19AEABCC8](&v10, a3, a3, a4, a5);
  (*(void (**)(uint64_t, WebPageProxy *, WTF::StringImpl **))(*(_QWORD *)v7 + 32))(v7, m_ptr, &v10);
  v9 = v10;
  v10 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      WTF::StringImpl::destroy(v9, v8);
    else
      *(_DWORD *)v9 -= 2;
  }
  CFRelease(*((CFTypeRef *)m_ptr + 1));
}

- (id)provideDataForItem:(id)a3
{
  return self->_data.m_ptr;
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  m_ptr = self->_thumbnailView.m_ptr;
  self->_thumbnailView.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_item.m_ptr;
  self->_item.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_mimeType.m_ptr;
  self->_mimeType.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  v6 = self->_suggestedFilename.m_ptr;
  self->_suggestedFilename.m_ptr = 0;
  if (v6)
    CFRelease(v6);
  v7 = self->_data.m_ptr;
  self->_data.m_ptr = 0;
  if (v7)
    CFRelease(v7);
  v8 = self->_itemProvider.m_ptr;
  self->_itemProvider.m_ptr = 0;
  if (v8)
    CFRelease(v8);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 54) = 0;
  *((_QWORD *)self + 55) = 0;
  *((_QWORD *)self + 56) = 0;
  *((_QWORD *)self + 57) = 0;
  *((_QWORD *)self + 58) = 0;
  *((_QWORD *)self + 59) = 0;
  return self;
}

@end
