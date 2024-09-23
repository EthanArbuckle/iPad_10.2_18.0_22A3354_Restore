@implementation SFSectionToConfigurableMenuActions

void __SFSectionToConfigurableMenuActions_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[7];
  _QWORD v5[6];
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("PageMenuSectionCurrentTab");
  v5[0] = CFSTR("PageMenuActionAddToFavorites");
  v5[1] = CFSTR("PageMenuActionAddBookmark");
  v5[2] = CFSTR("PageMenuActionAddToQuickNote");
  v5[3] = CFSTR("PageMenuActionAddToReadingList");
  v5[4] = CFSTR("PageMenuActionMoveToTabGroup");
  v5[5] = CFSTR("PageMenuActionTogglePinningTab");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 6);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("PageMenuSectionWebsiteActions");
  v7[0] = v0;
  v4[0] = CFSTR("PageMenuActionScribble");
  v4[1] = CFSTR("PageMenuActionPrivacyReport");
  v4[2] = CFSTR("PageMenuActionHideToolbar");
  v4[3] = CFSTR("PageMenuActionRequestDesktopOrMobileWebsite");
  v4[4] = CFSTR("PageMenuActionTogglePrivateRelay");
  v4[5] = CFSTR("PageMenuActionPrintCurrentTab");
  v4[6] = CFSTR("PageMenuActionReportAutoFillIssue");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)SFSectionToConfigurableMenuActions_sectionToActions;
  SFSectionToConfigurableMenuActions_sectionToActions = v2;

}

@end
