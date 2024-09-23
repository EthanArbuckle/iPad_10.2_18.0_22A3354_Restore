@implementation ICAccessibility

- (BOOL)needsAccessibilityElements
{
  return UIAccessibilityIsVoiceOverRunning()
      || UIAccessibilityIsSwitchControlRunning()
      || _AXSCommandAndControlEnabled()
      || _AXSFullKeyboardAccessEnabled() != 0;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__ICAccessibility_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__ICAccessibilitySharedInstanceOnceToken != -1)
    dispatch_once(&sharedInstance__ICAccessibilitySharedInstanceOnceToken, block);
  return (id)sharedInstance__ICAccessibilitySharedInstance;
}

void __33__ICAccessibility_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance__ICAccessibilitySharedInstance;
  sharedInstance__ICAccessibilitySharedInstance = v0;

}

- (void)postAnnouncement:(id)a3 withSender:(id)a4 priority:(int64_t)a5
{
  UIAccessibilityPostNotification(*MEMORY[0x1E0DC44C8], a3);
}

@end
