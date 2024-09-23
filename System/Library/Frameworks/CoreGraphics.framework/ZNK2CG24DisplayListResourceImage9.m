@implementation ZNK2CG24DisplayListResourceImage9

uint64_t (*___ZNK2CG24DisplayListResourceImage9_equal_toERKNS_19DisplayListResourceEm_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(_QWORD)
{
  uint64_t (*result)(_QWORD);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (CGLibraryLoadImageIODYLD_once != -1)
    dispatch_once(&CGLibraryLoadImageIODYLD_once, &__block_literal_global_4_19707);
  if (!CGLibraryLoadImageIODYLD_handle)
    _CGHandleAssert("CGLibraryLoadImageIOFunction", 28, "/Library/Caches/com.apple.xbs/Sources/CoreGraphics/CoreGraphics/Images/CGImageIO.h", "handle != NULL", "Handle for \"%s\" failed to load", a6, a7, a8, (char)"CGImageGetHash");
  result = (uint64_t (*)(_QWORD))dlsym((void *)CGLibraryLoadImageIODYLD_handle, "CGImageGetHash");
  if (!result)
    _CGHandleAssert("CGLibraryLoadImageIOFunction", 30, "/Library/Caches/com.apple.xbs/Sources/CoreGraphics/CoreGraphics/Images/CGImageIO.h", "ptr != NULL", "Could not find symbol \"%s\" in library handle %p", v9, v10, v11, (char)"CGImageGetHash");
  CG::DisplayListResourceImage::_equal_to(CG::DisplayListResource const&,unsigned long)const::f = result;
  return result;
}

uint64_t (*___ZNK2CG24DisplayListResourceImage9_equal_toERKNS_19DisplayListResourceEm_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(_QWORD)
{
  uint64_t (*result)(_QWORD);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (CGLibraryLoadImageIODYLD_once != -1)
    dispatch_once(&CGLibraryLoadImageIODYLD_once, &__block_literal_global_4_19707);
  if (!CGLibraryLoadImageIODYLD_handle)
    _CGHandleAssert("CGLibraryLoadImageIOFunction", 28, "/Library/Caches/com.apple.xbs/Sources/CoreGraphics/CoreGraphics/Images/CGImageIO.h", "handle != NULL", "Handle for \"%s\" failed to load", a6, a7, a8, (char)"CGImageGetHash");
  result = (uint64_t (*)(_QWORD))dlsym((void *)CGLibraryLoadImageIODYLD_handle, "CGImageGetHash");
  if (!result)
    _CGHandleAssert("CGLibraryLoadImageIOFunction", 30, "/Library/Caches/com.apple.xbs/Sources/CoreGraphics/CoreGraphics/Images/CGImageIO.h", "ptr != NULL", "Could not find symbol \"%s\" in library handle %p", v9, v10, v11, (char)"CGImageGetHash");
  CG::DisplayListResourceImage::_equal_to(CG::DisplayListResource const&,unsigned long)const::f = result;
  return result;
}

@end
