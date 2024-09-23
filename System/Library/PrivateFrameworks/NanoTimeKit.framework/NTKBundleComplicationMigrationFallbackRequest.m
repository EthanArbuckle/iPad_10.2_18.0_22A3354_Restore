@implementation NTKBundleComplicationMigrationFallbackRequest

+ (id)requestWithComplication:(id)a3 families:(id)a4 device:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = objc_alloc_init((Class)objc_opt_class());
  v11 = (void *)v10[1];
  v10[1] = v7;
  v12 = v7;

  v13 = objc_msgSend(v9, "copy");
  v14 = (void *)v10[2];
  v10[2] = v13;

  v15 = (void *)v10[3];
  v10[3] = v8;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NTKComplication *complication;
  uint64_t v7;
  id v8;
  id v9;
  NSArray *families;
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
  v21[2] = __57__NTKBundleComplicationMigrationFallbackRequest_isEqual___block_invoke;
  v21[3] = &unk_1E6BD0630;
  v8 = v4;
  v22 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", complication, v21);
  families = self->_families;
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __57__NTKBundleComplicationMigrationFallbackRequest_isEqual___block_invoke_2;
  v19[3] = &unk_1E6BD0630;
  v11 = v8;
  v20 = v11;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", families, v19);
  device = self->_device;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __57__NTKBundleComplicationMigrationFallbackRequest_isEqual___block_invoke_3;
  v17[3] = &unk_1E6BD0630;
  v18 = v11;
  v14 = v11;
  v15 = (id)objc_msgSend(v5, "appendObject:counterpart:", device, v17);
  LOBYTE(device) = objc_msgSend(v5, "isEqual");

  return (char)device;
}

id __57__NTKBundleComplicationMigrationFallbackRequest_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

id __57__NTKBundleComplicationMigrationFallbackRequest_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

id __57__NTKBundleComplicationMigrationFallbackRequest_isEqual___block_invoke_3(uint64_t a1)
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
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_families);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_device);
  v7 = objc_msgSend(v3, "hash");

  return v7;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_complication, CFSTR("complication"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_families, CFSTR("families"));
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

- (NTKBundleComplicationMigrationFallbackRequest)initWithCoder:(id)a3
{
  id v4;
  NTKBundleComplicationMigrationFallbackRequest *v5;
  uint64_t v6;
  NTKComplication *complication;
  uint64_t v8;
  NSArray *families;
  void *v10;
  uint64_t v11;
  CLKDevice *device;

  v4 = a3;
  v5 = -[NTKBundleComplicationMigrationFallbackRequest init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NTKBundleComplicationMigrationFallbackRequestComplicationKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    complication = v5->_complication;
    v5->_complication = (NTKComplication *)v6;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("NTKBundleComplicationMigrationFallbackRequestFamiliesKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    families = v5->_families;
    v5->_families = (NSArray *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NTKBundleComplicationMigrationFallbackRequestDeviceDescriptorKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C944B0], "deviceForDescriptor:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    device = v5->_device;
    v5->_device = (CLKDevice *)v11;

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
  objc_msgSend(v5, "encodeObject:forKey:", complication, CFSTR("NTKBundleComplicationMigrationFallbackRequestComplicationKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_families, CFSTR("NTKBundleComplicationMigrationFallbackRequestFamiliesKey"));
  -[CLKDevice descriptor](self->_device, "descriptor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("NTKBundleComplicationMigrationFallbackRequestDeviceDescriptorKey"));

}

- (NTKComplication)complication
{
  return self->_complication;
}

- (NSArray)families
{
  return self->_families;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_families, 0);
  objc_storeStrong((id *)&self->_complication, 0);
}

@end
