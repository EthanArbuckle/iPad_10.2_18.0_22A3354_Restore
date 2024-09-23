@implementation CTRegistrationDisplayStatus

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTRegistrationDisplayStatus registrationDisplayStatus](self, "registrationDisplayStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", registrationDisplayStatus=%@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(", isInHomeCountry=%d"), -[CTRegistrationDisplayStatus isInHomeCountry](self, "isInHomeCountry"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", changedDueToSimRemoval=%d"), -[CTRegistrationDisplayStatus changedDueToSimRemoval](self, "changedDueToSimRemoval"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", isRegistrationForcedHome=%d"), -[CTRegistrationDisplayStatus isRegistrationForcedHome](self, "isRegistrationForcedHome"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", isSatelliteSystem=%d"), -[CTRegistrationDisplayStatus isSatelliteSystem](self, "isSatelliteSystem"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTRegistrationDisplayStatus registrationDisplayStatus](self, "registrationDisplayStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setRegistrationDisplayStatus:", v6);

  objc_msgSend(v4, "setIsInHomeCountry:", -[CTRegistrationDisplayStatus isInHomeCountry](self, "isInHomeCountry"));
  objc_msgSend(v4, "setChangedDueToSimRemoval:", -[CTRegistrationDisplayStatus changedDueToSimRemoval](self, "changedDueToSimRemoval"));
  objc_msgSend(v4, "setIsRegistrationForcedHome:", -[CTRegistrationDisplayStatus isRegistrationForcedHome](self, "isRegistrationForcedHome"));
  objc_msgSend(v4, "setIsSatelliteSystem:", -[CTRegistrationDisplayStatus isSatelliteSystem](self, "isSatelliteSystem"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CTRegistrationDisplayStatus registrationDisplayStatus](self, "registrationDisplayStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("display_status"));

  objc_msgSend(v5, "encodeBool:forKey:", -[CTRegistrationDisplayStatus isInHomeCountry](self, "isInHomeCountry"), CFSTR("home_country"));
  objc_msgSend(v5, "encodeBool:forKey:", -[CTRegistrationDisplayStatus changedDueToSimRemoval](self, "changedDueToSimRemoval"), CFSTR("sim_removal"));
  objc_msgSend(v5, "encodeBool:forKey:", -[CTRegistrationDisplayStatus isRegistrationForcedHome](self, "isRegistrationForcedHome"), CFSTR("forced_home"));
  objc_msgSend(v5, "encodeBool:forKey:", -[CTRegistrationDisplayStatus isSatelliteSystem](self, "isSatelliteSystem"), CFSTR("is_satellite_system"));

}

- (CTRegistrationDisplayStatus)initWithCoder:(id)a3
{
  id v4;
  CTRegistrationDisplayStatus *v5;
  uint64_t v6;
  NSString *registrationDisplayStatus;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTRegistrationDisplayStatus;
  v5 = -[CTRegistrationDisplayStatus init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("display_status"));
    v6 = objc_claimAutoreleasedReturnValue();
    registrationDisplayStatus = v5->_registrationDisplayStatus;
    v5->_registrationDisplayStatus = (NSString *)v6;

    v5->_isInHomeCountry = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("home_country"));
    v5->_changedDueToSimRemoval = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sim_removal"));
    v5->_isRegistrationForcedHome = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forced_home"));
    v5->_isSatelliteSystem = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("is_satellite_system"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)registrationDisplayStatus
{
  return self->_registrationDisplayStatus;
}

- (void)setRegistrationDisplayStatus:(id)a3
{
  objc_storeStrong((id *)&self->_registrationDisplayStatus, a3);
}

- (BOOL)isInHomeCountry
{
  return self->_isInHomeCountry;
}

- (void)setIsInHomeCountry:(BOOL)a3
{
  self->_isInHomeCountry = a3;
}

- (BOOL)changedDueToSimRemoval
{
  return self->_changedDueToSimRemoval;
}

- (void)setChangedDueToSimRemoval:(BOOL)a3
{
  self->_changedDueToSimRemoval = a3;
}

- (BOOL)isRegistrationForcedHome
{
  return self->_isRegistrationForcedHome;
}

- (void)setIsRegistrationForcedHome:(BOOL)a3
{
  self->_isRegistrationForcedHome = a3;
}

- (BOOL)isSatelliteSystem
{
  return self->_isSatelliteSystem;
}

- (void)setIsSatelliteSystem:(BOOL)a3
{
  self->_isSatelliteSystem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationDisplayStatus, 0);
}

@end
