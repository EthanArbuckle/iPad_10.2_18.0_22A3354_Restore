@implementation MSTrackListHeaderView

- (MSTrackListHeaderView)initWithFrame:(CGRect)a3
{
  MSTrackListHeaderView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSTrackListHeaderView;
  v3 = -[MSTrackListHeaderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__purchasesChangedNotification_, *MEMORY[0x24BEC8ED0], 0);
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC8ED0], 0);

  self->_artworkImage = 0;
  self->_item = 0;
  -[UILabel removeFromSuperview](self->_albumLabel, "removeFromSuperview");

  self->_albumLabel = 0;
  -[UILabel removeFromSuperview](self->_artistLabel, "removeFromSuperview");

  self->_artistLabel = 0;
  -[UILabel removeFromSuperview](self->_disclaimerLabel, "removeFromSuperview");

  self->_disclaimerLabel = 0;
  -[UILabel removeFromSuperview](self->_itemCountLabel, "removeFromSuperview");

  self->_itemCountLabel = 0;
  -[UILabel removeFromSuperview](self->_releaseDateLabel, "removeFromSuperview");

  self->_releaseDateLabel = 0;
  -[SUReflectionImageView removeFromSuperview](self->_artworkView, "removeFromSuperview");

  self->_artworkView = 0;
  -[SUItemOfferButton removeTarget:action:forControlEvents:](self->_offerButton, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  -[SUItemOfferButton removeFromSuperview](self->_offerButton, "removeFromSuperview");

  self->_offerButton = 0;
  -[SUTouchCaptureView removeTarget:action:forControlEvents:](self->_touchCaptureView, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  -[SUTouchCaptureView removeFromSuperview](self->_touchCaptureView, "removeFromSuperview");

  self->_touchCaptureView = 0;
  v4.receiver = self;
  v4.super_class = (Class)MSTrackListHeaderView;
  -[MSTrackListHeaderView dealloc](&v4, sel_dealloc);
}

- (void)reloadView
{
  -[MSTrackListHeaderView _reloadAlbumLabel](self, "_reloadAlbumLabel");
  -[MSTrackListHeaderView _reloadArtistLabel](self, "_reloadArtistLabel");
  -[MSTrackListHeaderView _reloadArtworkView](self, "_reloadArtworkView");
  -[MSTrackListHeaderView _reloadDisclaimerLabel](self, "_reloadDisclaimerLabel");
  -[MSTrackListHeaderView _reloadItemCountLabel](self, "_reloadItemCountLabel");
  -[MSTrackListHeaderView _reloadOfferButton](self, "_reloadOfferButton");
  -[MSTrackListHeaderView _reloadReleaseDateLabel](self, "_reloadReleaseDateLabel");
  -[MSTrackListHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  SUReflectionImageView *artworkView;
  double v6;
  double v7;
  double v8;
  double v9;
  UILabel *albumLabel;
  double v11;
  double v12;
  double v13;
  UILabel *artistLabel;
  double v15;
  double v16;
  double v17;
  double v18;
  UILabel *itemCountLabel;
  double v20;
  UILabel *releaseDateLabel;
  double v22;
  double v23;
  double v24;
  double v25;
  SUItemOfferButton *offerButton;
  double v27;
  double v28;
  float v29;
  double MaxY;
  UILabel *v31;
  UILabel *v32;
  UILabel *v33;
  UILabel *v34;
  SUItemOfferButton *v35;
  UILabel *disclaimerLabel;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  -[MSTrackListHeaderView bounds](self, "bounds");
  v4 = v3;
  artworkView = self->_artworkView;
  if (artworkView)
  {
    -[SUReflectionImageView frame](artworkView, "frame");
    -[SUReflectionImageView setFrame:](self->_artworkView, "setFrame:", 7.0, 7.0);
  }
  v6 = v4 + -7.0;
  v7 = *MEMORY[0x24BDBF090];
  v9 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
  albumLabel = self->_albumLabel;
  if (albumLabel)
  {
    -[UILabel frame](albumLabel, "frame");
    -[UILabel setFont:](self->_albumLabel, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 20.0));
    -[MSTrackListHeaderView _sizeThatFitsLabel:size:numberOfLines:](self, "_sizeThatFitsLabel:size:numberOfLines:", self->_albumLabel, 2, v6 + -102.0, 1.79769313e308);
    v45 = v11;
    v46 = v12;
    v13 = v12 + 0.0;
    v41 = 102.0;
  }
  else
  {
    v13 = 0.0;
    v45 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v46 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v41 = *MEMORY[0x24BDBF090];
  }
  artistLabel = self->_artistLabel;
  if (artistLabel)
  {
    -[UILabel frame](artistLabel, "frame");
    v16 = v15;
    v17 = v6 + -102.0;
    v13 = v13 + v15;
    v18 = 102.0;
  }
  else
  {
    v16 = v8;
    v17 = v9;
    v18 = v7;
  }
  itemCountLabel = self->_itemCountLabel;
  if (itemCountLabel)
  {
    -[UILabel frame](itemCountLabel, "frame");
    v43 = v6 + -102.0;
    v44 = v20;
    v13 = v13 + v20;
    v42 = 102.0;
  }
  else
  {
    v43 = v9;
    v44 = v8;
    v42 = v7;
  }
  v48 = v7;
  v49 = v8;
  releaseDateLabel = self->_releaseDateLabel;
  v47 = v6;
  v22 = v9;
  if (releaseDateLabel)
  {
    -[UILabel frame](releaseDateLabel, "frame");
    v24 = v23;
    v25 = v6 + -102.0;
    v13 = v13 + v23;
    v7 = 102.0;
  }
  else
  {
    v25 = v9;
    v24 = v49;
  }
  offerButton = self->_offerButton;
  if (offerButton)
  {
    -[SUItemOfferButton frame](offerButton, "frame");
    v22 = v27;
    v49 = v28;
    v13 = v13 + v28;
    v48 = 103.0;
  }
  v29 = (88.0 - v13) * 0.5;
  MaxY = fmaxf(floorf(v29) + 7.0, 7.0);
  v31 = self->_artistLabel;
  if (v31)
  {
    -[UILabel setFrame:](v31, "setFrame:", v18, MaxY, v17, v16);
    v50.origin.x = v18;
    v50.origin.y = MaxY;
    v50.size.width = v17;
    v50.size.height = v16;
    MaxY = CGRectGetMaxY(v50);
  }
  v32 = self->_albumLabel;
  if (v32)
  {
    -[UILabel setFrame:](v32, "setFrame:", v41, MaxY, v45, v46);
    v51.origin.x = v41;
    v51.origin.y = MaxY;
    v51.size.width = v45;
    v51.size.height = v46;
    MaxY = CGRectGetMaxY(v51);
  }
  v33 = self->_releaseDateLabel;
  if (v33)
  {
    -[UILabel setFrame:](v33, "setFrame:", v7, MaxY, v25, v24);
    v52.origin.x = v7;
    v52.origin.y = MaxY;
    v52.size.width = v25;
    v52.size.height = v24;
    MaxY = CGRectGetMaxY(v52);
  }
  v34 = self->_itemCountLabel;
  if (v34)
  {
    -[UILabel setFrame:](v34, "setFrame:", v42, MaxY, v43, v44);
    v53.origin.x = v42;
    v53.origin.y = MaxY;
    v53.size.width = v43;
    v53.size.height = v44;
    MaxY = CGRectGetMaxY(v53);
  }
  v35 = self->_offerButton;
  if (v35)
  {
    -[SUItemOfferButton setFrame:](v35, "setFrame:", v48, MaxY + 2.0, v22, v49);
    v54.origin.x = v48;
    v54.origin.y = MaxY + 2.0;
    v54.size.width = v22;
    v54.size.height = v49;
    MaxY = CGRectGetMaxY(v54);
  }
  disclaimerLabel = self->_disclaimerLabel;
  if (disclaimerLabel)
  {
    v37 = 95.0;
    if (MaxY >= 95.0)
      v37 = MaxY;
    if (self->_artworkView)
      v38 = v37;
    else
      v38 = MaxY;
    -[UILabel frame](disclaimerLabel, "frame", v37);
    -[UILabel sizeThatFits:](self->_disclaimerLabel, "sizeThatFits:", v47 + -7.0, 1.79769313e308);
    -[UILabel setFrame:](self->_disclaimerLabel, "setFrame:", 7.0, v38 + 7.0, v39, v40);
  }
}

- (void)setBackgroundColor:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSTrackListHeaderView;
  -[MSTrackListHeaderView setBackgroundColor:](&v5, sel_setBackgroundColor_);
  objc_msgSend((id)-[MSTrackListHeaderView subviews](self, "subviews"), "makeObjectsPerformSelector:withObject:", sel_setBackgroundColor_, a3);
}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UILabel *disclaimerLabel;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  SUReflectionImageView *v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  CGRect v24;
  CGRect v25;

  v23 = *MEMORY[0x24BDAC8D0];
  -[MSTrackListHeaderView layoutIfNeeded](self, "layoutIfNeeded");
  -[MSTrackListHeaderView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  disclaimerLabel = self->_disclaimerLabel;
  if (disclaimerLabel)
  {
    -[UILabel frame](disclaimerLabel, "frame");
    v10 = CGRectGetMaxY(v24) + 7.0;
  }
  else
  {
    v11 = (void *)-[MSTrackListHeaderView subviews](self, "subviews");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      v10 = 0.0;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          v16 = *(SUReflectionImageView **)(*((_QWORD *)&v18 + 1) + 8 * i);
          -[SUReflectionImageView frame](v16, "frame");
          v17 = CGRectGetMaxY(v25) + 8.0;
          if (v16 == self->_artworkView)
            v17 = 103.0;
          if (v10 < v17)
            v10 = v17;
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }
    else
    {
      v10 = 0.0;
    }
  }
  -[MSTrackListHeaderView setFrame:](self, "setFrame:", v4, v6, v8, v10);
}

