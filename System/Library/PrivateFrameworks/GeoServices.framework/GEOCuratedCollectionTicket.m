@implementation GEOCuratedCollectionTicket

void __65___GEOCuratedCollectionTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v13 = a2;
  v5 = a3;
  if (v13
    && (objc_msgSend(v13, "mapsResults"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        !v5)
    && v7)
  {
    +[GEOCollectionResult collectionResultsFromResponse:](GEOCollectionResult, "collectionResultsFromResponse:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __65___GEOCuratedCollectionTicket_submitWithHandler_networkActivity___block_invoke_2;
    v14[3] = &unk_1E1C06CA0;
    v15 = v9;
    v10 = v9;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = (void *)objc_msgSend(v10, "copy");
    (*(void (**)(uint64_t, void *, _QWORD))(v11 + 16))(v11, v12, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __65___GEOCuratedCollectionTicket_submitWithHandler_networkActivity___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "collection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

@end
