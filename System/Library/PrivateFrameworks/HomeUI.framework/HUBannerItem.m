@implementation HUBannerItem

- (HUBannerItem)initWithHome:(id)a3
{
  id v5;
  HUBannerItem *v6;
  HUBannerItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUBannerItem;
  v6 = -[HUBannerItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_home, a3);

  return v7;
}

- (HMHome)home
{
  return self->_home;
}

- (BOOL)forceShowBanner
{
  return self->_forceShowBanner;
}

- (HUBannerItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUBannerItem.m"), 26, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUBannerItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HUBannerItem home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithHome:", v5);

  return v6;
}

- (void)setForceShowBanner:(BOOL)a3
{
  self->_forceShowBanner = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
}

@end
