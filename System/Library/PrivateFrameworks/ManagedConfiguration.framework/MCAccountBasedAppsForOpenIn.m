@implementation MCAccountBasedAppsForOpenIn

void __MCAccountBasedAppsForOpenIn_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[32];

  v4[31] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("com.apple.bird");
  v4[1] = CFSTR("com.apple.calaccessd");
  v4[2] = CFSTR("com.apple.mobilecal");
  v4[3] = CFSTR("com.apple.CalendarNotification.CalendarContentExtension");
  v4[4] = CFSTR("com.apple.mobilecal.CalendarWidgetExtension");
  v4[5] = CFSTR("com.apple.CalendarWidget.IntentsExtension");
  v4[6] = CFSTR("com.apple.CallHistorySyncHelper");
  v4[7] = CFSTR("com.apple.telephonyutilities.callservicesd");
  v4[8] = CFSTR("com.apple.DocumentManagerUICore.RecentsAppPopover");
  v4[9] = CFSTR("com.apple.DocumentsApp");
  v4[10] = CFSTR("com.apple.DocumentManagerUICore.RecentsAvocado");
  v4[11] = CFSTR("com.apple.NanoCalendar");
  v4[12] = CFSTR("com.apple.callhistory.sync-helper");
  v4[13] = CFSTR("com.apple.mobilemail");
  v4[14] = CFSTR("com.apple.MailCompositionService");
  v4[15] = CFSTR("com.apple.email.maild");
  v4[16] = CFSTR("com.apple.EmailDaemon");
  v4[17] = CFSTR("com.apple.mobilemail.MailIntentsExtension");
  v4[18] = CFSTR("com.apple.mobilenotes");
  v4[19] = CFSTR("com.apple.MobileAddressBook");
  v4[20] = CFSTR("com.apple.profilectl");
  v4[21] = CFSTR("com.apple.reminders");
  v4[22] = CFSTR("com.apple.SafariViewService");
  v4[23] = CFSTR("com.apple.WorkflowKit.BackgroundShortcutRunner");
  v4[24] = CFSTR("com.apple.shortcuts");
  v4[25] = CFSTR("com.apple.WorkflowKit.ShortcutsIntents");
  v4[26] = CFSTR("com.apple.shortcuts.runtime");
  v4[27] = CFSTR("com.apple.shortcuts.Today-Extension");
  v4[28] = CFSTR("com.apple.shortcuts.Run-Workflow");
  v4[29] = CFSTR("com.apple.TelephonyUtilities");
  v4[30] = CFSTR("com.apple.UpNextWidget.extension");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 31);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)MCAccountBasedAppsForOpenIn_accountBasedApps;
  MCAccountBasedAppsForOpenIn_accountBasedApps = v2;

}

@end
