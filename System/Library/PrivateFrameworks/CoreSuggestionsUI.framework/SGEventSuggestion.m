@implementation SGEventSuggestion

- (id)suggestionAttributedSubtitle
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (-[SGRealtimeEvent state](self->super._realtimeEvent, "state") != 3)
    return 0;
  v3 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[SGEventSuggestionBase suggestionSubtitle](self, "suggestionSubtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0DC11A8];
  v9[0] = &unk_1E62DD718;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithString:attributes:", v4, v5);

  return v6;
}

- (id)suggestionPrimaryAction
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  sgEventsLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[SGRealtimeEvent event](self->super._realtimeEvent, "event");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loggingIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v8;
    _os_log_debug_impl(&dword_1B1170000, v3, OS_LOG_TYPE_DEBUG, "SGEventSuggestion - SGEvent %{public}@ PrimaryAction initialized", buf, 0xCu);

  }
  -[SGEventSuggestionBase primaryActionTitle](self, "primaryActionTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke;
  v9[3] = &unk_1E62D6C90;
  v9[4] = self;
  +[SGSuggestionAction actionWithTitle:handler:](SGSuggestionAction, "actionWithTitle:handler:", v4, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_dismissViewController:(id)a3 retainBanner:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  sgEventsLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[SGRealtimeEvent event](self->super._realtimeEvent, "event");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loggingIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = CFSTR("not");
    if (v4)
      v11 = CFSTR(" ");
    v14 = 138543618;
    v15 = v9;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_1B1170000, v7, OS_LOG_TYPE_DEFAULT, "SGEventSuggestion - SGEvent %{public}@ ViewController dismissed. Did %{public}@ add event to calendar", (uint8_t *)&v14, 0x16u);

  }
  -[SGEventSuggestionBase suggestionDelegate](self, "suggestionDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dismissViewController:", v6);

  -[SGEventSuggestionBase suggestionDelegate](self, "suggestionDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "suggestion:actionFinished:", self, !v4);

}

- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  -[SGEventSuggestion _dismissViewController:retainBanner:](self, "_dismissViewController:retainBanner:", a3, a4 != 2);
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  v8 = v6;
  if (a4)
  {
    objc_msgSend((id)objc_opt_class(), "confirm:event:completion:", 1, self->super._realtimeEvent, 0);
    -[SGEventSuggestion _dismissViewController:retainBanner:](self, "_dismissViewController:retainBanner:", v8, a4 == 1);
    if (a4 == 1)
    {
      -[SGEventSuggestionBase suggestionDelegate](self, "suggestionDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "suggestionWasUpdated:", self);

    }
  }
  else
  {
    -[SGEventSuggestion _dismissViewController:retainBanner:](self, "_dismissViewController:retainBanner:", v6, 1);
  }

}

- (BOOL)eventViewControllerShouldAlwaysShowNavBar:(id)a3
{
  return 1;
}

- (void)icsPreviewControllerWantsDismissal:(id)a3
{
  id v4;

  objc_msgSend(a3, "viewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SGEventSuggestion _dismissViewController:retainBanner:](self, "_dismissViewController:retainBanner:", v4, 1);

}

- (BOOL)suggestionListSupportsDismissal
{
  return -[SGRealtimeEvent state](self->super._realtimeEvent, "state") != 4
      && -[SGRealtimeEvent state](self->super._realtimeEvent, "state") != 5;
}

- (BOOL)_isSourceAccountManaged
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SGRealtimeEvent event](self->super._realtimeEvent, "event", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(MEMORY[0x1E0D197F0], "resolveName:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isManagedSourceAccount"))
        {
          objc_msgSend(v8, "value");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("MCAccountIsManaged"));

          if ((v10 & 1) != 0)
          {

            v11 = 1;
            goto LABEL_12;
          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (void)_previewControllerForICSEvent:(id)a3 eventStore:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  EKICSPreviewController *icsPreviewController;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[SGEventSuggestion _icsDataEkEvent:](self, "_icsDataEkEvent:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SGEventSuggestionBase suggestionDelegate](self, "suggestionDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "icsPreviewControllerForData:andEventStore:", v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAllowsImport:", 1);
    objc_msgSend(v9, "setAllowsEditing:", 1);
    objc_msgSend(v9, "setPreviewDelegate:", self);
    objc_msgSend(v9, "viewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidesBottomBarWhenPushed:", 0);

    -[SGEventSuggestionBase suggestionDelegate](self, "suggestionDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCancelButtonWithTarget:action:", v11, sel_dismissICSPreviewController_);

    icsPreviewController = self->_icsPreviewController;
    self->_icsPreviewController = (EKICSPreviewController *)v9;

  }
  else
  {
    sgEventsLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[SGRealtimeEvent event](self->super._realtimeEvent, "event");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "loggingIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_1B1170000, v13, OS_LOG_TYPE_DEFAULT, "No ICS Data found for event [SGEvent (%{public}@)]", (uint8_t *)&v16, 0xCu);

    }
  }

}

