@implementation CALNEKSuggestionsServiceLogger

+ (CALNEKSuggestionsServiceLogger)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__CALNEKSuggestionsServiceLogger_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_8 != -1)
    dispatch_once(&sharedInstance_onceToken_8, block);
  return (CALNEKSuggestionsServiceLogger *)(id)sharedInstance_sharedInstance_7;
}

void __48__CALNEKSuggestionsServiceLogger_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_7;
  sharedInstance_sharedInstance_7 = v0;

}

- (void)logEventShowedTimeToLeaveNotificationWithUniqueKey:(id)a3
{
  objc_msgSend(MEMORY[0x24BE14000], "logEventShowedTimeToLeaveNotificationWithUniqueKey:", a3);
}

@end
