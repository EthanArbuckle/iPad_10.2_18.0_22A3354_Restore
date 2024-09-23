@implementation SUUIReviewsHistogramView

- (SUUIReviewsHistogramView)initWithClientContext:(id)a3
{
  id v5;
  SUUIReviewsHistogramView *v6;
  SUUIReviewsHistogramView *v7;
  id *p_clientContext;
  SUUIStarRatingControl *v9;
  SUUIStarRatingControl *starRatingControl;
  SUUIStarRatingControl *v11;
  void *v12;
  void *v13;
  void *v14;
  SUUIStarRatingControl *v15;
  void *v16;
  void *v17;
  void *v18;
  UILabel *v19;
  id *p_starRatingControlLabel;
  UILabel *starRatingControlLabel;
  UILabel *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  UILabel *v26;
  void *v27;
  uint64_t v28;
  UIButton *appSupportButton;
  UIButton *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  UIButton *v38;
  void *v39;
  uint64_t v40;
  UIButton *writeAReviewButton;
  UIButton *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  uint64_t v53;
  UIImageView *histogramImageView;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  UIImageView *userRatingStarsView;
  UILabel *v60;
  UILabel *countLabel;
  UILabel *v62;
  void *v63;
  void *v64;
  UILabel *v65;
  void *v66;
  UIView *v67;
  UIView *bottomSeparatorView;
  UIView *v69;
  void *v70;
  void *v71;
  objc_super v73;

  v5 = a3;
  v73.receiver = self;
  v73.super_class = (Class)SUUIReviewsHistogramView;
  v6 = -[SUUIReviewsHistogramView init](&v73, sel_init);
  v7 = v6;
  if (v6)
  {
    p_clientContext = (id *)&v6->_clientContext;
    objc_storeStrong((id *)&v6->_clientContext, a3);
    if (SUUIUserInterfaceIdiom(*p_clientContext) == 1)
    {
      v9 = objc_alloc_init(SUUIStarRatingControl);
      starRatingControl = v7->_starRatingControl;
      v7->_starRatingControl = v9;

      v11 = v7->_starRatingControl;
      v12 = (void *)MEMORY[0x24BEBD640];
      SUUIBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "imageNamed:inBundle:", CFSTR("LightRateControl"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIStarRatingControl setEmptyStarsImage:](v11, "setEmptyStarsImage:", v14);

      v15 = v7->_starRatingControl;
      v16 = (void *)MEMORY[0x24BEBD640];
      SUUIBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "imageNamed:inBundle:", CFSTR("RateControlFilled"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIStarRatingControl setFilledStarsImage:](v15, "setFilledStarsImage:", v18);

      -[SUUIStarRatingControl sizeToFit](v7->_starRatingControl, "sizeToFit");
      -[SUUIReviewsHistogramView addSubview:](v7, "addSubview:", v7->_starRatingControl);
      v19 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
      p_starRatingControlLabel = (id *)&v7->_starRatingControlLabel;
      starRatingControlLabel = v7->_starRatingControlLabel;
      v7->_starRatingControlLabel = v19;

      v22 = v7->_starRatingControlLabel;
      -[SUUIReviewsHistogramView backgroundColor](v7, "backgroundColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v22, "setBackgroundColor:", v23);

      v24 = v7->_starRatingControlLabel;
      objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v24, "setFont:", v25);

      v26 = v7->_starRatingControlLabel;
      -[SUUIColorScheme secondaryTextColor](v7->_colorScheme, "secondaryTextColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        -[UILabel setTextColor:](v26, "setTextColor:", v27);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.8);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v26, "setTextColor:", v31);

      }
      v32 = *p_starRatingControlLabel;
      if (*p_clientContext)
        objc_msgSend(*p_clientContext, "localizedStringForKey:inTable:", CFSTR("REVIEWS_TAP_TO_RATE"), CFSTR("ProductPage"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_TAP_TO_RATE"), 0, CFSTR("ProductPage"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setText:", v43);

      objc_msgSend(*p_starRatingControlLabel, "sizeToFit");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
      v28 = objc_claimAutoreleasedReturnValue();
      appSupportButton = v7->_appSupportButton;
      v7->_appSupportButton = (UIButton *)v28;

      v30 = v7->_appSupportButton;
      if (*p_clientContext)
        objc_msgSend(*p_clientContext, "localizedStringForKey:inTable:", CFSTR("REVIEWS_HEADER_BUTTON_APP_SUPPORT"), CFSTR("ProductPage"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_HEADER_BUTTON_APP_SUPPORT"), 0, CFSTR("ProductPage"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTitle:forState:](v30, "setTitle:forState:", v33, 0);

      -[UIButton titleLabel](v7->_appSupportButton, "titleLabel");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setFont:", v35);

      -[UIButton titleLabel](v7->_appSupportButton, "titleLabel");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setAdjustsFontSizeToFitWidth:", 1);

      -[UIButton titleLabel](v7->_appSupportButton, "titleLabel");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setMinimumScaleFactor:", 0.833333333);

      -[UIButton sizeToFit](v7->_appSupportButton, "sizeToFit");
      v38 = v7->_appSupportButton;
      -[SUUIColorScheme secondaryTextColor](v7->_colorScheme, "secondaryTextColor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTintColor:](v38, "setTintColor:", v39);

      -[SUUIReviewsHistogramView addSubview:](v7, "addSubview:", v7->_appSupportButton);
      objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
      v40 = objc_claimAutoreleasedReturnValue();
      p_starRatingControlLabel = (id *)&v7->_writeAReviewButton;
      writeAReviewButton = v7->_writeAReviewButton;
      v7->_writeAReviewButton = (UIButton *)v40;

      v42 = v7->_writeAReviewButton;
      if (*p_clientContext)
        objc_msgSend(*p_clientContext, "localizedStringForKey:inTable:", CFSTR("REVIEWS_HEADER_BUTTON_WRITE_A_REVIEW_IPHONE"), CFSTR("ProductPage"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_HEADER_BUTTON_WRITE_A_REVIEW_IPHONE"), 0, CFSTR("ProductPage"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTitle:forState:](v42, "setTitle:forState:", v44, 0);

      objc_msgSend(*p_starRatingControlLabel, "titleLabel");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setFont:", v46);

      objc_msgSend(*p_starRatingControlLabel, "titleLabel");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setAdjustsFontSizeToFitWidth:", 1);

      objc_msgSend(*p_starRatingControlLabel, "titleLabel");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setMinimumScaleFactor:", 0.833333333);

      objc_msgSend(*p_starRatingControlLabel, "sizeToFit");
      v49 = *p_starRatingControlLabel;
      -[SUUIColorScheme secondaryTextColor](v7->_colorScheme, "secondaryTextColor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setTintColor:", v50);

    }
    -[SUUIReviewsHistogramView addSubview:](v7, "addSubview:", *p_starRatingControlLabel);
    v51 = objc_alloc(MEMORY[0x24BEBD668]);
    -[SUUIReviewsHistogramView _histogramImageForValues:](v7, "_histogramImageForValues:", &unk_2512EEA60);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v51, "initWithImage:", v52);
    histogramImageView = v7->_histogramImageView;
    v7->_histogramImageView = (UIImageView *)v53;

    -[UIImageView sizeToFit](v7->_histogramImageView, "sizeToFit");
    -[SUUIReviewsHistogramView addSubview:](v7, "addSubview:", v7->_histogramImageView);
    v55 = objc_alloc(MEMORY[0x24BEBD668]);
    +[SUUIRatingStarsCache cacheWithProperties:](SUUIRatingStarsCache, "cacheWithProperties:", 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "ratingStarsImageForRating:", 0.0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v55, "initWithImage:", v57);
    userRatingStarsView = v7->_userRatingStarsView;
    v7->_userRatingStarsView = (UIImageView *)v58;

    -[SUUIReviewsHistogramView addSubview:](v7, "addSubview:", v7->_userRatingStarsView);
    v60 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    countLabel = v7->_countLabel;
    v7->_countLabel = v60;

    v62 = v7->_countLabel;
    -[SUUIColorScheme secondaryTextColor](v7->_colorScheme, "secondaryTextColor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v63)
    {
      -[UILabel setTextColor:](v62, "setTextColor:", v63);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.8);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v62, "setTextColor:", v64);

    }
    -[UILabel setNumberOfLines:](v7->_countLabel, "setNumberOfLines:", 0);
    v65 = v7->_countLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v65, "setFont:", v66);

    -[SUUIReviewsHistogramView addSubview:](v7, "addSubview:", v7->_countLabel);
    -[SUUIReviewsHistogramView setNumberOfUserRatings:](v7, "setNumberOfUserRatings:", 0);
    v67 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    bottomSeparatorView = v7->_bottomSeparatorView;
    v7->_bottomSeparatorView = v67;

    v69 = v7->_bottomSeparatorView;
    -[SUUIColorScheme primaryTextColor](v7->_colorScheme, "primaryTextColor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (v70)
    {
      -[UIView setBackgroundColor:](v69, "setBackgroundColor:", v70);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v69, "setBackgroundColor:", v71);

    }
    -[SUUIReviewsHistogramView addSubview:](v7, "addSubview:", v7->_bottomSeparatorView);
  }

  return v7;
}

- (int64_t)personalStarRating
{
  return -[SUUIStarRatingControl userRating](self->_starRatingControl, "userRating");
}

- (UIControl)segmentedControl
{
  UISegmentedControl *segmentedControl;
  id v4;
  UISegmentedControl *v5;
  UISegmentedControl *v6;
  UISegmentedControl *v7;
  void *v8;
  void *v9;

  segmentedControl = self->_segmentedControl;
  if (!segmentedControl)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD938]);
    v5 = (UISegmentedControl *)objc_msgSend(v4, "initWithItems:", MEMORY[0x24BDBD1A8]);
    v6 = self->_segmentedControl;
    self->_segmentedControl = v5;

    v7 = self->_segmentedControl;
    -[SUUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[UISegmentedControl setTintColor:](v7, "setTintColor:", v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.517647059, 1.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISegmentedControl setTintColor:](v7, "setTintColor:", v9);

    }
    segmentedControl = self->_segmentedControl;
  }
  return (UIControl *)segmentedControl;
}

