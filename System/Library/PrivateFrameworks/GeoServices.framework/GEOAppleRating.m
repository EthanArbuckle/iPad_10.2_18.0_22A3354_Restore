@implementation GEOAppleRating

- (GEOAppleRating)initWithRating:(id)a3
{
  id v5;
  void *v6;
  GEOAppleRating *v7;
  GEOAppleRating *v8;
  GEOAppleRating *v9;
  objc_super v11;
  uint8_t buf[16];

  v5 = a3;
  v6 = v5;
  if (v5 && (*((_BYTE *)v5 + 48) & 8) != 0 && *((_DWORD *)v5 + 11) == 4)
  {
    v11.receiver = self;
    v11.super_class = (Class)GEOAppleRating;
    v8 = -[GEOAppleRating init](&v11, sel_init);
    v9 = v8;
    if (v8)
      objc_storeStrong((id *)&v8->_pdRating, a3);
    self = v9;
    v7 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: rating.ratingType == GEOPDRating_RatingType_APPLE_RATING", buf, 2u);
    }
    v7 = 0;
  }

  return v7;
}

- (double)percentage
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[GEOAppleRating maxScore](self, "maxScore");
  if (v3 == 0.0)
    return 0.0;
  -[GEOAppleRating score](self, "score");
  v5 = v4;
  -[GEOAppleRating maxScore](self, "maxScore");
  return v5 / v6;
}

- (double)score
{
  GEOPDRating *pdRating;

  pdRating = self->_pdRating;
  if (pdRating)
    return pdRating->_score;
  else
    return 0.0;
}

- (double)maxScore
{
  GEOPDRating *pdRating;
  double result;

  pdRating = self->_pdRating;
  if (!pdRating)
    return 0.0;
  result = 5.0;
  if ((*(_BYTE *)&pdRating->_flags & 1) != 0)
    return pdRating->_maxScore;
  return result;
}

- (int)numberOfRatingsUsedForScore
{
  GEOPDRating *pdRating;

  pdRating = self->_pdRating;
  if (pdRating)
    return pdRating->_numRatingsUsedForScore;
  else
    return 0;
}

- (NSString)localizedTitle
{
  return (NSString *)-[GEOPDRating displayTitle](self->_pdRating, "displayTitle");
}

- (int64_t)ratingType
{
  void *v2;
  int64_t v3;

  -[GEOPDRating displayTitle](self->_pdRating, "displayTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)isRecommended
{
  double v2;

  -[GEOAppleRating percentage](self, "percentage");
  return v2 > 0.5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdRating, 0);
}

@end
