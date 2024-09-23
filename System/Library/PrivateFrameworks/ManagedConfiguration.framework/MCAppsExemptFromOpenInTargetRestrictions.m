@implementation MCAppsExemptFromOpenInTargetRestrictions

void __MCAppsExemptFromOpenInTargetRestrictions_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[9];

  v4[8] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("com.apple.phone.addressbooksyncd");
  v4[1] = CFSTR("com.apple.AssistantServices");
  v4[2] = CFSTR("com.apple.mobilecal.CalendarFocusConfigurationExtension");
  v4[3] = CFSTR("com.apple.mobilecal.widget");
  v4[4] = CFSTR("com.apple.watch.addressbooksyncd");
  v4[5] = CFSTR("com.apple.TelephonyUtilities.PhoneIntentHandler");
  v4[6] = CFSTR("com.apple.Preferences");
  v4[7] = CFSTR("com.apple.siri");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)MCAppsExemptFromOpenInTargetRestrictions_retval;
  MCAppsExemptFromOpenInTargetRestrictions_retval = v2;

}

@end
