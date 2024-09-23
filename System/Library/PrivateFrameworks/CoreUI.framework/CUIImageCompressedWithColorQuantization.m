@implementation CUIImageCompressedWithColorQuantization

uint64_t __CUIImageCompressedWithColorQuantization_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v7;

  v5 = objc_msgSend(a2, "integerValue");
  if ((uint64_t)v5 > (uint64_t)objc_msgSend(a3, "integerValue"))
    return 1;
  v7 = objc_msgSend(a2, "integerValue");
  if ((uint64_t)v7 >= (uint64_t)objc_msgSend(a3, "integerValue"))
    return 0;
  else
    return -1;
}

@end
