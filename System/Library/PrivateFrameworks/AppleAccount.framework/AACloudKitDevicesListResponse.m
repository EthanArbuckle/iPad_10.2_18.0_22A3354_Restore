@implementation AACloudKitDevicesListResponse

- (AACloudKitDevicesListResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  AACloudKitDevicesListResponse *v4;
  AACloudKitDevicesListResponse *v5;
  void *v6;
  uint64_t v7;
  NSArray *incompatibleDevices;
  uint64_t v9;
  NSArray *incompatibleDeviceNames;
  void *v11;
  uint64_t v12;
  NSArray *needUpgradeDevices;
  uint64_t v14;
  NSArray *needUpgradeDeviceNames;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AACloudKitDevicesListResponse;
  v4 = -[AAResponse initWithHTTPResponse:data:](&v17, sel_initWithHTTPResponse_data_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[AAResponse responseDictionary](v4, "responseDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("neverEligible"));
    v7 = objc_claimAutoreleasedReturnValue();
    incompatibleDevices = v5->_incompatibleDevices;
    v5->_incompatibleDevices = (NSArray *)v7;

    -[NSArray aaf_map:](v5->_incompatibleDevices, "aaf_map:", &__block_literal_global_565);
    v9 = objc_claimAutoreleasedReturnValue();
    incompatibleDeviceNames = v5->_incompatibleDeviceNames;
    v5->_incompatibleDeviceNames = (NSArray *)v9;

    -[AAResponse responseDictionary](v5, "responseDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("needsUpgrade"));
    v12 = objc_claimAutoreleasedReturnValue();
    needUpgradeDevices = v5->_needUpgradeDevices;
    v5->_needUpgradeDevices = (NSArray *)v12;

    -[NSArray aaf_map:](v5->_needUpgradeDevices, "aaf_map:", &__block_literal_global_568);
    v14 = objc_claimAutoreleasedReturnValue();
    needUpgradeDeviceNames = v5->_needUpgradeDeviceNames;
    v5->_needUpgradeDeviceNames = (NSArray *)v14;

  }
  return v5;
}

uint64_t __59__AACloudKitDevicesListResponse_initWithHTTPResponse_data___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("name"));
}

uint64_t __59__AACloudKitDevicesListResponse_initWithHTTPResponse_data___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("name"));
}

- (NSArray)incompatibleDevices
{
  return self->_incompatibleDevices;
}

- (NSArray)needUpgradeDevices
{
  return self->_needUpgradeDevices;
}

- (NSArray)incompatibleDeviceNames
{
  return self->_incompatibleDeviceNames;
}

- (NSArray)needUpgradeDeviceNames
{
  return self->_needUpgradeDeviceNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_needUpgradeDeviceNames, 0);
  objc_storeStrong((id *)&self->_incompatibleDeviceNames, 0);
  objc_storeStrong((id *)&self->_needUpgradeDevices, 0);
  objc_storeStrong((id *)&self->_incompatibleDevices, 0);
}

@end
