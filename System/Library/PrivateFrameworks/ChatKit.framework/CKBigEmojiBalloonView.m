@implementation CKBigEmojiBalloonView

- (UIEdgeInsets)alignmentRectInsets
{
  void *v2;
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
  UIEdgeInsets result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bigEmojiAlignmentRectInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)addFilter:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v6 = a3;
  objc_msgSend(v6, "balloonFilters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CKTextBalloonView textView](self, "textView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[CKTextBalloonView textView](self, "textView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "filters");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "balloonFilters");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
    }
    else
    {
      objc_msgSend(v6, "balloonFilters");
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTextBalloonView textView](self, "textView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFilters:", v11);

    if (v10)
    {

      v11 = v23;
    }

  }
  objc_msgSend(v6, "contentAlpha");
  if (v14 != 0.0)
  {
    objc_msgSend(v6, "contentAlpha");
    v16 = v15;
    -[CKTextBalloonView textView](self, "textView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAlpha:", v16);

  }
  objc_msgSend(v6, "textCompositingFilter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v6, "textCompositingFilter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTextBalloonView textView](self, "textView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setCompositingFilter:", v19);

  }
  v24.receiver = self;
  v24.super_class = (Class)CKBigEmojiBalloonView;
  -[CKTextBalloonView addFilter:](&v24, sel_addFilter_, v6);

}

- (void)clearFilters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[CKTextBalloonView textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFilters:", 0);

  -[CKTextBalloonView textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCompositingFilter:", 0);

  -[CKTextBalloonView textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", 1.0);

  v8.receiver = self;
  v8.super_class = (Class)CKBigEmojiBalloonView;
  -[CKTextBalloonView clearFilters](&v8, sel_clearFilters);
}

- (BOOL)hasBackground
{
  return 0;
}

- (id)accessibilityIdentifier
{
  return CFSTR("BigEmojiIdentifier");
}

- (BOOL)wantsTapbackPickerBackingBubble
{
  return 0;
}

- (Class)invisibleInkEffectViewClass
{
  return (Class)objc_opt_class();
}

- (void)invisibleInkEffectViewWasUncovered
{
  id v2;

  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suspendForTimeInterval:", 5.0);

}

- (void)attachInvisibleInkEffectView
{
  void *v3;
  void *v4;
  id v5;

  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "attachToBalloonView:", self);
  -[CKTextBalloonView textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBigEmojiBalloonView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v5, v4);

}

- (void)detachInvisibleInkEffectView
{
  void *v2;
  id v3;

  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectView");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "detachFromBalloonView");
  objc_msgSend(v3, "removeFromSuperview");

}

@end
