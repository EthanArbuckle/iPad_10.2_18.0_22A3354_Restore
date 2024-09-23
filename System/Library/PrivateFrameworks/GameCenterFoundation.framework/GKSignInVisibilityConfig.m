@implementation GKSignInVisibilityConfig

- (GKSignInVisibilityConfig)init
{
  GKSignInVisibilityConfig *v2;
  GKLimitedPresentationConfig *v3;
  GKLimitedPresentationConfig *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKSignInVisibilityConfig;
  v2 = -[GKSignInVisibilityConfig init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(GKLimitedPresentationConfig);
    -[GKSignInVisibilityConfig setBannerConfig:](v2, "setBannerConfig:", v3);

    v4 = objc_alloc_init(GKLimitedPresentationConfig);
    -[GKSignInVisibilityConfig setSheetConfig:](v2, "setSheetConfig:", v4);

  }
  return v2;
}

- (GKLimitedPresentationConfig)sheetConfig
{
  return self->_sheetConfig;
}

- (void)setSheetConfig:(id)a3
{
  objc_storeStrong((id *)&self->_sheetConfig, a3);
}

- (GKLimitedPresentationConfig)bannerConfig
{
  return self->_bannerConfig;
}

- (void)setBannerConfig:(id)a3
{
  objc_storeStrong((id *)&self->_bannerConfig, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerConfig, 0);
  objc_storeStrong((id *)&self->_sheetConfig, 0);
}

@end
