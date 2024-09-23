@implementation UIView(GKAdditions)

- (void)_gkEnumerateSubviewsUsingBlock:()GKAdditions
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__UIView_GKAdditions___gkEnumerateSubviewsUsingBlock___block_invoke;
  v7[3] = &unk_24DC27720;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

- (void)_gkAddStandardFadeTransition
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDE57E8], "animation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setType:", *MEMORY[0x24BDE5E00]);
  objc_msgSend(v4, "setDuration:", 0.3);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D18]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimingFunction:", v2);

  objc_msgSend(v4, "setFillMode:", *MEMORY[0x24BDE5970]);
  objc_msgSend(a1, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAnimation:forKey:", v4, 0);

}

- (uint64_t)_gkDisableDefaultFocusEffect
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a1, "setFocusEffect:", 0);
  return result;
}

- (double)_gkPopoverPresentationArea
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(a1, "_gkPopoverPresentationRect");
  v3 = v2;
  objc_msgSend(a1, "_gkPopoverPresentationInsets");
  return v3 + v4;
}

- (double)_gkPopoverPresentationInsets
{
  return 10.0;
}

- (void)_gkPerformWithoutAnimationWhenRotating:()GKAdditions
{
  void *v4;
  int v5;
  void (**v6)(void);

  v6 = a3;
  objc_msgSend(a1, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRotating");

  if (v5)
    objc_msgSend((id)objc_opt_class(), "performWithoutAnimation:", v6);
  else
    v6[2]();

}

@end
