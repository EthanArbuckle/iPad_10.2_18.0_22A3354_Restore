@implementation ICAccessibilityCustomRotorController

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__ICAccessibilityCustomRotorController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance___sharedInstance;
}

void __54__ICAccessibilityCustomRotorController_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v1;

}

- (UIAccessibilityCustomRotor)linksRotor
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  -[ICAccessibilityCustomRotorController storedLinksRotor](self, "storedLinksRotor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc(MEMORY[0x1E0DC33F8]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Links"), &stru_1EA7E9860, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __50__ICAccessibilityCustomRotorController_linksRotor__block_invoke;
    v11 = &unk_1EA7E01B8;
    objc_copyWeak(&v12, &location);
    v3 = (void *)objc_msgSend(v4, "initWithName:itemSearchBlock:", v6, &v8);

    -[ICAccessibilityCustomRotorController setStoredLinksRotor:](self, "setStoredLinksRotor:", v3, v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return (UIAccessibilityCustomRotor *)v3;
}

id __50__ICAccessibilityCustomRotorController_linksRotor__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "searchForAXElementWithPredicate:rotorType:", v3, CFSTR("ICAccessibilityRotorTypeLinks"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIAccessibilityCustomRotor)checklistRotor
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  -[ICAccessibilityCustomRotorController storedChecklistRotor](self, "storedChecklistRotor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc(MEMORY[0x1E0DC33F8]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Checklist items"), &stru_1EA7E9860, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __54__ICAccessibilityCustomRotorController_checklistRotor__block_invoke;
    v11 = &unk_1EA7E01B8;
    objc_copyWeak(&v12, &location);
    v3 = (void *)objc_msgSend(v4, "initWithName:itemSearchBlock:", v6, &v8);

    -[ICAccessibilityCustomRotorController setStoredChecklistRotor:](self, "setStoredChecklistRotor:", v3, v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return (UIAccessibilityCustomRotor *)v3;
}

