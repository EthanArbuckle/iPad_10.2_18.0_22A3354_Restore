@implementation UIControl(AXPriv)

- (uint64_t)_feldsparAccessibilityPresentMenu
{
  void *v2;
  char v3;

  if (objc_msgSend(a1, "showsMenuAsPrimaryAction"))
  {
    objc_msgSend(a1, "contextMenuInteraction");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();
    if ((v3 & 1) != 0)
    {
      objc_msgSend(a1, "accessibilityActivationPoint");
      objc_msgSend(v2, "_presentMenuAtLocation:");
    }

  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

@end
