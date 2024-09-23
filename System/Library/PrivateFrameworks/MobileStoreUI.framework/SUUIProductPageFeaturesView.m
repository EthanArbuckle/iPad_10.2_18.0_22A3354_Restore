@implementation SUUIProductPageFeaturesView

- (SUUIProductPageFeaturesView)initWithFrame:(CGRect)a3
{
  SUUIProductPageFeaturesView *v3;
  UIView *v4;
  UIView *bottomBorderView;
  UIView *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUUIProductPageFeaturesView;
  v3 = -[SUUIProductPageFeaturesView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    bottomBorderView = v3->_bottomBorderView;
    v3->_bottomBorderView = v4;

    v6 = v3->_bottomBorderView;
    -[SUUIColorScheme primaryTextColor](v3->_colorScheme, "primaryTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v8);

    }
    -[SUUIProductPageFeaturesView addSubview:](v3, "addSubview:", v3->_bottomBorderView);
  }
  return v3;
}

- (void)setFeatures:(int64_t)a3
{
  -[SUUIProductPageFeaturesView setFeatures:gameCenterFeatures:](self, "setFeatures:gameCenterFeatures:", a3, self->_gameCenterFeatures);
}

- (void)setFeatures:(int64_t)a3 gameCenterFeatures:(unint64_t)a4
{
  unint64_t gameCenterFeatures;
  NSMutableArray *v7;
  NSMutableArray *featureViews;
  SUUIClientContext *clientContext;
  id v10;
  void *v11;
  SUUIClientContext *v12;
  id v13;
  void *v14;
  SUUIClientContext *v15;
  id v16;
  void *v17;
  SUUIClientContext *v18;
  id v19;
  void *v20;
  SUUIClientContext *v21;
  id v22;
  void *v23;
  SUUIClientContext *v24;
  id v25;
  void *v26;
  SUUIClientContext *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t i;
  SUUIProductPageFeatureView *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[18];

  gameCenterFeatures = a4;
  v36[16] = *MEMORY[0x24BDAC8D0];
  if (self->_features != a3 || self->_gameCenterFeatures != a4)
  {
    -[NSMutableArray makeObjectsPerformSelector:](self->_featureViews, "makeObjectsPerformSelector:", sel_removeFromSuperview);
    -[NSMutableArray removeAllObjects](self->_featureViews, "removeAllObjects");
    self->_features = a3;
    self->_gameCenterFeatures = gameCenterFeatures;
    if (!self->_featureViews)
    {
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      featureViews = self->_featureViews;
      self->_featureViews = v7;

      gameCenterFeatures = self->_gameCenterFeatures;
    }
    v36[0] = 1;
    v36[1] = CFSTR("ProductViewGameCenterBadge");
    v36[2] = -[SUUIProductPageFeaturesView _gameCenterStringWithFeatures:](self, "_gameCenterStringWithFeatures:", gameCenterFeatures, 448);
    clientContext = self->_clientContext;
    if (clientContext)
    {
      -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("SUPPORTS_GAMECENTER_TITLE"), CFSTR("ProductPage"));
    }
    else
    {
      v10 = 0;
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("SUPPORTS_GAMECENTER_TITLE"), 0, CFSTR("ProductPage"));
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v36[3] = v11;
    v36[4] = 4;
    v36[5] = CFSTR("ProductViewPassbookBadge");
    v12 = self->_clientContext;
    if (v12)
    {
      -[SUUIClientContext localizedStringForKey:inTable:](v12, "localizedStringForKey:inTable:", CFSTR("SUPPORTS_PASSBOOK_BODY"), CFSTR("ProductPage"));
    }
    else
    {
      v13 = 0;
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("SUPPORTS_PASSBOOK_BODY"), 0, CFSTR("ProductPage"));
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v36[6] = v14;
    v15 = self->_clientContext;
    if (v15)
    {
      -[SUUIClientContext localizedStringForKey:inTable:](v15, "localizedStringForKey:inTable:", CFSTR("SUPPORTS_PASSBOOK_TITLE"), CFSTR("ProductPage"));
    }
    else
    {
      v16 = 0;
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("SUPPORTS_PASSBOOK_TITLE"), 0, CFSTR("ProductPage"));
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v36[7] = v17;
    v36[8] = 8;
    v36[9] = CFSTR("ProductViewNewsstandBadge");
    v18 = self->_clientContext;
    if (v18)
    {
      -[SUUIClientContext localizedStringForKey:inTable:](v18, "localizedStringForKey:inTable:", CFSTR("SUPPORTS_NEWSSTAND_BODY"), CFSTR("ProductPage"));
    }
    else
    {
      v19 = 0;
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("SUPPORTS_NEWSSTAND_BODY"), 0, CFSTR("ProductPage"));
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v36[10] = v20;
    v21 = self->_clientContext;
    if (v21)
    {
      -[SUUIClientContext localizedStringForKey:inTable:](v21, "localizedStringForKey:inTable:", CFSTR("SUPPORTS_NEWSSTAND_TITLE"), CFSTR("ProductPage"));
    }
    else
    {
      v22 = 0;
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("SUPPORTS_NEWSSTAND_TITLE"), 0, CFSTR("ProductPage"));
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v36[11] = v23;
    v36[12] = 2;
    v36[13] = CFSTR("ProductViewCloudBadge");
    v24 = self->_clientContext;
    if (v24)
    {
      -[SUUIClientContext localizedStringForKey:inTable:](v24, "localizedStringForKey:inTable:", CFSTR("SUPPORTS_ICLOUD_BODY"), CFSTR("ProductPage"));
    }
    else
    {
      v25 = 0;
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("SUPPORTS_ICLOUD_BODY"), 0, CFSTR("ProductPage"));
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v36[14] = v26;
    v27 = self->_clientContext;
    if (v27)
    {
      -[SUUIClientContext localizedStringForKey:inTable:](v27, "localizedStringForKey:inTable:", CFSTR("SUPPORTS_ICLOUD_TITLE"), CFSTR("ProductPage"));
    }
    else
    {
      v28 = 0;
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("SUPPORTS_ICLOUD_TITLE"), 0, CFSTR("ProductPage"));
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v36[15] = v29;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 16; i += 4)
    {
      if ((v36[i] & self->_features) != 0)
      {
        v32 = objc_alloc_init(SUUIProductPageFeatureView);
        -[SUUIProductPageFeatureView setColorScheme:](v32, "setColorScheme:", self->_colorScheme);
        -[SUUIProductPageFeaturesView backgroundColor](self, "backgroundColor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIProductPageFeatureView setBackgroundColor:](v32, "setBackgroundColor:", v33);

        objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", v36[i + 1], v30);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIProductPageFeatureView setIcon:](v32, "setIcon:", v34);

        -[SUUIProductPageFeatureView setSubtitle:](v32, "setSubtitle:", v36[i + 2]);
        -[SUUIProductPageFeatureView setTitle:](v32, "setTitle:", v36[i + 3]);
        objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v35), "addObject:", v32);
        -[SUUIProductPageFeaturesView addSubview:](self, "addSubview:", v32);

      }
    }
    -[SUUIProductPageFeaturesView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)setGameCenterFeatures:(unint64_t)a3
{
  -[SUUIProductPageFeaturesView setFeatures:gameCenterFeatures:](self, "setFeatures:gameCenterFeatures:", self->_features, a3);
}

