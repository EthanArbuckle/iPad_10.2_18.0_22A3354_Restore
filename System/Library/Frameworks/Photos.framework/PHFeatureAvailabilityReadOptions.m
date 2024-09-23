@implementation PHFeatureAvailabilityReadOptions

- (PHFeatureAvailabilityReadOptions)init
{
  PHFeatureAvailabilityReadOptions *v2;
  PHFeatureAvailabilityReadOptions *v3;
  PHFeatureAvailabilityReadOptions *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHFeatureAvailabilityReadOptions;
  v2 = -[PHFeatureAvailabilityReadOptions init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_useJustInTimeGraphAvailability = 1;
    v4 = v2;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setUseJustInTimeGraphAvailability:", -[PHFeatureAvailabilityReadOptions useJustInTimeGraphAvailability](self, "useJustInTimeGraphAvailability"));
  return v4;
}

- (BOOL)useJustInTimeGraphAvailability
{
  return self->_useJustInTimeGraphAvailability;
}

- (void)setUseJustInTimeGraphAvailability:(BOOL)a3
{
  self->_useJustInTimeGraphAvailability = a3;
}

@end
