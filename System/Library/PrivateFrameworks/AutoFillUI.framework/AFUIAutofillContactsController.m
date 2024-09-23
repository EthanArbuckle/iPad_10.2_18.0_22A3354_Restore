@implementation AFUIAutofillContactsController

- (AFUIAutofillContactsController)initWithDocumentTraits:(id)a3 presentingViewController:(id)a4 textOperationsHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  AFUIAutofillContactsController *v12;
  AFUIAutofillContactsController *v13;
  uint64_t v14;
  id performTextOperations;
  AFUIContactsController *v16;
  AFUIContactsController *contactsController;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AFUIAutofillContactsController;
  v12 = -[AFUIAutofillContactsController init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_documentTraits, a3);
    v14 = MEMORY[0x23B803E10](v11);
    performTextOperations = v13->_performTextOperations;
    v13->_performTextOperations = (id)v14;

    v16 = objc_alloc_init(AFUIContactsController);
    contactsController = v13->_contactsController;
    v13->_contactsController = v16;

    -[AFUIContactsController setContactPropertyPickerDelegate:](v13->_contactsController, "setContactPropertyPickerDelegate:", v13);
    objc_storeWeak((id *)&v13->_presentingViewController, v10);
  }

  return v13;
}

- (BOOL)isSingleLineDocument
{
  return -[RTIDocumentTraits _afui_isSingleLineDocument](self->_documentTraits, "_afui_isSingleLineDocument");
}

- (void)userSelectedContactProperties:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  id v12;

  v12 = a3;
  -[RTIDocumentTraits textInputTraits](self->_documentTraits, "textInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textContentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BE0B358]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = objc_alloc_init(MEMORY[0x24BE7ED90]);
  objc_msgSend(v7, "_assertOrInsertText:documentTraits:", v6, self->_documentTraits);
  v8 = (void *)objc_msgSend(v12, "mutableCopy");
  objc_msgSend(v7, "keyboardOutput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCustomInfo:", v8);

  -[AFUIAutofillContactsController performTextOperations](self, "performTextOperations");
  v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v10)[2](v10, v7);

  -[AFUIAutofillContactsController modalUIDelegate](self, "modalUIDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contactsUIDidEndForSessionUUID:completion:", 0, 0);

}

- (void)contactPickerDidCancel
{
  id v2;

  -[AFUIAutofillContactsController modalUIDelegate](self, "modalUIDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactsUIDidEndForSessionUUID:completion:", 0, 0);

}

- (double)_maximumSuggestionsForReturnedSuggestions:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double result;

  -[AFUIAutofillContactsController presentingViewController](self, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v7, "interfaceOrientation") - 3) >= 2)
    v8 = 3.0;
  else
    v8 = 1.0;

  if (AFUICanDisplayAllSuggestions())
    result = 3.0;
  else
    result = v8;
  if (result >= a3)
    return a3;
  return result;
}

- (void)_generateSuggestions:(id)a3
{
  void *v4;
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x24BDBCEB8];
  v5 = (void (**)(id, void *))a3;
  objc_msgSend(v4, "array");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[AFUIAutofillContactsController _addCustomInfoActions:](self, "_addCustomInfoActions:");
  if (_os_feature_enabled_impl())
  {
    -[AFUIAutofillContactsController _meAction](self, "_meAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v6);

  }
  -[AFUIAutofillContactsController setHasSuggestions:](self, "setHasSuggestions:", objc_msgSend(v9, "count") != 0);
  -[AFUIAutofillContactsController _chooseOtherMenu](self, "_chooseOtherMenu");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v7);

  objc_msgSend(MEMORY[0x24BEBD748], "menuWithChildren:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v8);

}

