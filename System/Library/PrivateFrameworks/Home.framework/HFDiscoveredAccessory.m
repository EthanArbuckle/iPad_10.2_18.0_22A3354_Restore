@implementation HFDiscoveredAccessory

- (HFDiscoveredAccessory)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithAccessory_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFDiscoveredAccessory.m"), 28, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFDiscoveredAccessory init]",
    v5);

  return 0;
}

- (HFDiscoveredAccessory)initWithAccessory:(id)a3
{
  id v5;
  HFDiscoveredAccessory *v6;
  HFDiscoveredAccessory *v7;
  uint64_t v8;
  NSDate *discoveryDate;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFDiscoveredAccessory;
  v6 = -[HFDiscoveredAccessory init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accessory, a3);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = objc_claimAutoreleasedReturnValue();
    discoveryDate = v7->_discoveryDate;
    v7->_discoveryDate = (NSDate *)v8;

    v7->_status = 0;
  }

  return v7;
}

- (HFDiscoveredAccessory)initWithSharingDevice:(id)a3
{
  id v5;
  HFDiscoveredAccessory *v6;
  HFDiscoveredAccessory *v7;
  uint64_t v8;
  NSDate *discoveryDate;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFDiscoveredAccessory;
  v6 = -[HFDiscoveredAccessory init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sharingDevice, a3);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = objc_claimAutoreleasedReturnValue();
    discoveryDate = v7->_discoveryDate;
    v7->_discoveryDate = (NSDate *)v8;

    v7->_status = 0;
  }

  return v7;
}

- (HFDiscoveredAccessory)initWithAccessoryUUID:(id)a3 accessoryName:(id)a4 accessoryCategory:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFDiscoveredAccessory *v12;
  HFDiscoveredAccessory *v13;
  uint64_t v14;
  NSDate *discoveryDate;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HFDiscoveredAccessory;
  v12 = -[HFDiscoveredAccessory init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uniqueIdentifier, a3);
    objc_storeStrong((id *)&v13->_name, a4);
    objc_storeStrong((id *)&v13->_category, a5);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = objc_claimAutoreleasedReturnValue();
    discoveryDate = v13->_discoveryDate;
    v13->_discoveryDate = (NSDate *)v14;

    v13->_status = 0;
  }

  return v13;
}

+ (id)discoveredAccessoryFromSetupDescription:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "accessoryUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "category");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v5, "initWithAccessoryUUID:accessoryName:accessoryCategory:", v6, v7, v8);
  return v9;
}

