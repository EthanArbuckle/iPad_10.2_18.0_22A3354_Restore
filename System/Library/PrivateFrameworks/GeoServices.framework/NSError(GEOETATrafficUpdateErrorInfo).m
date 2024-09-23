@implementation NSError(GEOETATrafficUpdateErrorInfo)

- (id)_geo_etaTrafficUpdateErrorInfo
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOETATrafficUpdateErrorInfo key](GEOETATrafficUpdateErrorInfo, "key");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