- (void)_offerButtonAction:(id)a3
{
  void *v4;
  void *v5;

  if ((-[SUItemOfferButton isShowingConfirmation](self->_offerButton, "isShowingConfirmation", a3) & 1) != 0
    || !-[SUItemOfferButton shouldShowConfirmation](self->_offerButton, "shouldShowConfirmation"))
  {
    v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8CE8], "sharedController"), "clientInterface"), "purchaseManager");
    objc_msgSend(v4, "beginUpdates");
    v5 = (void *)objc_msgSend(v4, "newPurchaseBatchForItems:offers:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", self->_item), 0);
    objc_msgSend(v5, "setPurchaseManager:", v4);
    if ((objc_msgSend(v4, "addPurchaseBatch:", v5) & 1) != 0)
    {
      -[MSTrackListHeaderView _performPurchaseAnimation](self, "_performPurchaseAnimation");
      -[MSTrackListHeaderView _reloadOfferButton](self, "_reloadOfferButton");
      -[MSTrackListHeaderView setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[MSTrackListHeaderView _hidePurchaseConfirmation](self, "_hidePurchaseConfirmation");
    }

    objc_msgSend(v4, "endUpdates");
  }
  else
  {
    -[MSTrackListHeaderView _showPurchaseConfirmation](self, "_showPurchaseConfirmation");
  }
}

