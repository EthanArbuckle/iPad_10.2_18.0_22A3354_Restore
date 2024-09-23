@implementation NPUsageReport

- (NPUsageReport)initWithSigningIdentifier:(id)a3 fallbackReason:(int64_t)a4
{
  id v7;
  NPUsageReport *v8;
  NPUsageReport *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NPUsageReport;
  v8 = -[NPUsageReport init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_signingIdentifier, a3);
    v9->_fallbackReason = a4;
    v9->_rtt = 0xFFFFFFFFLL;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPUsageReport)initWithCoder:(id)a3
{
  id v4;
  NPUsageReport *v5;
  uint64_t v6;
  NSUUID *dayPassUUID;
  uint64_t v8;
  NSString *geohash;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NPUsageReport;
  v5 = -[NPUsageReport init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dpuuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    dayPassUUID = v5->_dayPassUUID;
    v5->_dayPassUUID = (NSUUID *)v6;

    v5->_rtt = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rtt"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("geo"));
    v8 = objc_claimAutoreleasedReturnValue();
    geohash = v5->_geohash;
    v5->_geohash = (NSString *)v8;

    v5->_fallbackReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fb"));
    v5->_addressFamily = objc_msgSend(v4, "decodeIntForKey:", CFSTR("af"));
    v5->_edgeIndex = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("eidx"));
    v5->_keybagGeneration = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("gen"));
    v5->_waldoTimestamp = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("ts"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *dayPassUUID;
  id v5;

  dayPassUUID = self->_dayPassUUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dayPassUUID, CFSTR("dpuuid"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_rtt, CFSTR("rtt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_geohash, CFSTR("geo"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_fallbackReason, CFSTR("fb"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_addressFamily, CFSTR("af"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_edgeIndex, CFSTR("eidx"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_keybagGeneration, CFSTR("gen"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_waldoTimestamp, CFSTR("ts"));

}

- (NSString)signingIdentifier
{
  return self->_signingIdentifier;
}

- (int64_t)fallbackReason
{
  return self->_fallbackReason;
}

- (NSUUID)dayPassUUID
{
  return self->_dayPassUUID;
}

- (void)setDayPassUUID:(id)a3
{
  objc_storeStrong((id *)&self->_dayPassUUID, a3);
}

- (unint64_t)rtt
{
  return self->_rtt;
}

- (void)setRtt:(unint64_t)a3
{
  self->_rtt = a3;
}

- (NSString)geohash
{
  return self->_geohash;
}

- (void)setGeohash:(id)a3
{
  objc_storeStrong((id *)&self->_geohash, a3);
}

- (unsigned)addressFamily
{
  return self->_addressFamily;
}

- (void)setAddressFamily:(unsigned __int8)a3
{
  self->_addressFamily = a3;
}

- (unsigned)edgeIndex
{
  return self->_edgeIndex;
}

- (void)setEdgeIndex:(unsigned int)a3
{
  self->_edgeIndex = a3;
}

- (unsigned)keybagGeneration
{
  return self->_keybagGeneration;
}

- (void)setKeybagGeneration:(unsigned int)a3
{
  self->_keybagGeneration = a3;
}

- (unsigned)waldoTimestamp
{
  return self->_waldoTimestamp;
}

- (void)setWaldoTimestamp:(unsigned int)a3
{
  self->_waldoTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geohash, 0);
  objc_storeStrong((id *)&self->_dayPassUUID, 0);
  objc_storeStrong((id *)&self->_signingIdentifier, 0);
}

@end
