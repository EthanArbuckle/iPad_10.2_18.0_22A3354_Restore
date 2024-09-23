@implementation ACActivityPresentationDestination

- (ACActivityPresentationDestination)initWithDestination:(int64_t)a3
{
  ACActivityPresentationDestination *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ACActivityPresentationDestination;
  result = -[ACActivityPresentationDestination init](&v5, sel_init);
  if (result)
    result->_destination = a3;
  return result;
}

- (int64_t)destination
{
  return self->_destination;
}

@end
