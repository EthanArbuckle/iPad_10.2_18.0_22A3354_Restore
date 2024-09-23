@implementation CTBootstrapState

- (id)description
{
  void *v3;
  unsigned int v4;
  const char *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTBootstrapState bootstrapStatus](self, "bootstrapStatus");
  if (v4 > 2)
    v5 = "??";
  else
    v5 = off_1E152E5A8[v4];
  objc_msgSend(v3, "appendFormat:", CFSTR(", bootstrapStatus=%s"), v5);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setBootstrapStatus:", -[CTBootstrapState bootstrapStatus](self, "bootstrapStatus"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTBootstrapState bootstrapStatus](self, "bootstrapStatus"), CFSTR("bootsrtap_state"));

}

- (CTBootstrapState)initWithCoder:(id)a3
{
  id v4;
  CTBootstrapState *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTBootstrapState;
  v5 = -[CTBootstrapState init](&v7, sel_init);
  if (v5)
    v5->_bootstrapStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bootsrtap_state"));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int)bootstrapStatus
{
  return self->_bootstrapStatus;
}

- (void)setBootstrapStatus:(int)a3
{
  self->_bootstrapStatus = a3;
}

@end
