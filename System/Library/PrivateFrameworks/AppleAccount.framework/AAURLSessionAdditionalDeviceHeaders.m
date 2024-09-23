@implementation AAURLSessionAdditionalDeviceHeaders

void ___AAURLSessionAdditionalDeviceHeaders_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[AADeviceInfo currentInfo](AADeviceInfo, "currentInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "udid");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v1, CFSTR("X-Apple-Device-Id"));
  +[AADeviceInfo currentInfo](AADeviceInfo, "currentInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serialNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v3, CFSTR("X-Apple-I-SRL-NO"));
  v4 = objc_msgSend(v6, "copy");
  v5 = (void *)_AAURLSessionAdditionalDeviceHeaders_additionalDeviceHeaders;
  _AAURLSessionAdditionalDeviceHeaders_additionalDeviceHeaders = v4;

}

@end
