@implementation AAUIRUITableViewSectionInjectorFactory

+ (id)tableViewSectionInjectorForGPPRWithPage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  AAUIRUITableViewSectionInjector *v8;
  void *v9;
  AAUIRUITableViewSectionInjector *v10;

  v3 = a3;
  objc_msgSend(v3, "tableViewOM");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D65190], "linkWithBundleIdentifier:", CFSTR("com.apple.onboarding.appleid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisplayIcon:", 0);
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addChildViewController:", v6);
  objc_msgSend(v6, "didMoveToParentViewController:", v3);
  v8 = [AAUIRUITableViewSectionInjector alloc];
  objc_msgSend(v3, "tableViewOM");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[AAUIRUITableViewSectionInjector initWithTableView:ruiTableView:injectWith:](v8, "initWithTableView:ruiTableView:injectWith:", v5, v9, v7);
  -[AAUIRUITableViewSectionInjector setInjectionType:](v10, "setInjectionType:", CFSTR("InjectOnboardingDisclosureView"));

  return v10;
}

@end
