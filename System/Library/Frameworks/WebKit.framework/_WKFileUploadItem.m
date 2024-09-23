@implementation _WKFileUploadItem

- (_WKFileUploadItem)initWithFileURL:(id)a3
{
  _WKFileUploadItem *v4;
  void *m_ptr;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_WKFileUploadItem;
  v4 = -[_WKFileUploadItem init](&v7, sel_init);
  if (v4)
  {
    if (a3)
      CFRetain(a3);
    m_ptr = v4->_fileURL.m_ptr;
    v4->_fileURL.m_ptr = a3;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  return v4;
}

- (BOOL)isVideo
{
  return 0;
}

- (id)fileURL
{
  return self->_fileURL.m_ptr;
}

- (void)setFileURL:(id)a3
{
  void *m_ptr;

  if (a3)
    CFRetain(a3);
  m_ptr = self->_fileURL.m_ptr;
  self->_fileURL.m_ptr = a3;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (RetainPtr<UIImage>)displayImage
{
  _QWORD *v2;

  *v2 = 0;
  return (RetainPtr<UIImage>)self;
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_fileURL.m_ptr;
  self->_fileURL.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
