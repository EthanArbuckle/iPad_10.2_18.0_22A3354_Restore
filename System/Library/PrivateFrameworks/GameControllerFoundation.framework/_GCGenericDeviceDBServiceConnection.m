@implementation _GCGenericDeviceDBServiceConnection

+ (id)serviceProtocol
{
  return &unk_1F03A4588;
}

- (id)hasModelForDevice:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57___GCGenericDeviceDBServiceConnection_hasModelForDevice___block_invoke;
  v8[3] = &unk_1EA4D3E28;
  v9 = v4;
  v5 = v4;
  -[GCConfigXPCServiceServiceConnection serviceVendorRequestWithLabel:handler:](self, "serviceVendorRequestWithLabel:handler:", CFSTR("Has Model For Device"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)preparedModelForDevice:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62___GCGenericDeviceDBServiceConnection_preparedModelForDevice___block_invoke;
  v8[3] = &unk_1EA4D3E28;
  v9 = v4;
  v5 = v4;
  -[GCConfigXPCServiceServiceConnection serviceVendorRequestWithLabel:handler:](self, "serviceVendorRequestWithLabel:handler:", CFSTR("Has Model For Device"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
