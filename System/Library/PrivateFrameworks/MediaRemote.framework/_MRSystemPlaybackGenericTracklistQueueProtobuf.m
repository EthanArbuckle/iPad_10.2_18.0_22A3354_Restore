@implementation _MRSystemPlaybackGenericTracklistQueueProtobuf

- (BOOL)hasFirstTrackIdentifier
{
  return self->_firstTrackIdentifier != 0;
}

- (BOOL)hasTrackIdentifiers
{
  return self->_trackIdentifiers != 0;
}

- (BOOL)hasCollectionIdentifierSet
{
  return self->_collectionIdentifierSet != 0;
}

- (int)shuffleMode
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_shuffleMode;
  else
    return 0;
}

- (void)setShuffleMode:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_shuffleMode = a3;
}

- (void)setHasShuffleMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasShuffleMode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)shuffleModeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E30CA4D8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsShuffleMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Off")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Albums")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Songs")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)repeatMode
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_repeatMode;
  else
    return 0;
}

- (void)setRepeatMode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_repeatMode = a3;
}

- (void)setHasRepeatMode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRepeatMode
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)repeatModeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E30CA4F8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRepeatMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("One")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("All")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)_MRSystemPlaybackGenericTracklistQueueProtobuf;
  -[_MRSystemPlaybackGenericTracklistQueueProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSystemPlaybackGenericTracklistQueueProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *firstTrackIdentifier;
  NSString *trackIdentifiers;
  NSData *collectionIdentifierSet;
  char has;
  uint64_t shuffleMode;
  __CFString *v10;
  uint64_t repeatMode;
  __CFString *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  firstTrackIdentifier = self->_firstTrackIdentifier;
  if (firstTrackIdentifier)
    objc_msgSend(v3, "setObject:forKey:", firstTrackIdentifier, CFSTR("firstTrackIdentifier"));
  trackIdentifiers = self->_trackIdentifiers;
  if (trackIdentifiers)
    objc_msgSend(v4, "setObject:forKey:", trackIdentifiers, CFSTR("trackIdentifiers"));
  collectionIdentifierSet = self->_collectionIdentifierSet;
  if (collectionIdentifierSet)
    objc_msgSend(v4, "setObject:forKey:", collectionIdentifierSet, CFSTR("collectionIdentifierSet"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    shuffleMode = self->_shuffleMode;
    if (shuffleMode >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_shuffleMode);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E30CA4D8[shuffleMode];
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("shuffleMode"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    repeatMode = self->_repeatMode;
    if (repeatMode >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_repeatMode);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E30CA4F8[repeatMode];
    }
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("repeatMode"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSystemPlaybackGenericTracklistQueueProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_firstTrackIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_trackIdentifiers)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_collectionIdentifierSet)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_firstTrackIdentifier)
  {
    objc_msgSend(v4, "setFirstTrackIdentifier:");
    v4 = v6;
  }
  if (self->_trackIdentifiers)
  {
    objc_msgSend(v6, "setTrackIdentifiers:");
    v4 = v6;
  }
  if (self->_collectionIdentifierSet)
  {
    objc_msgSend(v6, "setCollectionIdentifierSet:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 7) = self->_shuffleMode;
    *((_BYTE *)v4 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_repeatMode;
    *((_BYTE *)v4 + 40) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_firstTrackIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_trackIdentifiers, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSData copyWithZone:](self->_collectionIdentifierSet, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_shuffleMode;
    *(_BYTE *)(v5 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_repeatMode;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *firstTrackIdentifier;
  NSString *trackIdentifiers;
  NSData *collectionIdentifierSet;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  firstTrackIdentifier = self->_firstTrackIdentifier;
  if ((unint64_t)firstTrackIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](firstTrackIdentifier, "isEqual:"))
      goto LABEL_17;
  }
  trackIdentifiers = self->_trackIdentifiers;
  if ((unint64_t)trackIdentifiers | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](trackIdentifiers, "isEqual:"))
      goto LABEL_17;
  }
  collectionIdentifierSet = self->_collectionIdentifierSet;
  if ((unint64_t)collectionIdentifierSet | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](collectionIdentifierSet, "isEqual:"))
      goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_shuffleMode != *((_DWORD *)v4 + 7))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
  v8 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_repeatMode != *((_DWORD *)v4 + 6))
      goto LABEL_17;
    v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_firstTrackIdentifier, "hash");
  v4 = -[NSString hash](self->_trackIdentifiers, "hash");
  v5 = -[NSData hash](self->_collectionIdentifierSet, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6 = 2654435761 * self->_shuffleMode;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v7 = 2654435761 * self->_repeatMode;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  char v5;
  int *v6;

  v4 = (int *)a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[_MRSystemPlaybackGenericTracklistQueueProtobuf setFirstTrackIdentifier:](self, "setFirstTrackIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[_MRSystemPlaybackGenericTracklistQueueProtobuf setTrackIdentifiers:](self, "setTrackIdentifiers:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[_MRSystemPlaybackGenericTracklistQueueProtobuf setCollectionIdentifierSet:](self, "setCollectionIdentifierSet:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_shuffleMode = v4[7];
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 40);
  }
  if ((v5 & 1) != 0)
  {
    self->_repeatMode = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)firstTrackIdentifier
{
  return self->_firstTrackIdentifier;
}

- (void)setFirstTrackIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_firstTrackIdentifier, a3);
}

- (NSString)trackIdentifiers
{
  return self->_trackIdentifiers;
}

- (void)setTrackIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_trackIdentifiers, a3);
}

- (NSData)collectionIdentifierSet
{
  return self->_collectionIdentifierSet;
}

- (void)setCollectionIdentifierSet:(id)a3
{
  objc_storeStrong((id *)&self->_collectionIdentifierSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackIdentifiers, 0);
  objc_storeStrong((id *)&self->_firstTrackIdentifier, 0);
  objc_storeStrong((id *)&self->_collectionIdentifierSet, 0);
}

@end
