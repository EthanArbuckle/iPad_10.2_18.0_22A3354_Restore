@implementation HKHealthService

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  int64_t v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v5 = objc_alloc((Class)objc_opt_class());
  v6 = -[HKHealthService type](self, "type");
  -[HKHealthService identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (_QWORD *)objc_msgSend(v5, "initWithType:identifier:name:", v6, v7, 0);

  if (v8)
  {
    -[HKHealthService lastConnection](self, "lastConnection");
    v8[4] = v9;
    -[HKHealthService name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copyWithZone:", a3);
    v12 = (void *)v8[3];
    v8[3] = v11;

    -[HKHealthService identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copyWithZone:", a3);
    v15 = (void *)v8[2];
    v8[2] = v14;

    -[HKHealthService serviceId](self, "serviceId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copyWithZone:", a3);
    v18 = (void *)v8[5];
    v8[5] = v17;

  }
  return v8;
}

- (HKHealthService)init
{
  void *v3;
  HKHealthService *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKHealthService initWithType:identifier:name:](self, "initWithType:identifier:name:", -1, v3, CFSTR("HealthService"));

  return v4;
}

- (HKHealthService)initWithType:(int64_t)a3 identifier:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  HKHealthService *v13;

  v8 = a4;
  v9 = a5;
  if ((unint64_t)a3 >= 4)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise:format:", v11, CFSTR("Invalid HKHealthServiceType %@"), v12);

  }
  v13 = -[HKHealthService _initWithType:identifier:name:serviceId:](self, "_initWithType:identifier:name:serviceId:", a3, v8, v9, 0);

  return v13;
}

- (id)initUnknownServiceWithIdentifier:(id)a3 name:(id)a4 serviceId:(id)a5
{
  return -[HKHealthService _initWithType:identifier:name:serviceId:](self, "_initWithType:identifier:name:serviceId:", -3, a3, a4, a5);
}

- (id)_initWithType:(int64_t)a3 identifier:(id)a4 name:(id)a5 serviceId:(id)a6
{
  id v11;
  __CFString *v12;
  id v13;
  HKHealthService *v14;
  HKHealthService *v15;
  __CFString *v16;
  uint64_t v17;
  NSString *serviceId;
  objc_super v20;

  v11 = a4;
  v12 = (__CFString *)a5;
  v13 = a6;
  if (!v11)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid nil identifier."));
  v20.receiver = self;
  v20.super_class = (Class)HKHealthService;
  v14 = -[HKHealthService init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    objc_storeStrong((id *)&v14->_identifier, a4);
    if (v12)
      v16 = v12;
    else
      v16 = &stru_1E37FD4C0;
    objc_storeStrong((id *)&v15->_name, v16);
    v15->_lastConnection = 0.0;
    v17 = objc_msgSend(v13, "copy");
    serviceId = v15->_serviceId;
    v15->_serviceId = (NSString *)v17;

  }
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  HKHealthService *v4;
  HKHealthService *v5;
  int64_t type;
  int64_t v7;
  char v8;
  char v9;
  NSString *serviceId;
  NSString *v11;
  char v12;

  v4 = (HKHealthService *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      type = self->_type;
      v7 = v5->_type;
      v8 = -[NSUUID isEqual:](self->_identifier, "isEqual:", v5->_identifier);
      if (type == v7)
        v9 = v8;
      else
        v9 = 0;
      serviceId = self->_serviceId;
      if (serviceId)
      {
        v11 = v5->_serviceId;
        if (v11)
        {
          if (serviceId == v11)
            v12 = 1;
          else
            v12 = -[NSString isEqualToString:](serviceId, "isEqualToString:");
          v9 &= v12;
        }
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  return self->_type ^ -[NSUUID hash](self->_identifier, "hash");
}

- (HKHealthService)initWithCoder:(id)a3
{
  id v4;
  HKHealthService *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSUUID *identifier;
  double v10;
  uint64_t v11;
  NSString *serviceId;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKHealthService;
  v5 = -[HKHealthService init](&v14, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HealthServiceType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HealthDeviceName"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HealthDeviceIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v8;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HealthDeviceLastConnection"));
    v5->_lastConnection = v10;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HealthServiceId"));
    v11 = objc_claimAutoreleasedReturnValue();
    serviceId = v5->_serviceId;
    v5->_serviceId = (NSString *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("HealthServiceType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("HealthDeviceName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("HealthDeviceIdentifier"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("HealthDeviceLastConnection"), self->_lastConnection);
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceId, CFSTR("HealthServiceId"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_identifier, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKHealthService localizedHealthServiceType:](HKHealthService, "localizedHealthServiceType:", self->_type);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@: %@ (%@)"), v5, v6, v7, self->_name);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_serviceId)
  {
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" \"%@\"), self->_serviceId);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  return v8;
}

+ (id)localizedHealthServiceType:(int64_t)a3
{
  id result;

  if (a3 <= 100)
  {
    if (a3)
    {
      if (a3 == 1)
      {
        return CFSTR("Fitness Machine");
      }
      else if (a3 == 2)
      {
        return CFSTR("Eurotas");
      }
      else
      {
        return CFSTR("Unknown");
      }
    }
    else
    {
      return CFSTR("Heart Rate Monitor");
    }
  }
  else
  {
    switch(a3)
    {
      case 'e':
        result = CFSTR("Blood Pressure Monitor");
        break;
      case 'f':
        result = CFSTR("Cycling Speed and Cadence");
        break;
      case 'g':
        result = CFSTR("Glucose Monitor");
        break;
      case 'h':
        result = CFSTR("Health Thermometer");
        break;
      default:
        return CFSTR("Unknown");
    }
  }
  return result;
}

- (int64_t)type
{
  return self->_type;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (double)lastConnection
{
  return self->_lastConnection;
}

- (void)setLastConnection:(double)a3
{
  self->_lastConnection = a3;
}

- (NSString)serviceId
{
  return self->_serviceId;
}

- (void)setServiceId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSData)advertisementData
{
  return self->_advertisementData;
}

- (void)setAdvertisementData:(id)a3
{
  objc_storeStrong((id *)&self->_advertisementData, a3);
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
  objc_storeStrong((id *)&self->_peripheral, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong((id *)&self->_advertisementData, 0);
  objc_storeStrong((id *)&self->_serviceId, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
