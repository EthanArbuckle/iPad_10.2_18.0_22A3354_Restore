@implementation CPTrip

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPTrip)init
{
  void *v3;
  void *v4;
  CPTrip *v5;

  objc_msgSend(MEMORY[0x24BDDB0F0], "mapItemForCurrentLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDB0F0], "mapItemForCurrentLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CPTrip initWithOrigin:destination:routeChoices:](self, "initWithOrigin:destination:routeChoices:", v3, v4, MEMORY[0x24BDBD1A8]);

  return v5;
}

- (CPTrip)initWithOrigin:(MKMapItem *)origin destination:(MKMapItem *)destination routeChoices:(NSArray *)routeChoices
{
  MKMapItem *v9;
  MKMapItem *v10;
  NSArray *v11;
  CPTrip *v12;
  uint64_t v13;
  NSUUID *identifier;
  uint64_t v15;
  NSArray *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *destinationNameVariants;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v9 = origin;
  v10 = destination;
  v11 = routeChoices;
  v22.receiver = self;
  v22.super_class = (Class)CPTrip;
  v12 = -[CPTrip init](&v22, sel_init);
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v13 = objc_claimAutoreleasedReturnValue();
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v13;

    objc_storeStrong((id *)&v12->_origin, origin);
    objc_storeStrong((id *)&v12->_destination, destination);
    v15 = -[NSArray copy](v11, "copy");
    v16 = v12->_routeChoices;
    v12->_routeChoices = (NSArray *)v15;

    -[MKMapItem name](v10, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[MKMapItem name](v10, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v18;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
      v19 = objc_claimAutoreleasedReturnValue();
      destinationNameVariants = v12->_destinationNameVariants;
      v12->_destinationNameVariants = (NSArray *)v19;

    }
  }

  return v12;
}

- (CPTrip)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CPTrip *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPTripOriginKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPTripDestinationKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("kCPTripRouteChoicesKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[CPTrip initWithOrigin:destination:routeChoices:](self, "initWithOrigin:destination:routeChoices:", v6, v7, v11);
  -[CPTrip setIdentifier:](v12, "setIdentifier:", v5);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v4 = a3;
  -[CPTrip identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCPIdentifierKey"));

  -[CPTrip origin](self, "origin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "placemark");
  v26 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "postalAddress");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBFAC8];
  objc_msgSend(v26, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "placemarkWithLocation:name:postalAddress:", v8, v9, v25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x24BDDB0F0]);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB160]), "initWithPlacemark:", v10);
  v13 = (void *)objc_msgSend(v11, "initWithPlacemark:", v12);

  -[CPTrip destination](self, "destination");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "placemark");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "postalAddress");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDBFAC8];
  objc_msgSend(v15, "location");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "placemarkWithLocation:name:postalAddress:", v18, v19, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_alloc(MEMORY[0x24BDDB0F0]);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB160]), "initWithPlacemark:", v20);
  v23 = (void *)objc_msgSend(v21, "initWithPlacemark:", v22);

  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("kCPTripOriginKey"));
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("kCPTripDestinationKey"));
  -[CPTrip routeChoices](self, "routeChoices");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("kCPTripRouteChoicesKey"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)CPTrip;
  -[CPTrip description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {origin: %@, destination: %@, routeChoices: %@}"), v4, self->_origin, self->_destination, self->_routeChoices);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (signed)destinationTimeZoneOffsetFromGMT
{
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  int v6;

  -[CPTrip destination](self, "destination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "secondsFromGMT");
  v5 = ((unsigned __int128)(v4 * (__int128)(uint64_t)0x8888888888888889) >> 64) + v4;
  v6 = (v5 >> 63) + (v5 >> 5);

  return v6;
}

- (MKMapItem)origin
{
  return self->_origin;
}

- (MKMapItem)destination
{
  return self->_destination;
}

- (NSArray)routeChoices
{
  return self->_routeChoices;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)userInfo
{
  objc_storeStrong(&self->_userInfo, userInfo);
}

- (NSArray)destinationNameVariants
{
  return self->_destinationNameVariants;
}

- (void)setDestinationNameVariants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (BOOL)sendsNavigationMetadata
{
  return self->_sendsNavigationMetadata;
}

- (void)setSendsNavigationMetadata:(BOOL)a3
{
  self->_sendsNavigationMetadata = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_destinationNameVariants, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_routeChoices, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_origin, 0);
}

@end
