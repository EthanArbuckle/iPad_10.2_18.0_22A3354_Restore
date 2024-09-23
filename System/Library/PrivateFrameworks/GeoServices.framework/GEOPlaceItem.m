@implementation GEOPlaceItem

void __30___GEOPlaceItem_addressObject__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 32))
  {
    GEOAddressObjectOfGEOPlace(*(void **)(v1 + 16));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

  }
}

@end
