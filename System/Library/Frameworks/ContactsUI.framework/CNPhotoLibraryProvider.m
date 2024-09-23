@implementation CNPhotoLibraryProvider

+ (id)photoLibraryWithError:(id *)a3
{
  int v4;
  Class PHPhotoLibraryClass;

  v4 = -[objc_class isMultiLibraryModeEnabled](getPHPhotoLibraryClass(), "isMultiLibraryModeEnabled");
  PHPhotoLibraryClass = getPHPhotoLibraryClass();
  if (v4)
    -[objc_class openPhotoLibraryWithWellKnownIdentifier:error:](PHPhotoLibraryClass, "openPhotoLibraryWithWellKnownIdentifier:error:", 1, a3);
  else
    -[objc_class sharedPhotoLibrary](PHPhotoLibraryClass, "sharedPhotoLibrary");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
