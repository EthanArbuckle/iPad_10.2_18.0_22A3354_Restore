@implementation SGQuickResponsesClassScore

- (SGQuickResponsesClassScore)initWithValue:(double)a3 index:(unint64_t)a4
{
  SGQuickResponsesClassScore *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SGQuickResponsesClassScore;
  result = -[SGQuickResponsesClassScore init](&v7, sel_init);
  if (result)
  {
    result->_value = a3;
    result->_index = a4;
  }
  return result;
}

- (int64_t)compare:(id)a3
{
  double v4;
  double value;
  int64_t v6;

  objc_msgSend(a3, "value");
  value = self->_value;
  v6 = -1;
  if (value >= v4)
    v6 = 1;
  if (value == v4)
    return 0;
  else
    return v6;
}

- (double)value
{
  return self->_value;
}

- (unint64_t)index
{
  return self->_index;
}

@end
