@implementation CKMessageHighlightButton

- (CKMessageHighlightButton)initWithCoder:(id)a3
{
  return -[CKMessageHighlightButton initWithInitialState:](self, "initWithInitialState:", 0);
}

- (CKMessageHighlightButton)initWithFrame:(CGRect)a3
{
  return -[CKMessageHighlightButton initWithInitialState:](self, "initWithInitialState:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CKMessageHighlightButton)initWithInitialState:(BOOL)a3
{
  _BOOL4 v3;
  CKMessageHighlightButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  UIView *backgroundColorView;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  UIVisualEffectView *blurEffectView;
  uint64_t v23;
  CAShapeLayer *blurEffectMaskLayer;
  void *v25;
  uint64_t v26;
  UIView *backgroundColorViewForCrossFade;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  UIImageView *glyphView;
  uint64_t v35;
  UIImageView *glyphViewForCrossFade;
  void *v37;
  double v38;
  uint64_t v39;
  UIButton *button;
  UIButton *v41;
  void *v42;
  void *v44;
  void *v45;
  objc_super v46;

  v3 = a3;
  v46.receiver = self;
  v46.super_class = (Class)CKMessageHighlightButton;
  v4 = -[CKMessageHighlightButton initWithFrame:](&v46, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  if (v4)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messageHighlightButtonUnselectedBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "messageHighlightButtonSelectedBackgroundColor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageHighlightButtonImageHighlightOn");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageHighlightButtonImageHighlightOff");
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v12 = *MEMORY[0x1E0C9D648];
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v16 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], v13, v14, v15);
    backgroundColorView = v4->_backgroundColorView;
    v4->_backgroundColorView = (UIView *)v16;

    -[CKMessageHighlightButton addSubview:](v4, "addSubview:", v4->_backgroundColorView);
    v18 = (void *)MEMORY[0x1E0CEA398];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "replyButtonBackgroundBlurRadius");
    objc_msgSend(v18, "effectWithBlurRadius:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v20);
    blurEffectView = v4->_blurEffectView;
    v4->_blurEffectView = (UIVisualEffectView *)v21;

    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v23 = objc_claimAutoreleasedReturnValue();
    blurEffectMaskLayer = v4->_blurEffectMaskLayer;
    v4->_blurEffectMaskLayer = (CAShapeLayer *)v23;

    -[UIVisualEffectView setBackgroundColor:](v4->_blurEffectView, "setBackgroundColor:", v6);
    -[UIView addSubview:](v4->_backgroundColorView, "addSubview:", v4->_blurEffectView);
    -[UIView layer](v4->_backgroundColorView, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setMask:", v4->_blurEffectMaskLayer);

    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v12, v13, v14, v15);
    backgroundColorViewForCrossFade = v4->_backgroundColorViewForCrossFade;
    v4->_backgroundColorViewForCrossFade = (UIView *)v26;

    -[UIView layer](v4->_backgroundColorViewForCrossFade, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v29) = 0;
    objc_msgSend(v28, "setOpacity:", v29);

    if (v3)
      v30 = v6;
    else
      v30 = v45;
    if (v3)
      v31 = v44;
    else
      v31 = (void *)v10;
    v32 = (void *)v10;
    -[UIView setBackgroundColor:](v4->_backgroundColorViewForCrossFade, "setBackgroundColor:", v30);
    -[CKMessageHighlightButton addSubview:](v4, "addSubview:", v4->_backgroundColorViewForCrossFade);
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v31);
    glyphView = v4->_glyphView;
    v4->_glyphView = (UIImageView *)v33;

    -[UIImageView setContentMode:](v4->_glyphView, "setContentMode:", 1);
    -[CKMessageHighlightButton addSubview:](v4, "addSubview:", v4->_glyphView);
    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v31);
    glyphViewForCrossFade = v4->_glyphViewForCrossFade;
    v4->_glyphViewForCrossFade = (UIImageView *)v35;

    -[UIImageView layer](v4->_glyphViewForCrossFade, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v38) = 0;
    objc_msgSend(v37, "setOpacity:", v38);

    -[CKMessageHighlightButton addSubview:](v4, "addSubview:", v4->_glyphViewForCrossFade);
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v39 = objc_claimAutoreleasedReturnValue();
    button = v4->_button;
    v4->_button = (UIButton *)v39;

    v41 = v4->_button;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "messageHighlightButtonInsets");
    -[UIButton setContentEdgeInsets:](v41, "setContentEdgeInsets:");

    -[UIButton addTarget:action:forControlEvents:](v4->_button, "addTarget:action:forControlEvents:", v4, sel_buttonWasPressed_, 64);
    -[UIButton setEnabled:](v4->_button, "setEnabled:", 1);
    -[CKMessageHighlightButton addSubview:](v4, "addSubview:", v4->_button);
    v4->_isHighlighted = v3;
    -[CKMessageHighlightButton setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 1);

  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CAShapeLayer *blurEffectMaskLayer;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  id v43;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)CKMessageHighlightButton;
  -[CKMessageHighlightButton layoutSubviews](&v44, sel_layoutSubviews);
  -[CKMessageHighlightButton buttonSize](self, "buttonSize");
  v4 = v3;
  v6 = v5;
  -[CKMessageHighlightButton bounds](self, "bounds");
  v9 = v8 + floor((v7 - v4) * 0.5);
  v12 = v11 + floor((v10 - v6) * 0.5);
  -[CKMessageHighlightButton traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayScale");
  v15 = round(v14 * v9) / v14;
  v16 = round(v14 * v12) / v14;
  v17 = round(v4 * v14) / v14;
  v18 = round(v6 * v14) / v14;

  -[UIView layer](self->_backgroundColorView, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCornerRadius:", v18 * 0.5);

  -[UIView setFrame:](self->_backgroundColorView, "setFrame:", v15, v16, v17, v18);
  -[UIView layer](self->_backgroundColorViewForCrossFade, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCornerRadius:", v18 * 0.5);

  -[UIView setFrame:](self->_backgroundColorViewForCrossFade, "setFrame:", v15, v16, v17, v18);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "messageHighlightButtonGlyphSymbolPointSize");
  v23 = v22;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "messageHighlightButtonGlyphSymbolPointSize");
  v26 = v25;

  -[CKMessageHighlightButton bounds](self, "bounds");
  v28 = (v27 - v23) * 0.5;
  -[CKMessageHighlightButton bounds](self, "bounds");
  v30 = (v29 - v26) * 0.5;
  -[UIImageView setFrame:](self->_glyphView, "setFrame:", v28, v30, v23, v26);
  -[UIImageView setFrame:](self->_glyphViewForCrossFade, "setFrame:", v28, v30, v23, v26);
  -[CKMessageHighlightButton bounds](self, "bounds");
  -[UIButton setFrame:](self->_button, "setFrame:");
  -[UIView bounds](self->_backgroundColorView, "bounds");
  -[UIVisualEffectView setFrame:](self->_blurEffectView, "setFrame:");
  blurEffectMaskLayer = self->_blurEffectMaskLayer;
  v32 = (void *)MEMORY[0x1E0CEA390];
  -[UIVisualEffectView frame](self->_blurEffectView, "frame");
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;
  -[UIView layer](self->_backgroundColorView, "layer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "cornerRadius");
  objc_msgSend(v32, "bezierPathWithRoundedRect:cornerRadius:", v34, v36, v38, v40, v42);
  v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setPath:](blurEffectMaskLayer, "setPath:", objc_msgSend(v43, "CGPath"));

}

