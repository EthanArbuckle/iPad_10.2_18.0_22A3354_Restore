@implementation DMFSetInterfaceOrientationRequest

- (DMFSetInterfaceOrientationRequest)init
{
  DMFSetInterfaceOrientationRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DMFSetInterfaceOrientationRequest;
  result = -[CATTaskRequest init](&v3, sel_init);
  if (result)
    result->_interfaceOrientation = 0;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFSetInterfaceOrientationRequest)initWithCoder:(id)a3
{
  id v4;
  DMFSetInterfaceOrientationRequest *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFSetInterfaceOrientationRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lockOrientation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_lockOrientation = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interfaceOrientation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_interfaceOrientation = objc_msgSend(v7, "integerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DMFSetInterfaceOrientationRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFSetInterfaceOrientationRequest lockOrientation](self, "lockOrientation", v7.receiver, v7.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("lockOrientation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFSetInterfaceOrientationRequest interfaceOrientation](self, "interfaceOrientation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("interfaceOrientation"));

}

- (BOOL)lockOrientation
{
  return self->_lockOrientation;
}

- (void)setLockOrientation:(BOOL)a3
{
  self->_lockOrientation = a3;
}

- (unint64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(unint64_t)a3
{
  self->_interfaceOrientation = a3;
}

@end
