@implementation WDAddDataManualEntryItem

+ (id)dateItemWithMaximumDate:(id)a3
{
  id v3;
  _WDDateBasedAddDataManualEntryItem *v4;
  void *v5;
  void *v6;
  _WDDateBasedAddDataManualEntryItem *v7;

  v3 = a3;
  v4 = [_WDDateBasedAddDataManualEntryItem alloc];
  HABundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DATE"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_WDDateBasedAddDataManualEntryItem initWithMaximumDate:highlightWhenEditing:datePickerMode:displayName:](v4, "initWithMaximumDate:highlightWhenEditing:datePickerMode:displayName:", v3, 0, 1, v6);

  return v7;
}

+ (id)timeItemWithMaximumDate:(id)a3
{
  id v3;
  _WDDateBasedAddDataManualEntryItem *v4;
  void *v5;
  void *v6;
  _WDDateBasedAddDataManualEntryItem *v7;

  v3 = a3;
  v4 = [_WDDateBasedAddDataManualEntryItem alloc];
  HABundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TIME"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_WDDateBasedAddDataManualEntryItem initWithMaximumDate:highlightWhenEditing:datePickerMode:displayName:](v4, "initWithMaximumDate:highlightWhenEditing:datePickerMode:displayName:", v3, 0, 0, v6);

  return v7;
}

+ (id)dateTimeItemWithMaximumDate:(id)a3 displayName:(id)a4
{
  return (id)objc_msgSend(a1, "dateTimeItemWithMaximumDate:highlightWhenEditing:displayName:", a3, 0, a4);
}

+ (id)dateTimeItemWithMaximumDate:(id)a3 highlightWhenEditing:(BOOL)a4 displayName:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  _WDDateBasedAddDataManualEntryItem *v9;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  v9 = -[_WDDateBasedAddDataManualEntryItem initWithMaximumDate:highlightWhenEditing:datePickerMode:displayName:]([_WDDateBasedAddDataManualEntryItem alloc], "initWithMaximumDate:highlightWhenEditing:datePickerMode:displayName:", v8, v5, 2, v7);

  return v9;
}

+ (id)twoPartDateTimeItemWithMaximumDate:(id)a3
{
  id v3;
  _WDTwoPartDateTimeManualEntryItem *v4;

  v3 = a3;
  v4 = -[_WDTwoPartDateTimeManualEntryItem initWithMaximumDate:]([_WDTwoPartDateTimeManualEntryItem alloc], "initWithMaximumDate:", v3);

  return v4;
}

+ (id)twoPartDateRangeItemWithMaximumEndDate:(id)a3
{
  id v3;
  _WDTwoPartDateRangeManualEntryItem *v4;

  v3 = a3;
  v4 = -[_WDTwoPartDateRangeManualEntryItem initWithMaximumEndDate:]([_WDTwoPartDateRangeManualEntryItem alloc], "initWithMaximumEndDate:", v3);

  return v4;
}

+ (id)durationItemWithMaximumDate:(id)a3
{
  id v3;
  _WDDateWithDurationManualEntryItem *v4;

  v3 = a3;
  v4 = -[_WDDateWithDurationManualEntryItem initWithMaximumDate:]([_WDDateWithDurationManualEntryItem alloc], "initWithMaximumDate:", v3);

  return v4;
}

+ (id)numericItemWithManualEntryType:(unint64_t)a3 numberFormatter:(id)a4
{
  id v5;
  _WDNumberBasedAddDataManualEntryItem *v6;

  v5 = a4;
  v6 = objc_alloc_init(_WDNumberBasedAddDataManualEntryItem);
  -[_WDNumberBasedAddDataManualEntryItem setManualEntryType:](v6, "setManualEntryType:", a3);
  -[_WDNumberBasedAddDataManualEntryItem setNumberFormatter:](v6, "setNumberFormatter:", v5);

  return v6;
}

+ (id)multiSelectItemWithEntries:(id)a3 selectedIndex:(int64_t)a4
{
  id v5;
  _WDMultiSelectManualEntryItem *v6;

  v5 = a3;
  v6 = objc_alloc_init(_WDMultiSelectManualEntryItem);
  -[_WDMultiSelectManualEntryItem setTitles:](v6, "setTitles:", v5);

  -[_WDMultiSelectManualEntryItem setSelectedIndex:](v6, "setSelectedIndex:", a4);
  return v6;
}

