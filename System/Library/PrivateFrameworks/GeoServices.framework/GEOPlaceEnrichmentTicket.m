@implementation GEOPlaceEnrichmentTicket

void __63___GEOPlaceEnrichmentTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;

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
    objc_msgSend(v5, "resultsWithResultType:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __63___GEOPlaceEnrichmentTicket_submitWithHandler_networkActivity___block_invoke_2;
    v10[3] = &unk_1E1C021B8;
    v11 = *(id *)(a1 + 32);
    _attributedGeoMapItemsForPlaceDatasWithHandler(58, v9, 0, 0, 0, 0, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __63___GEOPlaceEnrichmentTicket_submitWithHandler_networkActivity___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6
    && (objc_msgSend(v6, "_enrichmentData"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "_enrichmentData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v5, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

@end
