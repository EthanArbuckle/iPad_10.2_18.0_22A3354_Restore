@implementation FMDAVRoute

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAVRoute routeID](self, "routeID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAVRoute routeType](self, "routeType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAVRoute routeSubType](self, "routeSubType"));
  v6 = -[FMDAVRoute currentlyPicked](self, "currentlyPicked");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Route ID: %@, Type: %@, Subtype: %@, CurrentlyPicked:%@"), v3, v4, v5, v7));

  return v8;
}

- (NSString)routeID
{
  return self->_routeID;
}

- (void)setRouteID:(id)a3
{
  objc_storeStrong((id *)&self->_routeID, a3);
}

- (NSString)routeType
{
  return self->_routeType;
}

- (void)setRouteType:(id)a3
{
  objc_storeStrong((id *)&self->_routeType, a3);
}

- (NSString)routeSubType
{
  return self->_routeSubType;
}

- (void)setRouteSubType:(id)a3
{
  objc_storeStrong((id *)&self->_routeSubType, a3);
}

- (BOOL)currentlyPicked
{
  return self->_currentlyPicked;
}

- (void)setCurrentlyPicked:(BOOL)a3
{
  self->_currentlyPicked = a3;
}

- (NSDictionary)rawRouteInfo
{
  return self->_rawRouteInfo;
}

- (void)setRawRouteInfo:(id)a3
{
  objc_storeStrong((id *)&self->_rawRouteInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawRouteInfo, 0);
  objc_storeStrong((id *)&self->_routeSubType, 0);
  objc_storeStrong((id *)&self->_routeType, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
}

@end
