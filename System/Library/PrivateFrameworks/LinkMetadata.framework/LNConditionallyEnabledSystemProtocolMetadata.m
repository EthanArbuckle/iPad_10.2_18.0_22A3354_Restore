@implementation LNConditionallyEnabledSystemProtocolMetadata

- (LNConditionallyEnabledSystemProtocolMetadata)initWithPersistState:(BOOL)a3
{
  LNConditionallyEnabledSystemProtocolMetadata *v4;
  LNConditionallyEnabledSystemProtocolMetadata *v5;
  LNConditionallyEnabledSystemProtocolMetadata *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LNConditionallyEnabledSystemProtocolMetadata;
  v4 = -[LNConditionallyEnabledSystemProtocolMetadata init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_persistState = a3;
    v6 = v4;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[LNConditionallyEnabledSystemProtocolMetadata persistState](self, "persistState"), CFSTR("persistState"));

}

- (LNConditionallyEnabledSystemProtocolMetadata)initWithCoder:(id)a3
{
  return -[LNConditionallyEnabledSystemProtocolMetadata initWithPersistState:](self, "initWithPersistState:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("persistState")));
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LNConditionallyEnabledSystemProtocolMetadata persistState](self, "persistState");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, persistState: %@>"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (unint64_t)hash
{
  return -[LNConditionallyEnabledSystemProtocolMetadata persistState](self, "persistState");
}

- (BOOL)isEqual:(id)a3
{
  LNConditionallyEnabledSystemProtocolMetadata *v4;
  LNConditionallyEnabledSystemProtocolMetadata *v5;
  LNConditionallyEnabledSystemProtocolMetadata *v6;
  _BOOL4 v7;
  _BOOL4 v8;

  v4 = (LNConditionallyEnabledSystemProtocolMetadata *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = -[LNConditionallyEnabledSystemProtocolMetadata persistState](self, "persistState");
      v8 = v7 ^ -[LNConditionallyEnabledSystemProtocolMetadata persistState](v6, "persistState") ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  return v8;
}

- (BOOL)persistState
{
  return self->_persistState;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
