@implementation GEORouteInitializerData

MNActiveRouteInfo *__50__GEORouteInitializerData_MNExtras__allRouteInfos__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MNActiveRouteInfo *v3;

  v2 = a2;
  v3 = -[MNActiveRouteInfo initWithRoute:]([MNActiveRouteInfo alloc], "initWithRoute:", v2);

  return v3;
}

MNActiveRouteInfo *__63__GEORouteInitializerData_MNExtras__allETAUAlternateRouteInfos__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  MNActiveRouteInfo *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;

  v3 = a2;
  v4 = -[MNActiveRouteInfo initWithRoute:]([MNActiveRouteInfo alloc], "initWithRoute:", v3);
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "newWaypointRoutes");
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    while (1)
    {
      v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "newWaypointRoutes");
      objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "geoWaypointRoute");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 == v9)
        break;

      ++v7;
      v11 = (void *)objc_msgSend(*(id *)(a1 + 32), "newWaypointRoutes");
      v12 = objc_msgSend(v11, "count");

      if (v7 >= v12)
        goto LABEL_7;
    }
    -[MNActiveRouteInfo setAlternateRouteIndex:](v4, "setAlternateRouteIndex:", v7);

  }
LABEL_7:

  return v4;
}

@end
