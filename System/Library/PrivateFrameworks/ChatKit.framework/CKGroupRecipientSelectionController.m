@implementation CKGroupRecipientSelectionController

- (CKGroupRecipientSelectionController)initWithConversation:(id)a3
{
  CKGroupRecipientSelectionController *v3;
  CKGroupRecipientSelectionController *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CKGroupRecipientSelectionController;
  v3 = -[CKRecipientSelectionController initWithConversation:](&v14, sel_initWithConversation_, a3);
  v4 = v3;
  if (v3)
    -[CKRecipientSelectionController setDelegate:](v3, "setDelegate:", v3);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLazuliEnabled");

  if (v6)
  {
    -[CKRecipientSelectionController conversation](v4, "conversation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[CKRecipientSelectionController conversation](v4, "conversation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "chat");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "participants");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "__imArrayByApplyingBlock:", &__block_literal_global_247);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKRecipientSelectionController refreshAvailabilityForRecipients:pendingConversation:](v4, "refreshAvailabilityForRecipients:pendingConversation:", v12, 0);
    }
  }
  return v4;
}

id __60__CKGroupRecipientSelectionController_initWithConversation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "ID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    IMChatCanonicalIDSIDsForAddress();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)loadView
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKGroupRecipientSelectionController;
  -[CKRecipientSelectionController loadView](&v9, sel_loadView);
  v3 = -[CKGroupRecipientSelectionController isBeingPresentedInMacDetailsView](self, "isBeingPresentedInMacDetailsView");
  -[CKGroupRecipientSelectionController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "_ckSystemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  -[CKRecipientSelectionController toField](self, "toField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ADD"), &stru_1E276D870, CFSTR("ChatKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLabel:", v8);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKGroupRecipientSelectionController;
  -[CKViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  if (-[CKGroupRecipientSelectionController isBeingPresentedInMacDetailsView](self, "isBeingPresentedInMacDetailsView"))
    -[CKGroupRecipientSelectionController _checkAvailabilityAndAddToken](self, "_checkAvailabilityAndAddToken");
  else
    -[CKGroupRecipientSelectionController _updateNavigationButton](self, "_updateNavigationButton");
  if (-[CKGroupRecipientSelectionController isBeingPresentedInMacDetailsView](self, "isBeingPresentedInMacDetailsView"))
  {
    -[CKRecipientSelectionController toField](self, "toField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);

    -[CKRecipientSelectionController toField](self, "toField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShowsAddButtonWhenExpanded:", 0);

  }
  -[CKRecipientSelectionController toField](self, "toField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "becomeFirstResponder");

}

- (void)viewDidAppearDeferredSetup
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKGroupRecipientSelectionController;
  -[CKRecipientSelectionController viewDidAppearDeferredSetup](&v17, sel_viewDidAppearDeferredSetup);
  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSuppressGroupSuggestions:", 1);

  v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[CKRecipientSelectionController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recipients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v6, "count"));

  -[CKRecipientSelectionController conversation](self, "conversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recipients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__CKGroupRecipientSelectionController_viewDidAppearDeferredSetup__block_invoke;
  v15[3] = &unk_1E2758E10;
  v10 = v7;
  v16 = v10;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v15);

  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPrefilteredRecipients:", v10);

  if (-[CKGroupRecipientSelectionController isBeingPresentedInMacDetailsView](self, "isBeingPresentedInMacDetailsView"))
  {
    -[CKRecipientSelectionController searchListController](self, "searchListController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v14);

  }
  -[CKGroupRecipientSelectionController _frecencySearch](self, "_frecencySearch");

}

void __65__CKGroupRecipientSelectionController_viewDidAppearDeferredSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CKIMComposeRecipient *v4;
  void *v5;
  CKIMComposeRecipient *v6;

  v3 = a2;
  v4 = [CKIMComposeRecipient alloc];
  objc_msgSend(v3, "defaultIMHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CKIMComposeRecipient initWithHandle:](v4, "initWithHandle:", v5);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

- (BOOL)shouldAutorotate
{
  void *v2;
  char v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldSuppressRotationInNewCompose") ^ 1;

  return v3;
}

- (void)recipientSelectionControllerDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKGroupRecipientSelectionController;
  -[CKRecipientSelectionController recipientSelectionControllerDidChange](&v3, sel_recipientSelectionControllerDidChange);
  if (-[CKGroupRecipientSelectionController isBeingPresentedInMacDetailsView](self, "isBeingPresentedInMacDetailsView"))
    -[CKGroupRecipientSelectionController _checkAvailabilityAndAddToken](self, "_checkAvailabilityAndAddToken");
  else
    -[CKGroupRecipientSelectionController _updateNavigationButton](self, "_updateNavigationButton");
  -[CKGroupRecipientSelectionController _frecencySearch](self, "_frecencySearch");
}

- (void)recipientAvailibilitiesDidUpdate
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)CKGroupRecipientSelectionController;
  -[CKRecipientSelectionController recipientAvailibilitiesDidUpdate](&v23, sel_recipientAvailibilitiesDidUpdate);
  if (-[CKGroupRecipientSelectionController isBeingPresentedInMacDetailsView](self, "isBeingPresentedInMacDetailsView"))
  {
    -[CKGroupRecipientSelectionController _checkAvailabilityAndAddToken](self, "_checkAvailabilityAndAddToken");
    return;
  }
  -[CKGroupRecipientSelectionController _updateNavigationButton](self, "_updateNavigationButton");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[CKRecipientSelectionController toField](self, "toField", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (!v5)
    goto LABEL_15;
  v6 = v5;
  v7 = *(_QWORD *)v20;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v20 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isLazuliEnabled");

      if (!v11)
      {
        -[CKRecipientSelectionController recipientAvailabilities](self, "recipientAvailabilities");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "IDSCanonicalAddress");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
          continue;
LABEL_12:
        -[CKRecipientSelectionController toField](self, "toField");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "invalidateAtomPresentationOptionsForRecipient:", v9);

        continue;
      }
      -[CKRecipientSelectionController expandedRecipientAvailabilities](self, "expandedRecipientAvailabilities");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "IDSCanonicalAddress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "hasResultsForRecipient:", v13);

      if ((v14 & 1) != 0)
        goto LABEL_12;
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  }
  while (v6);
