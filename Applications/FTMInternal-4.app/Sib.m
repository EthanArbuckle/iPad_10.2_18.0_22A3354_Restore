@implementation Sib

- (void)setBitMask:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_bitMask = a3;
}

- (void)setHasBitMask:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBitMask
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasContent
{
  return self->_content != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)Sib;
  v3 = -[Sib description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[Sib dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *content;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_bitMask));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("bit_mask"));

  }
  content = self->_content;
  if (content)
    objc_msgSend(v3, "setObject:forKey:", content, CFSTR("content"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000109EC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSData *content;
  id v6;

  v4 = a3;
  v6 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_bitMask, 1);
    v4 = v6;
  }
  content = self->_content;
  if (content)
  {
    PBDataWriterWriteDataField(v6, content, 2);
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_bitMask;
    *((_BYTE *)v4 + 24) |= 1u;
  }
  if (self->_content)
  {
    v5 = v4;
    objc_msgSend(v4, "setContent:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 2) = self->_bitMask;
    *((_BYTE *)v5 + 24) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_content, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSData *content;
  unsigned __int8 v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_bitMask != *((_DWORD *)v4 + 2))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  content = self->_content;
  if ((unint64_t)content | *((_QWORD *)v4 + 2))
    v7 = -[NSData isEqual:](content, "isEqual:");
  else
    v7 = 1;
LABEL_10:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_bitMask;
  else
    v2 = 0;
  return (unint64_t)-[NSData hash](self->_content, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[6] & 1) != 0)
  {
    self->_bitMask = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    v5 = v4;
    -[Sib setContent:](self, "setContent:");
    v4 = v5;
  }

}

- (unsigned)bitMask
{
  return self->_bitMask;
}

- (NSData)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
}

@end
