@implementation UIViewController(IdiomUsage)

- (BOOL)_gkShouldUsePadUI
{
  return objc_msgSend(a1, "_gkDesiredUserInterfaceIdiom") == 1;
}

- (BOOL)_gkDesiredUserInterfaceIdiom
{
  void *v2;
  uint64_t v3;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v9;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1 && (!*MEMORY[0x1E0D253F8] || *MEMORY[0x1E0D25B68] != 0))
  {
    objc_msgSend(a1, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "popoverPresentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(a1, "popoverPresentationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        objc_msgSend(a1, "_popoverController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v9 == 0;

        return v7;
      }
    }

  }
  return 0;
}

@end
