@implementation CNContactPickerViewController

- (CNContactPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  CNContactPickerViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNContactPickerViewController;
  v4 = -[CNContactPickerViewController initWithNibName:bundle:](&v6, sel_initWithNibName_bundle_, a3, a4);
  -[CNContactPickerViewController setAllowsCancel:](v4, "setAllowsCancel:", 1);
  -[CNContactPickerViewController setAutocloses:](v4, "setAutocloses:", 1);
  -[CNContactPickerViewController setCardActions:](v4, "setCardActions:", 0);
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CNContactPickerViewController viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)CNContactPickerViewController;
  -[CNContactPickerViewController dealloc](&v4, sel_dealloc);
}

- (id)_pickerPresentedViewController
{
  CNContactPickerViewController *v2;
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;

  v2 = self;
  -[CNContactPickerViewController delegate](v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CNContactPickerViewController delegate](v2, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contactPickerPresentedViewController:", v2);
    v6 = objc_claimAutoreleasedReturnValue();

    v2 = (CNContactPickerViewController *)v6;
  }
  return v2;
}

- (void)_checkConsistencyFromOptions:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;

  v21 = a3;
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ClientWantsSingleContact"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ClientWantsSingleProperty"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ClientWantsMultipleContacts"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ClientWantsMultipleProperties"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  -[CNContactPickerViewController predicateForSelectionOfContact](self, "predicateForSelectionOfContact");
  v12 = objc_claimAutoreleasedReturnValue();

  -[CNContactPickerViewController predicateForSelectionOfProperty](self, "predicateForSelectionOfProperty");
  v13 = objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_contactPicker_didSelectContact_);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_contactPicker_didSelectContactProperty_);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 | v7) == 1 && v9 | v11)
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerViewController.m", 93, 4, CFSTR("Both single contact and multiple contacts delegate methods are implemented, the single variants will be ignored"), v15, v16, v17, v18, v20);
    objc_msgSend(v21, "removeObjectForKey:", CFSTR("ClientWantsSingleContact"));
    objc_msgSend(v21, "removeObjectForKey:", CFSTR("ClientWantsSingleProperty"));
  }
  if (((v5 | v7 | v9 | v11) & 1) != 0)
  {
    if (((v5 | v9 | v11) & 1) != 0)
    {
      if (((v7 | v11) & 1) == 0 && v13)
      {
        _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerViewController.m", 114, 3, CFSTR("Property selection predicate is set but the delegate does not implement %@. The predicate will be ignored."), v15, v16, v17, v18, (uint64_t)v19);
LABEL_11:
        -[CNContactPickerViewController setPredicateForSelectionOfProperty:](self, "setPredicateForSelectionOfProperty:", 0);
      }
    }
    else if (v12)
    {
      _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerViewController.m", 108, 3, CFSTR("Person selection predicate is set but the delegate does not implement %@. The predicate will be ignored."), v15, v16, v17, v18, (uint64_t)v14);
      -[CNContactPickerViewController setPredicateForSelectionOfContact:](self, "setPredicateForSelectionOfContact:", 0);
    }
  }
  else if (v12 | v13)
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerViewController.m", 101, 3, CFSTR("Selection predicates are set but the delegate does not implement %@ and %@. Those predicates will be ignored."), v15, v16, v17, v18, (uint64_t)v14);
    -[CNContactPickerViewController setPredicateForSelectionOfContact:](self, "setPredicateForSelectionOfContact:", 0);
    goto LABEL_11;
  }

}

- (void)scrollToClosestContactMatching:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x1E0C97360];
  v5 = a3;
  v8 = objc_alloc_init(v4);
  objc_msgSend(v5, "givenName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGivenName:", v6);

  objc_msgSend(v5, "familyName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setFamilyName:", v7);
  -[CNContactPickerViewController setScrollContact:](self, "setScrollContact:", v8);

}

- (void)invalidateSelectionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CNContactPickerViewController viewController](self, "viewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateSelectionAnimated:", v3);

}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactPickerViewController;
  -[CNContactPickerViewController loadView](&v3, sel_loadView);
  -[CNContactPickerViewController _viewWillBePresented](self, "_viewWillBePresented");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactPickerViewController;
  -[CNContactPickerViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "isPPTAvailable"))
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_3763);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactPickerViewController;
  -[CNContactPickerViewController viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "isPPTAvailable"))
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_30);
}

