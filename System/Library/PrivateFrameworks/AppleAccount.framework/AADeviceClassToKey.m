@implementation AADeviceClassToKey

void ___AADeviceClassToKey_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("iPhone");
  v2[1] = CFSTR("iPad");
  v3[0] = CFSTR("IPHONE");
  v3[1] = CFSTR("IPAD");
  v2[2] = CFSTR("iPod");
  v2[3] = CFSTR("AppleTV");
  v3[2] = CFSTR("IPOD");
  v3[3] = CFSTR("APPLETV");
  v2[4] = CFSTR("Watch");
  v3[4] = CFSTR("WATCH");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_AADeviceClassToKey_deviceMapping;
  _AADeviceClassToKey_deviceMapping = v0;

}

@end