- (id)_icsDataEkEvent:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SGRealtimeEvent event](self->super._realtimeEvent, "event", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x1E0D197F0], "resolveName:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isIcsAttachmentData") & 1) != 0)
        {
          objc_msgSend(v8, "icsAttachmentData");
          v5 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }

      }
      v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icsPreviewController, 0);
}

void __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  dispatch_time_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t);
  void *v46;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  id v53;
  _QWORD block[5];
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD aBlock[5];
  id v59;
  __int128 *p_buf;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  __int128 buf;
  uint64_t v66;
  void *v67;
  uint64_t *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "state") == 1
    || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "state") == 2)
  {
    v4 = (void *)objc_opt_new();
    if (objc_msgSend(*(id *)(a1 + 32), "_isSourceAccountManaged"))
      objc_msgSend(v4, "setSourceAccountManagement:", 2);
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "beginIgnoringInteractionEvents");

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v66 = 0x2020000000;
    LOBYTE(v67) = 0;
    v6 = dispatch_time(0, 83333333);
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke_2;
    aBlock[3] = &unk_1E62D6B08;
    v8 = *(_QWORD *)(a1 + 32);
    p_buf = &buf;
    aBlock[4] = v8;
    v9 = v4;
    v59 = v9;
    v10 = _Block_copy(aBlock);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "event");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v7;
    v56[1] = 3221225472;
    v56[2] = __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke_11;
    v56[3] = &unk_1E62D6B58;
    v12 = v10;
    v57 = v12;
    objc_msgSend(v11, "geocodeWithCallback:", v56);

    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke_3;
    block[3] = &unk_1E62D6B30;
    block[4] = *(_QWORD *)(a1 + 32);
    v55 = v12;
    v13 = v12;
    dispatch_after(v6, MEMORY[0x1E0C80D38], block);

    _Block_object_dispose(&buf, 8);
  }
  else if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "state") == 4
         || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "state") == 5)
  {
    v9 = (id)objc_opt_new();
    if (objc_msgSend(*(id *)(a1 + 32), "_isSourceAccountManaged"))
      objc_msgSend(v9, "setSourceAccountManagement:", 2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "eventIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "eventWithIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "event");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "mergeIntoEKEvent:withStore:", v15, v9);

    v61 = 0;
    v62 = &v61;
    v63 = 0x2050000000;
    v17 = (void *)getEKEventViewControllerClass_softClass;
    v64 = getEKEventViewControllerClass_softClass;
    if (!getEKEventViewControllerClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v66 = (uint64_t)__getEKEventViewControllerClass_block_invoke;
      v67 = &unk_1E62D7128;
      v68 = &v61;
      __getEKEventViewControllerClass_block_invoke((uint64_t)&buf);
      v17 = (void *)v62[3];
    }
    v18 = objc_retainAutorelease(v17);
    _Block_object_dispose(&v61, 8);
    v19 = (void *)objc_opt_new();
    objc_msgSend(v19, "setEvent:", v15);
    objc_msgSend(v19, "setAllowsEditing:", 0);
    objc_msgSend(v19, "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v19, "setModalPresentationStyle:", -1);
    sgEventsLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "event");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "loggingIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v22;
      _os_log_impl(&dword_1B1170000, v20, OS_LOG_TYPE_DEFAULT, "Presenting confirmed event (%{public}@) view controller", (uint8_t *)&buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "suggestionDelegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "presentViewController:", v19);

  }
  else
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "state") != 3)
      goto LABEL_7;
    v24 = (void *)objc_opt_new();
    if (objc_msgSend(*(id *)(a1 + 32), "_isSourceAccountManaged"))
      objc_msgSend(v24, "setSourceAccountManagement:", 2);
    v26 = *(_QWORD *)(a1 + 32);
    v25 = (id *)(a1 + 32);
    objc_msgSend(*(id *)(v26 + 8), "eventIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "eventWithIdentifier:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("SuggestionsBannerAlertButtonDeleteEvent"), &stru_1E62D74E0, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = MEMORY[0x1E0C809B0];
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke_23;
    v49[3] = &unk_1E62D6B80;
    v50 = v28;
    v51 = v24;
    v52 = *v25;
    v34 = v29;
    v53 = v34;
    v35 = v24;
    v9 = v28;
    objc_msgSend(v30, "actionWithTitle:style:handler:", v32, 2, v49);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addAction:", v36);

    v37 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("SuggestionsBannerAlertButtonCancel"), &stru_1E62D74E0, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v33;
    v44 = 3221225472;
    v45 = __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke_27;
    v46 = &unk_1E62D6BA8;
    v47 = *v25;
    v48 = v34;
    v40 = v34;
    objc_msgSend(v37, "actionWithTitle:style:handler:", v39, 1, &v43);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addAction:", v41, v43, v44, v45, v46, v47);

    objc_msgSend(v40, "setModalPresentationStyle:", 7);
    objc_msgSend(*v25, "suggestionDelegate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "presentViewController:", v40);

  }
LABEL_7:

}

