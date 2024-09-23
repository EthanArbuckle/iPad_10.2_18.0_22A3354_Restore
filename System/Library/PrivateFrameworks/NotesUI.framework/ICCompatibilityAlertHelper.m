@implementation ICCompatibilityAlertHelper

+ (void)showCompatibilityAlertForAccountIfNeeded:(id)a3 title:(id)a4 alertMessage:(id)a5 defaultButtonTitle:(id)a6 secondaryButtonTitle:(id)a7 postscript:(id)a8 parentViewController:(id)a9 hasShownAlertKey:(id)a10 minimumNotesVersion:(int64_t)a11 completion:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;

  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a12;
  v25 = (void *)MEMORY[0x1E0D63A98];
  v26 = a3;
  objc_msgSend(v25, "sharedController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __210__ICCompatibilityAlertHelper_showCompatibilityAlertForAccountIfNeeded_title_alertMessage_defaultButtonTitle_secondaryButtonTitle_postscript_parentViewController_hasShownAlertKey_minimumNotesVersion_completion___block_invoke;
  v37[3] = &unk_1E5C212B8;
  v45 = v24;
  v46 = a1;
  v38 = v23;
  v39 = v17;
  v40 = v18;
  v41 = v19;
  v42 = v20;
  v43 = v21;
  v44 = v22;
  v28 = v22;
  v29 = v21;
  v30 = v20;
  v31 = v19;
  v32 = v18;
  v33 = v17;
  v34 = v24;
  v35 = v23;
  objc_msgSend(v27, "messageForAccount:minimumNotesVersion:completionHandler:", v26, a11, v37);

}

void __210__ICCompatibilityAlertHelper_showCompatibilityAlertForAccountIfNeeded_title_alertMessage_defaultButtonTitle_secondaryButtonTitle_postscript_parentViewController_hasShownAlertKey_minimumNotesVersion_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  v5 = a1[4];
  v6 = v3;
  v13 = a1[11];
  v7 = a1[5];
  v8 = a1[6];
  v9 = a1[7];
  v10 = a1[8];
  v11 = a1[9];
  v12 = a1[10];
  v4 = v3;
  performBlockOnMainThread();

}

uint64_t __210__ICCompatibilityAlertHelper_showCompatibilityAlertForAccountIfNeeded_title_alertMessage_defaultButtonTitle_secondaryButtonTitle_postscript_parentViewController_hasShownAlertKey_minimumNotesVersion_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;

  if ((isShowingCompatibilityAlert & 1) == 0)
  {
    v1 = result;
    objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", *(_QWORD *)(v1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0D63A98], "sharedController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "fakesIncompatibleDevicesForDebugging") & 1) == 0)
      {

        goto LABEL_9;
      }
      v7 = *(_QWORD *)(v1 + 40);

      if (!v7)
      {
LABEL_9:
        result = *(_QWORD *)(v1 + 96);
        if (result)
          return (*(uint64_t (**)(uint64_t, BOOL, _QWORD))(result + 16))(result, *(_QWORD *)(v1 + 40) != 0, 0);
        return result;
      }
    }
    else if (!*(_QWORD *)(v1 + 40))
    {
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *(_QWORD *)(v1 + 32));

    return objc_msgSend(*(id *)(v1 + 104), "showCompatibilityAlertWithDeviceMessage:title:alertMessage:defaultButtonTitle:secondaryButtonTitle:postscript:parentViewController:completion:", *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88), *(_QWORD *)(v1 + 96));
  }
  return result;
}

