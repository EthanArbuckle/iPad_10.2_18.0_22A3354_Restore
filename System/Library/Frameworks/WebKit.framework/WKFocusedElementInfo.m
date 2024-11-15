@implementation WKFocusedElementInfo

- (WKFocusedElementInfo)initWithFocusedElementInformation:(const void *)a3 isUserInitiated:(BOOL)a4 userObject:(id)a5
{
  WKFocusedElementInfo *v8;
  WKFocusedElementInfo *v9;
  unint64_t v10;
  const __CFString *v11;
  const void **p_m_ptr;
  const void *v13;
  void *m_ptr;
  const __CFString *v15;
  const void **v16;
  const void *v17;
  const __CFString *v18;
  const void **v19;
  const void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)WKFocusedElementInfo;
  v8 = -[WKFocusedElementInfo init](&v22, sel_init);
  v9 = v8;
  if (!v8)
    return v9;
  v10 = *((char *)a3 + 185);
  if (v10 <= 0x12)
    v8->_type = qword_1978D2A08[v10];
  if (*((_QWORD *)a3 + 28))
  {
    v11 = (const __CFString *)WTF::StringImpl::operator NSString *();
    p_m_ptr = (const void **)&v9->_value.m_ptr;
    if (!v11)
      goto LABEL_7;
  }
  else
  {
    p_m_ptr = (const void **)&v8->_value.m_ptr;
    v11 = &stru_1E351F1B8;
  }
  CFRetain(v11);
LABEL_7:
  v13 = *p_m_ptr;
  *p_m_ptr = v11;
  if (v13)
    CFRelease(v13);
  v9->_isUserInitiated = a4;
  if (a5)
    CFRetain(a5);
  m_ptr = v9->_userObject.m_ptr;
  v9->_userObject.m_ptr = a5;
  if (m_ptr)
    CFRelease(m_ptr);
  if (*((_QWORD *)a3 + 38))
  {
    v15 = (const __CFString *)WTF::StringImpl::operator NSString *();
    v16 = (const void **)&v9->_placeholder.m_ptr;
    if (!v15)
      goto LABEL_16;
  }
  else
  {
    v16 = (const void **)&v9->_placeholder.m_ptr;
    v15 = &stru_1E351F1B8;
  }
  CFRetain(v15);
LABEL_16:
  v17 = *v16;
  *v16 = v15;
  if (v17)
    CFRelease(v17);
  if (*((_QWORD *)a3 + 39))
  {
    v18 = (const __CFString *)WTF::StringImpl::operator NSString *();
    v19 = (const void **)&v9->_label.m_ptr;
    if (!v18)
      goto LABEL_21;
  }
  else
  {
    v19 = (const void **)&v9->_label.m_ptr;
    v18 = &stru_1E351F1B8;
  }
  CFRetain(v18);
LABEL_21:
  v20 = *v19;
  *v19 = v18;
  if (v20)
    CFRelease(v20);
  return v9;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)value
{
  return (NSString *)self->_value.m_ptr;
}

- (BOOL)isUserInitiated
{
  return self->_isUserInitiated;
}

- (NSSecureCoding)userObject
{
  return (NSSecureCoding *)self->_userObject.m_ptr;
}

- (NSString)label
{
  return (NSString *)self->_label.m_ptr;
}

- (NSString)placeholder
{
  return (NSString *)self->_placeholder.m_ptr;
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;
  void *v6;

  m_ptr = self->_label.m_ptr;
  self->_label.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_placeholder.m_ptr;
  self->_placeholder.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_userObject.m_ptr;
  self->_userObject.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  v6 = self->_value.m_ptr;
  self->_value.m_ptr = 0;
  if (v6)
    CFRelease(v6);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
