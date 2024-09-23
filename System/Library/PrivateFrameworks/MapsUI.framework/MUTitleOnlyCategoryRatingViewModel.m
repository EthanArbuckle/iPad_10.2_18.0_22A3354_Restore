@implementation MUTitleOnlyCategoryRatingViewModel

- (MUTitleOnlyCategoryRatingViewModel)initWithCategoryTitle:(id)a3
{
  id v4;
  MUTitleOnlyCategoryRatingViewModel *v5;
  uint64_t v6;
  NSString *categoryTitle;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUTitleOnlyCategoryRatingViewModel;
  v5 = -[MUTitleOnlyCategoryRatingViewModel init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    categoryTitle = v5->_categoryTitle;
    v5->_categoryTitle = (NSString *)v6;

  }
  return v5;
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
  return 0;
}

- (BOOL)hasSubtitle
{
  return 0;
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
  MUTitleOnlyCategoryRatingViewModel *v4;
  MUTitleOnlyCategoryRatingViewModel *v5;
  NSString *categoryTitle;
  NSString *v7;
  char v8;

  v4 = (MUTitleOnlyCategoryRatingViewModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    categoryTitle = self->_categoryTitle;
    -[MUTitleOnlyCategoryRatingViewModel categoryTitle](v5, "categoryTitle");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (categoryTitle == v7)
      v8 = 1;
    else
      v8 = -[NSString isEqual:](categoryTitle, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
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
