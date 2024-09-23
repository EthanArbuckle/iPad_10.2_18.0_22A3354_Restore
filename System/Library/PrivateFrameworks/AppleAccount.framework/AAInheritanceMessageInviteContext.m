@implementation AAInheritanceMessageInviteContext

- (AAInheritanceMessageInviteContext)initWithLocalContact:(id)a3 beneficiaryID:(id)a4
{
  id v7;
  id v8;
  _BOOL4 v9;
  int v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  AAInheritanceMessageInviteContext *v21;
  int v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  char v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceMessageInviteContext.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("beneficiaryID"));

  }
  v9 = +[AAUrlBagHelper isLCInviteAcceptanceEnabled](AAUrlBagHelper, "isLCInviteAcceptanceEnabled");
  if (v9)
  {
    v10 = objc_msgSend(v7, "isFamilyMember");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
      v13 = CFSTR("INHERITANCE_ADDED_MESSAGES_BUBBLE_BODY");
    else
      v13 = CFSTR("INHERITANCE_INVITED_MESSAGES_BUBBLE_BODY");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("INHERITANCE_ADDED_MESSAGES_BUBBLE_BODY");
  }
  objc_msgSend(v11, "localizedStringForKey:value:table:", v13, 0, CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "firstNameOrHandleForDisplay");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[AAUniversalLinkHelper stringForBenefiaryMessagesURLWithUUID:](AAUniversalLinkHelper, "stringForBenefiaryMessagesURLWithUUID:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    _AALogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[AAInheritanceMessageInviteContext initWithLocalContact:beneficiaryID:].cold.1((uint64_t)v18, v20);

  }
  v21 = -[AAInheritanceMessageInviteContext init](self, "init");
  if (v21)
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_ADDED_MESSAGES_BUBBLE_TITLE"), 0, CFSTR("Localizable"));
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[AAMessagesInviteContext setTitle:](v21, "setTitle:", v24);
      goto LABEL_25;
    }
    v22 = objc_msgSend(v7, "isFamilyMember");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v24 = CFSTR("INHERITANCE_ADDED_MESSAGES_BUBBLE_TITLE");
      if ((objc_msgSend(CFSTR("INHERITANCE_ADDED_MESSAGES_BUBBLE_TITLE"), "containsString:", CFSTR("REBRAND")) & 1) == 0
        && _os_feature_enabled_impl())
      {
        v25 = CFSTR("INHERITANCE_ADDED_MESSAGES_BUBBLE_TITLE");
LABEL_22:
        -[__CFString stringByAppendingString:](v25, "stringByAppendingString:", CFSTR("_REBRAND"));
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v33 = 1;
        goto LABEL_24;
      }
    }
    else
    {
      v24 = CFSTR("INHERITANCE_INVITED_MESSAGES_BUBBLE_TITLE");
      if ((objc_msgSend(CFSTR("INHERITANCE_INVITED_MESSAGES_BUBBLE_TITLE"), "containsString:", CFSTR("REBRAND")) & 1) == 0
        && _os_feature_enabled_impl())
      {
        v25 = CFSTR("INHERITANCE_INVITED_MESSAGES_BUBBLE_TITLE");
        goto LABEL_22;
      }
    }
    v33 = 0;
LABEL_24:
    objc_msgSend(v23, "localizedStringForKey:value:table:", v24, 0, CFSTR("Localizable"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAMessagesInviteContext setTitle:](v21, "setTitle:", v26);

    if ((v33 & 1) == 0)
    {
LABEL_26:

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_MESSAGES_BUBBLE_ACTION_LABEL"), 0, CFSTR("Localizable"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAMessagesInviteContext setAction:](v21, "setAction:", v28);

      objc_msgSend(v7, "handle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v29;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAMessagesInviteContext setRecipients:](v21, "setRecipients:", v30);

      -[AAMessagesInviteContext setMessageBody:](v21, "setMessageBody:", v17);
      -[AAMessagesInviteContext setInviteURL:](v21, "setInviteURL:", v19);
      goto LABEL_27;
    }
LABEL_25:

    goto LABEL_26;
  }
LABEL_27:

  return v21;
}

- (void)initWithLocalContact:(uint64_t)a1 beneficiaryID:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19EACA000, a2, OS_LOG_TYPE_ERROR, "Error creating NSURL from universal link - %@", (uint8_t *)&v2, 0xCu);
}

@end
