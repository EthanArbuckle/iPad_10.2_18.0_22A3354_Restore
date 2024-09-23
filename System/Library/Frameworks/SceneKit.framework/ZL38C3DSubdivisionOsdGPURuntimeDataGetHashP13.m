@implementation ZL38C3DSubdivisionOsdGPURuntimeDataGetHashP13

const __CFData *___ZL38C3DSubdivisionOsdGPURuntimeDataGetHashP13__C3DGeometry_block_invoke_2(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  const __CFData *result;
  const __CFData *v7;
  const UInt8 *BytePtr;
  CC_LONG Length;

  result = (const __CFData *)C3DSubdivSourceSemanticCanBePrimvar(a3, a4, 0);
  if ((_DWORD)result)
  {
    result = (const __CFData *)C3DMeshSourceGetData(a2);
    if (result)
    {
      v7 = result;
      BytePtr = CFDataGetBytePtr(result);
      Length = CFDataGetLength(v7);
      return (const __CFData *)CC_SHA256_Update(*(CC_SHA256_CTX **)(a1 + 32), BytePtr, Length);
    }
  }
  return result;
}

@end
