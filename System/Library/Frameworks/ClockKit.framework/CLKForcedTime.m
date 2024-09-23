@implementation CLKForcedTime

uint64_t __CLKForcedTime_block_invoke()
{
  const char *v0;

  v0 = (const char *)objc_msgSend(CFSTR("CLKForcedTimeChangedNotification"), "UTF8String");
  return notify_register_dispatch(v0, &CLKForcedTime_notifyToken, MEMORY[0x24BDAC9B8], &__block_literal_global_5_0);
}

void __CLKForcedTime_block_invoke_2()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  CLKLoggingObjectForDomain(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_2114F4000, v0, OS_LOG_TYPE_DEFAULT, "Changed forced time notification", v2, 2u);
  }

  CLKForcedTime_needsUpdate = 0;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("CLKForcedTimeChangedNotification"), 0);

}

@end
