@implementation WKDOMDocument

- (id)createElement:(id)a3
{
  Node *m_ptr;
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  int v6;
  CFTypeRef v7;
  WebKit *v8;
  id result;
  WTF::StringImpl *v10;
  WebKit *v11;
  int v12;

  m_ptr = self->super._impl.m_ptr;
  if ((*((_WORD *)m_ptr + 14) & 0xF000) == 0x9000)
  {
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, (const __CFString *)a2);
    WebCore::Document::createElementForBindings((WebCore::Document *)m_ptr, (const AtomString *)&v10);
    v5 = v10;
    v10 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2)
        WTF::StringImpl::destroy(v5, v4);
      else
        *(_DWORD *)v5 -= 2;
    }
    v6 = v12;
    if (v12)
    {
      v7 = 0;
    }
    else
    {
      v8 = v11;
      v10 = v11;
      v11 = 0;
      v7 = WebKit::toWKDOMNode(v8, v4);
      WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref((uint64_t *)&v10);
      v6 = v12;
    }
    if (v6 != -1)
      ((void (*)(WTF::StringImpl **, WebKit **))off_1E34D1140[v6])(&v10, &v11);
    return (id)v7;
  }
  else
  {
    result = (id)96;
    __break(0xC471u);
  }
  return result;
}

- (id)createTextNode:(id)a3
{
  WebCore::Node *v3;
  CFTypeRef v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  id result;
  WTF::StringImpl *v8;
  WebKit *v9;

  if ((*((_WORD *)self->super._impl.m_ptr + 14) & 0xF000) == 0x9000)
  {
    MEMORY[0x19AEABCC8](&v8, a3);
    WebCore::Document::createTextNode();
    v4 = WebKit::toWKDOMNode(v9, v3);
    WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref((uint64_t *)&v9);
    v6 = v8;
    v8 = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2)
        WTF::StringImpl::destroy(v6, v5);
      else
        *(_DWORD *)v6 -= 2;
    }
    return (id)v4;
  }
  else
  {
    result = (id)96;
    __break(0xC471u);
  }
  return result;
}

- (WKDOMElement)body
{
  Node *m_ptr;
  WebKit *v3;
  WebCore::Node *v4;
  WKDOMElement *result;

  m_ptr = self->super._impl.m_ptr;
  if ((*((_WORD *)m_ptr + 14) & 0xF000) == 0x9000)
  {
    v3 = (WebKit *)WebCore::Document::bodyOrFrameset((WebCore::Document *)m_ptr);
    return (WKDOMElement *)WebKit::toWKDOMNode(v3, v4);
  }
  else
  {
    result = (WKDOMElement *)96;
    __break(0xC471u);
  }
  return result;
}

- (id)createDocumentFragmentWithMarkupString:(id)a3 baseURL:(id)a4
{
  WebCore::Node *v5;
  CFTypeRef v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  id result;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  WebKit *v13;

  if ((*((_WORD *)self->super._impl.m_ptr + 14) & 0xF000) == 0x9000)
  {
    MEMORY[0x19AEABCC8](&v12, a3);
    MEMORY[0x19AEABCC8](&v11, objc_msgSend(a4, "absoluteString"));
    WebCore::createFragmentFromMarkup();
    v6 = WebKit::toWKDOMNode(v13, v5);
    WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref((uint64_t *)&v13);
    v8 = v11;
    v11 = 0;
    if (v8)
    {
      if (*(_DWORD *)v8 == 2)
        WTF::StringImpl::destroy(v8, v7);
      else
        *(_DWORD *)v8 -= 2;
    }
    v9 = v12;
    v12 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2)
        WTF::StringImpl::destroy(v9, v7);
      else
        *(_DWORD *)v9 -= 2;
    }
    return (id)v6;
  }
  else
  {
    result = (id)96;
    __break(0xC471u);
  }
  return result;
}

- (id)createDocumentFragmentWithText:(id)a3
{
  Node *m_ptr;
  WebCore::Node *v5;
  CFTypeRef v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  id result;
  WTF::StringImpl *v10;
  uint64_t v11;
  uint64_t v12;
  WebKit *v13;

  m_ptr = self->super._impl.m_ptr;
  if ((*((_WORD *)m_ptr + 14) & 0xF000) == 0x9000)
  {
    WebCore::makeRangeSelectingNodeContents((WebCore *)m_ptr, (Node *)a2);
    MEMORY[0x19AEABCC8](&v10, a3);
    WebCore::createFragmentFromText();
    v6 = WebKit::toWKDOMNode(v13, v5);
    WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref((uint64_t *)&v13);
    v8 = v10;
    v10 = 0;
    if (v8)
    {
      if (*(_DWORD *)v8 == 2)
        WTF::StringImpl::destroy(v8, v7);
      else
        *(_DWORD *)v8 -= 2;
    }
    WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(&v12);
    WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(&v11);
    return (id)v6;
  }
  else
  {
    result = (id)96;
    __break(0xC471u);
  }
  return result;
}

- (id)parserYieldToken
{
  WKDOMDocumentParserYieldToken *v3;
  id result;

  v3 = [WKDOMDocumentParserYieldToken alloc];
  if ((*((_WORD *)self->super._impl.m_ptr + 14) & 0xF000) == 0x9000)
    return (id)(id)CFMakeCollectable(-[WKDOMDocumentParserYieldToken initWithDocument:](v3, "initWithDocument:"));
  result = (id)96;
  __break(0xC471u);
  return result;
}

@end
