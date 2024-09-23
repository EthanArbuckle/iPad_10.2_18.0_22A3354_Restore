@implementation CKMessageAcknowledgmentPickerBarItemView

- (CKMessageAcknowledgmentPickerBarItemView)initWithFrame:(CGRect)a3
{
  CKMessageAcknowledgmentPickerBarItemView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKMessageAcknowledgmentPickerBarItemView;
  result = -[CKMessageAcknowledgmentPickerBarItemView initWithFrame:](&v4, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (result)
    result->_selected = 0;
  return result;
}

- (void)configureWithMessageAcknowledgmentDescriptor:(id)a3 initiallySelected:(BOOL)a4
{
  _BOOL8 v4;
  CKMessageAcknowledgmentDraftDescriptor *draft;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CKAcknowledgmentGlyphView *v12;
  CKAcknowledgmentGlyphView *acknowledgmentGlyphView;
  void *v14;
  id v15;

  v4 = a4;
  v15 = a3;
  objc_storeStrong((id *)&self->_draft, a3);
  draft = self->_draft;
  if (v4)
    -[CKMessageAcknowledgmentDraftDescriptor selectedAcknowledgmentImageColor](draft, "selectedAcknowledgmentImageColor");
  else
    -[CKMessageAcknowledgmentDraftDescriptor acknowledgmentImageColor](draft, "acknowledgmentImageColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "theme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "ckAcknowledgementColorTypeForColor:", v8);

  +[CKAcknowledgmentGlyphView glyphViewForAcknowledgmentType:glyphColor:](CKAcknowledgmentGlyphView, "glyphViewForAcknowledgmentType:glyphColor:", objc_msgSend(v15, "messageAcknowledgmentType"), v11);
  v12 = (CKAcknowledgmentGlyphView *)objc_claimAutoreleasedReturnValue();
  acknowledgmentGlyphView = self->_acknowledgmentGlyphView;
  self->_acknowledgmentGlyphView = v12;

  -[CKMessageAcknowledgmentPickerBarItemView addSubview:](self, "addSubview:", self->_acknowledgmentGlyphView);
  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addTarget:action:forEvents:", self, sel_itemButtonTapped_, 64);
  -[CKMessageAcknowledgmentPickerBarItemView addSubview:](self, "addSubview:", v14);
  -[CKMessageAcknowledgmentPickerBarItemView setItemButton:](self, "setItemButton:", v14);
  self->_messageAcknowledgmentType = CKDeselectedAcknowledgmentTypeForAcknowledgmentType(-[CKMessageAcknowledgmentDraftDescriptor messageAcknowledgmentType](self->_draft, "messageAcknowledgmentType"));
  -[CKMessageAcknowledgmentPickerBarItemView setSelected:](self, "setSelected:", v4);

}

- (void)itemButtonTapped:(id)a3
{
  id v4;

  -[CKMessageAcknowledgmentPickerBarItemView setSelected:](self, "setSelected:", !self->_selected);
  -[CKMessageAcknowledgmentPickerBarItemView delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pickerBarItemViewSelectionDidChange:", self);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CKMessageAcknowledgmentPickerBarItemView;
  -[CKMessageAcknowledgmentPickerBarItemView layoutSubviews](&v19, sel_layoutSubviews);
  -[CKAcknowledgmentGlyphView frame](self->_acknowledgmentGlyphView, "frame");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageAcknowledgmentPickerBarAcknowledgmentImageSize");
  v5 = v4;
  v7 = v6;

  -[CKMessageAcknowledgmentPickerBarItemView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[CKMessageAcknowledgmentPickerBarItemView traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "displayScale");
  -[CKAcknowledgmentGlyphView setFrame:](self->_acknowledgmentGlyphView, "setFrame:", 1.0 / v17 * (v9 * v17 + floor((v13 * v17 - v5 * v17) * 0.5)), 1.0 / v17 * (v11 * v17 + floor((v15 * v17 - v7 * v17) * 0.5)), v5 * v17 * (1.0 / v17), v7 * v17 * (1.0 / v17));

  -[CKMessageAcknowledgmentPickerBarItemView itemButton](self, "itemButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageAcknowledgmentPickerBarItemView bounds](self, "bounds");
  objc_msgSend(v18, "setFrame:");

}

- (void)setSelected:(BOOL)a3
{
  unint64_t v4;
  int64_t v5;

  self->_selected = a3;
  if (a3)
  {
    v4 = self->_messageAcknowledgmentType - 2000;
    v5 = -[CKMessageAcknowledgmentDraftDescriptor messageAcknowledgmentType](self->_draft, "messageAcknowledgmentType");
    if (v4 <= 5)
      v5 = CKDeselectedAcknowledgmentTypeForAcknowledgmentType(v5);
    self->_messageAcknowledgmentType = v5;
  }
  else
  {
    self->_messageAcknowledgmentType = CKDeselectedAcknowledgmentTypeForAcknowledgmentType(-[CKMessageAcknowledgmentDraftDescriptor messageAcknowledgmentType](self->_draft, "messageAcknowledgmentType"));
  }
  -[CKMessageAcknowledgmentPickerBarItemView setNeedsLayout](self, "setNeedsLayout");
  -[CKMessageAcknowledgmentPickerBarItemView layoutIfNeeded](self, "layoutIfNeeded");
}

- (BOOL)displaySelected
{
  _BOOL4 v3;

  v3 = -[CKMessageAcknowledgmentPickerBarItemView isSelected](self, "isSelected");
  if (v3)
    LOBYTE(v3) = (unint64_t)(-[CKMessageAcknowledgmentPickerBarItemView messageAcknowledgmentType](self, "messageAcknowledgmentType")- 2000) < 6;
  return v3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (int64_t)messageAcknowledgmentType
{
  return self->_messageAcknowledgmentType;
}

- (CKMessageAcknowledgmentPickerBarItemViewDelegate)delegate
{
  return (CKMessageAcknowledgmentPickerBarItemViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKAcknowledgmentGlyphView)acknowledgmentGlyphView
{
  return self->_acknowledgmentGlyphView;
}

- (UIButton)itemButton
{
  return self->_itemButton;
}

- (void)setItemButton:(id)a3
{
  objc_storeStrong((id *)&self->_itemButton, a3);
}

- (CKMessageAcknowledgmentDraftDescriptor)draft
{
  return self->_draft;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draft, 0);
  objc_storeStrong((id *)&self->_itemButton, 0);
  objc_storeStrong((id *)&self->_acknowledgmentGlyphView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
