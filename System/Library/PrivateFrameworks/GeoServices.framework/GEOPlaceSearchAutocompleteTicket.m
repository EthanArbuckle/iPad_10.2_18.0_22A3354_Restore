@implementation GEOPlaceSearchAutocompleteTicket

void __96___GEOPlaceSearchAutocompleteTicket_submitWithAutoCompletionHandler_auditToken_networkActivity___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  void (**v16)(_QWORD, _QWORD);
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __96___GEOPlaceSearchAutocompleteTicket_submitWithAutoCompletionHandler_auditToken_networkActivity___block_invoke_2;
    v17[3] = &unk_1E1C06AB0;
    v8 = v5;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v18 = v8;
    v19 = v9;
    v20 = v10;
    v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D765024](v17);
    objc_msgSend(v8, "resultsWithResultType:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      v13 = objc_msgSend(v8, "requestType");
      v14[0] = v7;
      v14[1] = 3221225472;
      v14[2] = __96___GEOPlaceSearchAutocompleteTicket_submitWithAutoCompletionHandler_auditToken_networkActivity___block_invoke_3;
      v14[3] = &unk_1E1C06AD8;
      v15 = *(id *)(a1 + 40);
      v16 = v11;
      _attributedGeoMapItemsForPlaceDatasWithHandler(v13, v12, 0, 0, 0, 0, v14);

    }
    else
    {
      v11[2](v11, 0);
    }

  }
}

void __96___GEOPlaceSearchAutocompleteTicket_submitWithAutoCompletionHandler_auditToken_networkActivity___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  _GEOPlaceSearchCompletion *v5;

  v3 = a2;
  v5 = -[_GEOPlaceSearchCompletion initWithResponse:traits:sessionData:mapItems:]([_GEOPlaceSearchCompletion alloc], "initWithResponse:traits:sessionData:mapItems:", a1[4], *(_QWORD *)(a1[5] + 8), *(_QWORD *)(a1[5] + 72), v3);

  if (v5)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(a1[6] + 16))();

  }
}

uint64_t __96___GEOPlaceSearchAutocompleteTicket_submitWithAutoCompletionHandler_auditToken_networkActivity___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
