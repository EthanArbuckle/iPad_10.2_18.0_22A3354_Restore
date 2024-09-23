@implementation CTIMSRegistrationStatus

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", isRegisteredForVoice=%d"), -[CTIMSRegistrationStatus isRegisteredForVoice](self, "isRegisteredForVoice"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", isRegisteredForSMS=%d"), -[CTIMSRegistrationStatus isRegisteredForSMS](self, "isRegisteredForSMS"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIsRegisteredForVoice:", -[CTIMSRegistrationStatus isRegisteredForVoice](self, "isRegisteredForVoice"));
  objc_msgSend(v4, "setIsRegisteredForSMS:", -[CTIMSRegistrationStatus isRegisteredForSMS](self, "isRegisteredForSMS"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CTIMSRegistrationStatus isRegisteredForVoice](self, "isRegisteredForVoice"), CFSTR("isRegisteredForVoice"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CTIMSRegistrationStatus isRegisteredForSMS](self, "isRegisteredForSMS"), CFSTR("isRegisteredForSMS"));

}

- (CTIMSRegistrationStatus)initWithCoder:(id)a3
{
  id v4;
  CTIMSRegistrationStatus *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTIMSRegistrationStatus;
  v5 = -[CTIMSRegistrationStatus init](&v7, sel_init);
  if (v5)
  {
    v5->_isRegisteredForVoice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isRegisteredForVoice"));
    v5->_isRegisteredForSMS = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isRegisteredForSMS"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isRegisteredForVoice
{
  return self->_isRegisteredForVoice;
}

- (void)setIsRegisteredForVoice:(BOOL)a3
{
  self->_isRegisteredForVoice = a3;
}

- (BOOL)isRegisteredForSMS
{
  return self->_isRegisteredForSMS;
}

- (void)setIsRegisteredForSMS:(BOOL)a3
{
  self->_isRegisteredForSMS = a3;
}

@end
