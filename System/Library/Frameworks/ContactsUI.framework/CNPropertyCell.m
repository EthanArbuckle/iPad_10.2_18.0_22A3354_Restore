@implementation CNPropertyCell

- (void)updateWithPropertyItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CNPropertyCell labelString](self, "labelString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLabeledCell labelView](self, "labelView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ab_text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    -[CNLabeledCell labelView](self, "labelView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAb_text:", v4);

  }
  -[CNPropertyCell updateValueWithPropertyItem:](self, "updateValueWithPropertyItem:", v10);
  if (-[CNPropertyCell isSuggested](self, "isSuggested") && !-[CNPropertyCell forceSuggested](self, "forceSuggested"))
  {
    -[CNPropertyCell setAccessoryType:](self, "setAccessoryType:", 1);
    +[CNUIColorRepository contactCardDisclosureAccessoryTintColor](CNUIColorRepository, "contactCardDisclosureAccessoryTintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyCell _setAccessoryTintColor:](self, "_setAccessoryTintColor:", v9);

  }
  else
  {
    -[CNPropertyCell setAccessoryType:](self, "setAccessoryType:", 0);
  }

}

- (void)updateValueWithPropertyItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  -[CNPropertyCell valueString](self, "valueString", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLabeledCell valueView](self, "valueView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ab_text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    -[CNPropertyCell valueString](self, "valueString");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[CNLabeledCell valueView](self, "valueView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAb_text:", v9);

  }
}

- (id)valueString
{
  void *v2;
  void *v3;

  -[CNPropertyCell propertyItem](self, "propertyItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setLabelWidth:(double)a3
{
  self->_labelWidth = a3;
}

- (BOOL)isHighlightedProperty
{
  return self->_highlightedProperty;
}

- (BOOL)supportsValueColorUsesLabelColor
{
  return 1;
}

- (void)setPresentingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentingDelegate, a3);
}

- (void)setHighlightedProperty:(BOOL)a3
{
  self->_highlightedProperty = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setCardGroupItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNPropertyCell;
  -[CNContactCell cardGroupItem](&v8, sel_cardGroupItem);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 && !v5 || v5 && (objc_msgSend(v5, "isEqual:", v4) & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)CNPropertyCell;
    -[CNContactCell setCardGroupItem:](&v7, sel_setCardGroupItem_, v4);
    if (v4)
      -[CNPropertyCell updateWithPropertyItem:](self, "updateWithPropertyItem:", v4);
  }

}

- (id)labelString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  int v17;
  void *v18;
  uint64_t v19;

  -[CNPropertyCell propertyItem](self, "propertyItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "property");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CNUILocalizedStringForPropertyWithFormatKey(CFSTR("LOWERCASE_LABEL"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CNPropertyCell shouldShowSuggestionOrigin](self, "shouldShowSuggestionOrigin");
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "labeledValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueOrigin");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[CNPropertyCell propertyItem](self, "propertyItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "labeledValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "valueOrigin");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedApplicationName");
      v15 = objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "labelStringFromAppName:andPropertyLabel:", v15, v6);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      v4 = (void *)v15;
    }
    else
    {
      objc_msgSend(v3, "labeledValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPropertyCell appNameForSuggestion:](self, "appNameForSuggestion:", v18);
      v19 = objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "labelStringFromAppName:andPropertyLabel:", v19, v6);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      v4 = (void *)v19;
    }
    goto LABEL_7;
  }
  v17 = objc_msgSend(v8, "isSuggested");

  if (v17)
  {
    v16 = v6;
LABEL_7:

    v4 = v16;
  }

  return v4;
}

- (BOOL)isSuggested
{
  char v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[CNPropertyCell forceSuggested](self, "forceSuggested"))
    return 1;
  if (-[CNPropertyCell ignoreSuggested](self, "ignoreSuggested"))
    return 0;
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isSuggested") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    -[CNPropertyCell propertyItem](self, "propertyItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v6, "isSuggested");

  }
  return v3;
}

- (BOOL)ignoreSuggested
{
  return self->_ignoreSuggested;
}

- (BOOL)forceSuggested
{
  return self->_forceSuggested;
}

