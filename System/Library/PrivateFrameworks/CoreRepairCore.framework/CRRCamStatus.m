@implementation CRRCamStatus

- (CRRCamStatus)init
{
  CRRCamStatus *v2;
  const char *v3;
  uint64_t v4;
  CRRCamStatus *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRRCamStatus;
  v2 = -[CRComponentAuth init](&v7, sel_init);
  v5 = v2;
  if (v2)
    objc_msgSend_setComponentName_(v2, v3, (uint64_t)CFSTR("RCameraFailed"), v4);
  return v5;
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
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  int v29;
  BOOL v30;
  NSObject *v31;

  v2 = sub_2145149E0((uint64_t)self, a2);
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
    if (objc_msgSend_intValue(CFProperty, v13, v14, v15) == 1 && v9 == 0)
    {
      v9 = 0;
    }
    else
    {
      if (objc_msgSend_intValue(v6, v16, v17, v18) != 1 || v10 != 0)
      {
        v27 = -1;
        if (objc_msgSend_intValue(v7, v20, v21, v22) == 1 && v11 == 0)
        {
          v11 = 0;
        }
        else
        {
          v29 = objc_msgSend_intValue(v8, v24, v25, v26);
          if (v12)
            v30 = 0;
          else
            v30 = v29 == 1;
          if (!v30)
            v27 = 1;
        }
        goto LABEL_26;
      }
      v10 = 0;
    }
    v27 = -1;
    goto LABEL_26;
  }
  handleForCategory(0);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    sub_214568B44();

  CFProperty = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v11 = 0;
  v10 = 0;
  v9 = 0;
  v12 = 0;
  v27 = 0;
LABEL_26:

  return v27;
}

- (BOOL)isComponentFailed
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_getIORegComponentStatus(self, a2, v2, v3) == -1;
}

@end
