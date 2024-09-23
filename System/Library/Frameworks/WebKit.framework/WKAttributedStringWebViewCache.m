@implementation WKAttributedStringWebViewCache

uint64_t __58___WKAttributedStringWebViewCache_retrieveOrCreateWebView__block_invoke(WTF::MemoryPressureHandler *a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t result;

  v2 = WTF::MemoryPressureHandler::singleton(a1);
  v3 = *((_QWORD *)a1 + 4);
  v4 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v4 = off_1E34BAF60;
  v4[1] = v3;
  result = *(_QWORD *)(v2 + 48);
  *(_QWORD *)(v2 + 48) = v4;
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

@end
