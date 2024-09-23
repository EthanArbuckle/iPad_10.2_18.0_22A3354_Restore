@implementation EAWiFiUnconfiguredAccessory

- (EAWiFiUnconfiguredAccessory)initWithAirPortAssistantWACDevice:(id)a3
{
  id v4;
  EAWiFiUnconfiguredAccessory *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *ssid;
  uint64_t v10;
  NSString *manufacturer;
  uint64_t v12;
  NSString *model;
  uint64_t v14;
  NSString *macAddress;
  void *v16;
  int v17;
  void *v18;
  int v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)EAWiFiUnconfiguredAccessory;
  v5 = -[EAWiFiUnconfiguredAccessory init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("wacFriendlyName"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "objectForKey:", CFSTR("wacSSID"));
    v8 = objc_claimAutoreleasedReturnValue();
    ssid = v5->_ssid;
    v5->_ssid = (NSString *)v8;

    objc_msgSend(v4, "objectForKey:", CFSTR("wacManufacturerName"));
    v10 = objc_claimAutoreleasedReturnValue();
    manufacturer = v5->_manufacturer;
    v5->_manufacturer = (NSString *)v10;

    objc_msgSend(v4, "objectForKey:", CFSTR("wacModelName"));
    v12 = objc_claimAutoreleasedReturnValue();
    model = v5->_model;
    v5->_model = (NSString *)v12;

    objc_msgSend(v4, "objectForKey:", CFSTR("wacMACAddress"));
    v14 = objc_claimAutoreleasedReturnValue();
    macAddress = v5->_macAddress;
    v5->_macAddress = (NSString *)v14;

    if (!v5->_name)
    {
      v5->_name = (NSString *)&stru_1E6B07EE0;

    }
    if (!v5->_ssid)
    {
      v5->_ssid = (NSString *)&stru_1E6B07EE0;

    }
    if (!v5->_manufacturer)
    {
      v5->_manufacturer = (NSString *)&stru_1E6B07EE0;

    }
    if (!v5->_model)
    {
      v5->_model = (NSString *)&stru_1E6B07EE0;

    }
    if (!v5->_macAddress)
    {
      v5->_macAddress = (NSString *)&stru_1E6B07EE0;

    }
    v5->_properties = 0;
    objc_msgSend(v4, "objectForKey:", CFSTR("wacSupportsAirPlay"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

    if (v17)
      v5->_properties |= 1uLL;
    objc_msgSend(v4, "objectForKey:", CFSTR("wacSupportsSpruce"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");

    if (v19)
      v5->_properties |= 4uLL;
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EAWiFiUnconfiguredAccessory: Name=%@ Manufacturer=%@ Model=%@ MAC=%@ SSID=%@ Properties=%d"), self->_name, self->_manufacturer, self->_model, self->_macAddress, self->_ssid, self->_properties);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *name;
  void *v7;
  NSString *ssid;
  void *v9;
  NSString *manufacturer;
  void *v11;
  NSString *model;
  void *v13;
  NSString *macAddress;
  void *v15;
  unint64_t properties;
  BOOL v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    name = self->_name;
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqual:](name, "isEqual:", v7))
    {
      ssid = self->_ssid;
      objc_msgSend(v5, "ssid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqual:](ssid, "isEqual:", v9))
      {
        manufacturer = self->_manufacturer;
        objc_msgSend(v5, "manufacturer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqual:](manufacturer, "isEqual:", v11))
        {
          model = self->_model;
          objc_msgSend(v5, "model");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSString isEqual:](model, "isEqual:", v13))
          {
            macAddress = self->_macAddress;
            objc_msgSend(v5, "macAddress");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[NSString isEqual:](macAddress, "isEqual:", v15))
            {
              properties = self->_properties;
              v17 = properties == objc_msgSend(v5, "properties");
            }
            else
            {
              v17 = 0;
            }

          }
          else
          {
            v17 = 0;
          }

        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (NSString)macAddress
{
  return self->_macAddress;
}

- (EAWiFiUnconfiguredAccessoryProperties)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