- (NSArray)segmentedControlTitles
{
  void *v3;
  unint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UISegmentedControl numberOfSegments](self->_segmentedControl, "numberOfSegments"))
  {
    v4 = 0;
    do
    {
      -[UISegmentedControl titleForSegmentAtIndex:](self->_segmentedControl, "titleForSegmentAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        objc_msgSend(v3, "addObject:", v5);

      ++v4;
    }
    while (v4 < -[UISegmentedControl numberOfSegments](self->_segmentedControl, "numberOfSegments"));
  }
  return (NSArray *)v3;
}

- (int64_t)selectedSegmentIndex
{
  void *v2;
  int64_t v3;

  -[SUUIReviewsHistogramView segmentedControl](self, "segmentedControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectedSegmentIndex");

  return v3;
}

- (void)setColorScheme:(id)a3
{
  SUUIColorScheme *v5;
  SUUIColorScheme **p_colorScheme;
  UILabel *countLabel;
  void *v8;
  void *v9;
  UILabel *starRatingControlLabel;
  void *v11;
  void *v12;
  UILabel *titleLabel;
  void *v14;
  void *v15;
  UIImageView *histogramImageView;
  void *v17;
  UISegmentedControl *segmentedControl;
  void *v19;
  void *v20;
  UIButton *appSupportButton;
  void *v22;
  UIButton *writeAReviewButton;
  void *v24;
  SUUIColorScheme *v25;

  v5 = (SUUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v25 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    countLabel = self->_countLabel;
    -[SUUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[UILabel setTextColor:](countLabel, "setTextColor:", v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](countLabel, "setTextColor:", v9);

    }
    starRatingControlLabel = self->_starRatingControlLabel;
    -[SUUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[UILabel setTextColor:](starRatingControlLabel, "setTextColor:", v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](starRatingControlLabel, "setTextColor:", v12);

    }
    titleLabel = self->_titleLabel;
    -[SUUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[UILabel setTextColor:](titleLabel, "setTextColor:", v14);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](titleLabel, "setTextColor:", v15);

    }
    histogramImageView = self->_histogramImageView;
    -[SUUIReviewsHistogramView _histogramImageForValues:](self, "_histogramImageForValues:", self->_histogramValues);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](histogramImageView, "setImage:", v17);

    segmentedControl = self->_segmentedControl;
    -[SUUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[UISegmentedControl setTintColor:](segmentedControl, "setTintColor:", v19);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.517647059, 1.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISegmentedControl setTintColor:](segmentedControl, "setTintColor:", v20);

    }
    appSupportButton = self->_appSupportButton;
    -[SUUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](appSupportButton, "setTintColor:", v22);

    writeAReviewButton = self->_writeAReviewButton;
    -[SUUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](writeAReviewButton, "setTintColor:", v24);

    v5 = v25;
  }

}

