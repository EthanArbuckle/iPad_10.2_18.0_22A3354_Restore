@implementation ZL40

MPArtworkCatalog *___ZL40_MPMLTranslatorCreateArtworkCatalogBlockxm17MPMediaEntityType25MPMediaLibraryArtworkTypebP8NSStringS2_P8NSNumberP14MPMediaLibrary_block_invoke(uint64_t a1)
{
  void *v2;
  MPArtworkCatalog *v3;
  MPArtworkCatalog *v4;

  objc_msgSend(*(id *)(a1 + 32), "artworkDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[MPArtworkCatalog initWithToken:dataSource:]([MPArtworkCatalog alloc], "initWithToken:dataSource:", *(_QWORD *)(a1 + 40), v2);
  if ((objc_msgSend(v2, "areRepresentationsAvailableForCatalog:", v3) & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

@end
