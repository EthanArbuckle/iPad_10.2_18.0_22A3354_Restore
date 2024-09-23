@implementation ICASDeviceData

- (ICASDeviceData)initWithDeviceModel:(id)a3 devicePlatform:(id)a4 osInstallVariant:(id)a5 osVersion:(id)a6 osBundleVersion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ICASDeviceData *v17;
  ICASDeviceData *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ICASDeviceData;
  v17 = -[ICASDeviceData init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_deviceModel, a3);
    objc_storeStrong((id *)&v18->_devicePlatform, a4);
    objc_storeStrong((id *)&v18->_osInstallVariant, a5);
    objc_storeStrong((id *)&v18->_osVersion, a6);
    objc_storeStrong((id *)&v18->_osBundleVersion, a7);
  }

  return v18;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("DeviceData");
}

- (id)toDict
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("deviceModel");
  -[ICASDeviceData deviceModel](self, "deviceModel");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[ICASDeviceData deviceModel](self, "deviceModel", v19);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_opt_new();
  }
  v4 = (void *)v3;
  v22[0] = v3;
  v21[1] = CFSTR("devicePlatform");
  -[ICASDeviceData devicePlatform](self, "devicePlatform", v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ICASDeviceData devicePlatform](self, "devicePlatform");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_opt_new();
  }
  v7 = (void *)v6;
  v22[1] = v6;
  v21[2] = CFSTR("osInstallVariant");
  -[ICASDeviceData osInstallVariant](self, "osInstallVariant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[ICASDeviceData osInstallVariant](self, "osInstallVariant");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_opt_new();
  }
  v10 = (void *)v9;
  v22[2] = v9;
  v21[3] = CFSTR("osVersion");
  -[ICASDeviceData osVersion](self, "osVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[ICASDeviceData osVersion](self, "osVersion");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = objc_opt_new();
  }
  v13 = (void *)v12;
  v22[3] = v12;
  v21[4] = CFSTR("osBundleVersion");
  -[ICASDeviceData osBundleVersion](self, "osBundleVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[ICASDeviceData osBundleVersion](self, "osBundleVersion");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = objc_opt_new();
  }
  v16 = (void *)v15;
  v22[4] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (NSString)devicePlatform
{
  return self->_devicePlatform;
}

- (ICASOsInstallVariant)osInstallVariant
{
  return self->_osInstallVariant;
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (NSString)osBundleVersion
{
  return self->_osBundleVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osBundleVersion, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_osInstallVariant, 0);
  objc_storeStrong((id *)&self->_devicePlatform, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
}

@end