- (void)setHistogramValues:(id)a3
{
  NSArray **p_histogramValues;
  UIImageView *histogramImageView;
  void *v7;
  id v8;

  p_histogramValues = &self->_histogramValues;
  v8 = a3;
  if (!-[NSArray isEqualToArray:](*p_histogramValues, "isEqualToArray:") && objc_msgSend(v8, "count") == 5)
  {
    objc_storeStrong((id *)&self->_histogramValues, a3);
    histogramImageView = self->_histogramImageView;
    -[SUUIReviewsHistogramView _histogramImageForValues:](self, "_histogramImageForValues:", *p_histogramValues);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](histogramImageView, "setImage:", v7);

  }
}

- (void)setNumberOfUserRatings:(int64_t)a3
{
  UILabel *countLabel;
  void *v5;

  self->_numberOfUserRatings = a3;
  countLabel = self->_countLabel;
  -[SUUIReviewsHistogramView _countLabelString](self, "_countLabelString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](countLabel, "setText:", v5);

  -[SUUIReviewsHistogramView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setPersonalStarRating:(int64_t)a3
{
  -[SUUIStarRatingControl setUserRating:](self->_starRatingControl, "setUserRating:", a3);
}

- (void)setSegmentedControlTitles:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[SUUIReviewsHistogramView segmentedControl](self, "segmentedControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllSegments");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__SUUIReviewsHistogramView_setSegmentedControlTitles___block_invoke;
  v8[3] = &unk_2511FC6E0;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);
  v6 = objc_msgSend(v4, "count");

  if (v6)
  {
    objc_msgSend(v7, "sizeToFit");
    -[SUUIReviewsHistogramView addSubview:](self, "addSubview:", v7);
  }
  else
  {
    objc_msgSend(v7, "removeFromSuperview");
  }

}

uint64_t __54__SUUIReviewsHistogramView_setSegmentedControlTitles___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertSegmentWithTitle:atIndex:animated:", a2, a3, 0);
}

