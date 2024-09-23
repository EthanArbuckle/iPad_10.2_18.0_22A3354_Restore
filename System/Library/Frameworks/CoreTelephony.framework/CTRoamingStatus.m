@implementation CTRoamingStatus

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", isVoiceRoaming=%d"), -[CTRoamingStatus isVoiceRoaming](self, "isVoiceRoaming"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", isDataRoaming=%d"), -[CTRoamingStatus isDataRoaming](self, "isDataRoaming"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIsVoiceRoaming:", -[CTRoamingStatus isVoiceRoaming](self, "isVoiceRoaming"));
  objc_msgSend(v4, "setIsDataRoaming:", -[CTRoamingStatus isDataRoaming](self, "isDataRoaming"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CTRoamingStatus isVoiceRoaming](self, "isVoiceRoaming"), CFSTR("voice_roaming"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CTRoamingStatus isDataRoaming](self, "isDataRoaming"), CFSTR("data_roaming"));

}

- (CTRoamingStatus)initWithCoder:(id)a3
{
  id v4;
  CTRoamingStatus *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTRoamingStatus;
  v5 = -[CTRoamingStatus init](&v7, sel_init);
  if (v5)
  {
    v5->_isVoiceRoaming = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("voice_roaming"));
    v5->_isDataRoaming = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("data_roaming"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isVoiceRoaming
{
  return self->_isVoiceRoaming;
}

- (void)setIsVoiceRoaming:(BOOL)a3
{
  self->_isVoiceRoaming = a3;
}

- (BOOL)isDataRoaming
{
  return self->_isDataRoaming;
}

- (void)setIsDataRoaming:(BOOL)a3
{
  self->_isDataRoaming = a3;
}

@end
