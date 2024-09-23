@implementation AppleCV3DSchemaDon

- (BOOL)readFrom:(id)a3
{
  return sub_20E87EFF0((uint64_t)self, (uint64_t)a3);
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class());

  return v4;
}

- (unint64_t)hash
{
  return 0;
}

- (id)dictionaryRepresentation
{
  return (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[AppleCV3DSchemaDon dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (AppleCV3DSchemaDon)initWithJSON:(id)a3
{
  void *v4;
  AppleCV3DSchemaDon *v5;
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
    self = -[AppleCV3DSchemaDon initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (AppleCV3DSchemaDon)initWithDictionary:(id)a3
{
  AppleCV3DSchemaDon *v3;
  AppleCV3DSchemaDon *v4;
  AppleCV3DSchemaDon *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AppleCV3DSchemaDon;
  v3 = -[AppleCV3DSchemaDon init](&v7, sel_init, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

@end
