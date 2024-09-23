@implementation WFDictateTextActionStopButton

- (WFDictateTextActionStopButton)init
{
  WFDictateTextActionStopButton *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  WFDictateTextActionStopButton *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x24BDAC8D0];
  +[WFDictateTextActionStopButton buttonWithType:](WFDictateTextActionStopButton, "buttonWithType:", 0);
  v3 = (WFDictateTextActionStopButton *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 0.231372549, 0.188235294, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v5);

    objc_msgSend(v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMasksToBounds:", 1);

    objc_msgSend(v4, "setUserInteractionEnabled:", 0);
    -[WFDictateTextActionStopButton addSubview:](v3, "addSubview:", v4);
    -[WFDictateTextActionStopButton setRedSquare:](v3, "setRedSquare:", v4);
    objc_msgSend(v4, "widthAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToConstant:", 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v4, "centerXAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDictateTextActionStopButton centerXAnchor](v3, "centerXAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v8;
    objc_msgSend(v4, "centerYAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDictateTextActionStopButton centerYAnchor](v3, "centerYAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v11;
    v22[2] = v19;
    objc_msgSend(v4, "heightAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widthAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[3] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateConstraints:", v15);

    -[WFDictateTextActionStopButton setRedSquareWidthConstraint:](v3, "setRedSquareWidthConstraint:", v19);
    v16 = v3;

  }
  return v3;
}

- (double)currentLineWidth
{
  double v2;

  -[WFDictateTextActionStopButton frame](self, "frame");
  return floor(v2 / 73.0 * 6.0);
}

- (double)currentInnerCircleRadius
{
  double v2;

  -[WFDictateTextActionStopButton frame](self, "frame");
  return v2 / 73.0 * 28.0;
}

- (double)currentStopButtonSize
{
  double v2;

  -[WFDictateTextActionStopButton frame](self, "frame");
  return v2 / 73.0 * 30.0;
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WFDictateTextActionStopButton;
  -[WFDictateTextActionStopButton drawRect:](&v16, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[WFDictateTextActionStopButton redSquare](self, "redSquare");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "center");
  v6 = v5;
  v8 = v7;

  -[WFDictateTextActionStopButton frame](self, "frame");
  v10 = v9;
  -[WFDictateTextActionStopButton currentLineWidth](self, "currentLineWidth");
  v12 = v11;
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v6, v8, (v10 - v11) * 0.5, 0.0, 6.28318531);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLineWidth:", v12);
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "colorWithAlphaComponent:", 0.25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setStroke");

  objc_msgSend(v13, "stroke");
}

- (void)setHighlighted:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFDictateTextActionStopButton;
  -[WFDictateTextActionStopButton setHighlighted:](&v7, sel_setHighlighted_);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__WFDictateTextActionStopButton_setHighlighted___block_invoke;
  v5[3] = &unk_24E3437E0;
  v5[4] = self;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v5, 0.2);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WFDictateTextActionStopButton;
  -[WFDictateTextActionStopButton layoutSubviews](&v13, sel_layoutSubviews);
  -[WFDictateTextActionStopButton currentInnerCircleRadius](self, "currentInnerCircleRadius");
  v4 = v3;
  if (-[WFDictateTextActionStopButton recording](self, "recording"))
  {
    -[WFDictateTextActionStopButton currentStopButtonSize](self, "currentStopButtonSize");
    v6 = v5;
  }
  else
  {
    v6 = v4 + v4;
  }
  -[WFDictateTextActionStopButton redSquareWidthConstraint](self, "redSquareWidthConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", v6);

  if (-[WFDictateTextActionStopButton recording](self, "recording"))
    v4 = 5.0;
  -[WFDictateTextActionStopButton redSquare](self, "redSquare");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", v4);

  v10 = *MEMORY[0x24BDE58E8];
  -[WFDictateTextActionStopButton redSquare](self, "redSquare");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerCurve:", v10);

}

- (void)setRecording:(BOOL)a3
{
  -[WFDictateTextActionStopButton setRecording:animated:](self, "setRecording:animated:", a3, 1);
}

- (void)setRecording:(BOOL)a3 animated:(BOOL)a4
{
  double v4;
  _QWORD v5[5];

  if (self->_recording != a3)
  {
    self->_recording = a3;
    v4 = 0.3;
    if (!a4)
      v4 = 0.0;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __55__WFDictateTextActionStopButton_setRecording_animated___block_invoke;
    v5[3] = &unk_24E343958;
    v5[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v5, v4);
  }
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 73.0;
  v3 = 73.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)accessibilityLabel
{
  __CFString *v2;

  if (-[WFDictateTextActionStopButton recording](self, "recording"))
    v2 = CFSTR("Stop dictation");
  else
    v2 = CFSTR("Start dictation");
  WFLocalizedString(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)recording
{
  return self->_recording;
}

- (UIView)redSquare
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_redSquare);
}

- (void)setRedSquare:(id)a3
{
  objc_storeWeak((id *)&self->_redSquare, a3);
}

- (NSLayoutConstraint)redSquareWidthConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_redSquareWidthConstraint);
}

- (void)setRedSquareWidthConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_redSquareWidthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_redSquareWidthConstraint);
  objc_destroyWeak((id *)&self->_redSquare);
}

uint64_t __55__WFDictateTextActionStopButton_setRecording_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __48__WFDictateTextActionStopButton_setHighlighted___block_invoke(uint64_t a1)
{
  __int128 v2;
  void *v3;
  CGAffineTransform v4;
  CGAffineTransform v5;

  if (*(_BYTE *)(a1 + 40))
  {
    CGAffineTransformMakeScale(&v5, 0.9, 0.9);
  }
  else
  {
    v2 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v5.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v5.c = v2;
    *(_OWORD *)&v5.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  }
  objc_msgSend(*(id *)(a1 + 32), "redSquare");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;
  objc_msgSend(v3, "setTransform:", &v4);

}

@end