+ (id)heightPickerItemWithFeetUnitString:(id)a3 inchUnitString:(id)a4
{
  id v5;
  id v6;
  _WDHeightPickerManualEntryItem *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_WDHeightPickerManualEntryItem initWithDisplayName:]([_WDHeightPickerManualEntryItem alloc], "initWithDisplayName:", v6);
  -[_WDHeightPickerManualEntryItem setFeetUnitString:](v7, "setFeetUnitString:", v6);

  -[_WDHeightPickerManualEntryItem setInchUnitString:](v7, "setInchUnitString:", v5);
  return v7;
}

- (id)_createUITableViewCell
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, 0);
}

- (id)_createWDManualDataEntryTableViewCellWithDisplayName:(id)a3 unitName:(id)a4 entryType:(unint64_t)a5 highlightWhenEditing:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  WDManualDataEntryTableViewCell *v11;

  v6 = a6;
  v9 = a4;
  v10 = a3;
  v11 = -[WDManualDataEntryTableViewCell initWithDisplayName:unitName:dataEntryType:]([WDManualDataEntryTableViewCell alloc], "initWithDisplayName:unitName:dataEntryType:", v10, v9, a5);

  -[WDManualDataEntryTableViewCell setShouldHighlightWhenEditing:](v11, "setShouldHighlightWhenEditing:", v6);
  return v11;
}

- (id)_createHXUIInlineDatePickerTableViewCellWithTitle:(id)a3 datePickerMode:(int64_t)a4 maxDate:(id)a5
{
  id v7;
  id v8;
  HXUIInlineDatePickerTableViewCell *v9;

  v7 = a5;
  v8 = a3;
  v9 = -[HXUIInlineDatePickerTableViewCell initWithTitle:datePickerMode:maxDate:]([HXUIInlineDatePickerTableViewCell alloc], "initWithTitle:datePickerMode:maxDate:", v8, a4, v7);

  return v9;
}

- (id)_createHXUIInlinePickerTableViewCellWithTitle:(id)a3
{
  id v3;
  HXUIInlinePickerTableViewCell *v4;

  v3 = a3;
  v4 = -[HXUIInlinePickerTableViewCell initWithTitle:]([HXUIInlinePickerTableViewCell alloc], "initWithTitle:", v3);

  return v4;
}

- (void)_didUpdateValue
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "manualEntryItemDidUpdate:", self);

}

- (void)_disambiguateDateComponents:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void (**v20)(id, void *);
  void *v21;
  void *v22;
  WDAddDataManualEntryItem *v23;
  void *v24;
  id v25;
  id obj;
  _QWORD v27[5];
  void (**v28)(id, void *);
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hk_disambiguatedDSTDatesForComponents:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") == 1)
  {
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v10);

  }
  else
  {
    v23 = self;
    v24 = v8;
    v25 = v6;
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v12, "setDateStyle:", 3);
    objc_msgSend(v12, "setTimeStyle:", 3);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v9;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          v18 = (void *)MEMORY[0x1E0DC3448];
          objc_msgSend(v12, "stringFromDate:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __71__WDAddDataManualEntryItem__disambiguateDateComponents_withCompletion___block_invoke;
          v27[3] = &unk_1E55754A0;
          v20 = v7;
          v27[4] = v17;
          v28 = v20;
          objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 0, v27);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "addAction:", v21);
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v14);
    }

    -[WDAddDataManualEntryItem delegate](v23, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "presentViewController:animated:completion:", v11, 1, 0);

    v8 = v24;
    v6 = v25;
  }

}

uint64_t __71__WDAddDataManualEntryItem__disambiguateDateComponents_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setValue:(id)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  WDAddDataManualEntryItem *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5378];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2114;
    v11 = self;
    _os_log_impl(&dword_1A95F5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ has been called on %{public}@, which does not implement this method. This is probably a mistake.", (uint8_t *)&v8, 0x16u);

  }
}

- (void)cellForItemTapped:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "beginEditing");

}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabel, a3);
}

- (WDAddDataManualEntryItemDelegate)delegate
{
  return (WDAddDataManualEntryItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)generateValue
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  return 0;
}

- (id)tableViewCells
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  return (id)MEMORY[0x1E0C9AA60];
}

@end
