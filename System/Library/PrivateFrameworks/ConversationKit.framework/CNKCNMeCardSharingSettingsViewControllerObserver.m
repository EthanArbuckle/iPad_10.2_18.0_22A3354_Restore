@implementation CNKCNMeCardSharingSettingsViewControllerObserver

- (void)sharingSettingsViewController:(id)a3 didUpdateSharingState:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0D398E8], "sharedInstance", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSharingEnabled:", v4);

}

- (void)sharingSettingsViewController:(id)a3 didSelectSharingAudience:(unint64_t)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0D398E8], "sharedInstance", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSharingAudience:", a4);

}

- (void)sharingSettingsViewController:(id)a3 didUpdateWithSharingResult:(id)a4
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D358A8];
  v5 = a4;
  objc_msgSend(v4, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updatePersonalNicknameIfNecessaryWithMeCardSharingResult:", v5);

}

@end