- (void)_hidePurchaseConfirmation
{
  -[MSTrackListHeaderView _setShowingPurchaseConfirmation:](self, "_setShowingPurchaseConfirmation:", 0);
}

- (id)_newGenericSmallFontLabel
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v3, "setBackgroundColor:", -[MSTrackListHeaderView backgroundColor](self, "backgroundColor"));
  objc_msgSend(v3, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 10.0));
  objc_msgSend(v3, "setTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.5, 1.0));
  return v3;
}

- (void)_performPurchaseAnimation
{
  double v3;
  double v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", self->_artworkImage);
  objc_msgSend(v5, "frame");
  -[SUReflectionImageView frame](self->_artworkView, "frame");
  objc_msgSend(v5, "setFrame:");
  LODWORD(v3) = 1051931443;
  LODWORD(v4) = 1051931443;
  objc_msgSend(MEMORY[0x24BEC8D80], "performHopAnimationForView:relativeToView:finalAlpha:scale:", v5, self, v3, v4);

}

- (void)_reloadAlbumLabel
{
  void *v3;
  uint64_t v4;
  UILabel *albumLabel;
  UILabel *v6;

  v3 = (void *)-[SUItem unmodifiedTitle](self->_item, "unmodifiedTitle");
  v4 = objc_msgSend(v3, "length");
  albumLabel = self->_albumLabel;
  if (v4)
  {
    if (!albumLabel)
    {
      v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
      self->_albumLabel = v6;
      -[UILabel setAdjustsFontSizeToFitWidth:](v6, "setAdjustsFontSizeToFitWidth:", 1);
      -[UILabel setBackgroundColor:](self->_albumLabel, "setBackgroundColor:", -[MSTrackListHeaderView backgroundColor](self, "backgroundColor"));
      -[UILabel setBaselineAdjustment:](self->_albumLabel, "setBaselineAdjustment:", 1);
      -[UILabel setFont:](self->_albumLabel, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 20.0));
      -[UILabel setMinimumScaleFactor:](self->_albumLabel, "setMinimumScaleFactor:", 0.75);
      -[UILabel setNumberOfLines:](self->_albumLabel, "setNumberOfLines:", 0);
      -[UILabel setTextColor:](self->_albumLabel, "setTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"));
      -[MSTrackListHeaderView addSubview:](self, "addSubview:", self->_albumLabel);
      albumLabel = self->_albumLabel;
    }
  }
  else
  {
    -[UILabel removeFromSuperview](albumLabel, "removeFromSuperview");

    albumLabel = 0;
    self->_albumLabel = 0;
  }
  -[UILabel setText:](albumLabel, "setText:", v3);
  -[UILabel sizeToFit](self->_albumLabel, "sizeToFit");
}