LABEL_15:

}

- (BOOL)homogenizePreferredServiceForiMessage
{
  return 0;
}

- (BOOL)shouldSuppressSearchResultsTable
{
  return 0;
}

- (BOOL)alwaysShowSearchResultsTable
{
  return 1;
}

- (BOOL)isBeingPresentedInMacDetailsView
{
  return CKIsRunningInMacCatalyst() != 0;
}

- (void)didAddRecipient:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)CKGroupRecipientSelectionController;
  v4 = a3;
  -[CKRecipientSelectionController didAddRecipient:](&v6, sel_didAddRecipient_, v4);
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1, v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKRecipientSelectionController refreshAvailabilityForRecipients:pendingConversation:](self, "refreshAvailabilityForRecipients:pendingConversation:", v5, 1);
}

- (BOOL)recipientSelectionIsGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[CKRecipientSelectionController recipients](self, "recipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") > 1)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v4, "recipients");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (unint64_t)objc_msgSend(v6, "count") > 1;

  }
  return v7;
}

- (double)visibleInputAndEntryViewHeightToAvoidForRecipientSelectionController:(id)a3
{
  return 0.0;
}

- (void)recipientSelectionController:(id)a3 textDidChange:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;

  -[CKRecipientSelectionController toField](self, "toField", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
    -[CKGroupRecipientSelectionController _frecencySearch](self, "_frecencySearch");
}

- (void)recipientSelectionControllerRequestDismissKeyboard:(id)a3
{
  void *v3;
  id v4;

  -[CKRecipientSelectionController toField](self, "toField", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

}

- (UIEdgeInsets)navigationBarInsetsForRecipientSelectionController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  -[CKGroupRecipientSelectionController topInsetForNavBar](self, "topInsetForNavBar", a3);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v6;
  return result;
}

