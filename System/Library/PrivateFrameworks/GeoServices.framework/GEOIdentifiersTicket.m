@implementation GEOIdentifiersTicket

void __78___GEOIdentifiersTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    if (v5)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      objc_msgSend(v7, "resultsWithResultType:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _attributedGeoMapItemsForPlaceDatasWithHandler(5, v6, 0, 0, 0, 0, *(void **)(a1 + 40));

    }
  }

}

@end
