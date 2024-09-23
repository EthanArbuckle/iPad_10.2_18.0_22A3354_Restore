@implementation NMSMediaSyncServiceModelObject

- (BOOL)hasDataMultiverseID
{
  return self->_dataMultiverseID != 0;
}

- (int)containerType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_containerType;
  else
    return 0;
}

- (void)setContainerType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_containerType = a3;
}

- (void)setHasContainerType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContainerType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)containerTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Album");
  if (a3 == 1)
  {
    v3 = CFSTR("Playlist");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsContainerType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Album")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Playlist"));

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NMSMediaSyncServiceModelObject;
  -[NMSMediaSyncServiceModelObject description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSMediaSyncServiceModelObject dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *dataMultiverseID;
  int containerType;
  __CFString *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  dataMultiverseID = self->_dataMultiverseID;
  if (dataMultiverseID)
    objc_msgSend(v3, "setObject:forKey:", dataMultiverseID, CFSTR("dataMultiverseID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    containerType = self->_containerType;
    if (containerType)
    {
      if (containerType == 1)
      {
        v7 = CFSTR("Playlist");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_containerType);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v7 = CFSTR("Album");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("containerType"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NMSMediaSyncServiceModelObjectReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_dataMultiverseID)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (self->_dataMultiverseID)
  {
    v5 = v4;
    objc_msgSend(v4, "setDataMultiverseID:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_containerType;
    *((_BYTE *)v4 + 24) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_dataMultiverseID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_containerType;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *dataMultiverseID;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  dataMultiverseID = self->_dataMultiverseID;
  if ((unint64_t)dataMultiverseID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](dataMultiverseID, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) != 0 && self->_containerType == *((_DWORD *)v4 + 2))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSData hash](self->_dataMultiverseID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_containerType;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  if (*((_QWORD *)v4 + 2))
  {
    v5 = v4;
    -[NMSMediaSyncServiceModelObject setDataMultiverseID:](self, "setDataMultiverseID:");
    v4 = v5;
  }
  if ((v4[6] & 1) != 0)
  {
    self->_containerType = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSData)dataMultiverseID
{
  return self->_dataMultiverseID;
}

- (void)setDataMultiverseID:(id)a3
{
  objc_storeStrong((id *)&self->_dataMultiverseID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataMultiverseID, 0);
}

@end
