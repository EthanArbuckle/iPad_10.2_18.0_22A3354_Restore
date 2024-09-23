@implementation UIApplication

BOOL __62__UIApplication_AVAdditions__avkit_possiblePrimaryWindowScene__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (!objc_msgSend(v2, "activationState") || objc_msgSend(v2, "activationState") == 1))
  {
    objc_msgSend(v2, "screen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3 == v4;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __69__UIApplication_AVAdditions__avkit_windowSceneWithSessionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "persistentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
