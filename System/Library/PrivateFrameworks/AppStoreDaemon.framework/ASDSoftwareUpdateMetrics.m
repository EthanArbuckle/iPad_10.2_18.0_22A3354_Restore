@implementation ASDSoftwareUpdateMetrics

- (id)copyWithZone:(_NSZone *)a3
{
  ASDSoftwareUpdateMetrics *v5;
  uint64_t v6;
  NSDate *lastUpdateCheck;
  uint64_t v8;
  NSDate *nextUpdateCheck;

  v5 = -[ASDSoftwareUpdateMetrics init](+[ASDSoftwareUpdateMetrics allocWithZone:](ASDSoftwareUpdateMetrics, "allocWithZone:"), "init");
  v6 = -[NSDate copyWithZone:](self->_lastUpdateCheck, "copyWithZone:", a3);
  lastUpdateCheck = v5->_lastUpdateCheck;
  v5->_lastUpdateCheck = (NSDate *)v6;

  v8 = -[NSDate copyWithZone:](self->_nextUpdateCheck, "copyWithZone:", a3);
  nextUpdateCheck = v5->_nextUpdateCheck;
  v5->_nextUpdateCheck = (NSDate *)v8;

  v5->_usingModernUpdatesCheck = self->_usingModernUpdatesCheck;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDSoftwareUpdateMetrics)initWithCoder:(id)a3
{
  id v4;
  ASDSoftwareUpdateMetrics *v5;
  uint64_t v6;
  NSDate *lastUpdateCheck;
  uint64_t v8;
  NSDate *nextUpdateCheck;

  v4 = a3;
  v5 = -[ASDSoftwareUpdateMetrics init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdateCheck"));
    v6 = objc_claimAutoreleasedReturnValue();
    lastUpdateCheck = v5->_lastUpdateCheck;
    v5->_lastUpdateCheck = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nextUpdateCheck"));
    v8 = objc_claimAutoreleasedReturnValue();
    nextUpdateCheck = v5->_nextUpdateCheck;
    v5->_nextUpdateCheck = (NSDate *)v8;

    v5->_usingModernUpdatesCheck = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usingModernUpdateCheck"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *lastUpdateCheck;
  id v5;

  lastUpdateCheck = self->_lastUpdateCheck;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", lastUpdateCheck, CFSTR("lastUpdateCheck"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nextUpdateCheck, CFSTR("nextUpdateCheck"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_usingModernUpdatesCheck, CFSTR("usingModernUpdateCheck"));

}

- (NSDate)lastUpdateCheck
{
  return self->_lastUpdateCheck;
}

- (void)setLastUpdateCheck:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)nextUpdateCheck
{
  return self->_nextUpdateCheck;
}

- (void)setNextUpdateCheck:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)usingModernUpdatesCheck
{
  return self->_usingModernUpdatesCheck;
}

- (void)setUsingModernUpdatesCheck:(BOOL)a3
{
  self->_usingModernUpdatesCheck = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextUpdateCheck, 0);
  objc_storeStrong((id *)&self->_lastUpdateCheck, 0);
}

@end
