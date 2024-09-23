@implementation SNClassification

- (NSString)identifier
{
  return (NSString *)MEMORY[0x1E0DE7D20](self->_impl, sel_identifier);
}

- (double)confidence
{
  double result;

  MEMORY[0x1E0DE7D20](self->_impl, sel_confidence);
  return result;
}

- (SNClassification)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("-init is not a valid initializer for the class SNClassification"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (SNClassification)new
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("+new is not a valid class method for the class SNClassification"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (SNClassification)initWithIdentifier:(id)a3 confidence:(double)a4
{
  id v6;
  SNClassification *v7;
  _SNClassification *v8;
  _SNClassification *impl;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SNClassification;
  v7 = -[SNClassification init](&v11, sel_init);
  if (v7)
  {
    v8 = -[_SNClassification initWithIdentifier:confidence:]([_SNClassification alloc], "initWithIdentifier:confidence:", v6, a4);
    impl = v7->_impl;
    v7->_impl = v8;

    if (!v7->_impl)
    {

      v7 = 0;
    }
  }

  return v7;
}

- (SNClassification)initWithImpl:(id)a3
{
  id v5;
  SNClassification *v6;
  SNClassification *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNClassification;
  v6 = -[SNClassification init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_impl, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[_SNClassification copyWithZone:](self->_impl, "copyWithZone:", a3);
  v7 = (void *)objc_msgSend(v5, "initWithImpl:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  SNClassification *v4;
  SNClassification *v5;
  BOOL v6;

  v4 = (SNClassification *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[_SNClassification isEqual:](self->_impl, "isEqual:", v5->_impl);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  return MEMORY[0x1E0DE7D20](self->_impl, sel_hash);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SNClassification)initWithCoder:(id)a3
{
  id v4;
  SNClassification *v5;
  SNClassification *v6;
  _SNClassification *v7;
  _SNClassification *impl;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SNClassification;
  v5 = -[SNClassification init](&v10, sel_init);
  v6 = v5;
  if (!v4
    || v5
    && (v7 = -[_SNClassification initWithCoder:]([_SNClassification alloc], "initWithCoder:", v4),
        impl = v6->_impl,
        v6->_impl = v7,
        impl,
        !v6->_impl))
  {

    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  if (a3)
    MEMORY[0x1E0DE7D20](self->_impl, sel_encodeWithCoder_);
}

- (id)description
{
  return (id)MEMORY[0x1E0DE7D20](self->_impl, sel_description);
}

- (id)impl
{
  return self->_impl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
