@implementation PhotosAppPadSpec

- (id)libraryContentControllerSpec
{
  return objc_alloc_init((Class)PUTabbedLibraryViewControllerPadSpec);
}

- (id)importViewControllerSpec
{
  return objc_alloc_init((Class)PUPhotosGridViewControllerPadSpec);
}

@end
