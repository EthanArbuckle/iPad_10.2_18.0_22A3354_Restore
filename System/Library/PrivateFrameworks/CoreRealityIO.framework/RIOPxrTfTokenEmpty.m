@implementation RIOPxrTfTokenEmpty

uint64_t __RIOPxrTfTokenEmpty_block_invoke()
{
  uint64_t result;
  unsigned int *v1;
  unsigned int v2;
  uint64_t v3;

  v3 = 0;
  result = RIOPxrTfTokenCreate<pxrInternal__aapl__pxrReserved__::TfToken>(&v3);
  RIOPxrTfTokenEmpty::tokenRef = result;
  if ((v3 & 7) != 0)
  {
    v1 = (unsigned int *)(v3 & 0xFFFFFFFFFFFFFFF8);
    do
      v2 = __ldxr(v1);
    while (__stlxr(v2 - 2, v1));
  }
  return result;
}

@end
