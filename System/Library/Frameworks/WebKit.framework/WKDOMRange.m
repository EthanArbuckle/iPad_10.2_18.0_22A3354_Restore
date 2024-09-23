@implementation WKDOMRange

- (id)_initWithImpl:(void *)a3
{
  WKDOMRange *v4;
  WKDOMRange *v5;
  Range *m_ptr;
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
  v22.super_class = (Class)WKDOMRange;
  v4 = -[WKDOMRange init](&v22, sel_init);
  v5 = v4;
  if (!v4)
    return v5;
  if (a3)
    ++*((_DWORD *)a3 + 2);
  m_ptr = v4->_impl.m_ptr;
  v5->_impl.m_ptr = (Range *)a3;
  if (m_ptr)
  {
    if (*((_DWORD *)m_ptr + 2) == 1)
      (*(void (**)(Range *))(*(_QWORD *)m_ptr + 8))(m_ptr);
    else
      --*((_DWORD *)m_ptr + 2);
  }
  if ((byte_1ECE72CE9 & 1) != 0)
  {
    v7 = qword_1ECE72CF8;
    if (qword_1ECE72CF8)
      goto LABEL_11;
  }
  else
  {
    qword_1ECE72CF8 = 0;
    byte_1ECE72CE9 = 1;
  }
  WTF::HashTable<WebCore::Range *,WTF::KeyValuePair<WebCore::Range *,WKDOMRange *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WebCore::Range *,WKDOMRange *>>,WTF::DefaultHash<WebCore::Range *>,WTF::HashMap<WebCore::Range *,WKDOMRange *,WTF::DefaultHash<WebCore::Range *>,WTF::HashTraits<WebCore::Range *>,WTF::HashTraits<WKDOMRange *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WebCore::Range *>>::expand();
  v7 = qword_1ECE72CF8;
  if (!qword_1ECE72CF8)
  {
    v8 = 0;
    goto LABEL_12;
  }
LABEL_11:
  v8 = *(_DWORD *)(v7 - 8);
LABEL_12:
  v9 = ((unint64_t)a3 + ~((_QWORD)a3 << 32)) ^ (((unint64_t)a3 + ~((_QWORD)a3 << 32)) >> 22);
  v10 = 9 * ((v9 + ~(v9 << 13)) ^ ((v9 + ~(v9 << 13)) >> 8));
  v11 = (v10 ^ (v10 >> 15)) + ~((v10 ^ (v10 >> 15)) << 27);
  v12 = v8 & ((v11 >> 31) ^ v11);
  v13 = (void **)(v7 + 16 * v12);
  v14 = *v13;
  if (!*v13)
  {
LABEL_20:
    *v13 = a3;
    v13[1] = v5;
    if (qword_1ECE72CF8)
      v17 = *(_DWORD *)(qword_1ECE72CF8 - 12) + 1;
    else
      v17 = 1;
    *(_DWORD *)(qword_1ECE72CF8 - 12) = v17;
    if (qword_1ECE72CF8)
      v18 = *(_DWORD *)(qword_1ECE72CF8 - 12);
    else
      v18 = 0;
    v19 = (*(_DWORD *)(qword_1ECE72CF8 - 16) + v18);
    v20 = *(unsigned int *)(qword_1ECE72CF8 - 4);
    if (v20 > 0x400)
    {
      if (v20 > 2 * v19)
        return v5;
    }
    else if (3 * v20 > 4 * v19)
    {
      return v5;
    }
    WTF::HashTable<WebCore::Range *,WTF::KeyValuePair<WebCore::Range *,WKDOMRange *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WebCore::Range *,WKDOMRange *>>,WTF::DefaultHash<WebCore::Range *>,WTF::HashMap<WebCore::Range *,WKDOMRange *,WTF::DefaultHash<WebCore::Range *>,WTF::HashTraits<WebCore::Range *>,WTF::HashTraits<WKDOMRange *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WebCore::Range *>>::expand();
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
      goto LABEL_20;
    }
  }
  return v5;
}

- (WKDOMRange)initWithDocument:(id)a3
{
  WKDOMRange *v4;
  _DWORD *v6;

  WebCore::Range::create(*((WebCore::Range **)a3 + 1), (Document *)a2);
  v4 = -[WKDOMRange _initWithImpl:](self, "_initWithImpl:", v6);
  if (v6)
  {
    if (v6[2] == 1)
      (*(void (**)())(*(_QWORD *)v6 + 8))();
    else
      --v6[2];
  }
  return v4;
}

- (void)dealloc
{
  Range *m_ptr;
  _QWORD *v4;
  _QWORD *v5;
  objc_super v6;
  _QWORD *v7;

  m_ptr = self->_impl.m_ptr;
  self->_impl.m_ptr = 0;
  v4 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v4 = &off_1E34D16D0;
  v4[1] = m_ptr;
  v7 = v4;
  WTF::ensureOnMainRunLoop();
  v5 = v7;
  v7 = 0;
  if (v5)
    (*(void (**)(_QWORD *))(*v5 + 8))(v5);
  v6.receiver = self;
  v6.super_class = (Class)WKDOMRange;
  -[WKDOMRange dealloc](&v6, sel_dealloc);
}

