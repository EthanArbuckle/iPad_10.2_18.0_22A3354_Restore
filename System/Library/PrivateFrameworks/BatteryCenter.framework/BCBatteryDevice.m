@implementation BCBatteryDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)batteryDeviceWithIdentifier:(id)a3 vendor:(int64_t)a4 productIdentifier:(int64_t)a5 parts:(unint64_t)a6 matchIdentifier:(id)a7
{
  id v12;
  id v13;
  void *v14;

  v12 = a7;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:vendor:productIdentifier:parts:matchIdentifier:", v13, a4, a5, a6, v12);

  return v14;
}

- (BCBatteryDevice)initWithIdentifier:(id)a3 vendor:(int64_t)a4 productIdentifier:(int64_t)a5 parts:(unint64_t)a6 matchIdentifier:(id)a7
{
  id v12;
  id v13;
  BCBatteryDevice *v14;
  uint64_t v15;
  NSString *identifier;
  uint64_t v17;
  NSString *matchIdentifier;
  objc_super v20;

  v12 = a3;
  v13 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BCBatteryDevice;
  v14 = -[BCBatteryDevice init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    v14->_vendor = a4;
    v14->_productIdentifier = a5;
    v14->_parts = a6;
    v17 = objc_msgSend(v13, "copy");
    matchIdentifier = v14->_matchIdentifier;
    v14->_matchIdentifier = (NSString *)v17;

  }
  return v14;
}

