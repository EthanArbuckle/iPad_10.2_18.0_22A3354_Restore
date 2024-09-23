@implementation SUUIFacebookPageSection

- (SUUIFacebookPageSection)initWithPageComponent:(id)a3
{
  SUUIFacebookPageSection *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIFacebookPageSection;
  result = -[SUUIStorePageSection initWithPageComponent:](&v4, sel_initWithPageComponent_, a3);
  if (result)
    result->_facebookAccountsExist = -1;
  return result;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)SUUIAccountsFramework();
  objc_msgSend(v3, "removeObserver:name:object:", self, *(_QWORD *)SUUIWeakLinkedSymbolForString("ACAccountStoreDidChangeNotification", v4), 0);

  -[SUUIReviewsFacebookView likeToggleButton](self->_facebookView, "likeToggleButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTarget:action:forControlEvents:", self, 0, 64);

  v6.receiver = self;
  v6.super_class = (Class)SUUIFacebookPageSection;
  -[SUUIStorePageSection dealloc](&v6, sel_dealloc);
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addItemViewElement:", v6);

}

- (int64_t)applyUpdateType:(int64_t)a3
{
  if (a3 != 2)
    -[SUUIFacebookPageSection _applyColorSchemeToFacebookView:](self, "_applyColorSchemeToFacebookView:", self->_facebookView);
  return a3;
}

- (id)cellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[SUUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("SUUIFacebookPageSectionReuseIdentifier"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIFacebookPageSection _facebookView](self, "_facebookView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentChildView:", v8);

  objc_msgSend(v7, "setContentInsets:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  CGSize result;

  -[SUUIStorePageSection context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activePageWidth");
  v6 = v5;

  -[SUUIFacebookPageSection _facebookView](self, "_facebookView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "sizeThatFits:", v6, *(double *)(MEMORY[0x24BDBF148] + 8));
    v10 = v9;
  }
  else
  {
    *(double *)&v10 = 79.0;
  }

  v11 = v6;
  v12 = *(double *)&v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeMetricsImpressionSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginActiveImpressionForViewElement:", v6);

  v9.receiver = self;
  v9.super_class = (Class)SUUIFacebookPageSection;
  -[SUUIStorePageSection collectionViewWillDisplayCellForItemAtIndexPath:](&v9, sel_collectionViewWillDisplayCellForItemAtIndexPath_, v4);

}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeMetricsImpressionSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endActiveImpressionForViewElement:", v6);

  v9.receiver = self;
  v9.super_class = (Class)SUUIFacebookPageSection;
  -[SUUIStorePageSection collectionViewDidEndDisplayingCellForItemAtIndexPath:](&v9, sel_collectionViewDidEndDisplayingCellForItemAtIndexPath_, v4);

}

- (int64_t)numberOfCells
{
  return -[SUUIFacebookPageSection _facebookAccountsExist](self, "_facebookAccountsExist") != 0;
}

- (void)willAppearInContext:(id)a3
{
  id v4;
  void *v5;
  SUUIViewElementLayoutContext *v6;
  SUUIViewElementLayoutContext *v7;
  SUUIViewElementLayoutContext *layoutContext;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("SUUIFacebookPageSectionReuseIdentifier"));
  v6 = self->_layoutContext;
  v7 = -[SUUIViewElementLayoutContext initWithStorePageSectionContext:previousLayoutContext:]([SUUIViewElementLayoutContext alloc], "initWithStorePageSectionContext:previousLayoutContext:", v4, v6);
  layoutContext = self->_layoutContext;
  self->_layoutContext = v7;

  -[SUUIFacebookPageSection _applyColorSchemeToFacebookView:](self, "_applyColorSchemeToFacebookView:", self->_facebookView);
  -[SUUIFacebookPageSection _reloadLikeStatus](self, "_reloadLikeStatus");
  v9.receiver = self;
  v9.super_class = (Class)SUUIFacebookPageSection;
  -[SUUIStorePageSection willAppearInContext:](&v9, sel_willAppearInContext_, v4);

}

