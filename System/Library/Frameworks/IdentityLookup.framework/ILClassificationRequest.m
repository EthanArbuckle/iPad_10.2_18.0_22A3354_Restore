@implementation ILClassificationRequest

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@ %p>"), objc_opt_class(), self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ILClassificationRequest)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ILClassificationRequest;
  return -[ILClassificationRequest init](&v4, sel_init, a3);
}

@end
