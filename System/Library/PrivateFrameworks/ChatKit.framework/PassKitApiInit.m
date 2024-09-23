@implementation PassKitApiInit

void ___PassKitApiInit_block_invoke()
{
  void **v0;
  void *v1;
  void **v2;
  void *v3;

  if (!kPKDarwinNotificationEventInAppPresented)
  {
    v0 = (void **)MEMORY[0x193FF3C24]("PKDarwinNotificationEventInAppPresented", CFSTR("PassKitCore"));
    if (v0)
      v1 = *v0;
    else
      v1 = 0;
    objc_storeStrong((id *)&kPKDarwinNotificationEventInAppPresented, v1);
  }
  if (!kPKDarwinNotificationEventInAppDismissed)
  {
    v2 = (void **)MEMORY[0x193FF3C24]("PKDarwinNotificationEventInAppDismissed", CFSTR("PassKitCore"));
    if (v2)
      v3 = *v2;
    else
      v3 = 0;
    objc_storeStrong((id *)&kPKDarwinNotificationEventInAppDismissed, v3);
  }
}

@end
