@implementation _MRNowPlayingPlayerProtobuf

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)_MRNowPlayingPlayerProtobuf;
  -[_MRNowPlayingPlayerProtobuf dealloc](&v3, sel_dealloc);
}

- (unint64_t)mxSessionIDsCount
{
  return self->_mxSessionIDs.count;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)hasIconURL
{
  return self->_iconURL != 0;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (int)audioSessionType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_audioSessionType;
  else
    return 0;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setIconURL:(id)a3
{
  objc_storeStrong((id *)&self->_iconURL, a3);
}

- (void)setHasAudioSessionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (void)setAudioSessionType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_audioSessionType = a3;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_audioSessionID = a3;
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_displayName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_mxSessionIDs.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      v4 = v6;
      ++v5;
    }
    while (v5 < self->_mxSessionIDs.count);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
  if (self->_iconURL)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasAudioSessionType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)audioSessionTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E30C6A50[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAudioSessionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Default")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LongForm")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Independent")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)mxSessionIDs
{
  return self->_mxSessionIDs.list;
}

- (void)clearMxSessionIDs
{
  PBRepeatedInt64Clear();
}

- (void)addMxSessionID:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)mxSessionIDAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_mxSessionIDs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_mxSessionIDs = &self->_mxSessionIDs;
  count = self->_mxSessionIDs.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_mxSessionIDs->list[a3];
}

- (void)setMxSessionIDs:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (void)setHasAudioSessionID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAudioSessionID
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)_MRNowPlayingPlayerProtobuf;
  -[_MRNowPlayingPlayerProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRNowPlayingPlayerProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  NSString *displayName;
  uint64_t audioSessionType;
  __CFString *v8;
  void *v9;
  void *v10;
  NSString *iconURL;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v4, "setObject:forKey:", displayName, CFSTR("displayName"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    audioSessionType = self->_audioSessionType;
    if (audioSessionType >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_audioSessionType);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E30C6A50[audioSessionType];
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("audioSessionType"));

  }
  PBRepeatedInt64NSArray();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("mxSessionID"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_audioSessionID);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("audioSessionID"));

  }
  iconURL = self->_iconURL;
  if (iconURL)
    objc_msgSend(v4, "setObject:forKey:", iconURL, CFSTR("iconURL"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRNowPlayingPlayerProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v9;
  }
  if (self->_displayName)
  {
    objc_msgSend(v9, "setDisplayName:");
    v4 = v9;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 9) = self->_audioSessionType;
    *((_BYTE *)v4 + 64) |= 2u;
  }
  if (-[_MRNowPlayingPlayerProtobuf mxSessionIDsCount](self, "mxSessionIDsCount"))
  {
    objc_msgSend(v9, "clearMxSessionIDs");
    v5 = -[_MRNowPlayingPlayerProtobuf mxSessionIDsCount](self, "mxSessionIDsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(v9, "addMxSessionID:", -[_MRNowPlayingPlayerProtobuf mxSessionIDAtIndex:](self, "mxSessionIDAtIndex:", i));
    }
  }
  v8 = v9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v9 + 8) = self->_audioSessionID;
    *((_BYTE *)v9 + 64) |= 1u;
  }
  if (self->_iconURL)
  {
    objc_msgSend(v9, "setIconURL:");
    v8 = v9;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  v8 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_audioSessionType;
    *(_BYTE *)(v5 + 64) |= 2u;
  }
  PBRepeatedInt64Copy();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_audioSessionID;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_iconURL, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  NSString *displayName;
  NSString *iconURL;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_19;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_audioSessionType != *((_DWORD *)v4 + 9))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_19;
  }
  if (!PBRepeatedInt64IsEqual())
  {
LABEL_19:
    v8 = 0;
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_audioSessionID != *((_DWORD *)v4 + 8))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_19;
  }
  iconURL = self->_iconURL;
  if ((unint64_t)iconURL | *((_QWORD *)v4 + 6))
    v8 = -[NSString isEqual:](iconURL, "isEqual:");
  else
    v8 = 1;
LABEL_20:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_displayName, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_audioSessionType;
  else
    v5 = 0;
  v6 = PBRepeatedInt64Hash();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_audioSessionID;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSString hash](self->_iconURL, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  unsigned int *v8;
  unsigned int *v9;

  v4 = (int *)a3;
  v9 = (unsigned int *)v4;
  if (*((_QWORD *)v4 + 7))
  {
    -[_MRNowPlayingPlayerProtobuf setIdentifier:](self, "setIdentifier:");
    v4 = (int *)v9;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[_MRNowPlayingPlayerProtobuf setDisplayName:](self, "setDisplayName:");
    v4 = (int *)v9;
  }
  if ((v4[16] & 2) != 0)
  {
    self->_audioSessionType = v4[9];
    *(_BYTE *)&self->_has |= 2u;
  }
  v5 = objc_msgSend(v4, "mxSessionIDsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[_MRNowPlayingPlayerProtobuf addMxSessionID:](self, "addMxSessionID:", objc_msgSend(v9, "mxSessionIDAtIndex:", i));
  }
  v8 = v9;
  if ((v9[16] & 1) != 0)
  {
    self->_audioSessionID = v9[8];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v9 + 6))
  {
    -[_MRNowPlayingPlayerProtobuf setIconURL:](self, "setIconURL:");
    v8 = v9;
  }

}

- (NSString)iconURL
{
  return self->_iconURL;
}

@end
