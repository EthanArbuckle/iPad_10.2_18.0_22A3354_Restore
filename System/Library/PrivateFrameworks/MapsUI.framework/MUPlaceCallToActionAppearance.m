@implementation MUPlaceCallToActionAppearance

- (MUPlaceCallToActionAppearance)initWithType:(int64_t)a3
{
  MUPlaceCallToActionAppearance *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MUPlaceCallToActionAppearance;
  result = -[MUPlaceCallToActionAppearance init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

+ (id)userRecommendedAppearanceForRatingState:(int64_t)a3 numberOfPhotosAdded:(unint64_t)a4
{
  MUPlaceCallToActionAppearance *v6;

  v6 = -[MUPlaceCallToActionAppearance initWithType:]([MUPlaceCallToActionAppearance alloc], "initWithType:", 4);
  -[MKUGCCallToActionViewAppearance setRatingState:](v6, "setRatingState:", a3);
  -[MUPlaceCallToActionAppearance setNumberOfPhotosAdded:](v6, "setNumberOfPhotosAdded:", a4);
  return v6;
}

+ (id)userRecommendedAppearanceForNumberOfPhotosAdded:(unint64_t)a3
{
  MUPlaceCallToActionAppearance *v4;

  v4 = -[MUPlaceCallToActionAppearance initWithType:]([MUPlaceCallToActionAppearance alloc], "initWithType:", 4);
  -[MUPlaceCallToActionAppearance setNumberOfPhotosAdded:](v4, "setNumberOfPhotosAdded:", a3);
  return v4;
}

+ (id)userRecommendedAppearanceForRatingState:(int64_t)a3
{
  MUPlaceCallToActionAppearance *v4;

  v4 = -[MUPlaceCallToActionAppearance initWithType:]([MUPlaceCallToActionAppearance alloc], "initWithType:", 4);
  -[MKUGCCallToActionViewAppearance setRatingState:](v4, "setRatingState:", a3);
  return v4;
}

+ (id)userRecommendedLoadingAppearance
{
  return -[MUPlaceCallToActionAppearance initWithType:]([MUPlaceCallToActionAppearance alloc], "initWithType:", 5);
}

- (BOOL)isEqual:(id)a3
{
  MUPlaceCallToActionAppearance *v4;
  int64_t type;
  MUPlaceCallToActionAppearance *v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  BOOL v14;

  v4 = (MUPlaceCallToActionAppearance *)a3;
  if (v4 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      type = self->_type;
      v6 = v4;
      v7 = -[MUPlaceCallToActionAppearance type](v6, "type");
      v8 = -[MKUGCCallToActionViewAppearance ratingState](self, "ratingState");
      v9 = -[MKUGCCallToActionViewAppearance ratingState](v6, "ratingState");
      v10 = -[MUPlaceCallToActionAppearance numberOfPhotosAdded](self, "numberOfPhotosAdded");
      v11 = -[MUPlaceCallToActionAppearance numberOfPhotosAdded](v6, "numberOfPhotosAdded");

      v14 = type == v7 && v8 == v9 && v10 == v11;
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  int64_t v3;
  unint64_t v4;

  v3 = -[MUPlaceCallToActionAppearance type](self, "type");
  v4 = -[MUPlaceCallToActionAppearance numberOfPhotosAdded](self, "numberOfPhotosAdded") ^ v3;
  return v4 ^ -[MKUGCCallToActionViewAppearance ratingState](self, "ratingState");
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)numberOfPhotosAdded
{
  return self->_numberOfPhotosAdded;
}

- (void)setNumberOfPhotosAdded:(unint64_t)a3
{
  self->_numberOfPhotosAdded = a3;
}

@end
