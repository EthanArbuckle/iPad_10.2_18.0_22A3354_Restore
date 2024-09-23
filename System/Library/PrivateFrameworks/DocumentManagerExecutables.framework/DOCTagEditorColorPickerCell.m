@implementation DOCTagEditorColorPickerCell

- (DOCTagEditorColorPickerCell)initWithFrame:(CGRect)a3
{
  DOCTagEditorColorPickerCell *v3;
  DOCHorizontalTagDotPicker *v4;
  DOCHorizontalTagDotPicker *colorPickerView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DOCTagEditorColorPickerCell;
  v3 = -[DOCTagEditorColorPickerCell initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(DOCHorizontalTagDotPicker);
    colorPickerView = v3->_colorPickerView;
    v3->_colorPickerView = v4;

    -[DOCHorizontalTagDotPicker setTranslatesAutoresizingMaskIntoConstraints:](v3->_colorPickerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[DOCTagEditorColorPickerCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagEditorColorPickerCell colorPickerView](v3, "colorPickerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v7);

    -[DOCTagEditorColorPickerCell colorPickerView](v3, "colorPickerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[DOCTagAppearance makerUI](DOCTagAppearance, "makerUI");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rowOfTagsContentInsets");
    DOCConstraintsToResizeWithSuperviewSafeArea();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    DOCConstraintsWithPriority();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v11);
    -[DOCTagEditorColorPickerCell setHoverStyle:](v3, "setHoverStyle:", 0);

  }
  return v3;
}

- (int64_t)selectedColor
{
  void *v2;
  int64_t v3;

  -[DOCTagEditorColorPickerCell colorPickerView](self, "colorPickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectedTagColor");

  return v3;
}

- (UIGestureRecognizer)changeColorPanGestureRecognizer
{
  void *v2;
  void *v3;

  -[DOCTagEditorColorPickerCell colorPickerView](self, "colorPickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changeColorPanGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIGestureRecognizer *)v3;
}

- (DOCHorizontalTagDotPicker)colorPickerView
{
  return self->_colorPickerView;
}

- (void)setColorPickerView:(id)a3
{
  objc_storeStrong((id *)&self->_colorPickerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPickerView, 0);
}

@end
