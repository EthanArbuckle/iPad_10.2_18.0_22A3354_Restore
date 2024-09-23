@implementation HAPCharacteristicValueActiveTransitionContext(Validator)

- (BOOL)isValid
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a1, "HAPInstanceID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "timeElapsedSinceStart");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
