@implementation DIAttributeCustom

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeCustom;
  -[DIAttributeText encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (DIAttributeCustom)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DIAttributeCustom;
  return -[DIAttributeText initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (DIAttributeCustom)init
{
  DIAttributeCustom *v2;
  DIAttributeCustom *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DIAttributeCustom;
  v2 = -[DIAttributeText init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[DIAttribute setAttributeType:](v2, "setAttributeType:", 10);
  return v3;
}

- (id)submissionString
{
  void *v2;
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DIAttributeCustom;
  -[DIAttributeText submissionString](&v6, sel_submissionString);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "isEqualToString:", &stru_24C2D5A40) & 1) != 0)
    v4 = 0;
  else
    v4 = v3;

  return v4;
}

- (void)setCurrentValue:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeCustom;
  -[DIAttributeText setCurrentValue:](&v3, sel_setCurrentValue_, a3);
}

- (void)setDefaultValue:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeCustom;
  -[DIAttributeText setDefaultValue:](&v3, sel_setDefaultValue_, a3);
}

- (void)setIdentifier:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeCustom;
  -[DIAttribute setIdentifier:](&v3, sel_setIdentifier_, a3);
}

- (id)getCurrentValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeCustom;
  -[DIAttributeText getCurrentValue](&v3, sel_getCurrentValue);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)defaultValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeCustom;
  -[DIAttributeText defaultValue](&v3, sel_defaultValue);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
