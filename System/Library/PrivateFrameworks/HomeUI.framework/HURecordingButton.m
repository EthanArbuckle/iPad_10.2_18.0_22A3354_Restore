@implementation HURecordingButton

- (HURecordingButton)initWithSize:(CGSize)a3 state:(unint64_t)a4 image:(id)a5
{
  double height;
  double width;
  id v10;
  HURecordingButton *v11;
  HURecordingButton *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  UIImageView *currentButtonImageView;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v25;

  height = a3.height;
  width = a3.width;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)HURecordingButton;
  v11 = -[HURecordingButton initWithFrame:](&v25, sel_initWithFrame_, 0.0, 0.0, width, height);
  v12 = v11;
  if (v11)
  {
    v11->_currentRecordingState = a4;
    objc_storeStrong((id *)&v11->_currentButtonImage, a5);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURecordingButton setBackgroundColor:](v12, "setBackgroundColor:", v13);

    v14 = objc_alloc(MEMORY[0x1E0CEA658]);
    -[HURecordingButton currentButtonImage](v12, "currentButtonImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithImage:", v15);
    currentButtonImageView = v12->_currentButtonImageView;
    v12->_currentButtonImageView = (UIImageView *)v16;

    -[HURecordingButton bounds](v12, "bounds");
    v19 = v18 * 0.5;
    -[HURecordingButton bounds](v12, "bounds");
    -[UIImageView setFrame:](v12->_currentButtonImageView, "setFrame:", 0.0, 0.0, v19, v20 * 0.5);
    -[HURecordingButton bounds](v12, "bounds");
    v22 = v21 * 0.5;
    -[HURecordingButton bounds](v12, "bounds");
    -[UIImageView setCenter:](v12->_currentButtonImageView, "setCenter:", v22, v23 * 0.5);
    -[HURecordingButton addSubview:](v12, "addSubview:", v12->_currentButtonImageView);
  }

  return v12;
}

- (HURecordingButton)initWithSize:(CGSize)a3 state:(unint64_t)a4 title:(id)a5
{
  HURecordingButton *v6;
  HURecordingButton *v7;
  void *v8;
  id v9;
  uint64_t v10;
  UILabel *currentButtonLabel;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HURecordingButton;
  v6 = -[HURecordingButton initWithFrame:](&v21, sel_initWithFrame_, a4, a5, 0.0, 0.0, a3.width, a3.height);
  v7 = v6;
  if (v6)
  {
    v6->_currentRecordingState = a4;
    if (a4 == 4)
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGreenColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURecordingButton setBackgroundColor:](v7, "setBackgroundColor:", v8);

    v9 = objc_alloc(MEMORY[0x1E0CEA700]);
    v10 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    currentButtonLabel = v7->_currentButtonLabel;
    v7->_currentButtonLabel = (UILabel *)v10;

    -[HURecordingButton bounds](v7, "bounds");
    v13 = v12 * 0.5;
    -[HURecordingButton bounds](v7, "bounds");
    -[UILabel setFrame:](v7->_currentButtonLabel, "setFrame:", 0.0, 0.0, v13, v14 * 0.5);
    -[HURecordingButton bounds](v7, "bounds");
    v16 = v15 * 0.5;
    -[HURecordingButton bounds](v7, "bounds");
    -[UILabel setCenter:](v7->_currentButtonLabel, "setCenter:", v16, v17 * 0.5);
    -[HURecordingButton addSubview:](v7, "addSubview:", v7->_currentButtonLabel);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7->_currentButtonLabel, "setFont:", v18);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v7->_currentButtonLabel, "setTextColor:", v19);

  }
  return v7;
}

- (void)setHighlighted:(BOOL)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HURecordingButton;
  -[HURecordingButton setHighlighted:](&v5, sel_setHighlighted_, a3);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__HURecordingButton_setHighlighted___block_invoke;
  v4[3] = &unk_1E6F4D988;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v4, 0.0);
}

uint64_t __36__HURecordingButton_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateHighlight");
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HURecordingButton;
  -[HURecordingButton setEnabled:](&v4, sel_setEnabled_, a3);
  -[HURecordingButton _updateHighlight](self, "_updateHighlight");
}

