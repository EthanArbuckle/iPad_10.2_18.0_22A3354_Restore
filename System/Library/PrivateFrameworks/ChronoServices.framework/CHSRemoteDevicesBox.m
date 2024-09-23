@implementation CHSRemoteDevicesBox

- (CHSRemoteDevicesBox)initWithDevices:(id)a3
{
  id v4;
  CHSRemoteDevicesBox *v5;
  uint64_t v6;
  NSArray *devices;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSRemoteDevicesBox;
  v5 = -[CHSRemoteDevicesBox init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    devices = v5->_devices;
    v5->_devices = (NSArray *)v6;

  }
  return v5;
}

- (void)prepareForEncoding
{
  NSData *v3;
  id v4;
  NSData *archivedData;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  id v9;
  uint8_t buf[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0D87610], "encodeObject:error:", self, &v9);
  v3 = (NSData *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  archivedData = self->_archivedData;
  self->_archivedData = v3;

  if (v4)
  {
    CHSLogChronoServices();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CHSWidgetExtensionsBox prepareForEncoding].cold.1(v8, (uint64_t)v4, buf, v6);
    }

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHSRemoteDevicesBox)initWithCoder:(id)a3
{
  id v4;
  CHSRemoteDevicesBox *v5;
  void *devices;
  id *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CHSRemoteDevicesBox;
  v5 = -[CHSRemoteDevicesBox init](&v14, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("data")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
      devices = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      objc_msgSend(MEMORY[0x1E0D87610], "decodeObjectOfClass:fromData:error:", objc_opt_class(), devices, &v13);
      v7 = (id *)objc_claimAutoreleasedReturnValue();
      v8 = v13;
      if (v8)
      {
        objc_msgSend(v4, "failWithError:", v8);
      }
      else if (v7)
      {
        objc_storeStrong((id *)&v5->_devices, v7[2]);
      }

    }
    else
    {
      v9 = (void *)MEMORY[0x1E0C99E60];
      v10 = objc_opt_class();
      objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("devices"));
      v11 = objc_claimAutoreleasedReturnValue();
      devices = v5->_devices;
      v5->_devices = (NSArray *)v11;
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSData *archivedData;
  id v6;

  v4 = a3;
  archivedData = self->_archivedData;
  v6 = v4;
  if (archivedData)
    objc_msgSend(v4, "encodeObject:forKey:", archivedData, CFSTR("data"));
  else
    objc_msgSend(v4, "encodeObject:forKey:", self->_devices, CFSTR("devices"));

}

- (NSArray)devices
{
  return self->_devices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_archivedData, 0);
}

@end
