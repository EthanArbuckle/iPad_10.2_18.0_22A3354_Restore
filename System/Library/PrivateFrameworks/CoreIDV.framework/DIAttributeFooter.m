@implementation DIAttributeFooter

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeFooter;
  -[DIAttributeLabel encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (DIAttributeFooter)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DIAttributeFooter;
  return -[DIAttributeLabel initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (DIAttributeFooter)init
{
  DIAttributeFooter *v2;
  DIAttributeFooter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DIAttributeFooter;
  v2 = -[DIAttributeLabel init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[DIAttribute setAttributeType:](v2, "setAttributeType:", 7);
  return v3;
}

- (void)setDefaultValue:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeFooter;
  -[DIAttributeLabel setDefaultValue:](&v3, sel_setDefaultValue_, a3);
}

- (id)defaultValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeFooter;
  -[DIAttributeLabel defaultValue](&v3, sel_defaultValue);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIAttributeFooter defaultValue](self, "defaultValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("defaultValue: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

@end
