@implementation AKRatchetStateData

- (AKRatchetStateData)initWithDuration:(double)a3
{
  AKRatchetStateData *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKRatchetStateData;
  result = -[AKRatchetStateData init](&v5, sel_init);
  if (result)
    result->_duration = a3;
  return result;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

@end
