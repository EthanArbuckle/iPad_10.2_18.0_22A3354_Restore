@implementation CTPrivateNetworkCapabilities

- (CTPrivateNetworkCapabilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CTPrivateNetworkCapabilities;
  return -[CTPrivateNetworkCapabilities init](&v3, sel_init);
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", isPrivateNetworkSIM=%d"), -[CTPrivateNetworkCapabilities isPrivateNetworkSIM](self, "isPrivateNetworkSIM"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", isPrivateNetworkPreferredOverWifi=%d"), -[CTPrivateNetworkCapabilities isPrivateNetworkPreferredOverWifi](self, "isPrivateNetworkPreferredOverWifi"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", isPrivateNetworkModeEnabled=%d"), -[CTPrivateNetworkCapabilities isPrivateNetworkModeEnabled](self, "isPrivateNetworkModeEnabled"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", hideDataRoaming=%d"), -[CTPrivateNetworkCapabilities hideDataRoaming](self, "hideDataRoaming"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIsPrivateNetworkSIM:", -[CTPrivateNetworkCapabilities isPrivateNetworkSIM](self, "isPrivateNetworkSIM"));
  objc_msgSend(v4, "setIsPrivateNetworkPreferredOverWifi:", -[CTPrivateNetworkCapabilities isPrivateNetworkPreferredOverWifi](self, "isPrivateNetworkPreferredOverWifi"));
  objc_msgSend(v4, "setIsPrivateNetworkModeEnabled:", -[CTPrivateNetworkCapabilities isPrivateNetworkModeEnabled](self, "isPrivateNetworkModeEnabled"));
  objc_msgSend(v4, "setHideDataRoaming:", -[CTPrivateNetworkCapabilities hideDataRoaming](self, "hideDataRoaming"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CTPrivateNetworkCapabilities isPrivateNetworkSIM](self, "isPrivateNetworkSIM"), CFSTR("isPrivateNetworkSIM"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CTPrivateNetworkCapabilities isPrivateNetworkPreferredOverWifi](self, "isPrivateNetworkPreferredOverWifi"), CFSTR("isPrivateNetworkPreferredOverWifi"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CTPrivateNetworkCapabilities isPrivateNetworkModeEnabled](self, "isPrivateNetworkModeEnabled"), CFSTR("isPrivateNetworkModeEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CTPrivateNetworkCapabilities hideDataRoaming](self, "hideDataRoaming"), CFSTR("hideDataRoaming"));

}

- (CTPrivateNetworkCapabilities)initWithCoder:(id)a3
{
  id v4;
  CTPrivateNetworkCapabilities *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTPrivateNetworkCapabilities;
  v5 = -[CTPrivateNetworkCapabilities init](&v7, sel_init);
  if (v5)
  {
    v5->_isPrivateNetworkSIM = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPrivateNetworkSIM"));
    v5->_isPrivateNetworkPreferredOverWifi = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPrivateNetworkPreferredOverWifi"));
    v5->_isPrivateNetworkModeEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPrivateNetworkModeEnabled"));
    v5->_hideDataRoaming = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hideDataRoaming"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isPrivateNetworkSIM
{
  return self->_isPrivateNetworkSIM;
}

- (void)setIsPrivateNetworkSIM:(BOOL)a3
{
  self->_isPrivateNetworkSIM = a3;
}

- (BOOL)isPrivateNetworkPreferredOverWifi
{
  return self->_isPrivateNetworkPreferredOverWifi;
}

- (void)setIsPrivateNetworkPreferredOverWifi:(BOOL)a3
{
  self->_isPrivateNetworkPreferredOverWifi = a3;
}

- (BOOL)isPrivateNetworkModeEnabled
{
  return self->_isPrivateNetworkModeEnabled;
}

- (void)setIsPrivateNetworkModeEnabled:(BOOL)a3
{
  self->_isPrivateNetworkModeEnabled = a3;
}

- (BOOL)hideDataRoaming
{
  return self->_hideDataRoaming;
}

- (void)setHideDataRoaming:(BOOL)a3
{
  self->_hideDataRoaming = a3;
}

@end
