@implementation FCSpotlightOperationResult

- (FCSpotlightOperationResult)initWithSpotlightGroupConfig:(id)a3 headline:(id)a4
{
  id v6;
  id v7;
  FCSpotlightOperationResult *v8;
  FCSpotlightOperationResult *v9;
  void *v10;
  uint64_t v11;
  NSString *eyebrowTitle;
  void *v13;
  uint64_t v14;
  NSString *titleText;
  void *v16;
  uint64_t v17;
  NSString *subTitleText;
  void *v19;
  uint64_t v20;
  NSString *ctaText;
  void *v22;
  uint64_t v23;
  NSDate *publishDate;
  void *v25;
  uint64_t v26;
  FCColor *titleColor;
  uint64_t v28;
  FCCardStyleProviding *spotlightItemStyle;
  uint64_t v30;
  FCCardStyleProviding *spotlightItemDarkStyle;
  objc_super v33;

  v6 = a3;
  v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)FCSpotlightOperationResult;
  v8 = -[FCSpotlightOperationResult init](&v33, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_headline, a4);
    objc_msgSend(v6, "spotlightEyebrowTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    eyebrowTitle = v9->_eyebrowTitle;
    v9->_eyebrowTitle = (NSString *)v11;

    objc_msgSend(v6, "groupName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    titleText = v9->_titleText;
    v9->_titleText = (NSString *)v14;

    objc_msgSend(v6, "groupSubtitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    subTitleText = v9->_subTitleText;
    v9->_subTitleText = (NSString *)v17;

    objc_msgSend(v6, "spotlightCallToActionTitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    ctaText = v9->_ctaText;
    v9->_ctaText = (NSString *)v20;

    objc_msgSend(v6, "publishDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    publishDate = v9->_publishDate;
    v9->_publishDate = (NSDate *)v23;

    objc_msgSend(v6, "groupTitleColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "copy");
    titleColor = v9->_titleColor;
    v9->_titleColor = (FCColor *)v26;

    objc_msgSend(v6, "spotlightItemStyle");
    v28 = objc_claimAutoreleasedReturnValue();
    spotlightItemStyle = v9->_spotlightItemStyle;
    v9->_spotlightItemStyle = (FCCardStyleProviding *)v28;

    objc_msgSend(v6, "spotlightItemDarkStyle");
    v30 = objc_claimAutoreleasedReturnValue();
    spotlightItemDarkStyle = v9->_spotlightItemDarkStyle;
    v9->_spotlightItemDarkStyle = (FCCardStyleProviding *)v30;

  }
  return v9;
}

- (FCHeadlineProviding)headline
{
  return self->_headline;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (NSString)eyebrowTitle
{
  return self->_eyebrowTitle;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)subTitleText
{
  return self->_subTitleText;
}

- (NSString)ctaText
{
  return self->_ctaText;
}

- (FCColor)titleColor
{
  return self->_titleColor;
}

- (NSDate)publishDate
{
  return self->_publishDate;
}

- (FCCardStyleProviding)spotlightItemStyle
{
  return self->_spotlightItemStyle;
}

- (FCCardStyleProviding)spotlightItemDarkStyle
{
  return self->_spotlightItemDarkStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightItemDarkStyle, 0);
  objc_storeStrong((id *)&self->_spotlightItemStyle, 0);
  objc_storeStrong((id *)&self->_publishDate, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_ctaText, 0);
  objc_storeStrong((id *)&self->_subTitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_eyebrowTitle, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
  objc_storeStrong((id *)&self->_headline, 0);
}

@end
