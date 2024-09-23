@implementation AACustodianMessageInviteContext

- (AACustodianMessageInviteContext)initWithLocalContact:(id)a3 custodianID:(id)a4
{
  id v7;
  id v8;
  AACustodianMessageInviteContext *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AACustodianMessageInviteContext.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("custodianID"));

  }
  v9 = -[AACustodianMessageInviteContext init](self, "init");
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CUSTODIAN_MESSAGES_BUBBLE_TITLE"), 0, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAMessagesInviteContext setTitle:](v9, "setTitle:", v11);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("APPLE"), 0, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAMessagesInviteContext setSubtitle:](v9, "setSubtitle:", v13);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CUSTODIAN_MESSAGES_BUBBLE_ACTION_LABEL"), 0, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAMessagesInviteContext setAction:](v9, "setAction:", v15);

    objc_msgSend(v7, "handle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAMessagesInviteContext setRecipients:](v9, "setRecipients:", v17);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CUSTODIAN_MESSAGES_BUBBLE_INVITE_BODY"), 0, CFSTR("Localizable"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAMessagesInviteContext setMessageBody:](v9, "setMessageBody:", v19);

    -[AACustodianMessageInviteContext _urlForCustodianID:](v9, "_urlForCustodianID:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAMessagesInviteContext setInviteURL:](v9, "setInviteURL:", v20);

  }
  return v9;
}

- (id)_urlForCustodianID:(id)a3
{
  void *v3;
  void *v4;

  +[AAUniversalLinkHelper stringForCustodianMessagesURLWithUUID:](AAUniversalLinkHelper, "stringForCustodianMessagesURLWithUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
