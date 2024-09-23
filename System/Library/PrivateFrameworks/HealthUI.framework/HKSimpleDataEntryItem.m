@implementation HKSimpleDataEntryItem

- (void)beginEditing
{
  id v2;

  -[HKSimpleDataEntryItem cell](self, "cell");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginEditing");

}

- (id)accessoryToolbar
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3E68]);
  objc_msgSend(v3, "setAutoresizingMask:", 18);
  -[HKSimpleDataEntryItem toolbarDelegate](self, "toolbarDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  -[HKSimpleDataEntryItem toolbarDelegate](self, "toolbarDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  -[HKSimpleDataEntryItem toolbarDelegate](self, "toolbarDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((v5 & 1) != 0)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 103, self, sel_toolbarPrevButtonPressed_);
    HKHealthTintColor();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTintColor:", v12);

    objc_msgSend(v10, "addObject:", v11);
    if ((v7 & 1) == 0)
      goto LABEL_6;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
    objc_msgSend(v13, "setWidth:", 1.0);
    objc_msgSend(v10, "addObject:", v13);

  }
  else if ((v7 & 1) == 0)
  {
    goto LABEL_6;
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 104, self, sel_toolbarNextButtonPressed_);
  HKHealthTintColor();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTintColor:", v15);

  objc_msgSend(v10, "addObject:", v14);
LABEL_6:
  if ((v9 & 1) != 0)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_toolbarDoneButtonPressed_);
    HKHealthTintColor();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTintColor:", v18);

    v21[0] = v16;
    v21[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v19);

  }
  objc_msgSend(v3, "setItems:", v10);

  return v3;
}

- (void)toolbarPrevButtonPressed:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[HKSimpleDataEntryItem toolbarDelegate](self, "toolbarDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[HKSimpleDataEntryItem toolbarDelegate](self, "toolbarDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataEntryItemPrevPressed:", self);

  }
}

- (void)toolbarNextButtonPressed:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[HKSimpleDataEntryItem toolbarDelegate](self, "toolbarDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[HKSimpleDataEntryItem toolbarDelegate](self, "toolbarDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataEntryItemNextPressed:", self);

  }
}

- (void)toolbarDoneButtonPressed:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[HKSimpleDataEntryItem toolbarDelegate](self, "toolbarDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[HKSimpleDataEntryItem toolbarDelegate](self, "toolbarDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataEntryItemDonePressed:", self);

  }
}

- (HKSimpleDataEntryItemDelegate)delegate
{
  return (HKSimpleDataEntryItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HKSimpleDataEntryItemToolbarDelegate)toolbarDelegate
{
  return (HKSimpleDataEntryItemToolbarDelegate *)objc_loadWeakRetained((id *)&self->_toolbarDelegate);
}

- (void)setToolbarDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_toolbarDelegate, a3);
}

- (unint64_t)placeholderType
{
  return self->_placeholderType;
}

- (void)setPlaceholderType:(unint64_t)a3
{
  self->_placeholderType = a3;
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void)setAccessibilityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_destroyWeak((id *)&self->_toolbarDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)formattedKeyAndValue
{
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)cell
{
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  return 0;
}

- (void)updateCellDisplay
{
  OUTLINED_FUNCTION_0_9();
  NSRequestConcreteImplementation();
}

@end