- (void)setStart:(id)a3 offset:(int)a4
{
  uint64_t v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  uint64_t v7;
  WTF::StringImpl *v8;
  char v9;

  if (a3)
  {
    v4 = *((_QWORD *)a3 + 1);
    *(_DWORD *)(v4 + 24) += 2;
    v7 = v4;
    WebCore::Range::setStart();
    if (v9)
    {
      v6 = v8;
      v8 = 0;
      if (v6)
      {
        if (*(_DWORD *)v6 == 2)
          WTF::StringImpl::destroy(v6, v5);
        else
          *(_DWORD *)v6 -= 2;
      }
    }
    WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(&v7);
  }
}

- (void)setEnd:(id)a3 offset:(int)a4
{
  uint64_t v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  uint64_t v7;
  WTF::StringImpl *v8;
  char v9;

  if (a3)
  {
    v4 = *((_QWORD *)a3 + 1);
    *(_DWORD *)(v4 + 24) += 2;
    v7 = v4;
    WebCore::Range::setEnd();
    if (v9)
    {
      v6 = v8;
      v8 = 0;
      if (v6)
      {
        if (*(_DWORD *)v6 == 2)
          WTF::StringImpl::destroy(v6, v5);
        else
          *(_DWORD *)v6 -= 2;
      }
    }
    WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(&v7);
  }
}

- (void)collapse:(BOOL)a3
{
  WebCore::Range::collapse((WebCore::Range *)self->_impl.m_ptr);
}

