@implementation SUUIJSNavigationDocument

- (void)showStopPageForTab:(id)a3 replacementAppAdamId:(id)a4 title:(id)a5 subtitle:(id)a6 artwork:(id)a7 deeplinkUrl:(id)a8 force:(BOOL)a9 purchasesUrl:(id)a10 wishlistButtonTitle:(id)a11 showWishlistButton:(BOOL)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  char isKindOfClass;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;

  v30 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a10;
  v24 = a11;
  -[IKJSNavigationDocument navigationControllerDelegate](self, "navigationControllerDelegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[IKJSNavigationDocument navigationControllerDelegate](self, "navigationControllerDelegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v29) = a12;
    LOBYTE(v28) = a9;
    objc_msgSend(v27, "showStopPageForTab:replacementAppAdamId:title:subtitle:artwork:deeplinkUrl:force:purchasesUrl:wishlistButtonTitle:showWishlistButton:", v30, v18, v19, v20, v21, v22, v28, v23, v24, v29);

  }
}

- (BOOL)isStopPageEnabledForTab:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  char v8;

  v4 = a3;
  -[IKJSNavigationDocument navigationControllerDelegate](self, "navigationControllerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[IKJSNavigationDocument navigationControllerDelegate](self, "navigationControllerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isStopPageEnabledForTab:", v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isStopPageBagValueOverrideEnabledForTab:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  char v8;

  v4 = a3;
  -[IKJSNavigationDocument navigationControllerDelegate](self, "navigationControllerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[IKJSNavigationDocument navigationControllerDelegate](self, "navigationControllerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isStopPageBagValueOverrideEnabledForTab:", v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
