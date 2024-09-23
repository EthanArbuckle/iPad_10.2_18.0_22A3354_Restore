@implementation GEOSharedNavState(Testing)

+ (id)_msp_testTrip
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__GEOSharedNavState_Testing___msp_testTrip__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED3282C8 != -1)
    dispatch_once(&qword_1ED3282C8, block);
  return (id)_MergedGlobals_34;
}

+ (id)_msp_testTripWithMultipleStops
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__GEOSharedNavState_Testing___msp_testTripWithMultipleStops__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED3282D8 != -1)
    dispatch_once(&qword_1ED3282D8, block);
  return (id)qword_1ED3282D0;
}

+ (id)_msp_testTripWithMultipleStopsMiddleOfTrip
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__GEOSharedNavState_Testing___msp_testTripWithMultipleStopsMiddleOfTrip__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED3282E8 != -1)
    dispatch_once(&qword_1ED3282E8, block);
  return (id)qword_1ED3282E0;
}

+ (id)_msp_testTripSky
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__GEOSharedNavState_Testing___msp_testTripSky__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED3282F8 != -1)
    dispatch_once(&qword_1ED3282F8, block);
  return (id)qword_1ED3282F0;
}

+ (id)_msp_testTripClosedTripInPast
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__GEOSharedNavState_Testing___msp_testTripClosedTripInPast__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED328308 != -1)
    dispatch_once(&qword_1ED328308, block);
  return (id)qword_1ED328300;
}

+ (void)_msp_registerTestTrip:()Testing
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "_msp_testTripsByIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

+ (id)_msp_testTripForIdentifier:()Testing
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_msp_testTripsByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)_msp_blockTestTripWithIdentifier:()Testing
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "_msp_testTripsByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if ((_DWORD)v7)
  {
    objc_msgSend(a1, "_msp_blockedTestTripIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v4);

  }
  return v7;
}

+ (uint64_t)_msp_isTestTripBlockedWithIdentifier:()Testing
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_msp_blockedTestTripIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

+ (id)_msp_testTripsByIdentifier
{
  if (qword_1ED328318 != -1)
    dispatch_once(&qword_1ED328318, &__block_literal_global_1);
  return (id)qword_1ED328310;
}

+ (id)_msp_blockedTestTripIdentifiers
{
  if (qword_1ED328328 != -1)
    dispatch_once(&qword_1ED328328, &__block_literal_global_12);
  return (id)qword_1ED328320;
}

+ (id)preciseSanFrancisco
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0D27330]);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", CFSTR("GC0iI1VuaXRlZCBTdGF0ZXMgTWludCBvZiBTYW4gRnJhbmNpc2NvMtwCWiNVbml0ZWQgU3RhdGVzIE1pbnQgb2YgU2FuIEZyYW5jaXNjb1oOMTU1IEhlcm1hbm4gU3RaHVNhbiBGcmFuY2lzY28sIENBICA5NDEwMi02MTMwWg1Vbml0ZWQgU3RhdGVzevYBCg1Vbml0ZWQgU3RhdGVzEgJVUxoKQ2FsaWZvcm5pYSICQ0EqDVNhbiBGcmFuY2lzY28yDVNhbiBGcmFuY2lzY286BTk0MTAyQgpOb3J0aCBQYXJrUgpIZXJtYW5uIFN0WgMxNTViDjE1NSBIZXJtYW5uIFN0agQ2MTMwciNVbml0ZWQgU3RhdGVzIE1pbnQgb2YgU2FuIEZyYW5jaXNjb4oBDVNhbiBGcmFuY2lzY2+KAQhCYXkgQXJlYYoBDEhheWVzIFZhbGxleYoBD0R1Ym9jZSBUcmlhbmdsZYoBCk5vcnRoIFBhcmuiAQo5NDEwMi02MTMwShIJAxDSrp3iQkARZK2h1F6bXsBYAGISCTbpONCh4kJAEbt3Pwxfm17AcMI7"), 1);
  v2 = (void *)objc_msgSend(v0, "initWithData:", v1);

  return v2;
}

+ (id)preciseChicago
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0D27330]);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", CFSTR("GC0iDFdpbGxpcyBUb3dlciokKZSwoIRn8ERAMfH7kujA6FXAOeL+85mL8ERAQYw0t/ap6FXAMuQBWgxXaWxsaXMgVG93ZXJaDzIzMyBTIFdhY2tlciBEcloXQ2hpY2FnbywgSUwgIDYwNjA2LTYzMDZaDVVuaXRlZCBTdGF0ZXN6mgEKDVVuaXRlZCBTdGF0ZXMSAlVTGghJbGxpbm9pcyICSUwqBENvb2syB0NoaWNhZ286BTYwNjA2QghUaGUgTG9vcFILUyBXYWNrZXIgRHJaAzIzM2IPMjMzIFMgV2Fja2VyIERyagQ2MzA2cgxXaWxsaXMgVG93ZXKKAQdDaGljYWdvigEIVGhlIExvb3CiAQo2MDYwNi02MzA2ShIJIRqCiHnwREARgBL69LPoVcBYBGISCTJrzmZ68ERAEfH7kujA6FXAcMI7"), 1);
  v2 = (void *)objc_msgSend(v0, "initWithData:", v1);

  return v2;
}

@end
