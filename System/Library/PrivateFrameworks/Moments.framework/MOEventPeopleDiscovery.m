@implementation MOEventPeopleDiscovery

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 isGComplete;
  id v5;

  isGComplete = self->_isGComplete;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", isGComplete, CFSTR("isGComplete"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_gaPR, CFSTR("gPRelationship"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pCount, CFSTR("pC"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_densityScore, CFSTR("densityScore"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_densityScanDuration, CFSTR("densityScanDuration"));

}

- (MOEventPeopleDiscovery)initWithCoder:(id)a3
{
  id v4;
  MOEventPeopleDiscovery *v5;
  uint64_t v6;
  NSNumber *pCount;
  uint64_t v8;
  NSNumber *densityScore;
  uint64_t v10;
  NSNumber *densityScanDuration;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MOEventPeopleDiscovery;
  v5 = -[MOEventPeopleDiscovery init](&v13, sel_init);
  if (v5)
  {
    v5->_isGComplete = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isGComplete"));
    v5->_gaPR = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("gPRelationship"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pC"));
    v6 = objc_claimAutoreleasedReturnValue();
    pCount = v5->_pCount;
    v5->_pCount = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("densityScore"));
    v8 = objc_claimAutoreleasedReturnValue();
    densityScore = v5->_densityScore;
    v5->_densityScore = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("densityScanDuration"));
    v10 = objc_claimAutoreleasedReturnValue();
    densityScanDuration = v5->_densityScanDuration;
    v5->_densityScanDuration = (NSNumber *)v10;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOEventPeopleDiscovery *v4;

  v4 = objc_alloc_init(MOEventPeopleDiscovery);
  v4->_isGComplete = self->_isGComplete;
  v4->_gaPR = self->_gaPR;
  objc_storeStrong((id *)&v4->_pCount, self->_pCount);
  objc_storeStrong((id *)&v4->_densityScore, self->_densityScore);
  objc_storeStrong((id *)&v4->_densityScanDuration, self->_densityScanDuration);
  return v4;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("isGComplete, %d, pr, %lu, social context count, %@, density score, %@, scan duration, %@"), self->_isGComplete, self->_gaPR, self->_pCount, self->_densityScore, self->_densityScanDuration);
}

- (BOOL)isGComplete
{
  return self->_isGComplete;
}

- (void)setIsGComplete:(BOOL)a3
{
  self->_isGComplete = a3;
}

- (int64_t)gaPR
{
  return self->_gaPR;
}

- (void)setGaPR:(int64_t)a3
{
  self->_gaPR = a3;
}

- (NSNumber)pCount
{
  return self->_pCount;
}

- (void)setPCount:(id)a3
{
  objc_storeStrong((id *)&self->_pCount, a3);
}

- (NSNumber)densityScore
{
  return self->_densityScore;
}

- (void)setDensityScore:(id)a3
{
  objc_storeStrong((id *)&self->_densityScore, a3);
}

- (NSNumber)densityScanDuration
{
  return self->_densityScanDuration;
}

- (void)setDensityScanDuration:(id)a3
{
  objc_storeStrong((id *)&self->_densityScanDuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_densityScanDuration, 0);
  objc_storeStrong((id *)&self->_densityScore, 0);
  objc_storeStrong((id *)&self->_pCount, 0);
}

@end
