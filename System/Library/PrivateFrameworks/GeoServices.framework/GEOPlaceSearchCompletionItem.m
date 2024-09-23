@implementation GEOPlaceSearchCompletionItem

void __112___GEOPlaceSearchCompletionItem_initWithEntry_traits_entryListIndex_entryIndex_mapItems_collections_publishers___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id *v6;
  void *v7;
  void *v8;
  GEOMapItemIdentifier *v9;
  id *v10;
  void *v11;
  GEOMapItemIdentifier *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "collection");
  v6 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDCollectionResult collectionId](v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v9 = [GEOMapItemIdentifier alloc];
    objc_msgSend(v16, "collection");
    v10 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDCollectionResult collectionId](v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v9, "initWithMapsIdentifier:", v11);
    LODWORD(v8) = objc_msgSend(v8, "isEqualToGEOMapItemIdentifier:", v12);

    if ((_DWORD)v8)
    {
      objc_msgSend(v16, "collection");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      *a4 = 1;
    }
  }

}

void __112___GEOPlaceSearchCompletionItem_initWithEntry_traits_entryListIndex_entryIndex_mapItems_collections_publishers___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id *v6;
  void *v7;
  void *v8;
  GEOMapItemIdentifier *v9;
  id *v10;
  void *v11;
  GEOMapItemIdentifier *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "publisher");
  v6 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPublisherResult publisherId](v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v9 = [GEOMapItemIdentifier alloc];
    objc_msgSend(v16, "publisher");
    v10 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPublisherResult publisherId](v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v9, "initWithMapsIdentifier:", v11);
    LODWORD(v8) = objc_msgSend(v8, "isEqualToGEOMapItemIdentifier:", v12);

    if ((_DWORD)v8)
    {
      objc_msgSend(v16, "publisher");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      *a4 = 1;
    }
  }

}

GEOResultRefinement *__50___GEOPlaceSearchCompletionItem_resultRefinements__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  GEOResultRefinement *v3;

  v2 = a2;
  v3 = -[GEOResultRefinement initWithResultRefinement:]([GEOResultRefinement alloc], "initWithResultRefinement:", v2);

  return v3;
}

@end
