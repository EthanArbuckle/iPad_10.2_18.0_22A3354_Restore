@implementation SUUIBannerView

- (SUUIBannerView)initWithFrame:(CGRect)a3
{
  SUUIBannerView *v3;
  SUUIBannerCloseButton *v4;
  UIButton *closeButton;
  UIButton *v6;
  void *v7;
  UIButton *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  UIView *v13;
  UIView *separatorView;
  UIView *v15;
  UIView *bottomBorderView;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SUUIBannerView;
  v3 = -[SUUIBannerView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(SUUIBannerCloseButton);
    closeButton = v3->_closeButton;
    v3->_closeButton = &v4->super;

    -[UIButton setAdjustsImageWhenHighlighted:](v3->_closeButton, "setAdjustsImageWhenHighlighted:", 0);
    v6 = v3->_closeButton;
    objc_msgSend(MEMORY[0x24BEBD640], "symbolImageNamed:", CFSTR("xmark"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v6, "setImage:forState:", v7, 0);

    -[UIButton setSize:](v3->_closeButton, "setSize:", 11.0, 11.0);
    v8 = v3->_closeButton;
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v8, "setTintColor:", v9);

    -[SUUIBannerView addSubview:](v3, "addSubview:", v3->_closeButton);
    objc_msgSend(MEMORY[0x24BEBD4B8], "separatorColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    if (v12 == 1)
    {
      v13 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
      separatorView = v3->_separatorView;
      v3->_separatorView = v13;

      -[UIView setBackgroundColor:](v3->_separatorView, "setBackgroundColor:", v10);
      -[SUUIBannerView addSubview:](v3, "addSubview:", v3->_separatorView);
    }
    v15 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    bottomBorderView = v3->_bottomBorderView;
    v3->_bottomBorderView = v15;

    -[UIView setBackgroundColor:](v3->_bottomBorderView, "setBackgroundColor:", v10);
    -[SUUIBannerView addSubview:](v3, "addSubview:", v3->_bottomBorderView);
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIBannerView setBackgroundColor:](v3, "setBackgroundColor:", v17);

  }
  return v3;
}

- (NSString)artistName
{
  return -[UILabel text](self->_artistNameLabel, "text");
}

- (UIImage)iconImage
{
  return -[UIImageView image](self->_iconImageView, "image");
}

- (UIControl)itemOfferButton
{
  UIButton *itemOfferButton;
  UIButton *v4;
  UIButton *v5;
  void *v6;
  void *v7;

  itemOfferButton = self->_itemOfferButton;
  if (!itemOfferButton)
  {
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_itemOfferButton;
    self->_itemOfferButton = v4;

    -[UIButton setHidden:](self->_itemOfferButton, "setHidden:", 1);
    -[UIButton titleLabel](self->_itemOfferButton, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v7);

    -[SUUIBannerView addSubview:](self, "addSubview:", self->_itemOfferButton);
    itemOfferButton = self->_itemOfferButton;
  }
  return (UIControl *)itemOfferButton;
}

