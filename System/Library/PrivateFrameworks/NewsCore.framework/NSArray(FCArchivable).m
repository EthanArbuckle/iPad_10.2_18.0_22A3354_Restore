@implementation NSArray(FCArchivable)

- (id)contentArchive
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "fc_arrayByTransformingWithBlock:", &__block_literal_global_183);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCContentArchive archiveWithChildArchives:](FCContentArchive, "archiveWithChildArchives:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (FCContentManifest)contentManifest
{
  FCContentManifest *v2;
  void *v3;
  FCContentManifest *v4;

  v2 = [FCContentManifest alloc];
  objc_msgSend(a1, "fc_arrayByTransformingWithBlock:", &__block_literal_global_8_6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FCContentManifest initWithManifests:](v2, "initWithManifests:", v3);

  return v4;
}

@end
