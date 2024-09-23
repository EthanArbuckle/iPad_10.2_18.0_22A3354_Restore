@implementation _WKAppHighlight

- (_WKAppHighlight)initWithHighlight:(id)a3 text:(id)a4 image:(id)a5
{
  _WKAppHighlight *v8;
  void *m_ptr;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_WKAppHighlight;
  v8 = -[_WKAppHighlight init](&v13, sel_init);
  if (v8)
  {
    if (a3)
      CFRetain(a3);
    m_ptr = v8->_highlight.m_ptr;
    v8->_highlight.m_ptr = a3;
    if (m_ptr)
      CFRelease(m_ptr);
    if (a4)
      CFRetain(a4);
    v10 = v8->_text.m_ptr;
    v8->_text.m_ptr = a4;
    if (v10)
      CFRelease(v10);
    if (a5)
      CFRetain(a5);
    v11 = v8->_image.m_ptr;
    v8->_image.m_ptr = a5;
    if (v11)
      CFRelease(v11);
  }
  return v8;
}

- (NSData)highlight
{
  return (NSData *)self->_highlight.m_ptr;
}

- (NSString)text
{
  return (NSString *)self->_text.m_ptr;
}

- (UIImage)image
{
  return (UIImage *)self->_image.m_ptr;
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;

  m_ptr = self->_image.m_ptr;
  self->_image.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_text.m_ptr;
  self->_text.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_highlight.m_ptr;
  self->_highlight.m_ptr = 0;
  if (v5)
    CFRelease(v5);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