- (void)setTitle:(id)a3
{
  id v4;
  uint64_t v5;
  UILabel *titleLabel;
  UILabel *v7;
  UILabel *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[SUUIProductPageFeaturesView title](self, "title");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v17 && (objc_msgSend(v4, "isEqualToString:", v17) & 1) == 0)
  {
    v5 = objc_msgSend(v17, "length");
    titleLabel = self->_titleLabel;
    if (v5)
    {
      if (!titleLabel)
      {
        v7 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v8 = self->_titleLabel;
        self->_titleLabel = v7;

        v9 = self->_titleLabel;
        -[SUUIProductPageFeaturesView backgroundColor](self, "backgroundColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

        v11 = self->_titleLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 17.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v11, "setFont:", v12);

        v13 = self->_titleLabel;
        -[SUUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[UILabel setTextColor:](v13, "setTextColor:", v14);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v13, "setTextColor:", v16);

        }
        -[SUUIProductPageFeaturesView addSubview:](self, "addSubview:", self->_titleLabel);
        titleLabel = self->_titleLabel;
      }
      -[UILabel setText:](titleLabel, "setText:", v17);
      -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](titleLabel, "removeFromSuperview");
      v15 = self->_titleLabel;
      self->_titleLabel = 0;

    }
    -[SUUIProductPageFeaturesView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  UILabel *titleLabel;
  double v7;
  CGFloat v8;
  double v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  UIView *bottomBorderView;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;
  CGRect v34;
  CGRect v35;

  v33 = *MEMORY[0x24BDAC8D0];
  -[SUUIProductPageFeaturesView bounds](self, "bounds");
  v4 = v3;
  v27 = v5;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel frame](titleLabel, "frame");
    v8 = v7;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", 15.0, 11.0, v4 + -15.0 + -15.0);
    v34.origin.x = 15.0;
    v34.origin.y = 11.0;
    v34.size.width = v4 + -15.0 + -15.0;
    v34.size.height = v8;
    v9 = CGRectGetMaxY(v34) + -4.0 + 15.0;
  }
  else
  {
    v9 = 15.0;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = self->_featureViews;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v15, "frame");
        v16 = v9 + -2.0;
        objc_msgSend(v15, "sizeThatFits:", v4 + -30.0, 1.79769313e308);
        v18 = v17;
        v20 = v19;
        objc_msgSend(v15, "setFrame:", 15.0, v16, v17, v19);
        v35.origin.x = 15.0;
        v35.origin.y = v16;
        v35.size.width = v18;
        v35.size.height = v20;
        v9 = CGRectGetMaxY(v35) + -2.0 + 16.0;
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v12);
  }

  bottomBorderView = self->_bottomBorderView;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "scale");
  v24 = v27 - 1.0 / v23;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "scale");
  -[UIView setFrame:](bottomBorderView, "setFrame:", 15.0, v24, v4 + -15.0, 1.0 / v26);

}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_featureViews;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "setBackgroundColor:", v4);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v4);
  v10.receiver = self;
  v10.super_class = (Class)SUUIProductPageFeaturesView;
  -[SUUIProductPageFeaturesView setBackgroundColor:](&v10, sel_setBackgroundColor_, v4);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  uint64_t v5;
  UILabel *titleLabel;
  double v7;
  double v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  CGSize result;

  width = a3.width;
  v22 = *MEMORY[0x24BDAC8D0];
  v5 = -[NSMutableArray count](self->_featureViews, "count", a3.width, a3.height);
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel frame](titleLabel, "frame");
    v8 = v7 + -4.0 + -4.0 + 30.0 + 15.0;
  }
  else
  {
    v8 = 45.0;
  }
  if (v5 >= 2)
    v8 = v8 + (float)((float)(v5 - 1) * 16.0);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = self->_featureViews;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "sizeThatFits:", width + -30.0, 1.79769313e308, (_QWORD)v17);
        v8 = v8 + v14 + -2.0 + -2.0;
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  v15 = width;
  v16 = v8;
  result.height = v16;
  result.width = v15;
  return result;
}

