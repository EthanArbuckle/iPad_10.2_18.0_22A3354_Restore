@implementation EFDevice

+ (EFDevice)currentDevice
{
  if (currentDeviceOnceToken != -1)
    dispatch_once(&currentDeviceOnceToken, &__block_literal_global_3);
  return (EFDevice *)(id)sCurrentDevice;
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (BOOL)isAppleSilicon
{
  return 0;
}

- (NSUUID)identifier
{
  NSUUID *identifier;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSUUID *v9;
  NSUUID *v10;
  NSUUID *v11;
  NSUUID *v12;
  void *v13;

  identifier = self->_identifier;
  if (!identifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.mail"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("group.com.apple.mail"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    objc_msgSend(v6, "stringForKey:", CFSTR("DeviceIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v8);
      v10 = self->_identifier;
      self->_identifier = v9;

    }
    if (!self->_identifier)
    {
      v11 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
      v12 = self->_identifier;
      self->_identifier = v11;

      -[NSUUID UUIDString](self->_identifier, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v13, CFSTR("DeviceIdentifier"));

    }
    identifier = self->_identifier;
  }
  return identifier;
}

void __25__EFDevice_currentDevice__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[EFDevice _init]([EFDevice alloc], "_init");
  v1 = (void *)sCurrentDevice;
  sCurrentDevice = (uint64_t)v0;

}

- (id)_init
{
  EFDevice *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EFDevice;
  v2 = -[EFDevice init](&v4, sel_init);
  if (v2)
    -[EFDevice setIsInternal:](v2, "setIsInternal:", os_variant_has_internal_diagnostics());
  return v2;
}

- (void)setIsInternal:(BOOL)a3
{
  self->_isInternal = a3;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __15__EFDevice_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_1 != -1)
    dispatch_once(&log_onceToken_1, block);
  return (OS_os_log *)(id)log_log_1;
}

void __15__EFDevice_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_1;
  log_log_1 = (uint64_t)v1;

}

+ (void)setCurrentDevice:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  if (currentDeviceOnceToken != -1)
  {
    v6 = v4;
    dispatch_once(&currentDeviceOnceToken, &__block_literal_global_5);
    v4 = v6;
    if (v6)
      goto LABEL_3;
LABEL_5:
    currentDeviceOnceToken = 0;
    goto LABEL_6;
  }
  if (!v4)
    goto LABEL_5;
LABEL_3:
  v5 = v4;
  objc_storeStrong((id *)&sCurrentDevice, a3);
  v4 = v5;
LABEL_6:

}

+ (id)testingDeviceWithInternal:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = -[EFDevice _init]([EFDevice alloc], "_init");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  objc_msgSend(v4, "setIdentifier:", v5);

  objc_msgSend(v4, "setIsInternal:", v3);
  return v4;
}

- (NSString)platformName
{
  return (NSString *)CFSTR("iOS");
}

- (BOOL)isPlatform:(int64_t)a3
{
  return a3 & 1;
}

- (BOOL)isRunningNative
{
  size_t v4;
  int v5;

  v5 = 0;
  v4 = 4;
  if (sysctlbyname("sysctl.proc_native", &v5, &v4, 0, 0) == -1)
    return *__error() == 2;
  else
    return v5 == 1;
}

- (BOOL)supportsGenerativeModelSystems
{
  if (supportsGenerativeModelSystems_onceToken != -1)
    dispatch_once(&supportsGenerativeModelSystems_onceToken, &__block_literal_global_15);
  return supportsGenerativeModelSystems_supportsGenerativeModelSystems;
}

uint64_t __42__EFDevice_supportsGenerativeModelSystems__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  supportsGenerativeModelSystems_supportsGenerativeModelSystems = result;
  return result;
}

- (BOOL)isPhone
{
  if (isPhone_onceToken != -1)
    dispatch_once(&isPhone_onceToken, &__block_literal_global_18);
  return isPhone_isPhone;
}

void __19__EFDevice_isPhone__block_invoke()
{
  const void *v0;
  const void *v1;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    if (CFEqual(v0, CFSTR("iPhone")))
      isPhone_isPhone = 1;
    CFRelease(v1);
  }
}

- (BOOL)isVirtualMachine
{
  if (isVirtualMachine_onceToken != -1)
    dispatch_once(&isVirtualMachine_onceToken, &__block_literal_global_23);
  return isVirtualMachine_result;
}

uint64_t __28__EFDevice_isVirtualMachine__block_invoke()
{
  uint64_t result;
  size_t v1;
  int v2;

  v2 = 0;
  v1 = 4;
  result = sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0, 0);
  if (!(_DWORD)result)
    isVirtualMachine_result = v2 != 0;
  return result;
}

+ (void)executeWithDeviceIsInternal:(id)a3
{
  WithDeviceIsInternal(a3, 1);
}

+ (void)executeWithDeviceIsExternal:(id)a3
{
  WithDeviceIsInternal(a3, 0);
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
