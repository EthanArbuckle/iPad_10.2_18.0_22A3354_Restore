@implementation WKDOMNode

- (id)_initWithImpl:(void *)a3
{
  WKDOMNode *v4;
  WKDOMNode *v5;
  Node *m_ptr;
  uint64_t v7;
  int v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unsigned int v12;
  void **v13;
  void *v14;
  void **v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)WKDOMNode;
  v4 = -[WKDOMNode init](&v22, sel_init);
  v5 = v4;
  if (!v4)
    return v5;
  if (a3)
    *((_DWORD *)a3 + 6) += 2;
  m_ptr = v4->_impl.m_ptr;
  v5->_impl.m_ptr = (Node *)a3;
  if (m_ptr)
  {
    if (*((_DWORD *)m_ptr + 6) == 2)
    {
      if ((*((_WORD *)m_ptr + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)m_ptr);
    }
    else
    {
      *((_DWORD *)m_ptr + 6) -= 2;
    }
  }
  if ((_MergedGlobals_87 & 1) != 0)
  {
    v7 = qword_1ECE72CF0;
    if (qword_1ECE72CF0)
      goto LABEL_10;
  }
  else
  {
    qword_1ECE72CF0 = 0;
    _MergedGlobals_87 = 1;
  }
  WTF::HashTable<WebCore::Node *,WTF::KeyValuePair<WebCore::Node *,WKDOMNode *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WebCore::Node *,WKDOMNode *>>,WTF::DefaultHash<WebCore::Node *>,WTF::HashMap<WebCore::Node *,WKDOMNode *,WTF::DefaultHash<WebCore::Node *>,WTF::HashTraits<WebCore::Node *>,WTF::HashTraits<WKDOMNode *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WebCore::Node *>>::expand();
  v7 = qword_1ECE72CF0;
  if (!qword_1ECE72CF0)
  {
    v8 = 0;
    goto LABEL_11;
  }
LABEL_10:
  v8 = *(_DWORD *)(v7 - 8);
LABEL_11:
  v9 = ((unint64_t)a3 + ~((_QWORD)a3 << 32)) ^ (((unint64_t)a3 + ~((_QWORD)a3 << 32)) >> 22);
  v10 = 9 * ((v9 + ~(v9 << 13)) ^ ((v9 + ~(v9 << 13)) >> 8));
  v11 = (v10 ^ (v10 >> 15)) + ~((v10 ^ (v10 >> 15)) << 27);
  v12 = v8 & ((v11 >> 31) ^ v11);
  v13 = (void **)(v7 + 16 * v12);
  v14 = *v13;
  if (!*v13)
  {
LABEL_19:
    *v13 = a3;
    v13[1] = v5;
    if (qword_1ECE72CF0)
      v17 = *(_DWORD *)(qword_1ECE72CF0 - 12) + 1;
    else
      v17 = 1;
    *(_DWORD *)(qword_1ECE72CF0 - 12) = v17;
    if (qword_1ECE72CF0)
      v18 = *(_DWORD *)(qword_1ECE72CF0 - 12);
    else
      v18 = 0;
    v19 = (*(_DWORD *)(qword_1ECE72CF0 - 16) + v18);
    v20 = *(unsigned int *)(qword_1ECE72CF0 - 4);
    if (v20 > 0x400)
    {
      if (v20 > 2 * v19)
        return v5;
    }
    else if (3 * v20 > 4 * v19)
    {
      return v5;
    }
    WTF::HashTable<WebCore::Node *,WTF::KeyValuePair<WebCore::Node *,WKDOMNode *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WebCore::Node *,WKDOMNode *>>,WTF::DefaultHash<WebCore::Node *>,WTF::HashMap<WebCore::Node *,WKDOMNode *,WTF::DefaultHash<WebCore::Node *>,WTF::HashTraits<WebCore::Node *>,WTF::HashTraits<WKDOMNode *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WebCore::Node *>>::expand();
    return v5;
  }
  v15 = 0;
  v16 = 1;
  while (v14 != a3)
  {
    if (v14 == (void *)-1)
      v15 = v13;
    v12 = (v12 + v16) & v8;
    v13 = (void **)(v7 + 16 * v12);
    v14 = *v13;
    ++v16;
    if (!*v13)
    {
      if (v15)
      {
        *v15 = 0;
        v15[1] = 0;
        --*(_DWORD *)(v7 - 16);
        v13 = v15;
      }
      goto LABEL_19;
    }
  }
  return v5;
}

- (void)dealloc
{
  Node *m_ptr;
  _QWORD *v4;
  _QWORD *v5;
  objc_super v6;
  _QWORD *v7;

  m_ptr = self->_impl.m_ptr;
  self->_impl.m_ptr = 0;
  v4 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v4 = &off_1E34D16A8;
  v4[1] = m_ptr;
  v7 = v4;
  WTF::ensureOnMainRunLoop();
  v5 = v7;
  v7 = 0;
  if (v5)
    (*(void (**)(_QWORD *))(*v5 + 8))(v5);
  v6.receiver = self;
  v6.super_class = (Class)WKDOMNode;
  -[WKDOMNode dealloc](&v6, sel_dealloc);
}

