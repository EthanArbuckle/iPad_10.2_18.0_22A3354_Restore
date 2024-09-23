@implementation CMISmartStyleConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  CMISmartStyleConfiguration *v4;
  CMISmartStyleConfiguration *v5;

  v4 = -[CMISmartStyleConfiguration init](+[CMISmartStyleConfiguration allocWithZone:](CMISmartStyleConfiguration, "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    -[CMISmartStyleConfiguration setLearningRateFramesPerSecond:](v4, "setLearningRateFramesPerSecond:", self->_learningRateFramesPerSecond);
    -[CMISmartStyleConfiguration setLearningRateMaxFramesPerSecond:](v5, "setLearningRateMaxFramesPerSecond:", self->_learningRateMaxFramesPerSecond);
  }
  return v5;
}

- (unint64_t)learningRateFramesPerSecond
{
  return self->_learningRateFramesPerSecond;
}

- (void)setLearningRateFramesPerSecond:(unint64_t)a3
{
  self->_learningRateFramesPerSecond = a3;
}

- (unint64_t)learningRateMaxFramesPerSecond
{
  return self->_learningRateMaxFramesPerSecond;
}

- (void)setLearningRateMaxFramesPerSecond:(unint64_t)a3
{
  self->_learningRateMaxFramesPerSecond = a3;
}

@end
