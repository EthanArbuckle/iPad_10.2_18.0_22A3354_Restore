@implementation _DKPRValue

- (uint64_t)type
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

- (uint64_t)setIntegerValue:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 56) |= 4u;
    *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

- (void)setType:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)setStringValue:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_blobValue, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  void *v6;
  id v7;

  v4 = a3;
  if (!self->_type)
    -[_DKPRValue writeTo:].cold.1();
  v7 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_stringValue)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
  }
  v6 = v7;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v6 = v7;
  }
  if (self->_blobValue)
  {
    PBDataWriterWriteDataField();
    v6 = v7;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v6 = v7;
  }

}

- (uint64_t)setDoubleValue:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 56) |= 2u;
    *(double *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setDateValue:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 56) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
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
  v8.super_class = (Class)_DKPRValue;
  -[_DKPRValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPRValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _DKPRValueType *type;
  void *v5;
  NSString *stringValue;
  char has;
  void *v8;
  void *v9;
  NSData *blobValue;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  if (type)
  {
    -[_DKPRValueType dictionaryRepresentation](type, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

  }
  stringValue = self->_stringValue;
  if (stringValue)
    objc_msgSend(v3, "setObject:forKey:", stringValue, CFSTR("stringValue"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_integerValue);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("integerValue"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_doubleValue);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("doubleValue"));

  }
  blobValue = self->_blobValue;
  if (blobValue)
    objc_msgSend(v3, "setObject:forKey:", blobValue, CFSTR("blobValue"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dateValue);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("dateValue"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _DKPRValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)setBlobValue:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_DKPRValueType copyWithZone:](self->_type, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[NSString copyWithZone:](self->_stringValue, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_integerValue;
    *(_BYTE *)(v5 + 56) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_doubleValue;
    *(_BYTE *)(v5 + 56) |= 2u;
  }
  v11 = -[NSData copyWithZone:](self->_blobValue, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_dateValue;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _DKPRValueType *type;
  NSString *stringValue;
  char has;
  NSData *blobValue;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  type = self->_type;
  if ((unint64_t)type | *((_QWORD *)v4 + 6))
  {
    if (!-[_DKPRValueType isEqual:](type, "isEqual:"))
      goto LABEL_23;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:"))
      goto LABEL_23;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_integerValue != *((_QWORD *)v4 + 3))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_doubleValue != *((double *)v4 + 2))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_23;
  }
  blobValue = self->_blobValue;
  if ((unint64_t)blobValue | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](blobValue, "isEqual:"))
    {
LABEL_23:
      v9 = 0;
      goto LABEL_24;
    }
    has = (char)self->_has;
  }
  v9 = (*((_BYTE *)v4 + 56) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_dateValue != *((double *)v4 + 1))
      goto LABEL_23;
    v9 = 1;
  }
LABEL_24:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  double doubleValue;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  double dateValue;
  double v14;
  long double v15;
  double v16;

  v3 = -[_DKPRValueType hash](self->_type, "hash");
  v4 = -[NSString hash](self->_stringValue, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5 = 2654435761 * self->_integerValue;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v10 = 0;
    goto LABEL_11;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  doubleValue = self->_doubleValue;
  v7 = -doubleValue;
  if (doubleValue >= 0.0)
    v7 = self->_doubleValue;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_11:
  v11 = -[NSData hash](self->_blobValue, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    dateValue = self->_dateValue;
    v14 = -dateValue;
    if (dateValue >= 0.0)
      v14 = self->_dateValue;
    v15 = floor(v14 + 0.5);
    v16 = (v14 - v15) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v12 += (unint64_t)v16;
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    v12 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v10 ^ v11 ^ v12;
}

- (uint64_t)stringValue
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (uint64_t)integerValue
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (double)doubleValue
{
  if (a1)
    return *(double *)(a1 + 16);
  else
    return 0.0;
}

- (uint64_t)blobValue
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (double)dateValue
{
  if (a1)
    return *(double *)(a1 + 8);
  else
    return 0.0;
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[_DKPRValue writeTo:]", "_DKPRValue.m", 188, "self->_type != nil");
}

@end
