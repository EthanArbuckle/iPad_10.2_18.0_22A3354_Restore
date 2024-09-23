@implementation WKPreviewElementInfo

- (id)_initWithLinkURL:(id)a3
{
  WKPreviewElementInfo *v4;
  uint64_t v5;
  void *m_ptr;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WKPreviewElementInfo;
  v4 = -[WKPreviewElementInfo init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(a3, "copy");
    m_ptr = v4->_linkURL.m_ptr;
    v4->_linkURL.m_ptr = (void *)v5;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  return v4;
}

- (NSURL)linkURL
{
  return (NSURL *)self->_linkURL.m_ptr;
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_linkURL.m_ptr;
  self->_linkURL.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
