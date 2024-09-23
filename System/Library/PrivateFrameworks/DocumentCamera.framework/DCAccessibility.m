@implementation DCAccessibility

- (void)postAnnouncement:(id)a3 withSender:(id)a4 priority:(int64_t)a5
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], a3);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__DCAccessibility_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__DCAccessibilitySharedInstanceOnceToken != -1)
    dispatch_once(&sharedInstance__DCAccessibilitySharedInstanceOnceToken, block);
  return (id)sharedInstance__DCAccessibilitySharedInstance;
}

void __33__DCAccessibility_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance__DCAccessibilitySharedInstance;
  sharedInstance__DCAccessibilitySharedInstance = v0;

}

@end
