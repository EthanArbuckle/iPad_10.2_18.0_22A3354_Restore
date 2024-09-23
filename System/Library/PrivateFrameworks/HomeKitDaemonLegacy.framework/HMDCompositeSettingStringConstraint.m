@implementation HMDCompositeSettingStringConstraint

- (BOOL)isValidValue:(id)a3 error:(id *)a4
{
  return 1;
}

- (HMDCompositeSettingStringConstraint)initWithValidValues:(id)a3
{
  id v4;
  HMDCompositeSettingStringConstraint *v5;
  uint64_t v6;
  NSSet *validValues;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCompositeSettingStringConstraint;
  v5 = -[HMDCompositeSettingStringConstraint init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    validValues = v5->_validValues;
    v5->_validValues = (NSSet *)v6;

  }
  return v5;
}

- (NSSet)validValues
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setValidValues:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validValues, 0);
}

@end
