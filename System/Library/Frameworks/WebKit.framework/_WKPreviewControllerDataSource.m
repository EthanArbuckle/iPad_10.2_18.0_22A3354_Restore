@implementation _WKPreviewControllerDataSource

- (_WKPreviewControllerDataSource)initWithSystemPreviewController:(void *)a3 MIMEType:(id)a4 originatingPageURL:(URL *)a5
{
  id v8;
  _WKPreviewControllerDataSource *v9;
  __int128 v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_WKPreviewControllerDataSource;
  v8 = -[_WKPreviewControllerDataSource init](&v12, sel_init);
  v9 = (_WKPreviewControllerDataSource *)v8;
  if (v8)
  {
    *((_QWORD *)v8 + 13) = a3;
    WTF::String::operator=((WTF::StringImpl **)v8 + 3, (WTF::StringImpl *)a5);
    v10 = *(_OWORD *)&a5->m_hostEnd;
    *(_OWORD *)((char *)&v9->_originatingPageURL + 8) = *(_OWORD *)((char *)a5 + 8);
    *(_OWORD *)&v9->_originatingPageURL.m_hostEnd = v10;
    v9->_mimeType = (NSString *)objc_msgSend(a4, "copy");
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_WKPreviewControllerDataSource;
  -[_WKPreviewControllerDataSource dealloc](&v3, sel_dealloc);
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return 1;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  void *m_ptr;
  id v6;
  void *v7;
  const WTF::String *v8;
  WTF::StringImpl *v9;
  const __CFString *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  WTF::StringImpl *v23;
  id to;
  id location;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  m_ptr = self->_item.m_ptr;
  if (!m_ptr)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
    v7 = self->_itemProvider.m_ptr;
    self->_itemProvider.m_ptr = v6;
    if (v7)
      CFRelease(v7);
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    v23 = (WTF::StringImpl *)location;
    WebCore::UTIFromMIMEType((WebCore *)&v23, v8);
    if (to)
    {
      v10 = (const __CFString *)WTF::StringImpl::operator NSString *();
      v11 = (WTF::StringImpl *)to;
      to = 0;
      if (v11)
      {
        if (*(_DWORD *)v11 == 2)
          WTF::StringImpl::destroy(v11, v9);
        else
          *(_DWORD *)v11 -= 2;
      }
    }
    else
    {
      to = 0;
      v10 = &stru_1E351F1B8;
    }
    v12 = v23;
    v23 = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2)
        v12 = (WTF::StringImpl *)WTF::StringImpl::destroy(v12, v9);
      else
        *(_DWORD *)v12 -= 2;
    }
    v13 = objc_alloc((Class)WebKit::getARQuickLookPreviewItemClass[0](v12));
    v14 = (void *)objc_msgSend(v13, "initWithFileAtURL:", WTF::URL::operator NSURL *());
    objc_msgSend(v14, "setCanonicalWebPageURL:", WTF::URL::operator NSURL *());
    v15 = (void *)objc_msgSend(objc_alloc((Class)getARQuickLookWebKitItemClass()), "initWithPreviewItemProvider:contentType:previewTitle:fileSize:previewItem:", self->_itemProvider.m_ptr, v10, CFSTR("Preview"), &unk_1E356FD18, v14);
    v16 = self->_item.m_ptr;
    self->_item.m_ptr = v15;
    if (v16)
    {
      CFRelease(v16);
      v15 = self->_item.m_ptr;
    }
    objc_msgSend(v15, "setDelegate:", self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v17 = WTF::URL::operator NSURL *();
      v18 = self->_item.m_ptr;
      v26 = CFSTR("ARQLWebsiteURLParameterKey");
      v27[0] = v17;
      objc_msgSend(v18, "setAdditionalParameters:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1));
    }
    objc_msgSend(self->_item.m_ptr, "setUseLoadingTimeout:", 0);
    location = 0;
    objc_initWeak(&location, self);
    v19 = self->_itemProvider.m_ptr;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3321888768;
    v21[2] = __71___WKPreviewControllerDataSource_previewController_previewItemAtIndex___block_invoke;
    v21[3] = &__block_descriptor_40_e8_32c85_ZTSKZ71___WKPreviewControllerDataSource_previewController_previewItemAtIndex__E4__12_e63_v32__0___v_____NSSecureCoding____NSError__8_16__NSDictionary_24l;
    to = 0;
    objc_moveWeak(&to, &location);
    v22 = 0;
    objc_copyWeak(&v22, &to);
    objc_msgSend(v19, "registerItemForTypeIdentifier:loadHandler:", v10, v21);
    objc_destroyWeak(&to);
    m_ptr = self->_item.m_ptr;
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    if (v14)
      CFRelease(v14);
  }
  return m_ptr;
}

