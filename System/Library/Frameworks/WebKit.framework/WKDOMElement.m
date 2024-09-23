@implementation WKDOMElement

- (BOOL)hasAttribute:(id)a3
{
  Node *m_ptr;
  WTF::StringImpl *v4;
  char hasAttribute;
  StringImpl *v6;
  BOOL result;
  AtomString v8;

  m_ptr = self->super._impl.m_ptr;
  if ((*((_WORD *)m_ptr + 14) & 8) != 0)
  {
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, (const __CFString *)a2);
    hasAttribute = WebCore::Element::hasAttribute((WebCore::Element *)m_ptr, &v8);
    v6 = v8.var0.m_impl.m_ptr;
    v8.var0.m_impl.m_ptr = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2)
        WTF::StringImpl::destroy((WTF::StringImpl *)v6, v4);
      else
        *(_DWORD *)v6 -= 2;
    }
    return hasAttribute;
  }
  else
  {
    result = 96;
    __break(0xC471u);
  }
  return result;
}

- (id)getAttribute:(id)a3
{
  Node *m_ptr;
  WTF::StringImpl *v4;
  const __CFString *v5;
  StringImpl *v6;
  AtomString v8;

  m_ptr = self->super._impl.m_ptr;
  if ((*((_WORD *)m_ptr + 14) & 8) == 0)
  {
    __break(0xC471u);
    JUMPOUT(0x1972ED5A0);
  }
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, (const __CFString *)a2);
  if (*(_QWORD *)WebCore::Element::getAttribute((WebCore::Element *)m_ptr, &v8))
    v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v5 = &stru_1E351F1B8;
  v6 = v8.var0.m_impl.m_ptr;
  v8.var0.m_impl.m_ptr = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy((WTF::StringImpl *)v6, v4);
    else
      *(_DWORD *)v6 -= 2;
  }
  return (id)v5;
}

- (void)setAttribute:(id)a3 value:(id)a4
{
  Node *m_ptr;
  const __CFString *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  StringImpl *v10;
  WTF::StringImpl *v11;
  AtomString v12;
  WTF::StringImpl *v13;
  char v14;
  WTF::StringImpl *v15;

  m_ptr = self->super._impl.m_ptr;
  if ((*((_WORD *)m_ptr + 14) & 8) != 0)
  {
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, (const __CFString *)a2);
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a4, v6);
    v11 = v15;
    WebCore::Element::setAttribute((WebCore::Element *)m_ptr, &v12, (const AtomString *)&v11);
    if (v14)
    {
      v8 = v13;
      v13 = 0;
      if (v8)
      {
        if (*(_DWORD *)v8 == 2)
          WTF::StringImpl::destroy(v8, v7);
        else
          *(_DWORD *)v8 -= 2;
      }
    }
    v9 = v11;
    v11 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2)
        WTF::StringImpl::destroy(v9, v7);
      else
        *(_DWORD *)v9 -= 2;
    }
    v10 = v12.var0.m_impl.m_ptr;
    v12.var0.m_impl.m_ptr = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2)
        WTF::StringImpl::destroy((WTF::StringImpl *)v10, v7);
      else
        *(_DWORD *)v10 -= 2;
    }
  }
  else
  {
    __break(0xC471u);
  }
}

- (NSString)tagName
{
  Node *m_ptr;
  WTF::StringImpl *v3;
  NSString *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;

  m_ptr = self->super._impl.m_ptr;
  if ((*((_WORD *)m_ptr + 14) & 8) == 0)
  {
    __break(0xC471u);
    JUMPOUT(0x1972ED7C4);
  }
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)m_ptr + 104))(&v7);
  if (!v7)
    return (NSString *)&stru_1E351F1B8;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v3);
    else
      *(_DWORD *)v5 -= 2;
  }
  return v4;
}

@end
