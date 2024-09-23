@implementation UIView

void __48__UIView_MPArtworkCatalog__clearArtworkCatalogs__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_lastArtworkCatalog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
    objc_setAssociatedObject(*(id *)(a1 + 40), (const void *)_MPArtworkCatalogLastAssociatedObjectKey, 0, (void *)1);
}

@end
