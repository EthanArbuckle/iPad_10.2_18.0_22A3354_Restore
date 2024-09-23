@implementation SCNView(AVTExtension)

- (__n64)avt_simdViewport
{
  unsigned __int32 v1;
  __n64 result;

  objc_msgSend(a1, "_viewport");
  result.n64_u32[1] = v1;
  return result;
}

@end
