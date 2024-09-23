@implementation HMMediaProfile(HFReordering)

- (id)hf_serviceNameComponents
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hf_serviceNameComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
