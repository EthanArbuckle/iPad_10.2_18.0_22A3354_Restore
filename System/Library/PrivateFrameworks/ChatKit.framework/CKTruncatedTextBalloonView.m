@implementation CKTruncatedTextBalloonView

- (CKTruncatedTextBalloonView)initWithFrame:(CGRect)a3
{
  CKTruncatedTextBalloonView *v3;
  CKTruncatedTextBalloonView *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKTruncatedTextBalloonView;
  v3 = -[CKHyperlinkBalloonView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKTextBalloonView textView](v3, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMaximumNumberOfLines:", 8);
    objc_msgSend(v6, "setLineBreakMode:", 4);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double MaxY;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  objc_super v34;
  _QWORD v35[2];
  CGRect v36;
  CGRect v37;

  v35[1] = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)CKTruncatedTextBalloonView;
  -[CKTextBalloonView layoutSubviews](&v34, sel_layoutSubviews);
  -[CKTextBalloonView textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CKTruncatedTextBalloonView chevron](self, "chevron");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;

  v36.origin.x = v5;
  v36.origin.y = v7;
  v36.size.width = v9;
  v36.size.height = v11;
  MaxY = CGRectGetMaxY(v36);
  -[CKBalloonView textAlignmentInsets](self, "textAlignmentInsets");
  v19 = MaxY - v18 - v16;
  v37.origin.x = v5;
  v37.origin.y = v7;
  v37.size.width = v9;
  v37.size.height = v11;
  v20 = CGRectGetMaxX(v37) - v14;
  if (!-[CKTruncatedTextBalloonView avoidTextLineBreaks](self, "avoidTextLineBreaks"))
  {
    objc_msgSend(v3, "textContainer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", v20, v19, v14, v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setExclusionPaths:", v23);

  }
  -[CKTruncatedTextBalloonView convertRect:fromView:](self, "convertRect:fromView:", v3, v20, v19, v14, v16);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  if (-[CKBalloonView hasSuggestedActionsMenu](self, "hasSuggestedActionsMenu"))
  {
    -[CKBalloonView suggestedActionsMenuAdditionalHeight](self, "suggestedActionsMenuAdditionalHeight");
    v25 = v25 + 0.0;
    v27 = v27 - v32;
  }
  -[CKTruncatedTextBalloonView chevron](self, "chevron");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFrame:", v25, v27, v29, v31);

}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  __int128 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  __int128 v14;
  double v15;
  double v16;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  CGSize result;

  v6 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
  v18 = *MEMORY[0x1E0CEB4B0];
  v19 = v6;
  v17.receiver = self;
  v17.super_class = (Class)CKTruncatedTextBalloonView;
  -[CKTextBalloonView sizeThatFits:textAlignmentInsets:](&v17, sel_sizeThatFits_textAlignmentInsets_, &v18, a3.width, a3.height);
  v8 = v7;
  v10 = v9;
  if (-[CKTruncatedTextBalloonView avoidTextLineBreaks](self, "avoidTextLineBreaks"))
  {
    -[CKTruncatedTextBalloonView chevron](self, "chevron");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "size");
    v8 = v8 + v13;

  }
  if (a4)
  {
    v14 = v19;
    *(_OWORD *)&a4->top = v18;
    *(_OWORD *)&a4->bottom = v14;
  }
  v15 = v8;
  v16 = v10;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)setWantsChevron:(BOOL)a3
{
  UIImageView *chevron;
  id v5;
  void *v6;
  void *v7;
  UIImageView *v8;
  UIImageView *v9;

  self->_wantsChevron = a3;
  chevron = self->_chevron;
  if (a3)
  {
    if (chevron)
      return;
    v5 = objc_alloc(MEMORY[0x1E0CEA658]);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chevronImageForColorType:", 0xFFFFFFFFLL);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UIImageView *)objc_msgSend(v5, "initWithImage:", v7);

    -[UIImageView setContentMode:](v8, "setContentMode:", 4);
    -[CKTruncatedTextBalloonView addSubview:](self, "addSubview:", v8);
  }
  else
  {
    if (!chevron)
      return;
    -[UIImageView removeFromSuperview](chevron, "removeFromSuperview");
    v8 = 0;
  }
  v9 = self->_chevron;
  self->_chevron = v8;

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a4, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  LOBYTE(v5) = v5 != objc_opt_class();

  return v5;
}

- (void)prepareForDisplay
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKTruncatedTextBalloonView;
  -[CKTextBalloonView prepareForDisplay](&v6, sel_prepareForDisplay);
  -[CKTruncatedTextBalloonView chevron](self, "chevron");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chevronImageForColorType:", -[CKBalloonView color](self, "color"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v5);

}

- (BOOL)avoidTextLineBreaks
{
  return self->_avoidTextLineBreaks;
}

- (void)setAvoidTextLineBreaks:(BOOL)a3
{
  self->_avoidTextLineBreaks = a3;
}

- (BOOL)wantsChevron
{
  return self->_wantsChevron;
}

- (UIImageView)chevron
{
  return self->_chevron;
}

- (void)setChevron:(id)a3
{
  objc_storeStrong((id *)&self->_chevron, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevron, 0);
}

- (void)configureForMessagePart:(id)a3
{
  id v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKTruncatedTextBalloonView;
  v4 = a3;
  -[CKTextBalloonView configureForMessagePart:](&v6, sel_configureForMessagePart_, v4);
  -[CKTruncatedTextBalloonView setWantsChevron:](self, "setWantsChevron:", objc_msgSend(v4, "isReplyContextPreview", v6.receiver, v6.super_class) ^ 1);
  v5 = objc_msgSend(v4, "isCorrupt");

  -[CKTruncatedTextBalloonView setAvoidTextLineBreaks:](self, "setAvoidTextLineBreaks:", v5);
}

@end
