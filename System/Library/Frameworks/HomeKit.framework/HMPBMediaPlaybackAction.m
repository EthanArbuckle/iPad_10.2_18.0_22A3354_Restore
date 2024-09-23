@implementation HMPBMediaPlaybackAction

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HMPBMediaPlaybackAction;
  -[HMPBMediaPlaybackAction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPBMediaPlaybackAction dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *actionUUID;
  NSMutableArray *mediaProfiles;
  void *v7;
  NSData *volume;
  NSData *playbackArchive;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  actionUUID = self->_actionUUID;
  if (actionUUID)
    objc_msgSend(v3, "setObject:forKey:", actionUUID, CFSTR("actionUUID"));
  mediaProfiles = self->_mediaProfiles;
  if (mediaProfiles)
    objc_msgSend(v4, "setObject:forKey:", mediaProfiles, CFSTR("mediaProfiles"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_mediaPlaybackState);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("mediaPlaybackState"));

  }
  volume = self->_volume;
  if (volume)
    objc_msgSend(v4, "setObject:forKey:", volume, CFSTR("volume"));
  playbackArchive = self->_playbackArchive;
  if (playbackArchive)
    objc_msgSend(v4, "setObject:forKey:", playbackArchive, CFSTR("playbackArchive"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HMPBMediaPlaybackActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_actionUUID)
    PBDataWriterWriteDataField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_mediaProfiles;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_volume)
    PBDataWriterWriteDataField();
  if (self->_playbackArchive)
    PBDataWriterWriteDataField();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_actionUUID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = self->_mediaProfiles;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v19);
        -[HMPBMediaPlaybackAction addMediaProfiles:](v5, v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_mediaPlaybackState;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v14 = -[NSData copyWithZone:](self->_volume, "copyWithZone:", a3, (_QWORD)v19);
  v15 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v14;

  v16 = -[NSData copyWithZone:](self->_playbackArchive, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *actionUUID;
  NSMutableArray *mediaProfiles;
  NSData *volume;
  NSData *playbackArchive;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  actionUUID = self->_actionUUID;
  if ((unint64_t)actionUUID | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](actionUUID, "isEqual:"))
      goto LABEL_15;
  }
  mediaProfiles = self->_mediaProfiles;
  if ((unint64_t)mediaProfiles | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](mediaProfiles, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_mediaPlaybackState != *((_DWORD *)v4 + 4))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  volume = self->_volume;
  if ((unint64_t)volume | *((_QWORD *)v4 + 5) && !-[NSData isEqual:](volume, "isEqual:"))
    goto LABEL_15;
  playbackArchive = self->_playbackArchive;
  if ((unint64_t)playbackArchive | *((_QWORD *)v4 + 4))
    v9 = -[NSData isEqual:](playbackArchive, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSData hash](self->_actionUUID, "hash");
  v4 = -[NSMutableArray hash](self->_mediaProfiles, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_mediaPlaybackState;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[NSData hash](self->_volume, "hash");
  return v6 ^ -[NSData hash](self->_playbackArchive, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_playbackArchive, 0);
  objc_storeStrong((id *)&self->_mediaProfiles, 0);
  objc_storeStrong((id *)&self->_actionUUID, 0);
}

- (void)addMediaProfiles:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

@end
