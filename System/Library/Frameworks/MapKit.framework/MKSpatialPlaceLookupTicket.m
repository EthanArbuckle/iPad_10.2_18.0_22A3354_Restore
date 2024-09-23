@implementation MKSpatialPlaceLookupTicket

void __55___MKSpatialPlaceLookupTicket_submitWithHandler_queue___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "parameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resultItemForSpatialLookupParameters:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "mapItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __55___MKSpatialPlaceLookupTicket_submitWithHandler_queue___block_invoke_2;
      v14[3] = &unk_1E20DAAA8;
      v14[4] = *(_QWORD *)(a1 + 32);
      v15 = v8;
      v16 = *(id *)(a1 + 40);
      _mapItemsForGeoMapItemsWithHandler(v9, v14);

    }
    else
    {
      v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v11 = objc_msgSend(v10, "initWithDomain:code:userInfo:", MKErrorDomain, 4, 0);
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(v12 + 16);
      *(_QWORD *)(v12 + 16) = v11;

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

void __55___MKSpatialPlaceLookupTicket_submitWithHandler_queue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a3);
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "boundingRegion");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 24);
    *(_QWORD *)(v7 + 24) = v6;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end
