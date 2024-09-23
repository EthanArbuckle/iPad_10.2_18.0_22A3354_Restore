@implementation CKPhotoGridTapbackView

- (void)setUserData:(id)a3
{
  PXAssetReference *v5;
  PXAssetReference *v6;

  v5 = (PXAssetReference *)a3;
  if (self->_userData != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_userData, a3);
    -[CKPhotoGridTapbackView _tearDownBalloonView](self, "_tearDownBalloonView");
    -[CKPhotoGridTapbackView _setupBalloonView](self, "_setupBalloonView");
    v5 = v6;
  }

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  _QWORD block[5];
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CKPhotoGridTapbackView;
  -[CKPhotoGridTapbackView layoutSubviews](&v27, sel_layoutSubviews);
  -[CKPhotoGridTapbackView tapbackBalloonView](self, "tapbackBalloonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForDisplayIfNeeded");

  -[CKPhotoGridTapbackView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "aggregateAcknowledgmentTranscriptBalloonSize");
  v10 = v9;
  v12 = v11;

  v13 = v7 - v12;
  if (-[CKPhotoGridTapbackView isDisplayedInGridView](self, "isDisplayedInGridView"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "messageAcknowledgmentPhotoGridXOffsetScalar");
    v16 = v15;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "messageAcknowledgmentPhotoGridYOffsetScalar");
    v19 = v18;

    v20 = v10 * v16;
    v21 = v13 - v12 * v19;
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "messageAcknowledgmentPhotoCarouselXOffsetScalar");
    v24 = v23;

    v20 = (v5 - v10) * 0.5 - v10 * v24;
    v21 = v13 * 0.5;
  }
  -[CKPhotoGridTapbackView tapbackBalloonView](self, "tapbackBalloonView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", v20, v21, v10, v12);

  if (-[CKPhotoGridTapbackView needsAnimation](self, "needsAnimation"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__CKPhotoGridTapbackView_layoutSubviews__block_invoke;
    block[3] = &unk_1E274A208;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    -[CKPhotoGridTapbackView setNeedsAnimation:](self, "setNeedsAnimation:", 0);
  }
}

uint64_t __40__CKPhotoGridTapbackView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performInsertion:", &__block_literal_global_49);
}