- (void)setSelectedSegmentIndex:(int64_t)a3
{
  id v4;

  -[SUUIReviewsHistogramView segmentedControl](self, "segmentedControl");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedSegmentIndex:", a3);

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
  void *v15;
  id v16;

  v16 = a3;
  -[UILabel text](self->_titleLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v16 && (objc_msgSend(v4, "isEqualToString:", v16) & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v16)
    {
      if (!titleLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v7 = self->_titleLabel;
        self->_titleLabel = v6;

        v8 = self->_titleLabel;
        -[SUUIReviewsHistogramView backgroundColor](self, "backgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_titleLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 17.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        v12 = self->_titleLabel;
        -[SUUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          -[UILabel setTextColor:](v12, "setTextColor:", v13);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v12, "setTextColor:", v15);

        }
        -[SUUIReviewsHistogramView addSubview:](self, "addSubview:", self->_titleLabel);
        titleLabel = self->_titleLabel;
      }
      -[UILabel setText:](titleLabel, "setText:");
      -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](titleLabel, "removeFromSuperview");
      v14 = self->_titleLabel;
      self->_titleLabel = 0;

    }
    -[SUUIReviewsHistogramView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setUserRating:(double)a3
{
  UIImageView *userRatingStarsView;
  void *v5;
  id v6;

  if (self->_userRating != a3)
  {
    self->_userRating = a3;
    userRatingStarsView = self->_userRatingStarsView;
    +[SUUIRatingStarsCache cacheWithProperties:](SUUIRatingStarsCache, "cacheWithProperties:", 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ratingStarsImageForRating:", self->_userRating);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](userRatingStarsView, "setImage:", v5);

  }
}

- (void)setVersionString:(id)a3
{
  NSString *v4;
  NSString *versionString;
  UILabel *countLabel;
  void *v7;

  if (self->_versionString != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    versionString = self->_versionString;
    self->_versionString = v4;

    countLabel = self->_countLabel;
    -[SUUIReviewsHistogramView _countLabelString](self, "_countLabelString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](countLabel, "setText:", v7);

    -[SUUIReviewsHistogramView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (double)userRating
{
  return self->_userRating;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  UILabel *titleLabel;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  float v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  UILabel *countLabel;
  UILabel *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  UIImageView *histogramImageView;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  double MaxY;
  float v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double width;
  CGFloat height;
  CGFloat v43;
  double v44;
  double v45;
  float v46;
  CGFloat v47;
  CGFloat MaxX;
  double v49;
  CGFloat v50;
  double v51;
  UIButton *writeAReviewButton;
  float v53;
  double v54;
  UIView *bottomSeparatorView;
  void *v56;
  double v57;
  double v58;
  double v59;
  float v60;
  double v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  -[SUUIReviewsHistogramView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel frame](titleLabel, "frame");
    v9 = v8;
    v11 = v10;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", 15.0, 11.0);
    v62.origin.x = 15.0;
    v62.origin.y = 11.0;
    v62.size.width = v9;
    v62.size.height = v11;
    v12 = CGRectGetMaxY(v62) + -4.0 + 19.0;
  }
  else
  {
    v12 = 15.0;
  }
  if (-[UISegmentedControl isDescendantOfView:](self->_segmentedControl, "isDescendantOfView:", self))
  {
    -[UISegmentedControl frame](self->_segmentedControl, "frame");
    v14 = v13;
    if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
    {
      v15 = 295.0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "userInterfaceIdiom") == 1)
      {
        v15 = 290.0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "bounds");
        v15 = v18 + -30.0;

      }
    }
    -[UISegmentedControl setFrame:](self->_segmentedControl, "setFrame:", 15.0, v12, v15, v14);
    v63.origin.x = 15.0;
    v63.origin.y = v12;
    v63.size.width = v15;
    v63.size.height = v14;
    v12 = CGRectGetMaxY(v63) + 19.0;
  }
  if (self->_userRatingStarsView)
  {
    countLabel = self->_countLabel;
    if (countLabel)
    {
      -[UILabel frame](countLabel, "frame");
      v20 = self->_countLabel;
      -[UIImageView frame](self->_userRatingStarsView, "frame");
      -[UILabel sizeThatFits:](v20, "sizeThatFits:", v4 + -45.0 - v21 + -9.0, 1.79769313e308);
      v23 = v22;
      v25 = v24;
      -[UIImageView frame](self->_userRatingStarsView, "frame");
      v27 = v26 + 15.0 + 9.0;
      -[UILabel setFrame:](self->_countLabel, "setFrame:", v27, (float)(v12 + -4.0), v23, v25);
      v64.origin.x = v27;
      v64.origin.y = (float)(v12 + -4.0);
      v64.size.width = v23;
      v64.size.height = v25;
      v28 = CGRectGetMaxY(v64) + -3.0;
      -[UIImageView frame](self->_userRatingStarsView, "frame");
      -[UIImageView setFrame:](self->_userRatingStarsView, "setFrame:", 15.0, (float)(v12 + 1.0));
      v12 = v28 + 10.0;
    }
  }
  histogramImageView = self->_histogramImageView;
  if (histogramImageView)
  {
    -[UIImageView frame](histogramImageView, "frame");
    v31 = v30;
    v33 = v32;
    -[UIImageView setFrame:](self->_histogramImageView, "setFrame:", 15.0, (float)(v12 + -2.0));
    v65.origin.x = 15.0;
    v65.origin.y = (float)(v12 + -2.0);
    v65.size.width = v31;
    v65.size.height = v33;
    v12 = CGRectGetMaxY(v65) + 19.0 + -3.0;
  }
  if (self->_starRatingControl)
  {
    -[UILabel frame](self->_countLabel, "frame");
    v60 = v12;
    v34 = CGRectGetMinY(v66) + -19.0;
    -[UIImageView frame](self->_histogramImageView, "frame");
    MaxY = CGRectGetMaxY(v67);
    v36 = v4 * 0.5;
    v37 = floorf(v36);
    -[SUUIStarRatingControl frame](self->_starRatingControl, "frame");
    v59 = v38;
    v40 = v39;
    -[UILabel frame](self->_starRatingControlLabel, "frame");
    width = v68.size.width;
    v61 = v4;
    height = v68.size.height;
    v43 = v37 + 40.0;
    v44 = v6;
    v45 = MaxY - v34;
    v46 = (MaxY - v34 - v68.size.height) * 0.5;
    v47 = v34 + floorf(v46);
    v68.origin.x = v43;
    v68.origin.y = v47;
    MaxX = CGRectGetMaxX(v68);
    v49 = v45 - v40;
    v6 = v44;
    *(float *)&v49 = v49 * 0.5;
    v50 = v34 + floorf(*(float *)&v49);
    v12 = v60;
    -[SUUIStarRatingControl setFrame:](self->_starRatingControl, "setFrame:", MaxX + 8.0, v50, v59, v40);
    v51 = height;
    v4 = v61;
    -[UILabel setFrame:](self->_starRatingControlLabel, "setFrame:", v43, v47, width, v51);
  }
  if (self->_appSupportButton)
  {
    writeAReviewButton = self->_writeAReviewButton;
    if (writeAReviewButton)
    {
      v53 = (v4 + -30.0 + -10.0) * 0.5;
      v54 = floorf(v53);
      -[UIButton frame](writeAReviewButton, "frame");
      -[UIButton setFrame:](self->_writeAReviewButton, "setFrame:", 15.0, (float)(v12 + -11.0), v54);
      -[UIButton frame](self->_appSupportButton, "frame");
      -[UIButton setFrame:](self->_appSupportButton, "setFrame:", v4 + -15.0 - v54, (float)(v12 + -11.0), v54);
    }
  }
  bottomSeparatorView = self->_bottomSeparatorView;
  if (bottomSeparatorView)
  {
    -[UIView frame](bottomSeparatorView, "frame");
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "scale");
    v58 = 1.0 / v57;

    -[UIView setFrame:](self->_bottomSeparatorView, "setFrame:", 15.0, v6 - v58, v4 + -15.0, v58);
  }
}

- (void)setBackgroundColor:(id)a3
{
  UILabel *countLabel;
  id v5;
  objc_super v6;

  countLabel = self->_countLabel;
  v5 = a3;
  -[UILabel setBackgroundColor:](countLabel, "setBackgroundColor:", v5);
  -[SUUIStarRatingControl setBackgroundColor:](self->_starRatingControl, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_starRatingControlLabel, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIReviewsHistogramView;
  -[SUUIReviewsHistogramView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  UILabel *countLabel;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a3.width;
  if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
    v5 = 136.0;
  else
    v5 = 168.0;
  if (-[UISegmentedControl isDescendantOfView:](self->_segmentedControl, "isDescendantOfView:", self))
  {
    -[UISegmentedControl frame](self->_segmentedControl, "frame");
    v5 = v5 + v6 + 19.0;
  }
  countLabel = self->_countLabel;
  if (countLabel)
  {
    -[UIImageView frame](self->_userRatingStarsView, "frame");
    -[UILabel sizeThatFits:](countLabel, "sizeThatFits:", width + -45.0 - v8 + -9.0, 1.79769313e308);
    v5 = v5 + v9 + -7.0;
  }
  v10 = width;
  v11 = v5;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)_histogramImageForValues:(id)a3
{
  void *v3;
  id v5;
  uint64_t v6;
  char *__ptr32 *v7;
  int v8;
  double v9;
  double v10;
  float v11;
  double v12;
  void *v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  unint64_t v28;
  float v29;
  double v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  double v34;
  id v35;
  double v36;
  unint64_t v37;
  double v38;
  double v39;
  unint64_t v40;
  SUUIReviewsHistogramView *v41;
  double v42;
  uint64_t v43;
  void *v44;
  void *v45;
  double v46;
  uint64_t v47;
  double v48;
  double v49;
  uint64_t v50;
  void *v51;
  float v52;
  float v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  SUUIReviewsHistogramView *v63;
  CGContext *c;
  void *v65;
  CGSize v66;
  CGRect v67;

  v5 = a3;
  v63 = self;
  v6 = SUUIUserInterfaceIdiom(self->_clientContext);
  v7 = &off_241EFB000;
  if (v6 == 1)
  {
    v8 = 0;
    v9 = 295.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "userInterfaceIdiom") == 1)
    {
      v8 = 0;
      v9 = 290.0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v7 = (char *__ptr32 *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bounds");
      v9 = v10 + -30.0;
      v8 = 1;
    }
  }
  v11 = (float)(unint64_t)objc_msgSend(v5, "count") * 14.0;
  if (v8)

  v12 = v11;
  if (v6 != 1)

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  v15 = v14;
  v66.width = v9;
  v66.height = v12;
  UIGraphicsBeginImageContextWithOptions(v66, 0, v15);

  c = UIGraphicsGetCurrentContext();
  v16 = (void *)MEMORY[0x24BEBD640];
  SUUIBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "imageNamed:inBundle:", CFSTR("SmallStarFull"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIColorScheme primaryTextColor](v63->_colorScheme, "primaryTextColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[SUUIColorScheme primaryTextColor](v63->_colorScheme, "primaryTextColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIColorWithAlpha(v20, 0.1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    SUUITintedImage(v18, 0, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.05);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    SUUITintedImage(v18, 0, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[SUUIColorScheme primaryTextColor](v63->_colorScheme, "primaryTextColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    SUUITintedImage(v18, 0, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.517647059, 1.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    SUUITintedImage(v18, 0, v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v18, "size");
  v27 = v26;
  if (objc_msgSend(v5, "count"))
  {
    v28 = 0;
    v29 = (14.0 - v27) * 0.5;
    v30 = roundf(v29);
    do
    {
      if (objc_msgSend(v5, "count"))
      {
        v31 = 0;
        do
        {
          v32 = v31 + 1;
          if (v31 >= v28)
            v33 = v24;
          else
            v33 = v22;
          v34 = (double)v31;
          v35 = v33;
          objc_msgSend(v18, "size");
          objc_msgSend(v35, "drawAtPoint:", v36 * v34, v30 + (float)((float)(uint64_t)v28 * 14.0));

          v37 = objc_msgSend(v5, "count");
          v31 = v32;
        }
        while (v32 < v37);
      }
      ++v28;
    }
    while (v28 < objc_msgSend(v5, "count"));
  }
  objc_msgSend(v18, "size");
  v39 = v38;
  v40 = objc_msgSend(v5, "count");
  v41 = v63;
  if (SUUIUserInterfaceIdiom(v63->_clientContext) == 1)
  {
    v42 = 295.0;
    v43 = 432;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v44, "userInterfaceIdiom") == 1)
    {
      v42 = 290.0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "bounds");
      v42 = v46 + -30.0;

    }
    v43 = 432;

  }
  if (objc_msgSend(v5, "count"))
  {
    v47 = 0;
    v48 = v39 * (double)v40 + 9.0;
    v49 = v42 - v48;
    v50 = -1;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v5, "count") + v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "floatValue");
      v53 = v52;

      objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:cornerRadius:", v48, (float)((float)v47 * 14.0) + 6.0, v49, 2.0, 2.0);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)((char *)&v41->super.super.super.isa + v43), "primaryTextColor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (v54)
      {
        objc_msgSend(*(id *)((char *)&v41->super.super.super.isa + v43), "primaryTextColor");
        v55 = v43;
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        SUUIColorWithAlpha(v56, 0.1);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "set");

        v41 = v63;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.05);
        v55 = v43;
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "set");
      }

      objc_msgSend(v65, "fill");
      CGContextSaveGState(c);
      v67.size.height = 2.0;
      v67.origin.x = v48;
      v67.origin.y = (float)((float)v47 * 14.0) + 6.0;
      v67.size.width = v49 * v53;
      CGContextClipToRect(c, v67);
      objc_msgSend(*(id *)((char *)&v41->super.super.super.isa + v55), "primaryTextColor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v58;
      if (v58)
      {
        v43 = v55;
        objc_msgSend(v58, "set");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.517647059, 1.0);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "set");

        v43 = 432;
      }

      objc_msgSend(v65, "fill");
      CGContextRestoreGState(c);

      ++v47;
      --v50;
    }
    while (v47 < (unint64_t)objc_msgSend(v5, "count"));
  }
  UIGraphicsGetImageFromCurrentImageContext();
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v61;
}

