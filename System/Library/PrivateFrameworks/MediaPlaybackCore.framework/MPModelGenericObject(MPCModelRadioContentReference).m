@implementation MPModelGenericObject(MPCModelRadioContentReference)

- (id)mpc_radioContentReference
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "flattenedGenericObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mpc_radioContentReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
