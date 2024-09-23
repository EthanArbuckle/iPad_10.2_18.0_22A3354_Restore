@implementation WKShareSheetURLItemProvider

- (WKShareSheetURLItemProvider)initWithURL:(id)a3 title:(id)a4
{
  WKShareSheetURLItemProvider *v6;
  void *v7;
  void *m_ptr;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WKShareSheetURLItemProvider;
  v6 = -[UIActivityItemProvider initWithPlaceholderItem:](&v11, sel_initWithPlaceholderItem_);
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)((uint64_t (*)(void))*MEMORY[0x1E0DCDFB8])()), "init");
    objc_msgSend(v7, "setOriginalURL:", a3);
    objc_msgSend(v7, "setURL:", a3);
    objc_msgSend(v7, "setTitle:", a4);
    objc_msgSend(v7, "_setIncomplete:", 1);
    m_ptr = v6->_metadata.m_ptr;
    v6->_metadata.m_ptr = v7;
    if (m_ptr)
      CFRelease(m_ptr);
    if (a3)
      CFRetain(a3);
    v9 = v6->_url.m_ptr;
    v6->_url.m_ptr = a3;
    if (v9)
      CFRelease(v9);
  }
  return v6;
}

- (id)item
{
  return self->_url.m_ptr;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  return self->_metadata.m_ptr;
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;

  m_ptr = self->_metadata.m_ptr;
  self->_metadata.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_url.m_ptr;
  self->_url.m_ptr = 0;
  if (v4)
    CFRelease(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 34) = 0;
  *((_QWORD *)self + 35) = 0;
  return self;
}

@end
