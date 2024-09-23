@implementation DownloadProgressButton

- (DownloadProgressButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  DownloadProgressButton *v7;
  uint64_t v8;
  SFProgressView *progressView;
  void *v10;
  void *v11;
  DownloadProgressButton *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)DownloadProgressButton;
  v7 = -[DownloadProgressButton initWithFrame:](&v14, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4ED10]), "initWithFrame:", x, y, width, height);
    progressView = v7->_progressView;
    v7->_progressView = (SFProgressView *)v8;

    -[SFProgressView setTrackWidth:](v7->_progressView, "setTrackWidth:", 3.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFProgressView setTintColor:](v7->_progressView, "setTintColor:", v10);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFProgressView setTrackTintColor:](v7->_progressView, "setTrackTintColor:", v11);

    -[SFProgressView setUserInteractionEnabled:](v7->_progressView, "setUserInteractionEnabled:", 0);
    -[DownloadProgressButton addSubview:](v7, "addSubview:", v7->_progressView);
    v12 = v7;
  }

  return v7;
}

- (double)progress
{
  double result;

  -[SFProgressView progress](self->_progressView, "progress");
  return result;
}

- (void)setProgress:(double)a3
{
  -[SFProgressView setProgress:](self->_progressView, "setProgress:", a3);
}

- (BOOL)showsProgressRing
{
  return -[SFProgressView isHidden](self->_progressView, "isHidden");
}

- (void)setShowsProgressRing:(BOOL)a3
{
  -[SFProgressView setHidden:](self->_progressView, "setHidden:", !a3);
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGRect v11;
  CGRect v12;

  v10.receiver = self;
  v10.super_class = (Class)DownloadProgressButton;
  -[DownloadProgressButton layoutSubviews](&v10, sel_layoutSubviews);
  -[DownloadProgressButton bounds](self, "bounds");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  v7 = CGRectGetWidth(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v8 = CGRectGetHeight(v12);
  if (v7 >= v8)
    v9 = v8;
  else
    v9 = v7;
  -[SFProgressView setFrame:](self->_progressView, "setFrame:", (v7 - v9) * 0.5, (v8 - v9) * 0.5, v9, v9);
  -[SFProgressView setRadius:](self->_progressView, "setRadius:", v9 * 0.5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressView, 0);
}

@end
