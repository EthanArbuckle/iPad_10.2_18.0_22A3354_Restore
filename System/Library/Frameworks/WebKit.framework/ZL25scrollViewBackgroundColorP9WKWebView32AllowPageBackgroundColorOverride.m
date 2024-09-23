@implementation ZL25scrollViewBackgroundColorP9WKWebView32AllowPageBackgroundColorOverride

unsigned int *___ZL25scrollViewBackgroundColorP9WKWebView32AllowPageBackgroundColorOverride_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  WebCore *v4;
  CGColor *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int *result;
  void *v9;
  uint64_t v10;
  WebCore *v11;
  CGColor *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  WebCore *v16;
  CGColor *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  const Color *v22;
  void *v23;
  WebKit::WebPageProxy *v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int *v31;
  unsigned int v32;
  unsigned int v33;
  uint64_t v34;

  v2 = **(_QWORD ***)(a1 + 40);
  v3 = (void *)v2[198];
  if (v3)
  {
    v4 = (WebCore *)objc_msgSend((id)objc_msgSend(v3, "backgroundColor"), "CGColor");
    v6 = WebCore::roundAndClampToSRGBALossy(v4, v5);
    v7 = bswap32(v6) | 0x1104000000000000;
    if (!BYTE4(v6))
      v7 = 0;
    v34 = v7;
  }
  else
  {
    v21 = **(unsigned __int8 **)(a1 + 48);
    v22 = (const Color *)v2[78];
    if (v22)
    {
      WebCore::Color::Color((WebCore::Color *)&v34, v22 + 8);
      if ((v34 & 0x4000000000000) != 0)
        goto LABEL_5;
      if ((v34 & 0x8000000000000) != 0)
      {
        v31 = (unsigned int *)(v34 & 0xFFFFFFFFFFFFLL);
        do
        {
          v32 = __ldaxr(v31);
          v33 = v32 - 1;
        }
        while (__stlxr(v33, v31));
        if (!v33)
        {
          atomic_store(1u, v31);
          WTF::fastFree((WTF *)v31, v23);
        }
      }
    }
    v24 = (WebKit::WebPageProxy *)v2[53];
    if (v24)
    {
      if (v21)
        WebKit::WebPageProxy::underPageBackgroundColor(v24, &v34);
      else
        WebCore::Color::Color((WebCore::Color *)&v34, (const Color *)(*((_QWORD *)v24 + 4) + 912));
    }
    else
    {
      v34 = 0;
    }
  }
LABEL_5:
  result = (unsigned int *)WebCore::Color::operator=();
  if ((v34 & 0x8000000000000) != 0)
  {
    result = (unsigned int *)(v34 & 0xFFFFFFFFFFFFLL);
    do
    {
      v25 = __ldaxr(result);
      v26 = v25 - 1;
    }
    while (__stlxr(v26, result));
    if (!v26)
    {
      atomic_store(1u, result);
      result = (unsigned int *)WTF::fastFree((WTF *)result, v9);
    }
  }
  v10 = **(_QWORD **)(a1 + 32);
  if ((v10 & 0x4000000000000) == 0)
  {
    result = *(unsigned int **)(**(_QWORD **)(a1 + 40) + 616);
    if (result)
    {
      v11 = (WebCore *)objc_msgSend((id)objc_msgSend(result, "backgroundColor"), "CGColor");
      v13 = WebCore::roundAndClampToSRGBALossy(v11, v12);
      v14 = bswap32(v13) | 0x1104000000000000;
      if (!BYTE4(v13))
        v14 = 0;
      v34 = v14;
      result = (unsigned int *)WebCore::Color::operator=();
      if ((v34 & 0x8000000000000) != 0)
      {
        result = (unsigned int *)(v34 & 0xFFFFFFFFFFFFLL);
        do
        {
          v29 = __ldaxr(result);
          v30 = v29 - 1;
        }
        while (__stlxr(v30, result));
        if (!v30)
        {
          atomic_store(1u, result);
          result = (unsigned int *)WTF::fastFree((WTF *)result, v15);
        }
      }
      v10 = **(_QWORD **)(a1 + 32);
    }
  }
  if ((v10 & 0x4000000000000) == 0)
  {
    v16 = (WebCore *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor"), "CGColor");
    v18 = WebCore::roundAndClampToSRGBALossy(v16, v17);
    v19 = bswap32(v18) | 0x1104000000000000;
    if (!BYTE4(v18))
      v19 = 0;
    v34 = v19;
    result = (unsigned int *)WebCore::Color::operator=();
    if ((v34 & 0x8000000000000) != 0)
    {
      result = (unsigned int *)(v34 & 0xFFFFFFFFFFFFLL);
      do
      {
        v27 = __ldaxr(result);
        v28 = v27 - 1;
      }
      while (__stlxr(v28, result));
      if (!v28)
      {
        atomic_store(1u, result);
        return (unsigned int *)WTF::fastFree((WTF *)result, v20);
      }
    }
  }
  return result;
}

@end
