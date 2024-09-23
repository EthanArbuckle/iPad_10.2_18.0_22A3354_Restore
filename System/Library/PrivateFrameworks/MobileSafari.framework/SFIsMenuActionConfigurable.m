@implementation SFIsMenuActionConfigurable

void __SFIsMenuActionConfigurable_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  SFConfigurableMenuActions();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithArray:", v3);
  v2 = (void *)SFIsMenuActionConfigurable_configurableMenuActionsSet;
  SFIsMenuActionConfigurable_configurableMenuActionsSet = v1;

}

@end