- (BOOL)shouldShowSuggestionOrigin
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;

  -[CNPropertyCell propertyItem](self, "propertyItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSuggestedMe");

  if (!v5)
    return -[CNPropertyCell isSuggested](self, "isSuggested");
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isSuggested"))
    v7 = -[CNPropertyCell isEditing](self, "isEditing") ^ 1;
  else
    LOBYTE(v7) = 0;

  return v7;
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (CNPropertyCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNPropertyCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNPropertyCell;
  v4 = -[CNLabeledCell initWithStyle:reuseIdentifier:](&v6, sel_initWithStyle_reuseIdentifier_, a3, a4);
  -[CNPropertyCell setAccessoryType:](v4, "setAccessoryType:", 0);
  return v4;
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNPropertyCell;
  -[CNLabeledCell tintColorDidChange](&v9, sel_tintColorDidChange);
  if (!-[CNPropertyCell isSuggested](self, "isSuggested")
    && (!-[CNPropertyCell isHighlightedProperty](self, "isHighlightedProperty")
     || !-[CNPropertyCell isImportant](self, "isImportant"))
    && -[CNPropertyCell supportsTintColorValue](self, "supportsTintColorValue"))
  {
    -[CNLabeledCell valueTextAttributes](self, "valueTextAttributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView tintColorOverride](self, "tintColorOverride");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0DC1140];
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", v4);

    if ((v7 & 1) == 0)
    {
      v8 = (void *)objc_msgSend(v3, "mutableCopy");
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v4, v5);
      -[CNLabeledCell setValueTextAttributes:](self, "setValueTextAttributes:", v8);

    }
  }
}

- (BOOL)supportsTintColorValue
{
  return 1;
}

- (CNPropertyCellDelegate)delegate
{
  return (CNPropertyCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)performDefaultAction
{
  void *v3;
  id v4;

  -[CNPropertyCell delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyCell:performActionForItem:withTransportType:", self, v3, 0);

}

- (void)performAccessoryAction
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  -[CNPropertyCell propertyItem](self, "propertyItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSuggested");

  if (v4)
  {
    -[CNPropertyCell delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CNPropertyCell propertyItem](self, "propertyItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "propertyCell:performActionForItem:withTransportType:", self, v5, 0);

  }
}

- (void)setProperty:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id obj;

  obj = a3;
  objc_msgSend(obj, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(obj, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLabeledCell labelView](self, "labelView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAb_text:", v6);

    objc_msgSend(obj, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLabeledCell valueView](self, "valueView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAb_text:", v8);

  }
  objc_storeWeak(&self->_property, obj);

}

- (id)appNameForSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v4 = a3;
  if (objc_msgSend(v4, "isSuggested"))
  {
    objc_msgSend(v4, "localizedAppName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[CNPropertyCell delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contactViewCache");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contactStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = 0;
      objc_msgSend(v8, "originForSuggestion:error:", v4, &v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedApplicationName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)copy:(id)a3
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  __CFString *v7;

  -[CNPropertyCell propertyItem](self, "propertyItem", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayValue");
  v4 = objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = (const __CFString *)v4;
  else
    v5 = &stru_1E20507A8;
  v7 = (__CFString *)v5;
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setString:", v7);

}

- (id)property
{
  return objc_loadWeakRetained(&self->_property);
}

- (UIResponder)firstResponderItem
{
  return self->_firstResponderItem;
}

- (void)setIgnoreSuggested:(BOOL)a3
{
  self->_ignoreSuggested = a3;
}

- (void)setForceSuggested:(BOOL)a3
{
  self->_forceSuggested = a3;
}

- (BOOL)isImportant
{
  return self->_important;
}

- (void)setImportant:(BOOL)a3
{
  self->_important = a3;
}

- (double)labelWidth
{
  return self->_labelWidth;
}

- (CNPresenterDelegate)presentingDelegate
{
  return (CNPresenterDelegate *)objc_loadWeakRetained((id *)&self->_presentingDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak(&self->_property);
}

+ (id)labelStringFromAppName:(id)a3 andPropertyLabel:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, id);
  id v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;

  v5 = a3;
  v6 = *MEMORY[0x1E0D13848];
  v7 = *(uint64_t (**)(uint64_t, id))(*MEMORY[0x1E0D13848] + 16);
  v8 = a4;
  v9 = v7(v6, v5);
  v10 = (void *)MEMORY[0x1E0CB3940];
  CNContactsUIBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v9 & 1) != 0)
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SUGGESTION_UNKNOWN_ORIGIN"), &stru_1E20507A8, CFSTR("Localized"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SUGGESTION_FOUND_IN_APP"), &stru_1E20507A8, CFSTR("Localized"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v5;
  }
  objc_msgSend(v10, "stringWithFormat:", v13, v8, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
