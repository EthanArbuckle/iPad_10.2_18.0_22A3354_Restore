@implementation MPPMediaPredicateValue

- (void)dealloc
{
  objc_super v3;

  -[MPPMediaPredicateValue setStringPredicateValue:](self, "setStringPredicateValue:", 0);
  -[MPPMediaPredicateValue setBytesPredicateValue:](self, "setBytesPredicateValue:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MPPMediaPredicateValue;
  -[MPPMediaPredicateValue dealloc](&v3, sel_dealloc);
}

- (void)setIntegerPredicateValue:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_integerPredicateValue = a3;
}

- (void)setHasIntegerPredicateValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIntegerPredicateValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDoublePredicateValue:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_doublePredicateValue = a3;
}

- (void)setHasDoublePredicateValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDoublePredicateValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setFloatPredicateValue:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_floatPredicateValue = a3;
}

- (void)setHasFloatPredicateValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFloatPredicateValue
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setBoolPredicateValue:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_BOOLPredicateValue = a3;
}

- (void)setHasBoolPredicateValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasBoolPredicateValue
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasStringPredicateValue
{
  return self->_stringPredicateValue != 0;
}

- (BOOL)hasBytesPredicateValue
{
  return self->_bytesPredicateValue != 0;
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
  v8.super_class = (Class)MPPMediaPredicateValue;
  -[MPPMediaPredicateValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPPMediaPredicateValue dictionaryRepresentation](self, "dictionaryRepresentation");
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
  char has;
  void *v7;
  NSString *stringPredicateValue;
  NSData *bytesPredicateValue;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("type"));

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_integerPredicateValue);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("integerPredicateValue"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_doublePredicateValue);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("doublePredicateValue"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  *(float *)&v5 = self->_floatPredicateValue;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("floatPredicateValue"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_BOOLPredicateValue);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("BOOLPredicateValue"));

  }
LABEL_6:
  stringPredicateValue = self->_stringPredicateValue;
  if (stringPredicateValue)
    objc_msgSend(v3, "setObject:forKey:", stringPredicateValue, CFSTR("stringPredicateValue"));
  bytesPredicateValue = self->_bytesPredicateValue;
  if (bytesPredicateValue)
    objc_msgSend(v3, "setObject:forKey:", bytesPredicateValue, CFSTR("bytesPredicateValue"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MPPMediaPredicateValueReadFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  double v4;
  char has;
  void *v6;
  NSString *stringPredicateValue;
  NSData *bytesPredicateValue;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "writeInt32:forTag:", self->_type, 1);
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v9, "writeInt64:forTag:", self->_integerPredicateValue, 2);
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(v9, "writeDouble:forTag:", 3, self->_doublePredicateValue);
    has = (char)self->_has;
  }
  v6 = v9;
  if ((has & 4) != 0)
  {
    *(float *)&v4 = self->_floatPredicateValue;
    objc_msgSend(v9, "writeFloat:forTag:", 4, v4);
    v6 = v9;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(v9, "writeBOOL:forTag:", self->_BOOLPredicateValue, 5);
    v6 = v9;
  }
  stringPredicateValue = self->_stringPredicateValue;
  if (stringPredicateValue)
  {
    objc_msgSend(v9, "writeString:forTag:", stringPredicateValue, 6);
    v6 = v9;
  }
  bytesPredicateValue = self->_bytesPredicateValue;
  if (bytesPredicateValue)
  {
    objc_msgSend(v9, "writeData:forTag:", bytesPredicateValue, 7);
    v6 = v9;
  }

}

- (void)copyTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setType:", -[MPPMediaPredicateValue type](self, "type"));
  if (-[MPPMediaPredicateValue hasIntegerPredicateValue](self, "hasIntegerPredicateValue"))
    objc_msgSend(v6, "setIntegerPredicateValue:", -[MPPMediaPredicateValue integerPredicateValue](self, "integerPredicateValue"));
  if (-[MPPMediaPredicateValue hasDoublePredicateValue](self, "hasDoublePredicateValue"))
  {
    -[MPPMediaPredicateValue doublePredicateValue](self, "doublePredicateValue");
    objc_msgSend(v6, "setDoublePredicateValue:");
  }
  if (-[MPPMediaPredicateValue hasFloatPredicateValue](self, "hasFloatPredicateValue"))
  {
    -[MPPMediaPredicateValue floatPredicateValue](self, "floatPredicateValue");
    objc_msgSend(v6, "setFloatPredicateValue:");
  }
  if (-[MPPMediaPredicateValue hasBoolPredicateValue](self, "hasBoolPredicateValue"))
    objc_msgSend(v6, "setBoolPredicateValue:", -[MPPMediaPredicateValue BOOLPredicateValue](self, "BOOLPredicateValue"));
  if (-[MPPMediaPredicateValue hasStringPredicateValue](self, "hasStringPredicateValue"))
  {
    -[MPPMediaPredicateValue stringPredicateValue](self, "stringPredicateValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStringPredicateValue:", v4);

  }
  if (-[MPPMediaPredicateValue hasBytesPredicateValue](self, "hasBytesPredicateValue"))
  {
    -[MPPMediaPredicateValue bytesPredicateValue](self, "bytesPredicateValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBytesPredicateValue:", v5);

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  *(_DWORD *)(v5 + 48) = self->_type;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_integerPredicateValue;
    *(_BYTE *)(v5 + 56) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      *(float *)(v5 + 32) = self->_floatPredicateValue;
      *(_BYTE *)(v5 + 56) |= 4u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 8) = self->_doublePredicateValue;
  *(_BYTE *)(v5 + 56) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(_BYTE *)(v5 + 52) = self->_BOOLPredicateValue;
    *(_BYTE *)(v5 + 56) |= 8u;
  }
