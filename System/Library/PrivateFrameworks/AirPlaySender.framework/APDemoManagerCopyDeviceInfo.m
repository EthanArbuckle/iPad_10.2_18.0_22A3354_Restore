@implementation APDemoManagerCopyDeviceInfo

void __APDemoManagerCopyDeviceInfo_block_invoke()
{
  const void *v0;
  const void *v1;
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *ModelSpecificName;
  const void *v9;
  const void *v10;
  const void *v11;
  const void *v12;
  const void *v13;
  const void *v14;
  const void *v15;
  const void *v16;

  if (demoManagerGetShared_once != -1)
    dispatch_once(&demoManagerGetShared_once, &__block_literal_global_35);
  if (demoManagerGetShared_manager)
  {
    APDemoManagerCopyDeviceInfo_deviceInfo = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v0 = (const void *)MGCopyAnswer();
    if (v0)
    {
      v1 = v0;
      CFDictionarySetValue((CFMutableDictionaryRef)APDemoManagerCopyDeviceInfo_deviceInfo, CFSTR("DeviceUniqueID"), v0);
      CFRelease(v1);
    }
    v2 = (const void *)MGCopyAnswer();
    if (v2)
    {
      v3 = v2;
      CFDictionarySetValue((CFMutableDictionaryRef)APDemoManagerCopyDeviceInfo_deviceInfo, CFSTR("DeviceColor"), v2);
      CFRelease(v3);
    }
    v4 = (const void *)MGCopyAnswer();
    if (v4)
    {
      v5 = v4;
      CFDictionarySetValue((CFMutableDictionaryRef)APDemoManagerCopyDeviceInfo_deviceInfo, CFSTR("DeviceEnclosureColor"), v4);
      CFRelease(v5);
    }
    v6 = (const void *)MGCopyAnswer();
    if (v6)
    {
      v7 = v6;
      CFDictionarySetValue((CFMutableDictionaryRef)APDemoManagerCopyDeviceInfo_deviceInfo, CFSTR("iOS Build"), v6);
      CFRelease(v7);
    }
    ModelSpecificName = (const void *)CelestialGetModelSpecificName();
    if (ModelSpecificName)
      CFDictionarySetValue((CFMutableDictionaryRef)APDemoManagerCopyDeviceInfo_deviceInfo, CFSTR("DeviceModel"), ModelSpecificName);
    v9 = (const void *)MGCopyAnswer();
    if (v9)
    {
      v10 = v9;
      CFDictionarySetValue((CFMutableDictionaryRef)APDemoManagerCopyDeviceInfo_deviceInfo, CFSTR("DeviceCornerRadius"), v9);
      CFRelease(v10);
    }
    v11 = (const void *)MGCopyAnswer();
    if (v11)
    {
      v12 = v11;
      CFDictionarySetValue((CFMutableDictionaryRef)APDemoManagerCopyDeviceInfo_deviceInfo, CFSTR("DeviceScreenScale"), v11);
      CFRelease(v12);
    }
    v13 = (const void *)MGCopyAnswer();
    if (v13)
    {
      v14 = v13;
      CFDictionarySetValue((CFMutableDictionaryRef)APDemoManagerCopyDeviceInfo_deviceInfo, CFSTR("DeviceScreenWidth"), v13);
      CFRelease(v14);
    }
    v15 = (const void *)MGCopyAnswer();
    if (v15)
    {
      v16 = v15;
      CFDictionarySetValue((CFMutableDictionaryRef)APDemoManagerCopyDeviceInfo_deviceInfo, CFSTR("DeviceScreenHeight"), v15);
      CFRelease(v16);
    }
    if (gLogCategory_APDemoManager <= 50
      && (gLogCategory_APDemoManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

@end
