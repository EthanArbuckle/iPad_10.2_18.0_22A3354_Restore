@implementation QSInstallSharedSafeCategoriesIfNeeded

void __QSInstallSharedSafeCategoriesIfNeeded_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CF3A08], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "installSafeCategory:canInteractWithTargetClass:", CFSTR("NSObject_QSSupport"), 1);

  objc_msgSend(MEMORY[0x1E0CF3A08], "sharedInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIPasteboard_QSExtras"), 1);

}

@end
