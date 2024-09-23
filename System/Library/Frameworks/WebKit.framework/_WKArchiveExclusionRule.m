@implementation _WKArchiveExclusionRule

- (_WKArchiveExclusionRule)initWithElementLocalName:(id)a3 attributeLocalNames:(id)a4 attributeValues:(id)a5
{
  _WKArchiveExclusionRule *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *m_ptr;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_WKArchiveExclusionRule;
  v8 = -[_WKArchiveExclusionRule init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(a4, "count");
    v10 = objc_msgSend(a5, "count");
    v11 = (_QWORD *)MEMORY[0x1E0C99778];
    if (v9 != v10)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("attributeLocalNames and attributeValues must have same size"));
    if ((unint64_t)a3 | (unint64_t)a4)
    {
      if (a3)
        CFRetain(a3);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v11, CFSTR("elementLocalName and attributeLocalNames cannot both be null"));
    }
    m_ptr = v8->_elementLocalName.m_ptr;
    v8->_elementLocalName.m_ptr = a3;
    if (m_ptr)
      CFRelease(m_ptr);
    if (a4)
      CFRetain(a4);
    v13 = v8->_attributeLocalNames.m_ptr;
    v8->_attributeLocalNames.m_ptr = a4;
    if (v13)
      CFRelease(v13);
    if (a5)
      CFRetain(a5);
    v14 = v8->_attributeValues.m_ptr;
    v8->_attributeValues.m_ptr = a5;
    if (v14)
      CFRelease(v14);
  }
  return v8;
}

- (NSString)elementLocalName
{
  return (NSString *)self->_elementLocalName.m_ptr;
}

- (NSArray)attributeLocalNames
{
  return (NSArray *)self->_attributeLocalNames.m_ptr;
}

- (NSArray)attributeValues
{
  return (NSArray *)self->_attributeValues.m_ptr;
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;

  m_ptr = self->_attributeValues.m_ptr;
  self->_attributeValues.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_attributeLocalNames.m_ptr;
  self->_attributeLocalNames.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_elementLocalName.m_ptr;
  self->_elementLocalName.m_ptr = 0;
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