- (double)topInsetForNavBar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  double v11;
  double v12;
  void *v13;
  double v14;

  -[CKGroupRecipientSelectionController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isStatusBarHidden");

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shouldInsetForStatusBar");

  if (v10)
  {
    v11 = 0.0;
    if ((v8 & 1) == 0)
    {
      objc_msgSend(v6, "currentHeight");
      v11 = v12;
    }
  }
  else
  {
    v11 = 0.0;
    if (objc_msgSend(v4, "isTranslucent"))
    {
      -[CKGroupRecipientSelectionController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "safeAreaInsets");
      v11 = v14;

    }
  }

  return v11;
}

- (void)_updateNavigationButton
{
  void *v3;
  uint64_t v4;
  _BOOL8 v5;
  id v6;

  -[CKRecipientSelectionController recipients](self, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    v5 = -[CKGroupRecipientSelectionController _enableRecipientsAdditionBasedOnAvailability](self, "_enableRecipientsAdditionBasedOnAvailability");
  else
    v5 = 0;
  -[CKGroupRecipientSelectionController doneButton](self, "doneButton");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v5);

}

- (void)_checkAvailabilityAndAddToken
{
  id v3;

  if (-[CKGroupRecipientSelectionController isBeingPresentedInMacDetailsView](self, "isBeingPresentedInMacDetailsView"))
  {
    if (-[CKGroupRecipientSelectionController _enableRecipientsAdditionBasedOnAvailability](self, "_enableRecipientsAdditionBasedOnAvailability"))
    {
      -[CKRecipientSelectionController delegate](self, "delegate");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "recipientSelectionControllerReturnPressed:", self);

    }
  }
}

- (BOOL)_enableRecipientsAdditionBasedOnAvailability
{
  uint64_t v3;
  unint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  _QWORD *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  id obj;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[CKRecipientSelectionController recipients](self, "recipients");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v32)
  {
    v3 = *(_QWORD *)v35;
    v4 = 0x1E0D39000uLL;
    while (2)
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v35 != v3)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(*(id *)(v4 + 2112), "sharedFeatureFlags");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isLazuliEnabled");

        v33 = v6;
        objc_msgSend(v6, "IDSCanonicalAddress");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[CKRecipientSelectionController expandedRecipientAvailabilities](self, "expandedRecipientAvailabilities");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "hasResultsForRecipient:", v9);

          -[CKRecipientSelectionController expandedRecipientAvailabilities](self, "expandedRecipientAvailabilities");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (_QWORD *)MEMORY[0x1E0D38DC8];
          v14 = objc_msgSend(v12, "hasIDStatus:forRecipient:forServicesWithCapability:", 1, v9, *MEMORY[0x1E0D38DC8]);

          -[CKRecipientSelectionController expandedRecipientAvailabilities](self, "expandedRecipientAvailabilities");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "hasIDStatus:forRecipient:forServicesWithCapability:", 2, v9, *v13);
        }
        else
        {
          -[CKRecipientSelectionController recipientAvailabilities](self, "recipientAvailabilities");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", v9);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v18 != 0;

          -[CKRecipientSelectionController recipientAvailabilities](self, "recipientAvailabilities");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKey:", v9);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v20, "integerValue") == 1;

          -[CKRecipientSelectionController recipientAvailabilities](self, "recipientAvailabilities");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", v9);
          v21 = v4;
          v22 = v3;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v23, "integerValue") == 2;

          v3 = v22;
          v4 = v21;
        }

        if (v11 && ((v14 | v16) & 1) != 0)
        {
          v29 = 1;
          goto LABEL_23;
        }
        if (objc_msgSend(MEMORY[0x1E0D35808], "isContactLimitsFeatureEnabled"))
        {
          if (!-[CKRecipientSelectionController allowedByScreenTime](self, "allowedByScreenTime"))
          {
            objc_msgSend(v33, "normalizedAddress");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              -[CKRecipientSelectionController currentConversationContext](self, "currentConversationContext");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "allowedByContactsHandle");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "normalizedAddress");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "objectForKey:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (v28 && !objc_msgSend(v28, "BOOLValue"))
              {

                goto LABEL_22;
              }

            }
          }
        }
      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v32)
        continue;
      break;
    }
  }
