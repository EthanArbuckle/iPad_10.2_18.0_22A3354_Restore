@implementation CNPropertyGroupGeminiItem

- (void)setGeminiResult:(id)a3
{
  objc_storeStrong((id *)&self->_geminiResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editingContact, 0);
  objc_destroyWeak((id *)&self->_geminiUpdateDelegate);
  objc_storeStrong((id *)&self->_geminiResult, 0);
}

- (id)displayLabel
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PREFERRED_LINE_EDIT_CONTACT_PROPERTY_LABEL"), &stru_1E20507A8, CFSTR("Localized-GEMINI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)displayValue
{
  return -[CNPropertyGroupGeminiItem displayStringForValue:](self, "displayStringForValue:", 0);
}

- (id)displayStringForValue:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;

  -[CNPropertyGroupGeminiItem geminiResult](self, "geminiResult", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "usage");

  if (v5 == 2)
  {
    -[CNPropertyGroupGeminiItem geminiResult](self, "geminiResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "channel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isAvailable");

    CNContactsUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      v10 = CFSTR("PREFERRED_LINE_EDIT_CONTACT_PROPERTY_LAST_USED_VALUE-%@");
    else
      v10 = CFSTR("PREFERRED_LINE_EDIT_CONTACT_PROPERTY_LAST_USED_VALUE_UNAVAILABLE-%@");
  }
  else
  {
    if (v5 != 1)
    {
      CNContactsUIBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v14;
      v10 = CFSTR("PREFERRED_LINE_EDIT_CONTACT_PROPERTY_DEFAULT_VALUE-%@");
      goto LABEL_11;
    }
    -[CNPropertyGroupGeminiItem geminiResult](self, "geminiResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "channel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isAvailable");

    CNContactsUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v10 = CFSTR("PREFERRED_LINE_EDIT_CONTACT_PROPERTY_ALWAYS_USE_VALUE-%@");
    else
      v10 = CFSTR("PREFERRED_LINE_EDIT_CONTACT_PROPERTY_ALWAYS_USE_VALUE_UNAVAILABLE-%@");
  }
  v14 = v9;
LABEL_11:
  objc_msgSend(v14, "localizedStringForKey:value:table:", v10, &stru_1E20507A8, CFSTR("Localized-GEMINI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CB3940];
  -[CNPropertyGroupGeminiItem geminiResult](self, "geminiResult");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "channel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedLabel");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (const __CFString *)v19;
  else
    v21 = &stru_1E20507A8;
  objc_msgSend(v16, "stringWithFormat:", v15, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)updateLabeledValueWithValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CNPropertyGroupGeminiItem;
  v4 = a3;
  -[CNPropertyGroupItem updateLabeledValueWithValue:](&v13, sel_updateLabeledValueWithValue_, v4);
  -[CNPropertyGroupGeminiItem editingContact](self, "editingContact", v13.receiver, v13.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[CNPropertyGroupItem contact](self, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    -[CNPropertyGroupGeminiItem setEditingContact:](self, "setEditingContact:", v7);

  }
  -[CNPropertyGroupGeminiItem editingContact](self, "editingContact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreferredChannel:", v4);

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "geminiManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyGroupGeminiItem editingContact](self, "editingContact");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteGeminiResultForContact:substituteDefaultForDangling:error:", v11, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyGroupGeminiItem setGeminiResult:](self, "setGeminiResult:", v12);

}

- (BOOL)isEquivalentToItem:(id)a3 whenEditing:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a3;
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "labeledValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  return v10;
}

- (BOOL)isValidValue:(id)a3
{
  return (*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() ^ 1;
}

- (BOOL)canRemove
{
  return 0;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyGroupGeminiItem geminiResult](self, "geminiResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "channel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[CNPropertyGroupGeminiItem geminiResult](self, "geminiResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "usage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> %@ %@ %@"), v4, self, v6, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (void)geminiDataSourceDidUpdate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNPropertyGroupGeminiItem geminiUpdateDelegate](self, "geminiUpdateDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "geminiDataSourceDidUpdate:", v4);

}

- (CNGeminiResult)geminiResult
{
  return self->_geminiResult;
}

- (CNUIGeminiDataSourceDelegate)geminiUpdateDelegate
{
  return (CNUIGeminiDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_geminiUpdateDelegate);
}

- (void)setGeminiUpdateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_geminiUpdateDelegate, a3);
}

- (CNMutableContact)editingContact
{
  return self->_editingContact;
}

- (void)setEditingContact:(id)a3
{
  objc_storeStrong((id *)&self->_editingContact, a3);
}

@end
