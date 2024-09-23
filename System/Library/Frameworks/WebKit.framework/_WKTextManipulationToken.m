@implementation _WKTextManipulationToken

- (void)dealloc
{
  objc_super v3;

  self->_identifier = 0;
  self->_content = 0;
  v3.receiver = self;
  v3.super_class = (Class)_WKTextManipulationToken;
  -[_WKTextManipulationToken dealloc](&v3, sel_dealloc);
}

- (void)setUserInfo:(id)a3
{
  id m_ptr;
  void *v6;
  void *v7;

  m_ptr = self->_userInfo.m_ptr;
  if (m_ptr != a3 && (objc_msgSend(m_ptr, "isEqual:") & 1) == 0)
  {
    v6 = (void *)objc_msgSend(a3, "copy");
    v7 = self->_userInfo.m_ptr;
    self->_userInfo.m_ptr = v6;
    if (v7)
      CFRelease(v7);
  }
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)self->_userInfo.m_ptr;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
    return 1;
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[_WKTextManipulationToken isEqualToTextManipulationToken:includingContentEquality:](self, "isEqualToTextManipulationToken:includingContentEquality:", a3, 1);
}

- (BOOL)isEqualToTextManipulationToken:(id)a3 includingContentEquality:(BOOL)a4
{
  _BOOL4 v4;
  NSString *v7;
  uint64_t v8;
  int v9;
  BOOL v11;
  char v12;
  NSString *v13;
  uint64_t v14;
  char v15;
  unsigned __int8 v16;
  NSDictionary *v17;
  uint64_t v18;
  char v19;

  if (!a3)
    return 0;
  v4 = a4;
  v7 = -[_WKTextManipulationToken identifier](self, "identifier");
  v8 = objc_msgSend(a3, "identifier");
  if (v7 == (NSString *)v8)
    LOBYTE(v9) = 0;
  else
    v9 = -[NSString isEqual:](v7, "isEqual:", v8) ^ 1;
  v11 = -[_WKTextManipulationToken isExcluded](self, "isExcluded");
  v12 = objc_msgSend(a3, "isExcluded");
  if (!v4
    || (v13 = -[_WKTextManipulationToken content](self, "content"),
        v14 = objc_msgSend(a3, "content"),
        v13 == (NSString *)v14))
  {
    v15 = 1;
  }
  else
  {
    v15 = -[NSString isEqual:](v13, "isEqual:", v14);
  }
  v16 = v11 ^ v12;
  v17 = -[_WKTextManipulationToken userInfo](self, "userInfo");
  v18 = objc_msgSend(a3, "userInfo");
  if (v17 == (NSDictionary *)v18)
    v19 = 1;
  else
    v19 = -[NSDictionary isEqual:](v17, "isEqual:", v18);
  if (((v9 | v16) & 1) != 0)
    return 0;
  else
    return v15 & v19;
}

- (id)description
{
  return -[_WKTextManipulationToken _descriptionPreservingPrivacy:](self, "_descriptionPreservingPrivacy:", 1);
}

- (NSString)debugDescription
{
  return (NSString *)-[_WKTextManipulationToken _descriptionPreservingPrivacy:](self, "_descriptionPreservingPrivacy:", 0);
}

- (id)_descriptionPreservingPrivacy:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSString *v6;
  uint64_t v8;

  v3 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; identifier = %@; isExcluded = %i"),
                 objc_opt_class(),
                 self,
                 -[_WKTextManipulationToken identifier](self, "identifier"),
                 -[_WKTextManipulationToken isExcluded](self, "isExcluded"));
  v6 = -[_WKTextManipulationToken content](self, "content");
  if (v3)
    objc_msgSend(v5, "appendFormat:", CFSTR("; content length = %lu"), -[NSString length](v6, "length"), v8);
  else
    objc_msgSend(v5, "appendFormat:", CFSTR("; content = %@; user info = %@"),
      v6,
      -[_WKTextManipulationToken userInfo](self, "userInfo"));
  objc_msgSend(v5, "appendString:", CFSTR(">"));
  return (id)(id)CFMakeCollectable((CFTypeRef)objc_msgSend(v5, "copy"));
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isExcluded
{
  return self->_excluded;
}

- (void)setExcluded:(BOOL)a3
{
  self->_excluded = a3;
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_userInfo.m_ptr;
  self->_userInfo.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