- (void)setImage:(id)a3 forState:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  int v22;
  void *v23;
  double v24;
  uint64_t v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  HURecordingButton *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  HURecordingButton *v34;
  id v35;
  unint64_t v36;
  CGAffineTransform v37;

  v5 = a5;
  v8 = a3;
  -[HURecordingButton setCurrentRecordingState:](self, "setCurrentRecordingState:", a4);
  -[HURecordingButton currentButtonImageView](self, "currentButtonImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    -[HURecordingButton nextButtonImageView](self, "nextButtonImageView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  -[HURecordingButton currentButtonImageView](self, "currentButtonImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqual:", v13) & 1) != 0)
    -[HURecordingButton nextButtonImageView](self, "nextButtonImageView");
  else
    -[HURecordingButton currentButtonImageView](self, "currentButtonImageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v8);
    -[HURecordingButton bounds](self, "bounds");
    v16 = v15 * 0.5;
    -[HURecordingButton bounds](self, "bounds");
    objc_msgSend(v14, "setFrame:", 0.0, 0.0, v16, v17 * 0.5);
    -[HURecordingButton bounds](self, "bounds");
    v19 = v18 * 0.5;
    -[HURecordingButton bounds](self, "bounds");
    objc_msgSend(v14, "setCenter:", v19, v20 * 0.5);
    objc_msgSend(v14, "setAlpha:", 0.0);
    -[HURecordingButton addSubview:](self, "addSubview:", v14);
    CGAffineTransformMakeScale(&v37, 0.3, 0.3);
    objc_msgSend(v14, "setTransform:", &v37);
    -[HURecordingButton currentButtonImageView](self, "currentButtonImageView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v12, "isEqual:", v21);

    if (v22)
      -[HURecordingButton setNextButtonImageView:](self, "setNextButtonImageView:", v14);
    else
      -[HURecordingButton setCurrentButtonImageView:](self, "setCurrentButtonImageView:", v14);
  }
  v23 = (void *)MEMORY[0x1E0CEABB0];
  if (v5)
    v24 = 0.25;
  else
    v24 = 0.0;
  v25 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __48__HURecordingButton_setImage_forState_animated___block_invoke;
  v32[3] = &unk_1E6F54020;
  v33 = v12;
  v34 = self;
  v36 = a4;
  v35 = v14;
  v28[0] = v25;
  v28[1] = 3221225472;
  v28[2] = __48__HURecordingButton_setImage_forState_animated___block_invoke_2;
  v28[3] = &unk_1E6F54048;
  v29 = v33;
  v30 = self;
  v31 = v35;
  v26 = v35;
  v27 = v33;
  objc_msgSend(v23, "animateWithDuration:animations:completion:", v32, v28, v24);

}

void __48__HURecordingButton_setImage_forState_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.1);
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v18, 0.3, 0.3);
  objc_msgSend(v2, "setTransform:", &v18);
  objc_msgSend(*(id *)(a1 + 40), "currentButtonLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alpha");
  v5 = v4;

  if (v5 == 1.0)
  {
    objc_msgSend(*(id *)(a1 + 40), "currentButtonLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 0.1);

    objc_msgSend(*(id *)(a1 + 40), "currentButtonLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CGAffineTransformMakeScale(&v17, 0.3, 0.3);
    objc_msgSend(v7, "setTransform:", &v17);

  }
  v8 = *(void **)(a1 + 48);
  v9 = 0.9;
  if (*(_QWORD *)(a1 + 56) != 4)
    v9 = 1.0;
  v10 = 0.8;
  if (*(_QWORD *)(a1 + 56) != 4)
    v10 = 1.0;
  CGAffineTransformMakeScale(&v16, v9, v10);
  objc_msgSend(v8, "setTransform:", &v16);
  objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 1.0);
  v11 = objc_msgSend(*(id *)(a1 + 40), "currentRecordingState");
  objc_msgSend(*(id *)(a1 + 40), "stopButtonStrokeLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  LODWORD(v14) = 0;
  if (v11 == 4)
    *(float *)&v14 = 1.0;
  objc_msgSend(v12, "setOpacity:", v14);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setBackgroundColor:", v15);

}

uint64_t __48__HURecordingButton_setImage_forState_animated___block_invoke_2(uint64_t result, int a2)
{
  uint64_t v2;
  void *v3;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "removeFromSuperview");
    objc_msgSend(*(id *)(v2 + 40), "currentButtonLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

    objc_msgSend(*(id *)(v2 + 40), "setCurrentButtonLabel:", 0);
    objc_msgSend(*(id *)(v2 + 40), "setCurrentButtonImageView:", *(_QWORD *)(v2 + 48));
    return objc_msgSend(*(id *)(v2 + 40), "setNextButtonImageView:", 0);
  }
  return result;
}

