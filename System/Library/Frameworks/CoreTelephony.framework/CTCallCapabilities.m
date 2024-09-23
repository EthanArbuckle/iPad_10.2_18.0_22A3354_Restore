@implementation CTCallCapabilities

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", isWifiCallingAvailable=%d"), -[CTCallCapabilities isWifiCallingAvailable](self, "isWifiCallingAvailable"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", isVoLTECallingAvailable=%d"), -[CTCallCapabilities isVoLTECallingAvailable](self, "isVoLTECallingAvailable"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", isCSCallingAvailable=%d"), -[CTCallCapabilities isCSCallingAvailable](self, "isCSCallingAvailable"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", isEmergencyCallingOnWifiAllowed=%d"), -[CTCallCapabilities isEmergencyCallingOnWifiAllowed](self, "isEmergencyCallingOnWifiAllowed"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", isEmergencyCallingOnWifiAvailable=%d"), -[CTCallCapabilities isEmergencyCallingOnWifiAvailable](self, "isEmergencyCallingOnWifiAvailable"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", isCarrierSupportsEmergencyCallOnWifiNoLimit=%d"), -[CTCallCapabilities isCarrierSupportsEmergencyCallOnWifiNoLimit](self, "isCarrierSupportsEmergencyCallOnWifiNoLimit"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIsWifiCallingAvailable:", -[CTCallCapabilities isWifiCallingAvailable](self, "isWifiCallingAvailable"));
  objc_msgSend(v4, "setIsVoLTECallingAvailable:", -[CTCallCapabilities isVoLTECallingAvailable](self, "isVoLTECallingAvailable"));
  objc_msgSend(v4, "setIsCSCallingAvailable:", -[CTCallCapabilities isCSCallingAvailable](self, "isCSCallingAvailable"));
  objc_msgSend(v4, "setIsEmergencyCallingOnWifiAllowed:", -[CTCallCapabilities isEmergencyCallingOnWifiAllowed](self, "isEmergencyCallingOnWifiAllowed"));
  objc_msgSend(v4, "setIsEmergencyCallingOnWifiAvailable:", -[CTCallCapabilities isEmergencyCallingOnWifiAvailable](self, "isEmergencyCallingOnWifiAvailable"));
  objc_msgSend(v4, "setIsCarrierSupportsEmergencyCallOnWifiNoLimit:", -[CTCallCapabilities isCarrierSupportsEmergencyCallOnWifiNoLimit](self, "isCarrierSupportsEmergencyCallOnWifiNoLimit"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CTCallCapabilities isWifiCallingAvailable](self, "isWifiCallingAvailable"), CFSTR("isWifiCallingAvailable"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CTCallCapabilities isVoLTECallingAvailable](self, "isVoLTECallingAvailable"), CFSTR("isVoLTECallingAvailable"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CTCallCapabilities isCSCallingAvailable](self, "isCSCallingAvailable"), CFSTR("isCSCallingAvailable"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CTCallCapabilities isEmergencyCallingOnWifiAllowed](self, "isEmergencyCallingOnWifiAllowed"), CFSTR("isEmergencyCallingOnWifiAllowed"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CTCallCapabilities isEmergencyCallingOnWifiAvailable](self, "isEmergencyCallingOnWifiAvailable"), CFSTR("isEmergencyCallingOnWifiAvailable"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CTCallCapabilities isCarrierSupportsEmergencyCallOnWifiNoLimit](self, "isCarrierSupportsEmergencyCallOnWifiNoLimit"), CFSTR("isCarrierSupportsEmergencyCallOnWifiNoLimit"));

}

- (CTCallCapabilities)initWithCoder:(id)a3
{
  id v4;
  CTCallCapabilities *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTCallCapabilities;
  v5 = -[CTCallCapabilities init](&v7, sel_init);
  if (v5)
  {
    v5->_isWifiCallingAvailable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isWifiCallingAvailable"));
    v5->_isVoLTECallingAvailable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isVoLTECallingAvailable"));
    v5->_isCSCallingAvailable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCSCallingAvailable"));
    v5->_isEmergencyCallingOnWifiAllowed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEmergencyCallingOnWifiAllowed"));
    v5->_isEmergencyCallingOnWifiAvailable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEmergencyCallingOnWifiAvailable"));
    v5->_isCarrierSupportsEmergencyCallOnWifiNoLimit = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCarrierSupportsEmergencyCallOnWifiNoLimit"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isWifiCallingAvailable
{
  return self->_isWifiCallingAvailable;
}

- (void)setIsWifiCallingAvailable:(BOOL)a3
{
  self->_isWifiCallingAvailable = a3;
}

- (BOOL)isVoLTECallingAvailable
{
  return self->_isVoLTECallingAvailable;
}

- (void)setIsVoLTECallingAvailable:(BOOL)a3
{
  self->_isVoLTECallingAvailable = a3;
}

- (BOOL)isCSCallingAvailable
{
  return self->_isCSCallingAvailable;
}

- (void)setIsCSCallingAvailable:(BOOL)a3
{
  self->_isCSCallingAvailable = a3;
}

- (BOOL)isEmergencyCallingOnWifiAllowed
{
  return self->_isEmergencyCallingOnWifiAllowed;
}

- (void)setIsEmergencyCallingOnWifiAllowed:(BOOL)a3
{
  self->_isEmergencyCallingOnWifiAllowed = a3;
}

- (BOOL)isEmergencyCallingOnWifiAvailable
{
  return self->_isEmergencyCallingOnWifiAvailable;
}

- (void)setIsEmergencyCallingOnWifiAvailable:(BOOL)a3
{
  self->_isEmergencyCallingOnWifiAvailable = a3;
}

- (BOOL)isCarrierSupportsEmergencyCallOnWifiNoLimit
{
  return self->_isCarrierSupportsEmergencyCallOnWifiNoLimit;
}

- (void)setIsCarrierSupportsEmergencyCallOnWifiNoLimit:(BOOL)a3
{
  self->_isCarrierSupportsEmergencyCallOnWifiNoLimit = a3;
}

@end
