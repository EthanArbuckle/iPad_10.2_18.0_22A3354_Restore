@implementation _DKPREventData

- (uint64_t)setUncompressedLength:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 28) |= 1u;
    *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasUncompressedLength:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 28) = *(_BYTE *)(result + 28) & 0xFE | a2;
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
  v8.super_class = (Class)_DKPREventData;
  -[_DKPREventData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPREventData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *event;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  event = self->_event;
  if (event)
    objc_msgSend(v3, "setObject:forKey:", event, CFSTR("event"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_uncompressedLength);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("uncompressedLength"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _DKPREventDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint32Field();
  if (!self->_event)
    -[_DKPREventData writeTo:].cold.1();
  PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();

}

- (void)setEvent:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 24) = self->_version;
  v6 = -[NSData copyWithZone:](self->_event, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_uncompressedLength;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *event;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if (self->_version != *((_DWORD *)v4 + 6))
    goto LABEL_9;
  event = self->_event;
  if ((unint64_t)event | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](event, "isEqual:"))
      goto LABEL_9;
  }
  v6 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0 && self->_uncompressedLength == *((_QWORD *)v4 + 1))
    {
      v6 = 1;
      goto LABEL_10;
    }
LABEL_9:
    v6 = 0;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  unsigned int version;
  uint64_t v4;
  unint64_t v5;

  version = self->_version;
  v4 = -[NSData hash](self->_event, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761u * self->_uncompressedLength;
  else
    v5 = 0;
  return v4 ^ v5 ^ (2654435761 * version);
}

- (uint64_t)version
{
  if (result)
    return *(unsigned int *)(result + 24);
  return result;
}

- (uint64_t)setVersion:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 24) = a2;
  return result;
}

- (uint64_t)event
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (uint64_t)uncompressedLength
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[_DKPREventData writeTo:]", "_DKPREventData.m", 107, "nil != self->_event");
}

@end
