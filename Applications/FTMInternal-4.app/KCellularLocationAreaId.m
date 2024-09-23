@implementation KCellularLocationAreaId

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

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KCellularLocationAreaId;
  v3 = -[KCellularLocationAreaId description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularLocationAreaId dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *encodedPlmn;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  encodedPlmn = self->_encodedPlmn;
  if (encodedPlmn)
    objc_msgSend(v3, "setObject:forKey:", encodedPlmn, CFSTR("encoded_plmn"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lac));
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("lac"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100043F1C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSData *encodedPlmn;
  id v6;

  v4 = a3;
  encodedPlmn = self->_encodedPlmn;
  v6 = v4;
  if (encodedPlmn)
  {
    PBDataWriterWriteDataField(v4, encodedPlmn, 1);
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v6, self->_lac, 2);
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (self->_encodedPlmn)
  {
    v5 = v4;
    objc_msgSend(v4, "setEncodedPlmn:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_lac;
    *((_BYTE *)v4 + 20) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_encodedPlmn, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_lac;
    *((_BYTE *)v5 + 20) |= 1u;
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
    goto LABEL_8;
  encodedPlmn = self->_encodedPlmn;
  if ((unint64_t)encodedPlmn | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](encodedPlmn, "isEqual:"))
      goto LABEL_8;
  }
  v7 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0 && self->_lac == *((_DWORD *)v4 + 4))
    {
      v7 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v7 = 0;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = (unint64_t)-[NSData hash](self->_encodedPlmn, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_lac;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  unsigned int *v5;

  v4 = (unsigned int *)a3;
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[KCellularLocationAreaId setEncodedPlmn:](self, "setEncodedPlmn:");
    v4 = v5;
  }
  if ((v4[5] & 1) != 0)
  {
    self->_lac = v4[4];
    *(_BYTE *)&self->_has |= 1u;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedPlmn, 0);
}

@end
