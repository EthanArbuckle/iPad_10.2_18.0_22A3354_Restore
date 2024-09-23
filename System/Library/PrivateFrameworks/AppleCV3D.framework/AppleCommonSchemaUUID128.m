@implementation AppleCommonSchemaUUID128

- (void)setValue:(id)a3
{
  NSData *v4;
  NSData *value;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  value = self->_value;
  self->_value = v4;

}

- (BOOL)readFrom:(id)a3
{
  return sub_20E8900A8(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AppleCommonSchemaUUID128 value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteDataField();

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
  char v12;
  BOOL v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[AppleCommonSchemaUUID128 value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[AppleCommonSchemaUUID128 value](self, "value");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[AppleCommonSchemaUUID128 value](self, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) != 0)
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
  return -[NSData hash](self->_value, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_value)
  {
    -[AppleCommonSchemaUUID128 value](self, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("value"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("value"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[AppleCommonSchemaUUID128 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (AppleCommonSchemaUUID128)initWithJSON:(id)a3
{
  void *v4;
  AppleCommonSchemaUUID128 *v5;
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
    self = -[AppleCommonSchemaUUID128 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (AppleCommonSchemaUUID128)initWithDictionary:(id)a3
{
  id v4;
  AppleCommonSchemaUUID128 *v5;
  void *v6;
  void *v7;
  AppleCommonSchemaUUID128 *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AppleCommonSchemaUUID128;
  v5 = -[AppleCommonSchemaUUID128 init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v6, 0);
      -[AppleCommonSchemaUUID128 setValue:](v5, "setValue:", v7);

    }
    v8 = v5;

  }
  return v5;
}

- (NSData)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
