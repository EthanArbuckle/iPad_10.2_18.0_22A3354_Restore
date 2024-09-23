@implementation CNCDAllContainersPredicate

- (CNCDAllContainersPredicate)initWithIncludeDisabledContainers:(BOOL)a3
{
  CNCDAllContainersPredicate *v4;
  CNCDAllContainersPredicate *v5;
  CNCDAllContainersPredicate *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNCDAllContainersPredicate;
  v4 = -[CNPredicate initWithPredicate:](&v8, sel_initWithPredicate_, 0);
  v5 = v4;
  if (v4)
  {
    v4->_includeDisabledContainers = a3;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNCDAllContainersPredicate)initWithCoder:(id)a3
{
  id v4;
  CNCDAllContainersPredicate *v5;
  CNCDAllContainersPredicate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNCDAllContainersPredicate;
  v5 = -[CNPredicate initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_includeDisabledContainers = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_includeDisabledContainers"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNCDAllContainersPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_includeDisabledContainers, CFSTR("_includeDisabledContainers"), v5.receiver, v5.super_class);

}

- (id)cn_topLevelFilter
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
}

- (id)cn_persistenceFilterRequest
{
  return 0;
}

- (BOOL)includeDisabledContainers
{
  return self->_includeDisabledContainers;
}

- (void)setIncludeDisabledContainers:(BOOL)a3
{
  self->_includeDisabledContainers = a3;
}

@end
