@implementation SFFormAutoFillMultipleLoginsAlertController

+ (id)alertControllerWithMatchesFromFormProtectionSpace:(id)a3 matchesFromOtherProtectionSpaces:(id)a4 externalCredentials:(id)a5 preferredStyle:(int64_t)a6 formURL:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  unint64_t v32;
  char v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  id *v48;
  id *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  void *v57;
  void *v59;
  void *v60;
  id v61;
  id obj;
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  void *v68;
  id v69;
  _QWORD v70[4];
  void *v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[5];
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v63 = a7;
  v64 = a8;
  objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:", 0, 0, a6);
  v17 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setImageIfNecessaryWithName:", CFSTR("alert-passwords"));
  v60 = v14;
  if (objc_msgSend(v14, "count") || objc_msgSend(v15, "count") || objc_msgSend(v16, "count"))
  {
    _WBSLocalizedString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTitle:", v18);

  }
  v59 = v15;
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  obj = v16;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v80 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0D8A060], "titleForCredentialIdentity:formURL:", v23, v63);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "user");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[SFCredentialDisplayData descriptionForPasswordWithUser:creationDate:](SFCredentialDisplayData, "descriptionForPasswordWithUser:creationDate:", v25, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v77[0] = MEMORY[0x1E0C809B0];
        v77[1] = 3221225472;
        v77[2] = __191__SFFormAutoFillMultipleLoginsAlertController_alertControllerWithMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_externalCredentials_preferredStyle_formURL_completionHandler___block_invoke;
        v77[3] = &unk_1E4AC38F8;
        v27 = v64;
        v77[4] = v23;
        v78 = v27;
        +[SFMultipleLineAlertAction actionWithTitle:detail:handler:](SFMultipleLineAlertAction, "actionWithTitle:detail:handler:", v26, v24, v77);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addAction:", v28);

      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
    }
    while (v20);
  }

  v29 = objc_msgSend(v15, "count");
  objc_msgSend(MEMORY[0x1E0D8A048], "sharedManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "enabledExtensions");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  v33 = 1;
  if (!v29 && v32 <= 1)
  {
    if (v32)
    {
      objc_msgSend(MEMORY[0x1E0D8A020], "sharedFeatureManager");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v34, "shouldAutoFillPasswordsFromKeychain");

    }
    else
    {
      v33 = 0;
    }
  }
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  objc_msgSend(v60, "arrayByAddingObjectsFromArray:", v15);
  v61 = (id)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v74;
    do
    {
      for (j = 0; j != v36; ++j)
      {
        if (*(_QWORD *)v74 != v37)
          objc_enumerationMutation(v61);
        v39 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
        objc_msgSend(v39, "match");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "user");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "creationDate");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        +[SFCredentialDisplayData descriptionForPasswordWithUser:creationDate:](SFCredentialDisplayData, "descriptionForPasswordWithUser:creationDate:", v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if ((v33 & 1) != 0)
        {
          objc_msgSend(v39, "detail");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v70[0] = MEMORY[0x1E0C809B0];
          v70[1] = 3221225472;
          v70[2] = __191__SFFormAutoFillMultipleLoginsAlertController_alertControllerWithMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_externalCredentials_preferredStyle_formURL_completionHandler___block_invoke_2;
          v70[3] = &unk_1E4AC38F8;
          v45 = v64;
          v71 = v40;
          v72 = v45;
          v46 = v40;
          +[SFMultipleLineAlertAction actionWithTitle:detail:handler:](SFMultipleLineAlertAction, "actionWithTitle:detail:handler:", v43, v44, v70);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addAction:", v47);

          v49 = &v71;
          v48 = &v72;
        }
        else
        {
          v50 = (void *)MEMORY[0x1E0DC3448];
          v67[0] = MEMORY[0x1E0C809B0];
          v67[1] = 3221225472;
          v67[2] = __191__SFFormAutoFillMultipleLoginsAlertController_alertControllerWithMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_externalCredentials_preferredStyle_formURL_completionHandler___block_invoke_3;
          v67[3] = &unk_1E4AC38F8;
          v51 = v64;
          v68 = v40;
          v69 = v51;
          v52 = v40;
          objc_msgSend(v50, "actionWithTitle:style:handler:", v43, 0, v67);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addAction:", v44);
          v49 = &v68;
          v48 = &v69;
        }

      }
      v36 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
    }
    while (v36);
  }

  v53 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __191__SFFormAutoFillMultipleLoginsAlertController_alertControllerWithMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_externalCredentials_preferredStyle_formURL_completionHandler___block_invoke_4;
  v65[3] = &unk_1E4AC01E0;
  v66 = v64;
  v55 = v64;
  objc_msgSend(v53, "actionWithTitle:style:handler:", v54, 1, v65);
  v56 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "addAction:", v56);
  v57 = (void *)v17[163];
  v17[163] = v56;

  return v17;
}

uint64_t __191__SFFormAutoFillMultipleLoginsAlertController_alertControllerWithMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_externalCredentials_preferredStyle_formURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __191__SFFormAutoFillMultipleLoginsAlertController_alertControllerWithMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_externalCredentials_preferredStyle_formURL_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __191__SFFormAutoFillMultipleLoginsAlertController_alertControllerWithMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_externalCredentials_preferredStyle_formURL_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __191__SFFormAutoFillMultipleLoginsAlertController_alertControllerWithMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_externalCredentials_preferredStyle_formURL_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setCancelsWhenAppEntersBackground:(BOOL)a3
{
  void *v5;
  id v6;

  if (self->_cancelsWhenAppEntersBackground != a3)
  {
    self->_cancelsWhenAppEntersBackground = a3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (a3)
      objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__sceneDidEnterBackground_, *MEMORY[0x1E0DC5318], 0);
    else
      objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5318], 0);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFFormAutoFillMultipleLoginsAlertController;
  -[SFFormAutoFillMultipleLoginsAlertController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  if (self->_cancelsWhenAppEntersBackground
    || (-[SFFormAutoFillMultipleLoginsAlertController isBeingDismissed](self, "isBeingDismissed") & 1) != 0
    || -[SFFormAutoFillMultipleLoginsAlertController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5318], 0);

  }
}

- (void)_sceneDidEnterBackground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SFFormAutoFillMultipleLoginsAlertController viewIfLoaded](self, "viewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v8, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
      -[SFFormAutoFillMultipleLoginsAlertController _dismissWithAction:](self, "_dismissWithAction:", self->_cancelAction);
  }

}

- (BOOL)cancelsWhenAppEntersBackground
{
  return self->_cancelsWhenAppEntersBackground;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelAction, 0);
}

@end
