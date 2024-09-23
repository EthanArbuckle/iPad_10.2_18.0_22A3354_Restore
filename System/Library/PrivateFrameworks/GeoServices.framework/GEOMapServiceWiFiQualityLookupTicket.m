@implementation GEOMapServiceWiFiQualityLookupTicket

void __91___GEOMapServiceWiFiQualityLookupTicket_submitNetworkSearchWithCompletionQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
  {
    v7 = *(id *)(a1 + 40);
    if (!v7)
    {
      dispatch_get_global_queue(21, 0);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91___GEOMapServiceWiFiQualityLookupTicket_submitNetworkSearchWithCompletionQueue_completion___block_invoke_2;
    block[3] = &unk_1E1C01358;
    v11 = *(id *)(a1 + 48);
    v9 = v5;
    v10 = v6;
    dispatch_async(v7, block);

  }
}

void __91___GEOMapServiceWiFiQualityLookupTicket_submitNetworkSearchWithCompletionQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "networkResults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v4, "copy");
  (*(void (**)(uint64_t, void *, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40));

}

void __92___GEOMapServiceWiFiQualityLookupTicket_submitLocationSearchWithCompletionQueue_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -6, CFSTR("unsupported"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __86___GEOMapServiceWiFiQualityLookupTicket_submitTileLoadWithCompletionQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;
  GEOWiFiQualitySearchResultTile *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  GEOWiFiQualitySearchResultTile *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  GEOWiFiQualitySearchResultTile *v23;
  id v24;
  id v25;
  id v26;
  char v27;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "isEqualToString:", v10);
  if (v11)
    v14 = -[GEOWiFiQualitySearchResultTile initWithData:]([GEOWiFiQualitySearchResultTile alloc], "initWithData:", v11);
  else
    v14 = 0;
  v15 = *(id *)(a1 + 40);
  if (!v15)
  {
    dispatch_get_global_queue(21, 0);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __86___GEOMapServiceWiFiQualityLookupTicket_submitTileLoadWithCompletionQueue_completion___block_invoke_2;
  v21[3] = &unk_1E1C06C08;
  v16 = *(id *)(a1 + 48);
  v25 = v12;
  v26 = v16;
  v27 = v13;
  v22 = v9;
  v23 = v14;
  v24 = v10;
  v17 = v12;
  v18 = v10;
  v19 = v14;
  v20 = v9;
  dispatch_async(v15, v21);

}

uint64_t __86___GEOMapServiceWiFiQualityLookupTicket_submitTileLoadWithCompletionQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

@end
