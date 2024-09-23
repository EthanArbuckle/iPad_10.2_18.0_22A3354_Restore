@implementation SFFaviconWebsiteCollectionCell

- (void)setURL:(id)a3 withTitle:(id)a4
{
  id v7;
  NSString *v8;
  NSString *title;
  id v10;

  v10 = a3;
  v7 = a4;
  if (!-[NSURL isEqual:](self->_siteURL, "isEqual:", v10)
    || !-[NSString isEqualToString:](self->_title, "isEqualToString:", v7))
  {
    objc_storeStrong((id *)&self->_siteURL, a3);
    v8 = (NSString *)objc_msgSend(v7, "copy");
    title = self->_title;
    self->_title = v8;

    -[SFFaviconWebsiteCollectionCell _requestFavicon](self, "_requestFavicon");
    -[SFFaviconWebsiteCollectionCell _updateContentConfiguration](self, "_updateContentConfiguration");
  }

}

- (void)_updateContentConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[SFFaviconWebsiteCollectionCell defaultContentConfiguration](self, "defaultContentConfiguration");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", self->_title);
  objc_msgSend(v14, "textProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLineBreakMode:", 4);

  objc_msgSend(v14, "textProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberOfLines:", 1);

  objc_msgSend(v14, "secondaryTextProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLineBreakMode:", 4);

  objc_msgSend(v14, "secondaryTextProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfLines:", 1);

  -[NSURL safari_stringForListDisplay](self->_siteURL, "safari_stringForListDisplay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSecondaryText:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "secondaryTextProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setColor:", v8);

  if (self->_favicon)
  {
    objc_msgSend(v14, "setImage:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("globe"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:", v10);

  }
  objc_msgSend(v14, "imageProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerRadius:", 2.0);

  objc_msgSend(v14, "imageProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setReservedLayoutSize:", 24.0, 24.0);

  objc_msgSend(v14, "imageProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMaximumSize:", 24.0, 24.0);

  -[SFFaviconWebsiteCollectionCell setContentConfiguration:](self, "setContentConfiguration:", v14);
}

- (void)_requestFavicon
{
  UIImage *favicon;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id faviconRequestToken;
  _QWORD v9[4];
  id v10;
  id location;

  favicon = self->_favicon;
  self->_favicon = 0;

  objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelRequestWithToken:", self->_faviconRequestToken);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A8E8]), "initWithURL:iconSize:fallbackType:", self->_siteURL, 0, 24.0, 24.0);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__SFFaviconWebsiteCollectionCell__requestFavicon__block_invoke;
  v9[3] = &unk_1E9CF2DE8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v6, "registerRequest:priority:responseHandler:", v5, 2, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  faviconRequestToken = self->_faviconRequestToken;
  self->_faviconRequestToken = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __49__SFFaviconWebsiteCollectionCell__requestFavicon__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v10 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = v10;
    objc_msgSend(v4, "favicon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0D8A9C8];
      objc_msgSend(v4, "favicon");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "resizedImage:withSize:", v7, 24.0, 24.0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = WeakRetained[112];
      WeakRetained[112] = (id)v8;

      objc_msgSend(WeakRetained[112], "sf_registerFaviconForDarkUserInterfaceStyleWithSize:", 24.0, 24.0);
      objc_msgSend(WeakRetained, "_updateContentConfiguration");
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favicon, 0);
  objc_storeStrong(&self->_faviconRequestToken, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_siteURL, 0);
}

@end
