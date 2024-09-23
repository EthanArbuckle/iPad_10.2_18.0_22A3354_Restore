@implementation GEOPlaceEVChargerTicket

void __76___GEOPlaceEVChargerTicket_submitRefreshRequestWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  objc_msgSend(a2, "resultsWithResultType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76___GEOPlaceEVChargerTicket_submitRefreshRequestWithHandler_networkActivity___block_invoke_2;
  v9[3] = &unk_1E1C06CC8;
  v7 = *(id *)(a1 + 32);
  v10 = v5;
  v11 = v7;
  v8 = v5;
  _attributedGeoMapItemsForPlaceDatasWithHandler(23, v6, 0, 0, 0, 0, v9);

}

void __76___GEOPlaceEVChargerTicket_submitRefreshRequestWithHandler_networkActivity___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (*v6)(void);
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7 && objc_msgSend(v7, "count"))
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  else
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  v6();

}

@end
