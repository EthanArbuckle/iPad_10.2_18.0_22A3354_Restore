@implementation AFUIAutoFillCreditCardController

- (AFUIAutoFillCreditCardController)initWithDocumentTraits:(id)a3 documentState:(id)a4 presentingViewController:(id)a5 textOperationsHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AFUIAutoFillCreditCardController *v15;
  AFUIAutoFillCreditCardController *v16;
  uint64_t v17;
  id performTextOperations;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AFUIAutoFillCreditCardController;
  v15 = -[AFUIAutoFillCreditCardController init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_documentState, a4);
    objc_storeStrong((id *)&v16->_documentTraits, a3);
    v17 = MEMORY[0x23B803E10](v14);
    performTextOperations = v16->_performTextOperations;
    v16->_performTextOperations = (id)v17;

    objc_storeWeak((id *)&v16->_presentingViewController, v13);
  }

  return v16;
}

- (double)_maximumSuggestionsForReturnedSuggestions:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double result;

  -[AFUIAutoFillCreditCardController presentingViewController](self, "presentingViewController");
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
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BE0B3B8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIAutoFillCreditCardController documentState](self, "documentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contextBeforeInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[AFUIAutoFillCreditCardController documentTraits](self, "documentTraits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __57__AFUIAutoFillCreditCardController__generateSuggestions___block_invoke;
  v11[3] = &unk_250856EF8;
  v10 = v4;
  v12 = v10;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v5, "generateAutoFillSuggestionsWithAutoFillMode:textPrefix:documentTraits:completionHandler:", 9, v8, v9, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __57__AFUIAutoFillCreditCardController__generateSuggestions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id *v3;
  id v4;
  void *v5;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_menuIElementsForSuggestions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);
}

- (id)_menuIElementsForSuggestions:(id)a3
{
  double v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
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
  void *v35;
  id v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id location;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v36 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[AFUIAutoFillCreditCardController setHasSuggestions:](self, "setHasSuggestions:", 0);
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("creditcard"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIAutoFillCreditCardController _maximumSuggestionsForReturnedSuggestions:](self, "_maximumSuggestionsForReturnedSuggestions:", (double)(unint64_t)objc_msgSend(v36, "count"));
  v4 = v3;
  if (v3 > 0.0)
  {
    v5 = 0;
    do
    {
      objc_msgSend(v36, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "creditCardPayload");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "mutableCopy");

      objc_msgSend(v8, "objectForKey:", CFSTR("cc-exp"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        +[AFUIAutoFillCreditCardController dateStringTextContentType:date:placeholderHint:](AFUIAutoFillCreditCardController, "dateStringTextContentType:date:placeholderHint:", CFSTR("cc-exp"), v9, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("cc-exp"));

        +[AFUIAutoFillCreditCardController dateStringTextContentType:date:placeholderHint:](AFUIAutoFillCreditCardController, "dateStringTextContentType:date:placeholderHint:", CFSTR("cc-exp-month"), v9, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("cc-exp-month"));

        +[AFUIAutoFillCreditCardController dateStringTextContentType:date:placeholderHint:](AFUIAutoFillCreditCardController, "dateStringTextContentType:date:placeholderHint:", CFSTR("cc-exp-year"), v9, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v12, CFSTR("cc-exp-year"));

      }
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Ending in "), &stru_250857310, CFSTR("Localizable"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "subTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingString:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_alloc(MEMORY[0x24BE0B3B0]);
      objc_msgSend(v6, "title");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "subTitle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v17, "initWithTitle:subTitle:creditCardPayload:customInfoType:", v18, v19, v8, objc_msgSend(v6, "customInfoType"));

      v21 = (void *)MEMORY[0x24BEBD388];
      v40[0] = MEMORY[0x24BDAC760];
      v40[1] = 3221225472;
      v40[2] = __65__AFUIAutoFillCreditCardController__menuIElementsForSuggestions___block_invoke;
      v40[3] = &unk_250856780;
      objc_copyWeak(&v42, &location);
      v22 = v20;
      v41 = v22;
      objc_msgSend(v21, "actionWithHandler:", v40);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "title");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setTitle:", v24);

      objc_msgSend(v23, "setSubtitle:", v16);
      objc_msgSend(v23, "setImage:", v35);
      objc_msgSend(v37, "addObject:", v23);

      objc_destroyWeak(&v42);
      ++v5;
    }
    while (v4 > (double)(int)v5);
  }
  -[AFUIAutoFillCreditCardController setHasSuggestions:](self, "setHasSuggestions:", v4 > 0.0);
  v25 = (void *)MEMORY[0x24BEBD388];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __65__AFUIAutoFillCreditCardController__menuIElementsForSuggestions___block_invoke_2;
  v38[3] = &unk_2508567A8;
  objc_copyWeak(&v39, &location);
  objc_msgSend(v25, "actionWithHandler:", v38);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Manage Cards…"), &stru_250857310, CFSTR("Localizable"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTitle:", v28);

  v29 = (void *)MEMORY[0x24BEBD748];
  v44[0] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "menuWithTitle:image:identifier:options:children:", &stru_250857310, 0, 0, 1, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "addObject:", v31);
  objc_msgSend(MEMORY[0x24BEBD748], "menuWithChildren:", v37);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);

  return v32;
}

void __65__AFUIAutoFillCreditCardController__menuIElementsForSuggestions___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_performTextOperationsWithSuggestion:", *(_QWORD *)(a1 + 32));

}

