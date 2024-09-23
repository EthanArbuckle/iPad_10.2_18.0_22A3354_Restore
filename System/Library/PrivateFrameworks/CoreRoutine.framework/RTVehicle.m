@implementation RTVehicle

- (RTVehicle)initWithDateInterval:(id)a3 vehicleName:(id)a4 vehicleModelName:(id)a5 bluetoothAddress:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  RTVehicle *v15;
  id *p_isa;
  RTVehicle *v17;
  NSObject *v18;
  objc_super v20;
  uint8_t buf[16];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    v20.receiver = self;
    v20.super_class = (Class)RTVehicle;
    v15 = -[RTVehicle init](&v20, sel_init);
    p_isa = (id *)&v15->super.isa;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_vehicleName, a4);
      objc_storeStrong(p_isa + 3, a5);
      objc_storeStrong(p_isa + 4, a6);
      objc_storeStrong(p_isa + 1, a3);
    }
    self = p_isa;
    v17 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A5E26000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", buf, 2u);
    }

    v17 = 0;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDateInterval *dateInterval;
  id v5;

  dateInterval = self->_dateInterval;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dateInterval, CFSTR("vehicleDateInterval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vehicleName, CFSTR("vehicleName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vehicleModelName, CFSTR("vehicleModelName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bluetoothAddress, CFSTR("vehicleBluetoothAddress"));

}

- (RTVehicle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  RTVehicle *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vehicleDateInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vehicleName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vehicleModelName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vehicleBluetoothAddress"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[RTVehicle initWithDateInterval:vehicleName:vehicleModelName:bluetoothAddress:](self, "initWithDateInterval:vehicleName:vehicleModelName:bluetoothAddress:", v5, v6, v7, v8);
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  char v7;
  NSString *vehicleName;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSString *vehicleModelName;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSString *bluetoothAddress;
  NSString *v17;
  char v18;
  char v19;
  void *v20;
  NSDateInterval *dateInterval;
  void *v22;

  v6 = a3;
  v7 = objc_msgSend(v6, "isMemberOfClass:", objc_opt_class());
  vehicleName = self->_vehicleName;
  if (vehicleName)
  {
    objc_msgSend(v6, "vehicleName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (uint64_t)self->_vehicleName;
    if (v3)
    {
      objc_msgSend(v6, "vehicleName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v10) = objc_msgSend((id)v9, "isEqual:", v4);
      if ((v10 & 1) != 0 || self->_vehicleName)
      {

LABEL_12:
        goto LABEL_13;
      }
      v10 = 1;
    }
    else
    {
      v10 = 0;
      if (v9)
        goto LABEL_12;
    }
  }
  else
  {
    v10 = 0;
  }
  v9 = v10;
  objc_msgSend(v6, "vehicleName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = v11 == 0;

  if ((v9 & 1) != 0)
  if (vehicleName)
    goto LABEL_12;
LABEL_13:
  vehicleModelName = self->_vehicleModelName;
  if (vehicleModelName)
  {
    objc_msgSend(v6, "vehicleModelName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (uint64_t)self->_vehicleModelName;
    if (v4)
    {
      objc_msgSend(v6, "vehicleModelName");
      v9 = objc_claimAutoreleasedReturnValue();
      LOBYTE(v14) = objc_msgSend((id)v13, "isEqual:", v9);
      if ((v14 & 1) != 0 || self->_vehicleModelName)
      {

LABEL_24:
        goto LABEL_25;
      }
      v14 = 1;
    }
    else
    {
      v14 = 0;
      if (v13)
        goto LABEL_24;
    }
  }
  else
  {
    v14 = 0;
  }
  v13 = v14;
  objc_msgSend(v6, "vehicleModelName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = v15 == 0;

  if ((v13 & 1) != 0)
  if (vehicleModelName)
    goto LABEL_24;
LABEL_25:
  bluetoothAddress = self->_bluetoothAddress;
  if (bluetoothAddress)
  {
    objc_msgSend(v6, "bluetoothAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = self->_bluetoothAddress;
    if (v4)
    {
      objc_msgSend(v6, "bluetoothAddress");
      v13 = objc_claimAutoreleasedReturnValue();
      v18 = -[NSString isEqual:](v17, "isEqual:", v13);
      if ((v18 & 1) != 0 || self->_bluetoothAddress)
      {

LABEL_36:
        goto LABEL_37;
      }
      v18 = 1;
    }
    else
    {
      v18 = 0;
      if (v17)
        goto LABEL_36;
    }
  }
  else
  {
    v18 = 0;
  }
  v19 = v18;
  objc_msgSend(v6, "bluetoothAddress");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v20 == 0;

  if ((v19 & 1) != 0)
  if (bluetoothAddress)
    goto LABEL_36;
LABEL_37:
  dateInterval = self->_dateInterval;
  objc_msgSend(v6, "dateInterval");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(dateInterval) = -[NSDateInterval isEqual:](dateInterval, "isEqual:", v22);

  return v7 & v10 & v14 & v18 & dateInterval;
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTVehicle dateInterval](self, "dateInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVehicle vehicleName](self, "vehicleName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVehicle vehicleModelName](self, "vehicleModelName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVehicle bluetoothAddress](self, "bluetoothAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("dateInterval, %@, vehicleName, %@, vehicleModelName, %@, bluetoothAddress, %@"), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSString)vehicleName
{
  return self->_vehicleName;
}

- (NSString)vehicleModelName
{
  return self->_vehicleModelName;
}

- (NSString)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
  objc_storeStrong((id *)&self->_vehicleModelName, 0);
  objc_storeStrong((id *)&self->_vehicleName, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
