@implementation BLTPBSectionIconVariant

- (BOOL)hasImageData
{
  return self->_imageData != 0;
}

- (void)setPrecomposed:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_precomposed = a3;
}

- (void)setHasPrecomposed:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPrecomposed
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSystemImageName
{
  return self->_systemImageName != 0;
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
  v8.super_class = (Class)BLTPBSectionIconVariant;
  -[BLTPBSectionIconVariant description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBSectionIconVariant dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *imageData;
  void *v6;
  NSString *systemImageName;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_format);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("format"));

  imageData = self->_imageData;
  if (imageData)
    objc_msgSend(v3, "setObject:forKey:", imageData, CFSTR("imageData"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_precomposed);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("precomposed"));

  }
  systemImageName = self->_systemImageName;
  if (systemImageName)
    objc_msgSend(v3, "setObject:forKey:", systemImageName, CFSTR("systemImageName"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBSectionIconVariantReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_imageData)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  v4 = v5;
  if (self->_systemImageName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  v4[2] = self->_format;
  v5 = v4;
  if (self->_imageData)
  {
    objc_msgSend(v4, "setImageData:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_BYTE *)v4 + 32) = self->_precomposed;
    *((_BYTE *)v4 + 36) |= 1u;
  }
  if (self->_systemImageName)
  {
    objc_msgSend(v5, "setSystemImageName:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 8) = self->_format;
  v6 = -[NSData copyWithZone:](self->_imageData, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 32) = self->_precomposed;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_systemImageName, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *imageData;
  char v6;
  NSString *systemImageName;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if (self->_format != *((_DWORD *)v4 + 2))
    goto LABEL_9;
  imageData = self->_imageData;
  if ((unint64_t)imageData | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](imageData, "isEqual:"))
      goto LABEL_9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) != 0)
    {
      if (self->_precomposed)
      {
        if (*((_BYTE *)v4 + 32))
          goto LABEL_15;
      }
      else if (!*((_BYTE *)v4 + 32))
      {
        goto LABEL_15;
      }
    }
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
    goto LABEL_9;
LABEL_15:
  systemImageName = self->_systemImageName;
  if ((unint64_t)systemImageName | *((_QWORD *)v4 + 3))
    v6 = -[NSString isEqual:](systemImageName, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  unsigned int format;
  uint64_t v4;
  uint64_t v5;

  format = self->_format;
  v4 = -[NSData hash](self->_imageData, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_precomposed;
  else
    v5 = 0;
  return v4 ^ v5 ^ -[NSString hash](self->_systemImageName, "hash") ^ (2654435761 * format);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  self->_format = *((_DWORD *)v4 + 2);
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[BLTPBSectionIconVariant setImageData:](self, "setImageData:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    self->_precomposed = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[BLTPBSectionIconVariant setSystemImageName:](self, "setSystemImageName:");
    v4 = v5;
  }

}

- (unsigned)format
{
  return self->_format;
}

- (void)setFormat:(unsigned int)a3
{
  self->_format = a3;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);
}

- (BOOL)precomposed
{
  return self->_precomposed;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void)setSystemImageName:(id)a3
{
  objc_storeStrong((id *)&self->_systemImageName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

+ (id)sectionIconVariantWithImageData:(id)a3 systemImageName:(id)a4 precomposed:(BOOL)a5 format:(unsigned int)a6
{
  uint64_t v6;
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = objc_alloc_init((Class)a1);
  objc_msgSend(v12, "setPrecomposed:", v7);
  objc_msgSend(v12, "setFormat:", v6);
  if (v10)
  {
    objc_msgSend(v12, "setImageData:", v10);
  }
  else if (v11)
  {
    objc_msgSend(v12, "setSystemImageName:", v11);
  }

  return v12;
}

@end
