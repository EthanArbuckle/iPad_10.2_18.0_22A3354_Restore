@implementation _GEOPlaceDataReview

- (_GEOPlaceDataReview)initWithPlaceData:(id)a3 review:(id)a4
{
  id v7;
  id v8;
  _GEOPlaceDataReview *v9;
  _GEOPlaceDataReview *v10;
  _GEOPlaceDataReview *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_GEOPlaceDataReview;
  v9 = -[_GEOPlaceDataReview init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_placeData, a3);
    objc_storeStrong((id *)&v10->_review, a4);
    v11 = v10;
  }

  return v10;
}

- (double)_score
{
  double *v2;
  double v3;

  -[GEOPDReview rating]((id *)&self->_review->super.super.isa);
  v2 = (double *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[4];
  else
    v3 = 0.0;

  return v3;
}

- (double)_maxScore
{
  uint64_t v2;
  double v3;

  -[GEOPDReview rating]((id *)&self->_review->super.super.isa);
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = 5.0;
    if ((*(_BYTE *)(v2 + 48) & 1) != 0)
      v3 = *(double *)(v2 + 24);
  }
  else
  {
    v3 = 0.0;
  }

  return v3;
}

- (double)_normalizedScore
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;

  -[GEOPDReview rating]((id *)&self->_review->super.super.isa);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = 0.0;
  v6 = 0.0;
  if (v3)
    v6 = *(double *)(v3 + 32);
  -[GEOPDReview rating]((id *)&self->_review->super.super.isa);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v5 = 5.0;
    if ((*(_BYTE *)(v7 + 48) & 1) != 0)
      v5 = *(double *)(v7 + 24);
  }

  return v6 / v5 * 5.0;
}

- (NSString)_localizedSnippet
{
  return (NSString *)-[GEOPDReview _bestSnippet](self->_review, "_bestSnippet");
}

- (NSString)_localizedSnippetLocale
{
  return (NSString *)-[GEOPDReview _bestSnippetLocale](self->_review, "_bestSnippetLocale");
}

- (NSDate)_date
{
  GEOPDReview *review;
  double reviewTime;

  review = self->_review;
  if (review)
    reviewTime = review->_reviewTime;
  else
    reviewTime = 0.0;
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", reviewTime);
}

- (NSString)_reviewerName
{
  id *v2;
  void *v3;

  -[GEOPDReview reviewer]((id *)&self->_review->super.super.isa);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDUser name](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)_reviewerImageURLString
{
  id *v2;
  void *v3;
  void *v4;

  -[GEOPDReview reviewer]((id *)&self->_review->super.super.isa);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDUser image](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bestURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)_identifier
{
  return -[GEOPDReview reviewId]((id *)&self->_review->super.super.isa);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_review, 0);
  objc_storeStrong((id *)&self->_placeData, 0);
}

@end
