@implementation SFUnconfigurableMenuAcitons

void __SFUnconfigurableMenuAcitons_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("PageMenuActionToggleContentBlockers");
  v2[1] = CFSTR("PageMenuActionToggleAdvancedPrivacyProtections");
  v2[2] = CFSTR("PageMenuActionToggleMediaState");
  v2[3] = CFSTR("PageMenuActionToggleAllAnimations");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SFUnconfigurableMenuAcitons_actions;
  SFUnconfigurableMenuAcitons_actions = v0;

}

@end
