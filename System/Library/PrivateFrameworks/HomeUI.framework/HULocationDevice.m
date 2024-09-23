@implementation HULocationDevice

- (HULocationDevice)initWithHMDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HULocationDevice *v9;

  v4 = a3;
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isCurrentDevice");

  v9 = -[HULocationDevice initWithIdentifier:name:currentDevice:](self, "initWithIdentifier:name:currentDevice:", v6, v7, v8);
  return v9;
}

- (HULocationDevice)initWithFMFDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  HULocationDevice *v8;

  v4 = a3;
  objc_msgSend(v4, "deviceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isThisDevice");

  v8 = -[HULocationDevice initWithIdentifier:name:currentDevice:](self, "initWithIdentifier:name:currentDevice:", v5, v6, v7);
  return v8;
}

- (HULocationDevice)initWithIdentifier:(id)a3 name:(id)a4 currentDevice:(BOOL)a5
{
  id v10;
  id v11;
  HULocationDevice *v12;
  HULocationDevice *v13;
  void *v15;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  if (!objc_msgSend(v10, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HULocationDeviceManager.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier.length"));

  }
  v16.receiver = self;
  v16.super_class = (Class)HULocationDevice;
  v12 = -[HULocationDevice init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_name, a4);
    v13->_currentDevice = a5;
  }

  return v13;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_625 != -1)
    dispatch_once(&_MergedGlobals_625, &__block_literal_global_7_0);
  return (NAIdentity *)(id)qword_1ED580B30;
}

void __31__HULocationDevice_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_12_0);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_13_0);
  v3 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_14_1);
  objc_msgSend(v0, "build");
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)qword_1ED580B30;
  qword_1ED580B30 = v4;

}

uint64_t __31__HULocationDevice_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __31__HULocationDevice_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

uint64_t __31__HULocationDevice_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "isCurrentDevice"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULocationDevice identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("ID"));

  -[HULocationDevice name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("name"));

  v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[HULocationDevice isCurrentDevice](self, "isCurrentDevice"), CFSTR("currentDevice"));
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isCurrentDevice
{
  return self->_currentDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
