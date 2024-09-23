@implementation UITableViewCell(HealthUICHR)

- (void)hkui_configuredForCHR3rdPartyAPIFlowWhilePrompting:()HealthUICHR
{
  void *v4;
  uint64_t v5;
  void *v6;

  if (a3)
  {
    objc_msgSend(a1, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 != 6)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setBackgroundColor:", v6);

    }
  }
  return a1;
}

@end
