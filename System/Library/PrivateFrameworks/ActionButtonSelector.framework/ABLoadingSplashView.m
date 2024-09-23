@implementation ABLoadingSplashView

+ (id)settingsSplashView
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_self()), "initWithAssistantMode:", 0);
}

+ (id)assistantSplashView
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_self()), "initWithAssistantMode:", 1);
}

- (ABLoadingSplashView)initWithAssistantMode:(BOOL)a3
{
  _BOOL4 v3;
  ABLoadingSplashView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  UIImageView *imageView;
  objc_super v13;

  v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ABLoadingSplashView;
  v4 = -[ABLoadingSplashView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v4)
  {
    ABSnapshotImageName(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageNamed:inBundle:withConfiguration:", v5, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      ABLogger();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ABLoadingSplashView initWithAssistantMode:].cold.1((uint64_t)v5, v9);

    }
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v8);
    imageView = v4->_imageView;
    v4->_imageView = (UIImageView *)v10;

    -[ABLoadingSplashView addSubview:](v4, "addSubview:", v4->_imageView);
  }
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ABLoadingSplashView;
  -[ABLoadingSplashView layoutSubviews](&v3, sel_layoutSubviews);
  -[ABLoadingSplashView bounds](self, "bounds");
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

- (void)initWithAssistantMode:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_235E72000, a2, OS_LOG_TYPE_ERROR, "Failed to load snapshot image for name: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
