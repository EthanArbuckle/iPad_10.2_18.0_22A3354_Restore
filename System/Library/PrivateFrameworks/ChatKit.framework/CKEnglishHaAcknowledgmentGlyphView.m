@implementation CKEnglishHaAcknowledgmentGlyphView

- (CKEnglishHaAcknowledgmentGlyphView)initWithFrame:(CGRect)a3 color:(char)a4
{
  int v4;
  CKEnglishHaAcknowledgmentGlyphView *v5;
  CKEnglishHaAcknowledgmentGlyphView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CKAcknowledgmentGlyphImageView *v18;
  CKAcknowledgmentGlyphImageView *v19;
  CKAcknowledgmentGlyphImageView *v20;
  CKAcknowledgmentGlyphImageView *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v4 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CKEnglishHaAcknowledgmentGlyphView;
  v5 = -[CKEnglishHaAcknowledgmentGlyphView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    -[CKEnglishHaAcknowledgmentGlyphView setBackgroundColor:](v5, "setBackgroundColor:", 0);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v4 == -1)
    {
      objc_msgSend(v7, "grayH1AckImage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "grayA1AckImage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "grayH2AckImage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "grayA2AckImage");
    }
    else
    {
      objc_msgSend(v7, "whiteH1AckImage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "whiteA1AckImage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "whiteH2AckImage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "whiteA2AckImage");
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = -[CKAcknowledgmentGlyphImageView initWithImage:]([CKAcknowledgmentGlyphImageView alloc], "initWithImage:", v9);
    -[CKEnglishHaAcknowledgmentGlyphView addSubview:](v6, "addSubview:", v18);
    -[CKEnglishHaAcknowledgmentGlyphView setH1:](v6, "setH1:", v18);
    v19 = -[CKAcknowledgmentGlyphImageView initWithImage:]([CKAcknowledgmentGlyphImageView alloc], "initWithImage:", v11);
    -[CKEnglishHaAcknowledgmentGlyphView addSubview:](v6, "addSubview:", v19);
    -[CKEnglishHaAcknowledgmentGlyphView setA1:](v6, "setA1:", v19);
    v20 = -[CKAcknowledgmentGlyphImageView initWithImage:]([CKAcknowledgmentGlyphImageView alloc], "initWithImage:", v13);
    -[CKEnglishHaAcknowledgmentGlyphView addSubview:](v6, "addSubview:", v20);
    -[CKEnglishHaAcknowledgmentGlyphView setH2:](v6, "setH2:", v20);
    v21 = -[CKAcknowledgmentGlyphImageView initWithImage:]([CKAcknowledgmentGlyphImageView alloc], "initWithImage:", v17);
    -[CKEnglishHaAcknowledgmentGlyphView addSubview:](v6, "addSubview:", v21);
    -[CKEnglishHaAcknowledgmentGlyphView setA2:](v6, "setA2:", v21);
    -[CKAcknowledgmentGlyphImageView layer](v18, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAnchorPoint:", 0.35, 0.55);

    -[CKAcknowledgmentGlyphImageView layer](v19, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAnchorPoint:", 0.65, 0.55);

    -[CKAcknowledgmentGlyphImageView layer](v20, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAnchorPoint:", 0.35, 0.575);

    -[CKAcknowledgmentGlyphImageView layer](v21, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAnchorPoint:", 0.65, 0.575);

    -[CKEnglishHaAcknowledgmentGlyphView setClipsToBounds:](v6, "setClipsToBounds:", 1);
  }
  return v6;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double Height;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  objc_super v36;
  CGRect v37;
  CGRect v38;

  v36.receiver = self;
  v36.super_class = (Class)CKEnglishHaAcknowledgmentGlyphView;
  -[CKEnglishHaAcknowledgmentGlyphView layoutSubviews](&v36, sel_layoutSubviews);
  -[CKEnglishHaAcknowledgmentGlyphView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v35 = v5;
  v8 = v7;
  v10 = v9;
  -[CKEnglishHaAcknowledgmentGlyphView h1](self, "h1");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeToFit");

  -[CKEnglishHaAcknowledgmentGlyphView a1](self, "a1");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeToFit");

  -[CKEnglishHaAcknowledgmentGlyphView h2](self, "h2");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sizeToFit");

  -[CKEnglishHaAcknowledgmentGlyphView a2](self, "a2");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeToFit");

  v16 = *MEMORY[0x1E0C9D648];
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  -[CKEnglishHaAcknowledgmentGlyphView h1](self, "h1");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v19 = v18;
  v21 = v20;

  v37.origin.x = v4;
  v37.origin.y = v6;
  v37.size.width = v8;
  v37.size.height = v10;
  Height = CGRectGetHeight(v37);
  v38.origin.x = v16;
  v38.origin.y = v15;
  v38.size.width = v19;
  v38.size.height = v21;
  v23 = Height / CGRectGetHeight(v38);
  v24 = v4 + floor((v8 - v19 * v23) * 0.5);
  v25 = v35 + floor((v10 - v21 * v23) * 0.5);
  -[CKEnglishHaAcknowledgmentGlyphView h1](self, "h1");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bounds");
  v28 = v23 * v27;
  v30 = v23 * v29;

  -[CKEnglishHaAcknowledgmentGlyphView h1](self, "h1");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFrame:", v24, v25, v28, v30);

  -[CKEnglishHaAcknowledgmentGlyphView a1](self, "a1");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFrame:", v24, v25, v28, v30);

  -[CKEnglishHaAcknowledgmentGlyphView h2](self, "h2");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFrame:", v24, v25, v28, v30);

  -[CKEnglishHaAcknowledgmentGlyphView a2](self, "a2");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFrame:", v24, v25, v28, v30);

}

- (void)setGlyphColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CKEnglishHaAcknowledgmentGlyphView;
  v4 = a3;
  -[CKAcknowledgmentGlyphView setGlyphColor:](&v23, sel_setGlyphColor_, v4);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", v23.receiver, v23.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "theme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "ckAcknowledgementColorTypeForColor:", v4);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 == -1)
  {
    objc_msgSend(v8, "grayH1AckImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "grayA1AckImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "grayH2AckImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "grayA2AckImage");
  }
  else
  {
    objc_msgSend(v8, "whiteH1AckImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "whiteA1AckImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "whiteH2AckImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "whiteA2AckImage");
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEnglishHaAcknowledgmentGlyphView h1](self, "h1");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setImage:", v10);

  -[CKEnglishHaAcknowledgmentGlyphView a1](self, "a1");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setImage:", v12);

  -[CKEnglishHaAcknowledgmentGlyphView h2](self, "h2");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setImage:", v14);

  -[CKEnglishHaAcknowledgmentGlyphView a2](self, "a2");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setImage:", v18);

}

- (int64_t)acknowledgmentType
{
  return 2003;
}

- (CGPoint)glyphOffset
{
  double v2;
  double v3;
  CGPoint result;

  if (CKPixelWidth_once_18 != -1)
    dispatch_once(&CKPixelWidth_once_18, &__block_literal_global_164_2);
  v2 = -*(double *)&CKPixelWidth_sPixel_18;
  v3 = -*(double *)&CKPixelWidth_sPixel_18;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)animateWithBeginTime:(double)a3 completionDelay:(double)a4 completion:(id)a5
{
  id v8;
  void *v9;
  dispatch_time_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  _QWORD block[4];
  id v27;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v9 = (void *)MEMORY[0x1E0CD28B0];
  -[CKEnglishHaAcknowledgmentGlyphView animationDuration](self, "animationDuration");
  objc_msgSend(v9, "setAnimationDuration:");
  if (v8)
  {
    v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__CKEnglishHaAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke;
    block[3] = &unk_1E274AED0;
    v27 = v8;
    dispatch_after(v10, MEMORY[0x1E0C80D38], block);

  }
  -[CKEnglishHaAcknowledgmentGlyphView h1](self, "h1");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEnglishHaAcknowledgmentGlyphView a1](self, "a1");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEnglishHaAcknowledgmentGlyphView h2](self, "h2");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEnglishHaAcknowledgmentGlyphView a2](self, "a2");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFromValue:", &unk_1E2870FD8);
  objc_msgSend(v19, "setMass:", 1.0);
  objc_msgSend(v19, "setStiffness:", 250.0);
  objc_msgSend(v19, "setDamping:", 15.0);
  objc_msgSend(v19, "setBeginTime:", a3);
  objc_msgSend(v19, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v19, "beginTime");
  objc_msgSend(v20, "setBeginTime:", v21 + 0.05);
  v22 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v19, "beginTime");
  objc_msgSend(v22, "setBeginTime:", v23 + 0.1);
  v24 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v19, "beginTime");
  objc_msgSend(v24, "setBeginTime:", v25 + 0.15);
  objc_msgSend(v12, "addAnimation:forKey:", v19, CFSTR("transform.scale.xy"));
  objc_msgSend(v14, "addAnimation:forKey:", v20, CFSTR("transform.scale.xy"));
  objc_msgSend(v16, "addAnimation:forKey:", v22, CFSTR("transform.scale.xy"));
  objc_msgSend(v18, "addAnimation:forKey:", v24, CFSTR("transform.scale.xy"));
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

uint64_t __86__CKEnglishHaAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (double)animationDuration
{
  return 1.05;
}

- (CKAcknowledgmentGlyphImageView)h1
{
  return self->_h1;
}

- (void)setH1:(id)a3
{
  objc_storeStrong((id *)&self->_h1, a3);
}

- (CKAcknowledgmentGlyphImageView)a1
{
  return self->_a1;
}

- (void)setA1:(id)a3
{
  objc_storeStrong((id *)&self->_a1, a3);
}

- (CKAcknowledgmentGlyphImageView)h2
{
  return self->_h2;
}

- (void)setH2:(id)a3
{
  objc_storeStrong((id *)&self->_h2, a3);
}

- (CKAcknowledgmentGlyphImageView)a2
{
  return self->_a2;
}

- (void)setA2:(id)a3
{
  objc_storeStrong((id *)&self->_a2, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_a2, 0);
  objc_storeStrong((id *)&self->_h2, 0);
  objc_storeStrong((id *)&self->_a1, 0);
  objc_storeStrong((id *)&self->_h1, 0);
}

@end
