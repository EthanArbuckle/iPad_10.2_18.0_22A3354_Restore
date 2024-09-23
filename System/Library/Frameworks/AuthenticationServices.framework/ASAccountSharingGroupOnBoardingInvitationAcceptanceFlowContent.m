@implementation ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent

void __100___ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent__bulletListItemImageConfiguration__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD5E0], "_preferredFontForTextStyle:weight:", *MEMORY[0x24BEBE210], *MEMORY[0x24BEBE270]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "configurationWithFont:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_bulletListItemImageConfiguration_imageConfiguration_0;
  _bulletListItemImageConfiguration_imageConfiguration_0 = v1;

}

@end