- (BOOL)_isDelayingPresentation
{
  objc_super v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNContactPickerViewController;
  if (-[CNContactPickerViewController _isDelayingPresentation](&v5, sel__isDelayingPresentation))
    return 1;
  if (!self->_ignoreViewWillBePresented && (objc_opt_respondsToSelector() & 1) != 0)
    -[CNContactPickerViewController _viewWillBePresented](self, "_viewWillBePresented");
  v4.receiver = self;
  v4.super_class = (Class)CNContactPickerViewController;
  return -[CNContactPickerViewController _isDelayingPresentation](&v4, sel__isDelayingPresentation);
}

- (void)_endDelayingPresentation
{
  objc_super v3;

  self->_ignoreViewWillBePresented = 1;
  v3.receiver = self;
  v3.super_class = (Class)CNContactPickerViewController;
  -[CNContactPickerViewController _endDelayingPresentation](&v3, sel__endDelayingPresentation);
  self->_ignoreViewWillBePresented = 0;
}

- (void)_setViewController:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setDelegate:", self);
  -[CNContactPickerViewController setViewController:](self, "setViewController:", v4);
  -[UIViewController cnui_addChildViewController:](self, "cnui_addChildViewController:", v4);

  -[CNContactPickerViewController _setupViewController](self, "_setupViewController");
}

- (void)_setupViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  uint64_t v55;
  void *v56;
  void *v57;
  _QWORD v58[5];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[CNContactPickerViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithBool:", objc_opt_respondsToSelector() & 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ClientWantsSingleContact"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[CNContactPickerViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithBool:", objc_opt_respondsToSelector() & 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("ClientWantsSingleProperty"));

  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[CNContactPickerViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (objc_opt_respondsToSelector() & 1) != 0
     && -[CNContactPickerViewController limitedAccessPickerType](self, "limitedAccessPickerType") != 5;
  objc_msgSend(v10, "numberWithInt:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("ClientWantsMultipleContacts"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[CNContactPickerViewController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithBool:", objc_opt_respondsToSelector() & 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("ClientWantsMultipleProperties"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) == 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("ClientHasContactsAccess"));

  -[CNContactPickerViewController familyMember](self, "familyMember");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("familyMember"));

  -[CNContactPickerViewController parentContainer](self, "parentContainer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("parentContainer"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNContactPickerViewController allowsDeletion](self, "allowsDeletion"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("allowsDeletion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNContactPickerViewController shouldAllowSearchForMultiSelect](self, "shouldAllowSearchForMultiSelect"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("allowsSearchForMultiSelect"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNContactPickerViewController allowsNamePicking](self, "allowsNamePicking"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("allowsNamePicking"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNContactPickerViewController shouldDisplaySuggestionsController](self, "shouldDisplaySuggestionsController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("shouldDisplaySuggestionsController"));

  -[CNContactPickerViewController suggestionsIgnoredContactIdentifiers](self, "suggestionsIgnoredContactIdentifiers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("suggestionsIgnoredContactIdentifiers"));

  -[CNContactPickerViewController suggestionsInteractionDomains](self, "suggestionsInteractionDomains");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("suggestionsInteractionDomains"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNContactPickerViewController shouldDisplayAddNewContactRow](self, "shouldDisplayAddNewContactRow"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("shouldDisplayAddNewContactRow"));

  -[CNContactPickerViewController targetGroupIdentifier](self, "targetGroupIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("targetGroupIdentifier"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("shouldHideDuplicates"));
  v28 = (void *)MEMORY[0x1E0CB37E8];
  -[CNContactPickerViewController traitCollection](self, "traitCollection");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "numberWithInteger:", objc_msgSend(v29, "userInterfaceIdiom"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("hostIdiom"));

  -[CNContactPickerViewController limitedAccessContactSelection](self, "limitedAccessContactSelection");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("limitedAccessContactSelection"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CNContactPickerViewController limitedAccessPickerType](self, "limitedAccessPickerType"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("limitedAccessPickerType"));

  -[CNContactPickerViewController limitedAccessAppName](self, "limitedAccessAppName");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("limitedAccessAppName"));

  -[CNContactPickerViewController limitedAccessAppBundleId](self, "limitedAccessAppBundleId");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("limitedAccessAppBundleId"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNContactPickerViewController hasPickerPrivacyUI](self, "hasPickerPrivacyUI"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("hasPickerPrivacyUI"));

  -[CNContactPickerViewController nibBundle](self, "nibBundle");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bundleIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("limitedAccessAppBundleId"));

  -[CNContactPickerViewController limitedAccessSearchQuery](self, "limitedAccessSearchQuery");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("limitedAccessSearchQuery"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CNContactPickerViewController limitedAccessCaption](self, "limitedAccessCaption"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("limitedAccessContactCaption"));

  if (-[CNContactPickerViewController shouldDisplaySuggestionsController](self, "shouldDisplaySuggestionsController"))
  {
    -[CNContactPickerViewController contactSuggestions](self, "contactSuggestions");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      -[CNContactPickerViewController contactSuggestions](self, "contactSuggestions");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("suggestedContacts"));

    }
  }
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "entitlementVerifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "currentProcessHasBooleanEntitlement:error:", *MEMORY[0x1E0D137A8], 0);

  if (v44)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNContactPickerViewController ignoresParentalRestrictions](self, "ignoresParentalRestrictions"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("ignoresParentalRestrictions"));

  }
  -[CNContactPickerViewController prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("prohibitedPropertyKeys"));

  -[CNContactPickerViewController scrollContact](self, "scrollContact");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    -[CNContactPickerViewController scrollContact](self, "scrollContact");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("ScrollContact"));

  }
  -[CNContactPickerViewController _checkConsistencyFromOptions:](self, "_checkConsistencyFromOptions:", v3);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("predicateForEnablingContact"), CFSTR("predicateForSelectionOfContact"), CFSTR("predicateForSelectionOfProperty"), CFSTR("displayedPropertyKeys"), CFSTR("cardActions"), CFSTR("hidesSearchableSources"), CFSTR("onlyRealContacts"), CFSTR("allowsEditing"), CFSTR("allowsCancel"), CFSTR("allowsDone"), CFSTR("allowsNamePicking"), CFSTR("prompt"), CFSTR("hidesPromptInLandscape"), CFSTR("bannerTitle"), CFSTR("bannerValue"), 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v52; ++i)
      {
        if (*(_QWORD *)v60 != v53)
          objc_enumerationMutation(v50);
        v55 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
        -[CNContactPickerViewController valueForKey:](self, "valueForKey:", v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if (v56)
          objc_msgSend(v49, "setObject:forKeyedSubscript:", v56, v55);

      }
      v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    }
    while (v52);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("Properties"));
  -[CNContactPickerViewController viewController](self, "viewController");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __53__CNContactPickerViewController__setupViewController__block_invoke;
  v58[3] = &unk_1E204D1E8;
  v58[4] = self;
  objc_msgSend(v57, "setupWithOptions:readyBlock:", v3, v58);

}

