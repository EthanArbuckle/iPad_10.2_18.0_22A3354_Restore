@implementation _MKMapItemUserRatingSnippetReview

- (_MKMapItemUserRatingSnippetReview)initWithMapItem:(id)a3 review:(id)a4
{
  id v7;
  id v8;
  _MKMapItemUserRatingSnippetReview *v9;
  _MKMapItemUserRatingSnippetReview *v10;
  _MKMapItemUserRatingSnippetReview *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_MKMapItemUserRatingSnippetReview;
  v9 = -[_MKMapItemUserRatingSnippetReview init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mapItem, a3);
    objc_storeStrong((id *)&v10->_review, a4);
    v11 = v10;
  }

  return v10;
}

- (double)_score
{
  double result;

  -[GEOMapItemReview _score](self->_review, "_score");
  return result;
}

- (double)_maxScore
{
  double result;

  -[GEOMapItemReview _maxScore](self->_review, "_maxScore");
  return result;
}

- (double)_normalizedScore
{
  double result;

  -[GEOMapItemReview _normalizedScore](self->_review, "_normalizedScore");
  return result;
}

- (NSString)_localizedSnippet
{
  return (NSString *)-[GEOMapItemReview _localizedSnippet](self->_review, "_localizedSnippet");
}

- (NSString)_localizedSnippetLocale
{
  return (NSString *)-[GEOMapItemReview _localizedSnippetLocale](self->_review, "_localizedSnippetLocale");
}

- (NSDate)_date
{
  return (NSDate *)-[GEOMapItemReview _date](self->_review, "_date");
}

- (NSString)_reviewerName
{
  return (NSString *)-[GEOMapItemReview _reviewerName](self->_review, "_reviewerName");
}

- (NSURL)_reviewerImageURL
{
  void *v2;
  void *v3;

  -[GEOMapItemReview _reviewerImageURLString](self->_review, "_reviewerImageURLString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (GEOMapItemReview)_geoReview
{
  return self->_review;
}

- (GEOMapItemTip)_geoMapItemTIp
{
  return 0;
}

- (void)showWithCompletionHandler:(id)a3
{
  void *v4;
  id v5;

  -[MKMapItem _reviewsAttribution](self->_mapItem, "_reviewsAttribution", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "urlsForReview:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    +[MKAppLaunchController launchAttributionURLs:withAttribution:completionHandler:](MKAppLaunchController, "launchAttributionURLs:withAttribution:completionHandler:", v4, v5, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_review, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