- (void)_toggleLikeAction:(id)a3
{
  id v4;
  _BOOL4 v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  SUUIFacebookLikeStatus *likeStatus;
  void *v12;
  _QWORD aBlock[4];
  id v14;
  BOOL v15;
  id location;

  v4 = a3;
  v5 = -[SUUIFacebookLikeStatus isUserLiked](self->_likeStatus, "isUserLiked");
  v6 = v5;
  -[SUUIFacebookPageSection _changeStatusToUserLiked:](self, "_changeStatusToUserLiked:", !v5);
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__SUUIFacebookPageSection__toggleLikeAction___block_invoke;
  aBlock[3] = &unk_2511F76E0;
  objc_copyWeak(&v14, &location);
  v15 = v6;
  v7 = _Block_copy(aBlock);
  v8 = SUUISocialFramework();
  objc_msgSend(SUUIWeakLinkedClassForString(CFSTR("SLFacebookSession"), v8), "sharedSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SUUIFacebookLikeStatus isUserLiked](self->_likeStatus, "isUserLiked");
  likeStatus = self->_likeStatus;
  if (v10)
  {
    -[SUUIFacebookLikeStatus URL](likeStatus, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "likeURL:completion:", v12, v7);
  }
  else
  {
    -[SUUIFacebookLikeStatus URL](likeStatus, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unlikeURL:completion:", v12, v7);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __45__SUUIFacebookPageSection__toggleLikeAction___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  if (a2)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __45__SUUIFacebookPageSection__toggleLikeAction___block_invoke_2;
    v3[3] = &unk_2511F76B8;
    objc_copyWeak(&v4, (id *)(a1 + 32));
    v5 = *(_BYTE *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], v3);
    objc_destroyWeak(&v4);
  }
}

void __45__SUUIFacebookPageSection__toggleLikeAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_changeStatusToUserLiked:", *(_BYTE *)(a1 + 40) == 0);

}

- (void)_accountStoreDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__SUUIFacebookPageSection__accountStoreDidChangeNotification___block_invoke;
  block[3] = &unk_2511F47C0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __62__SUUIFacebookPageSection__accountStoreDidChangeNotification___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(char *)(v1 + 96);
  if (v2 != -1)
  {
    v3 = result;
    *(_BYTE *)(v1 + 96) = -1;
    v4 = objc_msgSend(*(id *)(result + 32), "_facebookAccountsExist");
    result = *(_QWORD *)(v3 + 32);
    if (v4 == v2)
    {
      if (!*(_BYTE *)(result + 112))
      {
        objc_msgSend((id)result, "_resetState");
        return objc_msgSend(*(id *)(v3 + 32), "_reloadLikeStatus");
      }
    }
    else
    {
      objc_msgSend((id)result, "_resetState");
      return objc_msgSend(*(id *)(v3 + 32), "_reloadCollectionViewSection");
    }
  }
  return result;
}

- (id)_accountStore
{
  ACAccountStore *accountStore;
  uint64_t v4;
  ACAccountStore *v5;
  ACAccountStore *v6;
  void *v7;
  void *v8;

  accountStore = self->_accountStore;
  if (!accountStore)
  {
    v4 = SUUIAccountsFramework();
    v5 = (ACAccountStore *)objc_alloc_init((Class)SUUIWeakLinkedClassForString(CFSTR("ACAccountStore"), v4));
    v6 = self->_accountStore;
    self->_accountStore = v5;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)SUUIAccountsFramework();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__accountStoreDidChangeNotification_, *(_QWORD *)SUUIWeakLinkedSymbolForString("ACAccountStoreDidChangeNotification", v8), 0);

    accountStore = self->_accountStore;
  }
  return accountStore;
}

