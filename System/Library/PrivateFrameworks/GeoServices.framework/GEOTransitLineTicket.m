@implementation GEOTransitLineTicket

void __59___GEOTransitLineTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  _QWORD v5[4];
  id v6;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(a2, "resultsWithResultType:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __59___GEOTransitLineTicket_submitWithHandler_networkActivity___block_invoke_2;
    v5[3] = &unk_1E1C021B8;
    v6 = *(id *)(a1 + 32);
    _geoTransitLineItemsForPlaceDatas(v4, v5);

  }
}

uint64_t __59___GEOTransitLineTicket_submitWithHandler_networkActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
