@implementation GEOGuidesTestHelper

- (id)validGuidesHomeResult:(id)a3
{
  id v3;
  GEOPDPlaceResponse *v4;
  GEOGuidesHomeResult *v5;
  id *v6;
  void *v7;
  void *v8;
  GEOGuidesHomeResult *v9;

  v3 = a3;
  v4 = -[GEOPDPlaceResponse initWithJSON:]([GEOPDPlaceResponse alloc], "initWithJSON:", v3);

  v5 = [GEOGuidesHomeResult alloc];
  -[GEOPDPlaceResponse globalResult](v4, "globalResult");
  v6 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceGlobalResult guidesHomeResult](v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceResponse mapsResults](v4, "mapsResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[GEOGuidesHomeResult initWithGuidesHomeFixedSection:mapsResults:](v5, "initWithGuidesHomeFixedSection:mapsResults:", v7, v8);

  return v9;
}

- (id)validCitySelectorResult:(id)a3
{
  id v3;
  GEOPDPlaceResponse *v4;
  GEOAllGuidesLocationsViewResult *v5;
  id *v6;
  void *v7;
  void *v8;
  GEOAllGuidesLocationsViewResult *v9;

  v3 = a3;
  v4 = -[GEOPDPlaceResponse initWithJSON:]([GEOPDPlaceResponse alloc], "initWithJSON:", v3);

  v5 = [GEOAllGuidesLocationsViewResult alloc];
  -[GEOPDPlaceResponse globalResult](v4, "globalResult");
  v6 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceGlobalResult allGuidesLocationsViewresult](v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceResponse mapsResults](v4, "mapsResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[GEOAllGuidesLocationsViewResult initWithAllGuidesLocationsViewResult:mapsResults:](v5, "initWithAllGuidesLocationsViewResult:mapsResults:", v7, v8);

  return v9;
}

@end
