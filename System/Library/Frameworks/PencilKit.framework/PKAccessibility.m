@implementation PKAccessibility

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__PKAccessibility_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECEE6270 != -1)
    dispatch_once(&qword_1ECEE6270, block);
  return (id)_MergedGlobals_134;
}

void __33__PKAccessibility_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_134;
  _MergedGlobals_134 = v0;

}

- (void)postAnnouncement:(id)a3 withSender:(id)a4 priority:(int64_t)a5
{
  UIAccessibilityPostNotification(*MEMORY[0x1E0DC44C8], a3);
}

@end
