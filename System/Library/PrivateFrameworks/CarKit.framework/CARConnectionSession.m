@implementation CARConnectionSession

- (CARConnectionSession)initWithEvents:(id)a3 sessionIdentifier:(id)a4 vehicleInformation:(id)a5
{
  id v9;
  id v10;
  id v11;
  CARConnectionSession *v12;
  CARConnectionSession *v13;
  uint64_t v14;
  NSString *transportType;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CARConnectionSession;
  v12 = -[CARConnectionSession init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_events, a3);
    objc_storeStrong((id *)&v13->_sessionIdentifier, a4);
    objc_storeStrong((id *)&v13->_vehicleInformation, a5);
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("transportType"));
    v14 = objc_claimAutoreleasedReturnValue();
    transportType = v13->_transportType;
    v13->_transportType = (NSString *)v14;

  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CARConnectionSession)initWithCoder:(id)a3
{
  id v4;
  CARConnectionSession *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *events;
  uint64_t v11;
  NSUUID *sessionIdentifier;
  uint64_t v13;
  NSString *transportType;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSDictionary *vehicleInformation;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CARConnectionSession;
  v5 = -[CARConnectionSession init](&v23, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kCPSessionEventsKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    events = v5->_events;
    v5->_events = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPSessionIdentifierKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSUUID *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPSessionTransportTypeKey"));
    v13 = objc_claimAutoreleasedReturnValue();
    transportType = v5->_transportType;
    v5->_transportType = (NSString *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, v17, v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("kCPSessionVehicleInformationKey"));
    v20 = objc_claimAutoreleasedReturnValue();
    vehicleInformation = v5->_vehicleInformation;
    v5->_vehicleInformation = (NSDictionary *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CARConnectionSession events](self, "events");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCPSessionEventsKey"));

  -[CARConnectionSession sessionIdentifier](self, "sessionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCPSessionIdentifierKey"));

  -[CARConnectionSession transportType](self, "transportType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kCPSessionTransportTypeKey"));

  -[CARConnectionSession vehicleInformation](self, "vehicleInformation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kCPSessionVehicleInformationKey"));

}

- (id)allEventsOfTypes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  -[CARConnectionSession events](self, "events");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3880];

  objc_msgSend(v7, "predicateWithFormat:", CFSTR("%@ CONTAINS eventType"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSArray)events
{
  return self->_events;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSString)transportType
{
  return self->_transportType;
}

- (NSDictionary)vehicleInformation
{
  return self->_vehicleInformation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleInformation, 0);
  objc_storeStrong((id *)&self->_transportType, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end
