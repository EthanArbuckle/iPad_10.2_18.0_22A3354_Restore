@implementation BCSEmailLogoParquetMessage

- (BOOL)hasBusinessId
{
  return self->_businessId != 0;
}

- (BOOL)hasLogoFormat
{
  return self->_logoFormat != 0;
}

- (BOOL)hasLogo
{
  return self->_logo != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)BCSEmailLogoParquetMessage;
  -[BCSEmailLogoParquetMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSEmailLogoParquetMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *businessId;
  NSString *logoFormat;
  NSData *logo;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  businessId = self->_businessId;
  if (businessId)
    objc_msgSend(v3, "setObject:forKey:", businessId, CFSTR("business_id"));
  logoFormat = self->_logoFormat;
  if (logoFormat)
    objc_msgSend(v4, "setObject:forKey:", logoFormat, CFSTR("logo_format"));
  logo = self->_logo;
  if (logo)
    objc_msgSend(v4, "setObject:forKey:", logo, CFSTR("logo"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  unint64_t v18;
  objc_class *v19;
  uint64_t v20;
  void *v21;

  v4 = (int *)MEMORY[0x24BE7AF60];
  v5 = (int *)MEMORY[0x24BE7AF50];
  v6 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF50]))
  {
    v8 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*((_BYTE *)a3 + *v6))
        return *((_BYTE *)a3 + *v6) == 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = *v4;
        v13 = *(_QWORD *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v13);
        *(_QWORD *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v9 += 7;
        if (v10++ >= 9)
        {
          v11 = 0;
          v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v11 = 0;
LABEL_14:
      if (v16 || (v11 & 7) == 4)
        return *((_BYTE *)a3 + *v6) == 0;
      v18 = v11 >> 3;
      if ((v11 >> 3) == 3)
        break;
      if ((_DWORD)v18 == 2)
      {
        PBReaderReadString();
        v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v20 = 24;
        goto LABEL_24;
      }
      if ((_DWORD)v18 == 1)
      {
        PBReaderReadString();
        v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v20 = 8;
LABEL_24:
        v21 = *(Class *)((char *)&self->super.super.isa + v20);
        *(Class *)((char *)&self->super.super.isa + v20) = v19;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
        return *((_BYTE *)a3 + *v6) == 0;
    }
    PBReaderReadData();
    v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v20 = 16;
    goto LABEL_24;
  }
  return *((_BYTE *)a3 + *v6) == 0;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_businessId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_logoFormat)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_logo)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_businessId)
  {
    objc_msgSend(v4, "setBusinessId:");
    v4 = v5;
  }
  if (self->_logoFormat)
  {
    objc_msgSend(v5, "setLogoFormat:");
    v4 = v5;
  }
  if (self->_logo)
  {
    objc_msgSend(v5, "setLogo:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_businessId, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_logoFormat, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSData copyWithZone:](self->_logo, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *businessId;
  NSString *logoFormat;
  NSData *logo;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((businessId = self->_businessId, !((unint64_t)businessId | v4[1]))
     || -[NSString isEqual:](businessId, "isEqual:"))
    && ((logoFormat = self->_logoFormat, !((unint64_t)logoFormat | v4[3]))
     || -[NSString isEqual:](logoFormat, "isEqual:")))
  {
    logo = self->_logo;
    if ((unint64_t)logo | v4[2])
      v8 = -[NSData isEqual:](logo, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_businessId, "hash");
  v4 = -[NSString hash](self->_logoFormat, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_logo, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[BCSEmailLogoParquetMessage setBusinessId:](self, "setBusinessId:");
  if (v4[3])
    -[BCSEmailLogoParquetMessage setLogoFormat:](self, "setLogoFormat:");
  if (v4[2])
    -[BCSEmailLogoParquetMessage setLogo:](self, "setLogo:");

}

- (NSString)businessId
{
  return self->_businessId;
}

- (void)setBusinessId:(id)a3
{
  objc_storeStrong((id *)&self->_businessId, a3);
}

- (NSString)logoFormat
{
  return self->_logoFormat;
}

- (void)setLogoFormat:(id)a3
{
  objc_storeStrong((id *)&self->_logoFormat, a3);
}

- (NSData)logo
{
  return self->_logo;
}

- (void)setLogo:(id)a3
{
  objc_storeStrong((id *)&self->_logo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoFormat, 0);
  objc_storeStrong((id *)&self->_logo, 0);
  objc_storeStrong((id *)&self->_businessId, 0);
}

@end
