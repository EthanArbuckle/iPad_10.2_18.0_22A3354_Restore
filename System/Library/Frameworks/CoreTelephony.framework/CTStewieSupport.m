@implementation CTStewieSupport

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", status=%d"), -[CTStewieSupport status](self, "status"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", hwSupport=%d"), -[CTStewieSupport hwSupport](self, "hwSupport"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToSupport:(id)a3
{
  id v4;
  int v5;
  int v6;
  _BOOL4 v7;

  v4 = a3;
  v5 = -[CTStewieSupport status](self, "status");
  if (v5 == objc_msgSend(v4, "status"))
  {
    v7 = -[CTStewieSupport hwSupport](self, "hwSupport");
    v6 = v7 ^ objc_msgSend(v4, "hwSupport") ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  CTStewieSupport *v4;
  BOOL v5;

  v4 = (CTStewieSupport *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CTStewieSupport isEqualToSupport:](self, "isEqualToSupport:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setStatus:", -[CTStewieSupport status](self, "status"));
  objc_msgSend(v4, "setHwSupport:", -[CTStewieSupport hwSupport](self, "hwSupport"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CTStewieSupport status](self, "status"), CFSTR("status"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CTStewieSupport hwSupport](self, "hwSupport"), CFSTR("hwSupport"));

}

- (CTStewieSupport)initWithCoder:(id)a3
{
  id v4;
  CTStewieSupport *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTStewieSupport;
  v5 = -[CTStewieSupport init](&v7, sel_init);
  if (v5)
  {
    v5->_status = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("status"));
    v5->_hwSupport = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hwSupport"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)status
{
  return self->_status;
}

- (void)setStatus:(BOOL)a3
{
  self->_status = a3;
}

- (BOOL)hwSupport
{
  return self->_hwSupport;
}

- (void)setHwSupport:(BOOL)a3
{
  self->_hwSupport = a3;
}

@end
