@implementation MUUGCRatingViewModel

- (MUUGCRatingViewModel)initWithCategory:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  MUUGCRatingViewModel *v9;
  MUUGCRatingViewModel *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MUUGCRatingViewModel;
  v9 = -[MUUGCRatingViewModel init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_category, a3);
    objc_storeStrong((id *)&v10->_value, a4);
  }

  return v10;
}

- (NSString)category
{
  return self->_category;
}

- (NSNumber)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end
