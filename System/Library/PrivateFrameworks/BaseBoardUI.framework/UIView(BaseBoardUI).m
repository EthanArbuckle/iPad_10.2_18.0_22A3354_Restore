@implementation UIView(BaseBoardUI)

- (uint64_t)bs_setHitTestingDisabled:()BaseBoardUI
{
  uint64_t v4;
  void *v5;

  v4 = a3 ^ 1u;
  objc_msgSend(a1, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsHitTesting:", v4);

  return objc_msgSend(a1, "setUserInteractionEnabled:", v4);
}

- (uint64_t)bs_isHitTestingDisabled
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "allowsHitTesting") & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(a1, "isUserInteractionEnabled") ^ 1;

  return v3;
}

@end
