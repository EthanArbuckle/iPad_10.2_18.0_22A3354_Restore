@implementation _WKUserContentFilter

- (Object)_apiObject
{
  return (Object *)objc_msgSend(self->_contentRuleList.m_ptr, "_apiObject");
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_contentRuleList.m_ptr;
  self->_contentRuleList.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (id)_initWithWKContentRuleList:(id)a3
{
  _WKUserContentFilter *v4;
  void *m_ptr;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_WKUserContentFilter;
  v4 = -[_WKUserContentFilter init](&v7, sel_init);
  if (v4)
  {
    if (a3)
      CFRetain(a3);
    m_ptr = v4->_contentRuleList.m_ptr;
    v4->_contentRuleList.m_ptr = a3;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  return v4;
}

@end
