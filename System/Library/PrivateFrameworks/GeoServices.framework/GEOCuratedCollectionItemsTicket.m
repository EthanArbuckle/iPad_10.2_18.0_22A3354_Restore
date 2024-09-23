@implementation GEOCuratedCollectionItemsTicket

void __70___GEOCuratedCollectionItemsTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  if (v5
    && (objc_msgSend(v5, "mapsResults"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        !v6)
    && v8)
  {
    +[GEOCollectionResult collectionResultsFromResponse:](GEOCollectionResult, "collectionResultsFromResponse:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resultsWithResultType:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __70___GEOCuratedCollectionItemsTicket_submitWithHandler_networkActivity___block_invoke_2;
    v14[3] = &unk_1E1C06CC8;
    v12 = *(id *)(a1 + 32);
    v15 = v10;
    v16 = v12;
    v13 = v10;
    _attributedGeoMapItemsForPlaceDatasWithHandler(23, v11, 0, 0, 0, 0, v14);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __70___GEOCuratedCollectionItemsTicket_submitWithHandler_networkActivity___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = *(_QWORD *)(a1 + 40);
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(v5 + 16))(*(_QWORD *)(a1 + 40), 0, 0, 0, a3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "collection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "placeCollectionItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, id, _QWORD))(v5 + 16))(v5, v6, v7, v8, 0);

  }
}

@end
