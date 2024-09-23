@implementation DSContinuityDevice

- (DSContinuityDevice)initWithName:(id)a3 deviceID:(id)a4 relationshipID:(id)a5 initialDiscoveryDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  DSContinuityDevice *v14;
  DSContinuityDevice *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)DSContinuityDevice;
  v14 = -[DSContinuityDevice init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    -[DSContinuityDevice setName:](v14, "setName:", v10);
    -[DSContinuityDevice setDeviceID:](v15, "setDeviceID:", v11);
    -[DSContinuityDevice setRelationshipID:](v15, "setRelationshipID:", v12);
    -[DSContinuityDevice setInitialDiscoveryDate:](v15, "setInitialDiscoveryDate:", v13);
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  DSContinuityDevice *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = (DSContinuityDevice *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[DSContinuityDevice pushToken](v4, "pushToken");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[DSContinuityDevice pushToken](self, "pushToken");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 == v6)
      {
        v9 = 1;
      }
      else
      {
        -[DSContinuityDevice deviceID](v4, "deviceID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[DSContinuityDevice deviceID](self, "deviceID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v7 == v8;

      }
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (NSString)marketingName
{
  return self->_marketingName;
}

- (void)setMarketingName:(id)a3
{
  objc_storeStrong((id *)&self->_marketingName, a3);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (NSUUID)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceID, a3);
}

- (NSUUID)relationshipID
{
  return self->_relationshipID;
}

- (void)setRelationshipID:(id)a3
{
  objc_storeStrong((id *)&self->_relationshipID, a3);
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
  objc_storeStrong((id *)&self->_pushToken, a3);
}

- (NSDate)initialDiscoveryDate
{
  return self->_initialDiscoveryDate;
}

- (void)setInitialDiscoveryDate:(id)a3
{
  objc_storeStrong((id *)&self->_initialDiscoveryDate, a3);
}

- (NSDate)lastSessionStartDate
{
  return self->_lastSessionStartDate;
}

- (void)setLastSessionStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastSessionStartDate, a3);
}

- (NSDate)lastSessionEndDate
{
  return self->_lastSessionEndDate;
}

- (void)setLastSessionEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastSessionEndDate, a3);
}

- (UIImage)deviceImage
{
  return self->_deviceImage;
}

- (void)setDeviceImage:(id)a3
{
  objc_storeStrong((id *)&self->_deviceImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceImage, 0);
  objc_storeStrong((id *)&self->_lastSessionEndDate, 0);
  objc_storeStrong((id *)&self->_lastSessionStartDate, 0);
  objc_storeStrong((id *)&self->_initialDiscoveryDate, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_relationshipID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_marketingName, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
