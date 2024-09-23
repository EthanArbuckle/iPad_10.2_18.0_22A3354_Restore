@implementation CTBundle

- (id)description
{
  void *v3;
  int64_t v4;
  const char *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTBundle type](self, "type");
  if ((unint64_t)(v4 - 1) > 5)
    v5 = "CTBundleTypeUnknown";
  else
    v5 = off_1E1532390[v4 - 1];
  objc_msgSend(v3, "appendFormat:", CFSTR(" Bundle Type=%s"), v5);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_type, CFSTR("bundletype"));
}

- (CTBundle)initWithCoder:(id)a3
{
  id v4;
  CTBundle *v5;

  v4 = a3;
  v5 = -[CTBundle initWithBundleType:](self, "initWithBundleType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bundletype")));

  return v5;
}

- (CTBundle)initWithBundleType:(int64_t)a3
{
  CTBundle *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CTBundle;
  result = -[CTBundle init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTBundle)init
{
  return -[CTBundle initWithBundleType:](self, "initWithBundleType:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBundleType:", -[CTBundle type](self, "type"));
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end
