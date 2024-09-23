@implementation PhotosAppSpec

+ (id)specForIdiom:(int64_t)a3
{
  __objc2_class **v3;

  if (a3)
  {
    if (a3 != 1)
      return 0;
    v3 = off_1000690F0;
  }
  else
  {
    v3 = &off_1000690F8;
  }
  return objc_alloc_init(*v3);
}

- (PUTabbedLibraryViewControllerSpec)libraryContentControllerSpec
{
  return 0;
}

- (PUPhotosGridViewControllerSpec)importViewControllerSpec
{
  return 0;
}

@end