- (void)_applyColorSchemeToFacebookView:(id)a3
{
  void *v4;
  void *v5;
  SUUIColorScheme *v6;
  void *v7;
  SUUIColorScheme *v8;
  SUUIReviewsFacebookView *facebookView;
  SUUIColorScheme *v10;
  SUUIReviewsFacebookView *v11;
  id v12;

  if (a3)
  {
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "style");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v6 = objc_alloc_init(SUUIColorScheme);
      -[SUUIViewElementLayoutContext tintColor](self->_layoutContext, "tintColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      SUUIViewElementPlainColorWithStyle(v12, v7);
      v8 = (SUUIColorScheme *)objc_claimAutoreleasedReturnValue();

      -[SUUIColorScheme setPrimaryTextColor:](v6, "setPrimaryTextColor:", v8);
      -[SUUIColorScheme setSecondaryTextColor:](v6, "setSecondaryTextColor:", v8);
      facebookView = self->_facebookView;
      v10 = v6;
    }
    else
    {
      -[SUUIStorePageSection context](self, "context");
      v6 = (SUUIColorScheme *)objc_claimAutoreleasedReturnValue();
      v11 = self->_facebookView;
      -[SUUIColorScheme colorScheme](v6, "colorScheme");
      v8 = (SUUIColorScheme *)objc_claimAutoreleasedReturnValue();
      facebookView = v11;
      v10 = v8;
    }
    -[SUUIReviewsFacebookView setColorScheme:](facebookView, "setColorScheme:", v10);

  }
}

- (void)_changeStatusToUserLiked:(BOOL)a3
{
  _BOOL8 v3;
  SUUIFacebookLikeStatus *v5;
  SUUIFacebookLikeStatus *likeStatus;
  SUUIFacebookLikeStatus *v7;

  v3 = a3;
  v5 = (SUUIFacebookLikeStatus *)-[SUUIFacebookLikeStatus copy](self->_likeStatus, "copy");
  -[SUUIFacebookLikeStatus setUserLiked:](v5, "setUserLiked:", v3);
  likeStatus = self->_likeStatus;
  self->_likeStatus = v5;
  v7 = v5;

  -[SUUIReviewsFacebookView setUserLiked:](self->_facebookView, "setUserLiked:", v3);
  -[SUUIFacebookPageSection _reloadCollectionViewSection](self, "_reloadCollectionViewSection");
}