- (void)buttonWasPressed:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  self->_didUpdate = 1;
  self->_isHighlighted ^= 1u;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__CKMessageHighlightButton_buttonWasPressed___block_invoke;
  v6[3] = &unk_1E274A208;
  v6[4] = self;
  -[CKMessageHighlightButton performSelectedAnimation:](self, "performSelectedAnimation:", v6);
  -[CKMessageHighlightButton delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKMessageHighlightButton delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messageHightlightButtonWasClicked:", self);

  }
}

void __45__CKMessageHighlightButton_buttonWasPressed___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "messageHightlightButtonDidFinishAnimating:", *(_QWORD *)(a1 + 32));

  }
}

- (CGSize)buttonSize
{
  double v2;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[CKMessageHighlightButton replyButtonFrame](self, "replyButtonFrame");
  if (v2 == *MEMORY[0x1E0C9D820] && v2 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messageHighlightButtonVisibleViewSize");
    v8 = v7;
    v10 = v9;

    v4 = v8;
    v5 = v10;
  }
  else
  {
    v4 = v2;
    v5 = v2;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)buttonSizeWithInsets
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
  double v16;
  double v17;
  CGSize result;

  -[CKMessageHighlightButton buttonSize](self, "buttonSize");
  v4 = v3;
  v6 = v5;
  -[CKMessageHighlightButton button](self, "button");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentEdgeInsets");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v4 + v11 + v15;
  v17 = v6 + v9 + v13;
  result.height = v17;
  result.width = v16;
  return result;
}

