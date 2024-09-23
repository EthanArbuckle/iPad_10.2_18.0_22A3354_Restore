@implementation CLPPrivacySanitization

- (int)tripSegmentType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_tripSegmentType;
  else
    return 0;
}

- (void)setTripSegmentType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_tripSegmentType = a3;
}

- (void)setHasTripSegmentType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTripSegmentType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)tripSegmentTypeAsString:(int)a3
{
  if (a3 < 4)
    return *(&off_1E9595C98 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTripSegmentType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Origin")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MainSplit")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MainUnSplit")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)CLPPrivacySanitization;
  -[CLPPrivacySanitization description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPPrivacySanitization dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t tripSegmentType;
  void *v5;
  NSString *version;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    tripSegmentType = self->_tripSegmentType;
    if (tripSegmentType >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_tripSegmentType);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_1E9595C98 + tripSegmentType);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("tripSegmentType"));

  }
  version = self->_version;
  if (version)
    objc_msgSend(v3, "setObject:forKey:", version, CFSTR("version"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPPrivacySanitizationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (!self->_version)
    -[CLPPrivacySanitization writeTo:].cold.1();
  PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_tripSegmentType;
    *((_BYTE *)a3 + 24) |= 1u;
  }
  objc_msgSend(a3, "setVersion:", self->_version);
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
    *(_DWORD *)(v5 + 8) = self->_tripSegmentType;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_version, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *version;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_tripSegmentType != *((_DWORD *)v4 + 2))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  version = self->_version;
  if ((unint64_t)version | *((_QWORD *)v4 + 2))
    v6 = -[NSString isEqual:](version, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_tripSegmentType;
  else
    v2 = 0;
  return -[NSString hash](self->_version, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[6] & 1) != 0)
  {
    self->_tripSegmentType = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    v5 = v4;
    -[CLPPrivacySanitization setVersion:](self, "setVersion:");
    v4 = v5;
  }

}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPPrivacySanitization writeTo:]", "CLPCollectionRequest.gen.m", 32176, "nil != self->_version");
}

@end
