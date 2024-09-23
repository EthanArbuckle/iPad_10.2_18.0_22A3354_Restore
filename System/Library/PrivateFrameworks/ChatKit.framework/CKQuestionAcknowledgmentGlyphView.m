@implementation CKQuestionAcknowledgmentGlyphView

- (CKQuestionAcknowledgmentGlyphView)initWithFrame:(CGRect)a3 color:(char)a4
{
  int v4;
  CKQuestionAcknowledgmentGlyphView *v5;
  CKQuestionAcknowledgmentGlyphView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CKAcknowledgmentGlyphImageView *v12;
  CKAcknowledgmentGlyphImageView *v13;
  objc_super v15;

  v4 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CKQuestionAcknowledgmentGlyphView;
  v5 = -[CKQuestionAcknowledgmentGlyphView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    -[CKQuestionAcknowledgmentGlyphView setBackgroundColor:](v5, "setBackgroundColor:", 0);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v4 == -1)
    {
      objc_msgSend(v7, "grayQuestionMarkGlyphAckImage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "grayQuestionMarkDotAckImage");
    }
    else
    {
      objc_msgSend(v7, "whiteQuestionMarkGlyphAckImage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "whiteQuestionMarkDotAckImage");
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[CKAcknowledgmentGlyphImageView initWithImage:]([CKAcknowledgmentGlyphImageView alloc], "initWithImage:", v9);
    -[CKQuestionAcknowledgmentGlyphView addSubview:](v6, "addSubview:", v12);
    -[CKQuestionAcknowledgmentGlyphView setGlyph:](v6, "setGlyph:", v12);
    v13 = -[CKAcknowledgmentGlyphImageView initWithImage:]([CKAcknowledgmentGlyphImageView alloc], "initWithImage:", v11);
    -[CKQuestionAcknowledgmentGlyphView addSubview:](v6, "addSubview:", v13);
    -[CKQuestionAcknowledgmentGlyphView setDot:](v6, "setDot:", v13);
    -[CKQuestionAcknowledgmentGlyphView setClipsToBounds:](v6, "setClipsToBounds:", 1);

  }
  return v6;
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
  void *v11;
  void *v12;
  CGFloat v13;
  void *v14;
  double Width;
  void *v16;
  double Height;
  void *v18;
  CGFloat v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double MaxY;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  CGRect recta;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  *(_QWORD *)&recta.origin.y = self;
  *(_QWORD *)&recta.size.width = CKQuestionAcknowledgmentGlyphView;
  -[CGFloat layoutSubviews]((objc_super *)&recta.origin.y, sel_layoutSubviews);
  -[CKQuestionAcknowledgmentGlyphView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKQuestionAcknowledgmentGlyphView glyph](self, "glyph");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeToFit");

  -[CKQuestionAcknowledgmentGlyphView dot](self, "dot");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeToFit");

  v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  recta.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
  -[CKQuestionAcknowledgmentGlyphView glyph](self, "glyph");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  Width = CGRectGetWidth(v38);
  -[CKQuestionAcknowledgmentGlyphView glyph](self, "glyph");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  Height = CGRectGetHeight(v39);
  -[CKQuestionAcknowledgmentGlyphView dot](self, "dot");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v19 = Height + CGRectGetHeight(v40);

  v41.origin.x = v4;
  v41.origin.y = v6;
  v41.size.width = v8;
  v41.size.height = v10;
  v20 = CGRectGetHeight(v41);
  v42.origin.x = recta.origin.x;
  v42.origin.y = v13;
  v42.size.width = Width;
  v42.size.height = v19;
  v21 = v20 / CGRectGetHeight(v42);
  v22 = v4 + floor((v8 - Width * v21) * 0.5);
  v23 = v6 + floor((v10 - v19 * v21) * 0.5);
  -[CKQuestionAcknowledgmentGlyphView glyph](self, "glyph");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  v26 = v21 * v25;
  v28 = v21 * v27;

  v43.origin.x = v22;
  v43.origin.y = v23;
  v43.size.width = v26;
  v43.size.height = v28;
  MaxY = CGRectGetMaxY(v43);
  -[CKQuestionAcknowledgmentGlyphView dot](self, "dot");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bounds");
  v32 = v21 * v31;
  v34 = v21 * v33;

  -[CKQuestionAcknowledgmentGlyphView glyph](self, "glyph");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setFrame:", v22, v23, v26, v28);

  -[CKQuestionAcknowledgmentGlyphView dot](self, "dot");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFrame:", v22, MaxY, v32, v34);

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
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CKQuestionAcknowledgmentGlyphView;
  v4 = a3;
  -[CKAcknowledgmentGlyphView setGlyphColor:](&v15, sel_setGlyphColor_, v4);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", v15.receiver, v15.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "theme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "ckAcknowledgementColorTypeForColor:", v4);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 == -1)
  {
    objc_msgSend(v8, "grayQuestionMarkGlyphAckImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "grayQuestionMarkDotAckImage");
  }
  else
  {
    objc_msgSend(v8, "whiteQuestionMarkGlyphAckImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "whiteQuestionMarkDotAckImage");
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKQuestionAcknowledgmentGlyphView glyph](self, "glyph");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setImage:", v10);

  -[CKQuestionAcknowledgmentGlyphView dot](self, "dot");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setImage:", v12);

}

- (int64_t)acknowledgmentType
{
  return 2005;
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
  uint64_t v12;
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
  _QWORD block[4];
  id v24;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v9 = (void *)MEMORY[0x1E0CD28B0];
  -[CKQuestionAcknowledgmentGlyphView animationDuration](self, "animationDuration");
  objc_msgSend(v9, "setAnimationDuration:");
  if (v8)
  {
    v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__CKQuestionAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke;
    block[3] = &unk_1E274AED0;
    v24 = v8;
    dispatch_after(v10, MEMORY[0x1E0C80D38], block);

  }
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFromValue:", &unk_1E2870FD8);
  objc_msgSend(v11, "setMass:", 2.0);
  objc_msgSend(v11, "setStiffness:", 250.0);
  objc_msgSend(v11, "setDamping:", 22.0);
  objc_msgSend(v11, "setBeginTime:", a3);
  v12 = *MEMORY[0x1E0CD2B58];
  objc_msgSend(v11, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  -[CKQuestionAcknowledgmentGlyphView glyph](self, "glyph");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAnimation:forKey:", v11, CFSTR("transform.scale.xy"));

  -[CKQuestionAcknowledgmentGlyphView dot](self, "dot");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAnimation:forKey:", v11, CFSTR("transform.scale.xy"));

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position.y"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFromValue:", &unk_1E2870FF0);
  objc_msgSend(v17, "setMass:", 1.0);
  objc_msgSend(v17, "setStiffness:", 250.0);
  objc_msgSend(v17, "setDamping:", 20.0);
  objc_msgSend(v17, "setBeginTime:", a3);
  objc_msgSend(v17, "setFillMode:", v12);
  -[CKQuestionAcknowledgmentGlyphView glyph](self, "glyph");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAnimation:forKey:", v17, CFSTR("position.y"));

  v20 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v20, "setBeginTime:", a3 + 0.05);
  -[CKQuestionAcknowledgmentGlyphView dot](self, "dot");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addAnimation:forKey:", v20, CFSTR("position.y"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

uint64_t __85__CKQuestionAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (double)animationDuration
{
  return 1.05;
}

- (CKAcknowledgmentGlyphImageView)glyph
{
  return self->_glyph;
}

- (void)setGlyph:(id)a3
{
  objc_storeStrong((id *)&self->_glyph, a3);
}

- (CKAcknowledgmentGlyphImageView)dot
{
  return self->_dot;
}

- (void)setDot:(id)a3
{
  objc_storeStrong((id *)&self->_dot, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dot, 0);
  objc_storeStrong((id *)&self->_glyph, 0);
}

@end
