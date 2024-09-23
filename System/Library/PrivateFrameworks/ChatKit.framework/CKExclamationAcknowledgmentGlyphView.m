@implementation CKExclamationAcknowledgmentGlyphView

- (CKExclamationAcknowledgmentGlyphView)initWithFrame:(CGRect)a3 color:(char)a4
{
  int v4;
  CKExclamationAcknowledgmentGlyphView *v5;
  CKExclamationAcknowledgmentGlyphView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CKAcknowledgmentGlyphImageView *v12;
  CKAcknowledgmentGlyphImageView *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v4 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CKExclamationAcknowledgmentGlyphView;
  v5 = -[CKExclamationAcknowledgmentGlyphView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    -[CKExclamationAcknowledgmentGlyphView setBackgroundColor:](v5, "setBackgroundColor:", 0);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v4 == -1)
    {
      objc_msgSend(v7, "grayExclamationLeftAckImage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "grayExclamationRightAckImage");
    }
    else
    {
      objc_msgSend(v7, "whiteExclamationLeftAckImage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "whiteExclamationRightAckImage");
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[CKAcknowledgmentGlyphImageView initWithImage:]([CKAcknowledgmentGlyphImageView alloc], "initWithImage:", v9);
    v13 = -[CKAcknowledgmentGlyphImageView initWithImage:]([CKAcknowledgmentGlyphImageView alloc], "initWithImage:", v11);
    -[CKExclamationAcknowledgmentGlyphView addSubview:](v6, "addSubview:", v12);
    -[CKExclamationAcknowledgmentGlyphView setLeftExclamationGlyph:](v6, "setLeftExclamationGlyph:", v12);
    -[CKExclamationAcknowledgmentGlyphView addSubview:](v6, "addSubview:", v13);
    -[CKExclamationAcknowledgmentGlyphView setRightExclamationGlyph:](v6, "setRightExclamationGlyph:", v13);
    -[CKAcknowledgmentGlyphImageView layer](v12, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAnchorPoint:", 1.0, 0.5);

    -[CKAcknowledgmentGlyphImageView layer](v13, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAnchorPoint:", 0.0, 0.5);

    -[CKExclamationAcknowledgmentGlyphView setClipsToBounds:](v6, "setClipsToBounds:", 1);
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
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  double MidX;
  double v29;
  void *v30;
  void *v31;
  double rect_16;
  double rect_24;
  objc_super v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v34.receiver = self;
  v34.super_class = (Class)CKExclamationAcknowledgmentGlyphView;
  -[CKExclamationAcknowledgmentGlyphView layoutSubviews](&v34, sel_layoutSubviews);
  -[CKExclamationAcknowledgmentGlyphView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKExclamationAcknowledgmentGlyphView leftExclamationGlyph](self, "leftExclamationGlyph");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeToFit");

  -[CKExclamationAcknowledgmentGlyphView rightExclamationGlyph](self, "rightExclamationGlyph");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeToFit");

  -[CKExclamationAcknowledgmentGlyphView leftExclamationGlyph](self, "leftExclamationGlyph");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;

  v35.origin.x = v4;
  v35.origin.y = v6;
  v35.size.width = v8;
  v35.size.height = v10;
  v18 = CGRectGetHeight(v35) / v17;
  v19 = v15 * v18;
  v20 = v17 * v18;
  -[CKExclamationAcknowledgmentGlyphView rightExclamationGlyph](self, "rightExclamationGlyph");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v23 = v22;
  v25 = v24;

  v36.origin.x = v4;
  v36.origin.y = v6;
  v36.size.width = v8;
  v36.size.height = v10;
  v26 = CGRectGetHeight(v36) / v25;
  rect_16 = v25 * v26;
  rect_24 = v23 * v26;
  v27 = v6 + floor((v10 - v20) * 0.5);
  v37.origin.x = v4;
  v37.origin.y = v6;
  v37.size.width = v8;
  v37.size.height = v10;
  MidX = CGRectGetMidX(v37);
  v38.origin.x = v4;
  v38.origin.y = v6;
  v38.size.width = v8;
  v38.size.height = v10;
  CGRectGetMidY(v38);
  v39.origin.x = v4 + floor((v8 - v19) * 0.5);
  v39.origin.y = v27;
  v39.size.width = v19;
  v39.size.height = v20;
  v29 = MidX - CGRectGetWidth(v39);
  -[CKExclamationAcknowledgmentGlyphView leftExclamationGlyph](self, "leftExclamationGlyph");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFrame:", v29, v27, v19, v20);

  -[CKExclamationAcknowledgmentGlyphView rightExclamationGlyph](self, "rightExclamationGlyph");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFrame:", MidX, v6 + floor((v10 - rect_16) * 0.5), rect_24, rect_16);

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
  v15.super_class = (Class)CKExclamationAcknowledgmentGlyphView;
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
    objc_msgSend(v8, "grayExclamationLeftAckImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "grayExclamationRightAckImage");
  }
  else
  {
    objc_msgSend(v8, "whiteExclamationLeftAckImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "whiteExclamationRightAckImage");
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKExclamationAcknowledgmentGlyphView leftExclamationGlyph](self, "leftExclamationGlyph");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setImage:", v10);

  -[CKExclamationAcknowledgmentGlyphView rightExclamationGlyph](self, "rightExclamationGlyph");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setImage:", v12);

}

- (int64_t)acknowledgmentType
{
  return 2004;
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
  CGFloat v13;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD block[4];
  id v32;
  CGRect v33;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v9 = (void *)MEMORY[0x1E0CD28B0];
  -[CKExclamationAcknowledgmentGlyphView animationDuration](self, "animationDuration");
  objc_msgSend(v9, "setAnimationDuration:");
  if (v8)
  {
    v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__CKExclamationAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke;
    block[3] = &unk_1E274AED0;
    v32 = v8;
    dispatch_after(v10, MEMORY[0x1E0C80D38], block);

  }
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position.y"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[CKExclamationAcknowledgmentGlyphView bounds](self, "bounds");
  v13 = CGRectGetMaxY(v33) * 1.2;
  *(float *)&v13 = v13;
  objc_msgSend(v12, "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFromValue:", v14);

  objc_msgSend(v11, "setMass:", 1.0);
  objc_msgSend(v11, "setStiffness:", 350.0);
  objc_msgSend(v11, "setDamping:", 20.0);
  LODWORD(v15) = 1.0;
  objc_msgSend(v11, "setSpeed:", v15);
  v16 = *MEMORY[0x1E0CD2B58];
  objc_msgSend(v11, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v11, "setBeginTime:", a3);
  -[CKExclamationAcknowledgmentGlyphView leftExclamationGlyph](self, "leftExclamationGlyph");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAnimation:forKey:", v11, CFSTR("position.y"));

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = 0.5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFromValue:", v21);

  objc_msgSend(v19, "setMass:", 1.0);
  objc_msgSend(v19, "setStiffness:", 450.0);
  objc_msgSend(v19, "setDamping:", 15.0);
  LODWORD(v22) = 1.0;
  objc_msgSend(v19, "setSpeed:", v22);
  objc_msgSend(v19, "setDuration:", 1.0);
  objc_msgSend(v19, "setBeginTime:", a3 + 0.150000006);
  objc_msgSend(v19, "setFillMode:", v16);
  -[CKExclamationAcknowledgmentGlyphView leftExclamationGlyph](self, "leftExclamationGlyph");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addAnimation:forKey:", v19, CFSTR("transform.scale.xy"));

  v25 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v25, "setBeginTime:", a3 + 0.100000001);
  -[CKExclamationAcknowledgmentGlyphView rightExclamationGlyph](self, "rightExclamationGlyph");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addAnimation:forKey:", v25, CFSTR("position.y"));

  v28 = (void *)objc_msgSend(v19, "copy");
  -[CKExclamationAcknowledgmentGlyphView rightExclamationGlyph](self, "rightExclamationGlyph");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addAnimation:forKey:", v28, CFSTR("transform.scale.xy"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

uint64_t __88__CKExclamationAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (double)animationDuration
{
  return 1.15;
}

- (CKAcknowledgmentGlyphImageView)leftExclamationGlyph
{
  return self->_leftExclamationGlyph;
}

- (void)setLeftExclamationGlyph:(id)a3
{
  objc_storeStrong((id *)&self->_leftExclamationGlyph, a3);
}

- (CKAcknowledgmentGlyphImageView)rightExclamationGlyph
{
  return self->_rightExclamationGlyph;
}

- (void)setRightExclamationGlyph:(id)a3
{
  objc_storeStrong((id *)&self->_rightExclamationGlyph, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightExclamationGlyph, 0);
  objc_storeStrong((id *)&self->_leftExclamationGlyph, 0);
}

@end
