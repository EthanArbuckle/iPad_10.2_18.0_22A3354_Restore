@implementation QLCacheBasicVersionedFileIdentifier

- (QLCacheBasicVersionedFileIdentifier)initWithFileIdentifier:(id)a3 version:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLCacheBasicVersionedFileIdentifier;
  return -[QLCacheVersionedFileIdentifier initWithFileIdentifier:version:](&v5, sel_initWithFileIdentifier_version_, a3, a4);
}

- (QLCacheBasicVersionedFileIdentifier)initWithThumbnailRequest:(id)a3
{
  id v4;
  QLCacheBasicVersionedFileIdentifier *v5;
  void *v6;
  void *v7;
  QLThumbnailVersion *v8;
  void *v9;
  void *v10;
  QLThumbnailVersion *v11;

  v4 = a3;
  if ((objc_msgSend(v4, "isUbiquitous") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "basicFileIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [QLThumbnailVersion alloc];
    objc_msgSend(v4, "quicklookSandboxWrapper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[QLThumbnailVersion initWithFileURL:automaticallyGenerated:](v8, "initWithFileURL:automaticallyGenerated:", v10, 1);
    self = -[QLCacheBasicVersionedFileIdentifier initWithFileIdentifier:version:](self, "initWithFileIdentifier:version:", v7, v11);

    v5 = self;
  }

  return v5;
}

@end
