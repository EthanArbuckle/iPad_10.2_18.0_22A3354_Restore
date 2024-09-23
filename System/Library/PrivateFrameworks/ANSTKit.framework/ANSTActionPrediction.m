@implementation ANSTActionPrediction

- (ANSTActionPrediction)initWithAction:(unint64_t)a3
{
  ANSTActionPrediction *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ANSTActionPrediction;
  result = -[ANSTActionPrediction init](&v5, sel_init);
  if (result)
  {
    result->_action = a3;
    result->_confidence = 0.0;
  }
  return result;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  ANSTActionToNSString(self->_action);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("(%@, %f)"), v4, self->_confidence);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)action
{
  return self->_action;
}

- (float)confidence
{
  return self->_confidence;
}

@end
