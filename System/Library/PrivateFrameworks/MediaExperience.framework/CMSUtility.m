@implementation CMSUtility

uint64_t __CMSUtility_SetIsRecording_block_invoke()
{
  uint64_t result;

  result = ct_green_tea_logger_create();
  CMSUtility_SetIsRecording_greenTeaLogger = result;
  return result;
}

void __CMSUtility_PostInterruptionCommandNotification_block_invoke(uint64_t a1)
{
  const void *v2;

  CMSMUtility_PostNotificationToSession(*(void **)(a1 + 32), (uint64_t)CFSTR("Interruption"));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);

}

void __CMSUtility_PostInterruptionCommandNotification_block_invoke_2(uint64_t a1)
{
  const void *v2;

  CMSMUtility_PostNotificationToSession(*(void **)(a1 + 32), (uint64_t)CFSTR("Interruption"));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);

}

@end