- (NSArray)screenshotImages
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_screenshotImageViews;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "image", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)setArtistName:(id)a3
{
  id v4;
  UILabel *artistNameLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  id v9;

  v9 = a3;
  -[SUUIBannerView artistName](self, "artistName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v9 && (objc_msgSend(v9, "isEqualToString:", v4) & 1) == 0)
  {
    artistNameLabel = self->_artistNameLabel;
    if (v9)
    {
      if (!artistNameLabel)
      {
        v6 = -[SUUIBannerView _newDefaultLabel](self, "_newDefaultLabel");
        v7 = self->_artistNameLabel;
        self->_artistNameLabel = v6;

        -[SUUIBannerView addSubview:](self, "addSubview:", self->_artistNameLabel);
        artistNameLabel = self->_artistNameLabel;
      }
      -[UILabel setText:](artistNameLabel, "setText:");
      -[UILabel sizeToFit](self->_artistNameLabel, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](artistNameLabel, "removeFromSuperview");
      v8 = self->_artistNameLabel;
      self->_artistNameLabel = 0;

    }
    -[SUUIBannerView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setClientContext:(id)a3
{
  SUUIClientContext *v5;
  SUUIClientContext **p_clientContext;
  UIButton *closeButton;
  void *v8;
  SUUIClientContext *v9;

  v5 = (SUUIClientContext *)a3;
  p_clientContext = &self->_clientContext;
  if (self->_clientContext != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_clientContext, a3);
    closeButton = self->_closeButton;
    if (*p_clientContext)
      -[SUUIClientContext localizedStringForKey:](*p_clientContext, "localizedStringForKey:", CFSTR("BANNER_CLOSE_BUTTON"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("BANNER_CLOSE_BUTTON"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setAccessibilityLabel:](closeButton, "setAccessibilityLabel:", v8);

    -[SUUIBannerView _reloadItemState](self, "_reloadItemState");
    v5 = v9;
  }

}

- (void)setScreenshotImages:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  NSMutableArray *screenshotImageViews;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = self->_screenshotImageViews;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v9++), "removeFromSuperview");
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }

  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  screenshotImageViews = self->_screenshotImageViews;
  self->_screenshotImageViews = v10;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16);
        v18 = objc_alloc(MEMORY[0x24BEBD668]);
        v19 = (void *)objc_msgSend(v18, "initWithImage:", v17, (_QWORD)v20);
        -[NSMutableArray addObject:](self->_screenshotImageViews, "addObject:", v19);
        -[SUUIBannerView addSubview:](self, "addSubview:", v19);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v14);
  }

  -[SUUIBannerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setIconImage:(id)a3
{
  id v4;
  void *v5;
  UIImageView *iconImageView;
  UIImageView *v7;
  UIImageView *v8;
  UIImageView *v9;
  id v10;

  v10 = a3;
  -[UIImageView image](self->_iconImageView, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v10;
  if (v4 != v10)
  {
    iconImageView = self->_iconImageView;
    if (v10)
    {
      if (!iconImageView)
      {
        v7 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
        v8 = self->_iconImageView;
        self->_iconImageView = v7;

        -[SUUIBannerView addSubview:](self, "addSubview:", self->_iconImageView);
        iconImageView = self->_iconImageView;
      }
      -[UIImageView setImage:](iconImageView, "setImage:");
      -[UIImageView sizeToFit](self->_iconImageView, "sizeToFit");
    }
    else
    {
      -[UIImageView removeFromSuperview](iconImageView, "removeFromSuperview");
      v9 = self->_iconImageView;
      self->_iconImageView = 0;

    }
    -[SUUIBannerView setNeedsLayout](self, "setNeedsLayout");
    v5 = v10;
  }

}

- (void)setItemOffer:(id)a3
{
  SSLookupItemOffer *v5;
  SSLookupItemOffer *v6;

  v5 = (SSLookupItemOffer *)a3;
  if (self->_itemOffer != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_itemOffer, a3);
    -[SUUIBannerView _reloadItemState](self, "_reloadItemState");
    v5 = v6;
  }

}

- (void)setItemState:(id)a3
{
  SUUIItemState *v5;
  SUUIItemState *v6;

  v5 = (SUUIItemState *)a3;
  if (self->_itemState != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_itemState, a3);
    -[SUUIBannerView _reloadItemState](self, "_reloadItemState");
    v5 = v6;
  }

}

