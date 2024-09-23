@implementation MPMediaKitEntityTranslatorTransformArtwork

MPArtworkCatalog *__MPMediaKitEntityTranslatorTransformArtwork_block_invoke(uint64_t a1)
{
  MPArtworkCatalog *v2;
  uint64_t v3;
  void *v4;
  MPArtworkCatalog *v5;

  v2 = [MPArtworkCatalog alloc];
  v3 = *(_QWORD *)(a1 + 32);
  +[MPStoreArtworkDataSource sharedStoreArtworkDataSource](MPStoreArtworkDataSource, "sharedStoreArtworkDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MPArtworkCatalog initWithToken:dataSource:](v2, "initWithToken:dataSource:", v3, v4);

  return v5;
}

@end
