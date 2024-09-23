@implementation CTIMSRegistrationTransportInfo

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", isRegistered=%d"), -[CTIMSRegistrationTransportInfo isRegistered](self, "isRegistered"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", contextType=%d"), -[CTIMSRegistrationTransportInfo contextType](self, "contextType"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", transportType=%d"), -[CTIMSRegistrationTransportInfo transportType](self, "transportType"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIsRegistered:", -[CTIMSRegistrationTransportInfo isRegistered](self, "isRegistered"));
  objc_msgSend(v4, "setContextType:", -[CTIMSRegistrationTransportInfo contextType](self, "contextType"));
  objc_msgSend(v4, "setTransportType:", -[CTIMSRegistrationTransportInfo transportType](self, "transportType"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CTIMSRegistrationTransportInfo isRegistered](self, "isRegistered"), CFSTR("isRegistered"));
  objc_msgSend(v4, "encodeInt:forKey:", -[CTIMSRegistrationTransportInfo contextType](self, "contextType"), CFSTR("contextType"));
  objc_msgSend(v4, "encodeInt:forKey:", -[CTIMSRegistrationTransportInfo transportType](self, "transportType"), CFSTR("transportType"));

}

- (CTIMSRegistrationTransportInfo)initWithCoder:(id)a3
{
  id v4;
  CTIMSRegistrationTransportInfo *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTIMSRegistrationTransportInfo;
  v5 = -[CTIMSRegistrationTransportInfo init](&v7, sel_init);
  if (v5)
  {
    v5->_isRegistered = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isRegistered"));
    v5->_contextType = objc_msgSend(v4, "decodeIntForKey:", CFSTR("contextType"));
    v5->_transportType = objc_msgSend(v4, "decodeIntForKey:", CFSTR("transportType"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isRegistered
{
  return self->_isRegistered;
}

- (void)setIsRegistered:(BOOL)a3
{
  self->_isRegistered = a3;
}

- (int)contextType
{
  return self->_contextType;
}

- (void)setContextType:(int)a3
{
  self->_contextType = a3;
}

- (int)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
}

@end
