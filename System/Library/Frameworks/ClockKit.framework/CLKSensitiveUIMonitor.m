@implementation CLKSensitiveUIMonitor

void __38__CLKSensitiveUIMonitor_sharedMonitor__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedMonitor_monitor;
  sharedMonitor_monitor = (uint64_t)v1;

}

- (BOOL)isSensitiveUIEnabled
{
  return 1;
}

+ (id)sharedMonitor
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__CLKSensitiveUIMonitor_sharedMonitor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMonitor_onceToken != -1)
    dispatch_once(&sharedMonitor_onceToken, block);
  return (id)sharedMonitor_monitor;
}

- (BOOL)_isVendorRelease
{
  if (_isVendorRelease_onceToken != -1)
    dispatch_once(&_isVendorRelease_onceToken, &__block_literal_global_10);
  return _isVendorRelease___isVendorRelease;
}

void __41__CLKSensitiveUIMonitor__isVendorRelease__block_invoke()
{
  id v0;

  v0 = (id)MGGetStringAnswer();
  _isVendorRelease___isVendorRelease = objc_msgSend(CFSTR("Vendor"), "isEqualToString:", v0);

}

- (BOOL)shouldHideForSensitivity:(int64_t)a3
{
  return ((unint64_t)a3 >= 0xD || ((0x1FFDu >> a3) & 1) == 0)
      && -[CLKSensitiveUIMonitor _isVendorRelease](self, "_isVendorRelease");
}

- (BOOL)considersUISensitivitySensitive:(int64_t)a3
{
  return a3 == 29 || a3 == 1;
}

@end
