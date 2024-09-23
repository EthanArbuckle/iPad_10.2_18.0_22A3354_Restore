@implementation DRSDeviceMetadata

void __DRSDeviceMetadata_block_invoke()
{
  DRSProtoClientDeviceMetadata *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v0 = objc_alloc_init(DRSProtoClientDeviceMetadata);
  v1 = (void *)DRSDeviceMetadata_deviceMetadata;
  DRSDeviceMetadata_deviceMetadata = (uint64_t)v0;

  +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buildVariant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)DRSDeviceMetadata_deviceMetadata, "setBuildVariant:", v2);

  objc_msgSend(v6, "deviceCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)DRSDeviceMetadata_deviceMetadata, "setDeviceCategory:", v3);

  objc_msgSend(v6, "deviceModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)DRSDeviceMetadata_deviceMetadata, "setDeviceModel:", v4);

  objc_msgSend(v6, "platformString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)DRSDeviceMetadata_deviceMetadata, "setPlatform:", v5);

}

@end
