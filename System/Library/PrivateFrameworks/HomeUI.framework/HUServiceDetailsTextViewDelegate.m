@implementation HUServiceDetailsTextViewDelegate

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  void *v62;
  id v63;
  _QWORD block[4];
  id v65;
  id v66;
  uint8_t buf[4];
  HUServiceDetailsTextViewDelegate *v68;
  __int16 v69;
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v68 = self;
    v69 = 2112;
    v70 = v10;
    _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", buf, 0x16u);
  }

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31970]), "initWithURL:", v10);
  if (objc_msgSend(v12, "destination") == 17)
  {
    -[HUServiceDetailsTextViewDelegate itemManager](self, "itemManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sourceItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "latestResults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0D30970]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D31888], "sharedManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v10, 0);
    objc_msgSend(v18, "queryItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "na_firstObjectPassingTest:", &__block_literal_global_134);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "value");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v63 = v9;
      objc_msgSend(v20, "value");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = NSStringToHMSymptomType();

      v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", v23);
      if (v16)
      {
        -[HUServiceDetailsTextViewDelegate viewController](self, "viewController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "fixSymptom:forFixableObject:presentingViewController:", v24, v16, v25);
      }
      else
      {
        v62 = v12;
        -[HUServiceDetailsTextViewDelegate itemManager](self, "itemManager");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "sourceItem");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "accessories");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "count");

        if (v34 != 1)
          NSLog(CFSTR("Attempting to fix more than one accessory when 1 is expected"));
        -[HUServiceDetailsTextViewDelegate itemManager](self, "itemManager");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "sourceItem");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v36, "conformsToProtocol:", &unk_1EF2AC470))
          v37 = v36;
        else
          v37 = 0;
        v38 = v37;

        objc_msgSend(v38, "accessories");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "anyObject");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUServiceDetailsTextViewDelegate viewController](self, "viewController");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "fixSymptom:forFixableObject:presentingViewController:", v24, v39, v40);

        v16 = 0;
        v12 = v62;
      }

      v9 = v63;
    }
    else
    {
      HFLogForCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1B8E1E000, v24, OS_LOG_TYPE_ERROR, "Unable to initiate fix for symptom. Couldn't find a symptom type.", buf, 2u);
      }
    }

    v26 = 0;
    goto LABEL_37;
  }
  if (!a6)
  {
    v27 = v12;
    objc_msgSend(MEMORY[0x1E0C99E98], "hf_locationDeviceSettingsURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v10, "isEqual:", v28);

    if (v29)
    {
      objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (id)objc_msgSend(v16, "openURL:", v10);
      v26 = 1;
    }
    else
    {
      if ((objc_msgSend(v10, "hf_isHomeKnowledgeBasedArticleURL") & 1) != 0)
      {
        v26 = 1;
        v12 = v27;
        goto LABEL_38;
      }
      objc_msgSend(MEMORY[0x1E0C99E98], "hf_cameraRecordingURL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v10, "isEqual:", v41);

      if (v42)
      {
        -[HUServiceDetailsTextViewDelegate viewController](self, "viewController");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "navigationController");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v44;
        if (v44)
        {
          v46 = v44;
        }
        else
        {
          -[HUServiceDetailsTextViewDelegate viewController](self, "viewController");
          v46 = (id)objc_claimAutoreleasedReturnValue();
        }
        v51 = v46;

        v52 = objc_alloc(MEMORY[0x1E0D651A8]);
        _HULocalizedStringWithDefaultValue(CFSTR("HUCameraAndRecordingLearnMoreTitle"), CFSTR("HUCameraAndRecordingLearnMoreTitle"), 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        _HULocalizedStringWithDefaultValue(CFSTR("HUCameraAndRecordingLearnMoreBody"), CFSTR("HUCameraAndRecordingLearnMoreBody"), 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = (void *)objc_msgSend(v52, "initWithTitle:detailText:symbolName:contentLayout:", v53, v54, 0, 2);

        objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _HULocalizedStringWithDefaultValue(CFSTR("HUDoneTitle"), CFSTR("HUDoneTitle"), 1);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setTitle:forState:", v56, 0);

        objc_msgSend(v16, "addTarget:action:forControlEvents:", self, sel_dismissTextViewController, 64);
        objc_msgSend(v55, "buttonTray");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "addButton:", v16);

        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __87__HUServiceDetailsTextViewDelegate_textView_shouldInteractWithURL_inRange_interaction___block_invoke_89;
        block[3] = &unk_1E6F4C638;
        v65 = v51;
        v66 = v55;
        v58 = v51;
        v59 = v55;
        dispatch_async(MEMORY[0x1E0C80D38], block);

      }
      else
      {
        objc_opt_class();
        v47 = v9;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v48 = v47;
        else
          v48 = 0;
        v49 = v48;

        objc_msgSend(v49, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[HUServiceDetailsTextViewDelegate unifiedIdentifiersForSectionIdentifier:](self, "unifiedIdentifiersForSectionIdentifier:", v16);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (v50)
        {
          -[HUServiceDetailsTextViewDelegate displayUnifiedPrivacyInformationWithIdentifiers:](self, "displayUnifiedPrivacyInformationWithIdentifiers:", v50);
        }
        else
        {
          -[HUServiceDetailsTextViewDelegate privacyIdentifierForSectionIdentifier:](self, "privacyIdentifierForSectionIdentifier:", v16);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUServiceDetailsTextViewDelegate displayPrivacyInformationWithIdentifier:](self, "displayPrivacyInformationWithIdentifier:", v60);

        }
      }
      v26 = 0;
    }
    v12 = v27;
LABEL_37:

    goto LABEL_38;
  }
  v26 = 0;
LABEL_38:

  return v26;
}

uint64_t __87__HUServiceDetailsTextViewDelegate_textView_shouldInteractWithURL_inRange_interaction___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D30FF0]);

  return v3;
}

