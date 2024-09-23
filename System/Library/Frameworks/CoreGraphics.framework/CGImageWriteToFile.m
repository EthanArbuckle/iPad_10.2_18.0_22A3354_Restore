@implementation CGImageWriteToFile

uint64_t (*__CGImageWriteToFile_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(_QWORD)
{
  uint64_t (*result)(_QWORD);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (CGLibraryLoadImageIODYLD_once != -1)
    dispatch_once(&CGLibraryLoadImageIODYLD_once, &__block_literal_global_4_19707);
  if (!CGLibraryLoadImageIODYLD_handle)
    _CGHandleAssert("CGLibraryLoadImageIOFunction", 28, "/Library/Caches/com.apple.xbs/Sources/CoreGraphics/CoreGraphics/Images/CGImageIO.h", "handle != NULL", "Handle for \"%s\" failed to load", a6, a7, a8, (char)"CGImageDestinationFinalize");
  result = (uint64_t (*)(_QWORD))dlsym((void *)CGLibraryLoadImageIODYLD_handle, "CGImageDestinationFinalize");
  if (!result)
    _CGHandleAssert("CGLibraryLoadImageIOFunction", 30, "/Library/Caches/com.apple.xbs/Sources/CoreGraphics/CoreGraphics/Images/CGImageIO.h", "ptr != NULL", "Could not find symbol \"%s\" in library handle %p", v9, v10, v11, (char)"CGImageDestinationFinalize");
  CGImageWriteToFile_f_191 = result;
  return result;
}

void *__CGImageWriteToFile_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (CGLibraryLoadImageIODYLD_once != -1)
    dispatch_once(&CGLibraryLoadImageIODYLD_once, &__block_literal_global_4_19707);
  if (!CGLibraryLoadImageIODYLD_handle)
    _CGHandleAssert("CGLibraryLoadImageIOFunction", 28, "/Library/Caches/com.apple.xbs/Sources/CoreGraphics/CoreGraphics/Images/CGImageIO.h", "handle != NULL", "Handle for \"%s\" failed to load", a6, a7, a8, (char)"CGImageDestinationAddImage");
  result = dlsym((void *)CGLibraryLoadImageIODYLD_handle, "CGImageDestinationAddImage");
  if (!result)
    _CGHandleAssert("CGLibraryLoadImageIOFunction", 30, "/Library/Caches/com.apple.xbs/Sources/CoreGraphics/CoreGraphics/Images/CGImageIO.h", "ptr != NULL", "Could not find symbol \"%s\" in library handle %p", v9, v10, v11, (char)"CGImageDestinationAddImage");
  CGImageWriteToFile_f_187 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))result;
  return result;
}

void *__CGImageWriteToFile_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (CGLibraryLoadImageIODYLD_once != -1)
    dispatch_once(&CGLibraryLoadImageIODYLD_once, &__block_literal_global_4_19707);
  if (!CGLibraryLoadImageIODYLD_handle)
    _CGHandleAssert("CGLibraryLoadImageIOFunction", 28, "/Library/Caches/com.apple.xbs/Sources/CoreGraphics/CoreGraphics/Images/CGImageIO.h", "handle != NULL", "Handle for \"%s\" failed to load", a6, a7, a8, (char)"CGImageDestinationCreateWithURL");
  result = dlsym((void *)CGLibraryLoadImageIODYLD_handle, "CGImageDestinationCreateWithURL");
  if (!result)
    _CGHandleAssert("CGLibraryLoadImageIOFunction", 30, "/Library/Caches/com.apple.xbs/Sources/CoreGraphics/CoreGraphics/Images/CGImageIO.h", "ptr != NULL", "Could not find symbol \"%s\" in library handle %p", v9, v10, v11, (char)"CGImageDestinationCreateWithURL");
  CGImageWriteToFile_f = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))result;
  return result;
}

@end
