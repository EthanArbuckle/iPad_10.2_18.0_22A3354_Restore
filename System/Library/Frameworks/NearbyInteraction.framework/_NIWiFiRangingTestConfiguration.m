@implementation _NIWiFiRangingTestConfiguration

- (_NIWiFiRangingTestConfiguration)initWithDiscoveryToken:(id)a3 wifiRangingParameters:(id)a4 regions:(id)a5
{
  id v9;
  id v10;
  id v11;
  id *v12;
  _NIWiFiRangingTestConfiguration *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_NIWiFiRangingTestConfiguration;
  v12 = -[NIConfiguration initInternal](&v15, sel_initInternal);
  v13 = (_NIWiFiRangingTestConfiguration *)v12;
  if (v12)
  {
    objc_storeStrong(v12 + 4, a3);
    objc_storeStrong((id *)&v13->_parameters, a4);
    objc_storeStrong((id *)&v13->_monitoredRegions, a5);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_NIWiFiRangingTestConfiguration;
  v5 = -[NIConfiguration copyWithZone:](&v13, sel_copyWithZone_);
  v6 = -[NIDiscoveryToken copyWithZone:](self->_peerDiscoveryToken, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  if (self->_parameters)
  {
    v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "allocWithZone:", a3), "initWithDictionary:copyItems:", self->_parameters, 1);
    v9 = (void *)v5[5];
    v5[5] = v8;

  }
  if (self->_monitoredRegions)
  {
    v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "allocWithZone:", a3), "initWithArray:copyItems:", self->_monitoredRegions, 1);
    v11 = (void *)v5[6];
    v5[6] = v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_NIWiFiRangingTestConfiguration;
  -[NIConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_peerDiscoveryToken, CFSTR("peerDiscoveryToken"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_parameters, CFSTR("parameters"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_monitoredRegions, CFSTR("monitoredRegions"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NIWiFiRangingTestConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _NIWiFiRangingTestConfiguration *v14;
  uint64_t v15;
  NIDiscoveryToken *peerDiscoveryToken;
  uint64_t v17;
  NSDictionary *parameters;
  objc_super v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E60];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("monitoredRegions"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v20.receiver = self;
  v20.super_class = (Class)_NIWiFiRangingTestConfiguration;
  v14 = -[NIConfiguration initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v14)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peerDiscoveryToken"));
    v15 = objc_claimAutoreleasedReturnValue();
    peerDiscoveryToken = v14->_peerDiscoveryToken;
    v14->_peerDiscoveryToken = (NIDiscoveryToken *)v15;

    objc_msgSend(v4, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v5, v9, CFSTR("parameters"));
    v17 = objc_claimAutoreleasedReturnValue();
    parameters = v14->_parameters;
    v14->_parameters = (NSDictionary *)v17;

    objc_storeStrong((id *)&v14->_monitoredRegions, v13);
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _NIWiFiRangingTestConfiguration *v5;
  _NIWiFiRangingTestConfiguration *v6;
  NSDictionary *parameters;
  void *v8;
  NIDiscoveryToken *peerDiscoveryToken;
  void *v10;
  NSArray *monitoredRegions;
  void *v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (_NIWiFiRangingTestConfiguration *)v4;
    v6 = v5;
    if (v5 == self)
    {
      v13 = 1;
    }
    else
    {
      parameters = self->_parameters;
      -[_NIWiFiRangingTestConfiguration parameters](v5, "parameters");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSDictionary isEqual:](parameters, "isEqual:", v8))
      {
        peerDiscoveryToken = self->_peerDiscoveryToken;
        -[_NIWiFiRangingTestConfiguration peerDiscoveryToken](v6, "peerDiscoveryToken");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NIDiscoveryToken isEqual:](peerDiscoveryToken, "isEqual:", v10))
        {
          monitoredRegions = self->_monitoredRegions;
          -[_NIWiFiRangingTestConfiguration monitoredRegions](v6, "monitoredRegions");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[NSArray isEqual:](monitoredRegions, "isEqual:", v12);

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[NIDiscoveryToken hash](self->_peerDiscoveryToken, "hash");
  return -[NSDictionary hash](self->_parameters, "hash") ^ v3;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NIWiFiRangingTestConfiguration descriptionInternal](self, "descriptionInternal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v5, v6);

  return v7;
}

- (id)descriptionInternal
{
  void *v3;
  NIDiscoveryToken *peerDiscoveryToken;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E4363DF8);
  peerDiscoveryToken = self->_peerDiscoveryToken;
  if (peerDiscoveryToken)
  {
    -[NIDiscoveryToken descriptionInternal](peerDiscoveryToken, "descriptionInternal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("Peer Token: %@"), v5);

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("Peer Token: null"));
  }
  objc_msgSend(v3, "appendFormat:", CFSTR(", WiFi Ranging Parameters: %@"), self->_parameters);
  objc_msgSend(v3, "appendFormat:", CFSTR(", Regions: %@"), self->_monitoredRegions);
  return v3;
}

- (NIDiscoveryToken)peerDiscoveryToken
{
  return self->_peerDiscoveryToken;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (NSArray)monitoredRegions
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMonitoredRegions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoredRegions, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_peerDiscoveryToken, 0);
}

@end
