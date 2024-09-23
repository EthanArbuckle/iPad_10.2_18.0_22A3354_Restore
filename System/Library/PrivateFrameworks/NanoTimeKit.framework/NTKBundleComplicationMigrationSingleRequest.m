@implementation NTKBundleComplicationMigrationSingleRequest

+ (id)requestWithComplication:(id)a3 family:(int64_t)a4 device:(id)a5
{
  id v7;
  id v8;
  _QWORD *v9;
  void *v10;
  id v11;
  void *v12;

  v7 = a3;
  v8 = a5;
  v9 = objc_alloc_init((Class)objc_opt_class());
  v10 = (void *)v9[1];
  v9[1] = v7;
  v11 = v7;

  v9[2] = a4;
  v12 = (void *)v9[3];
  v9[3] = v8;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NTKComplication *complication;
  uint64_t v7;
  id v8;
  id v9;
  int64_t family;
  id v11;
  id v12;
  CLKDevice *device;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  complication = self->_complication;
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __55__NTKBundleComplicationMigrationSingleRequest_isEqual___block_invoke;
  v21[3] = &unk_1E6BD0630;
  v8 = v4;
  v22 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", complication, v21);
  family = self->_family;
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __55__NTKBundleComplicationMigrationSingleRequest_isEqual___block_invoke_2;
  v19[3] = &unk_1E6BD0380;
  v11 = v8;
  v20 = v11;
  v12 = (id)objc_msgSend(v5, "appendInteger:counterpart:", family, v19);
  device = self->_device;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __55__NTKBundleComplicationMigrationSingleRequest_isEqual___block_invoke_3;
  v17[3] = &unk_1E6BD0630;
  v18 = v11;
  v14 = v11;
  v15 = (id)objc_msgSend(v5, "appendObject:counterpart:", device, v17);
  LOBYTE(device) = objc_msgSend(v5, "isEqual");

  return (char)device;
}

id __55__NTKBundleComplicationMigrationSingleRequest_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

uint64_t __55__NTKBundleComplicationMigrationSingleRequest_isEqual___block_invoke_2(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
}

id __55__NTKBundleComplicationMigrationSingleRequest_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_complication);
  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_family);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_device);
  v7 = objc_msgSend(v3, "hash");

  return v7;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_complication, CFSTR("complication"));
  CLKComplicationFamilyDescription();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("family"));

  -[CLKDevice nrDeviceUUID](self->_device, "nrDeviceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v7, CFSTR("deviceUUID"), 1);

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKBundleComplicationMigrationSingleRequest)initWithCoder:(id)a3
{
  id v4;
  NTKBundleComplicationMigrationSingleRequest *v5;
  uint64_t v6;
  NTKComplication *complication;
  void *v8;
  uint64_t v9;
  CLKDevice *device;

  v4 = a3;
  v5 = -[NTKBundleComplicationMigrationSingleRequest init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NTKBundleComplicationMigrationSingleRequestComplicationKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    complication = v5->_complication;
    v5->_complication = (NTKComplication *)v6;

    v5->_family = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NTKBundleComplicationMigrationSingleRequestFamilyKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NTKBundleComplicationMigrationSingleRequestDeviceDescriptorKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C944B0], "deviceForDescriptor:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    device = v5->_device;
    v5->_device = (CLKDevice *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NTKComplication *complication;
  id v5;
  id v6;

  complication = self->_complication;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", complication, CFSTR("NTKBundleComplicationMigrationSingleRequestComplicationKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_family, CFSTR("NTKBundleComplicationMigrationSingleRequestFamilyKey"));
  -[CLKDevice descriptor](self->_device, "descriptor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("NTKBundleComplicationMigrationSingleRequestDeviceDescriptorKey"));

}

- (NTKComplication)complication
{
  return self->_complication;
}

- (int64_t)family
{
  return self->_family;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_complication, 0);
}

@end
