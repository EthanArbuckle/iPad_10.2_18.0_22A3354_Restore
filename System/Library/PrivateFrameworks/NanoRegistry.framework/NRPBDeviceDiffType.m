@implementation NRPBDeviceDiffType

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)NRPBDeviceDiffType;
  -[NRPBDeviceDiffType description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPBDeviceDiffType dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t changeType;
  __CFString *v5;
  NRPBDeviceDiff *diff;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    changeType = self->_changeType;
    if (changeType >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_changeType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E4496F80[changeType];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("changeType"));

  }
  diff = self->_diff;
  if (diff)
  {
    -[NRPBDeviceDiff dictionaryRepresentation](diff, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("diff"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NRPBDeviceDiffTypeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_diff)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)setDiff:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_changeType;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  v7 = -[NRPBDeviceDiff copyWithZone:](self->_diff, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NRPBDeviceDiff *diff;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_changeType != *((_DWORD *)v4 + 2))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  diff = self->_diff;
  if ((unint64_t)diff | *((_QWORD *)v4 + 2))
    v6 = -[NRPBDeviceDiff isEqual:](diff, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_changeType;
  else
    v2 = 0;
  return -[NRPBDeviceDiff hash](self->_diff, "hash") ^ v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diff, 0);
}

@end
