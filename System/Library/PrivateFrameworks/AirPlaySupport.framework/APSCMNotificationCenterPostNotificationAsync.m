@implementation APSCMNotificationCenterPostNotificationAsync

void __APSCMNotificationCenterPostNotificationAsync_block_invoke(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;

  CMNotificationCenterPostNotification();
  v2 = (const void *)a1[4];
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[5];
  if (v3)
    CFRelease(v3);
  v4 = (const void *)a1[6];
  if (v4)
    CFRelease(v4);
  v5 = (const void *)a1[7];
  if (v5)
    CFRelease(v5);
}

@end
