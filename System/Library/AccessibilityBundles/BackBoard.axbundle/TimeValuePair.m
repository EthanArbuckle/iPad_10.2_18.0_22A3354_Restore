@implementation TimeValuePair

- (double)fireTime
{
  return self->fireTime;
}

- (void)setFireTime:(double)a3
{
  self->fireTime = a3;
}

- (id)value
{
  return self->value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->value, 0);
}

@end
