@implementation NTPBPersonalizedSectionPresenceConfig

- (void)dealloc
{
  objc_super v3;

  -[NTPBPersonalizedSectionPresenceConfig setRelativeConfig:](self, "setRelativeConfig:", 0);
  -[NTPBPersonalizedSectionPresenceConfig setAbsoluteConfig:](self, "setAbsoluteConfig:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizedSectionPresenceConfig;
  -[NTPBPersonalizedSectionPresenceConfig dealloc](&v3, sel_dealloc);
}

- (int)personalizationMethod
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_personalizationMethod;
  else
    return 0;
}

- (void)setPersonalizationMethod:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_personalizationMethod = a3;
}

- (void)setHasPersonalizationMethod:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPersonalizationMethod
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasRelativeConfig
{
  return self->_relativeConfig != 0;
}

- (BOOL)hasAbsoluteConfig
{
  return self->_absoluteConfig != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizedSectionPresenceConfig;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBPersonalizedSectionPresenceConfig description](&v3, sel_description), -[NTPBPersonalizedSectionPresenceConfig dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NTPBRelativePersonalizedSectionPresenceConfig *relativeConfig;
  NTPBAbsolutePersonalizedSectionPresenceConfig *absoluteConfig;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_personalizationMethod), CFSTR("personalization_method"));
  relativeConfig = self->_relativeConfig;
  if (relativeConfig)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRelativePersonalizedSectionPresenceConfig dictionaryRepresentation](relativeConfig, "dictionaryRepresentation"), CFSTR("relative_config"));
  absoluteConfig = self->_absoluteConfig;
  if (absoluteConfig)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBAbsolutePersonalizedSectionPresenceConfig dictionaryRepresentation](absoluteConfig, "dictionaryRepresentation"), CFSTR("absolute_config"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPersonalizedSectionPresenceConfigReadFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_relativeConfig)
    PBDataWriterWriteSubmessage();
  if (self->_absoluteConfig)
    PBDataWriterWriteSubmessage();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_personalizationMethod;
    *(_BYTE *)(v5 + 32) |= 1u;
  }

  *(_QWORD *)(v6 + 24) = -[NTPBRelativePersonalizedSectionPresenceConfig copyWithZone:](self->_relativeConfig, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 8) = -[NTPBAbsolutePersonalizedSectionPresenceConfig copyWithZone:](self->_absoluteConfig, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NTPBRelativePersonalizedSectionPresenceConfig *relativeConfig;
  NTPBAbsolutePersonalizedSectionPresenceConfig *absoluteConfig;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_personalizationMethod != *((_DWORD *)a3 + 4))
        goto LABEL_11;
    }
    else if ((*((_BYTE *)a3 + 32) & 1) != 0)
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    relativeConfig = self->_relativeConfig;
    if (!((unint64_t)relativeConfig | *((_QWORD *)a3 + 3))
      || (v5 = -[NTPBRelativePersonalizedSectionPresenceConfig isEqual:](relativeConfig, "isEqual:")) != 0)
    {
      absoluteConfig = self->_absoluteConfig;
      if ((unint64_t)absoluteConfig | *((_QWORD *)a3 + 1))
        LOBYTE(v5) = -[NTPBAbsolutePersonalizedSectionPresenceConfig isEqual:](absoluteConfig, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_personalizationMethod;
  else
    v3 = 0;
  v4 = -[NTPBRelativePersonalizedSectionPresenceConfig hash](self->_relativeConfig, "hash") ^ v3;
  return v4 ^ -[NTPBAbsolutePersonalizedSectionPresenceConfig hash](self->_absoluteConfig, "hash");
}

- (void)mergeFrom:(id)a3
{
  NTPBRelativePersonalizedSectionPresenceConfig *relativeConfig;
  uint64_t v6;
  NTPBAbsolutePersonalizedSectionPresenceConfig *absoluteConfig;
  uint64_t v8;

  if ((*((_BYTE *)a3 + 32) & 1) != 0)
  {
    self->_personalizationMethod = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  relativeConfig = self->_relativeConfig;
  v6 = *((_QWORD *)a3 + 3);
  if (relativeConfig)
  {
    if (v6)
      -[NTPBRelativePersonalizedSectionPresenceConfig mergeFrom:](relativeConfig, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBPersonalizedSectionPresenceConfig setRelativeConfig:](self, "setRelativeConfig:");
  }
  absoluteConfig = self->_absoluteConfig;
  v8 = *((_QWORD *)a3 + 1);
  if (absoluteConfig)
  {
    if (v8)
      -[NTPBAbsolutePersonalizedSectionPresenceConfig mergeFrom:](absoluteConfig, "mergeFrom:");
  }
  else if (v8)
  {
    -[NTPBPersonalizedSectionPresenceConfig setAbsoluteConfig:](self, "setAbsoluteConfig:");
  }
}

- (NTPBRelativePersonalizedSectionPresenceConfig)relativeConfig
{
  return self->_relativeConfig;
}

- (void)setRelativeConfig:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NTPBAbsolutePersonalizedSectionPresenceConfig)absoluteConfig
{
  return self->_absoluteConfig;
}

- (void)setAbsoluteConfig:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
