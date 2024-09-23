@implementation AppleCV3DSchemaTrackingState

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

- (void)setHealth:(float)a3
{
  self->_health = a3;
}

- (void)setNumberInlierPoints:(unsigned int)a3
{
  self->_numberInlierPoints = a3;
}

- (void)setNumberOfRegularKeyframes:(unsigned int)a3
{
  self->_numberOfRegularKeyframes = a3;
}

- (void)setThreeDoFStateCode:(int)a3
{
  self->_threeDoFStateCode = a3;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return sub_20E88A3DC(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  float v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[AppleCV3DSchemaTrackingState mode](self, "mode"))
    PBDataWriterWriteInt32Field();
  -[AppleCV3DSchemaTrackingState health](self, "health");
  if (v4 != 0.0)
    PBDataWriterWriteFloatField();
  if (-[AppleCV3DSchemaTrackingState numberInlierPoints](self, "numberInlierPoints"))
    PBDataWriterWriteUint32Field();
  if (-[AppleCV3DSchemaTrackingState numberOfRegularKeyframes](self, "numberOfRegularKeyframes"))
    PBDataWriterWriteUint32Field();
  v5 = -[AppleCV3DSchemaTrackingState threeDoFStateCode](self, "threeDoFStateCode");
  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteInt32Field();
    v6 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int mode;
  float health;
  float v7;
  unsigned int numberInlierPoints;
  unsigned int numberOfRegularKeyframes;
  int threeDoFStateCode;
  BOOL v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (mode = self->_mode, mode == objc_msgSend(v4, "mode"))
    && (health = self->_health, objc_msgSend(v4, "health"), health == v7)
    && (numberInlierPoints = self->_numberInlierPoints,
        numberInlierPoints == objc_msgSend(v4, "numberInlierPoints"))
    && (numberOfRegularKeyframes = self->_numberOfRegularKeyframes,
        numberOfRegularKeyframes == objc_msgSend(v4, "numberOfRegularKeyframes")))
  {
    threeDoFStateCode = self->_threeDoFStateCode;
    v11 = threeDoFStateCode == objc_msgSend(v4, "threeDoFStateCode");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t mode;
  float health;
  BOOL v5;
  double v6;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;

  mode = self->_mode;
  health = self->_health;
  v5 = health < 0.0;
  if (health == 0.0)
  {
    v10 = 0;
  }
  else
  {
    v6 = health;
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
  return v10 ^ (2654435761 * self->_numberInlierPoints) ^ (2654435761 * mode) ^ (2654435761
                                                                                   * self->_numberOfRegularKeyframes) ^ (2654435761 * self->_threeDoFStateCode);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_health != 0.0)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    -[AppleCV3DSchemaTrackingState health](self, "health");
    objc_msgSend(v4, "numberWithFloat:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("health"));

  }
  if (self->_mode)
  {
    v6 = -[AppleCV3DSchemaTrackingState mode](self, "mode");
    if (v6 >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_24C9ABE88[(int)v6];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("mode"));

  }
  if (self->_numberInlierPoints)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[AppleCV3DSchemaTrackingState numberInlierPoints](self, "numberInlierPoints"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("numberInlierPoints"));

  }
  if (self->_numberOfRegularKeyframes)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[AppleCV3DSchemaTrackingState numberOfRegularKeyframes](self, "numberOfRegularKeyframes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("numberOfRegularKeyframes"));

  }
  if (self->_threeDoFStateCode)
  {
    v10 = -[AppleCV3DSchemaTrackingState threeDoFStateCode](self, "threeDoFStateCode");
    if (v10 >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_24C9ABEA8[(int)v10];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("threeDoFStateCode"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[AppleCV3DSchemaTrackingState dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (AppleCV3DSchemaTrackingState)initWithJSON:(id)a3
{
  void *v4;
  AppleCV3DSchemaTrackingState *v5;
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
    self = -[AppleCV3DSchemaTrackingState initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (AppleCV3DSchemaTrackingState)initWithDictionary:(id)a3
{
  id v4;
  AppleCV3DSchemaTrackingState *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  AppleCV3DSchemaTrackingState *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AppleCV3DSchemaTrackingState;
  v5 = -[AppleCV3DSchemaTrackingState init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AppleCV3DSchemaTrackingState setMode:](v5, "setMode:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("health"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[AppleCV3DSchemaTrackingState setHealth:](v5, "setHealth:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberInlierPoints"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AppleCV3DSchemaTrackingState setNumberInlierPoints:](v5, "setNumberInlierPoints:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfRegularKeyframes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AppleCV3DSchemaTrackingState setNumberOfRegularKeyframes:](v5, "setNumberOfRegularKeyframes:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("threeDoFStateCode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AppleCV3DSchemaTrackingState setThreeDoFStateCode:](v5, "setThreeDoFStateCode:", objc_msgSend(v10, "intValue"));
    v11 = v5;

  }
  return v5;
}

- (int)mode
{
  return self->_mode;
}

- (float)health
{
  return self->_health;
}

- (unsigned)numberInlierPoints
{
  return self->_numberInlierPoints;
}

- (unsigned)numberOfRegularKeyframes
{
  return self->_numberOfRegularKeyframes;
}

- (int)threeDoFStateCode
{
  return self->_threeDoFStateCode;
}

@end
