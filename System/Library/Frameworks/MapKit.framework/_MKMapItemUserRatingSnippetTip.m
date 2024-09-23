@implementation _MKMapItemUserRatingSnippetTip

- (_MKMapItemUserRatingSnippetTip)initWithMapItem:(id)a3 review:(id)a4
{
  id v7;
  id v8;
  _MKMapItemUserRatingSnippetTip *v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_MKMapItemUserRatingSnippetTip;
  -[_MKMapItemUserRatingSnippetTip self](&v11, sel_self);
  v9 = (_MKMapItemUserRatingSnippetTip *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_storeStrong((id *)&v9->_mapItem, a3);
    objc_storeStrong((id *)&v9->_tip, a4);
  }

  return v9;
}

- (double)_normalizedScore
{
  return 0.0;
}

- (double)_maxScore
{
  return 0.0;
}

- (double)_score
{
  return 0.0;
}

- (GEOMapItemReview)_geoReview
{
  return 0;
}

- (NSString)_reviewerName
{
  return (NSString *)-[GEOMapItemTip name](self->_tip, "name");
}

- (NSString)_localizedSnippet
{
  return (NSString *)-[GEOMapItemTip localizedSnippet](self->_tip, "localizedSnippet");
}

- (NSString)_localizedSnippetLocale
{
  return 0;
}

- (NSURL)_reviewerImageURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E98];
  -[GEOMapItemTip bestImageURL](self->_tip, "bestImageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (GEOMapItemTip)_geoMapItemTIp
{
  return self->_tip;
}

- (NSDate)_date
{
  void *tip;
  double v4;
  void *v5;

  tip = self->_tip;
  if (tip)
  {
    objc_msgSend(tip, "tipTime");
    if (v4 <= 0.0)
    {
      tip = 0;
    }
    else
    {
      v5 = (void *)MEMORY[0x1E0C99D68];
      -[GEOMapItemTip tipTime](self->_tip, "tipTime");
      objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
      tip = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return (NSDate *)tip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tip, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
