@implementation CTSelectRoadsideProviderContext

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", providerId=%ld"), -[CTSelectRoadsideProviderContext providerId](self, "providerId"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTSelectRoadsideProviderContext:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  v5 = -[CTSelectRoadsideProviderContext providerId](self, "providerId");
  LOBYTE(v5) = v5 == objc_msgSend(v4, "providerId");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  CTSelectRoadsideProviderContext *v4;
  BOOL v5;

  v4 = (CTSelectRoadsideProviderContext *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTSelectRoadsideProviderContext isEqualToCTSelectRoadsideProviderContext:](self, "isEqualToCTSelectRoadsideProviderContext:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setProviderId:", -[CTSelectRoadsideProviderContext providerId](self, "providerId"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTSelectRoadsideProviderContext providerId](self, "providerId"), CFSTR("providerId"));

}

- (CTSelectRoadsideProviderContext)initWithCoder:(id)a3
{
  id v4;
  CTSelectRoadsideProviderContext *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTSelectRoadsideProviderContext;
  v5 = -[CTSelectRoadsideProviderContext init](&v7, sel_init);
  if (v5)
    v5->_providerId = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("providerId"));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)providerId
{
  return self->_providerId;
}

- (void)setProviderId:(int64_t)a3
{
  self->_providerId = a3;
}

@end
