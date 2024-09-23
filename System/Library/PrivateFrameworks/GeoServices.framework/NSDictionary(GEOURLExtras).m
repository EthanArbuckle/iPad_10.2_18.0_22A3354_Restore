@implementation NSDictionary(GEOURLExtras)

- (GEOPlace)_placeOrCurrentLocation:()GEOURLExtras
{
  void *v5;
  GEOPlace *v6;

  if (a3)
    *a3 = 0;
  objc_msgSend(a1, "objectForKey:", CFSTR("currentloc"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 0;
    if (a3)
      *a3 = 1;
  }
  else
  {
    v6 = -[GEOPlace initWithUrlRepresentation:]([GEOPlace alloc], "initWithUrlRepresentation:", a1);
  }
  return v6;
}

@end
