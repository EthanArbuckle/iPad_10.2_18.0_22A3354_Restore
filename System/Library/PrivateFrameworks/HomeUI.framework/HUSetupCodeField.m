@implementation HUSetupCodeField

- (HUSetupCodeField)init
{
  return -[HUSetupCodeField initWithCodeDigits:](self, "initWithCodeDigits:", 8);
}

- (HUSetupCodeField)initWithCodeDigits:(unint64_t)a3
{
  HUSetupCodeField *v4;
  void *v5;
  unint64_t v6;
  unsigned int v7;
  HUSetupCodeFieldItem *v8;
  uint64_t v9;
  NSArray *items;
  void *v11;
  UITextField *v12;
  UITextField *hiddenInputField;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HUSetupCodeField;
  v4 = -[HUSetupCodeField init](&v17, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      v6 = 0;
      v7 = 1;
      do
      {
        v8 = objc_alloc_init(HUSetupCodeFieldItem);
        -[HUSetupCodeFieldItem setItemNumber:](v8, "setItemNumber:", v6);
        objc_msgSend(v5, "setObject:atIndexedSubscript:", v8, v6);

        v6 = v7++;
      }
      while (v6 < a3);
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v5);
    v9 = objc_claimAutoreleasedReturnValue();
    items = v4->_items;
    v4->_items = (NSArray *)v9;

    -[NSArray firstObject](v4->_items, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v4->_activeItem, v11);

    v4->_itemSpacing = 2.0;
    v12 = (UITextField *)objc_alloc_init(MEMORY[0x1E0CEAAD0]);
    hiddenInputField = v4->_hiddenInputField;
    v4->_hiddenInputField = v12;

    -[UITextField setDelegate:](v4->_hiddenInputField, "setDelegate:", v4);
    -[UITextField setKeyboardType:](v4->_hiddenInputField, "setKeyboardType:", 4);
    -[HUSetupCodeField _updateInterfaceForCurrentTraitCollection](v4, "_updateInterfaceForCurrentTraitCollection");
    -[UITextField setHidden:](v4->_hiddenInputField, "setHidden:", 1);
    -[HUSetupCodeField addSubview:](v4, "addSubview:", v4->_hiddenInputField);
    -[HUSetupCodeField _setupCodeFieldItems](v4, "_setupCodeFieldItems");
    -[NSArray firstObject](v4->_items, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activate");

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v4, sel_fieldTapped_);
    -[HUSetupCodeField addGestureRecognizer:](v4, "addGestureRecognizer:", v15);

  }
  return v4;
}

- (NSString)setupCode
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HUSetupCodeField items](self, "items", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
      objc_msgSend(v9, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        break;
      objc_msgSend(v9, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v12);

      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  v13 = (void *)objc_msgSend(v3, "copy");
  return (NSString *)v13;
}

- (BOOL)isComplete
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  BOOL v8;
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
  -[HUSetupCodeField items](self, "items", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "value");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v7)
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (void)clear
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  -[HUSetupCodeField items](self, "items", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v7++), "setValue:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  -[HUSetupCodeField activeItem](self, "activeItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HUSetupCodeField activeItem](self, "activeItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deactivate");

  }
  -[HUSetupCodeField items](self, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSetupCodeField setActiveItem:](self, "setActiveItem:", v11);

  -[HUSetupCodeField activeItem](self, "activeItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activate");

}