id __54__ICAccessibilityCustomRotorController_checklistRotor__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "searchForAXElementWithPredicate:rotorType:", v3, CFSTR("ICAccessibilityRotorTypeChecklist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIAccessibilityCustomRotor)attachmentsRotor
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  -[ICAccessibilityCustomRotorController storedAttachmentsRotor](self, "storedAttachmentsRotor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc(MEMORY[0x1E0DC33F8]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Attachments"), &stru_1EA7E9860, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __56__ICAccessibilityCustomRotorController_attachmentsRotor__block_invoke;
    v11 = &unk_1EA7E01B8;
    objc_copyWeak(&v12, &location);
    v3 = (void *)objc_msgSend(v4, "initWithName:itemSearchBlock:", v6, &v8);

    -[ICAccessibilityCustomRotorController setStoredAttachmentsRotor:](self, "setStoredAttachmentsRotor:", v3, v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return (UIAccessibilityCustomRotor *)v3;
}

id __56__ICAccessibilityCustomRotorController_attachmentsRotor__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "searchForAXElementWithPredicate:rotorType:", v3, CFSTR("ICAccessibilityRotorTypeAttachments"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIAccessibilityCustomRotor)tagsRotor
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  -[ICAccessibilityCustomRotorController storedTagsRotor](self, "storedTagsRotor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc(MEMORY[0x1E0DC33F8]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Tags"), &stru_1EA7E9860, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __49__ICAccessibilityCustomRotorController_tagsRotor__block_invoke;
    v11 = &unk_1EA7E01B8;
    objc_copyWeak(&v12, &location);
    v3 = (void *)objc_msgSend(v4, "initWithName:itemSearchBlock:", v6, &v8);

    -[ICAccessibilityCustomRotorController setStoredTagsRotor:](self, "setStoredTagsRotor:", v3, v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return (UIAccessibilityCustomRotor *)v3;
}

id __49__ICAccessibilityCustomRotorController_tagsRotor__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "searchForAXElementWithPredicate:rotorType:", v3, CFSTR("ICAccessibilityRotorTypeTags"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIAccessibilityCustomRotor)mentionsRotor
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  -[ICAccessibilityCustomRotorController storedMentionsRotor](self, "storedMentionsRotor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc(MEMORY[0x1E0DC33F8]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Mentions"), &stru_1EA7E9860, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __53__ICAccessibilityCustomRotorController_mentionsRotor__block_invoke;
    v11 = &unk_1EA7E01B8;
    objc_copyWeak(&v12, &location);
    v3 = (void *)objc_msgSend(v4, "initWithName:itemSearchBlock:", v6, &v8);

    -[ICAccessibilityCustomRotorController setStoredMentionsRotor:](self, "setStoredMentionsRotor:", v3, v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return (UIAccessibilityCustomRotor *)v3;
}

id __53__ICAccessibilityCustomRotorController_mentionsRotor__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "searchForAXElementWithPredicate:rotorType:", v3, CFSTR("ICAccessibilityRotorTypeMentions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIAccessibilityCustomRotor)tablesRotor
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  -[ICAccessibilityCustomRotorController storedTablesRotor](self, "storedTablesRotor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc(MEMORY[0x1E0DC33F8]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Tables"), &stru_1EA7E9860, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __51__ICAccessibilityCustomRotorController_tablesRotor__block_invoke;
    v11 = &unk_1EA7E01B8;
    objc_copyWeak(&v12, &location);
    v3 = (void *)objc_msgSend(v4, "initWithName:itemSearchBlock:", v6, &v8);

    -[ICAccessibilityCustomRotorController setStoredTablesRotor:](self, "setStoredTablesRotor:", v3, v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return (UIAccessibilityCustomRotor *)v3;
}

id __51__ICAccessibilityCustomRotorController_tablesRotor__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "searchForAXElementWithPredicate:rotorType:", v3, CFSTR("ICAccessibilityRotorTypeTables"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIAccessibilityCustomRotor)calculationResultsRotor
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  -[ICAccessibilityCustomRotorController storedCalculationResultRotor](self, "storedCalculationResultRotor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc(MEMORY[0x1E0DC33F8]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Calculation Results"), &stru_1EA7E9860, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __63__ICAccessibilityCustomRotorController_calculationResultsRotor__block_invoke;
    v11 = &unk_1EA7E01B8;
    objc_copyWeak(&v12, &location);
    v3 = (void *)objc_msgSend(v4, "initWithName:itemSearchBlock:", v6, &v8);

    -[ICAccessibilityCustomRotorController setStoredCalculationResultRotor:](self, "setStoredCalculationResultRotor:", v3, v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return (UIAccessibilityCustomRotor *)v3;
}

id __63__ICAccessibilityCustomRotorController_calculationResultsRotor__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "searchForAXElementWithPredicate:rotorType:", v3, CFSTR("ICAccessibilityRotorTypeCalculationResults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIAccessibilityCustomRotor)calculationErrorsRotor
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  -[ICAccessibilityCustomRotorController storedCalculationErrorsRotor](self, "storedCalculationErrorsRotor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc(MEMORY[0x1E0DC33F8]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Calculation Errors"), &stru_1EA7E9860, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __62__ICAccessibilityCustomRotorController_calculationErrorsRotor__block_invoke;
    v11 = &unk_1EA7E01B8;
    objc_copyWeak(&v12, &location);
    v3 = (void *)objc_msgSend(v4, "initWithName:itemSearchBlock:", v6, &v8);

    -[ICAccessibilityCustomRotorController setStoredCalculationErrorsRotor:](self, "setStoredCalculationErrorsRotor:", v3, v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return (UIAccessibilityCustomRotor *)v3;
}

id __62__ICAccessibilityCustomRotorController_calculationErrorsRotor__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "searchForAXElementWithPredicate:rotorType:", v3, CFSTR("ICAccessibilityRotorTypeCalculationErrors"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)sharedTextViewRotors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccessibilityCustomRotorController noteEditorViewController](self, "noteEditorViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "elementsForAccessibilityRotorType:", CFSTR("ICAccessibilityRotorTypeLinks"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[ICAccessibilityCustomRotorController linksRotor](self, "linksRotor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  objc_msgSend(v5, "elementsForAccessibilityRotorType:", CFSTR("ICAccessibilityRotorTypeChecklist"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    -[ICAccessibilityCustomRotorController checklistRotor](self, "checklistRotor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  objc_msgSend(v5, "elementsForAccessibilityRotorType:", CFSTR("ICAccessibilityRotorTypeAttachments"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    -[ICAccessibilityCustomRotorController attachmentsRotor](self, "attachmentsRotor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

  }
  objc_msgSend(v5, "elementsForAccessibilityRotorType:", CFSTR("ICAccessibilityRotorTypeTags"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    -[ICAccessibilityCustomRotorController tagsRotor](self, "tagsRotor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v17);

  }
  objc_msgSend(v5, "elementsForAccessibilityRotorType:", CFSTR("ICAccessibilityRotorTypeMentions"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    -[ICAccessibilityCustomRotorController mentionsRotor](self, "mentionsRotor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v20);

  }
  objc_msgSend(v5, "elementsForAccessibilityRotorType:", CFSTR("ICAccessibilityRotorTypeTables"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22)
  {
    -[ICAccessibilityCustomRotorController tablesRotor](self, "tablesRotor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v23);

  }
  objc_msgSend(v5, "elementsForAccessibilityRotorType:", CFSTR("ICAccessibilityRotorTypeCalculationResults"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25)
  {
    -[ICAccessibilityCustomRotorController calculationResultsRotor](self, "calculationResultsRotor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v26);

    objc_msgSend(v5, "elementsForAccessibilityRotorType:", CFSTR("ICAccessibilityRotorTypeCalculationErrors"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count");

    if (v28)
    {
      -[ICAccessibilityCustomRotorController calculationErrorsRotor](self, "calculationErrorsRotor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v29);

    }
  }
  v30 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v30;
}

- (id)searchForAXElementWithPredicate:(id)a3 rotorType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  id v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  -[ICAccessibilityCustomRotorController noteEditorViewController](self, "noteEditorViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "currentItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "targetElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAccessibilityCustomRotorController noteEditorViewController](self, "noteEditorViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = v10;
  if (v12 == v14)
  {
    if (objc_msgSend(v10, "isFirstResponder"))
    {
      v16 = objc_msgSend(v10, "selectedRange");
      v18 = v19;
    }
    else
    {
      v16 = 0;
      v18 = 0;
    }
  }
  else
  {
    ICCheckedProtocolCast();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "textRangeInNote");
    v18 = v17;

  }
  v20 = objc_msgSend(v6, "searchDirection");
  -[ICAccessibilityCustomRotorController noteEditorViewController](self, "noteEditorViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "textView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "elementsForAccessibilityRotorType:", v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "sortedArrayUsingComparator:", &__block_literal_global_17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20 == 1)
    v25 = v18;
  else
    v25 = 0;
  v26 = v16 + v25;
  if (v20 == 1)
  {
    v52 = 0uLL;
    v53 = 0uLL;
    v50 = 0uLL;
    v51 = 0uLL;
    v32 = v24;
    v27 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v27)
    {
      v28 = v27;
      v41 = v24;
      v42 = v12;
      v43 = v7;
      v44 = v6;
      v29 = *(_QWORD *)v51;
      while (2)
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v51 != v29)
            objc_enumerationMutation(v32);
          v31 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            if (objc_msgSend(v31, "textRangeInNote") >= v26)
            {
LABEL_35:
              v37 = v31;
              goto LABEL_36;
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAccessibilityCustomRotorController searchForAXElementWithPredicate:rotorType:]", 1, 0, CFSTR("%@ does not respond to 'textRangeInNote'"), v31);
          }
        }
        v28 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        if (v28)
          continue;
        goto LABEL_34;
      }
    }
LABEL_37:
    v37 = 0;
    v38 = v45;
    goto LABEL_38;
  }
  v48 = 0uLL;
  v49 = 0uLL;
  v46 = 0uLL;
  v47 = 0uLL;
  objc_msgSend(v24, "reverseObjectEnumerator");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (!v33)
    goto LABEL_37;
  v34 = v33;
  v41 = v24;
  v42 = v12;
  v43 = v7;
  v44 = v6;
  v35 = *(_QWORD *)v47;
  do
  {
    for (j = 0; j != v34; ++j)
    {
      if (*(_QWORD *)v47 != v35)
        objc_enumerationMutation(v32);
      v31 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if (objc_msgSend(v31, "textRangeInNote") < v26)
          goto LABEL_35;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAccessibilityCustomRotorController searchForAXElementWithPredicate:rotorType:]", 1, 0, CFSTR("%@ does not respond to 'textRangeInNote'"), v31);
      }
    }
    v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  }
  while (v34);
LABEL_34:
  v37 = 0;
LABEL_36:
  v7 = v43;
  v6 = v44;
  v38 = v45;
  v24 = v41;
  v12 = v42;
LABEL_38:

  if (v37)
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3400]), "initWithTargetElement:targetRange:", v37, 0);
  else
    v39 = 0;

  return v39;
}

uint64_t __82__ICAccessibilityCustomRotorController_searchForAXElementWithPredicate_rotorType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "textRangeInNote");
  if (v6 >= objc_msgSend(v5, "textRangeInNote"))
  {
    v8 = objc_msgSend(v4, "textRangeInNote");
    if (v8 <= objc_msgSend(v5, "textRangeInNote"))
    {
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAccessibilityCustomRotorController searchForAXElementWithPredicate:rotorType:]_block_invoke", 1, 0, CFSTR("We really should never have two rotor search elements at the same text position"));
      v7 = 0;
    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (ICNoteEditorViewController)noteEditorViewController
{
  return (ICNoteEditorViewController *)objc_loadWeakRetained((id *)&self->_noteEditorViewController);
}

- (void)setNoteEditorViewController:(id)a3
{
  objc_storeWeak((id *)&self->_noteEditorViewController, a3);
}

- (UIAccessibilityCustomRotor)storedLinksRotor
{
  return self->_storedLinksRotor;
}

- (void)setStoredLinksRotor:(id)a3
{
  objc_storeStrong((id *)&self->_storedLinksRotor, a3);
}

- (UIAccessibilityCustomRotor)storedChecklistRotor
{
  return self->_storedChecklistRotor;
}

- (void)setStoredChecklistRotor:(id)a3
{
  objc_storeStrong((id *)&self->_storedChecklistRotor, a3);
}

- (UIAccessibilityCustomRotor)storedAttachmentsRotor
{
  return self->_storedAttachmentsRotor;
}

- (void)setStoredAttachmentsRotor:(id)a3
{
  objc_storeStrong((id *)&self->_storedAttachmentsRotor, a3);
}

- (UIAccessibilityCustomRotor)storedTablesRotor
{
  return self->_storedTablesRotor;
}

- (void)setStoredTablesRotor:(id)a3
{
  objc_storeStrong((id *)&self->_storedTablesRotor, a3);
}

- (UIAccessibilityCustomRotor)storedTagsRotor
{
  return self->_storedTagsRotor;
}

- (void)setStoredTagsRotor:(id)a3
{
  objc_storeStrong((id *)&self->_storedTagsRotor, a3);
}

- (UIAccessibilityCustomRotor)storedMentionsRotor
{
  return self->_storedMentionsRotor;
}

- (void)setStoredMentionsRotor:(id)a3
{
  objc_storeStrong((id *)&self->_storedMentionsRotor, a3);
}

- (UIAccessibilityCustomRotor)storedCalculationResultRotor
{
  return self->_storedCalculationResultRotor;
}

- (void)setStoredCalculationResultRotor:(id)a3
{
  objc_storeStrong((id *)&self->_storedCalculationResultRotor, a3);
}

- (UIAccessibilityCustomRotor)storedCalculationErrorsRotor
{
  return self->_storedCalculationErrorsRotor;
}

- (void)setStoredCalculationErrorsRotor:(id)a3
{
  objc_storeStrong((id *)&self->_storedCalculationErrorsRotor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storedCalculationErrorsRotor, 0);
  objc_storeStrong((id *)&self->_storedCalculationResultRotor, 0);
  objc_storeStrong((id *)&self->_storedMentionsRotor, 0);
  objc_storeStrong((id *)&self->_storedTagsRotor, 0);
  objc_storeStrong((id *)&self->_storedTablesRotor, 0);
  objc_storeStrong((id *)&self->_storedAttachmentsRotor, 0);
  objc_storeStrong((id *)&self->_storedChecklistRotor, 0);
  objc_storeStrong((id *)&self->_storedLinksRotor, 0);
  objc_destroyWeak((id *)&self->_noteEditorViewController);
}

@end
