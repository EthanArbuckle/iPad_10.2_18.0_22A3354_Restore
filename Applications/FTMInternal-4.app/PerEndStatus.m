@implementation PerEndStatus

- (void)setEndStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_endStatus = a3;
}

- (void)setHasEndStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEndStatus
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setNumCalls:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numCalls = a3;
}

- (void)setHasNumCalls:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumCalls
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
  v8.super_class = (Class)PerEndStatus;
  v3 = -[PerEndStatus description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PerEndStatus dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_endStatus));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("end_status"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numCalls));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("num_calls"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000358C0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v4, self->_endStatus, 1);
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v6, self->_numCalls, 2);
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[2] = self->_endStatus;
    *((_BYTE *)v4 + 16) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[3] = self->_numCalls;
    *((_BYTE *)v4 + 16) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_endStatus;
    *((_BYTE *)result + 16) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_numCalls;
    *((_BYTE *)result + 16) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) == 0 || self->_endStatus != *((_DWORD *)v4 + 2))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 16) & 1) != 0)
  {
LABEL_11:
    v6 = 0;
    goto LABEL_12;
  }
  v6 = (*((_BYTE *)v4 + 16) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) == 0 || self->_numCalls != *((_DWORD *)v4 + 3))
      goto LABEL_11;
    v6 = 1;
  }
LABEL_12:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_endStatus;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_numCalls;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 16);
  if ((v5 & 1) != 0)
  {
    self->_endStatus = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 16);
  }
  if ((v5 & 2) != 0)
  {
    self->_numCalls = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (int)endStatus
{
  return self->_endStatus;
}

- (unsigned)numCalls
{
  return self->_numCalls;
}

@end