- (void)setText:(id)a3 forState:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  uint64_t v35;
  id v36;
  _QWORD v37[4];
  id v38;
  HURecordingButton *v39;
  _QWORD v40[4];
  id v41;
  HURecordingButton *v42;
  unint64_t v43;

  v5 = a5;
  v8 = a3;
  -[HURecordingButton currentButtonImageView](self, "currentButtonImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    -[HURecordingButton nextButtonImageView](self, "nextButtonImageView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  -[HURecordingButton currentButtonLabel](self, "currentButtonLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = objc_alloc(MEMORY[0x1E0CEA700]);
    v15 = (void *)objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[HURecordingButton setCurrentButtonLabel:](self, "setCurrentButtonLabel:", v15);

    -[HURecordingButton bounds](self, "bounds");
    v17 = v16 * 0.5;
    -[HURecordingButton bounds](self, "bounds");
    v19 = v18 * 0.5;
    -[HURecordingButton currentButtonLabel](self, "currentButtonLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFrame:", 0.0, 0.0, v17, v19);

    -[HURecordingButton bounds](self, "bounds");
    v22 = v21 * 0.5;
    -[HURecordingButton bounds](self, "bounds");
    v24 = v23 * 0.5;
    -[HURecordingButton currentButtonLabel](self, "currentButtonLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setCenter:", v22, v24);

    -[HURecordingButton currentButtonLabel](self, "currentButtonLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAlpha:", 0.0);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURecordingButton currentButtonLabel](self, "currentButtonLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFont:", v27);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURecordingButton currentButtonLabel](self, "currentButtonLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTextColor:", v29);

    -[HURecordingButton currentButtonLabel](self, "currentButtonLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURecordingButton addSubview:](self, "addSubview:", v31);

  }
  -[HURecordingButton currentButtonLabel](self, "currentButtonLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setText:", v8);

  v33 = (void *)MEMORY[0x1E0CEABB0];
  if (v5)
    v34 = 0.25;
  else
    v34 = 0.0;
  v35 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __47__HURecordingButton_setText_forState_animated___block_invoke;
  v40[3] = &unk_1E6F54070;
  v41 = v12;
  v42 = self;
  v43 = a4;
  v37[0] = v35;
  v37[1] = 3221225472;
  v37[2] = __47__HURecordingButton_setText_forState_animated___block_invoke_2;
  v37[3] = &unk_1E6F4E048;
  v38 = v41;
  v39 = self;
  v36 = v41;
  objc_msgSend(v33, "animateWithDuration:animations:completion:", v40, v37, v34);

}

void __47__HURecordingButton_setText_forState_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  CGAffineTransform v6;
  CGAffineTransform v7;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.1);
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v7, 0.3, 0.3);
  objc_msgSend(v2, "setTransform:", &v7);
  objc_msgSend(*(id *)(a1 + 40), "currentButtonLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeScale(&v6, 1.0, 1.0);
  objc_msgSend(v3, "setTransform:", &v6);

  objc_msgSend(*(id *)(a1 + 40), "currentButtonLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  if (*(_QWORD *)(a1 + 48) == 4)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "greenColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setBackgroundColor:", v5);

  }
}

uint64_t __47__HURecordingButton_setText_forState_animated___block_invoke_2(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "removeFromSuperview");
    objc_msgSend(*(id *)(v2 + 40), "setCurrentButtonImageView:", 0);
    return objc_msgSend(*(id *)(v2 + 40), "setNextButtonImageView:", 0);
  }
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HURecordingButton;
  -[HURecordingButton layoutSubviews](&v7, sel_layoutSubviews);
  -[HURecordingButton bounds](self, "bounds");
  v4 = v3 * 0.5;
  -[HURecordingButton layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v4);

  -[HURecordingButton layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMasksToBounds:", 1);

}

- (void)_updateHighlight
{
  int v3;
  double v4;

  if (-[HURecordingButton isEnabled](self, "isEnabled"))
  {
    v3 = -[HURecordingButton isHighlighted](self, "isHighlighted");
    v4 = 1.0;
    if (v3)
      v4 = 0.5;
  }
  else
  {
    v4 = 0.2;
  }
  -[HURecordingButton setAlpha:](self, "setAlpha:", v4);
}

- (unint64_t)currentRecordingState
{
  return self->_currentRecordingState;
}

- (void)setCurrentRecordingState:(unint64_t)a3
{
  self->_currentRecordingState = a3;
}

- (UIImage)currentButtonImage
{
  return self->_currentButtonImage;
}

- (void)setCurrentButtonImage:(id)a3
{
  objc_storeStrong((id *)&self->_currentButtonImage, a3);
}

- (UIImage)nextButtonImage
{
  return self->_nextButtonImage;
}

- (void)setNextButtonImage:(id)a3
{
  objc_storeStrong((id *)&self->_nextButtonImage, a3);
}

- (UIImageView)currentButtonImageView
{
  return self->_currentButtonImageView;
}

- (void)setCurrentButtonImageView:(id)a3
{
  objc_storeStrong((id *)&self->_currentButtonImageView, a3);
}

- (UIImageView)nextButtonImageView
{
  return self->_nextButtonImageView;
}

- (void)setNextButtonImageView:(id)a3
{
  objc_storeStrong((id *)&self->_nextButtonImageView, a3);
}

- (UILabel)currentButtonLabel
{
  return self->_currentButtonLabel;
}

- (void)setCurrentButtonLabel:(id)a3
{
  objc_storeStrong((id *)&self->_currentButtonLabel, a3);
}

- (CAShapeLayer)stopButtonStrokeLayer
{
  return self->_stopButtonStrokeLayer;
}

- (void)setStopButtonStrokeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_stopButtonStrokeLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopButtonStrokeLayer, 0);
  objc_storeStrong((id *)&self->_currentButtonLabel, 0);
  objc_storeStrong((id *)&self->_nextButtonImageView, 0);
  objc_storeStrong((id *)&self->_currentButtonImageView, 0);
  objc_storeStrong((id *)&self->_nextButtonImage, 0);
  objc_storeStrong((id *)&self->_currentButtonImage, 0);
}

@end
