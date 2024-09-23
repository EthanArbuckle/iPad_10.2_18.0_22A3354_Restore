@implementation HKEmergencyCardMultilineTextTableItem

- (id)_editableCell
{
  HKMedicalIDEditorMultilineStringCell *editableCell;
  HKMedicalIDEditorMultilineStringCell *v4;
  HKMedicalIDEditorMultilineStringCell *v5;
  void *v6;
  void *v7;
  _HKCustomInsetCellLayoutManager *v8;

  editableCell = self->_editableCell;
  if (!editableCell)
  {
    v4 = objc_alloc_init(HKMedicalIDEditorMultilineStringCell);
    v5 = self->_editableCell;
    self->_editableCell = v4;

    -[HKMedicalIDEditorMultilineStringCell setSeparatorInset:](self->_editableCell, "setSeparatorInset:", 0.0, 47.0, 0.0, 0.0);
    -[HKEmergencyCardTableItem title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicalIDEditorMultilineStringCell setLabel:](self->_editableCell, "setLabel:", v6);

    -[HKEmergencyCardMultilineTextTableItem _placeholderText](self, "_placeholderText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicalIDEditorMultilineStringCell setPlaceholder:](self->_editableCell, "setPlaceholder:", v7);

    -[HKMedicalIDEditorCell setEditDelegate:](self->_editableCell, "setEditDelegate:", self);
    -[HKMedicalIDEditorMultilineStringCell setHeightChangeDelegate:](self->_editableCell, "setHeightChangeDelegate:", self);
    v8 = objc_alloc_init(_HKCustomInsetCellLayoutManager);
    -[_HKCustomInsetCellLayoutManager setTopInset:](v8, "setTopInset:", 12.0);
    -[HKMedicalIDEditorMultilineStringCell setLayoutManager:](self->_editableCell, "setLayoutManager:", v8);
    -[HKEmergencyCardMultilineTextTableItem _configureEditableCell:](self, "_configureEditableCell:", self->_editableCell);

    editableCell = self->_editableCell;
  }
  return editableCell;
}

- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  if (-[HKEmergencyCardTableItem isInEditMode](self, "isInEditMode"))
  {
    -[HKEmergencyCardMultilineTextTableItem _editableCell](self, "_editableCell");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[_HKMedicalIDMultilineStringCell defaultReuseIdentifier](_HKMedicalIDMultilineStringCell, "defaultReuseIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKEmergencyCardTableItem title](self, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    -[HKEmergencyCardMultilineTextTableItem _multilineStringValue](self, "_multilineStringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "detailLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v10);

  }
  return v6;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndex:(int64_t)a4
{
  id v5;
  double v6;
  double v7;
  double v8;

  v5 = a3;
  if (-[HKEmergencyCardTableItem isInEditMode](self, "isInEditMode"))
  {
    objc_msgSend(v5, "frame");
    -[HKEmergencyCardMultilineTextTableItem _cellFittedHeightWithWidth:](self, "_cellFittedHeightWithWidth:", v6);
    v8 = v7;
  }
  else
  {
    v8 = *MEMORY[0x1E0DC53D8];
  }

  return v8;
}

- (double)tableView:(id)a3 heightForRowAtIndex:(int64_t)a4
{
  id v5;
  double v6;
  double v7;
  double v8;

  v5 = a3;
  if (-[HKEmergencyCardTableItem isInEditMode](self, "isInEditMode"))
  {
    objc_msgSend(v5, "frame");
    -[HKEmergencyCardMultilineTextTableItem _cellFittedHeightWithWidth:](self, "_cellFittedHeightWithWidth:", v6);
    v8 = v7;
  }
  else
  {
    v8 = *MEMORY[0x1E0DC53D8];
  }

  return v8;
}

- (double)_cellFittedHeightWithWidth:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[HKEmergencyCardMultilineTextTableItem _editableCell](self, "_editableCell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

  -[HKEmergencyCardMultilineTextTableItem _editableCell](self, "_editableCell");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", a3, 1.79769313e308);
  v8 = v7;

  return v8;
}

- (void)setData:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKEmergencyCardMultilineTextTableItem;
  -[HKEmergencyCardTableItem setData:](&v6, sel_setData_, a3);
  if (-[HKEmergencyCardTableItem isInEditMode](self, "isInEditMode"))
  {
    -[HKEmergencyCardMultilineTextTableItem _editableCell](self, "_editableCell");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKEmergencyCardMultilineTextTableItem _multilineStringValue](self, "_multilineStringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setStringValue:", v5);

  }
}

- (void)medicalIDEditorCellDidChangeValue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HKEmergencyCardMultilineTextTableItem _editableCell](self, "_editableCell", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "length"))
  {

    v6 = 0;
  }
  -[HKEmergencyCardMultilineTextTableItem _updateMultilineStringValueWithValue:](self, "_updateMultilineStringValueWithValue:", v6);

}

- (void)medicalIDEditorCell:(id)a3 didChangeHeight:(double)a4 keepRectVisible:(CGRect)a5 inView:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  HKEmergencyCardRowHeightChangeDelegate **p_rowHeightChangeDelegate;
  id v12;
  id WeakRetained;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  p_rowHeightChangeDelegate = &self->_rowHeightChangeDelegate;
  v12 = a6;
  WeakRetained = objc_loadWeakRetained((id *)p_rowHeightChangeDelegate);
  objc_msgSend(WeakRetained, "tableItem:heightDidChangeForRowIndex:keepRectVisible:inView:", self, 0, v12, x, y, width, height);

}

- (void)medicalIDEditorCellDidBeginEditing:(id)a3 keepRectVisible:(CGRect)a4 inView:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  HKEmergencyCardRowHeightChangeDelegate **p_rowHeightChangeDelegate;
  id v11;
  id WeakRetained;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  p_rowHeightChangeDelegate = &self->_rowHeightChangeDelegate;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_rowHeightChangeDelegate);
  objc_msgSend(WeakRetained, "tableItemDidBeginEditing:keepRectVisible:inView:", self, v11, x, y, width, height);

}

- (void)medicalIDEditorCellDidChangeSelection:(id)a3 keepRectVisible:(CGRect)a4 inView:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  HKEmergencyCardRowHeightChangeDelegate **p_rowHeightChangeDelegate;
  id v11;
  id WeakRetained;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  p_rowHeightChangeDelegate = &self->_rowHeightChangeDelegate;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_rowHeightChangeDelegate);
  objc_msgSend(WeakRetained, "tableItemDidChangeSelection:keepRectVisible:inView:", self, v11, x, y, width, height);

}

- (void)commitEditing
{
  id v2;

  -[HKEmergencyCardMultilineTextTableItem _editableCell](self, "_editableCell");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commitEditing");

}

- (HKEmergencyCardRowHeightChangeDelegate)rowHeightChangeDelegate
{
  return (HKEmergencyCardRowHeightChangeDelegate *)objc_loadWeakRetained((id *)&self->_rowHeightChangeDelegate);
}

- (void)setRowHeightChangeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_rowHeightChangeDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rowHeightChangeDelegate);
  objc_storeStrong((id *)&self->_editableCell, 0);
}

- (id)_multilineStringValue
{
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  return 0;
}

- (void)_updateMultilineStringValueWithValue:(id)a3
{
  OUTLINED_FUNCTION_0_9();
  NSRequestConcreteImplementation();
}

- (id)_placeholderText
{
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  return 0;
}

@end