- (void)setProgress:(float)a3
{
  void *m_ptr;

  m_ptr = self->_item.m_ptr;
  if (m_ptr)
    objc_msgSend(m_ptr, "setPreviewItemProviderProgress:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"));
}

- (void)finish:(URL *)a3
{
  __int128 v5;
  void (**v6)(id, uint64_t, _QWORD);
  uint64_t v7;

  WTF::String::operator=((WTF::StringImpl **)&self->_downloadedURL, (WTF::StringImpl *)a3);
  v5 = *(_OWORD *)&a3->m_hostEnd;
  *(_OWORD *)((char *)&self->_downloadedURL + 8) = *(_OWORD *)((char *)a3 + 8);
  *(_OWORD *)&self->_downloadedURL.m_hostEnd = v5;
  if (-[_WKPreviewControllerDataSource completionHandler](self, "completionHandler"))
  {
    v6 = -[_WKPreviewControllerDataSource completionHandler](self, "completionHandler");
    v7 = WTF::URL::operator NSURL *();
    v6[2](v6, v7, 0);
  }
}

- (void)failWithError:(id)a3
{
  void (**v5)(id, _QWORD, id);

  if (-[_WKPreviewControllerDataSource completionHandler](self, "completionHandler"))
  {
    v5 = -[_WKPreviewControllerDataSource completionHandler](self, "completionHandler");
    v5[2](v5, 0, a3);
  }
}

- (void)previewItem:(id)a3 didReceiveMessage:(id)a4
{
  if (self->_previewController)
  {
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("callToAction")), "stringValue"), "isEqualToString:", CFSTR("buttonTapped")))WebKit::SystemPreviewController::triggerSystemPreviewAction((WebKit::SystemPreviewController *)self->_previewController);
  }
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSString)mimeType
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setMimeType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  StringImpl *m_ptr;
  StringImpl *v4;
  void *v5;
  void *v6;

  m_ptr = self->_downloadedURL.m_string.m_impl.m_ptr;
  self->_downloadedURL.m_string.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 2)
      WTF::StringImpl::destroy((WTF::StringImpl *)m_ptr, (WTF::StringImpl *)a2);
    else
      *(_DWORD *)m_ptr -= 2;
  }
  v4 = self->_originatingPageURL.m_string.m_impl.m_ptr;
  self->_originatingPageURL.m_string.m_impl.m_ptr = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2)
      WTF::StringImpl::destroy((WTF::StringImpl *)v4, (WTF::StringImpl *)a2);
    else
      *(_DWORD *)v4 -= 2;
  }
  v5 = self->_item.m_ptr;
  self->_item.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  v6 = self->_itemProvider.m_ptr;
  self->_itemProvider.m_ptr = 0;
  if (v6)
    CFRelease(v6);
}

- (id).cxx_construct
{
  self->_itemProvider.m_ptr = 0;
  self->_item.m_ptr = 0;
  WTF::URL::URL((WTF::URL *)&self->_originatingPageURL);
  WTF::URL::URL((WTF::URL *)&self->_downloadedURL);
  return self;
}

@end
