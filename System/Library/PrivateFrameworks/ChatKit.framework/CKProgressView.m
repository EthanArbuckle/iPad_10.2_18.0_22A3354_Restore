@implementation CKProgressView

- (CKProgressView)initWithProgressViewStyle:(int64_t)a3
{
  CKProgressView *v3;
  double v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKProgressView;
  v3 = -[CKProgressView initWithProgressViewStyle:](&v7, sel_initWithProgressViewStyle_, a3);
  LODWORD(v4) = 0;
  -[CKProgressView setProgress:](v3, "setProgress:", v4);
  -[CKProgressView subviews](v3, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKeyPath:", MEMORY[0x1E0C9AAB0], CFSTR("hidden"));

  -[CKProgressView _createInternalTrackView](v3, "_createInternalTrackView");
  -[CKProgressView _createInternalProgressBar](v3, "_createInternalProgressBar");
  return v3;
}

- (void)_createInternalTrackView
{
  void *v3;
  void *v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v3);

  -[CKProgressView set__ck_trackView:](self, "set__ck_trackView:", v5);
  -[CKProgressView __ck_trackView](self, "__ck_trackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKProgressView addSubview:](self, "addSubview:", v4);

}

- (void)_createInternalProgressBar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "theme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v5);

  -[CKProgressView set__ck_progressView:](self, "set__ck_progressView:", v7);
  -[CKProgressView __ck_progressView](self, "__ck_progressView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKProgressView addSubview:](self, "addSubview:", v6);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  float v5;
  double v6;
  CGFloat v7;
  void *v8;
  double v9;
  float v10;
  float v11;
  double Width;
  float v13;
  double v14;
  void *v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v16.receiver = self;
  v16.super_class = (Class)CKProgressView;
  -[CKProgressView layoutSubviews](&v16, sel_layoutSubviews);
  v3 = *(float *)&__ck_progressViewHeight;
  -[CKProgressView bounds](self, "bounds");
  v4 = CGRectGetHeight(v17) - v3;
  -[CKProgressView progress](self, "progress");
  v6 = v5;
  -[CKProgressView bounds](self, "bounds");
  v7 = CGRectGetWidth(v18) * v6;
  -[CKProgressView __ck_trackView](self, "__ck_trackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0.0;
  objc_msgSend(v8, "setFrame:", 0.0, v4, v7, v3);

  -[CKProgressView progress](self, "progress");
  v11 = v10;
  -[CKProgressView bounds](self, "bounds");
  Width = CGRectGetWidth(v19);
  if (-[CKProgressView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    -[CKProgressView progress](self, "progress");
    v14 = 1.0 - v13;
    -[CKProgressView bounds](self, "bounds");
    v9 = v14 * CGRectGetWidth(v20);
  }
  -[CKProgressView __ck_progressView](self, "__ck_progressView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v9, v4, Width * v11, v3);

}

- (void)setTintColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKProgressView __ck_progressView](self, "__ck_progressView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)setTrackTintColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKProgressView __ck_trackView](self, "__ck_trackView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (UIView)__ck_progressView
{
  return self->___ck_progressView;
}

- (void)set__ck_progressView:(id)a3
{
  objc_storeStrong((id *)&self->___ck_progressView, a3);
}

- (UIView)__ck_trackView
{
  return self->___ck_trackView;
}

- (void)set__ck_trackView:(id)a3
{
  objc_storeStrong((id *)&self->___ck_trackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->___ck_trackView, 0);
  objc_storeStrong((id *)&self->___ck_progressView, 0);
}

@end