- (void)setTitle:(id)a3
{
  id v4;
  UILabel *titleLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  id v15;

  v15 = a3;
  -[SUUIBannerView title](self, "title");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v15 && (objc_msgSend(v15, "isEqualToString:", v4) & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v15)
    {
      if (!titleLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v7 = self->_titleLabel;
        self->_titleLabel = v6;

        v8 = self->_titleLabel;
        objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_titleLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 2);
        v12 = self->_titleLabel;
        objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v12, "setTextColor:", v13);

        -[SUUIBannerView addSubview:](self, "addSubview:", self->_titleLabel);
        titleLabel = self->_titleLabel;
      }
      -[UILabel setText:](titleLabel, "setText:");
    }
    else
    {
      -[UILabel removeFromSuperview](titleLabel, "removeFromSuperview");
      v14 = self->_titleLabel;
      self->_titleLabel = 0;

    }
    -[SUUIBannerView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setUserRating:(float)a3
{
  UIImageView *userRatingStarImageView;
  UIImageView *v6;
  UIImageView *v7;
  UIImageView *v8;
  void *v9;
  id v10;

  userRatingStarImageView = self->_userRatingStarImageView;
  if (self->_userRating == a3)
  {
    if (userRatingStarImageView)
      return;
    goto LABEL_5;
  }
  if (!userRatingStarImageView)
  {
LABEL_5:
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    v7 = self->_userRatingStarImageView;
    self->_userRatingStarImageView = v6;

    -[SUUIBannerView addSubview:](self, "addSubview:", self->_userRatingStarImageView);
  }
  self->_userRating = a3;
  +[SUUIRatingStarsCache cacheWithProperties:](SUUIRatingStarsCache, "cacheWithProperties:", 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = self->_userRatingStarImageView;
  objc_msgSend(v10, "ratingStarsImageForRating:", self->_userRating);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](v8, "setImage:", v9);

  -[UIImageView sizeToFit](self->_userRatingStarImageView, "sizeToFit");
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  SUUIBannerView *v7;
  UIButton **p_closeButton;
  objc_super v10;
  CGPoint v11;
  CGRect v12;
  CGRect v13;

  y = a3.y;
  x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)SUUIBannerView;
  -[SUUIBannerView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4);
  v7 = (SUUIBannerView *)objc_claimAutoreleasedReturnValue();
  if (v7 == self)
  {
    p_closeButton = &self->_closeButton;
    -[UIButton frame](self->_closeButton, "frame");
    v13 = CGRectInset(v12, -10.0, -30.0);
    v11.x = x;
    v11.y = y;
    if (CGRectContainsPoint(v13, v11)
      || (p_closeButton = &self->_itemOfferButton, (-[UIButton isHidden](self->_itemOfferButton, "isHidden") & 1) == 0))
    {
      v7 = *p_closeButton;

    }
    else
    {
      v7 = self;
    }
  }
  return v7;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double MaxX;
  double v31;
  double v32;
  UIImageView *iconImageView;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  double v44;
  double v45;
  UIButton *itemOfferButton;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  float v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  uint64_t v61;
  double v62;
  double v63;
  void *v64;
  uint64_t v65;
  double v66;
  uint64_t v67;
  double v68;
  double v69;
  UILabel *artistNameLabel;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  double v76;
  double v77;
  UILabel *itemStateLabel;
  double v79;
  uint64_t v80;
  double v81;
  UILabel *titleLabel;
  double v83;
  double v84;
  void *v85;
  double v86;
  UIImageView *userRatingStarImageView;
  double v88;
  double v89;
  void *v90;
  double v91;
  float v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double MaxY;
  void *v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  float v105;
  double v106;
  double v107;
  void *v108;
  double v109;
  double v110;
  double v111;
  void *v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  void *v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  void *v124;
  double v125;
  double v126;
  uint64_t v127;
  UIView *separatorView;
  void *v129;
  double v130;
  double v131;
  BOOL v132;
  uint64_t v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  NSMutableArray *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t i;
  double v147;
  float v148;
  double v149;
  float v150;
  double v151;
  double v152;
  NSMutableArray *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t j;
  void *v158;
  double v159;
  CGFloat v160;
  double v161;
  CGFloat v162;
  float v163;
  CGFloat v164;
  UIView *bottomBorderView;
  double v166;
  double v167;
  void *v168;
  double v169;
  double v170;
  double v171;
  double v172;
  void *v173;
  double v174;
  double rect;
  double v176;
  double v177;
  double MinX;
  double v179;
  double v180;
  _QWORD v181[5];
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  _BYTE v189[128];
  _BYTE v190[128];
  uint64_t v191;
  CGRect v192;
  CGRect v193;
  CGRect v194;
  CGRect v195;
  CGRect v196;
  CGRect v197;

  v191 = *MEMORY[0x24BDAC8D0];
  -[SUUIBannerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SUUIBannerView layoutMargins](self, "layoutMargins");
  v12 = v11;
  -[SUUIBannerView layoutMargins](self, "layoutMargins");
  v13 = v4 + v12;
  v14 = v6 + 0.0;
  v16 = v8 - (v12 + v15);
  v17 = -[SUUIBannerView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[UIButton frame](self->_closeButton, "frame");
  v19 = v18;
  v21 = v20;
  if ((v17 & 1) != 0)
  {
    v192.origin.x = v13;
    v192.origin.y = v14;
    v192.size.width = v16;
    v192.size.height = v10;
    v22 = CGRectGetMaxX(v192) - v19 + -10.0;
  }
  else
  {
    v22 = v13 + 10.0;
  }
  v23 = (v10 - v21) * 0.5;
  v24 = floorf(v23);
  -[UIButton setFrame:](self->_closeButton, "setFrame:", v22, v24, v19, v21);
  v180 = v14;
  *(double *)v181 = v13;
  v25 = v13;
  v26 = v14;
  v27 = v16;
  v28 = v10;
  if ((v17 & 1) != 0)
  {
    MinX = CGRectGetMinX(*(CGRect *)&v25);
    v29 = MinX + 10.0;
    v193.origin.x = v22;
    v193.origin.y = v24;
    v193.size.width = v19;
    v193.size.height = v21;
    MaxX = CGRectGetMinX(v193);
    v31 = -9.0;
  }
  else
  {
    MinX = CGRectGetMaxX(*(CGRect *)&v25);
    v29 = MinX + -10.0;
    v194.origin.x = v22;
    v194.origin.y = v24;
    v194.size.width = v19;
    v194.size.height = v21;
    MaxX = CGRectGetMaxX(v194);
    v31 = 9.0;
  }
  v32 = MaxX + v31;
  iconImageView = self->_iconImageView;
  if (iconImageView)
  {
    -[UIImageView frame](iconImageView, "frame");
    v35 = v34;
    v37 = v36;
    v38 = 0.0;
    if (v17)
      v38 = v34;
    v39 = v32 - v38;
    -[UIImageView setFrame:](self->_iconImageView, "setFrame:", v32 - v38, 10.0);
    v40 = 10.0;
    v41 = v39;
    v42 = v35;
    v43 = v37;
    if ((v17 & 1) != 0)
    {
      v44 = CGRectGetMinX(*(CGRect *)&v41);
      v45 = -8.0;
    }
    else
    {
      v44 = CGRectGetMaxX(*(CGRect *)&v41);
      v45 = 8.0;
    }
    v32 = v44 + v45;
  }
  itemOfferButton = self->_itemOfferButton;
  if (itemOfferButton && (-[UIButton isHidden](itemOfferButton, "isHidden") & 1) == 0)
  {
    -[UIButton frame](self->_itemOfferButton, "frame");
    v49 = v47;
    v50 = v48;
    v51 = 0.0;
    if (!v17)
      v51 = v47;
    v52 = v29 - v51;
    v53 = (v10 - v48) * 0.5;
    v54 = floorf(v53);
    -[UIButton setFrame:](self->_itemOfferButton, "setFrame:", v52, v54);
    v55 = v52;
    v56 = v54;
    v57 = v49;
    v58 = v50;
    if ((v17 & 1) != 0)
    {
      v59 = CGRectGetMaxX(*(CGRect *)&v55);
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "userInterfaceIdiom");

      v62 = 5.0;
      if ((v61 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v62 = 30.0;
      v29 = v59 + v62;
    }
    else
    {
      v63 = CGRectGetMinX(*(CGRect *)&v55);
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v64, "userInterfaceIdiom");

      v66 = 5.0;
      if ((v65 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v66 = 30.0;
      v29 = v63 - v66;
    }
  }
  v179 = v16;
  v67 = MEMORY[0x24BDBF090];
  v68 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v69 = *(double *)(MEMORY[0x24BDBF090] + 24);
  artistNameLabel = self->_artistNameLabel;
  if (artistNameLabel)
  {
    -[UILabel frame](artistNameLabel, "frame");
    v72 = v71;
    v74 = v73;
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "scale");
    v77 = 1.0 / v76 + 2.0;

  }
  else
  {
    v77 = 0.0;
    v74 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v72 = *(double *)(MEMORY[0x24BDBF090] + 8);
  }
  itemStateLabel = self->_itemStateLabel;
  *(double *)&v181[1] = v68;
  *(double *)&v181[2] = v69;
  v79 = v68;
  if (itemStateLabel)
  {
    -[UILabel frame](itemStateLabel, "frame");
    v181[2] = v80;
  }
  v177 = v79;
  v81 = v29 - v32;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:", v29 - v32, 1.79769313e308);
    v84 = v83;
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "scale");
    v77 = v77 + 1.0 / v86;

  }
  else
  {
    v84 = v69;
  }
  v176 = v84;
  if ((-[SUUIItemState state](self->_itemState, "state") & 4) != 0)
  {
    v92 = (v10 - (v77 + *(double *)&v181[2] + v74 + v84)) * 0.5;
    v93 = v84;
    v94 = (float)(ceilf(v92) + 0.0);
    if (self->_titleLabel)
    {
      v95 = v32;
      v96 = v94;
      v97 = v81;
      MaxY = CGRectGetMaxY(*(CGRect *)(&v93 - 3));
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "scale");
      v101 = MaxY + 1.0 / v100;

      *(double *)&v181[1] = v94;
      v94 = v101;
    }
    if (!self->_artistNameLabel)
    {
      v106 = v94;
      goto LABEL_55;
    }
    v102 = v32;
    v103 = v94;
    v104 = v81;
    v69 = v74;
  }
  else
  {
    userRatingStarImageView = self->_userRatingStarImageView;
    if (userRatingStarImageView)
    {
      -[UIImageView frame](userRatingStarImageView, "frame");
      rect = v88;
      v69 = v89;
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "scale");
      v77 = v77 + 1.0 / v91 + 2.0;

    }
    else
    {
      rect = *(double *)(v67 + 16);
    }
    v105 = (v10 - (v77 + *(double *)&v181[2] + v74 + v84 + v69)) * 0.5;
    v106 = (float)(ceilf(v105) + 0.0);
    if (self->_titleLabel)
    {
      v195.origin.x = v32;
      v195.origin.y = v106;
      v195.size.width = v81;
      v195.size.height = v84;
      v107 = CGRectGetMaxY(v195);
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "scale");
      v110 = v107 + 1.0 / v109;

      *(double *)&v181[1] = v106;
      v106 = v110;
    }
    if (self->_artistNameLabel)
    {
      v196.origin.x = v32;
      v196.origin.y = v106;
      v196.size.width = v81;
      v196.size.height = v74;
      v111 = CGRectGetMaxY(v196);
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "scale");
      v114 = v111 + 1.0 / v113 + 2.0;

      v94 = v106;
      v106 = v114;
    }
    else
    {
      v94 = v72;
    }
    if (!self->_userRatingStarImageView)
      goto LABEL_54;
    v115 = -1.0;
    if (v17)
      v115 = 1.0;
    v116 = v115 + v32;
    v117 = 0.0;
    if (v17)
      v117 = rect;
    v102 = v116 - v117;
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "scale");
    v103 = v106 + 1.0 / v119;

    -[UIImageView setFrame:](self->_userRatingStarImageView, "setFrame:", v102, v103, rect, v69);
    v104 = rect;
  }
  v120 = v102;
  v121 = v103;
  v122 = v69;
  v123 = CGRectGetMaxY(*(CGRect *)(&v104 - 2));
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "scale");
  v106 = v123 + 1.0 / v125 + 2.0;

