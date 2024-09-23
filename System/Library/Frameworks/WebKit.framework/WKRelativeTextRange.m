@implementation WKRelativeTextRange

- (WKRelativeTextRange)initWithStart:(id)a3 end:(id)a4
{
  WKRelativeTextRange *v6;
  id v7;
  unsigned __int8 v8;
  uint64_t v9;
  char isKindOfClass;
  id v11;
  unsigned __int8 v12;
  uint64_t v13;
  char v14;
  BOOL v15;
  WKRelativeTextPosition *v16;
  void *m_ptr;
  WKRelativeTextPosition *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)WKRelativeTextRange;
  v6 = -[WKRelativeTextRange init](&v21, sel_init);
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = a3;
    else
      v7 = 0;
    if (objc_msgSend(v7, "anchors"))
    {
      v8 = objc_msgSend(v7, "anchors");
      v9 = 0;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v9 = 0;
      v8 = 0;
      if (a3 && (isKindOfClass & 1) != 0)
      {
        v8 = objc_msgSend(a3, "anchors");
        v9 = objc_msgSend(a3, "offset");
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = a4;
    else
      v11 = 0;
    if (objc_msgSend(v11, "anchors"))
    {
      v12 = objc_msgSend(v11, "anchors");
      v13 = 0;
    }
    else
    {
      objc_opt_class();
      v14 = objc_opt_isKindOfClass();
      if (!a4 || (v14 & 1) == 0)
        return v6;
      v12 = objc_msgSend(a4, "anchors");
      v13 = objc_msgSend(a4, "offset");
    }
    if (v8)
      v15 = v12 == 0;
    else
      v15 = 1;
    if (!v15)
    {
      v16 = -[WKRelativeTextPosition initWithAnchors:offset:]([WKRelativeTextPosition alloc], "initWithAnchors:offset:", v8, v9);
      m_ptr = v6->_start.m_ptr;
      v6->_start.m_ptr = v16;
      if (m_ptr)
        CFRelease(m_ptr);
      v18 = -[WKRelativeTextPosition initWithAnchors:offset:]([WKRelativeTextPosition alloc], "initWithAnchors:offset:", v12, v13);
      v19 = v6->_end.m_ptr;
      v6->_end.m_ptr = v18;
      if (v19)
        CFRelease(v19);
    }
  }
  return v6;
}

- (WKRelativeTextPosition)start
{
  return (WKRelativeTextPosition *)self->_start.m_ptr;
}

- (WKRelativeTextPosition)end
{
  return (WKRelativeTextPosition *)self->_end.m_ptr;
}

- (BOOL)isEmpty
{
  int v3;
  uint64_t v4;

  v3 = objc_msgSend(self->_start.m_ptr, "anchors");
  if (v3 != objc_msgSend(self->_end.m_ptr, "anchors"))
    return 0;
  v4 = objc_msgSend(self->_start.m_ptr, "offset");
  return v4 == objc_msgSend(self->_end.m_ptr, "offset");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WKRelativeTextRange(start=%@, end=%@)"), self->_start.m_ptr, self->_end.m_ptr);
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;

  m_ptr = self->_end.m_ptr;
  self->_end.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_start.m_ptr;
  self->_start.m_ptr = 0;
  if (v4)
    CFRelease(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
