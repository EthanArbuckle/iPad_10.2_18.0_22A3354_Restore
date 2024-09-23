@implementation NSNotification(AVTAvatarStoreNotification)

- (id)_avtui_changedRecordIdentifiers
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("changedRecordIDs"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
