@implementation NTPBScoreProfiles

- (void)dealloc
{
  objc_super v3;

  -[NTPBScoreProfiles setDefaultScoreProfile:](self, "setDefaultScoreProfile:", 0);
  -[NTPBScoreProfiles setForYouGroupScoreProfile:](self, "setForYouGroupScoreProfile:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBScoreProfiles;
  -[NTPBScoreProfiles dealloc](&v3, sel_dealloc);
}

- (BOOL)hasDefaultScoreProfile
{
  return self->_defaultScoreProfile != 0;
}

- (BOOL)hasForYouGroupScoreProfile
{
  return self->_forYouGroupScoreProfile != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBScoreProfiles;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBScoreProfiles description](&v3, sel_description), -[NTPBScoreProfiles dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NTPBScoreProfile *defaultScoreProfile;
  NTPBScoreProfile *forYouGroupScoreProfile;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  defaultScoreProfile = self->_defaultScoreProfile;
  if (defaultScoreProfile)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBScoreProfile dictionaryRepresentation](defaultScoreProfile, "dictionaryRepresentation"), CFSTR("defaultScoreProfile"));
  forYouGroupScoreProfile = self->_forYouGroupScoreProfile;
  if (forYouGroupScoreProfile)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBScoreProfile dictionaryRepresentation](forYouGroupScoreProfile, "dictionaryRepresentation"), CFSTR("forYouGroupScoreProfile"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBScoreProfilesReadFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (self->_defaultScoreProfile)
    PBDataWriterWriteSubmessage();
  if (self->_forYouGroupScoreProfile)
    PBDataWriterWriteSubmessage();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;

  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = -[NTPBScoreProfile copyWithZone:](self->_defaultScoreProfile, "copyWithZone:", a3);
  v5[2] = -[NTPBScoreProfile copyWithZone:](self->_forYouGroupScoreProfile, "copyWithZone:", a3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NTPBScoreProfile *defaultScoreProfile;
  NTPBScoreProfile *forYouGroupScoreProfile;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    defaultScoreProfile = self->_defaultScoreProfile;
    if (!((unint64_t)defaultScoreProfile | *((_QWORD *)a3 + 1))
      || (v5 = -[NTPBScoreProfile isEqual:](defaultScoreProfile, "isEqual:")) != 0)
    {
      forYouGroupScoreProfile = self->_forYouGroupScoreProfile;
      if ((unint64_t)forYouGroupScoreProfile | *((_QWORD *)a3 + 2))
        LOBYTE(v5) = -[NTPBScoreProfile isEqual:](forYouGroupScoreProfile, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[NTPBScoreProfile hash](self->_defaultScoreProfile, "hash");
  return -[NTPBScoreProfile hash](self->_forYouGroupScoreProfile, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  NTPBScoreProfile *defaultScoreProfile;
  uint64_t v6;
  NTPBScoreProfile *forYouGroupScoreProfile;
  uint64_t v8;

  defaultScoreProfile = self->_defaultScoreProfile;
  v6 = *((_QWORD *)a3 + 1);
  if (defaultScoreProfile)
  {
    if (v6)
      -[NTPBScoreProfile mergeFrom:](defaultScoreProfile, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBScoreProfiles setDefaultScoreProfile:](self, "setDefaultScoreProfile:");
  }
  forYouGroupScoreProfile = self->_forYouGroupScoreProfile;
  v8 = *((_QWORD *)a3 + 2);
  if (forYouGroupScoreProfile)
  {
    if (v8)
      -[NTPBScoreProfile mergeFrom:](forYouGroupScoreProfile, "mergeFrom:");
  }
  else if (v8)
  {
    -[NTPBScoreProfiles setForYouGroupScoreProfile:](self, "setForYouGroupScoreProfile:");
  }
}

- (NTPBScoreProfile)defaultScoreProfile
{
  return self->_defaultScoreProfile;
}

- (void)setDefaultScoreProfile:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NTPBScoreProfile)forYouGroupScoreProfile
{
  return self->_forYouGroupScoreProfile;
}

- (void)setForYouGroupScoreProfile:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
