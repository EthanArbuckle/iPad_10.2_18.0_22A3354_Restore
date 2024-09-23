@implementation CTEmergencyModeResult

- (CTEmergencyModeResult)initWithMode:(id)a3 andContext:(id)a4
{
  id v7;
  id v8;
  CTEmergencyModeResult *v9;
  CTEmergencyModeResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CTEmergencyModeResult;
  v9 = -[CTEmergencyModeResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mode, a3);
    objc_storeStrong((id *)&v10->_context, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTEmergencyModeResult mode](self, "mode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" mode=%@"), v4);

  -[CTEmergencyModeResult context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" context=%@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[CTEmergencyModeResult mode](self, "mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTEmergencyModeResult context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithMode:andContext:", v5, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  CTEmergencyMode *mode;
  id v5;

  mode = self->_mode;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", mode, CFSTR("mode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_context, CFSTR("context"));

}

- (CTEmergencyModeResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CTEmergencyModeResult *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("mode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CTEmergencyModeResult initWithMode:andContext:](self, "initWithMode:andContext:", v5, v6);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTEmergencyMode)mode
{
  return self->_mode;
}

- (CTXPCServiceSubscriptionContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_mode, 0);
}

@end
