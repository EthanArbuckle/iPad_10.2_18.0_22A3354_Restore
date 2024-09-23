@implementation CTDataConnectionAvailabilityStatus

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", available=%d"), -[CTDataConnectionAvailabilityStatus available](self, "available"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", error=%d"), -[CTDataConnectionAvailabilityStatus csiError](self, "csiError"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setAvailable:", -[CTDataConnectionAvailabilityStatus available](self, "available"));
  objc_msgSend(v4, "setCsiError:", -[CTDataConnectionAvailabilityStatus csiError](self, "csiError"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CTDataConnectionAvailabilityStatus available](self, "available"), CFSTR("available"));
  objc_msgSend(v4, "encodeInt:forKey:", -[CTDataConnectionAvailabilityStatus csiError](self, "csiError"), CFSTR("error"));

}

- (CTDataConnectionAvailabilityStatus)initWithCoder:(id)a3
{
  id v4;
  CTDataConnectionAvailabilityStatus *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTDataConnectionAvailabilityStatus;
  v5 = -[CTDataConnectionAvailabilityStatus init](&v7, sel_init);
  if (v5)
  {
    v5->_available = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("available"));
    v5->_csiError = objc_msgSend(v4, "decodeIntForKey:", CFSTR("error"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)available
{
  return self->_available;
}

- (void)setAvailable:(BOOL)a3
{
  self->_available = a3;
}

- (int)csiError
{
  return self->_csiError;
}

- (void)setCsiError:(int)a3
{
  self->_csiError = a3;
}

@end
