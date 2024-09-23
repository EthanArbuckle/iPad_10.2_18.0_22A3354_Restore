@implementation __HMFSoftwareVersionDataSource

- (HMFSoftwareVersion)softwareVersion
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  void *Value;
  void *v5;
  CFTypeID v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  HMFSoftwareVersion *v11;

  v2 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (v2)
  {
    v3 = v2;
    Value = (void *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0C9AB90]);
    if (Value)
    {
      v5 = Value;
      v6 = CFGetTypeID(Value);
      if (v6 == CFStringGetTypeID())
        v7 = v5;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v8 = v7;
    CFRelease(v3);
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "operatingSystemVersion");

  v11 = -[HMFSoftwareVersion initWithMajorVersion:minorVersion:updateVersion:buildVersion:]([HMFSoftwareVersion alloc], "initWithMajorVersion:minorVersion:updateVersion:buildVersion:", 0, 0, 0, v8);
  return v11;
}

@end
