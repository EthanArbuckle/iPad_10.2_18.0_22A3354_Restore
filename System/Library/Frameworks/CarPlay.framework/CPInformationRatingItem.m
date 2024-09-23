@implementation CPInformationRatingItem

- (CPInformationRatingItem)initWithRating:(NSNumber *)rating maximumRating:(NSNumber *)maximumRating title:(NSString *)title detail:(NSString *)detail
{
  NSNumber *v10;
  NSNumber *v11;
  CPInformationRatingItem *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  objc_super v20;

  v10 = rating;
  v11 = maximumRating;
  v20.receiver = self;
  v20.super_class = (Class)CPInformationRatingItem;
  v12 = -[CPInformationItem initWithTitle:detail:](&v20, sel_initWithTitle_detail_, title, detail);
  if (v12)
  {
    if (v10)
    {
      v14 = (void *)-[NSNumber copy](v10, "copy");
    }
    else
    {
      LODWORD(v13) = 0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;
    objc_storeStrong((id *)&v12->_rating, v14);

    if (v11)
    {
      v17 = (void *)-[NSNumber copy](v11, "copy");
    }
    else
    {
      LODWORD(v16) = 5.0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;
    objc_storeStrong((id *)&v12->_maximumRating, v17);

    -[CPInformationRatingItem _santizeRatingItem](v12, "_santizeRatingItem");
  }

  return v12;
}

- (CPInformationRatingItem)initWithTitle:(id)a3 detail:(id)a4
{
  return -[CPInformationRatingItem initWithRating:maximumRating:title:detail:](self, "initWithRating:maximumRating:title:detail:", 0, 0, a3, a4);
}

- (void)_santizeRatingItem
{
  float v3;
  double v4;
  float v5;
  double v6;
  NSNumber *v7;
  NSNumber *rating;
  double v9;
  NSNumber *v10;
  NSNumber *maximumRating;

  -[NSNumber floatValue](self->_maximumRating, "floatValue");
  v4 = fmax(fmin(roundf(v3), 5.0), 1.0);
  -[NSNumber floatValue](self->_rating, "floatValue");
  v6 = fmax(fmin(round(v5 + v5) * 0.5, v4), 0.0);
  *(float *)&v6 = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  rating = self->_rating;
  self->_rating = v7;

  *(float *)&v9 = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
  v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  maximumRating = self->_maximumRating;
  self->_maximumRating = v10;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPInformationRatingItem)initWithCoder:(id)a3
{
  id v4;
  CPInformationRatingItem *v5;
  uint64_t v6;
  NSNumber *rating;
  uint64_t v8;
  NSNumber *maximumRating;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPInformationRatingItem;
  v5 = -[CPInformationItem initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPInformationRatingItemRatingKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    rating = v5->_rating;
    v5->_rating = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPInformationRatingItemMaximumRatingKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    maximumRating = v5->_maximumRating;
    v5->_maximumRating = (NSNumber *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPInformationRatingItem;
  v4 = a3;
  -[CPInformationItem encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CPInformationRatingItem rating](self, "rating", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCPInformationRatingItemRatingKey"));

  -[CPInformationRatingItem maximumRating](self, "maximumRating");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCPInformationRatingItemMaximumRatingKey"));

}

- (NSNumber)rating
{
  return self->_rating;
}

- (NSNumber)maximumRating
{
  return self->_maximumRating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumRating, 0);
  objc_storeStrong((id *)&self->_rating, 0);
}

@end
