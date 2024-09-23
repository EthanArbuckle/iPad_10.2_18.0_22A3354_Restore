@implementation SPProtoSockPuppetObject

- (void)setSubtype:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_subtype = a3;
}

- (void)setHasSubtype:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSubtype
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasCacheMessage
{
  return self->_cacheMessage != 0;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasText
{
  return self->_text != 0;
}

- (void)setNdouble:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ndouble = a3;
}

- (void)setHasNdouble:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNdouble
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setNfloat:(float)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_nfloat = a3;
}

- (void)setHasNfloat:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNfloat
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setNint64:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_nint64 = a3;
}

- (void)setHasNint64:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNint64
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setNint32:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_nint32 = a3;
}

- (void)setHasNint32:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNint32
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setNuint64:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_nuint64 = a3;
}

- (void)setHasNuint64:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNuint64
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setNuint32:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_nuint32 = a3;
}

- (void)setHasNuint32:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasNuint32
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setNBOOL:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_nBOOL = a3;
}

- (void)setHasNBOOL:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasNBOOL
{
  return *(_BYTE *)&self->_has >> 7;
}

- (BOOL)hasObject
{
  return self->_object != 0;
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
  v8.super_class = (Class)SPProtoSockPuppetObject;
  -[SPProtoSockPuppetObject description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPProtoSockPuppetObject dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  SPProtoCacheMessage *cacheMessage;
  void *v8;
  NSString *key;
  NSString *text;
  char has;
  NSData *object;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("type"));

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_subtype);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("subtype"));

  }
  cacheMessage = self->_cacheMessage;
  if (cacheMessage)
  {
    -[SPProtoCacheMessage dictionaryRepresentation](cacheMessage, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("cacheMessage"));

  }
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  text = self->_text;
  if (text)
    objc_msgSend(v3, "setObject:forKey:", text, CFSTR("text"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_ndouble);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("ndouble"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 2) == 0)
        goto LABEL_12;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  *(float *)&v5 = self->_nfloat;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("nfloat"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_nint64);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("nint64"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 4) == 0)
      goto LABEL_14;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_nint32);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("nint32"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0)
      goto LABEL_15;
LABEL_24:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nuint32);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("nuint32"));

    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_25;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_nuint64);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("nuint64"));

  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_24;
LABEL_15:
  if ((has & 0x80) == 0)
    goto LABEL_16;
LABEL_25:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_nBOOL);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("nBOOL"));

LABEL_16:
  object = self->_object;
  if (object)
    objc_msgSend(v3, "setObject:forKey:", object, CFSTR("object"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoSockPuppetObjectReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char has;
  id v6;

  v6 = a3;
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_cacheMessage)
    PBDataWriterWriteSubmessage();
  v4 = v6;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_text)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 2) == 0)
        goto LABEL_12;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteFloatField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 4) == 0)
      goto LABEL_14;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0)
      goto LABEL_15;
LABEL_24:
    PBDataWriterWriteUint32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_25;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_24;
LABEL_15:
  if ((has & 0x80) == 0)
    goto LABEL_16;
LABEL_25:
  PBDataWriterWriteBOOLField();
  v4 = v6;
LABEL_16:
  if (self->_object)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  v4[22] = self->_type;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    v4[18] = self->_subtype;
    *((_BYTE *)v4 + 96) |= 0x40u;
  }
  v6 = v4;
  if (self->_cacheMessage)
  {
    objc_msgSend(v4, "setCacheMessage:");
    v4 = v6;
  }
  if (self->_key)
  {
    objc_msgSend(v6, "setKey:");
    v4 = v6;
  }
  if (self->_text)
  {
    objc_msgSend(v6, "setText:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_ndouble;
    *((_BYTE *)v4 + 96) |= 1u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 2) == 0)
        goto LABEL_12;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  v4[12] = LODWORD(self->_nfloat);
  *((_BYTE *)v4 + 96) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)v4 + 2) = self->_nint64;
  *((_BYTE *)v4 + 96) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 4) == 0)
      goto LABEL_14;
    goto LABEL_23;
  }
LABEL_22:
  v4[13] = self->_nint32;
  *((_BYTE *)v4 + 96) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0)
      goto LABEL_15;
LABEL_24:
    v4[14] = self->_nuint32;
    *((_BYTE *)v4 + 96) |= 0x20u;
    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_25;
  }
LABEL_23:
  *((_QWORD *)v4 + 3) = self->_nuint64;
  *((_BYTE *)v4 + 96) |= 4u;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_24;
LABEL_15:
  if ((has & 0x80) == 0)
    goto LABEL_16;
LABEL_25:
  *((_BYTE *)v4 + 92) = self->_nBOOL;
  *((_BYTE *)v4 + 96) |= 0x80u;
