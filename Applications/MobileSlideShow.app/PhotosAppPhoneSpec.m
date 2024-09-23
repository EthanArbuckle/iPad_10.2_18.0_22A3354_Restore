@implementation PhotosAppPhoneSpec

- (id)libraryContentControllerSpec
{
  return objc_alloc_init((Class)PUTabbedLibraryViewControllerPhoneSpec);
}

- (id)importViewControllerSpec
{
  return objc_alloc_init((Class)PUPhotosGridViewControllerPhoneSpec);
}

@end