- (BOOL)_shouldBeOutOfProcess
{
  uint64_t v3;

  v3 = objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0);
  return -[CNContactPickerViewController mode](self, "mode") != 2 || v3 != 3;
}

- (void)_prepareViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CNContactPickerContentViewController *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  id v10;

  -[CNContactPickerViewController _pickerPresentedViewController](self, "_pickerPresentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_beginDelayingPresentation:cancellationHandler:", &__block_literal_global_49, 10.0);

  -[CNContactPickerViewController viewController](self, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNContactPickerViewController _setupViewController](self, "_setupViewController");
  }
  else if (-[CNContactPickerViewController _shouldBeOutOfProcess](self, "_shouldBeOutOfProcess"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13B50]), "initWithAuditToken:assumedIdentity:", 0, 0);
    -[CNContactPickerViewController setRegulatoryLogger:](self, "setRegulatoryLogger:", v5);

    -[CNContactPickerViewController regulatoryLogger](self, "regulatoryLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayingOOPContactPicker");

    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x3042000000;
    v9[3] = __Block_byref_object_copy__3750;
    v9[4] = __Block_byref_object_dispose__3751;
    objc_initWeak(&v10, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__CNContactPickerViewController__prepareViewController__block_invoke_58;
    v8[3] = &unk_1E2048568;
    v8[4] = v9;
    +[CNContactPickerHostViewController getViewController:](CNContactPickerHostViewController, "getViewController:", v8);
    _Block_object_dispose(v9, 8);
    objc_destroyWeak(&v10);
  }
  else
  {
    v7 = objc_alloc_init(CNContactPickerContentViewController);
    -[CNContactPickerViewController _setViewController:](self, "_setViewController:", v7);

  }
}

