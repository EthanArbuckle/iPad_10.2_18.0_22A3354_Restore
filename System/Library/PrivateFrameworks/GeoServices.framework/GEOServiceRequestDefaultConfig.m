@implementation GEOServiceRequestDefaultConfig

- (id)debugRequestName
{
  return GEOURLLogFacility(-[GEOServiceRequestDefaultConfig urlType](self, "urlType"));
}

- (id)additionalURLQueryItems
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (unint64_t)urlType
{
  return 66;
}

- (id)additionalHTTPHeaders
{
  return 0;
}

- (id)serviceTypeNumber
{
  return 0;
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($C4D369C9F02205611300857CFD58F739)0;
}

- (BOOL)supportsOffline
{
  return 0;
}

@end