- (void)showKeypad
{
  id v2;

  -[HUSetupCodeField hiddenInputField](self, "hiddenInputField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "becomeFirstResponder");

}

- (void)hideKeypad
{
  id v2;

  -[HUSetupCodeField hiddenInputField](self, "hiddenInputField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resignFirstResponder");

}

- (void)fieldTapped:(id)a3
{
  void *v4;
  char v5;

  -[HUSetupCodeField hiddenInputField](self, "hiddenInputField", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFirstResponder");

  if ((v5 & 1) == 0)
    -[HUSetupCodeField showKeypad](self, "showKeypad");
}

- (void)_setupCodeFieldItems
{
  UIStackView *v3;
  UIStackView *codeFieldItemsView;
  void *v5;
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
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!self->_codeFieldItemsView)
  {
    v3 = (UIStackView *)objc_opt_new();
    codeFieldItemsView = self->_codeFieldItemsView;
    self->_codeFieldItemsView = v3;

    -[UIStackView setDistribution:](self->_codeFieldItemsView, "setDistribution:", 1);
    -[UIStackView setAxis:](self->_codeFieldItemsView, "setAxis:", 0);
    -[UIStackView setSpacing:](self->_codeFieldItemsView, "setSpacing:", 2.0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_codeFieldItemsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setSemanticContentAttribute:](self->_codeFieldItemsView, "setSemanticContentAttribute:", 3);
    -[HUSetupCodeField addSubview:](self, "addSubview:", self->_codeFieldItemsView);
    -[UIStackView leftAnchor](self->_codeFieldItemsView, "leftAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSetupCodeField leftAnchor](self, "leftAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintEqualToAnchor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActive:", 1);

    -[UIStackView rightAnchor](self->_codeFieldItemsView, "rightAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSetupCodeField rightAnchor](self, "rightAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setActive:", 1);

    -[UIStackView topAnchor](self->_codeFieldItemsView, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSetupCodeField topAnchor](self, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

    -[UIStackView bottomAnchor](self->_codeFieldItemsView, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSetupCodeField bottomAnchor](self, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[HUSetupCodeField items](self, "items", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v29;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v21);
        -[HUSetupCodeField codeFieldItemsView](self, "codeFieldItemsView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addArrangedSubview:", v22);

        objc_msgSend(v22, "widthAnchor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "constraintEqualToConstant:", 36.0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setActive:", 1);

        objc_msgSend(v22, "heightAnchor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "constraintEqualToConstant:", 56.0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setActive:", 1);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v19);
  }

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a5;
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isSupersetOfSet:", v8);
  if (v9)
  {
    if (objc_msgSend(v6, "length"))
    {
      -[HUSetupCodeField activeItem](self, "activeItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "integerValue"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUSetupCodeField activeItem](self, "activeItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setValue:", v11);

      }
      -[HUSetupCodeField _activateNext](self, "_activateNext");
    }
    else
    {
      -[HUSetupCodeField _activateLast](self, "_activateLast");
    }
  }

  return v9;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  if (-[HUSetupCodeField isComplete](self, "isComplete", a3))
  {
    -[HUSetupCodeField delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "conformsToProtocol:", &unk_1EF3482D0))
    {
LABEL_5:

      return 1;
    }
    -[HUSetupCodeField delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[HUSetupCodeField delegate](self, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setupCodeFieldDidReturn:", self);
      goto LABEL_5;
    }
  }
  return 1;
}

- (void)_activateNext
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;

  -[HUSetupCodeField activeItem](self, "activeItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUSetupCodeField activeItem](self, "activeItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "itemNumber") + 1;

    -[HUSetupCodeField items](self, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v5 <= v7)
    {
      -[HUSetupCodeField activeItem](self, "activeItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deactivate");

      -[HUSetupCodeField items](self, "items");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v5 == v10)
      {
        -[HUSetupCodeField setActiveItem:](self, "setActiveItem:", 0);
      }
      else
      {
        -[HUSetupCodeField items](self, "items");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUSetupCodeField setActiveItem:](self, "setActiveItem:", v12);

        -[HUSetupCodeField activeItem](self, "activeItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "activate");

      }
    }
    -[HUSetupCodeField activeItem](self, "activeItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      -[HUSetupCodeField delegate](self, "delegate");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "conformsToProtocol:", &unk_1EF3482D0))
      {
        -[HUSetupCodeField delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_opt_respondsToSelector();

        if ((v16 & 1) == 0)
          return;
        -[HUSetupCodeField delegate](self, "delegate");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setupCodeFieldDidBecomeComplete:", self);
      }
      v14 = v17;
    }

  }
}

- (void)_activateLast
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;

  v3 = -[HUSetupCodeField isComplete](self, "isComplete");
  -[HUSetupCodeField activeItem](self, "activeItem");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        -[HUSetupCodeField activeItem](self, "activeItem"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "itemNumber"),
        v6,
        v5,
        v7))
  {
    if (!v3)
    {
      -[HUSetupCodeField activeItem](self, "activeItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[HUSetupCodeField activeItem](self, "activeItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "itemNumber");

        -[HUSetupCodeField activeItem](self, "activeItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "deactivate");
        goto LABEL_8;
      }
    }
  }
  else if (!v3)
  {
    return;
  }
  -[HUSetupCodeField items](self, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v11, "count");
LABEL_8:

  -[HUSetupCodeField items](self, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", v10 - 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSetupCodeField setActiveItem:](self, "setActiveItem:", v13);

  -[HUSetupCodeField activeItem](self, "activeItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "clear");

  -[HUSetupCodeField activeItem](self, "activeItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activate");

  if (!v3)
    return;
  -[HUSetupCodeField delegate](self, "delegate");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "conformsToProtocol:", &unk_1EF3482D0))
  {
    -[HUSetupCodeField delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) == 0)
      return;
    -[HUSetupCodeField delegate](self, "delegate");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setupCodeFieldDidBecomeIncomplete:", self);
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUSetupCodeField;
  -[HUSetupCodeField traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[HUSetupCodeField _updateInterfaceForCurrentTraitCollection](self, "_updateInterfaceForCurrentTraitCollection");
}

- (void)_updateInterfaceForCurrentTraitCollection
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  -[HUSetupCodeField traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  -[HUSetupCodeField hiddenInputField](self, "hiddenInputField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v4 == 2)
    v6 = 1;
  else
    v6 = 2;
  objc_msgSend(v5, "setKeyboardAppearance:", v6);

}

- (HUSetupCodeFieldDelegate)delegate
{
  return (HUSetupCodeFieldDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)items
{
  return self->_items;
}

- (HUSetupCodeFieldItem)activeItem
{
  return (HUSetupCodeFieldItem *)objc_loadWeakRetained((id *)&self->_activeItem);
}

- (void)setActiveItem:(id)a3
{
  objc_storeWeak((id *)&self->_activeItem, a3);
}

- (double)itemSpacing
{
  return self->_itemSpacing;
}

- (void)setItemSpacing:(double)a3
{
  self->_itemSpacing = a3;
}

- (UITextField)hiddenInputField
{
  return self->_hiddenInputField;
}

- (void)setHiddenInputField:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenInputField, a3);
}

- (UIStackView)codeFieldItemsView
{
  return self->_codeFieldItemsView;
}

- (void)setCodeFieldItemsView:(id)a3
{
  objc_storeStrong((id *)&self->_codeFieldItemsView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codeFieldItemsView, 0);
  objc_storeStrong((id *)&self->_hiddenInputField, 0);
  objc_destroyWeak((id *)&self->_activeItem);
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
