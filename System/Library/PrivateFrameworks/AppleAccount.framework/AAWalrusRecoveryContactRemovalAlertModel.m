@implementation AAWalrusRecoveryContactRemovalAlertModel

- (id)initWhenAccountHasRecoveryContact:(BOOL)a3 hasRecoveryKey:(BOOL)a4
{
  AAWalrusRecoveryContactRemovalAlertModel *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  AAWalrusRecoveryContactRemovalAlertModel *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)AAWalrusRecoveryContactRemovalAlertModel;
  v6 = -[AAAccountContactPromptModel init](&v20, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("REMOVE_RECOVERY_CONTACT_TITLE"), 0, CFSTR("Localizable-Walrus"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAAccountContactPromptModel setDetailsLabel:](v6, "setDetailsLabel:", v8);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a3)
    {
      v11 = CFSTR("REMOVE_RECOVERY_CONTACT_DETAIL_HAS_ANOTHER_RC");
    }
    else
    {
      if (!a4)
      {
        objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("REMOVE_RECOVERY_CONTACT_DETAIL_DEFAULT"), 0, CFSTR("Localizable-Walrus"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[AAAccountContactPromptModel setDetailsSubtitle:](v6, "setDetailsSubtitle:", v13);

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("REMOVE_RECOVERY_CONTACT_PRIMARY_BUTTON"), 0, CFSTR("Localizable-Walrus"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[AAAccountContactPromptModel setPrimaryActionText:](v6, "setPrimaryActionText:", v15);

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("REMOVE_RECOVERY_CONTACT_SECOND_BUTTON"), 0, CFSTR("Localizable-Walrus"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[AAAccountContactPromptModel setSecondaryActionText:](v6, "setSecondaryActionText:", v17);

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("REMOVE_RECOVERY_CONTACT_NOT_NOW_BUTTON"), 0, CFSTR("Localizable-Walrus"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[AAAccountContactPromptModel setDoneButtonTitle:](v6, "setDoneButtonTitle:", v12);
        goto LABEL_8;
      }
      v11 = CFSTR("REMOVE_RECOVERY_CONTACT_DETAIL_HAS_RK");
    }
    objc_msgSend(v9, "localizedStringForKey:value:table:", v11, 0, CFSTR("Localizable-Walrus"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAAccountContactPromptModel setDetailsSubtitle:](v6, "setDetailsSubtitle:", v12);
LABEL_8:

    v18 = v6;
  }

  return v6;
}

@end
