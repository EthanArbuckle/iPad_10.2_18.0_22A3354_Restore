@implementation GKLimitedPresentationContext

- (GKLimitedPresentationContext)initWithScope:(int64_t)a3 elementType:(int64_t)a4
{
  GKLimitedPresentationContext *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKLimitedPresentationContext;
  result = -[GKLimitedPresentationContext init](&v7, sel_init);
  if (result)
  {
    result->_scope = a3;
    result->_elementType = a4;
  }
  return result;
}

- (int64_t)scope
{
  return self->_scope;
}

- (void)setScope:(int64_t)a3
{
  self->_scope = a3;
}

- (int64_t)elementType
{
  return self->_elementType;
}

- (void)setElementType:(int64_t)a3
{
  self->_elementType = a3;
}

@end
