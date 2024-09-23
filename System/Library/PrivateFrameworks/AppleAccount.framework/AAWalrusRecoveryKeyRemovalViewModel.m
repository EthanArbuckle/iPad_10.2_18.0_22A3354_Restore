@implementation AAWalrusRecoveryKeyRemovalViewModel

- (id)initWhenAccountHasRecoveryContact:(BOOL)a3
{
  _BOOL4 v3;
  AAWalrusRecoveryKeyRemovalViewModel *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v3 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AAWalrusRecoveryKeyRemovalViewModel;
  v4 = -[AAAccountContactPromptModel init](&v18, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("REMOVE_RECOVERY_KEY_TITLE"), 0, CFSTR("Localizable-Walrus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAAccountContactPromptModel setDetailsLabel:](v4, "setDetailsLabel:", v6);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v3)
    {
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("REMOVE_RECOVERY_KEY_DETAIL_HAS_RC"), 0, CFSTR("Localizable-Walrus"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAAccountContactPromptModel setDetailsSubtitle:](v4, "setDetailsSubtitle:", v9);

      -[AAAccountContactPromptModel setSecondaryActionText:](v4, "setSecondaryActionText:", 0);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = CFSTR("REMOVE_RECOVERY_KEY_DONE_BUTTON_DEFAULT");
    }
    else
    {
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("REMOVE_RECOVERY_KEY_DETAIL_NO_RC"), 0, CFSTR("Localizable-Walrus"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAAccountContactPromptModel setDetailsSubtitle:](v4, "setDetailsSubtitle:", v13);

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("REMOVE_RECOVERY_KEY_NOT_NOW_BUTTON"), 0, CFSTR("Localizable-Walrus"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAAccountContactPromptModel setSecondaryActionText:](v4, "setSecondaryActionText:", v15);

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = CFSTR("REMOVE_RECOVERY_KEY_DONE_BUTTON_ADD_RC");
    }
    objc_msgSend(v10, "localizedStringForKey:value:table:", v12, 0, CFSTR("Localizable-Walrus"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAAccountContactPromptModel setPrimaryActionText:](v4, "setPrimaryActionText:", v16);

    -[AAAccountContactPromptModel setDoneButtonTitle:](v4, "setDoneButtonTitle:", 0);
  }
  return v4;
}

@end
