@implementation CKAvatarView

- (void)_ck_setContextToken:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CNAvatarView setContextToken:](self, "setContextToken:", v4);

}

- (CKAvatarView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CKAvatarView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = -[CKAvatarView init](self, "init");
  -[CKAvatarView setFrame:](v7, "setFrame:", x, y, width, height);
  return v7;
}

- (CKAvatarView)init
{
  objc_super v4;

  if (init_onceToken != -1)
    dispatch_once(&init_onceToken, &__block_literal_global_206);
  v4.receiver = self;
  v4.super_class = (Class)CKAvatarView;
  return -[CNAvatarView initWithSettings:](&v4, sel_initWithSettings_, init_s_settings);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CKAvatarView;
  -[CNAvatarView layoutSubviews](&v2, sel_layoutSubviews);
}

void __20__CKAvatarView_init__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  if (CKIsRunningInMacCatalyst())
    v0 = 1000;
  else
    v0 = 50;
  objc_msgSend(MEMORY[0x1E0C97480], "defaultSettingsWithCacheSize:threeDTouchEnabled:", v0, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)init_s_settings;
  init_s_settings = v1;

}

- (NSString)_ck_contextToken
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CNAvatarView contextToken](self, "contextToken");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (NSString)preferredHandle
{
  return (NSString *)objc_loadWeakRetained((id *)&self->_preferredHandle);
}

- (void)setPreferredHandle:(id)a3
{
  objc_storeWeak((id *)&self->_preferredHandle, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_preferredHandle);
  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end
