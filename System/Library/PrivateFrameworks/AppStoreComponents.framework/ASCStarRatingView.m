@implementation ASCStarRatingView

+ (id)greyFill
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.556862745, 0.556862745, 0.57254902, 1.0);
}

- (ASCStarRatingView)initWithMaxNumberOfStars:(int64_t)a3 starSize:(int64_t)a4 andFill:(BOOL)a5
{
  ASCStarRatingView *v7;
  ASCStarRow *v8;
  void *v9;
  double v10;
  uint64_t v11;
  ASCStarRow *filledStarRowView;
  ASCStarRow *v13;
  void *v14;
  uint64_t v15;
  ASCStarRow *hollowStarRowView;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)ASCStarRatingView;
  v7 = -[ASCStarRatingView initWithFrame:](&v18, sel_initWithFrame_, a3, a4, a5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7->_rating = 0.0;
  v7->_maxNumberOfStars = a3;
  v7->_starSize = a4;
  v8 = [ASCStarRow alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (double)a3;
  v11 = -[ASCStarRow initWithStarSize:fill:starColor:andMaxNumberOfStars:](v8, "initWithStarSize:fill:starColor:andMaxNumberOfStars:", a4, 1, v9, (double)a3);
  filledStarRowView = v7->_filledStarRowView;
  v7->_filledStarRowView = (ASCStarRow *)v11;

  v13 = [ASCStarRow alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ASCStarRow initWithStarSize:fill:starColor:andMaxNumberOfStars:](v13, "initWithStarSize:fill:starColor:andMaxNumberOfStars:", a4, 0, v14, v10);
  hollowStarRowView = v7->_hollowStarRowView;
  v7->_hollowStarRowView = (ASCStarRow *)v15;

  -[ASCStarRow setNumberOfStarsInRow:](v7->_filledStarRowView, "setNumberOfStarsInRow:", v7->_rating);
  -[ASCStarRow setNumberOfStarsInRow:](v7->_hollowStarRowView, "setNumberOfStarsInRow:", (double)v7->_maxNumberOfStars);
  -[ASCStarRatingView addSubview:](v7, "addSubview:", v7->_filledStarRowView);
  -[ASCStarRatingView addSubview:](v7, "addSubview:", v7->_hollowStarRowView);
  return v7;
}

- (ASCStarRatingView)initWithFrame:(CGRect)a3
{
  -[ASCStarRatingView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  return 0;
}

- (ASCStarRatingView)initWithCoder:(id)a3
{
  -[ASCStarRatingView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  -[ASCStarRatingView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setRating:(double)a3
{
  double maxNumberOfStars;

  if (self->_rating != a3)
  {
    maxNumberOfStars = 0.0;
    if (a3 >= 0.0)
    {
      maxNumberOfStars = (double)self->_maxNumberOfStars;
      if (maxNumberOfStars >= a3)
        maxNumberOfStars = a3;
    }
    self->_rating = maxNumberOfStars;
    -[ASCStarRow setNumberOfStarsInRow:](self->_filledStarRowView, "setNumberOfStarsInRow:");
  }
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[ASCStarRatingView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[ASCStarRatingView sizeWithStarSize:andNumberOfStars:](self, "sizeWithStarSize:andNumberOfStars:", self->_starSize, self->_maxNumberOfStars, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  JUMeasurements result;

  -[ASCStarRatingView sizeThatFits:](self, "sizeThatFits:", a4, a3.width, a3.height);
  JUMeasurementsMake();
  result.var3 = v7;
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  ASCStarRow *filledStarRowView;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  ASCStarRow *hollowStarRowView;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _OWORD v20[3];
  _OWORD v21[2];
  __int128 v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)ASCStarRatingView;
  -[ASCStarRatingView layoutSubviews](&v23, sel_layoutSubviews);
  -[ASCStarRow frame](self->_hollowStarRowView, "frame");
  v4 = v3;
  -[ASCStarRow frame](self->_hollowStarRowView, "frame");
  v6 = v5;
  -[ASCStarRow frame](self->_filledStarRowView, "frame");
  v8 = v7;
  -[ASCStarRow frame](self->_filledStarRowView, "frame");
  -[ASCStarRow setFrame:](self->_filledStarRowView, "setFrame:", v4, v6, v8);
  filledStarRowView = self->_filledStarRowView;
  v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v21[0] = *MEMORY[0x1E0C9BAA8];
  v18 = v21[0];
  v21[1] = v19;
  v22 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v17 = v22;
  -[ASCStarRow setTransform:](filledStarRowView, "setTransform:", v21);
  -[ASCStarRow frame](self->_hollowStarRowView, "frame");
  v11 = v10;
  -[ASCStarRow frame](self->_hollowStarRowView, "frame");
  v13 = v12;
  -[ASCStarRow frame](self->_filledStarRowView, "frame");
  v15 = v14;
  -[ASCStarRow frame](self->_filledStarRowView, "frame");
  -[ASCStarRow setFrame:](self->_hollowStarRowView, "setFrame:", v11, v13, v15);
  hollowStarRowView = self->_hollowStarRowView;
  v20[0] = v18;
  v20[1] = v19;
  v20[2] = v17;
  -[ASCStarRow setTransform:](hollowStarRowView, "setTransform:", v20);
}

- (CGSize)sizeWithStarSize:(int64_t)a3 andNumberOfStars:(int64_t)a4
{
  double v4;
  double v5;
  CGSize result;

  +[ASCStarRow sizeForStarRowWithSizeOfStar:andNumberOfStars:](ASCStarRow, "sizeForStarRowWithSizeOfStar:andNumberOfStars:", a3, (double)a4);
  result.height = v5;
  result.width = v4;
  return result;
}

- (id)accessibilityLabel
{
  double v2;

  -[ASCStarRatingView rating](self, "rating");
  *(float *)&v2 = v2;
  return ASCAXStarRatingStringForRating(*(float *)&v2);
}

- (double)rating
{
  return self->_rating;
}

- (int64_t)maxNumberOfStars
{
  return self->_maxNumberOfStars;
}

- (int64_t)starSize
{
  return self->_starSize;
}

- (ASCStarRow)hollowStarRowView
{
  return self->_hollowStarRowView;
}

- (ASCStarRow)filledStarRowView
{
  return self->_filledStarRowView;
}

- (UIColor)starColor
{
  return self->_starColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_starColor, 0);
  objc_storeStrong((id *)&self->_filledStarRowView, 0);
  objc_storeStrong((id *)&self->_hollowStarRowView, 0);
}

@end
