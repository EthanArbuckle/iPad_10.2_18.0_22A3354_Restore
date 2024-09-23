@implementation WKDataListSuggestionsControl

- (WKDataListSuggestionsControl)initWithInformation:(void *)a3 inView:(id)a4
{
  WKDataListSuggestionsControl *v6;
  WKDataListSuggestionsControl *v7;
  _DWORD *v8;
  uint64_t m_size;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WKDataListSuggestionsControl;
  v6 = -[WKDataListSuggestionsControl init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_view, a4);
    v8 = (char *)a3 + 8;
    m_size = v7->_suggestions.m_size;
    if ((_DWORD)m_size)
      WTF::VectorDestructor<true,WebCore::HTTPHeaderField>::destruct((WTF::StringImpl *)v7->_suggestions.m_buffer, (WTF::StringImpl *)((char *)v7->_suggestions.m_buffer + 16 * m_size));
    WTF::VectorBuffer<WTF::String,0ul,WTF::FastMalloc>::adopt((uint64_t)&v7->_suggestions, v8);
    objc_msgSend(objc_loadWeak((id *)&v7->_view), "_setDataListSuggestionsControl:", v7);
  }
  return v7;
}

- (void)updateWithInformation:(void *)a3
{
  WTF::StringImpl **p_suggestions;
  uint64_t m_size;

  p_suggestions = (WTF::StringImpl **)&self->_suggestions;
  m_size = self->_suggestions.m_size;
  if ((_DWORD)m_size)
    WTF::VectorDestructor<true,WebCore::HTTPHeaderField>::destruct(*p_suggestions, (WTF::StringImpl *)((char *)*p_suggestions + 16 * m_size));
  WTF::VectorBuffer<WTF::String,0ul,WTF::FastMalloc>::adopt((uint64_t)p_suggestions, (_DWORD *)a3 + 2);
}

- (void)showSuggestionsDropdown:(void *)a3 activationType:(unsigned __int8)a4
{
  uint64_t v5;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *m_ptr;
  unsigned int v12;
  unsigned int v13;

  v5 = *((_QWORD *)a3 + 2);
  if (v5)
    goto LABEL_15;
  v5 = WTF::fastCompactMalloc((WTF *)0x10);
  *(_DWORD *)v5 = 1;
  *(_QWORD *)(v5 + 8) = a3;
  v7 = (unsigned int *)*((_QWORD *)a3 + 2);
  *((_QWORD *)a3 + 2) = v5;
  if (!v7)
    goto LABEL_15;
  do
  {
    v8 = __ldaxr(v7);
    v9 = v8 - 1;
  }
  while (__stlxr(v9, v7));
  if (!v9)
  {
    atomic_store(1u, v7);
    WTF::fastFree((WTF *)v7, (void *)a2);
  }
  v5 = *((_QWORD *)a3 + 2);
  if (v5)
  {
LABEL_15:
    do
      v10 = __ldaxr((unsigned int *)v5);
    while (__stlxr(v10 + 1, (unsigned int *)v5));
  }
  m_ptr = (unsigned int *)self->_dropdown.m_impl.m_ptr;
  self->_dropdown.m_impl.m_ptr = (DefaultWeakPtrImpl *)v5;
  if (m_ptr)
  {
    do
    {
      v12 = __ldaxr(m_ptr);
      v13 = v12 - 1;
    }
    while (__stlxr(v13, m_ptr));
    if (!v13)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
}

- (void)didSelectOptionAtIndex:(int64_t)a3
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  m_ptr = self->_dropdown.m_impl.m_ptr;
  if (m_ptr)
    v4 = *((_QWORD *)m_ptr + 1);
  else
    v4 = 0;
  if (self->_suggestions.m_size <= (unint64_t)a3)
  {
    __break(0xC471u);
  }
  else
  {
    v5 = *(_QWORD *)(v4 + 24);
    if (v5)
    {
      v6 = *(_QWORD *)(v5 + 8);
      if (v6)
      {
        WebKit::WebPageProxy::didSelectOption(v6 - 16, (const WTF::String *)((char *)self->_suggestions.m_buffer + 16 * a3));
        WebKit::WebDataListSuggestionsDropdownIOS::close((id *)v4);
      }
    }
  }
}

- (id)textSuggestions
{
  void *v3;
  uint64_t m_size;
  DataListSuggestion *m_buffer;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  m_size = self->_suggestions.m_size;
  if ((_DWORD)m_size)
  {
    m_buffer = self->_suggestions.m_buffer;
    v6 = 16 * m_size - 16;
    do
    {
      if (*(_QWORD *)m_buffer)
        v7 = (const __CFString *)WTF::StringImpl::operator NSString *();
      else
        v7 = &stru_1E351F1B8;
      objc_msgSend(v3, "addObject:", +[WKDataListTextSuggestion textSuggestionWithInputText:](WKDataListTextSuggestion, "textSuggestionWithInputText:", v7));
      if (objc_msgSend(v3, "count") == 3)
        break;
      m_buffer = (DataListSuggestion *)((char *)m_buffer + 16);
      v8 = v6;
      v6 -= 16;
    }
    while (v8);
  }
  return v3;
}

- (int64_t)suggestionsCount
{
  return self->_suggestions.m_size;
}

- (String)suggestionAtIndex:(int64_t)a3
{
  _QWORD *v3;
  _DWORD *v4;

  if (self->_suggestions.m_size <= (unint64_t)a3)
  {
    __break(0xC471u);
  }
  else
  {
    v4 = (_DWORD *)*((_QWORD *)self->_suggestions.m_buffer + 2 * a3);
    if (v4)
      *v4 += 2;
    *v3 = v4;
  }
  return (String)self;
}

- (int64_t)textAlignment
{
  return 2 * *(unsigned __int8 *)(objc_msgSend(objc_loadWeak((id *)&self->_view), "focusedElementInformation") + 177);
}

- (BOOL)isShowingSuggestions
{
  return self->_isShowingSuggestions;
}

- (void)setIsShowingSuggestions:(BOOL)a3
{
  self->_isShowingSuggestions = a3;
}

- (WKContentView)view
{
  return (WKContentView *)objc_loadWeak((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  unsigned int *m_ptr;
  unsigned int v6;
  unsigned int v7;

  objc_destroyWeak((id *)&self->_view);
  WTF::Vector<WebCore::HTTPHeaderField,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_suggestions, v3);
  m_ptr = (unsigned int *)self->_dropdown.m_impl.m_ptr;
  self->_dropdown.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    do
    {
      v6 = __ldaxr(m_ptr);
      v7 = v6 - 1;
    }
    while (__stlxr(v7, m_ptr));
    if (!v7)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, v4);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