- (void)closePickerIfNeeded
{
  id v3;

  if (-[CNContactPickerViewController autocloses](self, "autocloses"))
  {
    -[CNContactPickerViewController _pickerPresentedViewController](self, "_pickerPresentedViewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isBeingDismissed") & 1) == 0)
      objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)notifyDelegateForCancellation
{
  void *v3;
  char v4;
  id v5;

  -[CNContactPickerViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CNContactPickerViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contactPickerDidCancel:", self);

  }
}

- (UINavigationController)navigationController
{
  void *v2;
  void *v3;

  -[CNContactPickerViewController viewController](self, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UINavigationController *)v3;
}

- (UIBarButtonItem)addContactBarButtonItem
{
  void *v2;
  void *v3;

  -[CNContactPickerViewController viewController](self, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addContactBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIBarButtonItem *)v3;
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  -[CNContactPickerViewController viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return (_UIRemoteViewController *)v5;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerViewController.m", 346, 7, CFSTR("picker did cancel by dismiss"), v3, v4, v5, v6, v8);
  -[CNContactPickerViewController _emitPickerAnalyticsDidSelectItems:](self, "_emitPickerAnalyticsDidSelectItems:", 0);
  -[CNContactPickerViewController notifyDelegateForCancellation](self, "notifyDelegateForCancellation");
}

- (void)pickerDidSelectAddNewContact
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CNContactPickerViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE020890))
    v4 = v3;
  else
    v4 = 0;
  v6 = v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CNContactPickerViewController regulatoryLogger](self, "regulatoryLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "receivingContactsDataFromOOPContactPicker");

    objc_msgSend(v6, "pickerDidSelectAddNewContact:", self);
  }

}

- (void)pickerDidSelectContact:(id)a3 property:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerViewController.m", 365, 7, CFSTR("picker did select contact %@, property %@"), v7, v8, v9, v10, (uint64_t)v17);
  -[CNContactPickerViewController _emitPickerAnalyticsDidSelectItems:](self, "_emitPickerAnalyticsDidSelectItems:", 1);
  -[CNContactPickerViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[CNContactPickerViewController regulatoryLogger](self, "regulatoryLogger");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "receivingContactsDataFromOOPContactPicker");

      -[CNContactPickerViewController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "contactPicker:didSelectContactProperty:", self, v6);
LABEL_6:

    }
  }
  else
  {
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[CNContactPickerViewController regulatoryLogger](self, "regulatoryLogger");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "receivingContactsDataFromOOPContactPicker");

      -[CNContactPickerViewController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "contactPicker:didSelectContact:", self, v17);
      goto LABEL_6;
    }
  }
  -[CNContactPickerViewController closePickerIfNeeded](self, "closePickerIfNeeded");

}

- (void)pickerDidSelectContacts:(id)a3 properties:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerViewController.m", 385, 7, CFSTR("picker did select contacts: %@, properties: %@"), v7, v8, v9, v10, (uint64_t)v18);
  -[CNContactPickerViewController _emitPickerAnalyticsDidSelectItems:](self, "_emitPickerAnalyticsDidSelectItems:", 1);
  if (!v6)
  {
    -[CNContactPickerViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[CNContactPickerViewController regulatoryLogger](self, "regulatoryLogger");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "receivingContactsDataFromOOPContactPicker");

      -[CNContactPickerViewController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "contactPicker:didSelectContacts:", self, v18);
LABEL_6:

      goto LABEL_7;
    }
  }
  -[CNContactPickerViewController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    -[CNContactPickerViewController regulatoryLogger](self, "regulatoryLogger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "receivingContactsDataFromOOPContactPicker");

    -[CNContactPickerViewController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contactPicker:didSelectContactProperties:", self, v6);
    goto LABEL_6;
  }
LABEL_7:
  -[CNContactPickerViewController closePickerIfNeeded](self, "closePickerIfNeeded");

}

- (void)pickerDidCompleteWithNewContact:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerViewController.m", 407, 7, CFSTR("picker did finish with new contact: %@"), v5, v6, v7, v8, (uint64_t)v4);
  -[CNContactPickerViewController _emitPickerAnalyticsDidSelectItems:](self, "_emitPickerAnalyticsDidSelectItems:", 1);
  -[CNContactPickerViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE020890))
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    -[CNContactPickerViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    -[CNContactPickerViewController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if ((v13 & 1) != 0)
    {
      objc_msgSend(v14, "contactPicker:didSelectContact:", self, v4);
    }
    else
    {
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) == 0)
        goto LABEL_14;
      if (v4)
      {
        v18[0] = v4;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = (void *)MEMORY[0x1E0C9AA60];
      }
      -[CNContactPickerViewController delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "contactPicker:didSelectContacts:", self, v15);

    }
    goto LABEL_14;
  }
  objc_msgSend(v11, "contactPicker:didCompleteWithNewContact:", self, v4);
