@implementation ZL17extractUnderlinesP18NSAttributedString

unsigned int *___ZL17extractUnderlinesP18NSAttributedString_block_invoke(uint64_t a1, void *a2, int a3, int a4)
{
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  unsigned int *result;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  Color v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  BOOL v22;

  v7 = *(_QWORD *)(a1 + 32);
  v18.m_colorAndFlags = 0x11040000000000FFLL;
  v8 = (objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", off_1ECE70DE0()), "isEqual:", &unk_1E356FE98) & 1) != 0
    || objc_msgSend(a2, "objectForKeyedSubscript:", off_1ECE70DE8()) != 0;
  LODWORD(v19) = a3;
  HIDWORD(v19) = a3 + a4;
  v20 = 0;
  WebCore::Color::Color((WebCore::Color *)&v21, &v18);
  v22 = v8;
  v9 = *(unsigned int *)(v7 + 12);
  if ((_DWORD)v9 == *(_DWORD *)(v7 + 8))
  {
    result = (unsigned int *)WTF::Vector<WebCore::CompositionUnderline,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WebCore::CompositionUnderline>(v7, (unint64_t)&v19);
  }
  else
  {
    v12 = *(_QWORD *)v7 + 32 * v9;
    v13 = v19;
    *(_BYTE *)(v12 + 8) = v20;
    *(_QWORD *)v12 = v13;
    result = (unsigned int *)WebCore::Color::Color();
    *(_BYTE *)(v12 + 24) = v22;
    ++*(_DWORD *)(v7 + 12);
  }
  if ((v21 & 0x8000000000000) != 0)
  {
    result = (unsigned int *)(v21 & 0xFFFFFFFFFFFFLL);
    do
    {
      v14 = __ldaxr(result);
      v15 = v14 - 1;
    }
    while (__stlxr(v15, result));
    if (!v15)
    {
      atomic_store(1u, result);
      result = (unsigned int *)WTF::fastFree((WTF *)result, v11);
    }
  }
  if ((v18.m_colorAndFlags & 0x8000000000000) != 0)
  {
    result = (unsigned int *)(v18.m_colorAndFlags & 0xFFFFFFFFFFFFLL);
    do
    {
      v16 = __ldaxr(result);
      v17 = v16 - 1;
    }
    while (__stlxr(v17, result));
    if (!v17)
    {
      atomic_store(1u, result);
      return (unsigned int *)WTF::fastFree((WTF *)result, v11);
    }
  }
  return result;
}

@end