- (BCBatteryDevice)initWithCoder:(id)a3
{
  id v3;
  BCBatteryDevice *v4;
  void *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  uint64_t v9;
  NSString *matchIdentifier;
  void *v11;
  uint64_t v12;
  NSString *name;
  void *v14;
  uint64_t v15;
  NSString *groupName;
  void *v17;
  uint64_t v18;
  NSString *accessoryIdentifier;
  uint64_t v20;
  NSString *modelNumber;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)BCBatteryDevice;
  v3 = a3;
  v4 = -[BCBatteryDevice init](&v23, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"), v23.receiver, v23.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v6;

  v4->_vendor = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("vendor"));
  v4->_productIdentifier = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("productIdentifier"));
  v4->_parts = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("parts"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("matchIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  matchIdentifier = v4->_matchIdentifier;
  v4->_matchIdentifier = (NSString *)v9;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  name = v4->_name;
  v4->_name = (NSString *)v12;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "copy");
  groupName = v4->_groupName;
  v4->_groupName = (NSString *)v15;

  v4->_percentCharge = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("percentCharge"));
  v4->_connected = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("connected"));
  v4->_charging = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("charging"));
  v4->_internal = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("internal"));
  v4->_powerSource = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("powerSource"));
  v4->_powerSourceState = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("powerSourceState"));
  v4->_approximatesPercentCharge = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("approximatesPercentCharge"));
  v4->_transportType = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("transportType"));
  v4->_fake = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("fake"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "copy");
  accessoryIdentifier = v4->_accessoryIdentifier;
  v4->_accessoryIdentifier = (NSString *)v18;

  v4->_accessoryCategory = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("accessoryCategory"));
  v4->_wirelesslyCharging = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("wirelesslyCharging"));
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("modelNumber"));
  v20 = objc_claimAutoreleasedReturnValue();

  modelNumber = v4->_modelNumber;
  v4->_modelNumber = (NSString *)v20;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t vendor;
  int64_t productIdentifier;
  unint64_t parts;
  int64_t percentCharge;
  int64_t powerSourceState;
  int64_t transportType;
  unint64_t accessoryCategory;
  NSUInteger v11;
  void *v12;
  id v13;

  v13 = a3;
  if (-[NSString length](self->_identifier, "length"))
    objc_msgSend(v13, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  vendor = self->_vendor;
  if (vendor)
    objc_msgSend(v13, "encodeInteger:forKey:", vendor, CFSTR("vendor"));
  productIdentifier = self->_productIdentifier;
  if (productIdentifier)
    objc_msgSend(v13, "encodeInteger:forKey:", productIdentifier, CFSTR("productIdentifier"));
  parts = self->_parts;
  if (parts)
    objc_msgSend(v13, "encodeInteger:forKey:", parts, CFSTR("parts"));
  if (-[NSString length](self->_matchIdentifier, "length"))
    objc_msgSend(v13, "encodeObject:forKey:", self->_matchIdentifier, CFSTR("matchIdentifier"));
  if (-[NSString length](self->_name, "length"))
    objc_msgSend(v13, "encodeObject:forKey:", self->_name, CFSTR("name"));
  if (-[NSString length](self->_groupName, "length"))
    objc_msgSend(v13, "encodeObject:forKey:", self->_groupName, CFSTR("groupName"));
  percentCharge = self->_percentCharge;
  if (percentCharge)
    objc_msgSend(v13, "encodeInteger:forKey:", percentCharge, CFSTR("percentCharge"));
  if (self->_connected)
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("connected"));
  if (self->_charging)
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("charging"));
  if (self->_internal)
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("internal"));
  if (self->_powerSource)
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("powerSource"));
  powerSourceState = self->_powerSourceState;
  if (powerSourceState)
    objc_msgSend(v13, "encodeInteger:forKey:", powerSourceState, CFSTR("powerSourceState"));
  if (self->_approximatesPercentCharge)
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("approximatesPercentCharge"));
  transportType = self->_transportType;
  if (transportType)
    objc_msgSend(v13, "encodeInteger:forKey:", transportType, CFSTR("transportType"));
  if (self->_fake)
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("fake"));
  if (-[NSString length](self->_accessoryIdentifier, "length"))
    objc_msgSend(v13, "encodeObject:forKey:", self->_accessoryIdentifier, CFSTR("accessoryIdentifier"));
  accessoryCategory = self->_accessoryCategory;
  if (accessoryCategory)
    objc_msgSend(v13, "encodeInteger:forKey:", accessoryCategory, CFSTR("accessoryCategory"));
  if (self->_wirelesslyCharging)
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("wirelesslyCharging"));
  v11 = -[NSString length](self->_modelNumber, "length");
  v12 = v13;
  if (v11)
  {
    objc_msgSend(v13, "encodeObject:forKey:", self->_modelNumber, CFSTR("modelNumber"));
    v12 = v13;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  BCBatteryDevice *v4;

  v4 = -[BCBatteryDevice initWithIdentifier:vendor:productIdentifier:parts:matchIdentifier:](+[BCBatteryDevice allocWithZone:](BCBatteryDevice, "allocWithZone:", a3), "initWithIdentifier:vendor:productIdentifier:parts:matchIdentifier:", self->_identifier, self->_vendor, self->_productIdentifier, self->_parts, self->_matchIdentifier);
  -[BCBatteryDevice setIdentifier:](v4, "setIdentifier:", self->_identifier);
  -[BCBatteryDevice setName:](v4, "setName:", self->_name);
  -[BCBatteryDevice setGroupName:](v4, "setGroupName:", self->_groupName);
  -[BCBatteryDevice setPercentCharge:](v4, "setPercentCharge:", self->_percentCharge);
  -[BCBatteryDevice setConnected:](v4, "setConnected:", self->_connected);
  -[BCBatteryDevice setCharging:](v4, "setCharging:", self->_charging);
  -[BCBatteryDevice setLowBattery:](v4, "setLowBattery:", self->_lowBattery);
  -[BCBatteryDevice setLowPowerModeActive:](v4, "setLowPowerModeActive:", self->_lowPowerModeActive);
  -[BCBatteryDevice setInternal:](v4, "setInternal:", self->_internal);
  -[BCBatteryDevice setPowerSource:](v4, "setPowerSource:", self->_powerSource);
  -[BCBatteryDevice setPowerSourceState:](v4, "setPowerSourceState:", self->_powerSourceState);
  -[BCBatteryDevice setApproximatesPercentCharge:](v4, "setApproximatesPercentCharge:", self->_approximatesPercentCharge);
  -[BCBatteryDevice setTransportType:](v4, "setTransportType:", self->_transportType);
  -[BCBatteryDevice setFake:](v4, "setFake:", self->_fake);
  -[BCBatteryDevice setAccessoryIdentifier:](v4, "setAccessoryIdentifier:", self->_accessoryIdentifier);
  -[BCBatteryDevice setAccessoryCategory:](v4, "setAccessoryCategory:", self->_accessoryCategory);
  -[BCBatteryDevice setWirelesslyCharging:](v4, "setWirelesslyCharging:", self->_wirelesslyCharging);
  -[BCBatteryDevice setModelNumber:](v4, "setModelNumber:", self->_modelNumber);
  return v4;
}

- (id)synthesizedRepresentativeDevice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)-[BCBatteryDevice copy](self, "copy");
  if (-[BCBatteryDevice parts](self, "parts") == 1 || -[BCBatteryDevice parts](self, "parts") == 2)
  {
    objc_msgSend(v3, "groupName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setName:", v4);

    objc_msgSend(v3, "setParts:", 3);
    v5 = (void *)MEMORY[0x24BDD17C8];
    -[BCBatteryDevice identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-synthesized"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIdentifier:", v7);

  }
  return v3;
}

