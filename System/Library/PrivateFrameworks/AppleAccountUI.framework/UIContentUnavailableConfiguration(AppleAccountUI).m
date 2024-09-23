@implementation UIContentUnavailableConfiguration(AppleAccountUI)

+ (id)signInNotAvailable
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0DC3698], "emptyConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_appleIDImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v3);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccountUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_GUEST_MODE_RESTRICTED"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", v5);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccountUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_GUEST_MODE_SECONDARY_TEXT"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSecondaryText:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setColor:", v8);

  objc_msgSend(v2, "setAlignment:", 0);
  return v2;
}

+ (id)_appleIDImage
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithHierarchicalColor:", v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC3888];
  v10[0] = v0;
  v10[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationWithPaletteColors:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationByApplyingConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("apple.id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageByApplyingSymbolConfiguration:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