LABEL_16:
  if (self->_object)
  {
    objc_msgSend(v6, "setObject:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char has;
  uint64_t v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  *(_DWORD *)(v5 + 88) = self->_type;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_subtype;
    *(_BYTE *)(v5 + 96) |= 0x40u;
  }
  v7 = -[SPProtoCacheMessage copyWithZone:](self->_cacheMessage, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v7;

  v9 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v9;

  v11 = -[NSString copyWithZone:](self->_text, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v11;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v6 + 8) = self->_ndouble;
    *(_BYTE *)(v6 + 96) |= 1u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *(float *)(v6 + 48) = self->_nfloat;
  *(_BYTE *)(v6 + 96) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  *(_QWORD *)(v6 + 16) = self->_nint64;
  *(_BYTE *)(v6 + 96) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_14:
  *(_DWORD *)(v6 + 52) = self->_nint32;
  *(_BYTE *)(v6 + 96) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
LABEL_16:
    *(_DWORD *)(v6 + 56) = self->_nuint32;
    *(_BYTE *)(v6 + 96) |= 0x20u;
    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_10;
LABEL_17:
    *(_BYTE *)(v6 + 92) = self->_nBOOL;
    *(_BYTE *)(v6 + 96) |= 0x80u;
    goto LABEL_10;
  }
LABEL_15:
  *(_QWORD *)(v6 + 24) = self->_nuint64;
  *(_BYTE *)(v6 + 96) |= 4u;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_16;
LABEL_9:
  if (has < 0)
    goto LABEL_17;
LABEL_10:
  v14 = -[NSData copyWithZone:](self->_object, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v14;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SPProtoCacheMessage *cacheMessage;
  NSString *key;
  NSString *text;
  NSData *object;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) || self->_type != *((_DWORD *)v4 + 22))
    goto LABEL_49;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 0x40) == 0 || self->_subtype != *((_DWORD *)v4 + 18))
      goto LABEL_49;
  }
  else if ((*((_BYTE *)v4 + 96) & 0x40) != 0)
  {
    goto LABEL_49;
  }
  cacheMessage = self->_cacheMessage;
  if ((unint64_t)cacheMessage | *((_QWORD *)v4 + 4)
    && !-[SPProtoCacheMessage isEqual:](cacheMessage, "isEqual:"))
  {
    goto LABEL_49;
  }
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_49;
  }
  text = self->_text;
  if ((unint64_t)text | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](text, "isEqual:"))
      goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 1) == 0 || self->_ndouble != *((double *)v4 + 1))
      goto LABEL_49;
  }
  else if ((*((_BYTE *)v4 + 96) & 1) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 8) == 0 || self->_nfloat != *((float *)v4 + 12))
      goto LABEL_49;
  }
  else if ((*((_BYTE *)v4 + 96) & 8) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 2) == 0 || self->_nint64 != *((_QWORD *)v4 + 2))
      goto LABEL_49;
  }
  else if ((*((_BYTE *)v4 + 96) & 2) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 0x10) == 0 || self->_nint32 != *((_DWORD *)v4 + 13))
      goto LABEL_49;
  }
  else if ((*((_BYTE *)v4 + 96) & 0x10) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 4) == 0 || self->_nuint64 != *((_QWORD *)v4 + 3))
      goto LABEL_49;
  }
  else if ((*((_BYTE *)v4 + 96) & 4) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 0x20) == 0 || self->_nuint32 != *((_DWORD *)v4 + 14))
      goto LABEL_49;
  }
  else if ((*((_BYTE *)v4 + 96) & 0x20) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    if ((*((_BYTE *)v4 + 96) & 0x80) == 0)
      goto LABEL_46;
LABEL_49:
    v9 = 0;
    goto LABEL_50;
  }
  if ((*((_BYTE *)v4 + 96) & 0x80) == 0)
    goto LABEL_49;
  if (self->_nBOOL)
  {
    if (!*((_BYTE *)v4 + 92))
      goto LABEL_49;
  }
  else if (*((_BYTE *)v4 + 92))
  {
    goto LABEL_49;
  }
LABEL_46:
  object = self->_object;
  if ((unint64_t)object | *((_QWORD *)v4 + 8))
    v9 = -[NSData isEqual:](object, "isEqual:");
  else
    v9 = 1;
