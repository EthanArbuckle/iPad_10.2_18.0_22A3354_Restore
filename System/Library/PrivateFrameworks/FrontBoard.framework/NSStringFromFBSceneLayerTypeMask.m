@implementation NSStringFromFBSceneLayerTypeMask

uint64_t __NSStringFromFBSceneLayerTypeMask_block_invoke(uint64_t result, uint64_t a2, int a3)
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;

  if ((unint64_t)a3 <= 4 && ((1 << a3) & 0x1A) != 0)
  {
    v3 = *(void **)(result + 32);
    v4 = a3 - 1;
    if (v4 > 3)
      v5 = CFSTR("(unknown)");
    else
      v5 = off_1E4A13BA8[v4];
    return objc_msgSend(v3, "addObject:", v5);
  }
  return result;
}

@end
