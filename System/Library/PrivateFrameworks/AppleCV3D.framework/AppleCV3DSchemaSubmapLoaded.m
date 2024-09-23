@implementation AppleCV3DSchemaSubmapLoaded

- (void)setSubmapId:(unint64_t)a3
{
  self->_submapId = a3;
}

- (void)setIsLocationAttached:(BOOL)a3
{
  self->_isLocationAttached = a3;
}

- (void)setBytesReadFromDisk:(unint64_t)a3
{
  self->_bytesReadFromDisk = a3;
}

- (void)setTimeToLoadSubmapInSecond:(float)a3
{
  self->_timeToLoadSubmapInSecond = a3;
}

- (void)setSecondsElapsedSinceLastActive:(float)a3
{
  self->_secondsElapsedSinceLastActive = a3;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return sub_20E883FA8(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  float v4;
  void *v5;
  float v6;
  id v7;

  v7 = a3;
  if (-[AppleCV3DSchemaSubmapLoaded submapId](self, "submapId"))
    PBDataWriterWriteUint64Field();
  if (-[AppleCV3DSchemaSubmapLoaded isLocationAttached](self, "isLocationAttached"))
    PBDataWriterWriteBOOLField();
  if (-[AppleCV3DSchemaSubmapLoaded bytesReadFromDisk](self, "bytesReadFromDisk"))
    PBDataWriterWriteUint64Field();
  -[AppleCV3DSchemaSubmapLoaded timeToLoadSubmapInSecond](self, "timeToLoadSubmapInSecond");
  if (v4 != 0.0)
    PBDataWriterWriteFloatField();
  -[AppleCV3DSchemaSubmapLoaded secondsElapsedSinceLastActive](self, "secondsElapsedSinceLastActive");
  v5 = v7;
  if (v6 != 0.0)
  {
    PBDataWriterWriteFloatField();
    v5 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t submapId;
  int isLocationAttached;
  unint64_t bytesReadFromDisk;
  float timeToLoadSubmapInSecond;
  float v9;
  BOOL v10;
  float secondsElapsedSinceLastActive;
  float v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (submapId = self->_submapId, submapId == objc_msgSend(v4, "submapId"))
    && (isLocationAttached = self->_isLocationAttached,
        isLocationAttached == objc_msgSend(v4, "isLocationAttached"))
    && (bytesReadFromDisk = self->_bytesReadFromDisk, bytesReadFromDisk == objc_msgSend(v4, "bytesReadFromDisk"))
    && (timeToLoadSubmapInSecond = self->_timeToLoadSubmapInSecond,
        objc_msgSend(v4, "timeToLoadSubmapInSecond"),
        timeToLoadSubmapInSecond == v9))
  {
    secondsElapsedSinceLastActive = self->_secondsElapsedSinceLastActive;
    objc_msgSend(v4, "secondsElapsedSinceLastActive");
    v10 = secondsElapsedSinceLastActive == v13;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t submapId;
  _BOOL4 isLocationAttached;
  unint64_t bytesReadFromDisk;
  float timeToLoadSubmapInSecond;
  BOOL v7;
  double v8;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;
  float secondsElapsedSinceLastActive;
  BOOL v14;
  double v15;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  uint64_t v20;

  submapId = self->_submapId;
  isLocationAttached = self->_isLocationAttached;
  bytesReadFromDisk = self->_bytesReadFromDisk;
  timeToLoadSubmapInSecond = self->_timeToLoadSubmapInSecond;
  v7 = timeToLoadSubmapInSecond < 0.0;
  if (timeToLoadSubmapInSecond == 0.0)
  {
    v12 = 0;
  }
  else
  {
    v8 = timeToLoadSubmapInSecond;
    v9 = -v8;
    if (!v7)
      v9 = v8;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v12 += (unint64_t)v11;
    }
    else
    {
      v12 -= (unint64_t)fabs(v11);
    }
  }
  secondsElapsedSinceLastActive = self->_secondsElapsedSinceLastActive;
  v14 = secondsElapsedSinceLastActive < 0.0;
  if (secondsElapsedSinceLastActive == 0.0)
  {
    v19 = 0;
  }
  else
  {
    v15 = secondsElapsedSinceLastActive;
    v16 = -v15;
    if (!v14)
      v16 = v15;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v19 += (unint64_t)v18;
    }
    else
    {
      v19 -= (unint64_t)fabs(v18);
    }
  }
  if (isLocationAttached)
    v20 = 2654435761;
  else
    v20 = 0;
  return v20 ^ (2654435761u * submapId) ^ (2654435761u * bytesReadFromDisk) ^ v12 ^ v19;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_bytesReadFromDisk)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[AppleCV3DSchemaSubmapLoaded bytesReadFromDisk](self, "bytesReadFromDisk"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("bytesReadFromDisk"));

  }
  if (self->_isLocationAttached)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AppleCV3DSchemaSubmapLoaded isLocationAttached](self, "isLocationAttached"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isLocationAttached"));

  }
  if (self->_secondsElapsedSinceLastActive != 0.0)
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    -[AppleCV3DSchemaSubmapLoaded secondsElapsedSinceLastActive](self, "secondsElapsedSinceLastActive");
    objc_msgSend(v6, "numberWithFloat:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("secondsElapsedSinceLastActive"));

  }
  if (self->_submapId)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[AppleCV3DSchemaSubmapLoaded submapId](self, "submapId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("submapId"));

  }
  if (self->_timeToLoadSubmapInSecond != 0.0)
  {
    v9 = (void *)MEMORY[0x24BDD16E0];
    -[AppleCV3DSchemaSubmapLoaded timeToLoadSubmapInSecond](self, "timeToLoadSubmapInSecond");
    objc_msgSend(v9, "numberWithFloat:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("timeToLoadSubmapInSecond"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[AppleCV3DSchemaSubmapLoaded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (AppleCV3DSchemaSubmapLoaded)initWithJSON:(id)a3
{
  void *v4;
  AppleCV3DSchemaSubmapLoaded *v5;
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
    self = -[AppleCV3DSchemaSubmapLoaded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (AppleCV3DSchemaSubmapLoaded)initWithDictionary:(id)a3
{
  id v4;
  AppleCV3DSchemaSubmapLoaded *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  AppleCV3DSchemaSubmapLoaded *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AppleCV3DSchemaSubmapLoaded;
  v5 = -[AppleCV3DSchemaSubmapLoaded init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("submapId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AppleCV3DSchemaSubmapLoaded setSubmapId:](v5, "setSubmapId:", objc_msgSend(v6, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isLocationAttached"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AppleCV3DSchemaSubmapLoaded setIsLocationAttached:](v5, "setIsLocationAttached:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bytesReadFromDisk"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AppleCV3DSchemaSubmapLoaded setBytesReadFromDisk:](v5, "setBytesReadFromDisk:", objc_msgSend(v8, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeToLoadSubmapInSecond"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "floatValue");
      -[AppleCV3DSchemaSubmapLoaded setTimeToLoadSubmapInSecond:](v5, "setTimeToLoadSubmapInSecond:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondsElapsedSinceLastActive"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "floatValue");
      -[AppleCV3DSchemaSubmapLoaded setSecondsElapsedSinceLastActive:](v5, "setSecondsElapsedSinceLastActive:");
    }
    v11 = v5;

  }
  return v5;
}

- (unint64_t)submapId
{
  return self->_submapId;
}

- (BOOL)isLocationAttached
{
  return self->_isLocationAttached;
}

- (unint64_t)bytesReadFromDisk
{
  return self->_bytesReadFromDisk;
}

- (float)timeToLoadSubmapInSecond
{
  return self->_timeToLoadSubmapInSecond;
}

- (float)secondsElapsedSinceLastActive
{
  return self->_secondsElapsedSinceLastActive;
}

@end
