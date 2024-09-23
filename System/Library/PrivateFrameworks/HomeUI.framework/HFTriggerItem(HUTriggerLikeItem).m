@implementation HFTriggerItem(HUTriggerLikeItem)

- (id)identifier
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "trigger");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
