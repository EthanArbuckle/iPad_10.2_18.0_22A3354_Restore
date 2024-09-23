@implementation SSSDittoRemoteView

- (SSSDittoRemoteView)initWithFrame:(CGRect)a3
{
  SSSDittoRemoteView *v3;
  SSSDebugScreenshotMangerView *v4;
  SSSDebugScreenshotMangerView *debugScreenshotManagerView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSSDittoRemoteView;
  v3 = -[SSSDittoRemoteView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (_SSIsScreenshotManagerDebuggingEnabled())
  {
    v4 = objc_alloc_init(SSSDebugScreenshotMangerView);
    debugScreenshotManagerView = v3->_debugScreenshotManagerView;
    v3->_debugScreenshotManagerView = v4;

    -[SSSDittoRemoteView addSubview:](v3, "addSubview:", v3->_debugScreenshotManagerView);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  if (_SSIsScreenshotManagerDebuggingEnabled(self, a2))
  {
    -[SSSDebugScreenshotMangerView intrinsicContentSize](self->_debugScreenshotManagerView, "intrinsicContentSize");
    v4 = v3;
    v6 = v5;
    -[SSSDittoRemoteView bounds](self, "bounds");
    -[SSSDebugScreenshotMangerView setFrame:](self->_debugScreenshotManagerView, "setFrame:", v7 - v4 + 10.0, 10.0, v4, v6);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  void *v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[SSSDittoRemoteView acceptsTouches](self, "acceptsTouches"))
  {
    v11.receiver = self;
    v11.super_class = (Class)SSSDittoRemoteView;
    v8 = -[SSSDittoRemoteView hitTest:withEvent:](&v11, "hitTest:withEvent:", v7, x, y);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)acceptsTouches
{
  return self->_acceptsTouches;
}

- (void)setAcceptsTouches:(BOOL)a3
{
  self->_acceptsTouches = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugScreenshotManagerView, 0);
}

@end
