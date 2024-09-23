@implementation FEInternalPreferencesRevisionInit

void _FEInternalPreferencesRevisionInit_block_invoke()
{
  void *v0;
  void *v1;
  __CFNotificationCenter *DarwinNotifyCenter;
  id obj;

  if (os_variant_has_internal_diagnostics())
  {
    _FEPreferencesOnce();
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "objectForKey:", CFSTR("InternalPreferencesEnabled"));
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = v0;
    if (v0 && !objc_msgSend(v0, "BOOLValue"))
    {
      _FEInternalPreferencesRevisionVar = -1;
    }
    else
    {
      objc_storeStrong((id *)&_revisionDefaults, obj);
      _FEInternalPreferencesRevisionVar = 1;
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)notificationHandler, CFSTR("com.apple.FocusEngine.InternalPreferences"), 0, CFNotificationSuspensionBehaviorCoalesce);
    }

  }
}

@end