LABEL_54:
  v72 = v94;
LABEL_55:
  if (self->_itemStateLabel)
    v126 = v106;
  else
    v126 = v177;
  -[UILabel setFrame:](self->_artistNameLabel, "setFrame:", v32, v72, v81, v74);
  -[UILabel setFrame:](self->_itemStateLabel, "setFrame:", v32, v126, v81, *(double *)&v181[2]);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v32, *(double *)&v181[1], v81, v176);
  v127 = -[NSMutableArray count](self->_screenshotImageViews, "count");
  separatorView = self->_separatorView;
  if (separatorView)
  {
    -[UIView frame](separatorView, "frame");
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "scale");
    v131 = 1.0 / v130;

    -[UIView setFrame:](self->_separatorView, "setFrame:", MinX, 10.0, v131, v10 + -20.0);
    -[UIView setHidden:](self->_separatorView, "setHidden:", v127 == 0);
  }
  v132 = v127 < 1;
  v133 = v127 - 1;
  v134 = *(double *)v181;
  v135 = v179;
  if (!v132)
  {
    if (v17)
      v136 = -15.0;
    else
      v136 = 15.0;
    v137 = v180;
    v138 = v10;
    if ((v17 & 1) != 0)
      v139 = CGRectGetMinX(*(CGRect *)&v134) + 15.0;
    else
      v139 = CGRectGetMaxX(*(CGRect *)&v134) + -15.0;
    v140 = v136 + MinX;
    v141 = (float)((float)v133 * 15.0);
    v187 = 0u;
    v188 = 0u;
    v185 = 0u;
    v186 = 0u;
    v142 = self->_screenshotImageViews;
    v143 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v142, "countByEnumeratingWithState:objects:count:", &v185, v190, 16);
    if (v143)
    {
      v144 = v143;
      v145 = *(_QWORD *)v186;
      do
      {
        for (i = 0; i != v144; ++i)
        {
          if (*(_QWORD *)v186 != v145)
            objc_enumerationMutation(v142);
          objc_msgSend(*(id *)(*((_QWORD *)&v185 + 1) + 8 * i), "frame");
          v141 = v141 + v147;
        }
        v144 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v142, "countByEnumeratingWithState:objects:count:", &v185, v190, 16);
      }
      while (v144);
    }

    v148 = (v139 - v140) * 0.5;
    v149 = v140 - floorf(v148);
    v150 = (v139 - v140 - v141) * 0.5;
    v151 = v140 + floorf(v150);
    if ((v17 & 1) != 0)
      v152 = v149;
    else
      v152 = v151;
    v183 = 0u;
    v184 = 0u;
    *(_OWORD *)&v181[3] = 0u;
    v182 = 0u;
    v153 = self->_screenshotImageViews;
    v154 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v153, "countByEnumeratingWithState:objects:count:", &v181[3], v189, 16);
    if (v154)
    {
      v155 = v154;
      v156 = *(_QWORD *)v182;
      do
      {
        for (j = 0; j != v155; ++j)
        {
          if (*(_QWORD *)v182 != v156)
            objc_enumerationMutation(v153);
          v158 = *(void **)(v181[4] + 8 * j);
          objc_msgSend(v158, "frame");
          v160 = v159;
          v162 = v161;
          v163 = (v10 - v161) * 0.5;
          v164 = floorf(v163);
          objc_msgSend(v158, "setFrame:", v152, v164);
          v197.origin.x = v152;
          v197.origin.y = v164;
          v197.size.width = v160;
          v197.size.height = v162;
          v152 = CGRectGetMaxX(v197) + 15.0;
        }
        v155 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v153, "countByEnumeratingWithState:objects:count:", &v181[3], v189, 16);
      }
      while (v155);
    }

  }
  bottomBorderView = self->_bottomBorderView;
  -[SUUIBannerView bounds](self, "bounds", v134);
  v167 = v166;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "scale");
  v170 = v167 - 1.0 / v169;
  -[SUUIBannerView bounds](self, "bounds");
  v172 = v171;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "scale");
  -[UIView setFrame:](bottomBorderView, "setFrame:", 0.0, v170, v172, 1.0 / v174);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  CGSize result;

  width = a3.width;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  v6 = 95.0;
  if (v5 != 1)
    v6 = 84.0;
  v7 = width;
  result.height = v6;
  result.width = v7;
  return result;
}