- (void)updateStatus:(unint64_t)a3 error:(id)a4
{
  id v6;
  NSError *v7;
  NSError *error;
  id v9;

  v6 = a4;
  v9 = v6;
  if (a3 != 3 && v6)
  {
    NSLog(CFSTR("Error can only be non-nil for the HFDiscoveredAccessoryStatusFailed status state"));
    self->_status = a3;
LABEL_7:
    error = self->_error;
    self->_error = 0;
    goto LABEL_8;
  }
  self->_status = a3;
  if (a3 != 3)
    goto LABEL_7;
  if (!self->_error)
  {
    v7 = (NSError *)v6;
    error = self->_error;
    self->_error = v7;
LABEL_8:

    v6 = v9;
  }

}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFDiscoveredAccessory _descriptionForStatus:](self, "_descriptionForStatus:", -[HFDiscoveredAccessory status](self, "status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("status"));

  -[HFDiscoveredAccessory error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v6, CFSTR("error"), 1);

  -[HFDiscoveredAccessory accessory](self, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_prettyDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v9, CFSTR("accessory"), 1);

  -[HFDiscoveredAccessory sharingDevice](self, "sharingDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v11, CFSTR("sharingDevice"), 1);

  -[HFDiscoveredAccessory uniqueIdentifier](self, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v13, CFSTR("uniqueIdentifier"), 1);

  -[HFDiscoveredAccessory name](self, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v15, CFSTR("name"), 1);

  -[HFDiscoveredAccessory category](self, "category");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v17, CFSTR("category"), 1);

  objc_msgSend(v3, "build");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v19;
}

- (NSUUID)uniqueIdentifier
{
  NSUUID *uniqueIdentifier;
  NSUUID *v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
  {
    v3 = uniqueIdentifier;
  }
  else
  {
    -[HFDiscoveredAccessory accessory](self, "accessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[HFDiscoveredAccessory accessory](self, "accessory");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HFDiscoveredAccessory sharingDevice](self, "sharingDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        NSLog(CFSTR("HFDiscoveredAccessory (%@) doesn't have an accessoryUUID, accessory, or sharing device. How did it get initialized?"), self);
        v3 = 0;
        return v3;
      }
      -[HFDiscoveredAccessory sharingDevice](self, "sharingDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v3 = (NSUUID *)v7;

  }
  return v3;
}

- (NSString)name
{
  NSString *name;
  NSString *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;

  name = self->_name;
  if (!name)
  {
    -[HFDiscoveredAccessory accessory](self, "accessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[HFDiscoveredAccessory accessory](self, "accessory");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HFDiscoveredAccessory sharingDevice](self, "sharingDevice");
      v3 = (NSString *)objc_claimAutoreleasedReturnValue();

      if (!v3)
        return v3;
      -[HFDiscoveredAccessory sharingDevice](self, "sharingDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v9 = v7;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CBA1A8], "hf_userFriendlyLocalizedCapitalizedDescription:", *MEMORY[0x1E0CB7A58]);
        v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      v3 = v9;

    }
    return v3;
  }
  v3 = name;
  return v3;
}

- (HMAccessoryCategory)category
{
  HMAccessoryCategory *category;
  HMAccessoryCategory *v3;
  void *v5;
  void *v6;

  category = self->_category;
  if (category)
  {
    v3 = category;
  }
  else
  {
    -[HFDiscoveredAccessory accessory](self, "accessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[HFDiscoveredAccessory accessory](self, "accessory");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "category");
      v3 = (HMAccessoryCategory *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (BOOL)requiresSetupCode
{
  void *v3;
  void *v4;
  char v5;
  _BOOL8 v6;
  void *v7;

  -[HFDiscoveredAccessory accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HFDiscoveredAccessory accessory](self, "accessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "knownToSystemCommissioner");

    if ((v5 & 1) != 0)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      -[HFDiscoveredAccessory accessory](self, "accessory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "associationOptions") & 1;

    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (BOOL)requiresSoftwareUpdate
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[HFDiscoveredAccessory accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HFDiscoveredAccessory accessory](self, "accessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = ((unint64_t)objc_msgSend(v4, "associationOptions") >> 1) & 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)identify
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  -[HFDiscoveredAccessory accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_initWeak(&location, self);
    v4 = (void *)MEMORY[0x1E0D519C0];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __33__HFDiscoveredAccessory_identify__block_invoke;
    v7[3] = &unk_1EA729F60;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v4, "futureWithBlock:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    return v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

void __33__HFDiscoveredAccessory_identify__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorOnlyCompletionHandlerAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifyWithCompletionHandler:", v5);
}

- (id)_descriptionForStatus:(unint64_t)a3
{
  if (a3 > 3)
    return 0;
  else
    return off_1EA72DA20[a3];
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (SFDevice)sharingDevice
{
  return self->_sharingDevice;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)discoveryDate
{
  return self->_discoveryDate;
}

- (unint64_t)status
{
  return self->_status;
}

- (NSError)error
{
  return self->_error;
}

- (unint64_t)certificationStatus
{
  return self->_certificationStatus;
}

- (void)setCertificationStatus:(unint64_t)a3
{
  self->_certificationStatus = a3;
}

- (NSString)rawSetupPayloadString
{
  return self->_rawSetupPayloadString;
}

- (void)setRawSetupPayloadString:(id)a3
{
  objc_storeStrong((id *)&self->_rawSetupPayloadString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawSetupPayloadString, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_discoveryDate, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_sharingDevice, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
