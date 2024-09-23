@implementation CKTranscriptMomentShareLabelCell

- (CKTranscriptMomentShareLabelCell)initWithFrame:(CGRect)a3
{
  CKTranscriptMomentShareLabelCell *v3;
  uint64_t v4;
  UILabel *label;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptMomentShareLabelCell;
  v3 = -[CKTranscriptAbstractLabelCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    _CreateLabel();
    v4 = objc_claimAutoreleasedReturnValue();
    label = v3->_label;
    v3->_label = (UILabel *)v4;

    -[CKEditableCollectionViewCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v3->_label);

  }
  return v3;
}

+ (id)reuseIdentifier
{
  return CFSTR("CKTranscriptMomentShareLabelCell");
}

+ (CGSize)sizeThatFits:(CGSize)a3 attributedText:(id)a4 displayScale:(double)a5
{
  double width;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  width = a3.width;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    _CreateLabel();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAttributedText:", v6);
    objc_msgSend(v7, "sizeThatFits:", width, 1.79769313e308);
    v9 = v8;
    v11 = v10;

  }
  else
  {
    v9 = *MEMORY[0x1E0C9D820];
    v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)setAttributedText:(id)a3
{
  -[UILabel setAttributedText:](self->_label, "setAttributedText:", a3);
}

- (id)attributedText
{
  return -[UILabel attributedText](self->_label, "attributedText");
}

- (id)cellView
{
  return self->_label;
}

- (id)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  _BOOL8 v9;
  id v12;
  void *v13;
  objc_super v14;

  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKTranscriptMomentShareLabelCell;
  v12 = a3;
  -[CKTranscriptCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v14, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, v12, a4, v9, a7, a6);
  objc_msgSend(v12, "transcriptText", v14.receiver, v14.super_class);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKTranscriptMomentShareLabelCell setAttributedText:](self, "setAttributedText:", v13);
}

@end