LABEL_22:
  v29 = 0;
LABEL_23:

  return v29;
}

- (void)_frecencySearch
{
  void *v3;
  void *v4;
  id v5;

  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchWithText:", 0);

  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__ck_scrollToTop:", 0);

}

- (id)handlesForScreenTimePolicyCheck
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  objc_super v14;

  if (!objc_msgSend(MEMORY[0x1E0D35808], "isContactLimitsFeatureEnabled"))
    return 0;
  v14.receiver = self;
  v14.super_class = (Class)CKGroupRecipientSelectionController;
  -[CKRecipientSelectionController handlesForScreenTimePolicyCheck](&v14, sel_handlesForScreenTimePolicyCheck);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CKRecipientSelectionController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CKRecipientSelectionController conversation](self, "conversation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "participants");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __70__CKGroupRecipientSelectionController_handlesForScreenTimePolicyCheck__block_invoke;
    v12[3] = &unk_1E275A108;
    v13 = v4;
    objc_msgSend(v9, "__imForEach:", v12);

  }
  v10 = (void *)objc_msgSend(v4, "copy");

  return v10;
}

void __70__CKGroupRecipientSelectionController_handlesForScreenTimePolicyCheck__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "ID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (void)composeRecipientViewReturnPressed:(id)a3
{
  id v4;

  if (-[CKGroupRecipientSelectionController _enableRecipientsAdditionBasedOnAvailability](self, "_enableRecipientsAdditionBasedOnAvailability", a3))
  {
    -[CKRecipientSelectionController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recipientSelectionControllerReturnPressed:", self);

  }
}

- (void)handleCancelAction:(id)a3 completion:(id)a4
{
  id v5;

  v5 = a4;
  -[CKRecipientSelectionController stopCheckingRecipientAvailabilityAndRemoveAllTimers](self, "stopCheckingRecipientAvailabilityAndRemoveAllTimers");
  -[CKRecipientSelectionController invalidateOutstandingIDStatusRequests](self, "invalidateOutstandingIDStatusRequests");
  -[CKGroupRecipientSelectionController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v5 + 2))(v5, 0, 0, 0, 0);

}

- (void)handleDoneActionForConversation:(id)a3 viewController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[CKRecipientSelectionController toField](self, "toField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recipients");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v8, "recipientStrings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __97__CKGroupRecipientSelectionController_handleDoneActionForConversation_viewController_completion___block_invoke;
  v23[3] = &unk_1E274B678;
  v24 = v14;
  v16 = v14;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", v23);
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __97__CKGroupRecipientSelectionController_handleDoneActionForConversation_viewController_completion___block_invoke_2;
  v20[3] = &unk_1E2755FA8;
  v21 = v8;
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = v22;
  v18 = v8;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v20);
  -[CKGroupRecipientSelectionController handleAddingHandles:conversation:viewController:allRecipientAddresses:completion:](self, "handleAddingHandles:conversation:viewController:allRecipientAddresses:completion:", v17, v18, v10, v16, v9);

}

void __97__CKGroupRecipientSelectionController_handleDoneActionForConversation_viewController_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "address");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __97__CKGroupRecipientSelectionController_handleDoneActionForConversation_viewController_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imHandleWithID:alreadyCanonical:", v4, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
}

- (id)_orderedMutableGroupServices
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D35918], "servicesWithCapabilityName:", *MEMORY[0x1E0D38E40]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_85_2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Ranked service names for details view add resolution: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  return v3;
}

