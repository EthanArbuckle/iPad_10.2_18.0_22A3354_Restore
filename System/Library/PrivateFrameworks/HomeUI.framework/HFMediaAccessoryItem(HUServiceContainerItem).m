@implementation HFMediaAccessoryItem(HUServiceContainerItem)

- (id)hu_containedServices
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_visibleServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
