@implementation AppleCV3DSchemaRelocalizationSucceeded

- (void)setDescriptorType:(int)a3
{
  self->_descriptorType = a3;
}

- (void)setLocalizedSubmapId:(unint64_t)a3
{
  self->_localizedSubmapId = a3;
}

- (void)setTimeToLocalizationInSecond:(float)a3
{
  self->_timeToLocalizationInSecond = a3;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return sub_20E880BA4(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  float v5;
  id v6;

  v6 = a3;
  if (-[AppleCV3DSchemaRelocalizationSucceeded descriptorType](self, "descriptorType"))
    PBDataWriterWriteInt32Field();
  if (-[AppleCV3DSchemaRelocalizationSucceeded localizedSubmapId](self, "localizedSubmapId"))
    PBDataWriterWriteUint64Field();
  -[AppleCV3DSchemaRelocalizationSucceeded timeToLocalizationInSecond](self, "timeToLocalizationInSecond");
  v4 = v6;
  if (v5 != 0.0)
  {
    PBDataWriterWriteFloatField();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int descriptorType;
  unint64_t localizedSubmapId;
  float timeToLocalizationInSecond;
  float v8;
  BOOL v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (descriptorType = self->_descriptorType, descriptorType == objc_msgSend(v4, "descriptorType"))
    && (localizedSubmapId = self->_localizedSubmapId, localizedSubmapId == objc_msgSend(v4, "localizedSubmapId")))
  {
    timeToLocalizationInSecond = self->_timeToLocalizationInSecond;
    objc_msgSend(v4, "timeToLocalizationInSecond");
    v9 = timeToLocalizationInSecond == v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t descriptorType;
  unint64_t localizedSubmapId;
  float timeToLocalizationInSecond;
  BOOL v5;
  double v6;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;

  descriptorType = self->_descriptorType;
  localizedSubmapId = self->_localizedSubmapId;
  timeToLocalizationInSecond = self->_timeToLocalizationInSecond;
  v5 = timeToLocalizationInSecond < 0.0;
  if (timeToLocalizationInSecond == 0.0)
  {
    v10 = 0;
  }
  else
  {
    v6 = timeToLocalizationInSecond;
    v7 = -v6;
    if (!v5)
      v7 = v6;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v10 += (unint64_t)v9;
    }
    else
    {
      v10 -= (unint64_t)fabs(v9);
    }
  }
  return (2654435761u * localizedSubmapId) ^ (2654435761 * descriptorType) ^ v10;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_descriptorType)
  {
    v4 = -[AppleCV3DSchemaRelocalizationSucceeded descriptorType](self, "descriptorType");
    if (v4 >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_24C9ABE88[(int)v4];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("descriptorType"));

  }
  if (self->_localizedSubmapId)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[AppleCV3DSchemaRelocalizationSucceeded localizedSubmapId](self, "localizedSubmapId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("localizedSubmapId"));

  }
  if (self->_timeToLocalizationInSecond != 0.0)
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    -[AppleCV3DSchemaRelocalizationSucceeded timeToLocalizationInSecond](self, "timeToLocalizationInSecond");
    objc_msgSend(v7, "numberWithFloat:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("timeToLocalizationInSecond"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[AppleCV3DSchemaRelocalizationSucceeded dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSData *)v3;
  }
  else
  {

    return (NSData *)0;
  }
}

- (AppleCV3DSchemaRelocalizationSucceeded)initWithJSON:(id)a3
{
  void *v4;
  AppleCV3DSchemaRelocalizationSucceeded *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[AppleCV3DSchemaRelocalizationSucceeded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (AppleCV3DSchemaRelocalizationSucceeded)initWithDictionary:(id)a3
{
  id v4;
  AppleCV3DSchemaRelocalizationSucceeded *v5;
  void *v6;
  void *v7;
  void *v8;
  AppleCV3DSchemaRelocalizationSucceeded *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AppleCV3DSchemaRelocalizationSucceeded;
  v5 = -[AppleCV3DSchemaRelocalizationSucceeded init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("descriptorType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AppleCV3DSchemaRelocalizationSucceeded setDescriptorType:](v5, "setDescriptorType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localizedSubmapId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AppleCV3DSchemaRelocalizationSucceeded setLocalizedSubmapId:](v5, "setLocalizedSubmapId:", objc_msgSend(v7, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeToLocalizationInSecond"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[AppleCV3DSchemaRelocalizationSucceeded setTimeToLocalizationInSecond:](v5, "setTimeToLocalizationInSecond:");
    }
    v9 = v5;

  }
  return v5;
}

- (int)descriptorType
{
  return self->_descriptorType;
}

- (unint64_t)localizedSubmapId
{
  return self->_localizedSubmapId;
}

- (float)timeToLocalizationInSecond
{
  return self->_timeToLocalizationInSecond;
}

@end