+ (void)showCompatibilityAlertWithDeviceMessage:(id)a3 title:(id)a4 alertMessage:(id)a5 defaultButtonTitle:(id)a6 secondaryButtonTitle:(id)a7 postscript:(id)a8 parentViewController:(id)a9 completion:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v36 = a6;
  v35 = a7;
  v18 = a8;
  v34 = a9;
  v19 = a10;
  isShowingCompatibilityAlert = 1;
  v32 = v17;
  v33 = v15;
  if (v18 && objc_msgSend(v18, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("%@:\n\n%@\n\n%@"), CFSTR("%@:\n\n%@\n\n%@"), 0, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v20, v17, v15, v18);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("%@:\n\n%@"), CFSTR("%@:\n\n%@"), 0, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v20, v17, v15, v31);
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v16, v21, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v16;
  v24 = (void *)MEMORY[0x1E0DC3448];
  v25 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __172__ICCompatibilityAlertHelper_showCompatibilityAlertWithDeviceMessage_title_alertMessage_defaultButtonTitle_secondaryButtonTitle_postscript_parentViewController_completion___block_invoke;
  v39[3] = &unk_1E5C1F5F8;
  v26 = v19;
  v40 = v26;
  objc_msgSend(v24, "actionWithTitle:style:handler:", v35, 0, v39);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addAction:", v27);
  v28 = (void *)MEMORY[0x1E0DC3448];
  v37[0] = v25;
  v37[1] = 3221225472;
  v37[2] = __172__ICCompatibilityAlertHelper_showCompatibilityAlertWithDeviceMessage_title_alertMessage_defaultButtonTitle_secondaryButtonTitle_postscript_parentViewController_completion___block_invoke_2;
  v37[3] = &unk_1E5C1F5F8;
  v38 = v26;
  v29 = v26;
  objc_msgSend(v28, "actionWithTitle:style:handler:", v36, 0, v37);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addAction:", v30);
  objc_msgSend(v34, "presentViewController:animated:completion:", v22, 1, 0);

}

uint64_t __172__ICCompatibilityAlertHelper_showCompatibilityAlertWithDeviceMessage_title_alertMessage_defaultButtonTitle_secondaryButtonTitle_postscript_parentViewController_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  isShowingCompatibilityAlert = 0;
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, 1, 1);
  return result;
}

uint64_t __172__ICCompatibilityAlertHelper_showCompatibilityAlertWithDeviceMessage_title_alertMessage_defaultButtonTitle_secondaryButtonTitle_postscript_parentViewController_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  isShowingCompatibilityAlert = 0;
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

+ (void)showCompatibilityAlertForInlineAttachmentsInAccountIfNeeded:(id)a3 parentViewController:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v8 = (void *)MEMORY[0x1E0D64218];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Note Hidden on Some Devices"), CFSTR("Note Hidden on Some Devices"), 0, 1);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Notes with tags or mentions are only viewable on iOS 14.5, iPadOS 14.5, and macOS 11.3 and later. Your devices that need upgrading"), CFSTR("Notes with tags or mentions are only viewable on iOS 14.5, iPadOS 14.5, and macOS 11.3 and later. Your devices that need upgrading"), 0, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v11, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("ICInlineAttachmentOneTimeAlertKey-%@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("OK"), CFSTR("OK"), 0, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Learn More"), CFSTR("Learn More"), 0, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "showCompatibilityAlertForAccountIfNeeded:title:alertMessage:defaultButtonTitle:secondaryButtonTitle:postscript:parentViewController:hasShownAlertKey:minimumNotesVersion:completion:", v11, v18, v12, v16, v17, 0, v10, v15, 6, v9);

}

+ (void)showAttachmentCompatibilityAlertInAccountIfNeeded:(id)a3 parentViewController:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v8 = (void *)MEMORY[0x1E0D64218];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Edit Attachment?"), CFSTR("Edit Attachment?"), 0, 1);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Editing this attachment will make it read-only on your devices using an older OS version"), CFSTR("Editing this attachment will make it read-only on your devices using an older OS version"), 0, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICCompatibilityAlertHelper oneTimeAlertKeyForAccount:](ICCompatibilityAlertHelper, "oneTimeAlertKeyForAccount:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("You can continue editing this attachment or discard the change you made."), CFSTR("You can continue editing this attachment or discard the change you made."), 0, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Continue Editing"), CFSTR("Continue Editing"), 0, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Discard Changes"), CFSTR("Discard Changes"), 0, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "showCompatibilityAlertForAccountIfNeeded:title:alertMessage:defaultButtonTitle:secondaryButtonTitle:postscript:parentViewController:hasShownAlertKey:minimumNotesVersion:completion:", v11, v17, v12, v15, v16, v14, v10, v13, 13, v9);

}

+ (id)oneTimeAlertKeyForAccount:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ICAttachmentOneTimeAlertKey-%lld-%@"), 15, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)suppressOneTimeAttachmentUpgradeAlertForAcccount:(id)a3
{
  void *v3;
  id v4;

  +[ICCompatibilityAlertHelper oneTimeAlertKeyForAccount:](ICCompatibilityAlertHelper, "oneTimeAlertKeyForAccount:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v4);

}

@end
