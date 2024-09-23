@implementation CTResumableRoadsideProvider

- (id)description
{
  void *v3;
  _BOOL4 v4;
  const char *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTResumableRoadsideProvider success](self, "success");
  v5 = "NO";
  if (v4)
    v5 = "YES";
  objc_msgSend(v3, "appendFormat:", CFSTR(", success=%s"), v5);
  -[CTResumableRoadsideProvider providerId](self, "providerId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", providerId=%@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTResumableRoadsideProvider:(id)a3
{
  id v4;
  int v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[CTResumableRoadsideProvider success](self, "success");
  if (v5 == objc_msgSend(v4, "success"))
  {
    -[CTResumableRoadsideProvider providerId](self, "providerId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "providerId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8)
    {
      v6 = 1;
    }
    else
    {
      -[CTResumableRoadsideProvider providerId](self, "providerId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "providerId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v9, "isEqualToNumber:", v10);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  CTResumableRoadsideProvider *v4;
  BOOL v5;

  v4 = (CTResumableRoadsideProvider *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTResumableRoadsideProvider isEqualToCTResumableRoadsideProvider:](self, "isEqualToCTResumableRoadsideProvider:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setSuccess:", -[CTResumableRoadsideProvider success](self, "success"));
  -[CTResumableRoadsideProvider providerId](self, "providerId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setProviderId:", v7);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", -[CTResumableRoadsideProvider success](self, "success"), CFSTR("success"));
  -[CTResumableRoadsideProvider providerId](self, "providerId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("providerId"));

}

- (CTResumableRoadsideProvider)initWithCoder:(id)a3
{
  id v4;
  CTResumableRoadsideProvider *v5;
  uint64_t v6;
  NSNumber *providerId;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTResumableRoadsideProvider;
  v5 = -[CTResumableRoadsideProvider init](&v9, sel_init);
  if (v5)
  {
    v5->_success = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("success"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("providerId"));
    v6 = objc_claimAutoreleasedReturnValue();
    providerId = v5->_providerId;
    v5->_providerId = (NSNumber *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSNumber)providerId
{
  return self->_providerId;
}

- (void)setProviderId:(id)a3
{
  objc_storeStrong((id *)&self->_providerId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerId, 0);
}

@end