LABEL_14:
  -[CNContactPickerViewController closePickerIfNeeded](self, "closePickerIfNeeded");

}

- (void)pickerDidCancel
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerViewController.m", 425, 7, CFSTR("picker did cancel"), v2, v3, v4, v5, v7);
  -[CNContactPickerViewController _emitPickerAnalyticsDidSelectItems:](self, "_emitPickerAnalyticsDidSelectItems:", 0);
  -[CNContactPickerViewController notifyDelegateForCancellation](self, "notifyDelegateForCancellation");
  -[CNContactPickerViewController closePickerIfNeeded](self, "closePickerIfNeeded");
}

- (void)pickerDidGoBack
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerViewController.m", 434, 7, CFSTR("picker did go back"), v2, v3, v4, v5, v9);
  -[CNContactPickerViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EE020890))
    v8 = v7;
  else
    v8 = 0;
  v10 = v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "contactPickerDidGoBack:", self);
  -[CNContactPickerViewController closePickerIfNeeded](self, "closePickerIfNeeded");

}

- (void)didUpdateLimitedAccessSelection:(id)a3 contactListViewController:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[CNContactPickerViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EE020890))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "contactListViewController:didUpdateLimitedAccessSelection:", v6, v10);

}

- (void)contactListViewControllerShouldEditLimitedAccessSelection:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  -[CNContactPickerViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE020890))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "contactListViewControllerShouldEditLimitedAccessSelection:", v7);

}

- (void)_emitPickerAnalyticsDidSelectItems:(BOOL)a3
{
  AnalyticsSendEventLazy();
}

- (NSArray)displayedPropertyKeys
{
  return self->_displayedPropertyKeys;
}

