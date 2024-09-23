@implementation ICInAppMessageMetadataEntry(Utilities)

- (uint64_t)numberOfDisplays
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "metadataValueForKey:", CFSTR("__iam_internal_display_count"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue");

  return v2;
}

- (void)setNumberOfDisplays:()Utilities
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setMetadataValue:forKey:", v2, CFSTR("__iam_internal_display_count"));

}

- (uint64_t)didCancelUserNotification
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "metadataValueForKey:", CFSTR("__iam_internal_did_cancel_user_notification"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setDidCancelUserNotification:()Utilities
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setMetadataValue:forKey:", v2, CFSTR("__iam_internal_did_cancel_user_notification"));

}

@end
