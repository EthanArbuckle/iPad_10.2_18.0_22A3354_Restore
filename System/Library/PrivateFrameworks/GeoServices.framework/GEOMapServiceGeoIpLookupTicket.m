@implementation GEOMapServiceGeoIpLookupTicket

void __93___GEOMapServiceGeoIpLookupTicket_submitWithHandler_auditToken_networkActivity_handlerQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  GeoIpLookupResult *v9;
  id v10;
  GeoIpLookupResult *v11;
  _QWORD block[4];
  GeoIpLookupResult *v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    v7 = *(void **)(a1 + 40);
    if (v7)
    {
      v8 = v7;
      if (v6)
      {
LABEL_4:
        v9 = 0;
LABEL_7:
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __93___GEOMapServiceGeoIpLookupTicket_submitWithHandler_auditToken_networkActivity_handlerQueue___block_invoke_2;
        block[3] = &unk_1E1C01358;
        v15 = *(id *)(a1 + 48);
        v13 = v9;
        v14 = v6;
        v11 = v9;
        dispatch_async(v8, block);

        goto LABEL_8;
      }
    }
    else
    {
      v8 = MEMORY[0x1E0C80D38];
      v10 = MEMORY[0x1E0C80D38];
      if (v6)
        goto LABEL_4;
    }
    v9 = -[GeoIpLookupResult initWithGEOPDPlaceResponse:]([GeoIpLookupResult alloc], "initWithGEOPDPlaceResponse:", v5);
    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __93___GEOMapServiceGeoIpLookupTicket_submitWithHandler_auditToken_networkActivity_handlerQueue___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end