- (void)setDisplayedPropertyKeys:(NSArray *)displayedPropertyKeys
{
  objc_setProperty_nonatomic_copy(self, a2, displayedPropertyKeys, 992);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (NSPredicate)predicateForEnablingContact
{
  return self->_predicateForEnablingContact;
}

- (void)setPredicateForEnablingContact:(NSPredicate *)predicateForEnablingContact
{
  objc_setProperty_nonatomic_copy(self, a2, predicateForEnablingContact, 1008);
}

- (NSPredicate)predicateForSelectionOfContact
{
  return self->_predicateForSelectionOfContact;
}

- (void)setPredicateForSelectionOfContact:(NSPredicate *)predicateForSelectionOfContact
{
  objc_setProperty_nonatomic_copy(self, a2, predicateForSelectionOfContact, 1016);
}

- (NSPredicate)predicateForSelectionOfProperty
{
  return self->_predicateForSelectionOfProperty;
}

- (void)setPredicateForSelectionOfProperty:(NSPredicate *)predicateForSelectionOfProperty
{
  objc_setProperty_nonatomic_copy(self, a2, predicateForSelectionOfProperty, 1024);
}

- (CNContactPickerContentViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (CNContact)scrollContact
{
  return self->_scrollContact;
}

- (void)setScrollContact:(id)a3
{
  objc_storeStrong((id *)&self->_scrollContact, a3);
}

- (CNRegulatoryLogger)regulatoryLogger
{
  return self->_regulatoryLogger;
}

- (void)setRegulatoryLogger:(id)a3
{
  objc_storeStrong((id *)&self->_regulatoryLogger, a3);
}

- (FAFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void)setFamilyMember:(id)a3
{
  objc_storeStrong((id *)&self->_familyMember, a3);
}

- (CNContainer)parentContainer
{
  return self->_parentContainer;
}

- (void)setParentContainer:(id)a3
{
  objc_storeStrong((id *)&self->_parentContainer, a3);
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (int64_t)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(int64_t)a3
{
  self->_behavior = a3;
}

- (int64_t)cardActions
{
  return self->_cardActions;
}

- (void)setCardActions:(int64_t)a3
{
  self->_cardActions = a3;
}

- (BOOL)hidesSearchableSources
{
  return self->_hidesSearchableSources;
}

- (void)setHidesSearchableSources:(BOOL)a3
{
  self->_hidesSearchableSources = a3;
}

- (BOOL)onlyRealContacts
{
  return self->_onlyRealContacts;
}

- (void)setOnlyRealContacts:(BOOL)a3
{
  self->_onlyRealContacts = a3;
}

- (BOOL)ignoresParentalRestrictions
{
  return self->_ignoresParentalRestrictions;
}

- (void)setIgnoresParentalRestrictions:(BOOL)a3
{
  self->_ignoresParentalRestrictions = a3;
}

- (NSArray)prohibitedPropertyKeys
{
  return self->_prohibitedPropertyKeys;
}

- (void)setProhibitedPropertyKeys:(id)a3
{
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, a3);
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
}

- (BOOL)allowsCancel
{
  return self->_allowsCancel;
}

- (void)setAllowsCancel:(BOOL)a3
{
  self->_allowsCancel = a3;
}

- (BOOL)allowsDone
{
  return self->_allowsDone;
}

- (void)setAllowsDone:(BOOL)a3
{
  self->_allowsDone = a3;
}

- (BOOL)allowsDeletion
{
  return self->_allowsDeletion;
}

- (void)setAllowsDeletion:(BOOL)a3
{
  self->_allowsDeletion = a3;
}

- (BOOL)shouldAllowSearchForMultiSelect
{
  return self->_shouldAllowSearchForMultiSelect;
}

- (void)setShouldAllowSearchForMultiSelect:(BOOL)a3
{
  self->_shouldAllowSearchForMultiSelect = a3;
}

- (BOOL)allowsNamePicking
{
  return self->_allowsNamePicking;
}

- (void)setAllowsNamePicking:(BOOL)a3
{
  self->_allowsNamePicking = a3;
}

- (NSSet)limitedAccessContactSelection
{
  return self->_limitedAccessContactSelection;
}

- (void)setLimitedAccessContactSelection:(id)a3
{
  objc_storeStrong((id *)&self->_limitedAccessContactSelection, a3);
}

- (int)limitedAccessPickerType
{
  return self->_limitedAccessPickerType;
}

- (void)setLimitedAccessPickerType:(int)a3
{
  self->_limitedAccessPickerType = a3;
}

- (NSString)limitedAccessAppName
{
  return self->_limitedAccessAppName;
}

- (void)setLimitedAccessAppName:(id)a3
{
  objc_storeStrong((id *)&self->_limitedAccessAppName, a3);
}

- (NSString)limitedAccessAppBundleId
{
  return self->_limitedAccessAppBundleId;
}

- (void)setLimitedAccessAppBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_limitedAccessAppBundleId, a3);
}

- (BOOL)hasPickerPrivacyUI
{
  return self->_hasPickerPrivacyUI;
}

- (void)setHasPickerPrivacyUI:(BOOL)a3
{
  self->_hasPickerPrivacyUI = a3;
}

- (NSString)limitedAccessSearchQuery
{
  return self->_limitedAccessSearchQuery;
}

- (void)setLimitedAccessSearchQuery:(id)a3
{
  objc_storeStrong((id *)&self->_limitedAccessSearchQuery, a3);
}

- (unint64_t)limitedAccessCaption
{
  return self->_limitedAccessCaption;
}

- (void)setLimitedAccessCaption:(unint64_t)a3
{
  self->_limitedAccessCaption = a3;
}

- (BOOL)shouldDisplayAddNewContactRow
{
  return self->_shouldDisplayAddNewContactRow;
}

- (void)setShouldDisplayAddNewContactRow:(BOOL)a3
{
  self->_shouldDisplayAddNewContactRow = a3;
}

- (NSString)targetGroupIdentifier
{
  return self->_targetGroupIdentifier;
}

- (void)setTargetGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1144);
}

- (NSString)prompt
{
  return self->_prompt;
}

- (void)setPrompt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1152);
}

- (BOOL)hidesPromptInLandscape
{
  return self->_hidesPromptInLandscape;
}

