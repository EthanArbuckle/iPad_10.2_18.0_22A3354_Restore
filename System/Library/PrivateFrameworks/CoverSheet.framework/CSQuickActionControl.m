@implementation CSQuickActionControl

- (CSQuickActionControl)initWithCategory:(int64_t)a3 position:(int64_t)a4
{
  CSQuickActionControl *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSQuickActionControl;
  result = -[CSQuickActionControl init](&v7, sel_init);
  if (result)
  {
    result->_category = a3;
    result->_position = a4;
  }
  return result;
}

- (NSString)title
{
  unint64_t category;

  category = self->_category;
  if (category > 2)
    return (NSString *)CFSTR("Undefined Quick Action");
  else
    return &off_1E8E300E8[category]->isa;
}

- (int64_t)category
{
  return self->_category;
}

- (int64_t)position
{
  return self->_position;
}

@end
