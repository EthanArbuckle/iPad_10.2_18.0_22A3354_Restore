@implementation ICSEvent(SGCalendarAttachmentDissectorUtility)

- (id)firstValueOfPropertyForName:()SGCalendarAttachmentDissectorUtility
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "propertiesForName:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
