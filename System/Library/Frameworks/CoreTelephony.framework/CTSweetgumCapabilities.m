@implementation CTSweetgumCapabilities

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" supportsServices=%d"), -[CTSweetgumCapabilities supportsServices](self, "supportsServices"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" supportsUsage=%d"), -[CTSweetgumCapabilities supportsUsage](self, "supportsUsage"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" supportsPlans=%d"), -[CTSweetgumCapabilities supportsPlans](self, "supportsPlans"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" supportsApplications=%d"), -[CTSweetgumCapabilities supportsApplications](self, "supportsApplications"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CTSweetgumCapabilities *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v10;

  v4 = (CTSweetgumCapabilities *)a3;
  if (v4 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v5 = -[CTSweetgumCapabilities supportsServices](self, "supportsServices"),
          v5 == -[CTSweetgumCapabilities supportsServices](v4, "supportsServices"))
      && (v6 = -[CTSweetgumCapabilities supportsUsage](self, "supportsUsage"),
          v6 == -[CTSweetgumCapabilities supportsUsage](v4, "supportsUsage"))
      && (v7 = -[CTSweetgumCapabilities supportsPlans](self, "supportsPlans"),
          v7 == -[CTSweetgumCapabilities supportsPlans](v4, "supportsPlans")))
    {
      v10 = -[CTSweetgumCapabilities supportsApplications](self, "supportsApplications");
      v8 = v10 ^ -[CTSweetgumCapabilities supportsApplications](v4, "supportsApplications") ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setSupportsServices:", -[CTSweetgumCapabilities supportsServices](self, "supportsServices"));
  objc_msgSend(v4, "setSupportsUsage:", -[CTSweetgumCapabilities supportsUsage](self, "supportsUsage"));
  objc_msgSend(v4, "setSupportsPlans:", -[CTSweetgumCapabilities supportsPlans](self, "supportsPlans"));
  objc_msgSend(v4, "setSupportsApplications:", -[CTSweetgumCapabilities supportsApplications](self, "supportsApplications"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 supportsServices;
  id v5;

  supportsServices = self->_supportsServices;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", supportsServices, CFSTR("services"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsUsage, CFSTR("usage"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsPlans, CFSTR("plans"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsApplications, CFSTR("applications"));

}

- (CTSweetgumCapabilities)initWithCoder:(id)a3
{
  id v4;
  CTSweetgumCapabilities *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTSweetgumCapabilities;
  v5 = -[CTSweetgumCapabilities init](&v7, sel_init);
  if (v5)
  {
    v5->_supportsServices = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("services"));
    v5->_supportsUsage = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usage"));
    v5->_supportsPlans = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("plans"));
    v5->_supportsApplications = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("applications"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)supportsServices
{
  return self->_supportsServices;
}

- (void)setSupportsServices:(BOOL)a3
{
  self->_supportsServices = a3;
}

- (BOOL)supportsUsage
{
  return self->_supportsUsage;
}

- (void)setSupportsUsage:(BOOL)a3
{
  self->_supportsUsage = a3;
}

- (BOOL)supportsPlans
{
  return self->_supportsPlans;
}

- (void)setSupportsPlans:(BOOL)a3
{
  self->_supportsPlans = a3;
}

- (BOOL)supportsApplications
{
  return self->_supportsApplications;
}

- (void)setSupportsApplications:(BOOL)a3
{
  self->_supportsApplications = a3;
}

@end
