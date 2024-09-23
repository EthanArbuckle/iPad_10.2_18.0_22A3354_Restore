@implementation ZL21compositionHighlightsP18NSAttributedString

unsigned int *___ZL21compositionHighlightsP18NSAttributedString_block_invoke(uint64_t a1, void *a2, int a3, int a4)
{
  WebCore *v8;
  UIColor *v9;
  void *v10;
  WebCore *v11;
  UIColor *v12;
  void *v13;
  uint64_t v14;
  unsigned int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int *result;
  void *v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int *v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int *v29;
  unsigned int v30;
  unsigned int v31;
  _BYTE v32[16];
  uint64_t v33;
  _BYTE v34[16];
  _BYTE v35[16];
  _BYTE v36[16];
  Color v37;

  v37.m_colorAndFlags = 0x11040000AFC0E33CLL;
  v8 = (WebCore *)objc_msgSend(a2, "objectForKeyedSubscript:", off_1ECE70DE8());
  if (v8)
  {
    WebCore::colorFromCocoaColor(v8, v9);
    WebCore::Color::operator=();
    if ((v33 & 0x8000000000000) != 0)
    {
      v26 = (unsigned int *)(v33 & 0xFFFFFFFFFFFFLL);
      do
      {
        v27 = __ldaxr(v26);
        v28 = v27 - 1;
      }
      while (__stlxr(v28, v26));
      if (!v28)
      {
        atomic_store(1u, v26);
        WTF::fastFree((WTF *)v26, v10);
      }
    }
  }
  v36[0] = 0;
  v36[8] = 0;
  v11 = (WebCore *)objc_msgSend(a2, "objectForKeyedSubscript:", _MergedGlobals_855());
  if (v11)
  {
    WebCore::colorFromCocoaColor(v11, v12);
    std::optional<WebCore::Color>::operator=[abi:sn180100]<WebCore::Color,void>((uint64_t)v36);
    if ((v33 & 0x8000000000000) != 0)
    {
      v29 = (unsigned int *)(v33 & 0xFFFFFFFFFFFFLL);
      do
      {
        v30 = __ldaxr(v29);
        v31 = v30 - 1;
      }
      while (__stlxr(v31, v29));
      if (!v31)
      {
        atomic_store(1u, v29);
        WTF::fastFree((WTF *)v29, v13);
      }
    }
  }
  v14 = *(_QWORD *)(a1 + 32);
  WebCore::Color::Color((WebCore::Color *)v32, &v37);
  v32[8] = 1;
  WebCore::CompositionHighlight::CompositionHighlight(&v33, a3, a3 + a4, (uint64_t)v32, (uint64_t)v36);
  v15 = *(_DWORD *)(v14 + 12);
  if (v15 == *(_DWORD *)(v14 + 8))
  {
    WTF::Vector<WebCore::CompositionHighlight,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WebCore::CompositionHighlight>(v14, (unint64_t)&v33);
  }
  else
  {
    v17 = *(_QWORD *)v14;
    v18 = *(_QWORD *)v14 + 40 * v15;
    *(_QWORD *)v18 = v33;
    std::__optional_move_base<WebCore::Color,false>::__optional_move_base[abi:sn180100]((_BYTE *)(v18 + 8), (uint64_t)v34);
    std::__optional_move_base<WebCore::Color,false>::__optional_move_base[abi:sn180100]((_BYTE *)(v17 + 40 * v15 + 24), (uint64_t)v35);
    ++*(_DWORD *)(v14 + 12);
  }
  std::__optional_destruct_base<WebCore::Color,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v35, v16);
  std::__optional_destruct_base<WebCore::Color,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v34, v19);
  std::__optional_destruct_base<WebCore::Color,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v32, v20);
  result = (unsigned int *)std::__optional_destruct_base<WebCore::Color,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v36, v21);
  if ((v37.m_colorAndFlags & 0x8000000000000) != 0)
  {
    result = (unsigned int *)(v37.m_colorAndFlags & 0xFFFFFFFFFFFFLL);
    do
    {
      v24 = __ldaxr(result);
      v25 = v24 - 1;
    }
    while (__stlxr(v25, result));
    if (!v25)
    {
      atomic_store(1u, result);
      return (unsigned int *)WTF::fastFree((WTF *)result, v23);
    }
  }
  return result;
}

@end
