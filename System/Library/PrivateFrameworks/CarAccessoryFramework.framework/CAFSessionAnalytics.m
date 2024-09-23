@implementation CAFSessionAnalytics

- (CAFSessionAnalytics)initWithSession:(id)a3
{
  id v4;
  CAFSessionAnalytics *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *name;
  uint64_t v13;
  NSString *ppid;
  uint64_t v15;
  NSString *firmwareVersion;
  uint64_t v17;
  NSString *hardwareVersion;
  uint64_t v19;
  NSString *manufacturer;
  uint64_t v21;
  NSString *model;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CAFSessionAnalytics;
  v5 = -[CAFSessionAnalytics init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE15280], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MFiCertificateSerialNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "vehicleAccessoryForCertificateSerial:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "analyticsDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("name"));
        v11 = objc_claimAutoreleasedReturnValue();
        name = v5->_name;
        v5->_name = (NSString *)v11;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ppid"));
        v13 = objc_claimAutoreleasedReturnValue();
        ppid = v5->_ppid;
        v5->_ppid = (NSString *)v13;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("firmwareVersion"));
        v15 = objc_claimAutoreleasedReturnValue();
        firmwareVersion = v5->_firmwareVersion;
        v5->_firmwareVersion = (NSString *)v15;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("hardwareVersion"));
        v17 = objc_claimAutoreleasedReturnValue();
        hardwareVersion = v5->_hardwareVersion;
        v5->_hardwareVersion = (NSString *)v17;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("manufacturer"));
        v19 = objc_claimAutoreleasedReturnValue();
        manufacturer = v5->_manufacturer;
        v5->_manufacturer = (NSString *)v19;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("modelName"));
        v21 = objc_claimAutoreleasedReturnValue();
        model = v5->_model;
        v5->_model = (NSString *)v21;

        v5->_supportsBluetoothLE = objc_msgSend(v9, "supportsBluetoothLE");
      }

    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAFSessionAnalytics)initWithCoder:(id)a3
{
  id v4;
  CAFSessionAnalytics *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSString *ppid;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSString *firmwareVersion;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSString *hardwareVersion;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSString *manufacturer;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSString *model;
  void *v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CAFSessionAnalytics;
  v5 = -[CAFSessionAnalytics init](&v32, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_name);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_ppid);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    ppid = v5->_ppid;
    v5->_ppid = (NSString *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_firmwareVersion);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    firmwareVersion = v5->_firmwareVersion;
    v5->_firmwareVersion = (NSString *)v16;

    v18 = objc_opt_class();
    NSStringFromSelector(sel_hardwareVersion);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    hardwareVersion = v5->_hardwareVersion;
    v5->_hardwareVersion = (NSString *)v20;

    v22 = objc_opt_class();
    NSStringFromSelector(sel_manufacturer);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    manufacturer = v5->_manufacturer;
    v5->_manufacturer = (NSString *)v24;

    v26 = objc_opt_class();
    NSStringFromSelector(sel_model);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v26, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    model = v5->_model;
    v5->_model = (NSString *)v28;

    NSStringFromSelector(sel_supportsBluetoothLE);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsBluetoothLE = objc_msgSend(v4, "decodeBoolForKey:", v30);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;
  void *v6;
  NSString *ppid;
  void *v8;
  NSString *firmwareVersion;
  void *v10;
  NSString *hardwareVersion;
  void *v12;
  NSString *manufacturer;
  void *v14;
  NSString *model;
  void *v16;
  _BOOL8 supportsBluetoothLE;
  id v18;

  name = self->_name;
  v5 = a3;
  NSStringFromSelector(sel_name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", name, v6);

  ppid = self->_ppid;
  NSStringFromSelector(sel_ppid);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", ppid, v8);

  firmwareVersion = self->_firmwareVersion;
  NSStringFromSelector(sel_firmwareVersion);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", firmwareVersion, v10);

  hardwareVersion = self->_hardwareVersion;
  NSStringFromSelector(sel_hardwareVersion);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", hardwareVersion, v12);

  manufacturer = self->_manufacturer;
  NSStringFromSelector(sel_manufacturer);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", manufacturer, v14);

  model = self->_model;
  NSStringFromSelector(sel_model);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", model, v16);

  supportsBluetoothLE = self->_supportsBluetoothLE;
  NSStringFromSelector(sel_supportsBluetoothLE);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", supportsBluetoothLE, v18);

}

- (NSString)name
{
  return self->_name;
}

- (NSString)ppid
{
  return self->_ppid;
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (NSString)hardwareVersion
{
  return self->_hardwareVersion;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (NSString)model
{
  return self->_model;
}

- (BOOL)supportsBluetoothLE
{
  return self->_supportsBluetoothLE;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_hardwareVersion, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_ppid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