- (void)_reloadArtistLabel
{
  void *v3;
  uint64_t v4;
  UILabel *artistLabel;

  v3 = (void *)-[SUItem artistName](self->_item, "artistName");
  v4 = objc_msgSend(v3, "length");
  artistLabel = self->_artistLabel;
  if (v4)
  {
    if (!artistLabel)
    {
      self->_artistLabel = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
      -[UILabel setBackgroundColor:](self->_artistLabel, "setBackgroundColor:", -[MSTrackListHeaderView backgroundColor](self, "backgroundColor"));
      -[UILabel setFont:](self->_artistLabel, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 15.0));
      -[UILabel setTextColor:](self->_artistLabel, "setTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"));
      -[MSTrackListHeaderView addSubview:](self, "addSubview:", self->_artistLabel);
      artistLabel = self->_artistLabel;
    }
  }
  else
  {
    -[UILabel removeFromSuperview](artistLabel, "removeFromSuperview");

    artistLabel = 0;
    self->_artistLabel = 0;
  }
  -[UILabel setText:](artistLabel, "setText:", v3);
  -[UILabel sizeToFit](self->_artistLabel, "sizeToFit");
}

- (void)_reloadArtworkView
{
  SUReflectionImageView *artworkView;
  SUReflectionImageView *v4;

  artworkView = self->_artworkView;
  if (!artworkView)
  {
    v4 = (SUReflectionImageView *)objc_alloc_init(MEMORY[0x24BEC8D90]);
    self->_artworkView = v4;
    -[SUReflectionImageView setReflectionAlphaWhenVisible:](v4, "setReflectionAlphaWhenVisible:", 0.4);
    -[SUReflectionImageView setFrame:](self->_artworkView, "setFrame:", 0.0, 0.0, 88.0, 88.0);
    -[MSTrackListHeaderView addSubview:](self, "addSubview:", self->_artworkView);
    artworkView = self->_artworkView;
  }
  -[SUReflectionImageView setImage:](artworkView, "setImage:", self->_artworkImage);
}

