@implementation MCAccountBasedAppsForDragDrop

void __MCAccountBasedAppsForDragDrop_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[19];

  v4[18] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("com.apple.mobilemail");
  v4[1] = CFSTR("com.apple.mobilecal");
  v4[2] = CFSTR("com.apple.mobilenotes");
  v4[3] = CFSTR("com.apple.MobileAddressBook");
  v4[4] = CFSTR("com.apple.MailCompositionService");
  v4[5] = CFSTR("com.apple.NanoCalendar");
  v4[6] = CFSTR("com.apple.calaccessd");
  v4[7] = CFSTR("com.apple.UpNextWidget.extension");
  v4[8] = CFSTR("com.apple.CalendarNotification.CalendarContentExtension");
  v4[9] = CFSTR("com.apple.SafariViewService");
  v4[10] = CFSTR("com.apple.reminders");
  v4[11] = CFSTR("com.apple.DocumentsApp");
  v4[12] = CFSTR("com.apple.DocumentManagerUICore.RecentsAvocado");
  v4[13] = CFSTR("com.apple.DocumentManagerUICore.Service");
  v4[14] = CFSTR("com.apple.quicklook.extension.previewUI");
  v4[15] = CFSTR("com.apple.quicklook.UIExtension");
  v4[16] = CFSTR("com.apple.DocumentManagerUICore.RecentsAppPopover");
  v4[17] = CFSTR("com.apple.springboard");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 18);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)MCAccountBasedAppsForDragDrop_accountBasedApps;
  MCAccountBasedAppsForDragDrop_accountBasedApps = v2;

}

@end
