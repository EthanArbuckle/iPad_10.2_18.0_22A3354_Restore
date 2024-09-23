@implementation HMAccessoryDiagnosticInfoProtoIdsInfo

- (int)idsState
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_idsState;
  else
    return 0;
}

- (void)setIdsState:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_idsState = a3;
}

- (void)setHasIdsState:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIdsState
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)idsStateAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Unknown");
  if (a3 == 1)
  {
    v3 = CFSTR("Good");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsIdsState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Good"));

  return v4;
}

- (BOOL)hasIdsIdentifierString
{
  return self->_idsIdentifierString != 0;
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
  v8.super_class = (Class)HMAccessoryDiagnosticInfoProtoIdsInfo;
  -[HMAccessoryDiagnosticInfoProtoIdsInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryDiagnosticInfoProtoIdsInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int idsState;
  __CFString *v5;
  NSString *idsIdentifierString;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    idsState = self->_idsState;
    if (idsState)
    {
      if (idsState == 1)
      {
        v5 = CFSTR("Good");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_idsState);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = CFSTR("Unknown");
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("idsState"));

  }
  idsIdentifierString = self->_idsIdentifierString;
  if (idsIdentifierString)
    objc_msgSend(v3, "setObject:forKey:", idsIdentifierString, CFSTR("idsIdentifierString"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryDiagnosticInfoProtoIdsInfoReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_idsIdentifierString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_idsState;
    *((_BYTE *)v4 + 20) |= 1u;
  }
  if (self->_idsIdentifierString)
  {
    v5 = v4;
    objc_msgSend(v4, "setIdsIdentifierString:");
    v4 = v5;
  }

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
    *(_DWORD *)(v5 + 16) = self->_idsState;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_idsIdentifierString, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *idsIdentifierString;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_idsState != *((_DWORD *)v4 + 4))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  idsIdentifierString = self->_idsIdentifierString;
  if ((unint64_t)idsIdentifierString | *((_QWORD *)v4 + 1))
    v6 = -[NSString isEqual:](idsIdentifierString, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_idsState;
  else
    v2 = 0;
  return -[NSString hash](self->_idsIdentifierString, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[5] & 1) != 0)
  {
    self->_idsState = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[HMAccessoryDiagnosticInfoProtoIdsInfo setIdsIdentifierString:](self, "setIdsIdentifierString:");
    v4 = v5;
  }

}

- (NSString)idsIdentifierString
{
  return self->_idsIdentifierString;
}

- (void)setIdsIdentifierString:(id)a3
{
  objc_storeStrong((id *)&self->_idsIdentifierString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsIdentifierString, 0);
}

@end
