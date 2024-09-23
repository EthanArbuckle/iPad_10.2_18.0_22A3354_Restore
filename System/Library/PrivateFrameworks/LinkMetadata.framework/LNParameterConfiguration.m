@implementation LNParameterConfiguration

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[LNParameterConfiguration forcesNeedsValue](self, "forcesNeedsValue"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[LNParameterConfiguration isSecure](self, "isSecure"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, forcesNeedsValue: %@, secure: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  LNParameterConfiguration *v4;

  v4 = objc_alloc_init(LNParameterConfiguration);
  -[LNParameterConfiguration setForcesNeedsValue:](v4, "setForcesNeedsValue:", -[LNParameterConfiguration forcesNeedsValue](self, "forcesNeedsValue"));
  -[LNParameterConfiguration setSecure:](v4, "setSecure:", -[LNParameterConfiguration isSecure](self, "isSecure"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  LNParameterConfiguration *v4;
  LNParameterConfiguration *v5;
  LNParameterConfiguration *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;

  v4 = (LNParameterConfiguration *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
    goto LABEL_10;
  }
  v6 = v4;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v6 = 0;
    goto LABEL_7;
  }
  v7 = -[LNParameterConfiguration forcesNeedsValue](self, "forcesNeedsValue");
  if (v7 != -[LNParameterConfiguration forcesNeedsValue](v6, "forcesNeedsValue"))
  {
LABEL_7:
    LOBYTE(v9) = 0;
    goto LABEL_8;
  }
  v8 = -[LNParameterConfiguration isSecure](self, "isSecure");
  v9 = v8 ^ -[LNParameterConfiguration isSecure](v6, "isSecure") ^ 1;
LABEL_8:

LABEL_10:
  return v9;
}

- (LNParameterConfiguration)initWithCoder:(id)a3
{
  id v4;
  LNParameterConfiguration *v5;
  LNParameterConfiguration *v6;

  v4 = a3;
  v5 = -[LNParameterConfiguration init](self, "init");
  if (v5)
  {
    v5->_forcesNeedsValue = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forcesNeedsValue"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[LNParameterConfiguration forcesNeedsValue](self, "forcesNeedsValue"), CFSTR("forcesNeedsValue"));

}

- (BOOL)forcesNeedsValue
{
  return self->_forcesNeedsValue;
}

- (void)setForcesNeedsValue:(BOOL)a3
{
  self->_forcesNeedsValue = a3;
}

- (BOOL)isSecure
{
  return self->_secure;
}

- (void)setSecure:(BOOL)a3
{
  self->_secure = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