- (int64_t)_facebookAccountsExist
{
  int facebookAccountsExist;
  void *v4;
  void *v5;
  void *v6;

  facebookAccountsExist = self->_facebookAccountsExist;
  if (facebookAccountsExist == 255)
  {
    -[SUUIFacebookPageSection _accountStore](self, "_accountStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_class();
    v6 = (void *)SUUIAccountsFramework();
    self->_facebookAccountsExist = objc_msgSend(v5, "accountsWithAccountTypeIdentifierExist:", *(_QWORD *)SUUIWeakLinkedSymbolForString("ACAccountTypeIdentifierFacebook", v6)) != 0;

    LOBYTE(facebookAccountsExist) = self->_facebookAccountsExist;
  }
  return (char)facebookAccountsExist;
}

- (id)_facebookView
{
  SUUIReviewsFacebookView *facebookView;
  void *v4;
  SUUIReviewsFacebookView *v5;
  void *v6;
  SUUIReviewsFacebookView *v7;
  SUUIReviewsFacebookView *v8;
  void *v9;
  SUUIReviewsFacebookView *v10;
  void *v11;

  facebookView = self->_facebookView;
  if (!facebookView)
  {
    if (self->_likeStatus)
    {
      -[SUUIStorePageSection context](self, "context");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = [SUUIReviewsFacebookView alloc];
      objc_msgSend(v4, "clientContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[SUUIReviewsFacebookView initWithClientContext:](v5, "initWithClientContext:", v6);
      v8 = self->_facebookView;
      self->_facebookView = v7;

      -[SUUIReviewsFacebookView likeToggleButton](self->_facebookView, "likeToggleButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel__toggleLikeAction_, 64);

      v10 = self->_facebookView;
      -[SUUIFacebookLikeStatus friendNames](self->_likeStatus, "friendNames");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIReviewsFacebookView setFriendNames:](v10, "setFriendNames:", v11);

      -[SUUIReviewsFacebookView setUserLiked:](self->_facebookView, "setUserLiked:", -[SUUIFacebookLikeStatus isUserLiked](self->_likeStatus, "isUserLiked"));
      -[SUUIFacebookPageSection _applyColorSchemeToFacebookView:](self, "_applyColorSchemeToFacebookView:", self->_facebookView);

      facebookView = self->_facebookView;
    }
    else
    {
      facebookView = 0;
    }
  }
  return facebookView;
}

- (void)_finishLookupWithStatus:(id)a3 error:(id)a4
{
  SUUIFacebookLikeStatus **p_likeStatus;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SUUIReviewsFacebookView *facebookView;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  self->_isLoadingLikeStatus = 0;
  p_likeStatus = &self->_likeStatus;
  objc_storeStrong((id *)&self->_likeStatus, a3);
  if (self->_likeStatus)
  {
    -[SUUIStorePageSection context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForItemAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    facebookView = self->_facebookView;
    if (facebookView)
    {
      -[SUUIFacebookLikeStatus friendNames](*p_likeStatus, "friendNames");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIReviewsFacebookView setFriendNames:](facebookView, "setFriendNames:", v12);

      -[SUUIReviewsFacebookView setUserLiked:](self->_facebookView, "setUserLiked:", -[SUUIFacebookLikeStatus isUserLiked](*p_likeStatus, "isUserLiked"));
    }
    else if (v10)
    {
      -[SUUIFacebookPageSection _facebookView](self, "_facebookView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setContentChildView:", v13);

    }
    else
    {
      -[SUUIFacebookPageSection _reloadCollectionViewSection](self, "_reloadCollectionViewSection");
    }

  }
  else if (self->_facebookAccountsExist == 1)
  {
    self->_facebookAccountsExist = 0;
    -[SUUIFacebookPageSection _reloadCollectionViewSection](self, "_reloadCollectionViewSection");
  }

}

- (void)_reloadCollectionViewSection
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_msgSend(MEMORY[0x24BEBDB00], "areAnimationsEnabled");
  objc_msgSend(MEMORY[0x24BEBDB00], "setAnimationsEnabled:", 0);
  -[SUUIStorePageSection context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadSections:", v6);

  objc_msgSend(MEMORY[0x24BEBDB00], "setAnimationsEnabled:", v3);
}

- (void)_reloadLikeStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v5);
    objc_initWeak(&location, self);
    v7 = SUUISocialFramework();
    objc_msgSend(SUUIWeakLinkedClassForString(CFSTR("SLFacebookSession"), v7), "sharedSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __44__SUUIFacebookPageSection__reloadLikeStatus__block_invoke;
    v10[3] = &unk_2511FCCF0;
    v9 = v6;
    v11 = v9;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v8, "fetchLikeStatusForURL:flags:completion:", v9, 9, v10);
    self->_isLoadingLikeStatus = 1;
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }

}

void __44__SUUIFacebookPageSection__reloadLikeStatus__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __44__SUUIFacebookPageSection__reloadLikeStatus__block_invoke_2;
  v9[3] = &unk_2511F50B0;
  v10 = v5;
  v11 = *(id *)(a1 + 32);
  v7 = v5;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v12 = v6;
  v8 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

  objc_destroyWeak(&v13);
}

void __44__SUUIFacebookPageSection__reloadLikeStatus__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  SUUIFacebookLikeStatus *v3;

  if (*(_QWORD *)(a1 + 32))
    v3 = -[SUUIFacebookLikeStatus initWithURL:likeStatusDictionary:]([SUUIFacebookLikeStatus alloc], "initWithURL:likeStatusDictionary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  else
    v3 = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_finishLookupWithStatus:error:", v3, *(_QWORD *)(a1 + 48));

}

- (void)_resetState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SUUIReviewsFacebookView *facebookView;
  SUUIFacebookLikeStatus *likeStatus;
  id v9;

  -[SUUIStorePageSection context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellForItemAtIndexPath:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setContentChildView:", 0);
  -[SUUIReviewsFacebookView likeToggleButton](self->_facebookView, "likeToggleButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  facebookView = self->_facebookView;
  self->_facebookView = 0;

  likeStatus = self->_likeStatus;
  self->_likeStatus = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_likeStatus, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_facebookView, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