LABEL_6:
  v8 = -[NSString copyWithZone:](self->_stringPredicateValue, "copyWithZone:", a3);
  v9 = (void *)v6[5];
  v6[5] = v8;

  v10 = -[NSData copyWithZone:](self->_bytesPredicateValue, "copyWithZone:", a3);
  v11 = (void *)v6[3];
  v6[3] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  NSString *stringPredicateValue;
  NSData *bytesPredicateValue;
  char v7;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) || self->_type != *((_DWORD *)v4 + 12))
    goto LABEL_27;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[56] & 2) == 0 || self->_integerPredicateValue != *((_QWORD *)v4 + 2))
      goto LABEL_27;
  }
  else if ((v4[56] & 2) != 0)
  {
LABEL_27:
    v7 = 0;
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[56] & 1) == 0 || self->_doublePredicateValue != *((double *)v4 + 1))
      goto LABEL_27;
  }
  else if ((v4[56] & 1) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[56] & 4) == 0 || self->_floatPredicateValue != *((float *)v4 + 8))
      goto LABEL_27;
  }
  else if ((v4[56] & 4) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[56] & 8) == 0 || self->_BOOLPredicateValue != v4[52])
      goto LABEL_27;
  }
  else if ((v4[56] & 8) != 0)
  {
    goto LABEL_27;
  }
  stringPredicateValue = self->_stringPredicateValue;
  if ((unint64_t)stringPredicateValue | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](stringPredicateValue, "isEqual:"))
  {
    goto LABEL_27;
  }
  bytesPredicateValue = self->_bytesPredicateValue;
  if ((unint64_t)bytesPredicateValue | *((_QWORD *)v4 + 3))
    v7 = -[NSData isEqual:](bytesPredicateValue, "isEqual:");
  else
    v7 = 1;
LABEL_28:

  return v7;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  uint64_t type;
  unint64_t v6;
  double doublePredicateValue;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  float floatPredicateValue;
  double v13;
  long double v14;
  double v15;
  uint64_t v16;
  NSUInteger v17;

  has = (char)self->_has;
  if ((has & 2) != 0)
    v4 = 2654435761 * self->_integerPredicateValue;
  else
    v4 = 0;
  type = self->_type;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    doublePredicateValue = self->_doublePredicateValue;
    v8 = -doublePredicateValue;
    if (doublePredicateValue >= 0.0)
      v8 = self->_doublePredicateValue;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((has & 4) != 0)
  {
    floatPredicateValue = self->_floatPredicateValue;
    v13 = floatPredicateValue;
    if (floatPredicateValue < 0.0)
      v13 = -floatPredicateValue;
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
    v16 = 2654435761 * self->_BOOLPredicateValue;
  else
    v16 = 0;
  v17 = v4 ^ v6 ^ v11 ^ v16 ^ -[NSString hash](self->_stringPredicateValue, "hash");
  return v17 ^ -[NSData hash](self->_bytesPredicateValue, "hash") ^ (2654435761 * type);
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int64_t)integerPredicateValue
{
  return self->_integerPredicateValue;
}

- (double)doublePredicateValue
{
  return self->_doublePredicateValue;
}

- (float)floatPredicateValue
{
  return self->_floatPredicateValue;
}

- (BOOL)BOOLPredicateValue
{
  return self->_BOOLPredicateValue;
}

- (NSString)stringPredicateValue
{
  return self->_stringPredicateValue;
}

- (void)setStringPredicateValue:(id)a3
{
  objc_storeStrong((id *)&self->_stringPredicateValue, a3);
}

- (NSData)bytesPredicateValue
{
  return self->_bytesPredicateValue;
}

- (void)setBytesPredicateValue:(id)a3
{
  objc_storeStrong((id *)&self->_bytesPredicateValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringPredicateValue, 0);
  objc_storeStrong((id *)&self->_bytesPredicateValue, 0);
}

@end
