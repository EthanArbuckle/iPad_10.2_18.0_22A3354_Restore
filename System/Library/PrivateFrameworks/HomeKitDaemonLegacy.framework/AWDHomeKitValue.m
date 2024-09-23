@implementation AWDHomeKitValue

- (BOOL)hasStringVal
{
  return self->_stringVal != 0;
}

- (void)setIntVal:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_intVal = a3;
}

- (void)setHasIntVal:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIntVal
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setFloatVal:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_floatVal = a3;
}

- (void)setHasFloatVal:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFloatVal
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setDoubleVal:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_doubleVal = a3;
}

- (void)setHasDoubleVal:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDoubleVal
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setBoolVal:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_BOOLVal = a3;
}

- (void)setHasBoolVal:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasBoolVal
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasDataVal
{
  return self->_dataVal != 0;
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
  v8.super_class = (Class)AWDHomeKitValue;
  -[AWDHomeKitValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSString *stringVal;
  char has;
  void *v8;
  NSData *dataVal;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  stringVal = self->_stringVal;
  if (stringVal)
    objc_msgSend(v3, "setObject:forKey:", stringVal, CFSTR("stringVal"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_intVal);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("intVal"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *(float *)&v4 = self->_floatVal;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("floatVal"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_doubleVal);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("doubleVal"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_BOOLVal);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("BOOLVal"));

  }
LABEL_8:
  dataVal = self->_dataVal;
  if (dataVal)
    objc_msgSend(v5, "setObject:forKey:", dataVal, CFSTR("dataVal"));
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return AWDHomeKitValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_stringVal)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteFloatField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_13:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_8:
  if (self->_dataVal)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_stringVal)
  {
    objc_msgSend(v4, "setStringVal:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_intVal;
    *((_BYTE *)v4 + 52) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 8) = LODWORD(self->_floatVal);
  *((_BYTE *)v4 + 52) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_13:
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_doubleVal;
  *((_BYTE *)v4 + 52) |= 1u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    *((_BYTE *)v4 + 48) = self->_BOOLVal;
    *((_BYTE *)v4 + 52) |= 8u;
  }
LABEL_8:
  if (self->_dataVal)
  {
    objc_msgSend(v6, "setDataVal:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_stringVal, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_intVal;
    *(_BYTE *)(v5 + 52) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_9:
      *(double *)(v5 + 8) = self->_doubleVal;
      *(_BYTE *)(v5 + 52) |= 1u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(float *)(v5 + 32) = self->_floatVal;
  *(_BYTE *)(v5 + 52) |= 4u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(_BYTE *)(v5 + 48) = self->_BOOLVal;
    *(_BYTE *)(v5 + 52) |= 8u;
  }
LABEL_6:
  v9 = -[NSData copyWithZone:](self->_dataVal, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *stringVal;
  char v6;
  NSData *dataVal;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  stringVal = self->_stringVal;
  if ((unint64_t)stringVal | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](stringVal, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_intVal != *((_QWORD *)v4 + 2))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0 || self->_floatVal != *((float *)v4 + 8))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_doubleVal != *((double *)v4 + 1))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    if ((*((_BYTE *)v4 + 52) & 8) == 0)
      goto LABEL_29;
LABEL_23:
    v6 = 0;
    goto LABEL_24;
  }
  if ((*((_BYTE *)v4 + 52) & 8) == 0)
    goto LABEL_23;
  if (!self->_BOOLVal)
  {
    if (!*((_BYTE *)v4 + 48))
      goto LABEL_29;
    goto LABEL_23;
  }
  if (!*((_BYTE *)v4 + 48))
    goto LABEL_23;
LABEL_29:
  dataVal = self->_dataVal;
  if ((unint64_t)dataVal | *((_QWORD *)v4 + 3))
    v6 = -[NSData isEqual:](dataVal, "isEqual:");
  else
    v6 = 1;
LABEL_24:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  uint64_t v5;
  float floatVal;
  float v7;
  float v8;
  float v9;
  unint64_t v10;
  unint64_t v11;
  double doubleVal;
  double v13;
  long double v14;
  double v15;
  uint64_t v16;

  v3 = -[NSString hash](self->_stringVal, "hash");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = 2654435761 * self->_intVal;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_8:
    v10 = 0;
    goto LABEL_11;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_3:
  floatVal = self->_floatVal;
  v7 = -floatVal;
  if (floatVal >= 0.0)
    v7 = self->_floatVal;
  v8 = floorf(v7 + 0.5);
  v9 = (float)(v7 - v8) * 1.8447e19;
  v10 = 2654435761u * (unint64_t)fmodf(v8, 1.8447e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabsf(v9);
  }
LABEL_11:
  if ((has & 1) != 0)
  {
    doubleVal = self->_doubleVal;
    v13 = -doubleVal;
    if (doubleVal >= 0.0)
      v13 = self->_doubleVal;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  if ((has & 8) != 0)
    v16 = 2654435761 * self->_BOOLVal;
  else
    v16 = 0;
  return v5 ^ v3 ^ v10 ^ v11 ^ v16 ^ -[NSData hash](self->_dataVal, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[AWDHomeKitValue setStringVal:](self, "setStringVal:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 2) != 0)
  {
    self->_intVal = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 52);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_floatVal = *((float *)v4 + 8);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_13:
  self->_doubleVal = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 52) & 8) != 0)
  {
LABEL_7:
    self->_BOOLVal = *((_BYTE *)v4 + 48);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_8:
  if (*((_QWORD *)v4 + 3))
  {
    -[AWDHomeKitValue setDataVal:](self, "setDataVal:");
    v4 = v6;
  }

}

- (NSString)stringVal
{
  return self->_stringVal;
}

- (void)setStringVal:(id)a3
{
  objc_storeStrong((id *)&self->_stringVal, a3);
}

- (int64_t)intVal
{
  return self->_intVal;
}

- (float)floatVal
{
  return self->_floatVal;
}

- (double)doubleVal
{
  return self->_doubleVal;
}

- (BOOL)BOOLVal
{
  return self->_BOOLVal;
}

- (NSData)dataVal
{
  return self->_dataVal;
}

- (void)setDataVal:(id)a3
{
  objc_storeStrong((id *)&self->_dataVal, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringVal, 0);
  objc_storeStrong((id *)&self->_dataVal, 0);
}

@end
