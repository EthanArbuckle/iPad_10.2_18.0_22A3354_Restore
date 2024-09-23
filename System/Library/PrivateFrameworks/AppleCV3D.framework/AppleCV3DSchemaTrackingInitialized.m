@implementation AppleCV3DSchemaTrackingInitialized

- (void)setSecondsToInitializeTracking:(float)a3
{
  self->_secondsToInitializeTracking = a3;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return sub_20E886DB0(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  float v4;
  id v5;

  v5 = a3;
  -[AppleCV3DSchemaTrackingInitialized secondsToInitializeTracking](self, "secondsToInitializeTracking");
  if (v4 != 0.0)
    PBDataWriterWriteFloatField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float secondsToInitializeTracking;
  float v6;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    secondsToInitializeTracking = self->_secondsToInitializeTracking;
    objc_msgSend(v4, "secondsToInitializeTracking");
    v7 = secondsToInitializeTracking == v6;

    return v7;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  float secondsToInitializeTracking;
  BOOL v3;
  double v4;
  double v5;
  long double v6;
  double v7;
  unint64_t result;

  secondsToInitializeTracking = self->_secondsToInitializeTracking;
  v3 = secondsToInitializeTracking < 0.0;
  if (secondsToInitializeTracking == 0.0)
    return 0;
  v4 = secondsToInitializeTracking;
  v5 = -v4;
  if (!v3)
    v5 = v4;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  result = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      result += (unint64_t)v7;
  }
  else
  {
    result -= (unint64_t)fabs(v7);
  }
  return result;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_secondsToInitializeTracking != 0.0)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    -[AppleCV3DSchemaTrackingInitialized secondsToInitializeTracking](self, "secondsToInitializeTracking");
    objc_msgSend(v4, "numberWithFloat:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("secondsToInitializeTracking"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[AppleCV3DSchemaTrackingInitialized dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (AppleCV3DSchemaTrackingInitialized)initWithJSON:(id)a3
{
  void *v4;
  AppleCV3DSchemaTrackingInitialized *v5;
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
    self = -[AppleCV3DSchemaTrackingInitialized initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (AppleCV3DSchemaTrackingInitialized)initWithDictionary:(id)a3
{
  id v4;
  AppleCV3DSchemaTrackingInitialized *v5;
  void *v6;
  AppleCV3DSchemaTrackingInitialized *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AppleCV3DSchemaTrackingInitialized;
  v5 = -[AppleCV3DSchemaTrackingInitialized init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondsToInitializeTracking"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      -[AppleCV3DSchemaTrackingInitialized setSecondsToInitializeTracking:](v5, "setSecondsToInitializeTracking:");
    }
    v7 = v5;

  }
  return v5;
}

- (float)secondsToInitializeTracking
{
  return self->_secondsToInitializeTracking;
}

@end
