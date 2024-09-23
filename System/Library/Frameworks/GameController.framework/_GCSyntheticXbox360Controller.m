@implementation _GCSyntheticXbox360Controller

+ (id)devicePropertiesWithDescription:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[6];
  _QWORD v12[7];

  v12[6] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!devicePropertiesWithDescription__BaseProperties)
  {
    v11[0] = CFSTR("ReportDescriptor");
    +[NSData dataWithBytes:length:](&off_254DEDA10, "dataWithBytes:length:", &Xbox360DeviceDescriptor, 188);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v4;
    v12[1] = CFSTR("Microsoft");
    v11[1] = CFSTR("Manufacturer");
    v11[2] = CFSTR("Product");
    v12[2] = CFSTR("GamePad-1");
    v12[3] = &unk_24D30E0F8;
    v11[3] = CFSTR("VendorID");
    v11[4] = CFSTR("ProductID");
    v11[5] = CFSTR("VersionNumber");
    v12[4] = &unk_24D30E110;
    v12[5] = &unk_24D30E128;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v12, v11, 6);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)devicePropertiesWithDescription__BaseProperties;
    devicePropertiesWithDescription__BaseProperties = v5;

  }
  v7 = objc_alloc_init((Class)&off_254DEBD30);
  objc_msgSend(v7, "addEntriesFromDictionary:", devicePropertiesWithDescription__BaseProperties);
  objc_msgSend(v7, "setObject:forKey:", CFSTR("Xbox360Controller"), CFSTR("_GCSyntheticDeviceType"));
  objc_msgSend(v3, "controllerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("_GCSyntheticDeviceControllerIdentifier"));

  return v7;
}

@end
