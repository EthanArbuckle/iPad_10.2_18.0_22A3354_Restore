@implementation ENUITextPosition

+ (id)positionWithLocation:(unint64_t)a3
{
  ENUITextPosition *v4;

  v4 = objc_alloc_init(ENUITextPosition);
  -[ENUITextPosition setLocation:](v4, "setLocation:", a3);
  return v4;
}

- (unint64_t)location
{
  return self->_location;
}

- (void)setLocation:(unint64_t)a3
{
  self->_location = a3;
}

@end
