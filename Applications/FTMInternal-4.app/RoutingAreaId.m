@implementation RoutingAreaId

- (BOOL)hasEncodedPlmn
{
  return self->_encodedPlmn != 0;
}

- (void)setLac:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_lac = a3;
}

- (void)setHasLac:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLac
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setRac:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_rac = a3;
}

- (void)setHasRac:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRac
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RoutingAreaId;
  v3 = -[RoutingAreaId description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAreaId dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *encodedPlmn;
  char has;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  encodedPlmn = self->_encodedPlmn;
  if (encodedPlmn)
    objc_msgSend(v3, "setObject:forKey:", encodedPlmn, CFSTR("encoded_plmn"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lac));
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("lac"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rac));
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("rac"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100042484((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSData *encodedPlmn;
  char has;
  id v7;

  v4 = a3;
  encodedPlmn = self->_encodedPlmn;
  v7 = v4;
  if (encodedPlmn)
  {
    PBDataWriterWriteDataField(v4, encodedPlmn, 1);
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v7, self->_lac, 3);
    v4 = v7;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v7, self->_rac, 4);
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  if (self->_encodedPlmn)
  {
    v6 = v4;
    objc_msgSend(v4, "setEncodedPlmn:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_lac;
    *((_BYTE *)v4 + 24) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 5) = self->_rac;
    *((_BYTE *)v4 + 24) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  char has;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_encodedPlmn, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_lac;
    *((_BYTE *)v5 + 24) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 5) = self->_rac;
    *((_BYTE *)v5 + 24) |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSData *encodedPlmn;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_13;
  encodedPlmn = self->_encodedPlmn;
  if ((unint64_t)encodedPlmn | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](encodedPlmn, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_lac != *((_DWORD *)v4 + 4))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_13:
    v7 = 0;
    goto LABEL_14;
  }
  v7 = (*((_BYTE *)v4 + 24) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_rac != *((_DWORD *)v4 + 5))
      goto LABEL_13;
    v7 = 1;
  }
LABEL_14:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (unint64_t)-[NSData hash](self->_encodedPlmn, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_lac;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_rac;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  char v5;
  unsigned int *v6;

  v4 = (unsigned int *)a3;
  if (*((_QWORD *)v4 + 1))
  {
    v6 = v4;
    -[RoutingAreaId setEncodedPlmn:](self, "setEncodedPlmn:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 1) != 0)
  {
    self->_lac = v4[4];
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 24);
  }
  if ((v5 & 2) != 0)
  {
    self->_rac = v4[5];
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSData)encodedPlmn
{
  return self->_encodedPlmn;
}

- (void)setEncodedPlmn:(id)a3
{
  objc_storeStrong((id *)&self->_encodedPlmn, a3);
}

- (unsigned)lac
{
  return self->_lac;
}

- (unsigned)rac
{
  return self->_rac;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedPlmn, 0);
}

@end
