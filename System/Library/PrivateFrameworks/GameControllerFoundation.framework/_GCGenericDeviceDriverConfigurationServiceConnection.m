@implementation _GCGenericDeviceDriverConfigurationServiceConnection

+ (id)serviceProtocol
{
  return &unk_1F03A9990;
}

- (id)fetchDeviceSnapshot
{
  return -[_GCDeviceDriverServiceConnection serviceVendorRequestWithLabel:handler:](self, "serviceVendorRequestWithLabel:handler:", CFSTR("Fetch Device Snapshot"), &__block_literal_global_13);
}

- (id)applyConfiguration:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75___GCGenericDeviceDriverConfigurationServiceConnection_applyConfiguration___block_invoke;
  v8[3] = &unk_1EA4D4158;
  v9 = v4;
  v5 = v4;
  -[_GCDeviceDriverServiceConnection serviceVendorRequestWithLabel:handler:](self, "serviceVendorRequestWithLabel:handler:", CFSTR("Apply Configuration"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
