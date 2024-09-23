@implementation _WKTextManipulationExclusionRule

- (id)initExclusion:(BOOL)a3 forElement:(id)a4
{
  _WKTextManipulationExclusionRule *v6;
  _WKTextManipulationExclusionRule *v7;
  void *m_ptr;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_WKTextManipulationExclusionRule;
  v6 = -[_WKTextManipulationExclusionRule init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_isExclusion = a3;
    if (a4)
      CFRetain(a4);
    m_ptr = v7->_elementName.m_ptr;
    v7->_elementName.m_ptr = a4;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  return v7;
}

- (id)initExclusion:(BOOL)a3 forAttribute:(id)a4 value:(id)a5
{
  _WKTextManipulationExclusionRule *v8;
  _WKTextManipulationExclusionRule *v9;
  void *m_ptr;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_WKTextManipulationExclusionRule;
  v8 = -[_WKTextManipulationExclusionRule init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_isExclusion = a3;
    if (a4)
      CFRetain(a4);
    m_ptr = v9->_attributeName.m_ptr;
    v9->_attributeName.m_ptr = a4;
    if (m_ptr)
      CFRelease(m_ptr);
    if (a5)
      CFRetain(a5);
    v11 = v9->_attributeValue.m_ptr;
    v9->_attributeValue.m_ptr = a5;
    if (v11)
      CFRelease(v11);
  }
  return v9;
}

- (id)initExclusion:(BOOL)a3 forClass:(id)a4
{
  _WKTextManipulationExclusionRule *v6;
  _WKTextManipulationExclusionRule *v7;
  void *m_ptr;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_WKTextManipulationExclusionRule;
  v6 = -[_WKTextManipulationExclusionRule init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_isExclusion = a3;
    if (a4)
      CFRetain(a4);
    m_ptr = v7->_className.m_ptr;
    v7->_className.m_ptr = a4;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  return v7;
}

- (NSString)elementName
{
  return (NSString *)self->_elementName.m_ptr;
}

- (NSString)attributeName
{
  return (NSString *)self->_attributeName.m_ptr;
}

- (NSString)attributeValue
{
  return (NSString *)self->_attributeValue.m_ptr;
}

- (NSString)className
{
  return (NSString *)self->_className.m_ptr;
}

- (BOOL)isExclusion
{
  return self->_isExclusion;
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;
  void *v6;

  m_ptr = self->_className.m_ptr;
  self->_className.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_attributeValue.m_ptr;
  self->_attributeValue.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_attributeName.m_ptr;
  self->_attributeName.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  v6 = self->_elementName.m_ptr;
  self->_elementName.m_ptr = 0;
  if (v6)
    CFRelease(v6);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

@end
