@implementation _NSCloudKitDataFileBackedFuture

- (_NSCloudKitDataFileBackedFuture)initWithStoreMetadata:(id)a3 directory:(id)a4 originalFileURL:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_NSCloudKitDataFileBackedFuture;
  return -[_NSDataFileBackedFuture initWithStoreMetadata:directory:originalFileURL:](&v6, sel_initWithStoreMetadata_directory_originalFileURL_, a3, a4, a5);
}

- (void)_copyToInterimLocation
{
  objc_super v3;

  if (self)
  {
    if (objc_getProperty(self, a2, 16, 1))
    {
      v3.receiver = self;
      v3.super_class = (Class)_NSCloudKitDataFileBackedFuture;
      -[_NSDataFileBackedFuture _copyToInterimLocation](&v3, sel__copyToInterimLocation);
    }
  }
}

- (void)_moveToPermanentLocation
{
  objc_super v3;

  if (self)
  {
    if (objc_getProperty(self, a2, 16, 1))
    {
      v3.receiver = self;
      v3.super_class = (Class)_NSCloudKitDataFileBackedFuture;
      -[_NSDataFileBackedFuture _moveToPermanentLocation](&v3, sel__moveToPermanentLocation);
    }
  }
}

- (BOOL)_isCloudKitSupportOriginated
{
  return 1;
}

@end