- (id)_countLabelString
{
  id v3;
  void *v4;
  void *v5;
  int64_t numberOfUserRatings;
  SUUIClientContext *clientContext;
  const __CFString *v8;
  SUUIClientContext *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;

  v3 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v3, "setNumberStyle:", 1);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_numberOfUserRatings);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromNumber:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  numberOfUserRatings = self->_numberOfUserRatings;
  if (numberOfUserRatings)
  {
    clientContext = self->_clientContext;
    if (self->_versionString)
    {
      if (numberOfUserRatings == 1)
      {
        if (clientContext)
        {
          v8 = CFSTR("REVIEWS_COUNT_CURRENT_VERSION_ONE");
LABEL_13:
          -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", v8, CFSTR("ProductPage"));
          v11 = objc_claimAutoreleasedReturnValue();
LABEL_22:
          v15 = (void *)v11;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%@%@"), 0, v5, self->_versionString);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_27;
        }
        v14 = CFSTR("REVIEWS_COUNT_CURRENT_VERSION_ONE");
      }
      else
      {
        if (clientContext)
        {
          v8 = CFSTR("REVIEWS_COUNT_CURRENT_VERSION_PLURAL");
          goto LABEL_13;
        }
        v14 = CFSTR("REVIEWS_COUNT_CURRENT_VERSION_PLURAL");
      }
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", v14, 0, CFSTR("ProductPage"));
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    if (numberOfUserRatings == 1)
    {
      if (clientContext)
      {
        v10 = CFSTR("REVIEWS_COUNT_ALL_VERSIONS_ONE");
LABEL_18:
        -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", v10, CFSTR("ProductPage"));
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_26:
        v17 = (void *)v13;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%@"), 0, v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_27;
      }
      v16 = CFSTR("REVIEWS_COUNT_ALL_VERSIONS_ONE");
    }
    else
    {
      if (clientContext)
      {
        v10 = CFSTR("REVIEWS_COUNT_ALL_VERSIONS_PLURAL");
        goto LABEL_18;
      }
      v16 = CFSTR("REVIEWS_COUNT_ALL_VERSIONS_PLURAL");
    }
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", v16, 0, CFSTR("ProductPage"));
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  v9 = self->_clientContext;
  if (v9)
    -[SUUIClientContext localizedStringForKey:inTable:](v9, "localizedStringForKey:inTable:", CFSTR("REVIEWS_COUNT_NONE"), CFSTR("ProductPage"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_COUNT_NONE"), 0, CFSTR("ProductPage"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

  return v12;
}

- (UIControl)appSupportButton
{
  return &self->_appSupportButton->super;
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (int64_t)numberOfUserRatings
{
  return self->_numberOfUserRatings;
}

- (UIControl)starRatingControl
{
  return &self->_starRatingControl->super;
}

- (NSString)versionString
{
  return self->_versionString;
}

- (UIControl)writeAReviewButton
{
  return &self->_writeAReviewButton->super;
}

- (NSArray)histogramValues
{
  return self->_histogramValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_histogramValues, 0);
  objc_storeStrong((id *)&self->_histogramImageView, 0);
  objc_storeStrong((id *)&self->_bottomSeparatorView, 0);
  objc_storeStrong((id *)&self->_writeAReviewButton, 0);
  objc_storeStrong((id *)&self->_versionString, 0);
  objc_storeStrong((id *)&self->_userRatingStarsView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_starRatingControlLabel, 0);
  objc_storeStrong((id *)&self->_starRatingControl, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_ratings, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_appSupportButton, 0);
}

@end