LABEL_50:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t type;
  unint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  char has;
  unint64_t v9;
  double ndouble;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  float nfloat;
  double v16;
  long double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    v3 = 2654435761 * self->_subtype;
  else
    v3 = 0;
  type = self->_type;
  v5 = -[SPProtoCacheMessage hash](self->_cacheMessage, "hash");
  v6 = -[NSString hash](self->_key, "hash");
  v7 = -[NSString hash](self->_text, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    ndouble = self->_ndouble;
    v11 = -ndouble;
    if (ndouble >= 0.0)
      v11 = self->_ndouble;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((has & 8) != 0)
  {
    nfloat = self->_nfloat;
    v16 = nfloat;
    if (nfloat < 0.0)
      v16 = -nfloat;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((has & 2) != 0)
  {
    v19 = 2654435761 * self->_nint64;
    if ((has & 0x10) != 0)
    {
LABEL_22:
      v20 = 2654435761 * self->_nint32;
      if ((has & 4) != 0)
        goto LABEL_23;
      goto LABEL_28;
    }
  }
  else
  {
    v19 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_22;
  }
  v20 = 0;
  if ((has & 4) != 0)
  {
LABEL_23:
    v21 = 2654435761u * self->_nuint64;
    if ((has & 0x20) != 0)
      goto LABEL_24;
LABEL_29:
    v22 = 0;
    if (has < 0)
      goto LABEL_25;
LABEL_30:
    v23 = 0;
    return v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ (2654435761 * type) ^ v14 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ -[NSData hash](self->_object, "hash");
  }
LABEL_28:
  v21 = 0;
  if ((has & 0x20) == 0)
    goto LABEL_29;
LABEL_24:
  v22 = 2654435761 * self->_nuint32;
  if ((has & 0x80) == 0)
    goto LABEL_30;
LABEL_25:
  v23 = 2654435761 * self->_nBOOL;
  return v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ (2654435761 * type) ^ v14 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ -[NSData hash](self->_object, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  SPProtoCacheMessage *cacheMessage;
  uint64_t v7;
  char v8;
  id v9;

  v4 = a3;
  v5 = v4;
  self->_type = v4[22];
  if ((v4[24] & 0x40) != 0)
  {
    self->_subtype = v4[18];
    *(_BYTE *)&self->_has |= 0x40u;
  }
  cacheMessage = self->_cacheMessage;
  v7 = *((_QWORD *)v5 + 4);
  v9 = v5;
  if (cacheMessage)
  {
    if (!v7)
      goto LABEL_9;
    -[SPProtoCacheMessage mergeFrom:](cacheMessage, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[SPProtoSockPuppetObject setCacheMessage:](self, "setCacheMessage:");
  }
  v5 = v9;
LABEL_9:
  if (*((_QWORD *)v5 + 5))
  {
    -[SPProtoSockPuppetObject setKey:](self, "setKey:");
    v5 = v9;
  }
  if (*((_QWORD *)v5 + 10))
  {
    -[SPProtoSockPuppetObject setText:](self, "setText:");
    v5 = v9;
  }
  v8 = *((_BYTE *)v5 + 96);
  if ((v8 & 1) != 0)
  {
    self->_ndouble = *((double *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v8 = *((_BYTE *)v5 + 96);
    if ((v8 & 8) == 0)
    {
LABEL_15:
      if ((v8 & 2) == 0)
        goto LABEL_16;
      goto LABEL_25;
    }
  }
  else if ((*((_BYTE *)v5 + 96) & 8) == 0)
  {
    goto LABEL_15;
  }
  self->_nfloat = *((float *)v5 + 12);
  *(_BYTE *)&self->_has |= 8u;
  v8 = *((_BYTE *)v5 + 96);
  if ((v8 & 2) == 0)
  {
LABEL_16:
    if ((v8 & 0x10) == 0)
      goto LABEL_17;
    goto LABEL_26;
  }
LABEL_25:
  self->_nint64 = *((_QWORD *)v5 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v8 = *((_BYTE *)v5 + 96);
  if ((v8 & 0x10) == 0)
  {
LABEL_17:
    if ((v8 & 4) == 0)
      goto LABEL_18;
    goto LABEL_27;
  }
LABEL_26:
  self->_nint32 = *((_DWORD *)v5 + 13);
  *(_BYTE *)&self->_has |= 0x10u;
  v8 = *((_BYTE *)v5 + 96);
  if ((v8 & 4) == 0)
  {
LABEL_18:
    if ((v8 & 0x20) == 0)
      goto LABEL_19;
LABEL_28:
    self->_nuint32 = *((_DWORD *)v5 + 14);
    *(_BYTE *)&self->_has |= 0x20u;
    if ((*((_BYTE *)v5 + 96) & 0x80) == 0)
      goto LABEL_20;
    goto LABEL_29;
  }
LABEL_27:
  self->_nuint64 = *((_QWORD *)v5 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v8 = *((_BYTE *)v5 + 96);
  if ((v8 & 0x20) != 0)
    goto LABEL_28;
LABEL_19:
  if ((v8 & 0x80) == 0)
    goto LABEL_20;
LABEL_29:
  self->_nBOOL = *((_BYTE *)v5 + 92);
  *(_BYTE *)&self->_has |= 0x80u;
LABEL_20:
  if (*((_QWORD *)v5 + 8))
  {
    -[SPProtoSockPuppetObject setObject:](self, "setObject:");
    v5 = v9;
  }

}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int)subtype
{
  return self->_subtype;
}

- (SPProtoCacheMessage)cacheMessage
{
  return self->_cacheMessage;
}

- (void)setCacheMessage:(id)a3
{
  objc_storeStrong((id *)&self->_cacheMessage, a3);
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (double)ndouble
{
  return self->_ndouble;
}

- (float)nfloat
{
  return self->_nfloat;
}

- (int64_t)nint64
{
  return self->_nint64;
}

- (int)nint32
{
  return self->_nint32;
}

- (unint64_t)nuint64
{
  return self->_nuint64;
}

- (unsigned)nuint32
{
  return self->_nuint32;
}

- (BOOL)nBOOL
{
  return self->_nBOOL;
}

- (NSData)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  objc_storeStrong((id *)&self->_object, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_object, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_cacheMessage, 0);
}

@end
