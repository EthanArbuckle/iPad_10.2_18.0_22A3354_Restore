@implementation GEOMapServiceSearchCapabilitiesTicket

void __76___GEOMapServiceSearchCapabilitiesTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v4;
  _BYTE *v5;
  void *v6;
  void *v7;
  id *v8;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(a2, "globalResult");
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceGlobalResult searchCapabilitiesResult](v4);
    v8 = (id *)objc_claimAutoreleasedReturnValue();

    -[GEOPDSearchCapabilitiesResult offlineCapabilities](v8);
    v5 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && (v5[20] & 1) != 0)
    {
      -[GEOPDSearchCapabilitiesResult offlineCapabilities](v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)

    }
    else
    {

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

@end
