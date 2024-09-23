@implementation GEOPlaceSearchPlaceholderTicket

void __70___GEOPlaceSearchPlaceholderTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v4;
  id *v5;
  void *v6;
  id v7;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(a2, "globalResult");
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceGlobalResult searchFieldPlaceholderResult](v4);
    v5 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDSearchFieldPlaceholderResult displayString](v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, CFSTR("Response had no placeholderString"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }
}

@end
