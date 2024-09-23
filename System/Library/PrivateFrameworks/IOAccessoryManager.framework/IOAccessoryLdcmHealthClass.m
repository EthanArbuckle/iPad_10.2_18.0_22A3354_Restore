@implementation IOAccessoryLdcmHealthClass

- (IOAccessoryLdcmHealthClass)init
{
  IOAccessoryLdcmHealthClass *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IOAccessoryLdcmHealthClass;
  result = -[IOAccessoryLdcmHealthClass init](&v3, sel_init);
  if (result)
  {
    result->_version = 1;
    result->_isHealthy = 0;
    *(_OWORD *)&result->_leakagePassedCount = 0u;
    *(_OWORD *)&result->_wetCount = 0u;
    *(_OWORD *)&result->_outOfProfileCount = 0u;
    *(_OWORD *)&result->_rsvd0 = 0u;
    *(_OWORD *)&result->_rsvd2 = 0u;
    result->_overVoltageTimestamp = 0;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt32:forKey:", -[IOAccessoryLdcmHealthClass version](self, "version"), CFSTR("version"));
  objc_msgSend(a3, "encodeBool:forKey:", -[IOAccessoryLdcmHealthClass isHealthy](self, "isHealthy"), CFSTR("isHealthy"));
  objc_msgSend(a3, "encodeInt64:forKey:", -[IOAccessoryLdcmHealthClass leakagePassedCount](self, "leakagePassedCount"), CFSTR("leakagePassedCount"));
  objc_msgSend(a3, "encodeInt64:forKey:", -[IOAccessoryLdcmHealthClass dryCount](self, "dryCount"), CFSTR("dryCount"));
  objc_msgSend(a3, "encodeInt64:forKey:", -[IOAccessoryLdcmHealthClass wetCount](self, "wetCount"), CFSTR("wetCount"));
  objc_msgSend(a3, "encodeInt64:forKey:", -[IOAccessoryLdcmHealthClass overVoltageCount](self, "overVoltageCount"), CFSTR("overVoltageCount"));
  objc_msgSend(a3, "encodeInt64:forKey:", -[IOAccessoryLdcmHealthClass outOfProfileCount](self, "outOfProfileCount"), CFSTR("outOfProfileCount"));
  objc_msgSend(a3, "encodeInt64:forKey:", -[IOAccessoryLdcmHealthClass lastSeenTimestamp](self, "lastSeenTimestamp"), CFSTR("lastSeenTimestamp"));
  objc_msgSend(a3, "encodeInt64:forKey:", -[IOAccessoryLdcmHealthClass rsvd0](self, "rsvd0"), CFSTR("rsvd0"));
  objc_msgSend(a3, "encodeInt64:forKey:", -[IOAccessoryLdcmHealthClass rsvd1](self, "rsvd1"), CFSTR("rsvd1"));
  objc_msgSend(a3, "encodeInt64:forKey:", -[IOAccessoryLdcmHealthClass rsvd2](self, "rsvd2"), CFSTR("rsvd2"));
  objc_msgSend(a3, "encodeInt64:forKey:", -[IOAccessoryLdcmHealthClass rsvd3](self, "rsvd3"), CFSTR("rsvd3"));
}

- (IOAccessoryLdcmHealthClass)initWithCoder:(id)a3
{
  -[IOAccessoryLdcmHealthClass setVersion:](self, "setVersion:", objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("version")));
  -[IOAccessoryLdcmHealthClass setIsHealthy:](self, "setIsHealthy:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isHealthy")));
  -[IOAccessoryLdcmHealthClass setLeakagePassedCount:](self, "setLeakagePassedCount:", objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("leakagePassedCount")));
  -[IOAccessoryLdcmHealthClass setDryCount:](self, "setDryCount:", objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("dryCount")));
  -[IOAccessoryLdcmHealthClass setWetCount:](self, "setWetCount:", objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("wetCount")));
  -[IOAccessoryLdcmHealthClass setOverVoltageCount:](self, "setOverVoltageCount:", objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("overVoltageCount")));
  -[IOAccessoryLdcmHealthClass setOutOfProfileCount:](self, "setOutOfProfileCount:", objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("outOfProfileCount")));
  -[IOAccessoryLdcmHealthClass setLastSeenTimestamp:](self, "setLastSeenTimestamp:", objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("lastSeenTimestamp")));
  -[IOAccessoryLdcmHealthClass setRsvd0:](self, "setRsvd0:", objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("rsvd0")));
  -[IOAccessoryLdcmHealthClass setRsvd1:](self, "setRsvd1:", objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("rsvd1")));
  -[IOAccessoryLdcmHealthClass setRsvd2:](self, "setRsvd2:", objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("rsvd2")));
  -[IOAccessoryLdcmHealthClass setRsvd3:](self, "setRsvd3:", objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("rsvd3")));
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (BOOL)isHealthy
{
  return self->_isHealthy;
}

- (void)setIsHealthy:(BOOL)a3
{
  self->_isHealthy = a3;
}

- (unint64_t)leakagePassedCount
{
  return self->_leakagePassedCount;
}

- (void)setLeakagePassedCount:(unint64_t)a3
{
  self->_leakagePassedCount = a3;
}

- (unint64_t)dryCount
{
  return self->_dryCount;
}

- (void)setDryCount:(unint64_t)a3
{
  self->_dryCount = a3;
}

- (unint64_t)wetCount
{
  return self->_wetCount;
}

- (void)setWetCount:(unint64_t)a3
{
  self->_wetCount = a3;
}

- (unint64_t)overVoltageCount
{
  return self->_overVoltageCount;
}

- (void)setOverVoltageCount:(unint64_t)a3
{
  self->_overVoltageCount = a3;
}

- (unint64_t)outOfProfileCount
{
  return self->_outOfProfileCount;
}

- (void)setOutOfProfileCount:(unint64_t)a3
{
  self->_outOfProfileCount = a3;
}

- (unint64_t)lastSeenTimestamp
{
  return self->_lastSeenTimestamp;
}

- (void)setLastSeenTimestamp:(unint64_t)a3
{
  self->_lastSeenTimestamp = a3;
}

- (unint64_t)rsvd0
{
  return self->_rsvd0;
}

- (void)setRsvd0:(unint64_t)a3
{
  self->_rsvd0 = a3;
}

- (unint64_t)rsvd1
{
  return self->_rsvd1;
}

- (void)setRsvd1:(unint64_t)a3
{
  self->_rsvd1 = a3;
}

- (unint64_t)rsvd2
{
  return self->_rsvd2;
}

- (void)setRsvd2:(unint64_t)a3
{
  self->_rsvd2 = a3;
}

- (unint64_t)rsvd3
{
  return self->_rsvd3;
}

- (void)setRsvd3:(unint64_t)a3
{
  self->_rsvd3 = a3;
}

- (unint64_t)overVoltageTimestamp
{
  return self->_overVoltageTimestamp;
}

- (void)setOverVoltageTimestamp:(unint64_t)a3
{
  self->_overVoltageTimestamp = a3;
}

@end
