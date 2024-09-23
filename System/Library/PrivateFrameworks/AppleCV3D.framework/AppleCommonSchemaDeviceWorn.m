@implementation AppleCommonSchemaDeviceWorn

- (void)setSignal:(int)a3
{
  self->_signal = a3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_20E88D328(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[AppleCommonSchemaDeviceWorn signal](self, "signal"))
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int signal;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    signal = self->_signal;
    LOBYTE(signal) = signal == objc_msgSend(v4, "signal");

    return signal;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  return 2654435761 * self->_signal;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_signal)
  {
    v4 = -[AppleCommonSchemaDeviceWorn signal](self, "signal");
    if (v4 >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_24C9ABEC0[(int)v4];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("signal"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[AppleCommonSchemaDeviceWorn dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (AppleCommonSchemaDeviceWorn)initWithJSON:(id)a3
{
  void *v4;
  AppleCommonSchemaDeviceWorn *v5;
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
    self = -[AppleCommonSchemaDeviceWorn initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (AppleCommonSchemaDeviceWorn)initWithDictionary:(id)a3
{
  id v4;
  AppleCommonSchemaDeviceWorn *v5;
  void *v6;
  AppleCommonSchemaDeviceWorn *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AppleCommonSchemaDeviceWorn;
  v5 = -[AppleCommonSchemaDeviceWorn init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("signal"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AppleCommonSchemaDeviceWorn setSignal:](v5, "setSignal:", objc_msgSend(v6, "intValue"));
    v7 = v5;

  }
  return v5;
}

- (int)signal
{
  return self->_signal;
}

@end