void __65__AFUIAutoFillCreditCardController__menuIElementsForSuggestions___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_openSettings");

}

+ (id)dateStringTextContentType:(id)a3 date:(id)a4 placeholderHint:(id)a5
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x24BDBCE48];
  v8 = a4;
  v9 = [v7 alloc];
  v10 = (void *)objc_msgSend(v9, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(v10, "components:fromDate:", 12, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToString:", CFSTR("cc-exp")))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02ld/%02ld"), objc_msgSend(v11, "month"), objc_msgSend(v11, "year"));
  }
  else
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("cc-exp-month")))
    {
      v12 = (void *)MEMORY[0x24BDD17C8];
      v13 = objc_msgSend(v11, "month");
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("cc-exp-year")))
      {
        v14 = 0;
        goto LABEL_9;
      }
      v12 = (void *)MEMORY[0x24BDD17C8];
      v13 = objc_msgSend(v11, "year");
    }
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%02ld"), v13, v16);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v14;
}

- (void)_performTextOperationsWithSuggestion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  RTIDocumentTraits *v8;
  void *v9;
  id v10;
  RTIDocumentTraits *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  RTIDocumentTraits *v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __73__AFUIAutoFillCreditCardController__performTextOperationsWithSuggestion___block_invoke;
  v17[3] = &unk_250856870;
  v17[4] = self;
  v6 = v4;
  v18 = v6;
  v7 = (void *)MEMORY[0x23B803E10](v17);
  v8 = self->_documentTraits;
  -[AFUIAutoFillCreditCardController modalUIDelegate](self, "modalUIDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __73__AFUIAutoFillCreditCardController__performTextOperationsWithSuggestion___block_invoke_3;
  v13[3] = &unk_250856898;
  v14 = v6;
  v15 = v8;
  v16 = v7;
  v10 = v7;
  v11 = v8;
  v12 = v6;
  objc_msgSend(v9, "authenticationWillBeginForSessionUUID:completion:", 0, v13);

}

void __73__AFUIAutoFillCreditCardController__performTextOperationsWithSuggestion___block_invoke(uint64_t a1, char a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  char v10;

  objc_msgSend(*(id *)(a1 + 32), "modalUIDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__AFUIAutoFillCreditCardController__performTextOperationsWithSuggestion___block_invoke_2;
  v7[3] = &unk_250856848;
  v10 = a2;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v4, "authenticationDidEndForSessionUUID:completion:", 0, v7);

}

void __73__AFUIAutoFillCreditCardController__performTextOperationsWithSuggestion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  id v15;

  if (*(_BYTE *)(a1 + 48))
  {
    v15 = objc_alloc_init(MEMORY[0x24BE7ED90]);
    objc_msgSend(*(id *)(a1 + 32), "creditCardPayload");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v2, "mutableCopy");
    objc_msgSend(v15, "keyboardOutput");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCustomInfo:", v3);

    objc_msgSend(*(id *)(a1 + 32), "creditCardPayload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "documentTraits");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textInputTraits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textContentType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "creditCardPayload");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BE0B2F8]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(*(id *)(a1 + 40), "documentTraits");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_assertOrInsertText:documentTraits:", v9, v11);

    objc_msgSend(v15, "keyboardOutput");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "customInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v9, *MEMORY[0x24BE0B358]);

    objc_msgSend(*(id *)(a1 + 40), "performTextOperations");
    v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v14)[2](v14, v15);

  }
}

void __73__AFUIAutoFillCreditCardController__performTextOperationsWithSuggestion___block_invoke_3(_QWORD *a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE0B3B8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  objc_msgSend(MEMORY[0x24BE0B3B8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1[4];
  v6 = v4;
  if ((v3 & 1) != 0)
    objc_msgSend(v4, "authenticateIfNecessaryForSuggestion:documentTraits:completionHandler:", v5, a1[5], a1[6]);
  else
    objc_msgSend(v4, "shouldAcceptSuggestion:completionHandler:", v5, a1[6]);

}

- (void)_openSettings
{
  void *v2;
  id v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v2 = (void *)getSFSafariCreditCardStoreClass_softClass;
  v8 = getSFSafariCreditCardStoreClass_softClass;
  if (!getSFSafariCreditCardStoreClass_softClass)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __getSFSafariCreditCardStoreClass_block_invoke;
    v4[3] = &unk_250856CE0;
    v4[4] = &v5;
    __getSFSafariCreditCardStoreClass_block_invoke((uint64_t)v4);
    v2 = (void *)v6[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v5, 8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "showCreditCardSettings");
}

- (AFUIModalUIDelegate)modalUIDelegate
{
  return (AFUIModalUIDelegate *)objc_loadWeakRetained((id *)&self->modalUIDelegate);
}

- (void)setModalUIDelegate:(id)a3
{
  objc_storeWeak((id *)&self->modalUIDelegate, a3);
}

- (RTIDocumentState)documentState
{
  return self->_documentState;
}

- (void)setDocumentState:(id)a3
{
  objc_storeStrong((id *)&self->_documentState, a3);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
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
  objc_storeStrong(&self->_performTextOperations, 0);
  objc_storeStrong((id *)&self->_documentTraits, 0);
  objc_storeStrong((id *)&self->_documentState, 0);
  objc_destroyWeak((id *)&self->modalUIDelegate);
}

@end
