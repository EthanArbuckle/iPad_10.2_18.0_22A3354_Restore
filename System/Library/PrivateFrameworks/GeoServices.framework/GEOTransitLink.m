@implementation GEOTransitLink

- (id)init:(void *)a3 withVectorTile:(id)a4
{
  id v6;
  GEOTransitLink *v7;
  GEOTransitLink *v8;
  objc_super v10;

  v6 = a4;
  if (a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOTransitLink;
    v7 = -[GEOTransitLink init](&v10, sel_init);
    v8 = v7;
    if (v7)
    {
      v7->_transitLink = a3;
      objc_storeWeak((id *)&v7->_containingTile, v6);
    }
    self = v8;
    a3 = self;
  }

  return a3;
}

- (void)get
{
  return self->_transitLink;
}

- (GEOVectorTile)containingTile
{
  return (GEOVectorTile *)objc_loadWeakRetained((id *)&self->_containingTile);
}

- (unsigned)sectionOffset
{
  _DWORD *transitLink;

  transitLink = self->_transitLink;
  if (transitLink)
    return transitLink[4];
  else
    return 0;
}

- (unsigned)sectionCount
{
  _DWORD *transitLink;

  transitLink = self->_transitLink;
  if (transitLink)
    return transitLink[5];
  else
    return 0;
}

- (GeoCodecsRange)transitIndexRange
{
  char *transitLink;

  transitLink = (char *)self->_transitLink;
  if (transitLink)
    return (GeoCodecsRange *)(transitLink + 24);
  else
    return 0;
}

- (GeoCodecsConnectivityJunction)fromJunction
{
  void *transitLink;

  transitLink = self->_transitLink;
  if (transitLink)
    return (GeoCodecsConnectivityJunction *)*((_QWORD *)transitLink + 5);
  else
    return 0;
}

- (GeoCodecsConnectivityJunction)toJunction
{
  void *transitLink;

  transitLink = self->_transitLink;
  if (transitLink)
    return (GeoCodecsConnectivityJunction *)*((_QWORD *)transitLink + 6);
  else
    return 0;
}

- (unint64_t)fromNodeID
{
  _QWORD *transitLink;

  transitLink = self->_transitLink;
  if (transitLink)
    return transitLink[7];
  else
    return 0;
}

- (unint64_t)toNodeID
{
  _QWORD *transitLink;

  transitLink = self->_transitLink;
  if (transitLink)
    return transitLink[8];
  else
    return 0;
}

- (GeoCodecsRange)travelTimeIndexRange
{
  char *transitLink;

  transitLink = (char *)self->_transitLink;
  if (transitLink)
    return (GeoCodecsRange *)(transitLink + 72);
  else
    return 0;
}

- (GeoCodecsRange)shieldIndexRange
{
  char *transitLink;

  transitLink = (char *)self->_transitLink;
  if (transitLink)
    return (GeoCodecsRange *)(transitLink + 88);
  else
    return 0;
}

- (GeoCodecsRange)originalNodeIDPointerIndexRange
{
  char *transitLink;

  transitLink = (char *)self->_transitLink;
  if (transitLink)
    return (GeoCodecsRange *)(transitLink + 104);
  else
    return 0;
}

- (GeoCodecsRange)collapsedNodesIndexRange
{
  char *transitLink;

  transitLink = (char *)self->_transitLink;
  if (transitLink)
    return (GeoCodecsRange *)(transitLink + 120);
  else
    return 0;
}

- (GeoCodecsRange)collapsedNodesIDRange
{
  char *transitLink;

  transitLink = (char *)self->_transitLink;
  if (transitLink)
    return (GeoCodecsRange *)(transitLink + 152);
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containingTile);
}

@end