- (void)_setupBalloonView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CKPhotoGridTapbackView setNeedsAnimation:](self, "setNeedsAnimation:", -[CKPhotoGridTapbackView shouldAnimate](self, "shouldAnimate"));
  CKBalloonViewForClass(-[CKPhotoGridTapbackView balloonViewClass](self, "balloonViewClass"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CKPhotoGridTapbackView setTapbackBalloonView:](self, "setTapbackBalloonView:", v6);
  -[CKPhotoGridTapbackView addSubview:](self, "addSubview:", v6);
  -[CKPhotoGridTapbackView asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "acknowledgmentChatItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configureForAggregateAcknowledgmentChatItem:", v4);

  -[CKPhotoGridTapbackView gradientReferenceView](self, "gradientReferenceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGradientReferenceView:", v5);

  objc_msgSend(v6, "setInvertTailDirection:", -[CKPhotoGridTapbackView invertTail](self, "invertTail"));
  objc_msgSend(v6, "setNeedsPrepareForDisplay");
  objc_msgSend(v6, "setNeedsLayout");
  objc_msgSend(v6, "setHidesFirstTapbackTail:", 1);
  -[CKPhotoGridTapbackView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_tearDownBalloonView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CKPhotoGridTapbackView tapbackBalloonView](self, "tapbackBalloonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKPhotoGridTapbackView tapbackBalloonView](self, "tapbackBalloonView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[CKPhotoGridTapbackView tapbackBalloonView](self, "tapbackBalloonView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prepareForReuse");

    -[CKPhotoGridTapbackView tapbackBalloonView](self, "tapbackBalloonView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CKBalloonViewReuse(v6);

    -[CKPhotoGridTapbackView setTapbackBalloonView:](self, "setTapbackBalloonView:", 0);
  }
}

- (id)asset
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  char v7;
  void *v8;

  -[CKPhotoGridTapbackView userData](self, "userData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[CKPhotoGridTapbackView userData](self, "userData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    v7 = objc_opt_isKindOfClass();

    if ((v7 & 1) == 0)
    {
      v8 = 0;
      return v8;
    }
    -[CKPhotoGridTapbackView userData](self, "userData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)gradientReferenceView
{
  void *v3;
  char isKindOfClass;
  void *v5;
  CKPhotoGridTapbackView *v6;

  -[CKPhotoGridTapbackView userData](self, "userData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CKPhotoGridTapbackView userData](self, "userData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "isDisplayedInGridView"))
    {
      objc_msgSend(v5, "gradientReferenceView");
      v6 = (CKPhotoGridTapbackView *)objc_claimAutoreleasedReturnValue();

      return v6;
    }

  }
  v6 = self;
  return v6;
}

- (BOOL)isDisplayedInGridView
{
  void *v3;
  char isKindOfClass;
  void *v5;
  char v6;

  -[CKPhotoGridTapbackView userData](self, "userData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  -[CKPhotoGridTapbackView userData](self, "userData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDisplayedInGridView");

  return v6;
}

- (BOOL)isFromMe
{
  void *v2;
  void *v3;
  char v4;

  -[CKPhotoGridTapbackView asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "acknowledgmentChatItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFromMe");

  return v4;
}

- (BOOL)shouldAnimate
{
  void *v3;
  char isKindOfClass;
  void *v5;
  char v6;

  -[CKPhotoGridTapbackView userData](self, "userData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  -[CKPhotoGridTapbackView userData](self, "userData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldAnimate");

  return v6;
}

- (BOOL)invertTail
{
  void *v3;
  char isKindOfClass;
  void *v5;
  char v6;

  -[CKPhotoGridTapbackView userData](self, "userData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  -[CKPhotoGridTapbackView userData](self, "userData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "invertTailDirection");

  return v6;
}

- (Class)balloonViewClass
{
  -[CKPhotoGridTapbackView isFromMe](self, "isFromMe");
  return (Class)(id)objc_opt_class();
}

- (id)_imAggregateAcknowledgmentChatItem
{
  void *v2;
  void *v3;
  void *v4;

  -[CKPhotoGridTapbackView asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "acknowledgmentChatItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "IMChatItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)performInsertion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 2.0);
  -[CKPhotoGridTapbackView tapbackBalloonView](self, "tapbackBalloonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertTime:fromLayer:", 0, CACurrentMediaTime());
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFromValue:", &unk_1E2870498);
  objc_msgSend(v9, "setMass:", 1.0);
  objc_msgSend(v9, "setStiffness:", 80.0);
  objc_msgSend(v9, "setDamping:", 20.0);
  objc_msgSend(v9, "setBeginTime:", v8);
  LODWORD(v10) = 3.0;
  objc_msgSend(v9, "setSpeed:", v10);
  objc_msgSend(v9, "setDuration:", 1.0);
  objc_msgSend(v9, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  -[CKPhotoGridTapbackView tapbackBalloonView](self, "tapbackBalloonView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAnimation:forKey:", v9, CFSTR("transform.scale.xy"));

  -[CKPhotoGridTapbackView tapbackBalloonView](self, "tapbackBalloonView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "glyphView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "animationDuration");
  objc_msgSend(v14, "animateWithBeginTime:completionDelay:completion:", 0, v8, v15);
  v16 = (void *)MEMORY[0x1E0CD28B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __43__CKPhotoGridTapbackView_performInsertion___block_invoke;
  v18[3] = &unk_1E274AED0;
  v19 = v4;
  v17 = v4;
  objc_msgSend(v16, "setCompletionBlock:", v18);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");

}

uint64_t __43__CKPhotoGridTapbackView_performInsertion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (unint64_t)decorationOptions
{
  return self->_decorationOptions;
}

- (void)setDecorationOptions:(unint64_t)a3
{
  self->_decorationOptions = a3;
}

- (PXAssetReference)userData
{
  return self->_userData;
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (CKAggregateAcknowledgmentBalloonView)tapbackBalloonView
{
  return self->_tapbackBalloonView;
}

- (void)setTapbackBalloonView:(id)a3
{
  objc_storeStrong((id *)&self->_tapbackBalloonView, a3);
}

- (BOOL)needsAnimation
{
  return self->_needsAnimation;
}

- (void)setNeedsAnimation:(BOOL)a3
{
  self->_needsAnimation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapbackBalloonView, 0);
  objc_storeStrong((id *)&self->_userData, 0);
}

@end
