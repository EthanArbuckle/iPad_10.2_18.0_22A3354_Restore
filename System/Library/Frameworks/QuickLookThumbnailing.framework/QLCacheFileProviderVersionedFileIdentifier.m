@implementation QLCacheFileProviderVersionedFileIdentifier

- (QLCacheFileProviderVersionedFileIdentifier)initWithFileIdentifier:(id)a3 version:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLCacheFileProviderVersionedFileIdentifier;
  return -[QLCacheVersionedFileIdentifier initWithFileIdentifier:version:](&v5, sel_initWithFileIdentifier_version_, a3, a4);
}

- (QLCacheFileProviderVersionedFileIdentifier)initWithThumbnailRequest:(id)a3
{
  id v4;
  QLCacheFileProviderVersionedFileIdentifier *v5;
  void *v6;
  void *v7;
  QLThumbnailVersion *v8;
  void *v9;
  QLThumbnailVersion *v10;

  v4 = a3;
  if ((objc_msgSend(v4, "isFileBased") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "fileProviderFileIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [QLThumbnailVersion alloc];
    objc_msgSend(v4, "item");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[QLThumbnailVersion initWithFPItem:automaticallyGenerated:](v8, "initWithFPItem:automaticallyGenerated:", v9, 1);
    self = -[QLCacheFileProviderVersionedFileIdentifier initWithFileIdentifier:version:](self, "initWithFileIdentifier:version:", v7, v10);

    v5 = self;
  }

  return v5;
}

@end
