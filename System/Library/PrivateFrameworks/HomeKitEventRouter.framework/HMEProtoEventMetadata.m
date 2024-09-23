@implementation HMEProtoEventMetadata

- (BOOL)hasSource
{
  return self->_source != 0;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setCachePolicy:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_cachePolicy = a3;
}

- (void)setHasCachePolicy:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCachePolicy
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCombinePolicy:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_combinePolicy = a3;
}

- (void)setHasCombinePolicy:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCombinePolicy
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setQos:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_qos = a3;
}

- (void)setHasQos:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasQos
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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
  v8.super_class = (Class)HMEProtoEventMetadata;
  -[HMEProtoEventMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMEProtoEventMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *source;
  char has;
  void *v7;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  source = self->_source;
  if (source)
    objc_msgSend(v3, "setObject:forKey:", source, CFSTR("source"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
LABEL_11:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_combinePolicy);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("combinePolicy"));

      if ((*(_BYTE *)&self->_has & 8) == 0)
        return v4;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_cachePolicy);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("cachePolicy"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_qos);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("qos"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HMEProtoEventMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_source)
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
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
LABEL_11:
      PBDataWriterWriteUint32Field();
      v4 = v6;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_8:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  if (self->_source)
  {
    v6 = v4;
    objc_msgSend(v4, "setSource:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v4 + 40) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
LABEL_11:
      *((_DWORD *)v4 + 5) = self->_combinePolicy;
      *((_BYTE *)v4 + 40) |= 4u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 4) = self->_cachePolicy;
  *((_BYTE *)v4 + 40) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 6) = self->_qos;
    *((_BYTE *)v4 + 40) |= 8u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_source, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 40) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      *(_DWORD *)(v5 + 20) = self->_combinePolicy;
      *(_BYTE *)(v5 + 40) |= 4u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        return (id)v5;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_cachePolicy;
  *(_BYTE *)(v5 + 40) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 24) = self->_qos;
    *(_BYTE *)(v5 + 40) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *source;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  source = self->_source;
  if ((unint64_t)source | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](source, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_timestamp != *((double *)v4 + 1))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_23:
    v6 = 0;
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_cachePolicy != *((_DWORD *)v4 + 4))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_combinePolicy != *((_DWORD *)v4 + 5))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_23;
  }
  v6 = (*((_BYTE *)v4 + 40) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) == 0 || self->_qos != *((_DWORD *)v4 + 6))
      goto LABEL_23;
    v6 = 1;
  }
LABEL_24:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  unint64_t v5;
  double timestamp;
  double v7;
  long double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = -[NSString hash](self->_source, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    timestamp = self->_timestamp;
    v7 = -timestamp;
    if (timestamp >= 0.0)
      v7 = self->_timestamp;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((has & 2) == 0)
  {
    v10 = 0;
    if ((has & 4) != 0)
      goto LABEL_11;
LABEL_14:
    v11 = 0;
    if ((has & 8) != 0)
      goto LABEL_12;
LABEL_15:
    v12 = 0;
    return v5 ^ v3 ^ v10 ^ v11 ^ v12;
  }
  v10 = 2654435761 * self->_cachePolicy;
  if ((has & 4) == 0)
    goto LABEL_14;
LABEL_11:
  v11 = 2654435761 * self->_combinePolicy;
  if ((has & 8) == 0)
    goto LABEL_15;
LABEL_12:
  v12 = 2654435761 * self->_qos;
  return v5 ^ v3 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if (*((_QWORD *)v4 + 4))
  {
    v6 = v4;
    -[HMEProtoEventMetadata setSource:](self, "setSource:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0)
        goto LABEL_6;
LABEL_11:
      self->_combinePolicy = *((_DWORD *)v4 + 5);
      *(_BYTE *)&self->_has |= 4u;
      if ((*((_BYTE *)v4 + 40) & 8) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_cachePolicy = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 4) != 0)
    goto LABEL_11;
LABEL_6:
  if ((v5 & 8) != 0)
  {
LABEL_7:
    self->_qos = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_8:

}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (unsigned)cachePolicy
{
  return self->_cachePolicy;
}

- (unsigned)combinePolicy
{
  return self->_combinePolicy;
}

- (unsigned)qos
{
  return self->_qos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
}

@end
