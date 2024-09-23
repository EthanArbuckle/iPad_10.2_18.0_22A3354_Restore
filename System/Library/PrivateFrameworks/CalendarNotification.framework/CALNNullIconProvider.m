@implementation CALNNullIconProvider

+ (CALNNullIconProvider)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__CALNNullIconProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (CALNNullIconProvider *)(id)sharedInstance_sharedInstance;
}

void __38__CALNNullIconProvider_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;

}

- (id)pngDataForIconWithIdentifier:(id)a3
{
  return 0;
}

- (id)identifierForIconWithDate:(id)a3 inCalendar:(id)a4
{
  return &stru_24D4856D0;
}

@end
