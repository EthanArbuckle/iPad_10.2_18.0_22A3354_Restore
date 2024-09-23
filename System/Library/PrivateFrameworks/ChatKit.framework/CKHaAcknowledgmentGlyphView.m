@implementation CKHaAcknowledgmentGlyphView

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
  void *v10;
  void *v11;
  double MaxY;
  double v13;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  dispatch_time_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD block[4];
  id v24;
  CGRect v25;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v9 = (void *)MEMORY[0x1E0CD28B0];
  -[CKSimpleAcknowledgementGlyphView animationDuration](self, "animationDuration");
  objc_msgSend(v9, "setAnimationDuration:");
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position.y"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSimpleAcknowledgementGlyphView glyph](self, "glyph");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  MaxY = CGRectGetMaxY(v25);

  *(float *)&v13 = MaxY;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFromValue:", v14);

  objc_msgSend(v10, "setMass:", 1.0);
  objc_msgSend(v10, "setStiffness:", 125.0);
  objc_msgSend(v10, "setDamping:", 12.0);
  LODWORD(v15) = 1.0;
  objc_msgSend(v10, "setSpeed:", v15);
  objc_msgSend(v10, "setBeginTime:", a3);
  objc_msgSend(v10, "setRemovedOnCompletion:", 1);
  v16 = *MEMORY[0x1E0CD2B58];
  objc_msgSend(v10, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFromValue:", &unk_1E2870FD8);
  objc_msgSend(v17, "setMass:", 1.0);
  objc_msgSend(v17, "setStiffness:", 250.0);
  objc_msgSend(v17, "setDamping:", 15.0);
  objc_msgSend(v17, "setBeginTime:", a3);
  objc_msgSend(v17, "setRemovedOnCompletion:", 1);
  objc_msgSend(v17, "setFillMode:", v16);
  if (v8)
  {
    v18 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__CKHaAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke;
    block[3] = &unk_1E274AED0;
    v24 = v8;
    dispatch_after(v18, MEMORY[0x1E0C80D38], block);

  }
  -[CKSimpleAcknowledgementGlyphView glyph](self, "glyph");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addAnimation:forKey:", v10, CFSTR("position.y"));

  -[CKSimpleAcknowledgementGlyphView glyph](self, "glyph");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addAnimation:forKey:", v17, CFSTR("transform.scale.xy"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

uint64_t __79__CKHaAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
