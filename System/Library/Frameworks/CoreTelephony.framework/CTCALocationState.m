@implementation CTCALocationState

- (id)description
{
  void *v3;
  int64_t v4;
  const char *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTCALocationState locationAcquisitionStatus](self, "locationAcquisitionStatus");
  v5 = "???";
  if (v4 == 1)
    v5 = "CTCALocationAcquisitionStatusInProgress";
  if (!v4)
    v5 = "CTCALocationAcquisitionStatusUnknown";
  objc_msgSend(v3, "appendFormat:", CFSTR(", locationAcquisitionStatus=%s"), v5);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setLocationAcquisitionStatus:", -[CTCALocationState locationAcquisitionStatus](self, "locationAcquisitionStatus"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTCALocationState locationAcquisitionStatus](self, "locationAcquisitionStatus"), CFSTR("locationAcquisitionStatus"));

}

- (CTCALocationState)initWithCoder:(id)a3
{
  id v4;
  CTCALocationState *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTCALocationState;
  v5 = -[CTCALocationState init](&v7, sel_init);
  if (v5)
    v5->_locationAcquisitionStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("locationAcquisitionStatus"));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)locationAcquisitionStatus
{
  return self->_locationAcquisitionStatus;
}

- (void)setLocationAcquisitionStatus:(int64_t)a3
{
  self->_locationAcquisitionStatus = a3;
}

@end
