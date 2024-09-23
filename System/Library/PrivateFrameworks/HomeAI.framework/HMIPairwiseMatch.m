@implementation HMIPairwiseMatch

- (HMIPairwiseMatch)initWithFirstIndex:(unint64_t)a3 secondIndex:(unint64_t)a4 score:(float)a5
{
  HMIPairwiseMatch *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMIPairwiseMatch;
  result = -[HMIPairwiseMatch init](&v9, sel_init);
  if (result)
  {
    result->_firstIndex = a3;
    result->_secondIndex = a4;
    result->_score = a5;
  }
  return result;
}

- (unint64_t)firstIndex
{
  return self->_firstIndex;
}

- (unint64_t)secondIndex
{
  return self->_secondIndex;
}

- (float)score
{
  return self->_score;
}

@end