- (void)_reloadDisclaimerLabel
{
  void *v3;
  uint64_t v4;
  UILabel *disclaimerLabel;
  UILabel *v6;

  v3 = (void *)-[SUItem disclaimerString](self->_item, "disclaimerString");
  v4 = objc_msgSend(v3, "length");
  disclaimerLabel = self->_disclaimerLabel;
  if (v4)
  {
    if (!disclaimerLabel)
    {
      v6 = -[MSTrackListHeaderView _newGenericSmallFontLabel](self, "_newGenericSmallFontLabel");
      self->_disclaimerLabel = v6;
      -[UILabel setBackgroundColor:](v6, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
      -[UILabel setNumberOfLines:](self->_disclaimerLabel, "setNumberOfLines:", 0);
      -[MSTrackListHeaderView addSubview:](self, "addSubview:", self->_disclaimerLabel);
      disclaimerLabel = self->_disclaimerLabel;
    }
  }
  else
  {
    -[UILabel removeFromSuperview](disclaimerLabel, "removeFromSuperview");

    disclaimerLabel = 0;
    self->_disclaimerLabel = 0;
  }
  -[UILabel setText:](disclaimerLabel, "setText:", v3);
}

- (void)_reloadItemCountLabel
{
  void *v3;
  void *v4;
  UILabel *itemCountLabel;
  UILabel *v6;

  v3 = (void *)-[SUItem valueForProperty:](self->_item, "valueForProperty:", CFSTR("content-count"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = (void *)objc_msgSend(v3, "objectForKey:", CFSTR("label"));
  else
    v4 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "length"))
  {
    itemCountLabel = self->_itemCountLabel;
    if (!itemCountLabel)
    {
      v6 = -[MSTrackListHeaderView _newGenericSmallFontLabel](self, "_newGenericSmallFontLabel");
      self->_itemCountLabel = v6;
      -[MSTrackListHeaderView addSubview:](self, "addSubview:", v6);
      itemCountLabel = self->_itemCountLabel;
    }
  }
  else
  {
    -[UILabel removeFromSuperview](self->_itemCountLabel, "removeFromSuperview");

    itemCountLabel = 0;
    self->_itemCountLabel = 0;
  }
  -[UILabel setText:](itemCountLabel, "setText:", v4);
  -[UILabel sizeToFit](self->_itemCountLabel, "sizeToFit");
}

- (void)_reloadOfferButton
{
  SUItemOfferButton *offerButton;
  SUItemOfferButton *v4;
  double v5;

  if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8CE8], "sharedController"), "clientInterface"), "purchaseManager"), "itemIdentifierIsPurchased:", -[SUItem itemIdentifier](self->_item, "itemIdentifier")) & 1) != 0|| !objc_msgSend((id)objc_msgSend((id)-[SUItem defaultStoreOffer](self->_item, "defaultStoreOffer"), "priceDisplay"), "length"))
  {
    -[SUItemOfferButton removeTarget:action:forControlEvents:](self->_offerButton, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
    -[SUItemOfferButton removeFromSuperview](self->_offerButton, "removeFromSuperview");

    offerButton = 0;
    self->_offerButton = 0;
  }
  else
  {
    offerButton = self->_offerButton;
    if (!offerButton)
    {
      v4 = (SUItemOfferButton *)objc_alloc_init(MEMORY[0x24BEC8D20]);
      self->_offerButton = v4;
      -[SUItemOfferButton addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, sel__offerButtonAction_, 64);
      LODWORD(v5) = -1097229926;
      -[SUItemOfferButton setCharge:](self->_offerButton, "setCharge:", v5);
      -[MSTrackListHeaderView addSubview:](self, "addSubview:", self->_offerButton);
      offerButton = self->_offerButton;
    }
  }
  -[SUItemOfferButton configureForItem:offer:](offerButton, "configureForItem:offer:", self->_item, -[SUItem defaultStoreOffer](self->_item, "defaultStoreOffer"));
  -[SUItemOfferButton sizeToFit](self->_offerButton, "sizeToFit");
}

- (void)_reloadReleaseDateLabel
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  UILabel *releaseDateLabel;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  id v12;

  v3 = objc_msgSend((id)-[SUItem defaultStoreOffer](self->_item, "defaultStoreOffer"), "isPreorder");
  if (v3)
    v4 = 2;
  else
    v4 = 3;
  v12 = (id)-[SUItem copyReleaseDateStringWithStyle:](self->_item, "copyReleaseDateStringWithStyle:", v4);
  v5 = objc_msgSend(v12, "length");
  releaseDateLabel = self->_releaseDateLabel;
  if (v5)
  {
    if (!releaseDateLabel)
    {
      v7 = -[MSTrackListHeaderView _newGenericSmallFontLabel](self, "_newGenericSmallFontLabel");
      self->_releaseDateLabel = v7;
      -[MSTrackListHeaderView insertSubview:atIndex:](self, "insertSubview:atIndex:", v7, 0);
    }
  }
  else
  {
    -[UILabel removeFromSuperview](releaseDateLabel, "removeFromSuperview");

    self->_releaseDateLabel = 0;
  }
  v8 = self->_releaseDateLabel;
  v9 = (void *)MEMORY[0x24BDD17C8];
  v10 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  if (v3)
    v11 = CFSTR("PRODUCT_PAGE_EXPECTED_RELEASE_DATE");
  else
    v11 = CFSTR("RELEASE_DATE");
  -[UILabel setText:](v8, "setText:", objc_msgSend(v9, "stringWithFormat:", objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_24F1F2DD8, 0), v12));
  -[UILabel sizeToFit](self->_releaseDateLabel, "sizeToFit");

}

