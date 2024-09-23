@implementation SUUIReviewsHistogramViewController

- (UIControl)appSupportButton
{
  void *v2;
  void *v3;

  -[SUUIReviewsHistogramViewController _histogramView](self, "_histogramView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appSupportButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIControl *)v3;
}

- (int64_t)personalStarRating
{
  return -[SUUIReviewsHistogramView personalStarRating](self->_histogramView, "personalStarRating");
}

- (UIControl)segmentedControl
{
  void *v2;
  void *v3;

  -[SUUIReviewsHistogramViewController _histogramView](self, "_histogramView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "segmentedControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIControl *)v3;
}

- (NSArray)segmentedControlTitles
{
  return -[SUUIReviewsHistogramView segmentedControlTitles](self->_histogramView, "segmentedControlTitles");
}

- (int64_t)selectedSegmentIndex
{
  SUUIReviewsHistogramView *histogramView;

  histogramView = self->_histogramView;
  if (histogramView)
    return -[SUUIReviewsHistogramView selectedSegmentIndex](histogramView, "selectedSegmentIndex");
  else
    return -1;
}

- (void)setPersonalStarRating:(int64_t)a3
{
  id v4;

  -[SUUIReviewsHistogramViewController _histogramView](self, "_histogramView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPersonalStarRating:", a3);

}

- (void)setReviewList:(id)a3
{
  SUUIReviewList *v5;
  SUUIReviewList *v6;

  v5 = (SUUIReviewList *)a3;
  if (self->_reviewList != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_reviewList, a3);
    -[SUUIReviewsHistogramViewController _reloadHistogram](self, "_reloadHistogram");
    v5 = v6;
  }

}

- (void)setSegmentedControlTitles:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUUIReviewsHistogramViewController _histogramView](self, "_histogramView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSegmentedControlTitles:", v4);

}

- (void)setSelectedSegmentIndex:(int64_t)a3
{
  id v4;

  -[SUUIReviewsHistogramViewController _histogramView](self, "_histogramView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedSegmentIndex:", a3);

}

- (void)setVersionString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUUIReviewsHistogramViewController _histogramView](self, "_histogramView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVersionString:", v4);

}

- (UIControl)starRatingControl
{
  void *v2;
  void *v3;

  -[SUUIReviewsHistogramViewController _histogramView](self, "_histogramView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "starRatingControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIControl *)v3;
}

- (NSString)versionString
{
  return -[SUUIReviewsHistogramView versionString](self->_histogramView, "versionString");
}

- (UIControl)writeAReviewButton
{
  void *v2;
  void *v3;

  -[SUUIReviewsHistogramViewController _histogramView](self, "_histogramView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "writeAReviewButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIControl *)v3;
}

- (void)loadView
{
  id v3;

  -[SUUIReviewsHistogramViewController _histogramView](self, "_histogramView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIReviewsHistogramViewController setView:](self, "setView:", v3);

}

- (id)_histogramView
{
  SUUIReviewsHistogramView *histogramView;
  SUUIReviewsHistogramView *v4;
  SUUIReviewsHistogramView *v5;
  SUUIReviewsHistogramView *v6;
  SUUIClientContext *clientContext;
  const __CFString *v8;
  void *v9;

  histogramView = self->_histogramView;
  if (!histogramView)
  {
    v4 = -[SUUIReviewsHistogramView initWithClientContext:]([SUUIReviewsHistogramView alloc], "initWithClientContext:", self->_clientContext);
    v5 = self->_histogramView;
    self->_histogramView = v4;

    v6 = self->_histogramView;
    clientContext = self->_clientContext;
    if (SUUIUserInterfaceIdiom(clientContext) == 1)
      v8 = CFSTR("REVIEWS_HISTOGRAM_TITLE_IPAD");
    else
      v8 = CFSTR("REVIEWS_HISTOGRAM_TITLE_IPHONE");
    if (clientContext)
      -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", v8, CFSTR("ProductPage"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", v8, 0, CFSTR("ProductPage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIReviewsHistogramView setTitle:](v6, "setTitle:", v9);

    -[SUUIReviewsHistogramViewController _reloadHistogram](self, "_reloadHistogram");
    histogramView = self->_histogramView;
  }
  return histogramView;
}

- (void)_reloadHistogram
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  float v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  SUUIReviewsHistogramView *v21;
  float v22;
  SUUIReviewsHistogramView *histogramView;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = -[SUUIReviewList ratingCount](self->_reviewList, "ratingCount");
  v8 = (float)v7;
  -[SUUIReviewsHistogramView setNumberOfUserRatings:](self->_histogramView, "setNumberOfUserRatings:", (uint64_t)(float)v7);
  histogramView = self->_histogramView;
  if (v7)
  {
    v9 = (void *)MEMORY[0x24BDD16E0];
    *(float *)&v10 = (float)-[SUUIReviewList oneStarRatingCount](self->_reviewList, "oneStarRatingCount") / v8;
    objc_msgSend(v9, "numberWithFloat:", v10);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v2;
    v11 = (void *)MEMORY[0x24BDD16E0];
    *(float *)&v12 = (float)-[SUUIReviewList twoStarRatingCount](self->_reviewList, "twoStarRatingCount") / v8;
    objc_msgSend(v11, "numberWithFloat:", v12);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v3;
    v13 = (void *)MEMORY[0x24BDD16E0];
    *(float *)&v14 = (float)-[SUUIReviewList threeStarRatingCount](self->_reviewList, "threeStarRatingCount") / v8;
    objc_msgSend(v13, "numberWithFloat:", v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v4;
    v15 = (void *)MEMORY[0x24BDD16E0];
    *(float *)&v16 = (float)-[SUUIReviewList fourStarRatingCount](self->_reviewList, "fourStarRatingCount") / v8;
    objc_msgSend(v15, "numberWithFloat:", v16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v5;
    v17 = (void *)MEMORY[0x24BDD16E0];
    *(float *)&v18 = (float)-[SUUIReviewList fiveStarRatingCount](self->_reviewList, "fiveStarRatingCount") / v8;
    objc_msgSend(v17, "numberWithFloat:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = &unk_2512EEC28;
    v24 = &unk_2512EEC28;
    v25 = &unk_2512EEC28;
    v26 = &unk_2512EEC28;
    v27 = &unk_2512EEC28;
  }
  v28 = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIReviewsHistogramView setHistogramValues:](histogramView, "setHistogramValues:", v20);

  if (v7)
  {

  }
  v21 = self->_histogramView;
  -[SUUIReviewList userRating](self->_reviewList, "userRating");
  -[SUUIReviewsHistogramView setUserRating:](v21, "setUserRating:", (float)(v22 / 5.0));
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SUUIReviewList)reviewList
{
  return self->_reviewList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reviewList, 0);
  objc_storeStrong((id *)&self->_histogramView, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