- (char)transcriptOrientation
{
  CKMessageHighlightButton *v2;
  void *v3;

  v2 = self;
  -[CKMessageHighlightButton delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "messageHightlightButtonTranscriptOrientation:", v2);

  return (char)v2;
}

- (CGRect)balloonViewFrame
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
  CGRect result;

  -[CKMessageHighlightButton delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageHightlightButtonBalloonViewFrame:", self);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)replyButtonFrame
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
  CGRect result;

  -[CKMessageHighlightButton delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageHightlightButtonReplyButtonFrame:", self);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGSize)transcriptHighlightSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageHighlightTranscriptBalloonSize");
  v4 = v3;
  v6 = v5;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageHighlightTranscriptBalloonBorderWidth");
  v9 = v8 + v8;

  v10 = v4 + v9;
  v11 = v6 + v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGRect)calculateTranscriptHighlightFrameRelativeToBalloonFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  double MaxY;
  double v19;
  double v20;
  NSObject *v21;
  double v22;
  double v23;
  double MaxX;
  CGFloat v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKMessageHighlightButton transcriptHighlightSize](self, "transcriptHighlightSize");
  v9 = v8;
  v11 = v10;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messageHighlightTranscriptBalloonRelativePosition");
  v14 = v13;
  v16 = v15;

  v17 = -[CKMessageHighlightButton transcriptOrientation](self, "transcriptOrientation");
  if (v17 == 2)
  {
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    v25 = CGRectGetMinX(v28) - v9;
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    MaxY = CGRectGetMaxY(v29);
    v19 = v14 + v25;
    goto LABEL_6;
  }
  if (v17 == 1)
  {
    IMLogHandleForCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[CKMessageHighlightButton calculateTranscriptHighlightFrameRelativeToBalloonFrame:].cold.1(v21);

    goto LABEL_10;
  }
  if (v17)
  {
LABEL_10:
    v19 = *MEMORY[0x1E0C9D648];
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    goto LABEL_11;
  }
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  MaxX = CGRectGetMaxX(v26);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MaxY = CGRectGetMaxY(v27);
  v19 = MaxX - v14;
LABEL_6:
  v20 = MaxY - v16;
