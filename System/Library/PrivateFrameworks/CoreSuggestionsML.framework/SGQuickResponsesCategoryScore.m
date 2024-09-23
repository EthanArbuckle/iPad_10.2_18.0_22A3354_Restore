@implementation SGQuickResponsesCategoryScore

- (SGQuickResponsesCategoryScore)init
{
  SGQuickResponsesCategoryScore *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SGQuickResponsesCategoryScore;
  result = -[SGQuickResponsesCategoryScore init](&v3, sel_init);
  if (result)
  {
    result->_modelCount = 0;
    result->_average = 0.0;
    result->_maximum = 0.0;
  }
  return result;
}

- (void)addScore:(double)a3
{
  unint64_t v5;
  double maximum;
  void *v8;

  if (a3 < 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesRanking.m"), 335, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("score >= 0"));

  }
  v5 = self->_modelCount + 1;
  self->_modelCount = v5;
  maximum = self->_maximum;
  if (maximum <= a3)
    maximum = a3;
  self->_average = self->_average + (a3 - self->_average) / (double)v5;
  self->_maximum = maximum;
}

- (double)average
{
  return self->_average;
}

- (double)maximum
{
  return self->_maximum;
}

@end