uint64_t __67__CKGroupRecipientSelectionController__orderedMutableGroupServices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "serviceForSendingPriority");
  if (v6 <= objc_msgSend(v5, "serviceForSendingPriority"))
  {
    v8 = objc_msgSend(v4, "serviceForSendingPriority");
    v7 = v8 < objc_msgSend(v5, "serviceForSendingPriority");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (void)handleAddingHandles:(id)a3 conversation:(id)a4 viewController:(id)a5 allRecipientAddresses:(id)a6 completion:(id)a7
{
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  BOOL v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void (**v36)(id, uint64_t, id, id, CKGroupRecipientSelectionController *);
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v31 = a4;
  v32 = a5;
  v34 = a6;
  v36 = (void (**)(id, uint64_t, id, id, CKGroupRecipientSelectionController *))a7;
  -[CKGroupRecipientSelectionController _orderedMutableGroupServices](self, "_orderedMutableGroupServices");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v33;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Ranked service names for details view add resolution: %@", buf, 0xCu);
    }

  }
  -[CKRecipientSelectionController conversation](self, "conversation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "supportsMutatingGroupMembers");

  if (!v14)
    goto LABEL_27;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v15 = v33;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (!v16)
  {
LABEL_18:

LABEL_27:
    v36[2](v36, 1, v35, v34, self);
    goto LABEL_28;
  }
  v17 = *(_QWORD *)v38;
LABEL_8:
  v18 = 0;
  while (1)
  {
    if (*(_QWORD *)v38 != v17)
      objc_enumerationMutation(v15);
    v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v18);
    v20 = -[CKGroupRecipientSelectionController hasInvalidRecipientsForService:](self, "hasInvalidRecipientsForService:", v19);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v42 = v19;
        v43 = 1024;
        LODWORD(v44) = v20;
        _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "hasInvalidRecipientsForService: %@, %d", buf, 0x12u);
      }

    }
    if (!v20)
      break;
    if (v16 == ++v18)
    {
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (v16)
        goto LABEL_8;
      goto LABEL_18;
    }
  }
  v22 = v19;

  if (!v22)
    goto LABEL_27;
  -[CKRecipientSelectionController conversation](self, "conversation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addRecipientHandles:", v35);

  -[CKRecipientSelectionController conversation](self, "conversation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sendingService");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v26 = v22 == v25;

  if (!v26)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        -[CKRecipientSelectionController conversation](self, "conversation");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "sendingService");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v42 = v29;
        v43 = 2112;
        v44 = v22;
        _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "Current service %@, new participant(s) supported service %@. Refreshing service for sending...", buf, 0x16u);

      }
    }
    -[CKRecipientSelectionController conversation](self, "conversation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "refreshServiceForSending");

  }
  -[CKGroupRecipientSelectionController handleCancelAction:completion:](self, "handleCancelAction:completion:", v32, v36);

LABEL_28:
}

- (BOOL)hasInvalidRecipientsForService:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  BOOL v27;
  NSObject *v28;
  void *v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[CKRecipientSelectionController recipients](self, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v37 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "IDSCanonicalAddress");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isLazuliEnabled");

        if (v10)
        {
          -[CKRecipientSelectionController expandedRecipientAvailabilities](self, "expandedRecipientAvailabilities");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "idStatusForRecipient:service:", v8, v12);
        }
        else
        {
          -[CKRecipientSelectionController recipientAvailabilities](self, "recipientAvailabilities");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "integerValue");
        }
        v14 = v13;

        if (v14 != 1)
        {
LABEL_28:
          v27 = 1;
          goto LABEL_29;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      if (v5)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isLazuliEnabled");

  if (v16)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[CKRecipientSelectionController conversation](self, "conversation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "chat");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "participants");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v33;
      while (2)
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v33 != v20)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "ID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          IMChatCanonicalIDSIDsForAddress();
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          -[CKRecipientSelectionController expandedRecipientAvailabilities](self, "expandedRecipientAvailabilities");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "name");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v24, "idStatusForRecipient:service:", v23, v25);

          if (v26 != 1)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v31, "name");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v41 = v23;
                v42 = 2112;
                v43 = v29;
                _os_log_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_INFO, "Existing handle %@ was not reachable on service %@, cannot add.", buf, 0x16u);

              }
            }

            goto LABEL_28;
          }

        }
        v19 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
        if (v19)
          continue;
        break;
      }
    }
    v27 = 0;
LABEL_29:

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)_serviceForRecipientPresentationOptions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[CKRecipientSelectionController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendingService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CKGroupRecipientSelectionController;
    -[CKRecipientSelectionController _serviceForRecipientPresentationOptions](&v9, sel__serviceForRecipientPresentationOptions);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (UIBarButtonItem)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
}

@end
