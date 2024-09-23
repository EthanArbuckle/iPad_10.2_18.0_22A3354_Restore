@implementation AppleCV3DSchemaSubmapCreated

- (void)setSubmapId:(unint64_t)a3
{
  self->_submapId = a3;
}

- (void)setIsLocationAttached:(BOOL)a3
{
  self->_isLocationAttached = a3;
}

- (void)setBytesWrittenToDisk:(unint64_t)a3
{
  self->_bytesWrittenToDisk = a3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_20E8824B8(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  unint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[AppleCV3DSchemaSubmapCreated submapId](self, "submapId"))
    PBDataWriterWriteUint64Field();
  if (-[AppleCV3DSchemaSubmapCreated isLocationAttached](self, "isLocationAttached"))
    PBDataWriterWriteBOOLField();
  v4 = -[AppleCV3DSchemaSubmapCreated bytesWrittenToDisk](self, "bytesWrittenToDisk");
  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteUint64Field();
    v5 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t submapId;
  int isLocationAttached;
  unint64_t bytesWrittenToDisk;
  BOOL v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (submapId = self->_submapId, submapId == objc_msgSend(v4, "submapId"))
    && (isLocationAttached = self->_isLocationAttached,
        isLocationAttached == objc_msgSend(v4, "isLocationAttached")))
  {
    bytesWrittenToDisk = self->_bytesWrittenToDisk;
    v8 = bytesWrittenToDisk == objc_msgSend(v4, "bytesWrittenToDisk");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v2;

  if (self->_isLocationAttached)
    v2 = 2654435761;
  else
    v2 = 0;
  return v2 ^ (2654435761u * self->_submapId) ^ (2654435761u * self->_bytesWrittenToDisk);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_bytesWrittenToDisk)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[AppleCV3DSchemaSubmapCreated bytesWrittenToDisk](self, "bytesWrittenToDisk"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("bytesWrittenToDisk"));

  }
  if (self->_isLocationAttached)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AppleCV3DSchemaSubmapCreated isLocationAttached](self, "isLocationAttached"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isLocationAttached"));

  }
  if (self->_submapId)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[AppleCV3DSchemaSubmapCreated submapId](self, "submapId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("submapId"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[AppleCV3DSchemaSubmapCreated dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (AppleCV3DSchemaSubmapCreated)initWithJSON:(id)a3
{
  void *v4;
  AppleCV3DSchemaSubmapCreated *v5;
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
    self = -[AppleCV3DSchemaSubmapCreated initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (AppleCV3DSchemaSubmapCreated)initWithDictionary:(id)a3
{
  id v4;
  AppleCV3DSchemaSubmapCreated *v5;
  void *v6;
  void *v7;
  void *v8;
  AppleCV3DSchemaSubmapCreated *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AppleCV3DSchemaSubmapCreated;
  v5 = -[AppleCV3DSchemaSubmapCreated init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("submapId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AppleCV3DSchemaSubmapCreated setSubmapId:](v5, "setSubmapId:", objc_msgSend(v6, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isLocationAttached"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AppleCV3DSchemaSubmapCreated setIsLocationAttached:](v5, "setIsLocationAttached:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bytesWrittenToDisk"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AppleCV3DSchemaSubmapCreated setBytesWrittenToDisk:](v5, "setBytesWrittenToDisk:", objc_msgSend(v8, "unsignedLongLongValue"));
    v9 = v5;

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

- (unint64_t)bytesWrittenToDisk
{
  return self->_bytesWrittenToDisk;
}

@end
