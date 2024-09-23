@implementation SFContactAutoFillViewController

- (SFContactAutoFillViewController)initWithMatches:(id)a3 contact:(id)a4
{
  id v6;
  id v7;
  SFContactAutoFillViewController *v8;
  uint64_t v9;
  NSArray *matches;
  SFContactAutoFillViewController *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SFContactAutoFillViewController;
  v8 = -[SFContactAutoFillViewController initWithStyle:](&v13, sel_initWithStyle_, 0);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    matches = v8->_matches;
    v8->_matches = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_contact, a4);
    v11 = v8;
  }

  return v8;
}

- (id)_valueForProperty:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  char v43;
  NSObject *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DD9910], "contactKeyForString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D8AE28]))
  {
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", self->_contact, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C967F0]))
  {
    -[CNContact postalAddresses](self->_contact, "postalAddresses");
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v59;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v59 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", v7);

          if ((v17 & 1) != 0)
          {
            v21 = (void *)MEMORY[0x1E0C973B0];
            objc_msgSend(v15, "value");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "stringFromPostalAddress:style:", v22, 0);
            v23 = objc_claimAutoreleasedReturnValue();
            goto LABEL_16;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
        if (v12)
          continue;
        break;
      }
    }
    goto LABEL_49;
  }
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C96670]))
  {
    -[CNContact birthday](self->_contact, "birthday");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dateFromComponents:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v20, "setLocalizedDateFormatFromTemplate:", CFSTR("dMy"));
    objc_msgSend(v20, "stringFromDate:", v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
    goto LABEL_53;
  }
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C967C0]))
  {
    -[CNContact phoneNumbers](self->_contact, "phoneNumbers");
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v55;
      while (2)
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v55 != v26)
            objc_enumerationMutation(v10);
          v28 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
          objc_msgSend(v28, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "isEqualToString:", v7);

          if ((v30 & 1) != 0)
          {
            objc_msgSend(v28, "value");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "stringValue");
            v23 = objc_claimAutoreleasedReturnValue();
LABEL_16:
            v9 = (void *)v23;

            goto LABEL_17;
          }
        }
        v25 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
        if (v25)
          continue;
        break;
      }
    }
    goto LABEL_49;
  }
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C966A8]))
  {
    -[CNContact emailAddresses](self->_contact, "emailAddresses");
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v51;
LABEL_32:
      v34 = 0;
      while (1)
      {
        if (*(_QWORD *)v51 != v33)
          objc_enumerationMutation(v10);
        v35 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v34);
        objc_msgSend(v35, "identifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "isEqualToString:", v7);

        if ((v37 & 1) != 0)
          break;
        if (v32 == ++v34)
        {
          v32 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
          if (v32)
            goto LABEL_32;
          goto LABEL_49;
        }
      }
LABEL_54:
      objc_msgSend(v35, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

      goto LABEL_18;
    }
    goto LABEL_49;
  }
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C968A0]))
  {
    -[CNContact urlAddresses](self->_contact, "urlAddresses");
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v47;
LABEL_43:
      v41 = 0;
      while (1)
      {
        if (*(_QWORD *)v47 != v40)
          objc_enumerationMutation(v10);
        v35 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v41);
        objc_msgSend(v35, "identifier", (_QWORD)v46);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "isEqualToString:", v7);

        if ((v43 & 1) != 0)
          goto LABEL_54;
        if (v39 == ++v41)
        {
          v39 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
          if (v39)
            goto LABEL_43;
          break;
        }
      }
    }
LABEL_49:

  }
  v44 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    -[SFContactAutoFillViewController _valueForProperty:identifier:].cold.1((uint64_t)v6, v44);
  v9 = 0;
LABEL_53:

  return v9;
}

- (id)properties
{
  NSArray *propertyValues;
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  SFContactAutoFillPropertyValues *v22;
  void *v23;
  SFContactAutoFillPropertyValues *v24;
  void *v25;
  uint64_t v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  propertyValues = self->_propertyValues;
  if (!propertyValues)
  {
    v27 = 1032;
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v5 = self->_matches;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v34 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v10, "property", v27);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v4, "containsObject:", v11);

          if ((v12 & 1) == 0)
          {
            objc_msgSend(v10, "property");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v13);

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v7);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v4;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v30 != v17)
            objc_enumerationMutation(obj);
          v19 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
          -[SFContactAutoFillViewController matchesForProperty:](self, "matchesForProperty:", v19, v27);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFContactAutoFillViewController valuesFromPropertyMatches:](self, "valuesFromPropertyMatches:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = [SFContactAutoFillPropertyValues alloc];
          objc_msgSend(MEMORY[0x1E0DD9910], "contactKeyForString:", v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[SFContactAutoFillPropertyValues initWithValues:property:](v22, "initWithValues:property:", v21, v23);
          objc_msgSend(v14, "addObject:", v24);

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v16);
    }

    v25 = *(Class *)((char *)&self->super.super.super.super.isa + v27);
    *(Class *)((char *)&self->super.super.super.super.isa + v27) = (Class)v14;

    propertyValues = *(NSArray **)((char *)&self->super.super.super.super.isa + v27);
  }
  return propertyValues;
}