void __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 buf;
  SGWalletOrderSuggestionHelpers *(*v26)(uint64_t);
  void *v27;
  uint64_t *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v4 + 24))
  {
    *(_BYTE *)(v4 + 24) = 1;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endIgnoringInteractionEvents");

    v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "state");
    v7 = *(void **)(a1 + 40);
    if (v6 == 1)
    {
      objc_msgSend(v3, "toEKEventWithStore:", *(_QWORD *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "eventIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "eventWithIdentifier:", v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "mergeIntoEKEvent:withStore:", v8, *(_QWORD *)(a1 + 40));
    }
    objc_msgSend(*(id *)(a1 + 32), "_previewControllerForICSEvent:eventStore:", v8, *(_QWORD *)(a1 + 40));
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    if (v10)
    {
      objc_msgSend(v10, "viewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      sgEventsLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "event");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "loggingIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v14;
        _os_log_impl(&dword_1B1170000, v12, OS_LOG_TYPE_DEFAULT, "Presenting suggested ICS event (%{public}@) view controller", (uint8_t *)&buf, 0xCu);

      }
      objc_msgSend(v11, "setModalPresentationStyle:", 3);
      objc_msgSend(*(id *)(a1 + 32), "suggestionDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "presentViewController:", v11);
    }
    else
    {
      v21 = 0;
      v22 = &v21;
      v23 = 0x2050000000;
      v16 = (void *)getEKEventEditViewControllerClass_softClass;
      v24 = getEKEventEditViewControllerClass_softClass;
      if (!getEKEventEditViewControllerClass_softClass)
      {
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v26 = __getEKEventEditViewControllerClass_block_invoke;
        v27 = &unk_1E62D7128;
        v28 = &v21;
        __getEKEventEditViewControllerClass_block_invoke((uint64_t)&buf);
        v16 = (void *)v22[3];
      }
      v17 = objc_retainAutorelease(v16);
      _Block_object_dispose(&v21, 8);
      v11 = (void *)objc_opt_new();
      objc_msgSend(v11, "setEvent:", v8, v21);
      objc_msgSend(v11, "setEventStore:", *(_QWORD *)(a1 + 40));
      objc_msgSend(v11, "setHidesBottomBarWhenPushed:", 1);
      objc_msgSend(v11, "setEditViewDelegate:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v11, "setModalPresentationStyle:", 3);
      sgEventsLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "event");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "loggingIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v20;
        _os_log_impl(&dword_1B1170000, v18, OS_LOG_TYPE_DEFAULT, "Presenting suggested new event (%{public}@) view controller", (uint8_t *)&buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "suggestionDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "presentViewController:", v11);
    }

  }
}

void __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  _QWORD block[4];
  id v5;
  id v6;

  v3 = a2;
  if (pthread_main_np())
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke_2_12;
    block[3] = &unk_1E62D6B30;
    v6 = *(id *)(a1 + 32);
    v5 = v3;
    dispatch_sync(MEMORY[0x1E0C80D38], block);

  }
}

void __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "event");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    v9 = 0;
    v6 = objc_msgSend(v5, "removeEvent:span:error:", v4, 0, &v9);
    v7 = v9;
    if ((v6 & 1) == 0)
    {
      sgLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v7;
        _os_log_error_impl(&dword_1B1170000, v8, OS_LOG_TYPE_ERROR, "Error: error removing event: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend((id)objc_opt_class(), "confirm:event:completion:", 1, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), 0);
  objc_msgSend(*(id *)(a1 + 48), "_dismissViewController:retainBanner:", *(_QWORD *)(a1 + 56), 0);

}

uint64_t __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke_27(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissViewController:retainBanner:", *(_QWORD *)(a1 + 40), 1);
}

uint64_t __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke_2_12(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
