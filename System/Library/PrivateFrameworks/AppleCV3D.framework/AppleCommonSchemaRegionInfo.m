@implementation AppleCommonSchemaRegionInfo

- (void)setCountryCode:(int)a3
{
  self->_countryCode = a3;
}

- (void)setTimezone:(id)a3
{
  NSString *v4;
  NSString *timezone;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  timezone = self->_timezone;
  self->_timezone = v4;

}

- (void)setDate:(id)a3
{
  NSString *v4;
  NSString *date;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  date = self->_date;
  self->_date = v4;

}

- (BOOL)readFrom:(id)a3
{
  return sub_20E88F22C(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[AppleCommonSchemaRegionInfo countryCode](self, "countryCode"))
    PBDataWriterWriteInt32Field();
  -[AppleCommonSchemaRegionInfo timezone](self, "timezone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[AppleCommonSchemaRegionInfo date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int countryCode;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  countryCode = self->_countryCode;
  if (countryCode != objc_msgSend(v4, "countryCode"))
    goto LABEL_13;
  -[AppleCommonSchemaRegionInfo timezone](self, "timezone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timezone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[AppleCommonSchemaRegionInfo timezone](self, "timezone");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[AppleCommonSchemaRegionInfo timezone](self, "timezone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timezone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_13;
  }
  else
  {

  }
  -[AppleCommonSchemaRegionInfo date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[AppleCommonSchemaRegionInfo date](self, "date");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_16:
      v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    -[AppleCommonSchemaRegionInfo date](self, "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_16;
  }
  else
  {
LABEL_12:

  }
LABEL_13:
  v18 = 0;
LABEL_14:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  v3 = 2654435761 * self->_countryCode;
  v4 = -[NSString hash](self->_timezone, "hash");
  return v4 ^ -[NSString hash](self->_date, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_countryCode)
  {
    v4 = -[AppleCommonSchemaRegionInfo countryCode](self, "countryCode");
    if (v4 >= 0xFB)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_24C9ABED8[(int)v4];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("countryCode"));

  }
  if (self->_date)
  {
    -[AppleCommonSchemaRegionInfo date](self, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("date"));

  }
  if (self->_timezone)
  {
    -[AppleCommonSchemaRegionInfo timezone](self, "timezone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("timezone"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[AppleCommonSchemaRegionInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (AppleCommonSchemaRegionInfo)initWithJSON:(id)a3
{
  void *v4;
  AppleCommonSchemaRegionInfo *v5;
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
    self = -[AppleCommonSchemaRegionInfo initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (AppleCommonSchemaRegionInfo)initWithDictionary:(id)a3
{
  id v4;
  AppleCommonSchemaRegionInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  AppleCommonSchemaRegionInfo *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AppleCommonSchemaRegionInfo;
  v5 = -[AppleCommonSchemaRegionInfo init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countryCode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AppleCommonSchemaRegionInfo setCountryCode:](v5, "setCountryCode:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timezone"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[AppleCommonSchemaRegionInfo setTimezone:](v5, "setTimezone:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("date"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[AppleCommonSchemaRegionInfo setDate:](v5, "setDate:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (int)countryCode
{
  return self->_countryCode;
}

- (NSString)timezone
{
  return self->_timezone;
}

- (NSString)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_timezone, 0);
}

@end