- (void)selectNode:(id)a3
{
  WTF::StringImpl *v3;
  WTF::StringImpl *v4;
  char v5;

  if (a3)
  {
    WebCore::Range::selectNode((WebCore::Range *)self->_impl.m_ptr, *((WebCore::Node **)a3 + 1));
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

- (void)selectNodeContents:(id)a3
{
  WTF::StringImpl *v3;
  WTF::StringImpl *v4;
  char v5;

  if (a3)
  {
    WebCore::Range::selectNodeContents((WebCore::Range *)self->_impl.m_ptr, *((WebCore::Node **)a3 + 1));
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

- (WKDOMNode)startContainer
{
  return (WKDOMNode *)WebKit::toWKDOMNode(*((WebKit **)self->_impl.m_ptr + 4), (WebCore::Node *)a2);
}

- (int64_t)startOffset
{
  return *((unsigned int *)self->_impl.m_ptr + 10);
}

- (WKDOMNode)endContainer
{
  return (WKDOMNode *)WebKit::toWKDOMNode(*((WebKit **)self->_impl.m_ptr + 7), (WebCore::Node *)a2);
}

- (int64_t)endOffset
{
  return *((unsigned int *)self->_impl.m_ptr + 16);
}

- (NSString)text
{
  WTF::StringImpl *v2;
  const __CFString *v3;
  WTF::StringImpl *v5;
  uint64_t v6;
  uint64_t v7;

  WebCore::makeSimpleRange((WebCore *)self->_impl.m_ptr, (const Range *)a2);
  WebCore::Document::updateLayout();
  WebCore::plainText();
  if (v5)
  {
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v2);
    else
      *(_DWORD *)v5 -= 2;
  }
  else
  {
    v3 = &stru_1E351F1B8;
  }
  WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(&v7);
  WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(&v6);
  return &v3->isa;
}

- (BOOL)isCollapsed
{
  Range *m_ptr;
  int v3;
  int v4;
  BOOL v5;

  m_ptr = self->_impl.m_ptr;
  v5 = *((_QWORD *)m_ptr + 4) == *((_QWORD *)m_ptr + 7);
  v3 = *((_DWORD *)m_ptr + 10);
  v4 = *((_DWORD *)m_ptr + 16);
  return v5 && v3 == v4;
}

- (NSArray)textRects
{
  void *v2;
  NSArray *v3;
  WTF *v4;
  WTF *v6;
  int v7;
  CFTypeRef cf;
  uint64_t v9;
  uint64_t v10;

  WebCore::makeSimpleRange((WebCore *)self->_impl.m_ptr, (const Range *)a2);
  WebCore::Document::updateLayout();
  WebCore::RenderObject::absoluteTextRects();
  WTF::createNSArray<WTF::Vector<WebCore::IntRect,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>((uint64_t *)&cf, (uint64_t)&v6);
  v3 = (id)CFMakeCollectable(cf);
  v4 = v6;
  if (v6)
  {
    v6 = 0;
    v7 = 0;
    WTF::fastFree(v4, v2);
  }
  WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(&v10);
  WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(&v9);
  return v3;
}

- (id)rangeByExpandingToWordBoundaryByCharacters:(unint64_t)a3 inDirection:(int64_t)a4
{
  WKDOMRange *v4;
  CFTypeRef v5;
  WebCore::Node *v7;
  WebCore::Node *v8;
  _BYTE v9[40];
  uint64_t v10;
  uint64_t v11;

  WebCore::makeSimpleRange((WebCore *)self->_impl.m_ptr, (const Range *)a2);
  WebCore::makeDeprecatedLegacyPosition();
  WebCore::VisiblePosition::VisiblePosition();
  WebCore::rangeExpandedByCharactersInDirectionAtWordBoundary();
  if (v8)
  {
    if (*((_DWORD *)v8 + 6) == 2)
    {
      if ((*((_WORD *)v8 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v8);
    }
    else
    {
      *((_DWORD *)v8 + 6) -= 2;
    }
  }
  if (v7)
  {
    if (*((_DWORD *)v7 + 6) == 2)
    {
      if ((*((_WORD *)v7 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v7);
    }
    else
    {
      *((_DWORD *)v7 + 6) -= 2;
    }
  }
  v4 = [WKDOMRange alloc];
  WebCore::createLiveRange();
  v5 = (id)CFMakeCollectable(-[WKDOMRange _initWithImpl:](v4, "_initWithImpl:", 0, 0));
  std::__optional_destruct_base<WebCore::SimpleRange,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v9);
  WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(&v11);
  WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(&v10);
  return (id)v5;
}

- (void).cxx_destruct
{
  Range *m_ptr;

  m_ptr = self->_impl.m_ptr;
  self->_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (*((_DWORD *)m_ptr + 2) == 1)
      (*(void (**)(Range *))(*(_QWORD *)m_ptr + 8))(m_ptr);
    else
      --*((_DWORD *)m_ptr + 2);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (OpaqueWKBundleRangeHandle)_copyBundleRangeHandleRef
{
  uint64_t v3;

  WebKit::InjectedBundleRangeHandle::getOrCreate((WTF *)self->_impl.m_ptr, (WebCore::Range *)a2, &v3);
  if (v3)
    return *(OpaqueWKBundleRangeHandle **)(v3 + 8);
  else
    return 0;
}

- (_QWORD)dealloc
{
  _DWORD *v2;

  v2 = (_DWORD *)a1[1];
  *a1 = &off_1E34D16D0;
  a1[1] = 0;
  if (v2)
  {
    if (v2[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v2 + 8))(v2);
    else
      --v2[2];
  }
  return a1;
}

- (uint64_t)dealloc
{
  _DWORD *v3;

  v3 = (_DWORD *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E34D16D0;
  *((_QWORD *)this + 1) = 0;
  if (v3)
  {
    if (v3[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v3 + 8))(v3);
    else
      --v3[2];
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

  if ((byte_1ECE72CE9 & 1) != 0)
  {
    if (qword_1ECE72CF8)
    {
      v1 = *((_QWORD *)result + 1);
      v2 = *(_DWORD *)(qword_1ECE72CF8 - 8);
      v3 = (~(v1 << 32) + v1) ^ ((unint64_t)(~(v1 << 32) + v1) >> 22);
      v4 = 9 * ((v3 + ~(v3 << 13)) ^ ((v3 + ~(v3 << 13)) >> 8));
      v5 = (v4 ^ (v4 >> 15)) + ~((v4 ^ (v4 >> 15)) << 27);
      v6 = v2 & ((v5 >> 31) ^ v5);
      v7 = *(_QWORD *)(qword_1ECE72CF8 + 16 * v6);
      if (v7 != v1)
      {
        v8 = 1;
        while (v7)
        {
          v6 = ((_DWORD)v6 + v8) & v2;
          v7 = *(_QWORD *)(qword_1ECE72CF8 + 16 * v6);
          ++v8;
          if (v7 == v1)
            goto LABEL_9;
        }
        v6 = *(unsigned int *)(qword_1ECE72CF8 - 4);
      }
LABEL_9:
      if (v6 != *(_DWORD *)(qword_1ECE72CF8 - 4))
      {
        *(_QWORD *)(qword_1ECE72CF8 + 16 * v6) = -1;
        v9 = qword_1ECE72CF8;
        ++*(_DWORD *)(qword_1ECE72CF8 - 16);
        v10 = v9 ? *(_DWORD *)(v9 - 12) - 1 : -1;
        *(_DWORD *)(v9 - 12) = v10;
        if (qword_1ECE72CF8)
        {
          v11 = *(_DWORD *)(qword_1ECE72CF8 - 4);
          if (6 * *(_DWORD *)(qword_1ECE72CF8 - 12) < v11 && v11 >= 9)
            return WTF::HashTable<WebCore::Range *,WTF::KeyValuePair<WebCore::Range *,WKDOMRange *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WebCore::Range *,WKDOMRange *>>,WTF::DefaultHash<WebCore::Range *>,WTF::HashMap<WebCore::Range *,WKDOMRange *,WTF::DefaultHash<WebCore::Range *>,WTF::HashTraits<WebCore::Range *>,WTF::HashTraits<WKDOMRange *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WebCore::Range *>>::rehash(v11 >> 1);
        }
      }
    }
  }
  else
  {
    qword_1ECE72CF8 = 0;
    byte_1ECE72CE9 = 1;
  }
  return result;
}

@end
