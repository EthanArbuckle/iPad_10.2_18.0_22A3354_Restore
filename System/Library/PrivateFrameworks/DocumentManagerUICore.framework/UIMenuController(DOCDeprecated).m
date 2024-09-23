@implementation UIMenuController(DOCDeprecated)

- (void)hideMenuIfActive
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDF6890], "activeCalloutBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(a1, "hideMenu");
}

@end