- (id)_newDefaultLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BEBD708]);
  -[SUUIBannerView backgroundColor](self, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v5);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v6);

  return v3;
}

- (void)_reloadItemState
{
  unint64_t v3;
  SUUIClientContext *v4;
  SSLookupItemOffer *itemOffer;
  void *v6;
  float v7;
  float v8;
  SSLookupItemOffer *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  SUUIClientContext *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  SUUIClientContext *clientContext;
  const __CFString *v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  SUUIClientContext *v23;
  id v24;
  UILabel *itemStateLabel;
  UILabel *v26;
  UILabel *v27;
  UILabel *v28;
  id v29;

  if (!self->_clientContext)
    return;
  v3 = -[SUUIItemState state](self->_itemState, "state");
  if ((v3 & 4) == 0)
  {
    itemOffer = self->_itemOffer;
    if (!itemOffer)
    {
      v29 = 0;
      goto LABEL_33;
    }
    -[SSLookupItemOffer price](itemOffer, "price");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v8 = v7;

    v9 = self->_itemOffer;
    if (v8 >= 0.00000011921)
    {
      -[SSLookupItemOffer formattedPrice](v9, "formattedPrice");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[SSLookupItemOffer actionTextForType:](v9, "actionTextForType:", *MEMORY[0x24BEB2768]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uppercaseString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!objc_msgSend(v11, "length"))
    {
      v29 = 0;
      goto LABEL_29;
    }
    -[SSLookupItemOffer subscriptionType](self->_itemOffer, "subscriptionType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BEB2760]);

    clientContext = self->_clientContext;
    if (v17)
    {
      if (clientContext)
      {
        v19 = CFSTR("BANNER_PRICE_FORMAT_PODCASTS");
LABEL_24:
        -[SUUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", v19);
        v20 = objc_claimAutoreleasedReturnValue();
LABEL_28:
        v22 = (void *)v20;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v20, CFSTR("%@"), 0, v11);
        v29 = (id)objc_claimAutoreleasedReturnValue();

LABEL_29:
        v23 = self->_clientContext;
        if (v23)
          -[SUUIClientContext localizedStringForKey:](v23, "localizedStringForKey:", CFSTR("BANNER_VIEW_BUTTON"));
        else
          +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("BANNER_VIEW_BUTTON"), 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          goto LABEL_15;
LABEL_33:
        -[UIButton setHidden:](self->_itemOfferButton, "setHidden:", 1);
        goto LABEL_34;
      }
      v21 = CFSTR("BANNER_PRICE_FORMAT_PODCASTS");
    }
    else
    {
      if (clientContext)
      {
        v19 = CFSTR("BANNER_PRICE_FORMAT");
        goto LABEL_24;
      }
      v21 = CFSTR("BANNER_PRICE_FORMAT");
    }
    +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", v21, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  v4 = self->_clientContext;
  if (v4)
    -[SUUIClientContext localizedStringForKey:](v4, "localizedStringForKey:", CFSTR("BANNER_ITEM_STATE_INSTALLED"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("BANNER_ITEM_STATE_INSTALLED"), 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = self->_clientContext;
  v29 = (id)v12;
  if (v13)
    -[SUUIClientContext localizedStringForKey:](v13, "localizedStringForKey:", CFSTR("BANNER_OPEN_BUTTON"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("BANNER_OPEN_BUTTON"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_33;
LABEL_15:
  -[SUUIBannerView itemOfferButton](self, "itemOfferButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHidden:", 0);
  objc_msgSend(v15, "setTitle:forState:", v14, 0);
  objc_msgSend(v15, "sizeToFit");

LABEL_34:
  v24 = v29;
  itemStateLabel = self->_itemStateLabel;
  if (v29)
  {
    if (!itemStateLabel)
    {
      v26 = -[SUUIBannerView _newDefaultLabel](self, "_newDefaultLabel");
      v27 = self->_itemStateLabel;
      self->_itemStateLabel = v26;

      -[SUUIBannerView addSubview:](self, "addSubview:", self->_itemStateLabel);
      v24 = v29;
      itemStateLabel = self->_itemStateLabel;
    }
    -[UILabel setText:](itemStateLabel, "setText:", v24);
    -[UILabel sizeToFit](self->_itemStateLabel, "sizeToFit");
  }
  else
  {
    -[UILabel removeFromSuperview](itemStateLabel, "removeFromSuperview");
    v28 = self->_itemStateLabel;
    self->_itemStateLabel = 0;

  }
  -[UIImageView setHidden:](self->_userRatingStarImageView, "setHidden:", (v3 >> 2) & 1);
  -[SUUIBannerView setNeedsLayout](self, "setNeedsLayout");

}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (UIControl)closeButton
{
  return &self->_closeButton->super;
}

- (SSLookupItemOffer)itemOffer
{
  return self->_itemOffer;
}

- (SUUIItemState)itemState
{
  return self->_itemState;
}

- (float)userRating
{
  return self->_userRating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userRatingStarImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_screenshotImageViews, 0);
  objc_storeStrong((id *)&self->_itemStateLabel, 0);
  objc_storeStrong((id *)&self->_itemState, 0);
  objc_storeStrong((id *)&self->_itemOfferButton, 0);
  objc_storeStrong((id *)&self->_itemOffer, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_bottomBorderView, 0);
  objc_storeStrong((id *)&self->_artistNameLabel, 0);
}

@end