- (id)matchesForProperty:(id)a3
{
  id v4;
  NSArray *matches;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  matches = self->_matches;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__SFContactAutoFillViewController_matchesForProperty___block_invoke;
  v9[3] = &unk_1E4AC4590;
  v10 = v4;
  v6 = v4;
  -[NSArray safari_filterObjectsUsingBlock:](matches, "safari_filterObjectsUsingBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __54__SFContactAutoFillViewController_matchesForProperty___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "property");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)valuesFromPropertyMatches:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  SFContactAutoFillValue *v25;
  void *v26;
  void *v27;
  SFContactAutoFillValue *v28;
  _QWORD v30[5];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  SFContactAutoFillValue *v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "length");

        if (!v13)
        {
          v25 = [SFContactAutoFillValue alloc];
          v37 = v11;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DD9910], "valueStringForMatch:", v11);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = -[SFContactAutoFillValue initWithMatches:displayValue:label:](v25, "initWithMatches:displayValue:label:", v26, v27, 0);

          v36 = v28;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = v6;
          goto LABEL_13;
        }
        objc_msgSend(v11, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v16, v17);

        }
        objc_msgSend(v11, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v8)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __61__SFContactAutoFillViewController_valuesFromPropertyMatches___block_invoke;
  v30[3] = &unk_1E4AC45B8;
  v30[4] = self;
  v21 = v20;
  v31 = v21;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v30);
  v22 = v31;
  v23 = v21;

  v24 = v23;
LABEL_13:

  return v24;
}

void __61__SFContactAutoFillViewController_valuesFromPropertyMatches___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  SFContactAutoFillValue *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SFContactAutoFillValue *v16;

  v5 = a3;
  v6 = a2;
  v7 = [SFContactAutoFillValue alloc];
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v5, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "property");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_valueForProperty:identifier:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C97338];
  objc_msgSend(v5, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "label");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForLabel:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SFContactAutoFillValue initWithMatches:displayValue:label:](v7, "initWithMatches:displayValue:label:", v5, v11, v15);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v16);
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFContactAutoFillViewController;
  -[SFContactAutoFillViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[SFContactAutoFillViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0DC34F0]);
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithTitle:style:target:action:", v5, 0, self, sel__cancel_);
  objc_msgSend(v3, "setLeftBarButtonItem:", v6);

  v7 = objc_alloc(MEMORY[0x1E0DC34F0]);
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTitle:style:target:action:", v8, 2, self, sel_autoFill_);
  objc_msgSend(v3, "setRightBarButtonItem:", v9);

  -[SFContactAutoFillViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("cell"));
  v11 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v10, "setTableFooterView:", v11);

  objc_msgSend(v10, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  objc_msgSend(v10, "setEstimatedRowHeight:", 100.0);
  objc_msgSend(v10, "setSeparatorInset:", 0.0, 14.0 * 2.0 + 22.0, 0.0, 0.0);

}

- (void)_cancel:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFiller);
  objc_msgSend(WeakRetained, "dismissCustomAutoFill");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFContactAutoFillViewController;
  -[SFContactAutoFillViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[SFContactAutoFillViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)autoFill:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id WeakRetained;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SFContactAutoFillViewController properties](self, "properties", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "selectedValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "selected");
        objc_msgSend(v11, "matches");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          v14 = v4;
        else
          v14 = v5;
        objc_msgSend(v14, "addObjectsFromArray:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFiller);
  objc_msgSend(WeakRetained, "performAutoFillWithMatchSelections:doNotFill:contact:", v4, v5, self->_contact);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  SFContactAutoFillDetailViewController *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[SFContactAutoFillViewController properties](self, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "values");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 >= 2)
  {
    v11 = -[SFContactAutoFillDetailViewController initWithPropertyValues:]([SFContactAutoFillDetailViewController alloc], "initWithPropertyValues:", v8);
    -[SFContactAutoFillViewController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pushViewController:animated:", v11, 1);

    objc_msgSend(v13, "deselectRowAtIndexPath:animated:", v6, 0);
  }

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[SFContactAutoFillViewController properties](self, "properties", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("cell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFContactAutoFillViewController properties](self, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(self) = -[SFContactAutoFillViewController canDrillInCellAtIndexPath:](self, "canDrillInCellAtIndexPath:", v6);
  objc_msgSend(v7, "setAccessoryType:", self);
  if ((_DWORD)self)
    v10 = 3;
  else
    v10 = 0;
  objc_msgSend(v7, "setSelectionStyle:", v10);
  objc_msgSend(v7, "setUsesDetailAppearance:", 0);
  objc_msgSend(v9, "selectedValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "property");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:property:", v11, v12);

  return v7;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return -[SFContactAutoFillViewController canDrillInCellAtIndexPath:](self, "canDrillInCellAtIndexPath:", a4);
}

- (BOOL)canDrillInCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[SFContactAutoFillViewController properties](self, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "row");

  objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "values");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = (unint64_t)objc_msgSend(v8, "count") > 1;

  return v6;
}

- (SFContactAutoFillViewControllerFiller)autoFiller
{
  return (SFContactAutoFillViewControllerFiller *)objc_loadWeakRetained((id *)&self->_autoFiller);
}

- (void)setAutoFiller:(id)a3
{
  objc_storeWeak((id *)&self->_autoFiller, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_autoFiller);
  objc_storeStrong((id *)&self->_propertyValues, 0);
  objc_storeStrong((id *)&self->_matches, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)_valueForProperty:(uint64_t)a1 identifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1A3B2D000, a2, OS_LOG_TYPE_ERROR, "Failed to find display value for %{public}@ property in contact card", (uint8_t *)&v2, 0xCu);
}

@end
