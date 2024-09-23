@implementation WKDOMTextIterator

- (WKDOMTextIterator)initWithRange:(id)a3
{
  WKDOMTextIterator *v4;
  const Range *v5;
  WKDOMTextIterator *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WKDOMTextIterator;
  v4 = -[WKDOMTextIterator init](&v11, sel_init);
  v6 = v4;
  if (a3 && v4)
  {
    WebCore::makeSimpleRange(*((WebCore **)a3 + 1), v5);
    v7 = WTF::fastMalloc((WTF *)0x100);
    WebCore::TextIterator::TextIterator();
    std::unique_ptr<WebCore::TextIterator>::reset[abi:sn180100]((uint64_t *)&v6->_textIterator, v7);
    WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(&v10);
    WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(&v9);
  }
  return v6;
}

- (void)advance
{
  TextIterator *value;

  value = self->_textIterator.__ptr_.__value_;
  if (value)
    WebCore::TextIterator::advance((WebCore::TextIterator *)value);
  self->_upconvertedText.m_size = 0;
}

- (BOOL)atEnd
{
  TextIterator *value;

  value = self->_textIterator.__ptr_.__value_;
  return value && *((_QWORD *)value + 12) == 0;
}

- (WKDOMRange)currentRange
{
  TextIterator *value;
  WebCore::Range *v3;
  WKDOMRange *v4;
  WebKit *v5;
  uint64_t v7;
  uint64_t v8;
  WebKit *v9;

  value = self->_textIterator.__ptr_.__value_;
  if (!value)
    return 0;
  WebCore::TextIterator::range((WebCore::TextIterator *)value);
  WebCore::createLiveRange();
  v4 = (WKDOMRange *)WebKit::toWKDOMRange(v9, v3);
  v5 = v9;
  v9 = 0;
  if (v5)
  {
    if (*((_DWORD *)v5 + 2) == 1)
      (*(void (**)(WebKit *))(*(_QWORD *)v5 + 8))(v5);
    else
      --*((_DWORD *)v5 + 2);
  }
  WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(&v8);
  WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(&v7);
  return v4;
}

- (const)currentTextPointer
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 *v5;
  const unsigned __int16 *v6;
  unsigned __int16 *v7;
  void *v8;
  int v9;
  unsigned __int16 v10;

  v2 = *((_QWORD *)self + 1);
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2 + 152);
  v4 = v3;
  if (!(_DWORD)v3)
    return 0;
  v5 = *(unsigned __int8 **)(v2 + 144);
  if ((v3 & 0xFF00000000) == 0)
    return *(const unsigned __int16 **)(v2 + 144);
  v6 = self;
  if (*((_DWORD *)self + 7))
    return (const unsigned __int16 *)*((_QWORD *)self + 2);
  v7 = (unsigned __int16 *)*((_QWORD *)self + 2);
  if (v3 <= (unint64_t)*((unsigned int *)self + 6))
  {
    self = (const unsigned __int16 *)*((_QWORD *)self + 2);
  }
  else
  {
    if ((unint64_t)v3 >> 31)
    {
      __break(0xC471u);
      return self;
    }
    self = (const unsigned __int16 *)WTF::fastMalloc((WTF *)(2 * v3));
    *((_DWORD *)v6 + 6) = v4;
    *((_QWORD *)v6 + 2) = self;
    if (v7)
    {
      if (self == v7)
      {
        *((_QWORD *)v6 + 2) = 0;
        *((_DWORD *)v6 + 6) = 0;
      }
      WTF::fastFree((WTF *)v7, v8);
      self = (const unsigned __int16 *)*((_QWORD *)v6 + 2);
    }
  }
  v9 = *((_DWORD *)v6 + 7);
  do
  {
    v10 = *v5++;
    self[v9++] = v10;
    *((_DWORD *)v6 + 7) = v9;
    --v4;
  }
  while (v4);
  return self;
}

- (unint64_t)currentTextLength
{
  TextIterator *value;

  value = self->_textIterator.__ptr_.__value_;
  if (value)
    return *((unsigned int *)value + 38);
  else
    return 0;
}

- (void).cxx_destruct
{
  unsigned __int16 *m_buffer;

  m_buffer = self->_upconvertedText.m_buffer;
  if (m_buffer)
  {
    self->_upconvertedText.m_buffer = 0;
    self->_upconvertedText.m_capacity = 0;
    WTF::fastFree((WTF *)m_buffer, (void *)a2);
  }
  std::unique_ptr<WebCore::TextIterator>::reset[abi:sn180100]((uint64_t *)&self->_textIterator, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
