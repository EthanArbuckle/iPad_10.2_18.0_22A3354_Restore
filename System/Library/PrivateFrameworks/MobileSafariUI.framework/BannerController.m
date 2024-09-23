@implementation BannerController

- (SFPinnableBanner)tabGroupBanner
{
  return self->_tabGroupBanner;
}

- (NSArray)topBanners
{
  return self->_topBanners;
}

- (BannerControllerDelegate)delegate
{
  return (BannerControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)indexOfFirstBannerSeparableFromStatusBar
{
  return -[NSArray indexOfObjectPassingTest:](self->_topBanners, "indexOfObjectPassingTest:", &__block_literal_global_3);
}

- (SFPinnableBanner)crashBanner
{
  return self->_crashBanner;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)topBannersAnchoredToStatusBar
{
  unint64_t v3;
  NSArray *v4;

  v3 = -[BannerController indexOfFirstBannerSeparableFromStatusBar](self, "indexOfFirstBannerSeparableFromStatusBar");
  if (v3)
  {
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 = self->_topBanners;
    }
    else
    {
      -[NSArray subarrayWithRange:](self->_topBanners, "subarrayWithRange:", 0, v3);
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = (NSArray *)MEMORY[0x1E0C9AA60];
  }
  return v4;
}

- (void)setTabGroupBanner:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  SFPinnableBanner *v7;
  id WeakRetained;
  id v9;

  v4 = a4;
  v9 = a3;
  v7 = self->_tabGroupBanner;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_tabGroupBanner, a3);
    -[BannerController _updateTopBanners](self, "_updateTopBanners");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "bannerController:didSetTabGroupBanner:previousBanner:animated:", self, v9, v7, v4);

  }
}

- (void)setAppBanner:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  SFPinnableBanner *v7;
  id WeakRetained;
  id v9;

  v4 = a4;
  v9 = a3;
  v7 = self->_appBanner;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_appBanner, a3);
    -[BannerController _updateTopBanners](self, "_updateTopBanners");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "bannerController:didSetAppBanner:previousBanner:animated:", self, v9, v7, v4);

  }
}

- (void)setCrashBanner:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  SFPinnableBanner *v7;
  id WeakRetained;
  id v9;

  v4 = a4;
  v9 = a3;
  v7 = self->_crashBanner;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_crashBanner, a3);
    -[BannerController _updateTopBanners](self, "_updateTopBanners");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "bannerController:didSetCrashBanner:previousBanner:animated:", self, v9, v7, v4);

  }
}

- (void)setWebExtensionBanner:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  SFPinnableBanner *v7;
  id WeakRetained;
  id v9;

  v4 = a4;
  v9 = a3;
  v7 = self->_webExtensionBanner;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_webExtensionBanner, a3);
    -[BannerController _updateTopBanners](self, "_updateTopBanners");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "bannerController:didSetWebExtensionBanner:previousBanner:animated:", self, v9, v7, v4);

  }
}

- (void)setWebExtensionPermissionGrantedBanner:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  SFPinnableBanner *v7;
  id WeakRetained;
  id v9;

  v4 = a4;
  v9 = a3;
  v7 = self->_webExtensionPermissionGrantedBanner;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_webExtensionPermissionGrantedBanner, a3);
    -[BannerController _updateTopBanners](self, "_updateTopBanners");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "bannerController:didSetWebExtensionPermissionGrantedBanner:previousBanner:animated:", self, v9, v7, v4);

  }
}

- (void)setRemotelyEnabledExtensionBanner:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  SFPinnableBanner *v7;
  id WeakRetained;
  id v9;

  v4 = a4;
  v9 = a3;
  v7 = self->_remotelyEnabledExtensionBanner;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_remotelyEnabledExtensionBanner, a3);
    -[BannerController _updateTopBanners](self, "_updateTopBanners");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "bannerController:didSetRemotelyEnabledExtensionBanner:previousBanner:animated:", self, v9, v7, v4);

  }
}

