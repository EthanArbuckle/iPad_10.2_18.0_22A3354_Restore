@implementation MSPCompanionSyncedItem

- (BOOL)hasSyncId
{
  return self->_syncId != 0;
}

- (int)changeType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_changeType;
  else
    return 1;
}

- (void)setChangeType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_changeType = a3;
}

- (void)setHasChangeType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChangeType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)changeTypeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E6653378[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsChangeType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Add")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Update")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Delete")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasBookmark
{
  return self->_bookmark != 0;
}

- (BOOL)hasPin
{
  return self->_pin != 0;
}

- (BOOL)hasSearchRequest
{
  return self->_searchRequest != 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MSPCompanionSyncedItem;
  -[MSPCompanionSyncedItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPCompanionSyncedItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *syncId;
  unsigned int v6;
  __CFString *v7;
  MSPBookmarkStorage *bookmark;
  void *v9;
  MSPPinStorage *pin;
  void *v11;
  MSPHistoryEntryStorage *searchRequest;
  void *v13;
  PBUnknownFields *unknownFields;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  syncId = self->_syncId;
  if (syncId)
    objc_msgSend(v3, "setObject:forKey:", syncId, CFSTR("syncId"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = self->_changeType - 1;
    if (v6 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_changeType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E6653378[v6];
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("changeType"));

  }
  bookmark = self->_bookmark;
  if (bookmark)
  {
    -[MSPBookmarkStorage dictionaryRepresentation](bookmark, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("bookmark"));

  }
  pin = self->_pin;
  if (pin)
  {
    -[MSPPinStorage dictionaryRepresentation](pin, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("pin"));

  }
  searchRequest = self->_searchRequest;
  if (searchRequest)
  {
    -[MSPHistoryEntryStorage dictionaryRepresentation](searchRequest, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("searchRequest"));

  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    -[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MSPCompanionSyncedItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_syncId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_bookmark)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_pin)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_searchRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_syncId)
  {
    objc_msgSend(v4, "setSyncId:");
    v4 = v5;
  }
  if (self->_bookmark)
  {
    objc_msgSend(v5, "setBookmark:");
    v4 = v5;
  }
  if (self->_pin)
  {
    objc_msgSend(v5, "setPin:");
    v4 = v5;
  }
  if (self->_searchRequest)
  {
    objc_msgSend(v5, "setSearchRequest:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_changeType;
    *((_BYTE *)v4 + 56) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_syncId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[MSPBookmarkStorage copyWithZone:](self->_bookmark, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[MSPPinStorage copyWithZone:](self->_pin, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[MSPHistoryEntryStorage copyWithZone:](self->_searchRequest, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_changeType;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *syncId;
  MSPBookmarkStorage *bookmark;
  MSPPinStorage *pin;
  MSPHistoryEntryStorage *searchRequest;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  syncId = self->_syncId;
  if ((unint64_t)syncId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](syncId, "isEqual:"))
      goto LABEL_14;
  }
  bookmark = self->_bookmark;
  if ((unint64_t)bookmark | *((_QWORD *)v4 + 2))
  {
    if (!-[MSPBookmarkStorage isEqual:](bookmark, "isEqual:"))
      goto LABEL_14;
  }
  pin = self->_pin;
  if ((unint64_t)pin | *((_QWORD *)v4 + 4))
  {
    if (!-[MSPPinStorage isEqual:](pin, "isEqual:"))
      goto LABEL_14;
  }
  searchRequest = self->_searchRequest;
  if ((unint64_t)searchRequest | *((_QWORD *)v4 + 5))
  {
    if (!-[MSPHistoryEntryStorage isEqual:](searchRequest, "isEqual:"))
      goto LABEL_14;
  }
  v9 = (*((_BYTE *)v4 + 56) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) != 0 && self->_changeType == *((_DWORD *)v4 + 6))
    {
      v9 = 1;
      goto LABEL_15;
    }
LABEL_14:
    v9 = 0;
  }
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_syncId, "hash");
  v4 = -[MSPBookmarkStorage hash](self->_bookmark, "hash");
  v5 = -[MSPPinStorage hash](self->_pin, "hash");
  v6 = -[MSPHistoryEntryStorage hash](self->_searchRequest, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_changeType;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  MSPBookmarkStorage *bookmark;
  uint64_t v6;
  MSPPinStorage *pin;
  uint64_t v8;
  MSPHistoryEntryStorage *searchRequest;
  uint64_t v10;
  int *v11;

  v4 = (int *)a3;
  v11 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[MSPCompanionSyncedItem setSyncId:](self, "setSyncId:");
    v4 = v11;
  }
  bookmark = self->_bookmark;
  v6 = *((_QWORD *)v4 + 2);
  if (bookmark)
  {
    if (!v6)
      goto LABEL_9;
    -[MSPBookmarkStorage mergeFrom:](bookmark, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[MSPCompanionSyncedItem setBookmark:](self, "setBookmark:");
  }
  v4 = v11;
LABEL_9:
  pin = self->_pin;
  v8 = *((_QWORD *)v4 + 4);
  if (pin)
  {
    if (!v8)
      goto LABEL_15;
    -[MSPPinStorage mergeFrom:](pin, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[MSPCompanionSyncedItem setPin:](self, "setPin:");
  }
  v4 = v11;
LABEL_15:
  searchRequest = self->_searchRequest;
  v10 = *((_QWORD *)v4 + 5);
  if (searchRequest)
  {
    if (!v10)
      goto LABEL_21;
    -[MSPHistoryEntryStorage mergeFrom:](searchRequest, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_21;
    -[MSPCompanionSyncedItem setSearchRequest:](self, "setSearchRequest:");
  }
  v4 = v11;
LABEL_21:
  if ((v4[14] & 1) != 0)
  {
    self->_changeType = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (NSString)syncId
{
  return self->_syncId;
}

- (void)setSyncId:(id)a3
{
  objc_storeStrong((id *)&self->_syncId, a3);
}

- (MSPBookmarkStorage)bookmark
{
  return self->_bookmark;
}

- (void)setBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_bookmark, a3);
}

- (MSPPinStorage)pin
{
  return self->_pin;
}

- (void)setPin:(id)a3
{
  objc_storeStrong((id *)&self->_pin, a3);
}

- (MSPHistoryEntryStorage)searchRequest
{
  return self->_searchRequest;
}

- (void)setSearchRequest:(id)a3
{
  objc_storeStrong((id *)&self->_searchRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncId, 0);
  objc_storeStrong((id *)&self->_searchRequest, 0);
  objc_storeStrong((id *)&self->_pin, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (NSString)sequencer
{
  return 0;
}

- (int64_t)syChangeType
{
  return -[MSPCompanionSyncedItem changeType](self, "changeType");
}

+ (id)syncIdWithPrefix:(id)a3 identifier:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), a3, a4);
}

@end
