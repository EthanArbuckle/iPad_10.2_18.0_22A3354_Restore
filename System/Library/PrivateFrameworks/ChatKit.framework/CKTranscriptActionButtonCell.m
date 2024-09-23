@implementation CKTranscriptActionButtonCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  _BOOL8 v9;
  id v12;
  void *v13;
  objc_super v14;

  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKTranscriptActionButtonCell;
  v12 = a3;
  -[CKTranscriptCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v14, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, v12, a4, v9, a7, a6);
  objc_msgSend(v12, "transcriptText", v14.receiver, v14.super_class);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKTranscriptActionButtonCell setAttributedText:](self, "setAttributedText:", v13);
}

- (CKTranscriptActionButtonCell)initWithFrame:(CGRect)a3
{
  CKTranscriptActionButtonCell *v3;
  uint64_t v4;
  UIButton *actionButton;
  UIButton *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CKTranscriptActionButtonCell;
  v3 = -[CKTranscriptAbstractLabelCell initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    _CreateActionButton();
    v4 = objc_claimAutoreleasedReturnValue();
    actionButton = v3->_actionButton;
    v3->_actionButton = (UIButton *)v4;

    -[UIButton addTarget:action:forControlEvents:](v3->_actionButton, "addTarget:action:forControlEvents:", v3, sel_buttonPrimaryActionTriggered_, 0x2000);
    v6 = v3->_actionButton;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "smallTranscriptSpace");
    v9 = -v8;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "smallTranscriptSpace");
    v12 = -v11;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "smallTranscriptSpace");
    v15 = -v14;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "smallTranscriptSpace");
    -[UIButton _setTouchInsets:](v6, "_setTouchInsets:", v9, v12, v15, -v17);

    -[CKEditableCollectionViewCell contentView](v3, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v3->_actionButton);

  }
  return v3;
}

+ (id)reuseIdentifier
{
  return CFSTR("CKTranscriptActionButtonCell");
}

+ (CGSize)sizeThatFits:(CGSize)a3 attributedText:(id)a4 displayScale:(double)a5
{
  double width;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  width = a3.width;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    _CreateActionButton();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAttributedTitle:", v6);
    objc_msgSend(v7, "setConfiguration:", v8);
    objc_msgSend(v7, "sizeThatFits:", width, 1.79769313e308);
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v10 = *MEMORY[0x1E0C9D820];
    v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)setAttributedText:(id)a3
{
  UIButton *actionButton;
  id v5;
  id v6;

  actionButton = self->_actionButton;
  v5 = a3;
  -[UIButton configuration](actionButton, "configuration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttributedTitle:", v5);

  -[UIButton setConfiguration:](self->_actionButton, "setConfiguration:", v6);
}

- (id)attributedText
{
  void *v2;
  void *v3;

  -[UIButton configuration](self->_actionButton, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cellView
{
  return self->_actionButton;
}

- (id)label
{
  return -[UIButton titleLabel](self->_actionButton, "titleLabel");
}

- (void)buttonPrimaryActionTriggered:(id)a3
{
  id v4;

  -[CKTranscriptActionButtonCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didTapTranscriptActionButtonCell:", self);

}

- (CKTranscriptActionButtonCellDelegate)delegate
{
  return (CKTranscriptActionButtonCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actionButton, 0);
}

@end
