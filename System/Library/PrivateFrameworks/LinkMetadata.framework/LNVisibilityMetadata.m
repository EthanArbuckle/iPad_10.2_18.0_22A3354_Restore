@implementation LNVisibilityMetadata

- (LNVisibilityMetadata)initWithIsDiscoverable:(BOOL)a3 assistantOnly:(BOOL)a4
{
  LNVisibilityMetadata *v6;
  LNVisibilityMetadata *v7;
  LNVisibilityMetadata *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LNVisibilityMetadata;
  v6 = -[LNVisibilityMetadata init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_isDiscoverable = a3;
    v6->_assistantOnly = a4;
    v8 = v6;
  }

  return v7;
}

- (BOOL)visibleForUse:(int64_t)a3
{
  char v3;

  if (a3 == 1)
    return -[LNVisibilityMetadata isDiscoverable](self, "isDiscoverable");
  if (!a3)
  {
    if (-[LNVisibilityMetadata isDiscoverable](self, "isDiscoverable"))
      v3 = !-[LNVisibilityMetadata assistantOnly](self, "assistantOnly");
    else
      v3 = 0;
  }
  return v3 & 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[LNVisibilityMetadata isDiscoverable](self, "isDiscoverable"), CFSTR("isDiscoverable"));
  objc_msgSend(v4, "encodeBool:forKey:", -[LNVisibilityMetadata assistantOnly](self, "assistantOnly"), CFSTR("assistantOnly"));

}

- (LNVisibilityMetadata)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDiscoverable"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("assistantOnly"));

  return -[LNVisibilityMetadata initWithIsDiscoverable:assistantOnly:](self, "initWithIsDiscoverable:assistantOnly:", v5, v6);
}

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
  if (-[LNVisibilityMetadata isDiscoverable](self, "isDiscoverable"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[LNVisibilityMetadata assistantOnly](self, "assistantOnly"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, isDiscoverable: %@, assistantOnly: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  _BOOL4 v3;

  v3 = -[LNVisibilityMetadata isDiscoverable](self, "isDiscoverable");
  return v3 ^ -[LNVisibilityMetadata assistantOnly](self, "assistantOnly");
}

- (BOOL)isEqual:(id)a3
{
  LNVisibilityMetadata *v4;
  LNVisibilityMetadata *v5;
  LNVisibilityMetadata *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;

  v4 = (LNVisibilityMetadata *)a3;
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
  v7 = -[LNVisibilityMetadata isDiscoverable](self, "isDiscoverable");
  if (v7 != -[LNVisibilityMetadata isDiscoverable](v6, "isDiscoverable"))
  {
LABEL_7:
    LOBYTE(v9) = 0;
    goto LABEL_8;
  }
  v8 = -[LNVisibilityMetadata assistantOnly](self, "assistantOnly");
  v9 = v8 ^ -[LNVisibilityMetadata assistantOnly](v6, "assistantOnly") ^ 1;
LABEL_8:

LABEL_10:
  return v9;
}

- (BOOL)isDiscoverable
{
  return self->_isDiscoverable;
}

- (BOOL)assistantOnly
{
  return self->_assistantOnly;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
