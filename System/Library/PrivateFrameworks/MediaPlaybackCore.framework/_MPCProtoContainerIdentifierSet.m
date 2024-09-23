@implementation _MPCProtoContainerIdentifierSet

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)_MPCProtoContainerIdentifierSet;
  -[_MPCProtoContainerIdentifierSet description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCProtoContainerIdentifierSet dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  NSString *storePlaylistGlobalID;
  NSString *storePlaylistVersionHash;
  void *v9;
  NSString *cloudCollectionID;
  NSString *radioStationID;
  NSString *cloudUniversalLibraryID;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_delegateInfoID);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("delegateInfoID"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_storeAdamID);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("storeAdamID"));

  }
  storePlaylistGlobalID = self->_storePlaylistGlobalID;
  if (storePlaylistGlobalID)
    objc_msgSend(v3, "setObject:forKey:", storePlaylistGlobalID, CFSTR("storePlaylistGlobalID"));
  storePlaylistVersionHash = self->_storePlaylistVersionHash;
  if (storePlaylistVersionHash)
    objc_msgSend(v3, "setObject:forKey:", storePlaylistVersionHash, CFSTR("storePlaylistVersionHash"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_cloudID);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("cloudID"));

  }
  cloudCollectionID = self->_cloudCollectionID;
  if (cloudCollectionID)
    objc_msgSend(v3, "setObject:forKey:", cloudCollectionID, CFSTR("cloudCollectionID"));
  radioStationID = self->_radioStationID;
  if (radioStationID)
    objc_msgSend(v3, "setObject:forKey:", radioStationID, CFSTR("radioStationID"));
  cloudUniversalLibraryID = self->_cloudUniversalLibraryID;
  if (cloudUniversalLibraryID)
    objc_msgSend(v3, "setObject:forKey:", cloudUniversalLibraryID, CFSTR("cloudUniversalLibraryID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MPCProtoContainerIdentifierSetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
  if (self->_storePlaylistGlobalID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_storePlaylistVersionHash)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
  if (self->_cloudCollectionID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_radioStationID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_cloudUniversalLibraryID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_delegateInfoID;
    *(_BYTE *)(v5 + 72) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_storeAdamID;
    *(_BYTE *)(v5 + 72) |= 4u;
  }
  v8 = -[NSString copyWithZone:](self->_storePlaylistGlobalID, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v8;

  v10 = -[NSString copyWithZone:](self->_storePlaylistVersionHash, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_cloudID;
    *(_BYTE *)(v6 + 72) |= 1u;
  }
  v12 = -[NSString copyWithZone:](self->_cloudCollectionID, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v12;

  v14 = -[NSString copyWithZone:](self->_radioStationID, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v14;

  v16 = -[NSString copyWithZone:](self->_cloudUniversalLibraryID, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v16;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *storePlaylistGlobalID;
  NSString *storePlaylistVersionHash;
  NSString *cloudCollectionID;
  NSString *radioStationID;
  NSString *cloudUniversalLibraryID;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_delegateInfoID != *((_QWORD *)v4 + 2))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
LABEL_27:
    v10 = 0;
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 4) == 0 || self->_storeAdamID != *((_QWORD *)v4 + 3))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 72) & 4) != 0)
  {
    goto LABEL_27;
  }
  storePlaylistGlobalID = self->_storePlaylistGlobalID;
  if ((unint64_t)storePlaylistGlobalID | *((_QWORD *)v4 + 7)
    && !-[NSString isEqual:](storePlaylistGlobalID, "isEqual:"))
  {
    goto LABEL_27;
  }
  storePlaylistVersionHash = self->_storePlaylistVersionHash;
  if ((unint64_t)storePlaylistVersionHash | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](storePlaylistVersionHash, "isEqual:"))
      goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_cloudID != *((_QWORD *)v4 + 1))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    goto LABEL_27;
  }
  cloudCollectionID = self->_cloudCollectionID;
  if ((unint64_t)cloudCollectionID | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](cloudCollectionID, "isEqual:"))
  {
    goto LABEL_27;
  }
  radioStationID = self->_radioStationID;
  if ((unint64_t)radioStationID | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](radioStationID, "isEqual:"))
      goto LABEL_27;
  }
  cloudUniversalLibraryID = self->_cloudUniversalLibraryID;
  if ((unint64_t)cloudUniversalLibraryID | *((_QWORD *)v4 + 5))
    v10 = -[NSString isEqual:](cloudUniversalLibraryID, "isEqual:");
  else
    v10 = 1;
LABEL_28:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_delegateInfoID;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_storeAdamID;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_storePlaylistGlobalID, "hash");
  v6 = -[NSString hash](self->_storePlaylistVersionHash, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_cloudID;
  else
    v7 = 0;
  v8 = v4 ^ v3 ^ v5 ^ v6 ^ v7;
  v9 = -[NSString hash](self->_cloudCollectionID, "hash");
  v10 = v9 ^ -[NSString hash](self->_radioStationID, "hash");
  return v8 ^ v10 ^ -[NSString hash](self->_cloudUniversalLibraryID, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storePlaylistVersionHash, 0);
  objc_storeStrong((id *)&self->_storePlaylistGlobalID, 0);
  objc_storeStrong((id *)&self->_radioStationID, 0);
  objc_storeStrong((id *)&self->_cloudUniversalLibraryID, 0);
  objc_storeStrong((id *)&self->_cloudCollectionID, 0);
}

@end
