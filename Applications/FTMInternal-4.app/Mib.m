@implementation Mib

- (void)setSubCarrierSpacing:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_subCarrierSpacing = a3;
}

- (void)setHasSubCarrierSpacing:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSubCarrierSpacing
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSsbSubCarrierOffset:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ssbSubCarrierOffset = a3;
}

- (void)setHasSsbSubCarrierOffset:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSsbSubCarrierOffset
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasMibContent
{
  return self->_mibContent != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)Mib;
  v3 = -[Mib description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[Mib dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  NSData *mibContent;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subCarrierSpacing));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sub_carrier_spacing"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ssbSubCarrierOffset));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("ssb_sub_carrier_offset"));

  }
  mibContent = self->_mibContent;
  if (mibContent)
    objc_msgSend(v3, "setObject:forKey:", mibContent, CFSTR("mib_content"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100097520((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSData *mibContent;
  id v7;

  v4 = a3;
  has = (char)self->_has;
  v7 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_subCarrierSpacing, 1);
    v4 = v7;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v7, self->_ssbSubCarrierOffset, 2);
    v4 = v7;
  }
  mibContent = self->_mibContent;
  if (mibContent)
  {
    PBDataWriterWriteDataField(v7, mibContent, 4);
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[5] = self->_subCarrierSpacing;
    *((_BYTE *)v4 + 24) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[4] = self->_ssbSubCarrierOffset;
    *((_BYTE *)v4 + 24) |= 1u;
  }
  if (self->_mibContent)
  {
    v6 = v4;
    objc_msgSend(v4, "setMibContent:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 5) = self->_subCarrierSpacing;
    *((_BYTE *)v5 + 24) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_ssbSubCarrierOffset;
    *((_BYTE *)v5 + 24) |= 1u;
  }
  v8 = -[NSData copyWithZone:](self->_mibContent, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSData *mibContent;
  unsigned __int8 v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_subCarrierSpacing != *((_DWORD *)v4 + 5))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
LABEL_14:
    v7 = 0;
    goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_ssbSubCarrierOffset != *((_DWORD *)v4 + 4))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_14;
  }
  mibContent = self->_mibContent;
  if ((unint64_t)mibContent | *((_QWORD *)v4 + 1))
    v7 = -[NSData isEqual:](mibContent, "isEqual:");
  else
    v7 = 1;
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761 * self->_subCarrierSpacing;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ (unint64_t)-[NSData hash](self->_mibContent, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_ssbSubCarrierOffset;
  return v3 ^ v2 ^ (unint64_t)-[NSData hash](self->_mibContent, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 2) != 0)
  {
    self->_subCarrierSpacing = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 24);
  }
  if ((v5 & 1) != 0)
  {
    self->_ssbSubCarrierOffset = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    v6 = v4;
    -[Mib setMibContent:](self, "setMibContent:");
    v4 = v6;
  }

}

- (unsigned)subCarrierSpacing
{
  return self->_subCarrierSpacing;
}

- (unsigned)ssbSubCarrierOffset
{
  return self->_ssbSubCarrierOffset;
}

- (NSData)mibContent
{
  return self->_mibContent;
}

- (void)setMibContent:(id)a3
{
  objc_storeStrong((id *)&self->_mibContent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mibContent, 0);
}

@end
