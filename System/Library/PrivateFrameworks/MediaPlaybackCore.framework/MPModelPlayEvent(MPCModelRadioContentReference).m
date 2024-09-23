@implementation MPModelPlayEvent(MPCModelRadioContentReference)

- (id)mpc_radioContentReference
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "genericObjectRepresentation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "mpc_radioContentReference");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
