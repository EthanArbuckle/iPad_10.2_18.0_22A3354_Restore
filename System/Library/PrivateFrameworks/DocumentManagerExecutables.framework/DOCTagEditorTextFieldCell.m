@implementation DOCTagEditorTextFieldCell

- (DOCTagEditorTextFieldCell)initWithFrame:(CGRect)a3
{
  DOCTagEditorTextFieldCell *v3;
  uint64_t v4;
  DOCTagPickerCellAppearanceProviding *appearance;
  DOCAddTagView *v6;
  DOCAddTagView *addTagView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)DOCTagEditorTextFieldCell;
  v3 = -[DOCTagEditorTextFieldCell initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[DOCTagAppearance pickerList](DOCTagAppearance, "pickerList");
    v4 = objc_claimAutoreleasedReturnValue();
    appearance = v3->_appearance;
    v3->_appearance = (DOCTagPickerCellAppearanceProviding *)v4;

    v6 = objc_alloc_init(DOCAddTagView);
    addTagView = v3->_addTagView;
    v3->_addTagView = v6;

    -[DOCAddTagView setTranslatesAutoresizingMaskIntoConstraints:](v3->_addTagView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[DOCTagEditorTextFieldCell contentView](v3, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagEditorTextFieldCell addTagView](v3, "addTagView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

    -[DOCTagEditorTextFieldCell addTagView](v3, "addTagView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagPickerCellAppearanceProviding cellExternalMargins](v3->_appearance, "cellExternalMargins");
    DOCConstraintsToResizeWithSuperviewSafeArea();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    DOCConstraintsWithPriority();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v12);
    -[DOCTagEditorTextFieldCell updateHoverEffects](v3, "updateHoverEffects");

  }
  return v3;
}

- (void)updateHoverEffects
{
  -[DOCTagEditorTextFieldCell setHoverStyle:](self, "setHoverStyle:", 0);
  -[DOCAddTagView updateHoverEffects](self->_addTagView, "updateHoverEffects");
}

- (DOCAddTagView)addTagView
{
  return self->_addTagView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addTagView, 0);
  objc_storeStrong((id *)&self->_appearance, 0);
}

@end
