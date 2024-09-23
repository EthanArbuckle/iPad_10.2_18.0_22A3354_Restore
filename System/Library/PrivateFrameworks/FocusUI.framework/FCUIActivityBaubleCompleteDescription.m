@implementation FCUIActivityBaubleCompleteDescription

- (FCUIActivityBaubleCompleteDescription)initWithSystemImageName:(id)a3 tintColor:(id)a4 referencePointSize:(double)a5 maximumPointSize:(double)a6 referenceDimension:(double)a7
{
  FCUIActivityBaubleCompleteDescription *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FCUIActivityBaubleCompleteDescription;
  result = -[FCUIActivityBaubleDescription initWithSystemImageName:tintColor:](&v11, sel_initWithSystemImageName_tintColor_, a3, a4);
  if (result)
  {
    result->_referencePointSize = a5;
    result->_maximumPointSize = a6;
    result->_referenceDimension = a7;
  }
  return result;
}

- (FCUIActivityBaubleCompleteDescription)initWithActivityDescription:(id)a3 referencePointSize:(double)a4 maximumPointSize:(double)a5 referenceDimension:(double)a6
{
  FCUIActivityBaubleCompleteDescription *result;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FCUIActivityBaubleCompleteDescription;
  result = -[FCUIActivityBaubleDescription initWithActivityDescription:](&v10, sel_initWithActivityDescription_, a3);
  if (result)
  {
    result->_referencePointSize = a4;
    result->_maximumPointSize = a5;
    result->_referenceDimension = a6;
  }
  return result;
}

- (double)referencePointSize
{
  return self->_referencePointSize;
}

- (double)maximumPointSize
{
  return self->_maximumPointSize;
}

- (double)referenceDimension
{
  return self->_referenceDimension;
}

@end