- (void)_addCustomInfoActions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
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
  AFUIAutofillContactsController *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id location;

  v39 = a3;
  -[AFUIAutofillContactsController contactsController](self, "contactsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIAutofillContactsController documentTraits](self, "documentTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textInputTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textContentType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "meContactInfosForTextContentType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = v8;
  -[AFUIAutofillContactsController _maximumSuggestionsForReturnedSuggestions:](self, "_maximumSuggestionsForReturnedSuggestions:", (double)(unint64_t)objc_msgSend(v8, "count"));
  if (v9 > 0.0)
  {
    v10 = v9;
    v11 = 0;
    while (1)
    {
      objc_msgSend(v40, "objectAtIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFUIAutofillContactsController documentTraits](self, "documentTraits");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "textInputTraits");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "textContentType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "propertyForTextContentType:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v16, "length"))
      {
        objc_initWeak(&location, self);
        v17 = (void *)MEMORY[0x24BEBD388];
        v45[0] = MEMORY[0x24BDAC760];
        v45[1] = 3221225472;
        v45[2] = __56__AFUIAutofillContactsController__addCustomInfoActions___block_invoke;
        v45[3] = &unk_250856780;
        objc_copyWeak(&v47, &location);
        v18 = v12;
        v46 = v18;
        objc_msgSend(v17, "actionWithHandler:", v45);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "titleText");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setTitle:", v20);

        -[AFUIAutofillContactsController documentTraits](self, "documentTraits");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "autofillContext");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "subtitleTextForAutoFillContext:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setSubtitle:", v23);

        v24 = (void *)MEMORY[0x24BEBD640];
        objc_msgSend(v18, "label");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[AFUIContactInfo symbolNameForLabel:](AFUIContactInfo, "symbolNameForLabel:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "systemImageNamed:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setImage:", v27);

        objc_msgSend(v39, "addObject:", v19);
        objc_destroyWeak(&v47);
        objc_destroyWeak(&location);
      }
      -[AFUIAutofillContactsController documentTraits](self, "documentTraits");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "textInputTraits");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "textContentType");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if ((AFTextContentTypeIsInNameSet(v30) & 1) != 0)
        break;
      -[AFUIAutofillContactsController documentTraits](self, "documentTraits");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "textInputTraits");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "textContentType");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if ((AFTextContentTypeIsInBirthdaySet(v33) & 1) != 0)
      {

        break;
      }
      -[AFUIAutofillContactsController documentTraits](self, "documentTraits");
      v44 = v16;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "textInputTraits");
      v43 = v12;
      v35 = self;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "textContentType");
      v41 = v28;
      v37 = v11;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = AFTextContentTypeIsInJobSet(v38);

      self = v35;
      if ((v42 & 1) == 0)
      {
        v11 = v37 + 1;
        if (v10 > (double)((int)v37 + 1))
          continue;
      }
      goto LABEL_12;
    }

  }
LABEL_12:

}

void __56__AFUIAutofillContactsController__addCustomInfoActions___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "customInfoFromContactInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_performCustomInfoTextOperations:", v2);

}

- (id)_meAction
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
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x24BEBD388];
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __43__AFUIAutofillContactsController__meAction__block_invoke;
  v16 = &unk_2508567A8;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v3, "actionWithHandler:", &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIAutofillContactsController contactsController](self, "contactsController", v13, v14, v15, v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIAutofillContactsController documentTraits](self, "documentTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textInputTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textContentType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "meContactInfosForTextContentType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nameString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v11);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  return v4;
}

void __43__AFUIAutofillContactsController__meAction__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_presentCustomizeUI");

}

- (id)_chooseOtherMenu
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x24BEBD388];
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __50__AFUIAutofillContactsController__chooseOtherMenu__block_invoke;
  v13 = &unk_2508567A8;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v2, "actionWithHandler:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class(), v10, v11, v12, v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Choose Other…"), &stru_250857310, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  v6 = (void *)MEMORY[0x24BEBD748];
  v16[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "menuWithTitle:image:identifier:options:children:", &stru_250857310, 0, 0, 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v8;
}

void __50__AFUIAutofillContactsController__chooseOtherMenu__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_presentContactPicker");

}

- (void)_performCustomInfoTextOperations:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  id v12;

  v4 = (objc_class *)MEMORY[0x24BE7ED90];
  v5 = a3;
  v12 = objc_alloc_init(v4);
  -[AFUIAutofillContactsController documentTraits](self, "documentTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textInputTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textContentType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "_assertOrInsertText:documentTraits:", v9, self->_documentTraits);
  objc_msgSend(v12, "keyboardOutput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCustomInfo:", v5);

  -[AFUIAutofillContactsController performTextOperations](self, "performTextOperations");
  v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v11)[2](v11, v12);

}

