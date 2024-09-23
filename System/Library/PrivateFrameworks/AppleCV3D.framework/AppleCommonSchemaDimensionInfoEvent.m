@implementation AppleCommonSchemaDimensionInfoEvent

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void)setDeviceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_deviceInfo, a3);
}

- (void)setRegionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_regionInfo, a3);
}

- (BOOL)readFrom:(id)a3
{
  return sub_20E88EDBC(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AppleCommonSchemaDimensionInfoEvent metadata](self, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[AppleCommonSchemaDimensionInfoEvent deviceInfo](self, "deviceInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[AppleCommonSchemaDimensionInfoEvent regionInfo](self, "regionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[AppleCommonSchemaDimensionInfoEvent metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[AppleCommonSchemaDimensionInfoEvent metadata](self, "metadata");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[AppleCommonSchemaDimensionInfoEvent metadata](self, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[AppleCommonSchemaDimensionInfoEvent deviceInfo](self, "deviceInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[AppleCommonSchemaDimensionInfoEvent deviceInfo](self, "deviceInfo");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[AppleCommonSchemaDimensionInfoEvent deviceInfo](self, "deviceInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[AppleCommonSchemaDimensionInfoEvent regionInfo](self, "regionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "regionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[AppleCommonSchemaDimensionInfoEvent regionInfo](self, "regionInfo");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[AppleCommonSchemaDimensionInfoEvent regionInfo](self, "regionInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "regionInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[AppleCommonSchemaMetadata hash](self->_metadata, "hash");
  v4 = -[AppleCommonSchemaDeviceInfo hash](self->_deviceInfo, "hash") ^ v3;
  return v4 ^ -[AppleCommonSchemaRegionInfo hash](self->_regionInfo, "hash");
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
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_deviceInfo)
  {
    -[AppleCommonSchemaDimensionInfoEvent deviceInfo](self, "deviceInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("deviceInfo"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("deviceInfo"));

    }
  }
  if (self->_metadata)
  {
    -[AppleCommonSchemaDimensionInfoEvent metadata](self, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("metadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("metadata"));

    }
  }
  if (self->_regionInfo)
  {
    -[AppleCommonSchemaDimensionInfoEvent regionInfo](self, "regionInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("regionInfo"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("regionInfo"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[AppleCommonSchemaDimensionInfoEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (AppleCommonSchemaDimensionInfoEvent)initWithJSON:(id)a3
{
  void *v4;
  AppleCommonSchemaDimensionInfoEvent *v5;
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
    self = -[AppleCommonSchemaDimensionInfoEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (AppleCommonSchemaDimensionInfoEvent)initWithDictionary:(id)a3
{
  id v4;
  AppleCommonSchemaDimensionInfoEvent *v5;
  void *v6;
  AppleCommonSchemaMetadata *v7;
  void *v8;
  AppleCommonSchemaDeviceInfo *v9;
  void *v10;
  AppleCommonSchemaRegionInfo *v11;
  AppleCommonSchemaDimensionInfoEvent *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AppleCommonSchemaDimensionInfoEvent;
  v5 = -[AppleCommonSchemaDimensionInfoEvent init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[AppleCommonSchemaMetadata initWithDictionary:]([AppleCommonSchemaMetadata alloc], "initWithDictionary:", v6);
      -[AppleCommonSchemaDimensionInfoEvent setMetadata:](v5, "setMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[AppleCommonSchemaDeviceInfo initWithDictionary:]([AppleCommonSchemaDeviceInfo alloc], "initWithDictionary:", v8);
      -[AppleCommonSchemaDimensionInfoEvent setDeviceInfo:](v5, "setDeviceInfo:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("regionInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[AppleCommonSchemaRegionInfo initWithDictionary:]([AppleCommonSchemaRegionInfo alloc], "initWithDictionary:", v10);
      -[AppleCommonSchemaDimensionInfoEvent setRegionInfo:](v5, "setRegionInfo:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (AppleCommonSchemaMetadata)metadata
{
  return self->_metadata;
}

- (AppleCommonSchemaDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (AppleCommonSchemaRegionInfo)regionInfo
{
  return self->_regionInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionInfo, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
