@implementation CKMessageEntryHintView

- (CKMessageEntryHintView)initWithReferenceButton:(id)a3 coverInsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CKMessageEntryHintView *v14;
  CKMessageEntryHintView *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v9 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CKMessageEntryHintView;
  v10 = *MEMORY[0x1E0C9D648];
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v14 = -[CKMessageEntryHintView initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v11, v12, v13);
  v15 = v14;
  if (v14)
  {
    -[CKMessageEntryHintView setReferenceButton:](v14, "setReferenceButton:", v9);
    -[CKMessageEntryHintView setCoverInsets:](v15, "setCoverInsets:", top, left, bottom, right);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v10, v11, v12, v13);
    objc_msgSend(v16, "setTextAlignment:", 1);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "audioHintFont");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFont:", v18);

    objc_msgSend(v16, "setAdjustsFontSizeToFitWidth:", 1);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "theme");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "transcriptTextColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextColor:", v21);

    objc_msgSend(v16, "setBackgroundColor:", 0);
    objc_msgSend(v16, "setOpaque:", 0);
    -[CKMessageEntryHintView setHintLabel:](v15, "setHintLabel:", v16);
    -[CKMessageEntryHintView addSubview:](v15, "addSubview:", v16);
    -[CKMessageEntryHintView setHidden:](v15, "setHidden:", 1);
    objc_msgSend(v16, "setAlpha:", 0.0);

  }
  return v15;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CKMessageEntryHintView;
  -[CKMessageEntryHintView layoutSubviews](&v27, sel_layoutSubviews);
  -[CKMessageEntryHintView bounds](self, "bounds");
  v4 = v3;
  -[CKMessageEntryHintView coverInsets](self, "coverInsets");
  v6 = v4 + v5;
  -[CKMessageEntryHintView referenceButton](self, "referenceButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "superview");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryHintView convertRect:fromView:](self, "convertRect:fromView:", v16, v9, v11, v13, v15);
  v18 = v17;
  v20 = v19;
  v22 = v21;

  -[CKMessageEntryHintView hintLabel](self, "hintLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v25 = v24;

  -[CKMessageEntryHintView hintLabel](self, "hintLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", v6, v20 + floor((v22 - v25) * 0.5), v18 - v6, v25);

}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  int v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v5 = a3;
  v7 = a5;
  if (-[CKMessageEntryHintView isHidden](self, "isHidden") != v5)
  {
    -[CKMessageEntryHintView hintLabel](self, "hintLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((v5 & 1) != 0)
    {
      v10 = (void *)MEMORY[0x1E0CEABB0];
      v11 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __56__CKMessageEntryHintView_setHidden_animated_completion___block_invoke_3;
      v18[3] = &unk_1E274A208;
      v12 = &v19;
      v19 = v8;
      v16[0] = v11;
      v16[1] = 3221225472;
      v16[2] = __56__CKMessageEntryHintView_setHidden_animated_completion___block_invoke_4;
      v16[3] = &unk_1E274C780;
      v16[4] = self;
      v17 = v7;
      objc_msgSend(v10, "animateWithDuration:delay:options:animations:completion:", 327680, v18, v16, 0.25, 0.0);
      v13 = v17;
    }
    else
    {
      -[CKMessageEntryHintView setHidden:](self, "setHidden:", 0);
      v14 = (void *)MEMORY[0x1E0CEABB0];
      v15 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __56__CKMessageEntryHintView_setHidden_animated_completion___block_invoke;
      v22[3] = &unk_1E274A208;
      v12 = &v23;
      v23 = v9;
      v20[0] = v15;
      v20[1] = 3221225472;
      v20[2] = __56__CKMessageEntryHintView_setHidden_animated_completion___block_invoke_2;
      v20[3] = &unk_1E274C308;
      v21 = v7;
      objc_msgSend(v14, "animateWithDuration:delay:options:animations:completion:", 327680, v22, v20, 0.25, 0.0);
      v13 = v21;
    }

  }
}

uint64_t __56__CKMessageEntryHintView_setHidden_animated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __56__CKMessageEntryHintView_setHidden_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __56__CKMessageEntryHintView_setHidden_animated_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __56__CKMessageEntryHintView_setHidden_animated_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (UIButton)referenceButton
{
  return self->_referenceButton;
}

- (void)setReferenceButton:(id)a3
{
  objc_storeStrong((id *)&self->_referenceButton, a3);
}

- (UILabel)hintLabel
{
  return self->_hintLabel;
}

- (void)setHintLabel:(id)a3
{
  objc_storeStrong((id *)&self->_hintLabel, a3);
}

- (UIEdgeInsets)coverInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_coverInsets.top;
  left = self->_coverInsets.left;
  bottom = self->_coverInsets.bottom;
  right = self->_coverInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setCoverInsets:(UIEdgeInsets)a3
{
  self->_coverInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hintLabel, 0);
  objc_storeStrong((id *)&self->_referenceButton, 0);
}

@end
