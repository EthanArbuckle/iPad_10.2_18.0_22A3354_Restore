CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

eturn 0;
  }
}

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  _BOOL4 v8;
  __CFNotificationCenter *DarwinNotifyCenter;

  v8 = -[CoreLocationAccountNotificationPlugin accountIsManagedAppleID:](self, "accountIsManagedAppleID:", a6, *(_QWORD *)&a4, a5);
  if (v8 != -[CoreLocationAccountNotificationPlugin accountIsManagedAppleID:](self, "accountIsManagedAppleID:", a3))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.locationd.appleAccountDidChange"), 0, 0, 1u);
  }
}

@end
