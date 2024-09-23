@implementation AppleCommonSchemaMetadata

- (void)setBootSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_bootSessionId, a3);
}

- (void)setTimestampSinceBootInNanosecond:(unint64_t)a3
{
  self->_timestampSinceBootInNanosecond = a3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_20E88E0B4(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AppleCommonSchemaMetadata bootSessionId](self, "bootSessionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  if (-[AppleCommonSchemaMetadata timestampSinceBootInNanosecond](self, "timestampSinceBootInNanosecond"))
    PBDataWriterWriteUint64Field();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  unint64_t timestampSinceBootInNanosecond;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[AppleCommonSchemaMetadata bootSessionId](self, "bootSessionId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bootSessionId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[AppleCommonSchemaMetadata bootSessionId](self, "bootSessionId");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        timestampSinceBootInNanosecond = self->_timestampSinceBootInNanosecond;
        v13 = timestampSinceBootInNanosecond == objc_msgSend(v4, "timestampSinceBootInNanosecond");
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[AppleCommonSchemaMetadata bootSessionId](self, "bootSessionId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bootSessionId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (v12)
        goto LABEL_10;
    }
    else
    {

    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (unint64_t)hash
{
  return (2654435761u * self->_timestampSinceBootInNanosecond) ^ -[AppleCommonSchemaUUID128 hash](self->_bootSessionId, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_bootSessionId)
  {
    -[AppleCommonSchemaMetadata bootSessionId](self, "bootSessionId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("bootSessionId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("bootSessionId"));

    }
  }
  if (self->_timestampSinceBootInNanosecond)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[AppleCommonSchemaMetadata timestampSinceBootInNanosecond](self, "timestampSinceBootInNanosecond"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("timestampSinceBootInNanosecond"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[AppleCommonSchemaMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (AppleCommonSchemaMetadata)initWithJSON:(id)a3
{
  void *v4;
  AppleCommonSchemaMetadata *v5;
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
    self = -[AppleCommonSchemaMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (AppleCommonSchemaMetadata)initWithDictionary:(id)a3
{
  id v4;
  AppleCommonSchemaMetadata *v5;
  void *v6;
  AppleCommonSchemaUUID128 *v7;
  void *v8;
  AppleCommonSchemaMetadata *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AppleCommonSchemaMetadata;
  v5 = -[AppleCommonSchemaMetadata init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bootSessionId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[AppleCommonSchemaUUID128 initWithDictionary:]([AppleCommonSchemaUUID128 alloc], "initWithDictionary:", v6);
      -[AppleCommonSchemaMetadata setBootSessionId:](v5, "setBootSessionId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestampSinceBootInNanosecond"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AppleCommonSchemaMetadata setTimestampSinceBootInNanosecond:](v5, "setTimestampSinceBootInNanosecond:", objc_msgSend(v8, "unsignedLongLongValue"));
    v9 = v5;

  }
  return v5;
}

- (AppleCommonSchemaUUID128)bootSessionId
{
  return self->_bootSessionId;
}

- (unint64_t)timestampSinceBootInNanosecond
{
  return self->_timestampSinceBootInNanosecond;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bootSessionId, 0);
}

@end
