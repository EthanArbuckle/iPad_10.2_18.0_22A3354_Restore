@implementation _MRPreloadedPlaybackSessionInfo

- (BOOL)hasPlaybackSessionIdentifier
{
  return self->_playbackSessionIdentifier != 0;
}

- (BOOL)hasPlaybackSessionRevision
{
  return self->_playbackSessionRevision != 0;
}

- (void)setPlaybackSessionPriority:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_playbackSessionPriority = a3;
}

- (void)setHasPlaybackSessionPriority:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPlaybackSessionPriority
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
  v8.super_class = (Class)_MRPreloadedPlaybackSessionInfo;
  -[_MRPreloadedPlaybackSessionInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRPreloadedPlaybackSessionInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *playbackSessionIdentifier;
  NSString *playbackSessionRevision;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  playbackSessionIdentifier = self->_playbackSessionIdentifier;
  if (playbackSessionIdentifier)
    objc_msgSend(v3, "setObject:forKey:", playbackSessionIdentifier, CFSTR("playbackSessionIdentifier"));
  playbackSessionRevision = self->_playbackSessionRevision;
  if (playbackSessionRevision)
    objc_msgSend(v4, "setObject:forKey:", playbackSessionRevision, CFSTR("playbackSessionRevision"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_playbackSessionPriority);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("playbackSessionPriority"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRPreloadedPlaybackSessionInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_playbackSessionIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_playbackSessionRevision)
  {
    PBDataWriterWriteStringField();
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
  v5 = v4;
  if (self->_playbackSessionIdentifier)
  {
    objc_msgSend(v4, "setPlaybackSessionIdentifier:");
    v4 = v5;
  }
  if (self->_playbackSessionRevision)
  {
    objc_msgSend(v5, "setPlaybackSessionRevision:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_playbackSessionPriority;
    *((_BYTE *)v4 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_playbackSessionIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSString copyWithZone:](self->_playbackSessionRevision, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_playbackSessionPriority;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *playbackSessionIdentifier;
  NSString *playbackSessionRevision;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  playbackSessionIdentifier = self->_playbackSessionIdentifier;
  if ((unint64_t)playbackSessionIdentifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](playbackSessionIdentifier, "isEqual:"))
      goto LABEL_10;
  }
  playbackSessionRevision = self->_playbackSessionRevision;
  if ((unint64_t)playbackSessionRevision | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](playbackSessionRevision, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) != 0 && self->_playbackSessionPriority == *((_DWORD *)v4 + 4))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_playbackSessionIdentifier, "hash");
  v4 = -[NSString hash](self->_playbackSessionRevision, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_playbackSessionPriority;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[_MRPreloadedPlaybackSessionInfo setPlaybackSessionIdentifier:](self, "setPlaybackSessionIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[_MRPreloadedPlaybackSessionInfo setPlaybackSessionRevision:](self, "setPlaybackSessionRevision:");
    v4 = v5;
  }
  if ((v4[8] & 1) != 0)
  {
    self->_playbackSessionPriority = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)playbackSessionIdentifier
{
  return self->_playbackSessionIdentifier;
}

- (void)setPlaybackSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_playbackSessionIdentifier, a3);
}

- (NSString)playbackSessionRevision
{
  return self->_playbackSessionRevision;
}

- (void)setPlaybackSessionRevision:(id)a3
{
  objc_storeStrong((id *)&self->_playbackSessionRevision, a3);
}

- (int)playbackSessionPriority
{
  return self->_playbackSessionPriority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackSessionRevision, 0);
  objc_storeStrong((id *)&self->_playbackSessionIdentifier, 0);
}

@end