- (void)_setShowingPurchaseConfirmation:(BOOL)a3
{
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[6];
  BOOL v8;

  objc_msgSend((id)objc_opt_class(), "defaultAnimationDuration");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__MSTrackListHeaderView__setShowingPurchaseConfirmation___block_invoke;
  v7[3] = &unk_24F1F2C00;
  v7[4] = self;
  v8 = a3;
  v7[5] = v5;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__MSTrackListHeaderView__setShowingPurchaseConfirmation___block_invoke_2;
  v6[3] = &unk_24F1F2C28;
  v6[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v7, v6);
}

uint64_t __57__MSTrackListHeaderView__setShowingPurchaseConfirmation___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "setShowingConfirmation:duration:", *(unsigned __int8 *)(a1 + 48), *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "layoutSubviews");
}

void __57__MSTrackListHeaderView__setShowingPurchaseConfirmation___block_invoke_2(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "isShowingConfirmation") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "removeTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), 0, 0xFFFFFFFFLL);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "removeFromSuperview");

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 496) = 0;
  }
}

- (void)_showPurchaseConfirmation
{
  void *v3;
  id v4;
  SUTouchCaptureView *v5;

  v3 = (void *)-[MSTrackListHeaderView window](self, "window");
  v4 = objc_alloc(MEMORY[0x24BEC8DE0]);
  objc_msgSend(v3, "bounds");
  v5 = (SUTouchCaptureView *)objc_msgSend(v4, "initWithFrame:");
  self->_touchCaptureView = v5;
  -[SUTouchCaptureView addTarget:action:forControlEvents:](v5, "addTarget:action:forControlEvents:", self, sel__touchCaptureAction_, 1);
  -[SUTouchCaptureView setPassThroughViews:](self->_touchCaptureView, "setPassThroughViews:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", self->_offerButton, 0));
  objc_msgSend(v3, "addSubview:", self->_touchCaptureView);
  -[MSTrackListHeaderView _setShowingPurchaseConfirmation:](self, "_setShowingPurchaseConfirmation:", 1);
}

- (CGSize)_sizeThatFitsLabel:(id)a3 size:(CGSize)a4 numberOfLines:(int64_t)a5
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v22;
  double v23;
  double v25;
  CGSize result;

  height = a4.height;
  width = a4.width;
  if (a5 > 1)
  {
    objc_msgSend(a3, "setNumberOfLines:", 1);
    objc_msgSend(a3, "sizeThatFits:", width, height);
    v13 = v12;
    objc_msgSend(a3, "setNumberOfLines:", 0);
    objc_msgSend(a3, "sizeThatFits:", width, height);
    v10 = v14;
    v16 = v15;
    if (objc_msgSend(a3, "adjustsFontSizeToFitWidth"))
    {
      objc_msgSend((id)objc_msgSend(a3, "font"), "pointSize");
      v18 = v17;
      objc_msgSend(a3, "minimumScaleFactor");
      *(float *)&v19 = v18 * v19;
      v20 = ceilf(*(float *)&v19);
      if (v16 > v13 + v13 && v18 > v20)
      {
        do
        {
          v18 = v18 + -1.0;
          objc_msgSend(a3, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", v18));
          objc_msgSend(a3, "sizeThatFits:", width, height);
        }
        while (v23 > v13 + v13 && v18 > v20);
        v10 = v22;
        v16 = v23;
      }
    }
    if (v13 * (double)a5 >= v16)
      v8 = v16;
    else
      v8 = v13 * (double)a5;
  }
  else
  {
    objc_msgSend(a3, "sizeThatFits:", a4.width, a4.height);
    v10 = v9;
  }
  v25 = v10;
  result.height = v8;
  result.width = v25;
  return result;
}

- (UIImage)artworkImage
{
  return self->_artworkImage;
}

- (void)setArtworkImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 424);
}

- (MSTrackListHeaderDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MSTrackListHeaderDelegate *)a3;
}

- (SUItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 432);
}

@end
