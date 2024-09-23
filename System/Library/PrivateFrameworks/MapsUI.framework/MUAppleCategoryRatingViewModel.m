@implementation MUAppleCategoryRatingViewModel

- (MUAppleCategoryRatingViewModel)initWithAppleRating:(id)a3 clientCountAdjustment:(int64_t)a4
{
  id v7;
  MUAppleCategoryRatingViewModel *v8;
  MUAppleCategoryRatingViewModel *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MUAppleCategoryRatingViewModel;
  v8 = -[MUAppleCategoryRatingViewModel init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_appleRating, a3);
    v9->_countAdjustment = a4;
  }

  return v9;
}

- (NSString)categoryTitle
{
  return -[GEOAppleRating categoryTitle](self->_appleRating, "categoryTitle");
}

- (unint64_t)displayPercentage
{
  return -[GEOAppleRating displayPercentage](self->_appleRating, "displayPercentage");
}

- (double)score
{
  double result;

  -[GEOAppleRating score](self->_appleRating, "score");
  return result;
}

- (double)maxScore
{
  double result;

  -[GEOAppleRating maxScore](self->_appleRating, "maxScore");
  return result;
}

- (unint64_t)numberOfRatingsUsedForScore
{
  int v3;

  v3 = -[GEOAppleRating numberOfRatingsUsedForScore](self->_appleRating, "numberOfRatingsUsedForScore");
  return (self->_countAdjustment + v3) & ~((self->_countAdjustment + v3) >> 63);
}

- (BOOL)hasSubtitle
{
  return 1;
}

- (BOOL)hasPercentage
{
  return -[GEOAppleRating hasPercentage](self->_appleRating, "hasPercentage");
}

- (unint64_t)hash
{
  return -[GEOAppleRating hash](self->_appleRating, "hash");
}

- (BOOL)isEqual:(id)a3
{
  MUAppleCategoryRatingViewModel *v4;
  MUAppleCategoryRatingViewModel *v5;
  MUAppleCategoryRatingViewModel *v6;
  GEOAppleRating *appleRating;
  BOOL v8;

  v4 = (MUAppleCategoryRatingViewModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    appleRating = self->_appleRating;
    v8 = (appleRating == v6->_appleRating || -[GEOAppleRating isEqual:](appleRating, "isEqual:"))
      && self->_countAdjustment == v6->_countAdjustment;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleRating, 0);
}

@end