uint64_t __87__HUServiceDetailsTextViewDelegate_textView_shouldInteractWithURL_inRange_interaction___block_invoke_89(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)dismissTextViewController
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[HUServiceDetailsTextViewDelegate viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[HUServiceDetailsTextViewDelegate viewController](self, "viewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)displayUnifiedPrivacyInformationWithIdentifiers:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUServiceDetailsTextViewDelegate.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("unifiedIdentifiers"));

  }
  -[HUServiceDetailsTextViewDelegate viewController](self, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[HUServiceDetailsTextViewDelegate viewController](self, "viewController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0D65198], "presenterForPrivacyUnifiedAboutWithIdentifiers:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPresentingViewController:", v9);
  objc_msgSend(v10, "present");

}

- (void)displayPrivacyInformationWithIdentifier:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUServiceDetailsTextViewDelegate.m"), 112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("privacyIdentifier"));

  }
  -[HUServiceDetailsTextViewDelegate viewController](self, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[HUServiceDetailsTextViewDelegate viewController](self, "viewController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0D65198], "presenterForPrivacySplashWithIdentifier:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "splashController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDisplayDeviceType:", 6);

  objc_msgSend(v10, "setPresentingViewController:", v9);
  objc_msgSend(v10, "present");

}

- (id)privacyIdentifierForSectionIdentifier:(id)a3
{
  id v3;
  id *v4;
  id v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0D30780]) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E0D65208];
  }
  else if ((objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0D30760]) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E0D651F8];
  }
  else if ((objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0D30728]) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E0D651D0];
  }
  else
  {
    if (!objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0D30708]))
    {
      v5 = 0;
      goto LABEL_10;
    }
    v4 = (id *)MEMORY[0x1E0D651F0];
  }
  v5 = *v4;
LABEL_10:

  return v5;
}

- (id)unifiedIdentifiersForSectionIdentifier:(id)a3
{
  uint64_t v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D30728]))
  {
    v3 = *MEMORY[0x1E0D65200];
    v6[0] = *MEMORY[0x1E0D651D0];
    v6[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (HUServiceDetailsItemManager)itemManager
{
  return (HUServiceDetailsItemManager *)objc_loadWeakRetained((id *)&self->_itemManager);
}

- (void)setItemManager:(id)a3
{
  objc_storeWeak((id *)&self->_itemManager, a3);
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
  objc_destroyWeak((id *)&self->_itemManager);
}

@end
