@implementation CKInlineReplyTransparentBlurBackgroundView

- (CKInlineReplyTransparentBlurBackgroundView)initWithFrame:(CGRect)a3
{
  CKInlineReplyTransparentBlurBackgroundView *v3;
  CKInlineReplyTransparentBlurBackgroundView *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CKInlineReplyTransparentBlurBackgroundView;
  v3 = -[CKInlineReplyTransparentBlurBackgroundView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKInlineReplyTransparentBlurBackgroundView setAlpha:](v3, "setAlpha:", 0.0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInlineReplyTransparentBlurBackgroundView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = objc_alloc(MEMORY[0x1E0CEABE8]);
    v7 = (void *)MEMORY[0x1E0CEA398];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "theme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "replyTranscriptBlurBackgroundBlurRadius");
    objc_msgSend(v7, "effectWithBlurRadius:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v6, "initWithEffect:", v10);
    -[CKInlineReplyTransparentBlurBackgroundView setBlurEffectView:](v4, "setBlurEffectView:", v11);

    -[CKInlineReplyTransparentBlurBackgroundView blurEffectView](v4, "blurEffectView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CKInlineReplyTransparentBlurBackgroundView blurEffectView](v4, "blurEffectView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInlineReplyTransparentBlurBackgroundView addSubview:](v4, "addSubview:", v13);

    -[CKInlineReplyTransparentBlurBackgroundView blurEffectView](v4, "blurEffectView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "__ck_makeEdgesEqualTo:", v4);

  }
  return v4;
}

- (void)animateIn
{
  void *v3;
  void *v4;
  id v5;

  -[CKInlineReplyTransparentBlurBackgroundView setAlpha:](self, "setAlpha:", 1.0);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "replyTranscriptBlurBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInlineReplyTransparentBlurBackgroundView setBackgroundColor:](self, "setBackgroundColor:", v4);

}

- (void)animateOut
{
  id v3;

  -[CKInlineReplyTransparentBlurBackgroundView setAlpha:](self, "setAlpha:", 0.0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CKInlineReplyTransparentBlurBackgroundView setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (UIVisualEffectView)blurEffectView
{
  return self->_blurEffectView;
}

- (void)setBlurEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_blurEffectView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurEffectView, 0);
}

@end
