@implementation _SFAddToHomeScreenActivity

- (_SFAddToHomeScreenActivity)initWithWebView:(id)a3
{
  id v5;
  _SFAddToHomeScreenActivity *v6;
  _SFAddToHomeScreenActivity *v7;
  _SFAddToHomeScreenActivity *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFAddToHomeScreenActivity;
  v6 = -[UIActivity init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_webView, a3);
    v8 = v7;
  }

  return v7;
}

- (id)activityType
{
  return CFSTR("com.apple.mobilesafari.activity.addToHomeScreen");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v4;
  BOOL v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (!self->_webView)
    return 0;
  v8[0] = self->_webView;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)_SFAddToHomeScreenActivity;
  v5 = -[UIAddToHomeScreenActivity canPerformWithActivityItems:](&v7, sel_canPerformWithActivityItems_, v4);

  return v5;
}

- (void)prepareWithActivityItems:(id)a3
{
  void *v4;
  objc_super v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (self->_webView)
  {
    v6[0] = self->_webView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5.receiver = self;
    v5.super_class = (Class)_SFAddToHomeScreenActivity;
    -[UIAddToHomeScreenActivity prepareWithActivityItems:](&v5, sel_prepareWithActivityItems_, v4);

  }
}

- (BOOL)_showsInSystemActionGroup
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
}

@end
