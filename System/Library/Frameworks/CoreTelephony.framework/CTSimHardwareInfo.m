@implementation CTSimHardwareInfo

- (CTSimHardwareInfo)initWithHardwareInfo:(int64_t)a3 simLocation:(int64_t)a4
{
  CTSimHardwareInfo *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CTSimHardwareInfo;
  result = -[CTSimHardwareInfo init](&v7, sel_init);
  if (result)
  {
    result->_hardwareType = a3;
    result->_simLocation = a4;
  }
  return result;
}

- (id)description
{
  void *v3;
  int64_t v4;
  const char *v5;
  int64_t v6;
  const char *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTSimHardwareInfo hardwareType](self, "hardwareType");
  v5 = "CTSimHardwareTypeUnknown";
  if (v4 == 1)
    v5 = "CTSimHardwareTypePhysical";
  if (v4 == 2)
    v5 = "CTSimHardwareTypeDigital";
  objc_msgSend(v3, "appendFormat:", CFSTR(" hardwareType=%s"), v5);
  v6 = -[CTSimHardwareInfo simLocation](self, "simLocation");
  if ((unint64_t)(v6 - 1) > 2)
    v7 = "CTSimLocationUnknown";
  else
    v7 = off_1E1532DE8[v6 - 1];
  objc_msgSend(v3, "appendFormat:", CFSTR(" simLocation=%s"), v7);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t hardwareType;
  id v5;

  hardwareType = self->_hardwareType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", hardwareType, CFSTR("hardwareType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_simLocation, CFSTR("simLocation"));

}

- (CTSimHardwareInfo)initWithCoder:(id)a3
{
  id v4;
  CTSimHardwareInfo *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTSimHardwareInfo;
  v5 = -[CTSimHardwareInfo init](&v7, sel_init);
  if (v5)
  {
    v5->_hardwareType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("hardwareType"));
    v5->_simLocation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("simLocation"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)hardwareType
{
  return self->_hardwareType;
}

- (void)setHardwareType:(int64_t)a3
{
  self->_hardwareType = a3;
}

- (int64_t)simLocation
{
  return self->_simLocation;
}

- (void)setSimLocation:(int64_t)a3
{
  self->_simLocation = a3;
}

@end
