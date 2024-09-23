@implementation CTDataConnectionStatus

- (CTDataConnectionStatus)initWithCoder:(id)a3
{
  id v4;
  CTDataConnectionStatus *v5;
  uint64_t v6;
  NSNumber *pdp;
  uint64_t v8;
  NSString *interfaceName;
  uint64_t v10;
  NSString *apnName;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *qosFlows;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *trafficDescriptors;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CTDataConnectionStatus;
  v5 = -[CTDataConnectionStatus init](&v23, sel_init);
  if (v5)
  {
    v5->_suspended = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("suspended"));
    v5->_publicNetAllowed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pubNet"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pdp"));
    v6 = objc_claimAutoreleasedReturnValue();
    pdp = v5->_pdp;
    v5->_pdp = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interfaceName"));
    v8 = objc_claimAutoreleasedReturnValue();
    interfaceName = v5->_interfaceName;
    v5->_interfaceName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("apnName"));
    v10 = objc_claimAutoreleasedReturnValue();
    apnName = v5->_apnName;
    v5->_apnName = (NSString *)v10;

    v5->_wirelessTechnologyMask = objc_msgSend(v4, "decodeIntForKey:", CFSTR("wt"));
    v5->_state = objc_msgSend(v4, "decodeIntForKey:", CFSTR("state"));
    v5->_ipFamily = objc_msgSend(v4, "decodeIntForKey:", CFSTR("ipFamily"));
    v5->_contextType = objc_msgSend(v4, "decodeIntForKey:", CFSTR("contextType"));
    v5->_transportType = objc_msgSend(v4, "decodeIntForKey:", CFSTR("transportType"));
    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("qosFlows"));
    v15 = objc_claimAutoreleasedReturnValue();
    qosFlows = v5->_qosFlows;
    v5->_qosFlows = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("trafficDescriptors"));
    v20 = objc_claimAutoreleasedReturnValue();
    trafficDescriptors = v5->_trafficDescriptors;
    v5->_trafficDescriptors = (NSArray *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "encodeBool:forKey:", -[CTDataConnectionStatus suspended](self, "suspended"), CFSTR("suspended"));
  objc_msgSend(v11, "encodeBool:forKey:", -[CTDataConnectionStatus publicNetAllowed](self, "publicNetAllowed"), CFSTR("pubNet"));
  -[CTDataConnectionStatus pdp](self, "pdp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("pdp"));

  -[CTDataConnectionStatus interfaceName](self, "interfaceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("interfaceName"));

  -[CTDataConnectionStatus apnName](self, "apnName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("apnName"));

  objc_msgSend(v11, "encodeInt:forKey:", -[CTDataConnectionStatus wirelessTechnologyMask](self, "wirelessTechnologyMask"), CFSTR("wt"));
  objc_msgSend(v11, "encodeInt:forKey:", -[CTDataConnectionStatus state](self, "state"), CFSTR("state"));
  objc_msgSend(v11, "encodeInt:forKey:", -[CTDataConnectionStatus ipFamily](self, "ipFamily"), CFSTR("ipFamily"));
  objc_msgSend(v11, "encodeInt:forKey:", -[CTDataConnectionStatus contextType](self, "contextType"), CFSTR("contextType"));
  objc_msgSend(v11, "encodeInt:forKey:", -[CTDataConnectionStatus transportType](self, "transportType"), CFSTR("transportType"));
  -[CTDataConnectionStatus qosFlows](self, "qosFlows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CTDataConnectionStatus qosFlows](self, "qosFlows");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("qosFlows"));

  }
  -[CTDataConnectionStatus trafficDescriptors](self, "trafficDescriptors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CTDataConnectionStatus trafficDescriptors](self, "trafficDescriptors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("trafficDescriptors"));

  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTDataConnectionStatus pdp](self, "pdp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", pdp=%@"), v4);

  -[CTDataConnectionStatus interfaceName](self, "interfaceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", interfaceName=%@"), v5);

  -[CTDataConnectionStatus apnName](self, "apnName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", apnName=%@"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR(", wirelessTechnologyMask=%d"), -[CTDataConnectionStatus wirelessTechnologyMask](self, "wirelessTechnologyMask"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", state=%d"), -[CTDataConnectionStatus state](self, "state"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", ipFamily=%d"), -[CTDataConnectionStatus ipFamily](self, "ipFamily"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", suspended=%d"), -[CTDataConnectionStatus suspended](self, "suspended"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", publicNetAllowed=%d"), -[CTDataConnectionStatus publicNetAllowed](self, "publicNetAllowed"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", contextType=%d"), -[CTDataConnectionStatus contextType](self, "contextType"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", transportType=%d"), -[CTDataConnectionStatus transportType](self, "transportType"));
  -[CTDataConnectionStatus qosFlows](self, "qosFlows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CTDataConnectionStatus qosFlows](self, "qosFlows");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", qosFlows=[%@]"), v8);

  }
  -[CTDataConnectionStatus trafficDescriptors](self, "trafficDescriptors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CTDataConnectionStatus trafficDescriptors](self, "trafficDescriptors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", trafficDescriptors=[%@]"), v10);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (int)state
{
  return self->_state;
}

- (unsigned)wirelessTechnologyMask
{
  return self->_wirelessTechnologyMask;
}

- (int)transportType
{
  return self->_transportType;
}

- (NSArray)trafficDescriptors
{
  return self->_trafficDescriptors;
}

- (BOOL)suspended
{
  return self->_suspended;
}

- (NSArray)qosFlows
{
  return self->_qosFlows;
}

- (BOOL)publicNetAllowed
{
  return self->_publicNetAllowed;
}

- (NSNumber)pdp
{
  return self->_pdp;
}

- (int)ipFamily
{
  return self->_ipFamily;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (int)contextType
{
  return self->_contextType;
}

- (NSString)apnName
{
  return self->_apnName;
}

- (void)setIpFamily:(int)a3
{
  self->_ipFamily = a3;
}

- (void)setWirelessTechnologyMask:(unsigned int)a3
{
  self->_wirelessTechnologyMask = a3;
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (void)setPublicNetAllowed:(BOOL)a3
{
  self->_publicNetAllowed = a3;
}

- (void)setContextType:(int)a3
{
  self->_contextType = a3;
}

- (void)setTrafficDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_trafficDescriptors, a3);
}

- (void)setQosFlows:(id)a3
{
  objc_storeStrong((id *)&self->_qosFlows, a3);
}

- (void)setPdp:(id)a3
{
  objc_storeStrong((id *)&self->_pdp, a3);
}

- (void)setInterfaceName:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceName, a3);
}

- (void)setApnName:(id)a3
{
  objc_storeStrong((id *)&self->_apnName, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficDescriptors, 0);
  objc_storeStrong((id *)&self->_qosFlows, 0);
  objc_storeStrong((id *)&self->_apnName, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_pdp, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTDataConnectionStatus pdp](self, "pdp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setPdp:", v6);

  -[CTDataConnectionStatus interfaceName](self, "interfaceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setInterfaceName:", v8);

  -[CTDataConnectionStatus apnName](self, "apnName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setApnName:", v10);

  objc_msgSend(v4, "setWirelessTechnologyMask:", -[CTDataConnectionStatus wirelessTechnologyMask](self, "wirelessTechnologyMask"));
  objc_msgSend(v4, "setState:", -[CTDataConnectionStatus state](self, "state"));
  objc_msgSend(v4, "setIpFamily:", -[CTDataConnectionStatus ipFamily](self, "ipFamily"));
  objc_msgSend(v4, "setSuspended:", -[CTDataConnectionStatus suspended](self, "suspended"));
  objc_msgSend(v4, "setPublicNetAllowed:", -[CTDataConnectionStatus publicNetAllowed](self, "publicNetAllowed"));
  objc_msgSend(v4, "setContextType:", -[CTDataConnectionStatus contextType](self, "contextType"));
  objc_msgSend(v4, "setTransportType:", -[CTDataConnectionStatus transportType](self, "transportType"));
  -[CTDataConnectionStatus qosFlows](self, "qosFlows");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CTDataConnectionStatus qosFlows](self, "qosFlows");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v4, "setQosFlows:", v13);

  }
  -[CTDataConnectionStatus trafficDescriptors](self, "trafficDescriptors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[CTDataConnectionStatus trafficDescriptors](self, "trafficDescriptors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v4, "setTrafficDescriptors:", v16);

  }
  return v4;
}

@end