- (void)_presentContactPicker
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  -[AFUIAutofillContactsController documentTraits](self, "documentTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textContentType");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  v5 = AFTextContentTypeIsInNameSet((void *)v16[5]);
  v6 = MEMORY[0x24BDAC760];
  if (v5)
  {
    -[AFUIAutofillContactsController documentTraits](self, "documentTraits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "autofillContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __55__AFUIAutofillContactsController__presentContactPicker__block_invoke;
    v14[3] = &unk_250856970;
    v14[4] = &v15;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v14);

  }
  -[AFUIAutofillContactsController modalUIDelegate](self, "modalUIDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AFUIAutofillContactsController modalUIDelegate](self, "modalUIDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __55__AFUIAutofillContactsController__presentContactPicker__block_invoke_2;
    v13[3] = &unk_2508569B8;
    v13[4] = self;
    v13[5] = &v15;
    objc_msgSend(v10, "contactsUIWillBeginForSessionUUID:completion:", 0, v13);
  }
  else
  {
    -[AFUIAutofillContactsController presentingViewController](self, "presentingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUIAutofillContactsController contactsController](self, "contactsController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allContactsViewControllerForTextContentType:", v16[5]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentViewController:animated:completion:", v12, 1, &__block_literal_global_19);

  }
  _Block_object_dispose(&v15, 8);

}

void __55__AFUIAutofillContactsController__presentContactPicker__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  if ((AFTextContentTypeIsInNameSet(v10) & 1) == 0)
  {
    if ((AFTextContentTypeIsInContactSet(v10) & 1) != 0)
    {
      v6 = (id *)MEMORY[0x24BE0B310];
LABEL_6:
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = *v6;
      v9 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v8;

      *a4 = 1;
      goto LABEL_7;
    }
    if (AFTextContentTypeIsInPhoneSet(v10))
    {
      v6 = (id *)MEMORY[0x24BE0B398];
      goto LABEL_6;
    }
  }
LABEL_7:

}

void __55__AFUIAutofillContactsController__presentContactPicker__block_invoke_2(uint64_t a1)
{
  _QWORD v1[4];
  __int128 v2;

  v1[0] = MEMORY[0x24BDAC760];
  v1[1] = 3221225472;
  v1[2] = __55__AFUIAutofillContactsController__presentContactPicker__block_invoke_3;
  v1[3] = &unk_2508569B8;
  v2 = *(_OWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v1);
}

void __55__AFUIAutofillContactsController__presentContactPicker__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contactsController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allContactsViewControllerForTextContentType:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentViewController:animated:completion:", v3, 1, &__block_literal_global_2);

}

- (void)_presentCustomizeUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[AFUIAutofillContactsController presentingViewController](self, "presentingViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[AFUIAutofillContactsController contactsController](self, "contactsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIAutofillContactsController documentTraits](self, "documentTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textInputTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textContentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "meCardViewControllerForTextContentType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentViewController:animated:completion:", v7, 1, &__block_literal_global_20);

}

- (AFUIModalUIDelegate)modalUIDelegate
{
  return (AFUIModalUIDelegate *)objc_loadWeakRetained((id *)&self->modalUIDelegate);
}

- (void)setModalUIDelegate:(id)a3
{
  objc_storeWeak((id *)&self->modalUIDelegate, a3);
}

- (RTIDocumentTraits)documentTraits
{
  return self->_documentTraits;
}

- (void)setDocumentTraits:(id)a3
{
  objc_storeStrong((id *)&self->_documentTraits, a3);
}

- (id)performTextOperations
{
  return self->_performTextOperations;
}

- (void)setPerformTextOperations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (AFUIContactsController)contactsController
{
  return self->_contactsController;
}

- (void)setContactsController:(id)a3
{
  objc_storeStrong((id *)&self->_contactsController, a3);
}

- (BOOL)hasSuggestions
{
  return self->_hasSuggestions;
}

- (void)setHasSuggestions:(BOOL)a3
{
  self->_hasSuggestions = a3;
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_contactsController, 0);
  objc_storeStrong(&self->_performTextOperations, 0);
  objc_storeStrong((id *)&self->_documentTraits, 0);
  objc_destroyWeak((id *)&self->modalUIDelegate);
}

@end
