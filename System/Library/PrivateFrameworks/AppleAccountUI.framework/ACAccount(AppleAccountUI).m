@implementation ACAccount(AppleAccountUI)

- (id)aaui_compositeName
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "aa_firstName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "aa_lastName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AAUICopyCompositeName(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)aaui_compositeNameFormat
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  objc_msgSend(a1, "aa_firstName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGivenName:", v3);

  objc_msgSend(a1, "aa_lastName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFamilyName:", v4);

  v5 = objc_msgSend(MEMORY[0x1E0CB3858], "_nameOrderWithOverridesForComponents:options:", v2, 0) == 2;
  return v5;
}

@end
