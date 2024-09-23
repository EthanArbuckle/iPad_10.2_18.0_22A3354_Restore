@implementation AKMinimalUserInterfaceItem

- (AKMinimalUserInterfaceItem)initWithTag:(int64_t)a3
{
  AKMinimalUserInterfaceItem *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKMinimalUserInterfaceItem;
  result = -[AKMinimalUserInterfaceItem init](&v5, sel_init);
  if (result)
    result->_tag = a3;
  return result;
}

- (int64_t)tag
{
  return self->_tag;
}

@end