LABEL_11:
  v22 = v9;
  v23 = v11;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)calculateFrameRelativeToBalloonViewFrame
{
  double v3;
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
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[CKMessageHighlightButton balloonViewFrame](self, "balloonViewFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKMessageHighlightButton calculateTranscriptHighlightFrameRelativeToBalloonFrame:](self, "calculateTranscriptHighlightFrameRelativeToBalloonFrame:");
  -[CKMessageHighlightButton calculateFrameRelativeToBalloonViewFrame:transcriptHighlightFrame:](self, "calculateFrameRelativeToBalloonViewFrame:transcriptHighlightFrame:", v4, v6, v8, v10, v11, v12, v13, v14);
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)calculateFrameRelativeToBalloonViewFrame:(CGRect)a3 transcriptHighlightFrame:(CGRect)a4
{
  CGFloat *v5;
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
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat y;
  double v29;
  CGFloat height;
  double v31;
  double x;
  double width;
  CGRect v34;
  CGRect result;
  CGRect v36;

  y = a4.origin.y;
  height = a4.size.height;
  x = a4.origin.x;
  width = a4.size.width;
  v5 = (CGFloat *)MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (CKMainScreenScale_once_63 != -1)
    dispatch_once(&CKMainScreenScale_once_63, &__block_literal_global_160);
  if (*(double *)&CKMainScreenScale_sMainScreenScale_63 == 0.0)
    v8 = 1.0;
  else
    v8 = *(double *)&CKMainScreenScale_sMainScreenScale_63;
  v9 = 1.0 / v8;
  -[CKMessageHighlightButton buttonSizeWithInsets](self, "buttonSizeWithInsets", *(_QWORD *)&y, *(_QWORD *)&height);
  v11 = v10;
  v13 = v12;
  -[CKMessageHighlightButton replyButtonFrame](self, "replyButtonFrame");
  v14 = v34.origin.y;
  v36.origin.x = *v5;
  v36.origin.y = v5[1];
  v36.size.width = v6;
  v36.size.height = v7;
  if (CGRectEqualToRect(v34, v36))
  {
    v15 = v9 * (v29 * v8 + floor((v31 * v8 - v7 * v8) * 0.5)) - v13 * 0.5;
  }
  else
  {
    -[CKMessageHighlightButton button](self, "button");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentEdgeInsets");
    v15 = v14 - v17;

  }
  -[CKMessageHighlightButton traitCollection](self, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "displayScale");
  v20 = round((v9 * (x * v8 + floor((width * v8 - v6 * v8) * 0.5)) - v11 * 0.5) * v19) / v19;
  v21 = round(v15 * v19) / v19;
  v22 = round(v11 * v19) / v19;
  v23 = round(v13 * v19) / v19;

  v24 = v20;
  v25 = v21;
  v26 = v22;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (void)performShowAnimation:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  double MidX;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  uint64_t v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  CGFloat v52;
  CGFloat v53;
  _QWORD v54[5];
  id v55;
  uint64_t v56;
  _QWORD v57[4];
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v57[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKMessageHighlightButton balloonViewFrame](self, "balloonViewFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CKMessageHighlightButton calculateTranscriptHighlightFrameRelativeToBalloonFrame:](self, "calculateTranscriptHighlightFrameRelativeToBalloonFrame:");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = v8;
  v21 = v20;
  -[CKMessageHighlightButton calculateFrameRelativeToBalloonViewFrame:transcriptHighlightFrame:](self, "calculateFrameRelativeToBalloonViewFrame:transcriptHighlightFrame:", v6, v19, v10, v12);
  v52 = v23;
  v53 = v22;
  v25 = v24;
  v27 = v26;
  -[CKMessageHighlightButton setFrame:](self, "setFrame:");
  -[CKMessageHighlightButton setHidden:](self, "setHidden:", 0);
  -[CKMessageHighlightButton alpha](self, "alpha");
  v29 = v28;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.300000012);
  v30 = (void *)MEMORY[0x1E0CD28B0];
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __49__CKMessageHighlightButton_performShowAnimation___block_invoke;
  v54[3] = &unk_1E2756EA0;
  v54[4] = self;
  v56 = v29;
  v31 = v4;
  v55 = v31;
  objc_msgSend(v30, "setCompletionBlock:", v54);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("position"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)MEMORY[0x1E0CB3B18];
  v58.origin.x = v21;
  v58.origin.y = v14;
  v58.size.width = v16;
  v58.size.height = v18;
  MidX = CGRectGetMidX(v58);
  v59.origin.x = v21;
  v59.origin.y = v14;
  v59.size.width = v16;
  v59.size.height = v18;
  objc_msgSend(v33, "valueWithCGPoint:", MidX, CGRectGetMidY(v59));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFromValue:", v35);

  v36 = (void *)MEMORY[0x1E0CB3B18];
  v60.origin.x = v53;
  v60.origin.y = v52;
  v60.size.width = v25;
  v60.size.height = v27;
  v37 = CGRectGetMidX(v60);
  v61.origin.x = v53;
  v61.origin.y = v52;
  v61.size.width = v25;
  v61.size.height = v27;
  objc_msgSend(v36, "valueWithCGPoint:", v37, CGRectGetMidY(v61));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setToValue:", v38);

  objc_msgSend(v32, "setDuration:", 0.300000012);
  v39 = *MEMORY[0x1E0CD3048];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTimingFunction:", v40);

  objc_msgSend(v32, "setRemovedOnCompletion:", 1);
  if (self->_isHighlighted)
  {
    -[CKMessageHighlightButton buttonSize](self, "buttonSize");
    v42 = v18 / v41;
  }
  else
  {
    v42 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v44;
  v57[1] = &unk_1E2871470;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setValues:", v45);

  objc_msgSend(v43, "setCalculationMode:", *MEMORY[0x1E0CD2928]);
  objc_msgSend(v43, "setDuration:", 0.300000012);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v39);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setTimingFunction:", v46);

  LODWORD(v47) = 1.0;
  objc_msgSend(v43, "setRepeatCount:", v47);
  objc_msgSend(v43, "setAutoreverses:", 0);
  objc_msgSend(v43, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v43, "setRemovedOnCompletion:", 1);
  -[CKMessageHighlightButton layer](self, "layer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addAnimation:forKey:", v43, CFSTR("transform.scale.xy"));

  -[CKMessageHighlightButton layer](self, "layer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "addAnimation:forKey:", v32, CFSTR("position"));

  if (!self->_isHighlighted)
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setFromValue:", &unk_1E2871480);
    objc_msgSend(v50, "setDuration:", 0.300000012);
    objc_msgSend(v50, "setRemovedOnCompletion:", 1);
    objc_msgSend(v50, "setFillMode:", *MEMORY[0x1E0CD2B58]);
    objc_msgSend(v50, "setBeginTime:", 0.100000001);
    objc_msgSend(v50, "setBeginTimeMode:", *MEMORY[0x1E0CD2950]);
    -[CKMessageHighlightButton layer](self, "layer");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addAnimation:forKey:", v50, CFSTR("opacity"));

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

uint64_t __49__CKMessageHighlightButton_performShowAnimation___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)performFadeoutAnimationWithDuration:(double)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  CKMessageHighlightButton *v19;
  id v20;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", a3);
  v7 = (void *)MEMORY[0x1E0CD28B0];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __75__CKMessageHighlightButton_performFadeoutAnimationWithDuration_completion___block_invoke;
  v18 = &unk_1E274C2E0;
  v19 = self;
  v20 = v6;
  v8 = v6;
  objc_msgSend(v7, "setCompletionBlock:", &v15);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.xy"), v15, v16, v17, v18, v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setToValue:", &unk_1E2871490);
  LODWORD(v10) = 1.5;
  objc_msgSend(v9, "setSpeed:", v10);
  objc_msgSend(v9, "setMass:", 1.0);
  objc_msgSend(v9, "setStiffness:", 350.0);
  objc_msgSend(v9, "setDamping:", 40.0);
  objc_msgSend(v9, "setDuration:", a3);
  objc_msgSend(v9, "setRemovedOnCompletion:", 0);
  v11 = *MEMORY[0x1E0CD2B58];
  objc_msgSend(v9, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setToValue:", &unk_1E28714A0);
  objc_msgSend(v12, "setDuration:", a3);
  objc_msgSend(v12, "setRemovedOnCompletion:", 0);
  objc_msgSend(v12, "setFillMode:", v11);
  -[CKMessageHighlightButton layer](self, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAnimation:forKey:", v9, CFSTR("transform.scale.xy"));

  -[CKMessageHighlightButton layer](self, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAnimation:forKey:", v12, CFSTR("opacity"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

uint64_t __75__CKMessageHighlightButton_performFadeoutAnimationWithDuration_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)performHideAnimationWithDuration:(double)a3 completion:(id)a4
{
  if (self->_isHighlighted)
    -[CKMessageHighlightButton performUnselectedDismissAnimationWithDuration:completion:](self, "performUnselectedDismissAnimationWithDuration:completion:", a4, a3);
  else
    -[CKMessageHighlightButton performFadeoutAnimationWithDuration:completion:](self, "performFadeoutAnimationWithDuration:completion:", a4, a3);
}

- (void)performSelectedAnimation:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double MidX;
  double MidY;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  double v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  CGFloat v58;
  CGFloat v59;
  void *v60;
  _QWORD v61[3];
  _QWORD v62[5];
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  v62[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKMessageHighlightButton balloonViewFrame](self, "balloonViewFrame");
  -[CKMessageHighlightButton calculateTranscriptHighlightFrameRelativeToBalloonFrame:](self, "calculateTranscriptHighlightFrameRelativeToBalloonFrame:");
  v58 = v6;
  v59 = v5;
  v8 = v7;
  v10 = v9;
  -[CKMessageHighlightButton frame](self, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "messageHighlightButtonInsets");
  v21 = v20;

  v22 = 0.0;
  if (self->_isHighlighted)
    v22 = (v10 + v21) / v18;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin", *(_QWORD *)&v22);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.3);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v4);

  v63.origin.x = v12;
  v63.origin.y = v14;
  v63.size.width = v16;
  v63.size.height = v18;
  MidX = CGRectGetMidX(v63);
  v64.origin.x = v12;
  v64.origin.y = v14;
  v64.size.width = v16;
  v64.size.height = v18;
  MidY = CGRectGetMidY(v64);
  v65.origin.x = v59;
  v65.origin.y = v8;
  v65.size.width = v58;
  v65.size.height = v10;
  v25 = CGRectGetMidX(v65);
  v66.origin.x = v59;
  v66.origin.y = v8;
  v66.size.width = v58;
  v66.size.height = v10;
  v26 = CGRectGetMidY(v66);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", MidX, MidY);
  v27 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v25, v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v27;
  v62[1] = v27;
  v60 = (void *)v27;
  v62[2] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setValues:", v30);

  v31 = *MEMORY[0x1E0CD2928];
  objc_msgSend(v29, "setCalculationMode:", *MEMORY[0x1E0CD2928]);
  objc_msgSend(v29, "setTensionValues:", &unk_1E286F838);
  objc_msgSend(v29, "setDuration:", 0.3);
  v32 = *MEMORY[0x1E0CD3048];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTimingFunction:", v33);

  LODWORD(v34) = 1.0;
  objc_msgSend(v29, "setRepeatCount:", v34);
  objc_msgSend(v29, "setAutoreverses:", 0);
  v35 = *MEMORY[0x1E0CD2B60];
  objc_msgSend(v29, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v29, "setRemovedOnCompletion:", 0);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = &unk_1E2871470;
  v61[1] = &unk_1E28714B0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v57);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v61[2] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setValues:", v38);

  objc_msgSend(v36, "setTensionValues:", &unk_1E286F850);
  objc_msgSend(v36, "setCalculationMode:", v31);
  objc_msgSend(v36, "setDuration:", 0.3);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v32);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTimingFunction:", v39);

  LODWORD(v40) = 1.0;
  objc_msgSend(v36, "setRepeatCount:", v40);
  objc_msgSend(v36, "setAutoreverses:", 0);
  objc_msgSend(v36, "setFillMode:", v35);
  objc_msgSend(v36, "setRemovedOnCompletion:", 0);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setValues:", &unk_1E286F868);
  objc_msgSend(v41, "setTensionValues:", &unk_1E286F880);
  objc_msgSend(v41, "setCalculationMode:", v31);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v32);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setTimingFunction:", v42);

  LODWORD(v43) = 1.0;
  objc_msgSend(v41, "setRepeatCount:", v43);
  objc_msgSend(v41, "setAutoreverses:", 0);
  objc_msgSend(v41, "setFillMode:", v35);
  objc_msgSend(v41, "setRemovedOnCompletion:", 0);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setValues:", &unk_1E286F898);
  objc_msgSend(v44, "setTensionValues:", &unk_1E286F8B0);
  objc_msgSend(v44, "setCalculationMode:", v31);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v32);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setTimingFunction:", v45);

  LODWORD(v46) = 1.0;
  objc_msgSend(v44, "setRepeatCount:", v46);
  objc_msgSend(v44, "setAutoreverses:", 0);
  objc_msgSend(v44, "setFillMode:", v35);
  objc_msgSend(v44, "setRemovedOnCompletion:", 0);
  if (!self->_isHighlighted)
  {
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setValues:", &unk_1E286F8C8);
    objc_msgSend(v47, "setTensionValues:", &unk_1E286F8E0);
    objc_msgSend(v47, "setCalculationMode:", v31);
    objc_msgSend(v47, "setDuration:", 0.3);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v32);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setTimingFunction:", v48);

    LODWORD(v49) = 1.0;
    objc_msgSend(v47, "setRepeatCount:", v49);
    objc_msgSend(v47, "setAutoreverses:", 0);
    objc_msgSend(v47, "setFillMode:", v35);
    objc_msgSend(v47, "setRemovedOnCompletion:", 0);
    -[CKMessageHighlightButton layer](self, "layer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addAnimation:forKey:", v47, CFSTR("opacity"));

  }
  -[CKMessageHighlightButton layer](self, "layer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addAnimation:forKey:", v29, CFSTR("position"));

  -[UIView layer](self->_backgroundColorView, "layer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addAnimation:forKey:", v41, CFSTR("opacity"));

  -[UIView layer](self->_backgroundColorViewForCrossFade, "layer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "addAnimation:forKey:", v44, CFSTR("opacity"));

  -[UIImageView layer](self->_glyphView, "layer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addAnimation:forKey:", v41, CFSTR("opacity"));

  -[UIImageView layer](self->_glyphViewForCrossFade, "layer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "addAnimation:forKey:", v44, CFSTR("opacity"));

  -[CKMessageHighlightButton layer](self, "layer");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "addAnimation:forKey:", v36, CFSTR("bounds"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 0);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

- (void)performUnselectedDismissAnimationWithDuration:(double)a3 completion:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double MidX;
  double MidY;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  double v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  CGFloat v43;
  double v44;
  double v45;
  CGFloat v46;
  void *v47;
  _QWORD v48[2];
  _QWORD v49[4];
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v49[3] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[CKMessageHighlightButton balloonViewFrame](self, "balloonViewFrame");
  -[CKMessageHighlightButton calculateTranscriptHighlightFrameRelativeToBalloonFrame:](self, "calculateTranscriptHighlightFrameRelativeToBalloonFrame:");
  v46 = v7;
  v43 = v8;
  v10 = v9;
  v12 = v11;
  -[CKMessageHighlightButton frame](self, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v44 = fmax(a3, 0.3);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "messageHighlightButtonInsets");
  v23 = v22;

  v45 = (v12 + v23) / v20;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", v44);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v6);

  v50.origin.x = v14;
  v50.origin.y = v16;
  v50.size.width = v18;
  v50.size.height = v20;
  MidX = CGRectGetMidX(v50);
  v51.origin.x = v14;
  v51.origin.y = v16;
  v51.size.width = v18;
  v51.size.height = v20;
  MidY = CGRectGetMidY(v51);
  v52.origin.x = v46;
  v52.origin.y = v43;
  v52.size.width = v10;
  v52.size.height = v12;
  v26 = CGRectGetMidX(v52);
  v53.origin.x = v46;
  v53.origin.y = v43;
  v53.size.width = v10;
  v53.size.height = v12;
  v27 = CGRectGetMidY(v53);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", MidX, MidY);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v26, v27);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v28;
  v49[1] = v28;
  v49[2] = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setValues:", v30);

  v31 = *MEMORY[0x1E0CD2928];
  objc_msgSend(v29, "setCalculationMode:", *MEMORY[0x1E0CD2928]);
  objc_msgSend(v29, "setTensionValues:", &unk_1E286F8F8);
  objc_msgSend(v29, "setDuration:", v44);
  v32 = *MEMORY[0x1E0CD3048];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTimingFunction:", v33);

  LODWORD(v34) = 1.0;
  objc_msgSend(v29, "setRepeatCount:", v34);
  objc_msgSend(v29, "setAutoreverses:", 0);
  v35 = *MEMORY[0x1E0CD2B60];
  objc_msgSend(v29, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v29, "setRemovedOnCompletion:", 0);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = &unk_1E2871470;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v45);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setValues:", v38);

  objc_msgSend(v36, "setTensionValues:", &unk_1E286F910);
  objc_msgSend(v36, "setCalculationMode:", v31);
  objc_msgSend(v36, "setDuration:", v44);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v32);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTimingFunction:", v39);

  LODWORD(v40) = 1.0;
  objc_msgSend(v36, "setRepeatCount:", v40);
  objc_msgSend(v36, "setAutoreverses:", 0);
  objc_msgSend(v36, "setFillMode:", v35);
  objc_msgSend(v36, "setRemovedOnCompletion:", 0);
  -[CKMessageHighlightButton layer](self, "layer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addAnimation:forKey:", v29, CFSTR("position"));

  -[CKMessageHighlightButton layer](self, "layer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addAnimation:forKey:", v36, CFSTR("bounds"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 0);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

- (CKMessageHighlightButtonDelegate)delegate
{
  return (CKMessageHighlightButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isHighlighted
{
  return self->_isHighlighted;
}

- (UIButton)button
{
  return self->_button;
}

- (BOOL)didUpdate
{
  return self->_didUpdate;
}

- (UIView)backgroundColorView
{
  return self->_backgroundColorView;
}

- (UIView)backgroundColorViewForCrossFade
{
  return self->_backgroundColorViewForCrossFade;
}

- (UIVisualEffectView)blurEffectView
{
  return self->_blurEffectView;
}

- (CAShapeLayer)blurEffectMaskLayer
{
  return self->_blurEffectMaskLayer;
}

- (UIImageView)glyphView
{
  return self->_glyphView;
}

- (UIImageView)glyphViewForCrossFade
{
  return self->_glyphViewForCrossFade;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphViewForCrossFade, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_blurEffectMaskLayer, 0);
  objc_storeStrong((id *)&self->_blurEffectView, 0);
  objc_storeStrong((id *)&self->_backgroundColorViewForCrossFade, 0);
  objc_storeStrong((id *)&self->_backgroundColorView, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)calculateTranscriptHighlightFrameRelativeToBalloonFrame:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "Positioning CKTranscriptOrientationCenter not supported", v1, 2u);
}

@end
