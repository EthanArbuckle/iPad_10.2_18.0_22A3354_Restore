@implementation DMTFetchAutomatedDeviceEnrollmentStateResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMTFetchAutomatedDeviceEnrollmentStateResultObject)initWithCoder:(id)a3
{
  id v4;
  DMTFetchAutomatedDeviceEnrollmentStateResultObject *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DMTFetchAutomatedDeviceEnrollmentStateResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enrollmentState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_enrollmentState = objc_msgSend(v6, "integerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMTFetchAutomatedDeviceEnrollmentStateResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[DMTFetchAutomatedDeviceEnrollmentStateResultObject enrollmentState](self, "enrollmentState", v6.receiver, v6.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("enrollmentState"));

}

- (int64_t)enrollmentState
{
  return self->_enrollmentState;
}

- (void)setEnrollmentState:(int64_t)a3
{
  self->_enrollmentState = a3;
}

@end
