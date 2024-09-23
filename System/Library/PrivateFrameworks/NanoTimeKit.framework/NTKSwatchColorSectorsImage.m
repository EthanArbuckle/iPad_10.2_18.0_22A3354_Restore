@implementation NTKSwatchColorSectorsImage

uint64_t __NTKSwatchColorSectorsImage_block_invoke(int a1, id a2)
{
  return objc_msgSend(objc_retainAutorelease(a2), "CGColor");
}

@end
