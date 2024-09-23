@implementation MCAppsExemptFromOpenInTargetRestrictionsForContacts

void __MCAppsExemptFromOpenInTargetRestrictionsForContacts_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[8];

  v4[7] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("com.apple.asd");
  v4[1] = CFSTR("com.apple.telephonyutilities.callservicesd");
  v4[2] = CFSTR("com.apple.routined");
  v4[3] = CFSTR("com.apple.sharingd");
  v4[4] = CFSTR("com.apple.siriknowledged");
  v4[5] = CFSTR("com.apple.suggestd");
  v4[6] = CFSTR("com.apple.transparencyd");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)MCAppsExemptFromOpenInTargetRestrictionsForContacts_retval;
  MCAppsExemptFromOpenInTargetRestrictionsForContacts_retval = v2;

}

@end