- (id)description
{
  uint64_t v3;
  int64_t vendor;
  const __CFString *v5;
  const __CFString *v6;
  __CFString *v7;
  void *parts;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  const __CFString *v20;
  unint64_t v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  int64_t percentCharge;
  NSString *groupName;
  NSString *name;
  NSString *matchIdentifier;
  _BOOL4 fake;
  NSString *identifier;
  int64_t productIdentifier;
  uint64_t v33;
  void *v34;

  v34 = (void *)MEMORY[0x24BDD17C8];
  v3 = objc_opt_class();
  fake = self->_fake;
  vendor = self->_vendor;
  v5 = CFSTR("Unknown");
  v6 = CFSTR("Beats");
  if (vendor != 2)
    v6 = CFSTR("Unknown");
  if (vendor == 1)
    v7 = CFSTR("Apple");
  else
    v7 = (__CFString *)v6;
  productIdentifier = self->_productIdentifier;
  v33 = v3;
  parts = (void *)self->_parts;
  v9 = v7;
  BCStringFromParts(parts);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  name = self->_name;
  matchIdentifier = self->_matchIdentifier;
  percentCharge = self->_percentCharge;
  groupName = self->_groupName;
  NSStringFromBOOL();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBOOL();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBOOL();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBOOL();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBOOL();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBOOL();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = self->_powerSourceState - 1;
  if (v18 <= 2)
    v5 = *(&off_24CC1A3A0 + v18);
  v19 = self->_transportType - 1;
  if (v19 > 3)
    v20 = CFSTR("Unknown");
  else
    v20 = *(&off_24CC1A3B8 + v19);
  v21 = self->_accessoryCategory - 1;
  if (v21 > 8)
    v22 = CFSTR("Unknown");
  else
    v22 = *(&off_24CC1A3D8 + v21);
  v23 = CFSTR("**FAKE DEVICE**");
  if (!fake)
    v23 = &stru_24CC1A8A0;
  objc_msgSend(v34, "stringWithFormat:", CFSTR("<%@: %p;%@ vendor = %@; productIdentifier = %ld; parts = %@; identifier = %@; matchIdentifier = %@; name = %@; groupName =%@; percentCharge = %ld; lowBattery = %@; lowPowerModeActive = %@; connected = %@; charging = %@; internal = %@; powerSource = %@; poweredSoureState = %@; transportType = %@; accessoryIdentifier = %@; accessoryCategory = %@; modelNumber = %@; %@%@>"),
    v33,
    self,
    v23,
    v9,
    productIdentifier,
    v10,
    identifier,
    matchIdentifier,
    name,
    groupName,
    percentCharge,
    v11,
    v12,
    v13,
    v14,
    v15,
    v16,
    v5,
    v20,
    self->_accessoryIdentifier,
    v22,
    self->_modelNumber,
    &stru_24CC1A8A0,
    &stru_24CC1A8A0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)vendor
{
  return self->_vendor;
}

- (int64_t)powerSourceState
{
  return self->_powerSourceState;
}

- (void)setPowerSourceState:(int64_t)a3
{
  self->_powerSourceState = a3;
}

- (int64_t)productIdentifier
{
  return self->_productIdentifier;
}

- (NSString)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)modelNumber
{
  return self->_modelNumber;
}

- (void)setModelNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int64_t)percentCharge
{
  return self->_percentCharge;
}

- (void)setPercentCharge:(int64_t)a3
{
  self->_percentCharge = a3;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)isCharging
{
  return self->_charging;
}

- (void)setCharging:(BOOL)a3
{
  self->_charging = a3;
}

- (BOOL)isLowPowerModeActive
{
  return self->_lowPowerModeActive;
}

- (void)setLowPowerModeActive:(BOOL)a3
{
  self->_lowPowerModeActive = a3;
}

- (BOOL)isLowBattery
{
  return self->_lowBattery;
}

- (void)setLowBattery:(BOOL)a3
{
  self->_lowBattery = a3;
}

- (BOOL)isInternal
{
  return self->_internal;
}

- (void)setInternal:(BOOL)a3
{
  self->_internal = a3;
}

- (BOOL)isPowerSource
{
  return self->_powerSource;
}

- (void)setPowerSource:(BOOL)a3
{
  self->_powerSource = a3;
}

- (BOOL)approximatesPercentCharge
{
  return self->_approximatesPercentCharge;
}

- (void)setApproximatesPercentCharge:(BOOL)a3
{
  self->_approximatesPercentCharge = a3;
}

- (unint64_t)parts
{
  return self->_parts;
}

- (void)setParts:(unint64_t)a3
{
  self->_parts = a3;
}

- (unint64_t)accessoryCategory
{
  return self->_accessoryCategory;
}

- (void)setAccessoryCategory:(unint64_t)a3
{
  self->_accessoryCategory = a3;
}

- (BOOL)isWirelesslyCharging
{
  return self->_wirelesslyCharging;
}

- (void)setWirelesslyCharging:(BOOL)a3
{
  self->_wirelesslyCharging = a3;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)matchIdentifier
{
  return self->_matchIdentifier;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (BOOL)isFake
{
  return self->_fake;
}

- (void)setFake:(BOOL)a3
{
  self->_fake = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_matchIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
