@implementation SMSFilterSyncDeviceParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMSFilterSyncDeviceParams)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SMSFilterSyncDeviceParams;
  return -[SMSFilterSyncDeviceParams init](&v3, sel_init);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SMSFilterSyncDeviceParams deviceUniqueID](self, "deviceUniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("deviceUniqueID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SMSFilterSyncDeviceParams smsFilterCapabilitiesOptions](self, "smsFilterCapabilitiesOptions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("smsFilterCapabilitiesOptions"));

  -[SMSFilterSyncDeviceParams filterExtensionName](self, "filterExtensionName");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("filterExtensionName"));

}

- (SMSFilterSyncDeviceParams)initWithCoder:(id)a3
{
  id v4;
  SMSFilterSyncDeviceParams *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SMSFilterSyncDeviceParams;
  v5 = -[SMSFilterSyncDeviceParams init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceUniqueID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSFilterSyncDeviceParams setDeviceUniqueID:](v5, "setDeviceUniqueID:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("smsFilterCapabilitiesOptions"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSFilterSyncDeviceParams setSmsFilterCapabilitiesOptions:](v5, "setSmsFilterCapabilitiesOptions:", objc_msgSend(v7, "unsignedIntegerValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("filterExtensionName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSFilterSyncDeviceParams setFilterExtensionName:](v5, "setFilterExtensionName:", v8);

  }
  return v5;
}

- (NSString)deviceUniqueID
{
  return self->_deviceUniqueID;
}

- (void)setDeviceUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUniqueID, a3);
}

- (unint64_t)smsFilterCapabilitiesOptions
{
  return self->_smsFilterCapabilitiesOptions;
}

- (void)setSmsFilterCapabilitiesOptions:(unint64_t)a3
{
  self->_smsFilterCapabilitiesOptions = a3;
}

- (NSString)filterExtensionName
{
  return self->_filterExtensionName;
}

- (void)setFilterExtensionName:(id)a3
{
  objc_storeStrong((id *)&self->_filterExtensionName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterExtensionName, 0);
  objc_storeStrong((id *)&self->_deviceUniqueID, 0);
}

@end
