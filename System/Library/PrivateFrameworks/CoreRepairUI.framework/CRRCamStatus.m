@implementation CRRCamStatus

- (CRRCamStatus)init
{
  CRRCamStatus *v2;
  CRRCamStatus *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRRCamStatus;
  v2 = -[CRComponentAuth init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CRComponentAuth setComponentName:](v2, "setComponentName:", CFSTR("RCameraFailed"));
  return v3;
}

- (int64_t)getIORegComponentStatus
{
  io_registry_entry_t v2;
  io_registry_entry_t v3;
  const __CFAllocator *v4;
  void *CFProperty;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v15;
  int v17;
  BOOL v18;
  NSObject *v19;

  v2 = sub_22AC7DB80();
  if (v2)
  {
    v3 = v2;
    v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    CFProperty = (void *)IORegistryEntryCreateCFProperty(v2, CFSTR("BackTeleCameraExpected"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    v6 = (void *)IORegistryEntryCreateCFProperty(v3, CFSTR("BackSuperWideCameraExpected"), v4, 0);
    v7 = (void *)IORegistryEntryCreateCFProperty(v3, CFSTR("BackCameraExpected"), v4, 0);
    v8 = (void *)IORegistryEntryCreateCFProperty(v3, CFSTR("BackDepthCameraExpected"), v4, 0);
    v9 = (void *)IORegistryEntryCreateCFProperty(v3, CFSTR("BackTeleCameraModuleSerialNumString"), v4, 0);
    v10 = (void *)IORegistryEntryCreateCFProperty(v3, CFSTR("BackSuperWideCameraModuleSerialNumString"), v4, 0);
    v11 = (void *)IORegistryEntryCreateCFProperty(v3, CFSTR("BackCameraModuleSerialNumString"), v4, 0);
    v12 = (void *)IORegistryEntryCreateCFProperty(v3, CFSTR("JasperSNUM"), v4, 0);
    IOObjectRelease(v3);
    if (objc_msgSend(CFProperty, "intValue") == 1 && v9 == 0)
    {
      v9 = 0;
    }
    else
    {
      if (objc_msgSend(v6, "intValue") != 1 || v10 != 0)
      {
        v15 = -1;
        if (objc_msgSend(v7, "intValue") == 1 && v11 == 0)
        {
          v11 = 0;
        }
        else
        {
          v17 = objc_msgSend(v8, "intValue");
          if (v12)
            v18 = 0;
          else
            v18 = v17 == 1;
          if (!v18)
            v15 = 1;
        }
        goto LABEL_26;
      }
      v10 = 0;
    }
    v15 = -1;
    goto LABEL_26;
  }
  sub_22AC82A9C(0);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    sub_22AC860A4();

  CFProperty = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v11 = 0;
  v10 = 0;
  v9 = 0;
  v12 = 0;
  v15 = 0;
LABEL_26:

  return v15;
}

- (BOOL)isComponentFailed
{
  return -[CRRCamStatus getIORegComponentStatus](self, "getIORegComponentStatus") == -1;
}

@end
