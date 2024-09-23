@implementation _HKHorizontalSingleLineSeriesMarkEntry

- (_HKHorizontalSingleLineSeriesMarkEntry)initWithXCoord:(double)a3 markStyle:(int64_t)a4
{
  _HKHorizontalSingleLineSeriesMarkEntry *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_HKHorizontalSingleLineSeriesMarkEntry;
  result = -[_HKHorizontalSingleLineSeriesMarkEntry init](&v7, sel_init);
  if (result)
  {
    result->_xCoord = a3;
    result->_markStyle = a4;
  }
  return result;
}

- (double)xCoord
{
  return self->_xCoord;
}

- (int64_t)markStyle
{
  return self->_markStyle;
}

@end
