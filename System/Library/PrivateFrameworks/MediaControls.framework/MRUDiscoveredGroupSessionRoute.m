@implementation MRUDiscoveredGroupSessionRoute

- (MRUDiscoveredGroupSessionRoute)initWithDiscoveredGroupSession:(id)a3
{
  id v5;
  MRUDiscoveredGroupSessionRoute *v6;
  MRUDiscoveredGroupSessionRoute *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUDiscoveredGroupSessionRoute;
  v6 = -[MRUDiscoveredGroupSessionRoute init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_discoveredGroupSession, a3);

  return v7;
}

- (id)routeName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MRDiscoveredGroupSession hostInfo](self->_discoveredGroupSession, "hostInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDiscoveredGroupSession hostInfo](self->_discoveredGroupSession, "hostInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "routeType");
  MRGroupSessionRouteMakeName();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)routeUID
{
  return (id)-[MRDiscoveredGroupSession identifier](self->_discoveredGroupSession, "identifier");
}

- (int64_t)routeType
{
  return 0;
}

- (int64_t)routeSubtype
{
  void *v2;
  unsigned int v3;
  int64_t v4;

  -[MRDiscoveredGroupSession hostInfo](self->_discoveredGroupSession, "hostInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "routeType") - 1;
  if (v3 > 0xA)
    v4 = 1;
  else
    v4 = qword_1AAAD5DC8[(char)v3];

  return v4;
}

- (BOOL)isHomePodRoute
{
  void *v2;
  char v3;

  -[MRDiscoveredGroupSession hostInfo](self->_discoveredGroupSession, "hostInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "routeType");

  return (v3 & 0xFE) == 8;
}

- (BOOL)isB520Route
{
  void *v2;
  BOOL v3;

  -[MRDiscoveredGroupSession hostInfo](self->_discoveredGroupSession, "hostInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "routeType") == 9;

  return v3;
}

- (BOOL)isPicked
{
  return 0;
}

- (BOOL)isPickable
{
  return 1;
}

- (BOOL)isPhoneRoute
{
  return 0;
}

- (MRDiscoveredGroupSession)discoveredGroupSession
{
  return self->_discoveredGroupSession;
}

- (void)setDiscoveredGroupSession:(id)a3
{
  objc_storeStrong((id *)&self->_discoveredGroupSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveredGroupSession, 0);
}

@end
