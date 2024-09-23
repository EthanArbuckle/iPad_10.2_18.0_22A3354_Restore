@implementation CPSBannerView

- (CPSBannerView)initWithBannerItem:(id)a3
{
  CPSBannerView *v3;
  CPSBannerView *v5;
  objc_super v6;
  id location[2];
  CPSBannerView *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)CPSBannerView;
  v8 = -[CPSBannerView init](&v6, sel_init);
  objc_storeStrong((id *)&v8, v8);
  if (v8)
    objc_storeStrong((id *)&v8->_bannerItem, location[0]);
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (void)updateBannerWithBannerItem:(id)a3
{
  id location[2];
  CPSBannerView *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[CPSBannerView setBannerItem:](v4, "setBannerItem:", location[0]);
  objc_storeStrong(location, 0);
}

- (id)applicationIconImage
{
  void *v3;
  id v4;
  NSString *v5;
  CPSBannerItem *v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDF6AC8];
  v6 = -[CPSBannerView bannerItem](self, "bannerItem");
  v5 = -[CPSBannerItem bundleIdentifier](v6, "bundleIdentifier");
  v4 = (id)-[CPSBannerView traitCollection](self, "traitCollection");
  objc_msgSend(v4, "displayScale");
  v7 = (id)objc_msgSend(v3, "_applicationIconImageForBundleIdentifier:format:scale:", v5, 9);

  return v7;
}

- (CPSBannerItem)bannerItem
{
  return self->_bannerItem;
}

- (void)setBannerItem:(id)a3
{
  objc_storeStrong((id *)&self->_bannerItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerItem, 0);
}

@end
