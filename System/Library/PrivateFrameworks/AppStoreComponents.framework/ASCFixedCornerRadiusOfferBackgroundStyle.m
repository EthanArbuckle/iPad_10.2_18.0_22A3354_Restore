@implementation ASCFixedCornerRadiusOfferBackgroundStyle

- (ASCFixedCornerRadiusOfferBackgroundStyle)initWithCornerRadius:(double)a3
{
  ASCFixedCornerRadiusOfferBackgroundStyle *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASCFixedCornerRadiusOfferBackgroundStyle;
  result = -[ASCOfferBackgroundStyle _init](&v5, sel__init);
  if (result)
    result->_cornerRadius = a3;
  return result;
}

- (unint64_t)hash
{
  ASCHasher *v3;
  unint64_t v4;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCFixedCornerRadiusOfferBackgroundStyle cornerRadius](self, "cornerRadius");
  -[ASCHasher combineDouble:](v3, "combineDouble:");
  v4 = -[ASCHasher finalizeHash](v3, "finalizeHash");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
  {
    -[ASCFixedCornerRadiusOfferBackgroundStyle cornerRadius](self, "cornerRadius");
    v9 = v8;
    objc_msgSend(v7, "cornerRadius");
    v11 = v9 == v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

@end
