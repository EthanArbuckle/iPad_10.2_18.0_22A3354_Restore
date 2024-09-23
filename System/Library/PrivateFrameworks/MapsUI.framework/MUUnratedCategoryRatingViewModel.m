@implementation MUUnratedCategoryRatingViewModel

- (MUUnratedCategoryRatingViewModel)initWithCategoryTitle:(id)a3 clientCountAdjustment:(int64_t)a4
{
  id v6;
  MUUnratedCategoryRatingViewModel *v7;
  uint64_t v8;
  NSString *categoryTitle;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MUUnratedCategoryRatingViewModel;
  v7 = -[MUUnratedCategoryRatingViewModel init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    categoryTitle = v7->_categoryTitle;
    v7->_categoryTitle = (NSString *)v8;

    v7->_countAdjustment = a4;
  }

  return v7;
}

- (unint64_t)displayPercentage
{
  return 0;
}

- (double)score
{
  return 0.0;
}

- (double)maxScore
{
  return 0.0;
}

- (unint64_t)numberOfRatingsUsedForScore
{
  return self->_countAdjustment & ~(self->_countAdjustment >> 63);
}

- (BOOL)hasSubtitle
{
  return 1;
}

- (BOOL)hasPercentage
{
  return 0;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_categoryTitle, "hash");
}

- (BOOL)isEqual:(id)a3
{
  MUUnratedCategoryRatingViewModel *v4;
  MUUnratedCategoryRatingViewModel *v5;
  MUUnratedCategoryRatingViewModel *v6;
  NSString *categoryTitle;
  NSString *v8;
  BOOL v9;

  v4 = (MUUnratedCategoryRatingViewModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    categoryTitle = self->_categoryTitle;
    -[MUUnratedCategoryRatingViewModel categoryTitle](v6, "categoryTitle");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = (categoryTitle == v8 || -[NSString isEqual:](categoryTitle, "isEqual:", v8))
      && self->_countAdjustment == v6->_countAdjustment;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)categoryTitle
{
  return self->_categoryTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryTitle, 0);
}

@end
