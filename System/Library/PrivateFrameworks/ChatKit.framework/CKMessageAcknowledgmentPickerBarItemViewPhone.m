@implementation CKMessageAcknowledgmentPickerBarItemViewPhone

- (void)layoutSubviews
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  CGRect v14;

  v13.receiver = self;
  v13.super_class = (Class)CKMessageAcknowledgmentPickerBarItemViewPhone;
  -[CKMessageAcknowledgmentPickerBarItemView layoutSubviews](&v13, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageAcknowledgmentPickerBarItemViewPhone setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = -[CKMessageAcknowledgmentPickerBarItemView displaySelected](self, "displaySelected");
  -[CKMessageAcknowledgmentPickerBarItemView acknowledgmentGlyphView](self, "acknowledgmentGlyphView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageAcknowledgmentPickerBarItemView draft](self, "draft");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
    objc_msgSend(v6, "selectedAcknowledgmentImageColor");
  else
    objc_msgSend(v6, "acknowledgmentImageColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGlyphColor:", v8);

  -[CKMessageAcknowledgmentPickerBarItemViewPhone selectionLayer](self, "selectionLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageAcknowledgmentPickerBarItemViewPhone bounds](self, "bounds");
  objc_msgSend(v9, "setFrame:");

  -[CKMessageAcknowledgmentPickerBarItemViewPhone selectionLayer](self, "selectionLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageAcknowledgmentPickerBarItemViewPhone bounds](self, "bounds");
  objc_msgSend(v10, "setCornerRadius:", ceil(CGRectGetWidth(v14) * 0.5));

  -[CKMessageAcknowledgmentPickerBarItemView acknowledgmentGlyphView](self, "acknowledgmentGlyphView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageAcknowledgmentPickerBarItemViewPhone bringSubviewToFront:](self, "bringSubviewToFront:", v11);

  -[CKMessageAcknowledgmentPickerBarItemView itemButton](self, "itemButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageAcknowledgmentPickerBarItemViewPhone bringSubviewToFront:](self, "bringSubviewToFront:", v12);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  BOOL v17;
  objc_super v18;
  CGRect v19;

  v3 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CKMessageAcknowledgmentPickerBarItemViewPhone;
  -[CKMessageAcknowledgmentPickerBarItemView setSelected:](&v18, sel_setSelected_);
  if (v3)
  {
    -[CKMessageAcknowledgmentPickerBarItemViewPhone selectionLayer](self, "selectionLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = 1.0;
    v7 = 0.0;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageAcknowledgmentPickerBarItemViewPhone bounds](self, "bounds");
      objc_msgSend(v8, "setFrame:");
      -[CKMessageAcknowledgmentPickerBarItemView draft](self, "draft");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "selectedBalloonColor");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v8, "setBackgroundColor:", objc_msgSend(v10, "CGColor"));

      -[CKMessageAcknowledgmentPickerBarItemViewPhone bounds](self, "bounds");
      objc_msgSend(v8, "setCornerRadius:", ceil(CGRectGetWidth(v19) * 0.5));
      -[CKMessageAcknowledgmentPickerBarItemViewPhone layer](self, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSublayer:", v8);

      -[CKMessageAcknowledgmentPickerBarItemViewPhone setSelectionLayer:](self, "setSelectionLayer:", v8);
    }
  }
  else
  {
    v6 = 0.0;
    v7 = 1.0;
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 1.0);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__CKMessageAcknowledgmentPickerBarItemViewPhone_setSelected___block_invoke;
  v16[3] = &unk_1E274CA88;
  v17 = v3;
  v16[4] = self;
  objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v16);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFromValue:", v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setToValue:", v14);

  objc_msgSend(v12, "setMass:", 1.0);
  objc_msgSend(v12, "setStiffness:", 350.0);
  objc_msgSend(v12, "setDamping:", 25.0);
  objc_msgSend(v12, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  -[CKMessageAcknowledgmentPickerBarItemViewPhone selectionLayer](self, "selectionLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAnimation:forKey:", v12, CFSTR("transform.scale.xy"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

void __61__CKMessageAcknowledgmentPickerBarItemViewPhone_setSelected___block_invoke(uint64_t a1)
{
  id v1;

  if (!*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "selectionLayer");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setHidden:", 1);

  }
}

- (CALayer)selectionLayer
{
  return self->_selectionLayer;
}

- (void)setSelectionLayer:(id)a3
{
  objc_storeStrong((id *)&self->_selectionLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionLayer, 0);
}

@end
