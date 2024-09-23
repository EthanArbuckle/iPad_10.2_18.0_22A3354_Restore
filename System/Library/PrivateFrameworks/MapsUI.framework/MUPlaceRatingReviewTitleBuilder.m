@implementation MUPlaceRatingReviewTitleBuilder

- (unint64_t)titleType
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v7;
  unint64_t v8;
  unint64_t v9;

  v3 = -[MUPlaceRatingReviewTitleBuilder supportsRatings](self, "supportsRatings");
  v4 = -[MUPlaceRatingReviewTitleBuilder supportsReviews](self, "supportsReviews");
  v5 = v4;
  if (v3)
  {
    if (v4 && -[MUPlaceRatingReviewTitleBuilder supportsGuides](self, "supportsGuides"))
    {
      return 4;
    }
    else if (-[MUPlaceRatingReviewTitleBuilder supportsReviews](self, "supportsReviews"))
    {
      return 2;
    }
    else if (-[MUPlaceRatingReviewTitleBuilder supportsGuides](self, "supportsGuides"))
    {
      return 3;
    }
    else
    {
      return 1;
    }
  }
  else
  {
    v7 = -[MUPlaceRatingReviewTitleBuilder supportsGuides](self, "supportsGuides");
    v8 = 7;
    if (!v7)
      v8 = 0;
    v9 = 5;
    if (v7)
      v9 = 6;
    if (v5)
      return v9;
    else
      return v8;
  }
}

- (id)buildTitleString
{
  unint64_t v3;
  __CFString *v4;

  if (-[MUPlaceRatingReviewTitleBuilder titleType](self, "titleType")
    && (v3 = -[MUPlaceRatingReviewTitleBuilder titleType](self, "titleType") - 1, v3 <= 6))
  {
    _MULocalizedStringFromThisBundle(off_1E2E02318[v3]);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E2E05448;
  }
  return v4;
}

- (BOOL)supportsRatings
{
  return self->_supportsRatings;
}

- (void)setSupportsRatings:(BOOL)a3
{
  self->_supportsRatings = a3;
}

- (BOOL)supportsReviews
{
  return self->_supportsReviews;
}

- (void)setSupportsReviews:(BOOL)a3
{
  self->_supportsReviews = a3;
}

- (BOOL)supportsGuides
{
  return self->_supportsGuides;
}

- (void)setSupportsGuides:(BOOL)a3
{
  self->_supportsGuides = a3;
}

@end
