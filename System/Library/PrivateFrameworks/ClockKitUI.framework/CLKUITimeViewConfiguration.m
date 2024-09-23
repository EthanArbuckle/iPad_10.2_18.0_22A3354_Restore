@implementation CLKUITimeViewConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  CLKUITimeViewConfiguration *v4;
  CLKUITimeViewConfiguration *v5;

  v4 = objc_alloc_init(CLKUITimeViewConfiguration);
  v5 = v4;
  if (v4)
    -[CLKUITimeViewConfiguration setBackgroundStyle:](v4, "setBackgroundStyle:", self->_backgroundStyle);
  return v5;
}

- (CLKUITimeViewConfiguration)initWithCoder:(id)a3
{
  id v4;
  CLKUITimeViewConfiguration *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CLKUITimeViewConfiguration;
  v5 = -[CLKUITimeViewConfiguration init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundStyle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_backgroundStyle = objc_msgSend(v6, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  unint64_t backgroundStyle;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  backgroundStyle = self->_backgroundStyle;
  v5 = a3;
  objc_msgSend(v3, "numberWithUnsignedInteger:", backgroundStyle);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("backgroundStyle"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  self->_backgroundStyle = a3;
}

@end