- (id)_gameCenterStringWithFeatures:(unint64_t)a3
{
  id v5;
  uint64_t i;
  SUUIClientContext *clientContext;
  uint64_t v8;
  void *v9;
  SUUIClientContext *v10;
  SUUIClientContext *v11;
  void *v12;
  SUUIClientContext *v13;
  SUUIClientContext *v14;
  SUUIClientContext *v15;
  SUUIClientContext *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  if (a3)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    for (i = 0; i != 10; i += 2)
    {
      if ((qword_2511FB998[i] & a3) != 0)
      {
        clientContext = self->_clientContext;
        v8 = qword_2511FB998[i + 1];
        if (clientContext)
          -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", v8, CFSTR("ProductPage"));
        else
          +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", v8, 0, CFSTR("ProductPage"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v9);

      }
    }
    switch(objc_msgSend(v5, "count"))
    {
      case 1:
        v10 = self->_clientContext;
        if (v10)
          -[SUUIClientContext localizedStringForKey:inTable:](v10, "localizedStringForKey:inTable:", CFSTR("GAME_CENTER_SUPPORTS_FORMAT_%@"), CFSTR("ProductPage"));
        else
          +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GAME_CENTER_SUPPORTS_FORMAT_%@"), 0, CFSTR("ProductPage"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithValidatedFormat:validFormatSpecifiers:error:", v17, CFSTR("%@"), 0, v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_38;
      case 2:
        v13 = self->_clientContext;
        if (v13)
          -[SUUIClientContext localizedStringForKey:inTable:](v13, "localizedStringForKey:inTable:", CFSTR("GAME_CENTER_SUPPORTS_FORMAT_%@_%@"), CFSTR("ProductPage"));
        else
          +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GAME_CENTER_SUPPORTS_FORMAT_%@_%@"), 0, CFSTR("ProductPage"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithValidatedFormat:validFormatSpecifiers:error:", v17, CFSTR("%@%@"), 0, v19, v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_37;
      case 3:
        v14 = self->_clientContext;
        if (v14)
          -[SUUIClientContext localizedStringForKey:inTable:](v14, "localizedStringForKey:inTable:", CFSTR("GAME_CENTER_SUPPORTS_FORMAT_%@_%@_%@"), CFSTR("ProductPage"));
        else
          +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GAME_CENTER_SUPPORTS_FORMAT_%@_%@_%@"), 0, CFSTR("ProductPage"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithValidatedFormat:validFormatSpecifiers:error:", v17, CFSTR("%@%@%@"), 0, v19, v21, v23);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_36;
      case 4:
        v15 = self->_clientContext;
        if (v15)
          -[SUUIClientContext localizedStringForKey:inTable:](v15, "localizedStringForKey:inTable:", CFSTR("GAME_CENTER_SUPPORTS_FORMAT_%@_%@_%@_%@"), CFSTR("ProductPage"));
        else
          +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GAME_CENTER_SUPPORTS_FORMAT_%@_%@_%@_%@"), 0, CFSTR("ProductPage"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectAtIndexedSubscript:", 3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithValidatedFormat:validFormatSpecifiers:error:", v17, CFSTR("%@%@%@%@"), 0, v19, v21, v23, v25);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      case 5:
        v16 = self->_clientContext;
        if (v16)
          -[SUUIClientContext localizedStringForKey:inTable:](v16, "localizedStringForKey:inTable:", CFSTR("GAME_CENTER_SUPPORTS_FORMAT_%@_%@_%@_%@_%@"), CFSTR("ProductPage"));
        else
          +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GAME_CENTER_SUPPORTS_FORMAT_%@_%@_%@_%@_%@"), 0, CFSTR("ProductPage"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectAtIndexedSubscript:", 3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectAtIndexedSubscript:", 4);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithValidatedFormat:validFormatSpecifiers:error:", v17, CFSTR("%@%@%@%@%@"), 0, v19, v21, v23, v25, v27);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_35:
LABEL_36:

LABEL_37:
LABEL_38:

        break;
      default:
        v12 = 0;
        break;
    }

  }
  else
  {
    v11 = self->_clientContext;
    if (v11)
      -[SUUIClientContext localizedStringForKey:inTable:](v11, "localizedStringForKey:inTable:", CFSTR("SUPPORTS_GAMECENTER_BODY"), CFSTR("ProductPage"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("SUPPORTS_GAMECENTER_BODY"), 0, CFSTR("ProductPage"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void)setColorScheme:(id)a3
{
  objc_storeStrong((id *)&self->_colorScheme, a3);
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (int64_t)features
{
  return self->_features;
}

- (unint64_t)gameCenterFeatures
{
  return self->_gameCenterFeatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_featureViews, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_bottomBorderView, 0);
}

@end
