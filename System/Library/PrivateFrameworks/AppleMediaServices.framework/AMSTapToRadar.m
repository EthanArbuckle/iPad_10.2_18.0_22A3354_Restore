@implementation AMSTapToRadar

+ (void)openWithTitle:(id)a3 description:(id)a4 classification:(unint64_t)a5 reproducibility:(unint64_t)a6 keywordIds:(id)a7
{
  __CFString *v11;
  __CFString *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  AMSDialogRequest *v20;
  void *v21;
  void *v22;
  AMSSystemAlertDialogTask *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[7];
  _QWORD v29[8];

  v29[7] = *MEMORY[0x1E0C80C00];
  v11 = (__CFString *)a3;
  v12 = (__CFString *)a4;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("tap-to-radar://new"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (v11)
      v14 = v11;
    else
      v14 = &stru_1E2548760;
    v28[0] = CFSTR("Title");
    v28[1] = CFSTR("Description");
    if (v12)
      v15 = v12;
    else
      v15 = &stru_1E2548760;
    v29[0] = v14;
    v29[1] = v15;
    v28[2] = CFSTR("ComponentID");
    v28[3] = CFSTR("ComponentName");
    v29[2] = CFSTR("954976");
    v29[3] = CFSTR("Apple Media Services");
    v29[4] = CFSTR("New Bugs");
    v28[4] = CFSTR("ComponentVersion");
    v28[5] = CFSTR("Reproducibility");
    objc_msgSend(a1, "_convertReproducibility:", a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[5] = v16;
    v28[6] = CFSTR("Classification");
    objc_msgSend(a1, "_convertClassification:", a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[6] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ams_URLByReplaceingQueryParameters:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = -[AMSDialogRequest initWithTitle:message:]([AMSDialogRequest alloc], "initWithTitle:message:", CFSTR("[AMS] Fatal Error Detected"), CFSTR("Please consider filing a radar."));
    +[AMSDialogAction actionWithTitle:style:](AMSDialogAction, "actionWithTitle:style:", CFSTR("Cancel"), 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSDialogRequest addButtonAction:](v20, "addButtonAction:", v21);

    +[AMSDialogAction actionWithTitle:identifier:](AMSDialogAction, "actionWithTitle:identifier:", CFSTR("Tap-To-Radar"), CFSTR("Ok"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSDialogRequest addButtonAction:](v20, "addButtonAction:", v22);

    v23 = -[AMSSystemAlertDialogTask initWithRequest:]([AMSSystemAlertDialogTask alloc], "initWithRequest:", v20);
    -[AMSSystemAlertDialogTask present](v23, "present");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __85__AMSTapToRadar_openWithTitle_description_classification_reproducibility_keywordIds___block_invoke;
    v26[3] = &unk_1E253E210;
    v27 = v19;
    v25 = v19;
    objc_msgSend(v24, "addFinishBlock:", v26);

  }
}

void __85__AMSTapToRadar_openWithTitle_description_classification_reproducibility_keywordIds___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;

  objc_msgSend(a2, "selectedActionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Ok"));

  if (v4)
    +[AMSOpenURL openStandardURL:](AMSOpenURL, "openStandardURL:", *(_QWORD *)(a1 + 32));
}

+ (id)_convertClassification:(unint64_t)a3
{
  if (a3 > 9)
    return &stru_1E2548760;
  else
    return off_1E2546290[a3];
}

+ (id)_convertReproducibility:(unint64_t)a3
{
  if (a3 > 5)
    return &stru_1E2548760;
  else
    return off_1E25462E0[a3];
}

@end
