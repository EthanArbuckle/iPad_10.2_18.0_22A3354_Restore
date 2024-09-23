@implementation NSData(ISImage)

- (uint64_t)__IS_imageHeader
{
  unint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(a1, "length");
  result = objc_msgSend(objc_retainAutorelease(a1), "bytes");
  if (v2 <= 0x30)
    return 0;
  return result;
}

- (unint64_t)__IS_getImageBuffer:()ISImage size:
{
  unint64_t result;
  unint64_t v6;

  result = objc_msgSend(a1, "__IS_imageHeader");
  if (*(_DWORD *)(result + 4))
  {
    v6 = result;
    result = objc_msgSend(a1, "length");
    if (result >= (unint64_t)*(unsigned int *)(v6 + 4) + 48)
    {
      result = objc_msgSend(objc_retainAutorelease(a1), "bytes");
      if (a3)
      {
        if (result != -48)
          *a3 = result + 48;
      }
    }
  }
  return result;
}

- (uint64_t)__IS_copyCGImageBlockSetWithProvider:()ISImage
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;

  v5 = xmmword_1E9768808;
  objc_msgSend(a1, "__IS_imageHeader");
  v3 = 0;
  v4 = 0;
  objc_msgSend(a1, "__IS_getImageBuffer:size:", &v3, &v4);
  result = v3;
  if (v3)
  {
    CGImageBlockCreate();
    return CGImageBlockSetCreate();
  }
  return result;
}

@end
