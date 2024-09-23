@implementation _WKTextManipulationItem

- (_WKTextManipulationItem)initWithIdentifier:(id)a3 tokens:(id)a4
{
  _WKTextManipulationItem *v6;
  void *m_ptr;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_WKTextManipulationItem;
  v6 = -[_WKTextManipulationItem init](&v10, sel_init);
  if (v6)
  {
    if (a3)
      CFRetain(a3);
    m_ptr = v6->_identifier.m_ptr;
    v6->_identifier.m_ptr = a3;
    if (m_ptr)
      CFRelease(m_ptr);
    if (a4)
      CFRetain(a4);
    v8 = v6->_tokens.m_ptr;
    v6->_tokens.m_ptr = a4;
    if (v8)
      CFRelease(v8);
  }
  return v6;
}

- (_WKTextManipulationItem)initWithIdentifier:(id)a3 tokens:(id)a4 isSubframe:(BOOL)a5 isCrossSiteSubframe:(BOOL)a6
{
  _WKTextManipulationItem *v10;
  void *m_ptr;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_WKTextManipulationItem;
  v10 = -[_WKTextManipulationItem init](&v14, sel_init);
  if (v10)
  {
    if (a3)
      CFRetain(a3);
    m_ptr = v10->_identifier.m_ptr;
    v10->_identifier.m_ptr = a3;
    if (m_ptr)
      CFRelease(m_ptr);
    if (a4)
      CFRetain(a4);
    v12 = v10->_tokens.m_ptr;
    v10->_tokens.m_ptr = a4;
    if (v12)
      CFRelease(v12);
    v10->_isSubframe = a5;
    v10->_isCrossSiteSubframe = a6;
  }
  return v10;
}

- (NSString)identifier
{
  return (NSString *)self->_identifier.m_ptr;
}

- (NSArray)tokens
{
  return (NSArray *)self->_tokens.m_ptr;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
    return 1;
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[_WKTextManipulationItem isEqualToTextManipulationItem:includingContentEquality:](self, "isEqualToTextManipulationItem:includingContentEquality:", a3, 1);
}

- (BOOL)isEqualToTextManipulationItem:(id)a3 includingContentEquality:(BOOL)a4
{
  id v4;
  NSString *v7;
  NSUInteger v8;
  NSUInteger v9;
  unint64_t v10;
  NSArray *v11;
  NSUInteger v12;
  uint64_t v13;
  _QWORD v15[6];
  BOOL v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v4 = a3;
  if (a3)
  {
    v7 = -[_WKTextManipulationItem identifier](self, "identifier");
    if ((v7 == (NSString *)objc_msgSend(v4, "identifier")
       || -[NSString isEqualToString:](-[_WKTextManipulationItem identifier](self, "identifier"), "isEqualToString:", objc_msgSend(v4, "identifier")))&& (v8 = -[NSArray count](-[_WKTextManipulationItem tokens](self, "tokens"), "count"), v8 == objc_msgSend((id)objc_msgSend(v4, "tokens"), "count")))
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x2020000000;
      v20 = 1;
      v9 = -[NSArray count](-[_WKTextManipulationItem tokens](self, "tokens"), "count");
      v10 = objc_msgSend((id)objc_msgSend(v4, "tokens"), "count");
      v11 = -[_WKTextManipulationItem tokens](self, "tokens");
      if (v10 >= v9)
        v12 = v9;
      else
        v12 = v10;
      v13 = objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v12);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __82___WKTextManipulationItem_isEqualToTextManipulationItem_includingContentEquality___block_invoke;
      v15[3] = &unk_1E34C3EE8;
      v16 = a4;
      v15[4] = v4;
      v15[5] = &v17;
      -[NSArray enumerateObjectsAtIndexes:options:usingBlock:](v11, "enumerateObjectsAtIndexes:options:usingBlock:", v13, 0, v15);
      LOBYTE(v4) = *((_BYTE *)v18 + 24) != 0;
      _Block_object_dispose(&v17, 8);
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return (char)v4;
}

- (id)description
{
  return -[_WKTextManipulationItem _descriptionPreservingPrivacy:](self, "_descriptionPreservingPrivacy:", 1);
}

- (NSString)debugDescription
{
  return (NSString *)-[_WKTextManipulationItem _descriptionPreservingPrivacy:](self, "_descriptionPreservingPrivacy:", 0);
}

- (id)_descriptionPreservingPrivacy:(BOOL)a3
{
  void *v5;
  NSArray *v6;
  uint64_t v7;
  _QWORD v9[5];
  BOOL v10;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = -[_WKTextManipulationItem tokens](self, "tokens");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57___WKTextManipulationItem__descriptionPreservingPrivacy___block_invoke;
  v9[3] = &unk_1E34C3F10;
  v10 = a3;
  v9[4] = v5;
  -[NSArray enumerateObjectsUsingBlock:](v6, "enumerateObjectsUsingBlock:", v9);
  v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[\n\t%@\n]"), objc_msgSend(v5, "componentsJoinedByString:", CFSTR(",\n\t")));
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; identifier = %@ tokens = %@>"),
               objc_opt_class(),
               self,
               -[_WKTextManipulationItem identifier](self, "identifier"),
               v7);
}

- (BOOL)isSubframe
{
  return self->_isSubframe;
}

- (BOOL)isCrossSiteSubframe
{
  return self->_isCrossSiteSubframe;
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;

  m_ptr = self->_tokens.m_ptr;
  self->_tokens.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_identifier.m_ptr;
  self->_identifier.m_ptr = 0;
  if (v4)
    CFRelease(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
