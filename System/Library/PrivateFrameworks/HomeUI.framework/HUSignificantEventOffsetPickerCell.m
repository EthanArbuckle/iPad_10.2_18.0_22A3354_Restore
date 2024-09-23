@implementation HUSignificantEventOffsetPickerCell

- (HUSignificantEventOffsetPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUSignificantEventOffsetPickerCell *v4;
  HUSignificantEventOffsetPickerCell *v5;
  uint64_t v6;
  NSDateComponents *currentOffset;
  id v8;
  uint64_t v9;
  UIPickerView *pickerView;
  void *v11;
  void *v12;
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
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)HUSignificantEventOffsetPickerCell;
  v4 = -[HUSignificantEventOffsetPickerCell initWithStyle:reuseIdentifier:](&v34, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_significantEvent, (id)*MEMORY[0x1E0CB9B88]);
    v6 = objc_opt_new();
    currentOffset = v5->_currentOffset;
    v5->_currentOffset = (NSDateComponents *)v6;

    objc_storeStrong((id *)&v5->_selectedOffset, v5->_currentOffset);
    v8 = objc_alloc(MEMORY[0x1E0CEA838]);
    v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    pickerView = v5->_pickerView;
    v5->_pickerView = (UIPickerView *)v9;

    -[HUSignificantEventOffsetPickerCell pickerView](v5, "pickerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDataSource:", v5);

    -[HUSignificantEventOffsetPickerCell pickerView](v5, "pickerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", v5);

    -[HUSignificantEventOffsetPickerCell pickerView](v5, "pickerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUSignificantEventOffsetPickerCell _updateOffsetDateComponentOptions](v5, "_updateOffsetDateComponentOptions");
    -[HUSignificantEventOffsetPickerCell contentView](v5, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSignificantEventOffsetPickerCell pickerView](v5, "pickerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v15);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSignificantEventOffsetPickerCell pickerView](v5, "pickerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSignificantEventOffsetPickerCell contentView](v5, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v21);

    -[HUSignificantEventOffsetPickerCell pickerView](v5, "pickerView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSignificantEventOffsetPickerCell contentView](v5, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v26);

    -[HUSignificantEventOffsetPickerCell pickerView](v5, "pickerView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "centerXAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSignificantEventOffsetPickerCell contentView](v5, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "layoutMarginsGuide");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "centerXAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v32);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v16);
  }
  return v5;
}

- (NSDateComponents)selectedOffset
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[HUSignificantEventOffsetPickerCell pickerView](self, "pickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedRowInComponent:", 0);

  if (v4 == -1)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  }
  else
  {
    -[HUSignificantEventOffsetPickerCell offsetDateComponentOptions](self, "offsetDateComponentOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSDateComponents *)v6;
}

- (void)setCurrentOffset:(id)a3
{
  id v5;
  NSDateComponents *currentOffset;
  NSDateComponents *v7;
  char v8;
  NSDateComponents *v9;

  v5 = a3;
  currentOffset = self->_currentOffset;
  v9 = (NSDateComponents *)v5;
  v7 = currentOffset;
  if (v7 == v9)
  {

  }
  else
  {
    if (v9)
    {
      v8 = -[NSDateComponents isEqual:](v9, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_currentOffset, a3);
    -[HUSignificantEventOffsetPickerCell _updateOffsetDateComponentOptions](self, "_updateOffsetDateComponentOptions");
  }
LABEL_8:

}

- (void)setSignificantEvent:(id)a3
{
  id v5;
  NSString *significantEvent;
  NSString *v7;
  char v8;
  void *v9;
  NSString *v10;

  v5 = a3;
  significantEvent = self->_significantEvent;
  v10 = (NSString *)v5;
  v7 = significantEvent;
  if (v7 == v10)
  {

    v9 = v10;
  }
  else
  {
    if (v10)
    {
      v8 = -[NSString isEqual:](v10, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_significantEvent, a3);
    -[HUSignificantEventOffsetPickerCell pickerView](self, "pickerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadAllComponents");
  }

LABEL_9:
}

+ (id)_defaultOffsetDateComponentOptions
{
  void *v2;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__HUSignificantEventOffsetPickerCell__defaultOffsetDateComponentOptions__block_invoke_2;
  v4[3] = &unk_1E6F58370;
  v5 = &__block_literal_global_157;
  __72__HUSignificantEventOffsetPickerCell__defaultOffsetDateComponentOptions__block_invoke_2((uint64_t)v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __72__HUSignificantEventOffsetPickerCell__defaultOffsetDateComponentOptions__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v5, "setHour:", a2);
  objc_msgSend(v5, "setMinute:", a3);
  return v5;
}

id __72__HUSignificantEventOffsetPickerCell__defaultOffsetDateComponentOptions__block_invoke_2(uint64_t a1)
{
  id v1;
  void *v2;
  id v3;
  _QWORD block[4];
  id v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__HUSignificantEventOffsetPickerCell__defaultOffsetDateComponentOptions__block_invoke_3;
  block[3] = &unk_1E6F4D9B0;
  v1 = *(id *)(a1 + 32);
  v6 = v1;
  if (_MergedGlobals_1_3 == -1)
  {
    v2 = v1;
  }
  else
  {
    dispatch_once(&_MergedGlobals_1_3, block);
    v2 = v6;
  }
  v3 = (id)qword_1ED57FAB0;

  return v3;
}

void __72__HUSignificantEventOffsetPickerCell__defaultOffsetDateComponentOptions__block_invoke_3(uint64_t a1)
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[17];

  v19[15] = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v18;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v17;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v16;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v15;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v14;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[9] = v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[10] = v7;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[11] = v8;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[12] = v9;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[13] = v10;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[14] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 15);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)qword_1ED57FAB0;
  qword_1ED57FAB0 = v12;

}

