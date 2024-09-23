@implementation GEOReverseGeocodeRequestTicket

void __88___GEOReverseGeocodeRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke(uint64_t a1, double a2, double a3)
{
  void *v6;
  void *v7;
  id *v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (void *)MEMORY[0x18D764E2C]();
  v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "copy");
  objc_msgSend(v7, "placeRequestParameters");
  v8 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceRequestParameters reverseGeocodingParameters](v8);
  v9 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDReverseGeocodingParameters extendedLocations](v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "latLng");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLat:", a2);

  objc_msgSend(v11, "latLng");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLng:", a3);

  objc_msgSend(*(id *)(a1 + 32), "_processRequest:auditToken:timeout:withHandler:refinedHandler:networkActivity:", v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56), 0.0);
  objc_autoreleasePoolPop(v6);
}

void __88___GEOReverseGeocodeRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)MEMORY[0x18D764E2C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v3);

}

@end
