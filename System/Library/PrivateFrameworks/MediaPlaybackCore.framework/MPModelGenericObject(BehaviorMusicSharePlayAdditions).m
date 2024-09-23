@implementation MPModelGenericObject(BehaviorMusicSharePlayAdditions)

- (id)msp_shortDescription
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "anyObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "msp_shortDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "insertString:atIndex:", CFSTR("Generic-"), 1);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

@end
