@implementation CPPDFCreateImageFromStream

void *__CPPDFCreateImageFromStream_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (CGLibraryLoadImageIODYLD_once != -1)
    dispatch_once(&CGLibraryLoadImageIODYLD_once, &__block_literal_global_4_19707);
  if (!CGLibraryLoadImageIODYLD_handle)
    _CGHandleAssert("CGLibraryLoadImageIOFunction", 28, "/Library/Caches/com.apple.xbs/Sources/CoreGraphics/CoreGraphics/Images/CGImageIO.h", "handle != NULL", "Handle for \"%s\" failed to load", a6, a7, a8, (char)"CGImageSourceCreateImageAtIndex");
  result = dlsym((void *)CGLibraryLoadImageIODYLD_handle, "CGImageSourceCreateImageAtIndex");
  if (!result)
    _CGHandleAssert("CGLibraryLoadImageIOFunction", 30, "/Library/Caches/com.apple.xbs/Sources/CoreGraphics/CoreGraphics/Images/CGImageIO.h", "ptr != NULL", "Could not find symbol \"%s\" in library handle %p", v9, v10, v11, (char)"CGImageSourceCreateImageAtIndex");
  CPPDFCreateImageFromStream_f_43 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))result;
  return result;
}

void *__CPPDFCreateImageFromStream_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (CGLibraryLoadImageIODYLD_once != -1)
    dispatch_once(&CGLibraryLoadImageIODYLD_once, &__block_literal_global_4_19707);
  if (!CGLibraryLoadImageIODYLD_handle)
    _CGHandleAssert("CGLibraryLoadImageIOFunction", 28, "/Library/Caches/com.apple.xbs/Sources/CoreGraphics/CoreGraphics/Images/CGImageIO.h", "handle != NULL", "Handle for \"%s\" failed to load", a6, a7, a8, (char)"CGImageSourceCreateWithData");
  result = dlsym((void *)CGLibraryLoadImageIODYLD_handle, "CGImageSourceCreateWithData");
  if (!result)
    _CGHandleAssert("CGLibraryLoadImageIOFunction", 30, "/Library/Caches/com.apple.xbs/Sources/CoreGraphics/CoreGraphics/Images/CGImageIO.h", "ptr != NULL", "Could not find symbol \"%s\" in library handle %p", v9, v10, v11, (char)"CGImageSourceCreateWithData");
  CPPDFCreateImageFromStream_f = (uint64_t (*)(_QWORD, _QWORD))result;
  return result;
}

@end