- (void)setHidesPromptInLandscape:(BOOL)a3
{
  self->_hidesPromptInLandscape = a3;
}

- (NSString)bannerTitle
{
  return self->_bannerTitle;
}

- (void)setBannerTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1160);
}

- (NSString)bannerValue
{
  return self->_bannerValue;
}

- (void)setBannerValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1168);
}

- (BOOL)shouldDisplaySuggestionsController
{
  return self->_shouldDisplaySuggestionsController;
}

- (void)setShouldDisplaySuggestionsController:(BOOL)a3
{
  self->_shouldDisplaySuggestionsController = a3;
}

- (NSArray)suggestionsIgnoredContactIdentifiers
{
  return self->_suggestionsIgnoredContactIdentifiers;
}

- (void)setSuggestionsIgnoredContactIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsIgnoredContactIdentifiers, a3);
}

- (NSArray)suggestionsInteractionDomains
{
  return self->_suggestionsInteractionDomains;
}

- (void)setSuggestionsInteractionDomains:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsInteractionDomains, a3);
}

- (NSArray)contactSuggestions
{
  return self->_contactSuggestions;
}

- (void)setContactSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_contactSuggestions, a3);
}

- (BOOL)isDefaultViewControllerVisible
{
  return self->_defaultViewControllerVisible;
}

- (BOOL)autocloses
{
  return self->_autocloses;
}

- (void)setAutocloses:(BOOL)a3
{
  self->_autocloses = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactSuggestions, 0);
  objc_storeStrong((id *)&self->_suggestionsInteractionDomains, 0);
  objc_storeStrong((id *)&self->_suggestionsIgnoredContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_bannerValue, 0);
  objc_storeStrong((id *)&self->_bannerTitle, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_targetGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_limitedAccessSearchQuery, 0);
  objc_storeStrong((id *)&self->_limitedAccessAppBundleId, 0);
  objc_storeStrong((id *)&self->_limitedAccessAppName, 0);
  objc_storeStrong((id *)&self->_limitedAccessContactSelection, 0);
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, 0);
  objc_storeStrong((id *)&self->_parentContainer, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_regulatoryLogger, 0);
  objc_storeStrong((id *)&self->_scrollContact, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_predicateForSelectionOfProperty, 0);
  objc_storeStrong((id *)&self->_predicateForSelectionOfContact, 0);
  objc_storeStrong((id *)&self->_predicateForEnablingContact, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayedPropertyKeys, 0);
}

id __68__CNContactPickerViewController__emitPickerAnalyticsDidSelectItems___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("didSelectItems");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v11[1] = CFSTR("outOfProcess");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "_shouldBeOutOfProcess"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  v11[2] = CFSTR("callerBundleID");
  objc_msgSend(*(id *)(a1 + 32), "nibBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("Unknown");
  if (v5)
    v7 = (const __CFString *)v5;
  v12[2] = v7;
  v11[3] = CFSTR("entityIsAuthorized");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) == 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __55__CNContactPickerViewController__prepareViewController__block_invoke_58(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_setViewController:", v3);

}

uint64_t __55__CNContactPickerViewController__prepareViewController__block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFString *v8;

  v8 = CFSTR("NO");
  if (a2)
    v8 = CFSTR("YES");
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerViewController.m", 278, 3, CFSTR("Contact picker delayed appearance timed out - %@"), a5, a6, a7, a8, (uint64_t)v8);
  return 1;
}

void __53__CNContactPickerViewController__setupViewController__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__CNContactPickerViewController__setupViewController__block_invoke_2;
  v5[3] = &unk_1E2050400;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __53__CNContactPickerViewController__setupViewController__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_pickerPresentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_endDelayingPresentation");

  objc_msgSend(*(id *)(a1 + 32), "cnui_appropriatePresentationController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(v8, "setDelegate:", *(_QWORD *)(a1 + 32));
  if (*(_QWORD *)(a1 + 40))
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerViewController.m", 263, 3, CFSTR("Error when showing picker: %@"), v4, v5, v6, v7, *(_QWORD *)(a1 + 40));

}

void __50__CNContactPickerViewController_viewDidDisappear___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("PeoplePickerDidHide"), 0, 0, 1);

}

void __47__CNContactPickerViewController_viewDidAppear___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("PeoplePickerDidShow"), 0, 0, 1);

}

+ (id)descriptorForRequiredKeysForSuggestions
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