- (void)_updateOffsetDateComponentOptions
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  objc_msgSend((id)objc_opt_class(), "_defaultOffsetDateComponentOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0x7FFFFFFFFFFFFFFFLL;
  -[HUSignificantEventOffsetPickerCell currentOffset](self, "currentOffset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSignificantEventOffsetPickerCell.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.currentOffset != nil"));

  }
  -[HUSignificantEventOffsetPickerCell currentOffset](self, "currentOffset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v9, v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __71__HUSignificantEventOffsetPickerCell__updateOffsetDateComponentOptions__block_invoke;
  v20[3] = &unk_1E6F58398;
  v11 = v6;
  v21 = v11;
  v12 = v7;
  v22 = v12;
  v13 = v10;
  v23 = v13;
  v26 = &v28;
  v27 = &v32;
  v14 = v5;
  v24 = v14;
  v15 = v9;
  v25 = v15;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v20);
  if (!*((_BYTE *)v29 + 24))
  {
    objc_msgSend(v14, "addObject:", v15);
    v16 = objc_msgSend(v14, "count") - 1;
    v33[3] = v16;
  }
  -[HUSignificantEventOffsetPickerCell setOffsetDateComponentOptions:](self, "setOffsetDateComponentOptions:", v14);
  -[HUSignificantEventOffsetPickerCell pickerView](self, "pickerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "reloadAllComponents");

  -[HUSignificantEventOffsetPickerCell pickerView](self, "pickerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "selectRow:inComponent:animated:", v33[3], 0, 0);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

}

void __71__HUSignificantEventOffsetPickerCell__updateOffsetDateComponentOptions__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "dateByAddingComponents:toDate:options:", a2, *(_QWORD *)(a1 + 40), 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 48), "compare:");
  if (v7 == -1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 56), "insertObject:atIndex:", *(_QWORD *)(a1 + 64), a3);
    goto LABEL_5;
  }
  if (!v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
LABEL_5:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = a3;
    *a4 = 1;
  }

}

- (id)_titleForOffsetComponents:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CBA920];
  v5 = a3;
  -[HUSignificantEventOffsetPickerCell significantEvent](self, "significantEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_localizedStringForSignficantEvent:offset:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[HUSignificantEventOffsetPickerCell offsetDateComponentOptions](self, "offsetDateComponentOptions", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;

  -[HUSignificantEventOffsetPickerCell offsetDateComponentOptions](self, "offsetDateComponentOptions", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSignificantEventOffsetPickerCell _titleForOffsetComponents:](self, "_titleForOffsetComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  void *v6;
  char v7;
  void *v8;
  id v9;

  -[HUSignificantEventOffsetPickerCell delegate](self, "delegate", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[HUSignificantEventOffsetPickerCell delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[HUSignificantEventOffsetPickerCell selectedOffset](self, "selectedOffset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "significantEventOffsetPicker:didSelectOffset:", self, v8);

  }
}

- (NSString)significantEvent
{
  return self->_significantEvent;
}

- (NSDateComponents)currentOffset
{
  return self->_currentOffset;
}

- (HUSignificantEventOffsetPickerDelegate)delegate
{
  return (HUSignificantEventOffsetPickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setSelectedOffset:(id)a3
{
  objc_storeStrong((id *)&self->_selectedOffset, a3);
}

- (UIPickerView)pickerView
{
  return self->_pickerView;
}

- (NSArray)offsetDateComponentOptions
{
  return self->_offsetDateComponentOptions;
}

- (void)setOffsetDateComponentOptions:(id)a3
{
  objc_storeStrong((id *)&self->_offsetDateComponentOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offsetDateComponentOptions, 0);
  objc_storeStrong((id *)&self->_pickerView, 0);
  objc_storeStrong((id *)&self->_selectedOffset, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentOffset, 0);
  objc_storeStrong((id *)&self->_significantEvent, 0);
}

@end
