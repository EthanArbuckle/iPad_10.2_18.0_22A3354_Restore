@implementation SoftLinkImageIO

uint64_t (*__SoftLinkImageIO_block_invoke())(_QWORD)
{
  void *v0;
  void *v1;
  uint64_t (*result)(_QWORD);

  v0 = (void *)SUUIImageIOFramework();
  if (!v0)
    __SoftLinkImageIO_block_invoke_cold_1();
  v1 = v0;
  weak_kCGImagePropertyEncoder = *(_QWORD *)SUUIWeakLinkedSymbolForString("kCGImagePropertyEncoder", v0);
  if (!weak_kCGImagePropertyEncoder)
    __SoftLinkImageIO_block_invoke_cold_2();
  weak_kCGImagePropertyASTCBlockSize = *(_QWORD *)SUUIWeakLinkedSymbolForString("kCGImagePropertyASTCBlockSize", v1);
  if (!weak_kCGImagePropertyASTCBlockSize)
    __SoftLinkImageIO_block_invoke_cold_3();
  weak_kCGImagePropertyASTCEncoder = *(_QWORD *)SUUIWeakLinkedSymbolForString("kCGImagePropertyASTCEncoder", v1);
  if (!weak_kCGImagePropertyASTCEncoder)
    __SoftLinkImageIO_block_invoke_cold_4();
  weak_CGImageDestinationCreateWithData = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))SUUIWeakLinkedSymbolForString("CGImageDestinationCreateWithData", v1);
  if (!weak_CGImageDestinationCreateWithData)
    __SoftLinkImageIO_block_invoke_cold_5();
  weak_CGImageDestinationAddImage = (uint64_t (*)(_QWORD, _QWORD, _QWORD))SUUIWeakLinkedSymbolForString("CGImageDestinationAddImage", v1);
  if (!weak_CGImageDestinationAddImage)
    __SoftLinkImageIO_block_invoke_cold_6();
  result = (uint64_t (*)(_QWORD))SUUIWeakLinkedSymbolForString("CGImageDestinationFinalize", v1);
  weak_CGImageDestinationFinalize = result;
  if (!result)
    __SoftLinkImageIO_block_invoke_cold_7();
  return result;
}

void __SoftLinkImageIO_block_invoke_cold_1()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SUUIGraphics.m", 27, "imageIOFramework != NULL");
}

void __SoftLinkImageIO_block_invoke_cold_2()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SUUIGraphics.m", 30, "weak_kCGImagePropertyEncoder != NULL");
}

void __SoftLinkImageIO_block_invoke_cold_3()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SUUIGraphics.m", 33, "weak_kCGImagePropertyASTCBlockSize != NULL");
}

void __SoftLinkImageIO_block_invoke_cold_4()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SUUIGraphics.m", 36, "weak_kCGImagePropertyASTCEncoder != NULL");
}

void __SoftLinkImageIO_block_invoke_cold_5()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SUUIGraphics.m", 39, "weak_CGImageDestinationCreateWithData != NULL");
}

void __SoftLinkImageIO_block_invoke_cold_6()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SUUIGraphics.m", 42, "weak_CGImageDestinationAddImage != NULL");
}

void __SoftLinkImageIO_block_invoke_cold_7()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SUUIGraphics.m", 45, "weak_CGImageDestinationFinalize != NULL");
}

@end
