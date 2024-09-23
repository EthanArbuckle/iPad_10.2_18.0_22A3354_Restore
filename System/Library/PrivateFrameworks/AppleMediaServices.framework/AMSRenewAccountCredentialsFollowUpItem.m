@implementation AMSRenewAccountCredentialsFollowUpItem

+ (id)clear
{
  AMSFollowUp *v2;
  void *v3;

  v2 = objc_alloc_init(AMSFollowUp);
  -[AMSFollowUp clearFollowUpWithBackingIdentifier:](v2, "clearFollowUpWithBackingIdentifier:", CFSTR("com.apple.SSFollowUpIdentifier.RenewCredentials"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (AMSRenewAccountCredentialsFollowUpItem)initWithAccount:(id)a3 bag:(id)a4
{
  id v6;
  AMSRenewAccountCredentialsFollowUpItem *v7;
  AMSRenewAccountCredentialsFollowUpItem *v8;
  void *v9;
  void *v10;
  AMSFollowUpAction *v11;
  void *v12;
  AMSFollowUpAction *v13;
  void *v14;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AMSRenewAccountCredentialsFollowUpItem;
  v7 = -[AMSFollowUpItem initWithIdentifier:account:priority:](&v16, sel_initWithIdentifier_account_priority_, CFSTR("com.apple.SSFollowUpIdentifier.RenewCredentials"), a3, 0);
  v8 = v7;
  if (v7)
  {
    -[AMSFollowUpItem setDisplayStyle:](v7, "setDisplayStyle:", 0);
    AMSLocalizedString(CFSTR("FOLLOWUP_RENEW_CREDENTIALS_MESSAGE"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSFollowUpItem setInformativeText:](v8, "setInformativeText:", v9);

    AMSLocalizedString(CFSTR("FOLLOWUP_RENEW_APPLE_ACCOUNT_CREDENTIALS_TITLE"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSFollowUpItem setTitle:](v8, "setTitle:", v10);

    v11 = [AMSFollowUpAction alloc];
    AMSLocalizedString(CFSTR("FOLLOWUP_RENEW_CREDENTIALS_PRIMARY"), v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[AMSFollowUpAction initWithLabel:parentIdentifier:](v11, "initWithLabel:parentIdentifier:", v12, CFSTR("com.apple.SSFollowUpIdentifier.RenewCredentials"));

    -[AMSFollowUpAction setIdentifier:](v13, "setIdentifier:", *MEMORY[0x1E0CFAB18]);
    v17[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSFollowUpItem setActions:](v8, "setActions:", v14);

  }
  return v8;
}

@end
