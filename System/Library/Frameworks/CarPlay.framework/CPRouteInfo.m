@implementation CPRouteInfo

- (CPRouteInfo)initWithRouteGuidance:(id)a3 maneuvers:(id)a4 laneGuidances:(id)a5
{
  id v8;
  id v9;
  id v10;
  CPRouteInfo *v11;
  uint64_t v12;
  CPRouteGuidance *routeGuidance;
  uint64_t v14;
  NSArray *maneuvers;
  uint64_t v16;
  NSArray *laneGuidances;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CPRouteInfo;
  v11 = -[CPRouteInfo init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    routeGuidance = v11->_routeGuidance;
    v11->_routeGuidance = (CPRouteGuidance *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", v9, 1);
    maneuvers = v11->_maneuvers;
    v11->_maneuvers = (NSArray *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", v10, 1);
    laneGuidances = v11->_laneGuidances;
    v11->_laneGuidances = (NSArray *)v16;

  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPRouteInfo)initWithCoder:(id)a3
{
  id v4;
  CPRouteInfo *v5;
  void *v6;
  uint64_t v7;
  CPRouteGuidance *routeGuidance;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *maneuvers;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *laneGuidances;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CPRouteInfo;
  v5 = -[CPRouteInfo init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("kCPRouteInfoRouteGuidanceKey"));
    v7 = objc_claimAutoreleasedReturnValue();
    routeGuidance = v5->_routeGuidance;
    v5->_routeGuidance = (CPRouteGuidance *)v7;

    v9 = (void *)MEMORY[0x24BDBCF20];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("kCPRouteInfoManeuversKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    maneuvers = v5->_maneuvers;
    v5->_maneuvers = (NSArray *)v12;

    v14 = (void *)MEMORY[0x24BDBCF20];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("kCPRouteInfoLaneGuidancesKey"));
    v17 = objc_claimAutoreleasedReturnValue();
    laneGuidances = v5->_laneGuidances;
    v5->_laneGuidances = (NSArray *)v17;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CPRouteInfo routeGuidance](self, "routeGuidance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCPRouteInfoRouteGuidanceKey"));

  -[CPRouteInfo maneuvers](self, "maneuvers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCPRouteInfoManeuversKey"));

  -[CPRouteInfo laneGuidances](self, "laneGuidances");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kCPRouteInfoLaneGuidancesKey"));

}

- (NSArray)maneuvers
{
  return self->_maneuvers;
}

- (NSArray)laneGuidances
{
  return self->_laneGuidances;
}

- (CPRouteGuidance)routeGuidance
{
  return self->_routeGuidance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeGuidance, 0);
  objc_storeStrong((id *)&self->_laneGuidances, 0);
  objc_storeStrong((id *)&self->_maneuvers, 0);
}

@end
