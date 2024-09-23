@implementation CCUIControlCenterPositionProviderPackingRule

- (CCUILayoutSize)sizeLimit
{
  unint64_t height;
  unint64_t width;
  CCUILayoutSize result;

  height = self->_sizeLimit.height;
  width = self->_sizeLimit.width;
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)packingOrder
{
  return self->_packingOrder;
}

- (unint64_t)packFrom
{
  return self->_packFrom;
}

- (CCUIControlCenterPositionProviderPackingRule)initWithPackFrom:(unint64_t)a3 packingOrder:(unint64_t)a4 sizeLimit:(CCUILayoutSize)a5
{
  unint64_t height;
  unint64_t width;
  CCUIControlCenterPositionProviderPackingRule *result;
  objc_super v10;

  height = a5.height;
  width = a5.width;
  v10.receiver = self;
  v10.super_class = (Class)CCUIControlCenterPositionProviderPackingRule;
  result = -[CCUIControlCenterPositionProviderPackingRule init](&v10, sel_init);
  if (result)
  {
    result->_packFrom = a3;
    result->_packingOrder = a4;
    result->_sizeLimit.width = width;
    result->_sizeLimit.height = height;
  }
  return result;
}

@end