- (void)setPrivateBrowsingPrivacyProtectionsBanner:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  SFPinnableBanner *v7;
  id WeakRetained;
  id v9;

  v4 = a4;
  v9 = a3;
  v7 = self->_privateBrowsingPrivacyProtectionsBanner;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_privateBrowsingPrivacyProtectionsBanner, a3);
    -[BannerController _updateTopBanners](self, "_updateTopBanners");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "bannerController:didSetPrivateBrowsingPrivacyProtectionsBanner:previousBanner:animated:", self, v9, v7, v4);

  }
}

- (void)_updateTopBanners
{
  void *v3;
  id v4;
  void (**v5)(void *, SFPinnableBanner *);
  NSArray *v6;
  NSArray *topBanners;
  _QWORD aBlock[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__BannerController__updateTopBanners__block_invoke;
  aBlock[3] = &unk_1E9CF6370;
  v9 = v3;
  v4 = v3;
  v5 = (void (**)(void *, SFPinnableBanner *))_Block_copy(aBlock);
  v5[2](v5, self->_tabGroupBanner);
  v5[2](v5, self->_crashBanner);
  v5[2](v5, self->_appBanner);
  v5[2](v5, self->_webExtensionBanner);
  v5[2](v5, self->_webExtensionPermissionGrantedBanner);
  v5[2](v5, self->_remotelyEnabledExtensionBanner);
  v5[2](v5, self->_privateBrowsingPrivacyProtectionsBanner);
  objc_msgSend(v4, "sortWithOptions:usingComparator:", 16, &__block_literal_global_35);
  v6 = (NSArray *)objc_msgSend(v4, "copy");
  topBanners = self->_topBanners;
  self->_topBanners = v6;

}

void __37__BannerController__updateTopBanners__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    v5 = objc_msgSend(v3, "isHidden");
    v4 = v6;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
      v4 = v6;
    }
  }

}

uint64_t __37__BannerController__updateTopBanners__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  unsigned int v10;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "separableFromStatusBar");
  v7 = objc_msgSend(v5, "separableFromStatusBar");
  if (v6 && !v7)
    goto LABEL_3;
  if ((v6 | v7 ^ 1) != 1)
  {
    v8 = -1;
    goto LABEL_9;
  }
  v9 = objc_msgSend(v4, "isPinnedToTop");
  v10 = objc_msgSend(v5, "isPinnedToTop");
  if (((v9 ^ 1) & 1) != 0 || v10)
    v8 = (uint64_t)((unint64_t)((v9 ^ 1) & v10) << 63) >> 63;
  else
LABEL_3:
    v8 = 1;
LABEL_9:

  return v8;
}

- (NSArray)topBannersSeparableFromStatusBar
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  NSArray *v6;

  v3 = -[BannerController indexOfFirstBannerSeparableFromStatusBar](self, "indexOfFirstBannerSeparableFromStatusBar");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v5 = v3;
    v6 = self->_topBanners;
    -[NSArray subarrayWithRange:](v6, "subarrayWithRange:", v5, -[NSArray count](v6, "count") - v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSArray *)v4;
}

uint64_t __60__BannerController_indexOfFirstBannerSeparableFromStatusBar__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "separableFromStatusBar");
}

- (SFPinnableBanner)appBanner
{
  return self->_appBanner;
}

- (SFPinnableBanner)webExtensionBanner
{
  return self->_webExtensionBanner;
}

- (SFPinnableBanner)remotelyEnabledExtensionBanner
{
  return self->_remotelyEnabledExtensionBanner;
}

- (SFPinnableBanner)webExtensionPermissionGrantedBanner
{
  return self->_webExtensionPermissionGrantedBanner;
}

- (SFPinnableBanner)privateBrowsingPrivacyProtectionsBanner
{
  return self->_privateBrowsingPrivacyProtectionsBanner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topBanners, 0);
  objc_storeStrong((id *)&self->_tabGroupBanner, 0);
  objc_storeStrong((id *)&self->_privateBrowsingPrivacyProtectionsBanner, 0);
  objc_storeStrong((id *)&self->_webExtensionPermissionGrantedBanner, 0);
  objc_storeStrong((id *)&self->_remotelyEnabledExtensionBanner, 0);
  objc_storeStrong((id *)&self->_webExtensionBanner, 0);
  objc_storeStrong((id *)&self->_crashBanner, 0);
  objc_storeStrong((id *)&self->_appBanner, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
