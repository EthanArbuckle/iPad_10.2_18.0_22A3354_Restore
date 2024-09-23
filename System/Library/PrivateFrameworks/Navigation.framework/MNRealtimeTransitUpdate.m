@implementation MNRealtimeTransitUpdate

- (MNRealtimeTransitUpdate)initWithTransitRouteUpdate:(id)a3
{
  id v5;
  MNRealtimeTransitUpdate *v6;
  MNRealtimeTransitUpdate *v7;
  MNRealtimeTransitUpdate *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNRealtimeTransitUpdate;
  v6 = -[MNRealtimeTransitUpdate init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transitUpdate, a3);
    v8 = v7;
  }

  return v7;
}

- (id)routeID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3A28];
  -[GEOTransitRouteUpdate routeIdentifier](self->_transitUpdate, "routeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientRouteHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_maps_UUIDWithData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  GEOTransitRouteUpdate *transitUpdate;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MNRealtimeTransitUpdate;
  -[MNRealtimeUpdate encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  transitUpdate = self->_transitUpdate;
  if (transitUpdate)
    objc_msgSend(v4, "encodeObject:forKey:", transitUpdate, CFSTR("transitUpdate"));

}

- (MNRealtimeTransitUpdate)initWithCoder:(id)a3
{
  id v4;
  MNRealtimeTransitUpdate *v5;
  uint64_t v6;
  GEOTransitRouteUpdate *transitUpdate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MNRealtimeTransitUpdate;
  v5 = -[MNRealtimeUpdate initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transitUpdate"));
    v6 = objc_claimAutoreleasedReturnValue();
    transitUpdate = v5->_transitUpdate;
    v5->_transitUpdate = (GEOTransitRouteUpdate *)v6;

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MNRealtimeTransitUpdate: %p with transitUpdate %@"), self, self->_transitUpdate);
}

- (GEOTransitRouteUpdate)transitUpdate
{
  return self->_transitUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitUpdate, 0);
}

@end
