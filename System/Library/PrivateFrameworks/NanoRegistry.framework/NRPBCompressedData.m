@implementation NRPBCompressedData

- (void)setCompressed:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_compressed = a3;
}

- (void)setHasCompressed:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCompressed
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasPossiblyCompressedData
{
  return self->_possiblyCompressedData != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)NRPBCompressedData;
  -[NRPBCompressedData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPBCompressedData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *possiblyCompressedData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_compressed);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("compressed"));

  }
  possiblyCompressedData = self->_possiblyCompressedData;
  if (possiblyCompressedData)
    objc_msgSend(v3, "setObject:forKey:", possiblyCompressedData, CFSTR("possiblyCompressedData"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NRPBCompressedDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_possiblyCompressedData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[16] = self->_compressed;
    v4[20] |= 1u;
  }
  if (self->_possiblyCompressedData)
  {
    v5 = v4;
    objc_msgSend(v4, "setPossiblyCompressedData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 16) = self->_compressed;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_possiblyCompressedData, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  NSData *possiblyCompressedData;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0)
    {
      if (self->_compressed)
      {
        if (*((_BYTE *)v4 + 16))
          goto LABEL_12;
      }
      else if (!*((_BYTE *)v4 + 16))
      {
        goto LABEL_12;
      }
    }
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  if ((*((_BYTE *)v4 + 20) & 1) != 0)
    goto LABEL_6;
LABEL_12:
  possiblyCompressedData = self->_possiblyCompressedData;
  if ((unint64_t)possiblyCompressedData | *((_QWORD *)v4 + 1))
    v5 = -[NSData isEqual:](possiblyCompressedData, "isEqual:");
  else
    v5 = 1;
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_compressed;
  else
    v2 = 0;
  return -[NSData hash](self->_possiblyCompressedData, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if ((v4[20] & 1) != 0)
  {
    self->_compressed = v4[16];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[NRPBCompressedData setPossiblyCompressedData:](self, "setPossiblyCompressedData:");
    v4 = v5;
  }

}

- (BOOL)compressed
{
  return self->_compressed;
}

- (NSData)possiblyCompressedData
{
  return self->_possiblyCompressedData;
}

- (void)setPossiblyCompressedData:(id)a3
{
  objc_storeStrong((id *)&self->_possiblyCompressedData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possiblyCompressedData, 0);
}

@end