- (void)insertNode:(id)a3 before:(id)a4
{
  WebCore::Node *v4;
  WTF::StringImpl *v5;
  WebCore::Node *v6;
  WTF::StringImpl *v7;
  char v8;

  if (a3)
  {
    if (a4)
    {
      v4 = (WebCore::Node *)*((_QWORD *)a4 + 1);
      if (v4)
        *((_DWORD *)v4 + 6) += 2;
    }
    else
    {
      v4 = 0;
    }
    v6 = v4;
    WebCore::Node::insertBefore();
    if (v8 && v7)
    {
      if (*(_DWORD *)v7 == 2)
        WTF::StringImpl::destroy(v7, v5);
      else
        *(_DWORD *)v7 -= 2;
    }
    if (v6)
    {
      if (*((_DWORD *)v6 + 6) == 2)
      {
        if ((*((_WORD *)v6 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v6);
      }
      else
      {
        *((_DWORD *)v6 + 6) -= 2;
      }
    }
  }
}

- (void)appendChild:(id)a3
{
  WTF::StringImpl *v3;
  WTF::StringImpl *v4;
  char v5;

  if (a3)
  {
    WebCore::Node::appendChild((WebCore::Node *)self->_impl.m_ptr, *((Node **)a3 + 1));
    if (v5)
    {
      if (v4)
      {
        if (*(_DWORD *)v4 == 2)
          WTF::StringImpl::destroy(v4, v3);
        else
          *(_DWORD *)v4 -= 2;
      }
    }
  }
}

- (void)removeChild:(id)a3
{
  WTF::StringImpl *v3;
  WTF::StringImpl *v4;
  char v5;

  if (a3)
  {
    WebCore::Node::removeChild((WebCore::Node *)self->_impl.m_ptr, *((WebCore::Node **)a3 + 1));
    if (v5)
    {
      if (v4)
      {
        if (*(_DWORD *)v4 == 2)
          WTF::StringImpl::destroy(v4, v3);
        else
          *(_DWORD *)v4 -= 2;
      }
    }
  }
}

- (WKDOMDocument)document
{
  return (WKDOMDocument *)WebKit::toWKDOMNode(*(WebKit **)(*((_QWORD *)self->_impl.m_ptr + 5) + 8), (WebCore::Node *)a2);
}

- (WKDOMNode)parentNode
{
  return (WKDOMNode *)WebKit::toWKDOMNode(*((WebKit **)self->_impl.m_ptr + 4), (WebCore::Node *)a2);
}

- (WKDOMNode)firstChild
{
  Node *m_ptr;
  BOOL v3;
  WebKit *v4;

  m_ptr = self->_impl.m_ptr;
  if (m_ptr)
    v3 = (*((_WORD *)m_ptr + 14) & 4) == 0;
  else
    v3 = 1;
  if (v3)
    v4 = 0;
  else
    v4 = (WebKit *)*((_QWORD *)m_ptr + 10);
  return (WKDOMNode *)WebKit::toWKDOMNode(v4, (WebCore::Node *)a2);
}

- (WKDOMNode)lastChild
{
  Node *m_ptr;
  BOOL v3;
  WebKit *v4;

  m_ptr = self->_impl.m_ptr;
  if (m_ptr)
    v3 = (*((_WORD *)m_ptr + 14) & 4) == 0;
  else
    v3 = 1;
  if (v3)
    v4 = 0;
  else
    v4 = (WebKit *)*((_QWORD *)m_ptr + 11);
  return (WKDOMNode *)WebKit::toWKDOMNode(v4, (WebCore::Node *)a2);
}

- (WKDOMNode)previousSibling
{
  return (WKDOMNode *)WebKit::toWKDOMNode((WebKit *)(*((_QWORD *)self->_impl.m_ptr + 6) & 0xFFFFFFFFFFFFLL), (WebCore::Node *)a2);
}

- (WKDOMNode)nextSibling
{
  return (WKDOMNode *)WebKit::toWKDOMNode(*((WebKit **)self->_impl.m_ptr + 7), (WebCore::Node *)a2);
}

- (NSArray)textRects
{
  Node *v3;
  Node *m_ptr;
  void *v5;
  NSArray *v6;
  WTF *v7;
  uint64_t v9;
  uint64_t v10;
  WTF *v11;
  int v12;
  CFTypeRef v13;

  WebCore::Document::updateLayout();
  m_ptr = self->_impl.m_ptr;
  if ((*((_QWORD *)m_ptr + 8) & 0xFFFFFFFFFFFFLL) == 0)
    return 0;
  WebCore::makeRangeSelectingNodeContents((WebCore *)m_ptr, v3);
  WebCore::RenderObject::absoluteTextRects();
  WTF::createNSArray<WTF::Vector<WebCore::IntRect,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>((uint64_t *)&v13, (uint64_t)&v11);
  v6 = (id)CFMakeCollectable(v13);
  v7 = v11;
  if (v11)
  {
    v11 = 0;
    v12 = 0;
    WTF::fastFree(v7, v5);
  }
  WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(&v10);
  WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(&v9);
  return v6;
}

- (void).cxx_destruct
{
  Node *m_ptr;

  m_ptr = self->_impl.m_ptr;
  self->_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (*((_DWORD *)m_ptr + 6) == 2)
    {
      if ((*((_WORD *)m_ptr + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)m_ptr);
    }
    else
    {
      *((_DWORD *)m_ptr + 6) -= 2;
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (OpaqueWKBundleNodeHandle)_copyBundleNodeHandleRef
{
  OpaqueWKBundleNodeHandle *result;
  WebKit::InjectedBundleNodeHandle *v3;

  result = (OpaqueWKBundleNodeHandle *)self->_impl.m_ptr;
  if (result)
  {
    WebKit::InjectedBundleNodeHandle::getOrCreate((WebKit::InjectedBundleNodeHandle *)result, &v3);
    if (v3)
      return (OpaqueWKBundleNodeHandle *)*((_QWORD *)v3 + 1);
    else
      return 0;
  }
  return result;
}

- (_QWORD)dealloc
{
  uint64_t v2;

  v2 = a1[1];
  *a1 = &off_1E34D16A8;
  a1[1] = 0;
  if (v2)
  {
    if (*(_DWORD *)(v2 + 24) == 2)
    {
      if ((*(_WORD *)(v2 + 30) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)v2);
    }
    else
    {
      *(_DWORD *)(v2 + 24) -= 2;
    }
  }
  return a1;
}

- (uint64_t)dealloc
{
  uint64_t v3;

  v3 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E34D16A8;
  *((_QWORD *)this + 1) = 0;
  if (v3)
  {
    if (*(_DWORD *)(v3 + 24) == 2)
    {
      if ((*(_WORD *)(v3 + 30) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)v3);
    }
    else
    {
      *(_DWORD *)(v3 + 24) -= 2;
    }
  }
  return WTF::fastFree(this, a2);
}

- (_DWORD)dealloc
{
  uint64_t v1;
  unsigned int v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  unsigned int v11;

  if ((_MergedGlobals_87 & 1) != 0)
  {
    if (qword_1ECE72CF0)
    {
      v1 = *((_QWORD *)result + 1);
      v2 = *(_DWORD *)(qword_1ECE72CF0 - 8);
      v3 = (~(v1 << 32) + v1) ^ ((unint64_t)(~(v1 << 32) + v1) >> 22);
      v4 = 9 * ((v3 + ~(v3 << 13)) ^ ((v3 + ~(v3 << 13)) >> 8));
      v5 = (v4 ^ (v4 >> 15)) + ~((v4 ^ (v4 >> 15)) << 27);
      v6 = v2 & ((v5 >> 31) ^ v5);
      v7 = *(_QWORD *)(qword_1ECE72CF0 + 16 * v6);
      if (v7 != v1)
      {
        v8 = 1;
        while (v7)
        {
          v6 = ((_DWORD)v6 + v8) & v2;
          v7 = *(_QWORD *)(qword_1ECE72CF0 + 16 * v6);
          ++v8;
          if (v7 == v1)
            goto LABEL_9;
        }
        v6 = *(unsigned int *)(qword_1ECE72CF0 - 4);
      }
LABEL_9:
      if (v6 != *(_DWORD *)(qword_1ECE72CF0 - 4))
      {
        *(_QWORD *)(qword_1ECE72CF0 + 16 * v6) = -1;
        v9 = qword_1ECE72CF0;
        ++*(_DWORD *)(qword_1ECE72CF0 - 16);
        v10 = v9 ? *(_DWORD *)(v9 - 12) - 1 : -1;
        *(_DWORD *)(v9 - 12) = v10;
        if (qword_1ECE72CF0)
        {
          v11 = *(_DWORD *)(qword_1ECE72CF0 - 4);
          if (6 * *(_DWORD *)(qword_1ECE72CF0 - 12) < v11 && v11 >= 9)
            return WTF::HashTable<WebCore::Node *,WTF::KeyValuePair<WebCore::Node *,WKDOMNode *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WebCore::Node *,WKDOMNode *>>,WTF::DefaultHash<WebCore::Node *>,WTF::HashMap<WebCore::Node *,WKDOMNode *,WTF::DefaultHash<WebCore::Node *>,WTF::HashTraits<WebCore::Node *>,WTF::HashTraits<WKDOMNode *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WebCore::Node *>>::rehash(v11 >> 1);
        }
      }
    }
  }
  else
  {
    qword_1ECE72CF0 = 0;
    _MergedGlobals_87 = 1;
  }
  return result;
}

@end
