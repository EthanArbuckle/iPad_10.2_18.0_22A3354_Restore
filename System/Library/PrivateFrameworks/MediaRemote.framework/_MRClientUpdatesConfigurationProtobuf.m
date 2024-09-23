@implementation _MRClientUpdatesConfigurationProtobuf

- (void)setNowPlayingUpdates:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_nowPlayingUpdates = a3;
}

- (void)setHasNowPlayingUpdates:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNowPlayingUpdates
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setArtworkUpdates:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_artworkUpdates = a3;
}

- (void)setHasArtworkUpdates:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasArtworkUpdates
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setVolumeUpdates:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_volumeUpdates = a3;
}

- (void)setHasVolumeUpdates:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasVolumeUpdates
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setKeyboardUpdates:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_keyboardUpdates = a3;
}

- (void)setHasKeyboardUpdates:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasKeyboardUpdates
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setOutputDeviceUpdates:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_outputDeviceUpdates = a3;
}

- (void)setHasOutputDeviceUpdates:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasOutputDeviceUpdates
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSystemEndpointUpdates:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_systemEndpointUpdates = a3;
}

- (void)setHasSystemEndpointUpdates:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSystemEndpointUpdates
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)clearSubscribedPlayerPaths
{
  -[NSMutableArray removeAllObjects](self->_subscribedPlayerPaths, "removeAllObjects");
}

- (void)addSubscribedPlayerPaths:(id)a3
{
  id v4;
  NSMutableArray *subscribedPlayerPaths;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  subscribedPlayerPaths = self->_subscribedPlayerPaths;
  v8 = v4;
  if (!subscribedPlayerPaths)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_subscribedPlayerPaths;
    self->_subscribedPlayerPaths = v6;

    v4 = v8;
    subscribedPlayerPaths = self->_subscribedPlayerPaths;
  }
  -[NSMutableArray addObject:](subscribedPlayerPaths, "addObject:", v4);

}

- (unint64_t)subscribedPlayerPathsCount
{
  return -[NSMutableArray count](self->_subscribedPlayerPaths, "count");
}

- (id)subscribedPlayerPathsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_subscribedPlayerPaths, "objectAtIndex:", a3);
}

+ (Class)subscribedPlayerPathsType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)_MRClientUpdatesConfigurationProtobuf;
  -[_MRClientUpdatesConfigurationProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRClientUpdatesConfigurationProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_nowPlayingUpdates);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("nowPlayingUpdates"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_artworkUpdates);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("artworkUpdates"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_volumeUpdates);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("volumeUpdates"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_keyboardUpdates);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("keyboardUpdates"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_outputDeviceUpdates);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("outputDeviceUpdates"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_systemEndpointUpdates);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("systemEndpointUpdates"));

  }
LABEL_8:
  if (-[NSMutableArray count](self->_subscribedPlayerPaths, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_subscribedPlayerPaths, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = self->_subscribedPlayerPaths;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v19);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("subscribedPlayerPaths"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRClientUpdatesConfigurationProtobufReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_7:
    PBDataWriterWriteBOOLField();
LABEL_8:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_subscribedPlayerPaths;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id v10;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[18] = self->_nowPlayingUpdates;
    v4[24] |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[16] = self->_artworkUpdates;
  v4[24] |= 1u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  v4[21] = self->_volumeUpdates;
  v4[24] |= 0x20u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
LABEL_17:
    v4[19] = self->_outputDeviceUpdates;
    v4[24] |= 8u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_16:
  v4[17] = self->_keyboardUpdates;
  v4[24] |= 2u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_17;
LABEL_6:
  if ((has & 0x10) != 0)
  {
LABEL_7:
    v4[20] = self->_systemEndpointUpdates;
    v4[24] |= 0x10u;
  }
LABEL_8:
  v10 = v4;
  if (-[_MRClientUpdatesConfigurationProtobuf subscribedPlayerPathsCount](self, "subscribedPlayerPathsCount"))
  {
    objc_msgSend(v10, "clearSubscribedPlayerPaths");
    v6 = -[_MRClientUpdatesConfigurationProtobuf subscribedPlayerPathsCount](self, "subscribedPlayerPathsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[_MRClientUpdatesConfigurationProtobuf subscribedPlayerPathsAtIndex:](self, "subscribedPlayerPathsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addSubscribedPlayerPaths:", v9);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v5;
  void *v6;
  char has;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5[18] = self->_nowPlayingUpdates;
    v5[24] |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v5[16] = self->_artworkUpdates;
  v5[24] |= 1u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  v5[21] = self->_volumeUpdates;
  v5[24] |= 0x20u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  v5[17] = self->_keyboardUpdates;
  v5[24] |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_20:
  v5[19] = self->_outputDeviceUpdates;
  v5[24] |= 8u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    v5[20] = self->_systemEndpointUpdates;
    v5[24] |= 0x10u;
  }
LABEL_8:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_subscribedPlayerPaths;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend(v6, "addSubscribedPlayerPaths:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  NSMutableArray *subscribedPlayerPaths;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_46;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0)
      goto LABEL_46;
    if (self->_nowPlayingUpdates)
    {
      if (!*((_BYTE *)v4 + 18))
        goto LABEL_46;
    }
    else if (*((_BYTE *)v4 + 18))
    {
      goto LABEL_46;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 4) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0)
      goto LABEL_46;
    if (self->_artworkUpdates)
    {
      if (!*((_BYTE *)v4 + 16))
        goto LABEL_46;
    }
    else if (*((_BYTE *)v4 + 16))
    {
      goto LABEL_46;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 0x20) == 0)
      goto LABEL_46;
    if (self->_volumeUpdates)
    {
      if (!*((_BYTE *)v4 + 21))
        goto LABEL_46;
    }
    else if (*((_BYTE *)v4 + 21))
    {
      goto LABEL_46;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 0x20) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0)
      goto LABEL_46;
    if (self->_keyboardUpdates)
    {
      if (!*((_BYTE *)v4 + 17))
        goto LABEL_46;
    }
    else if (*((_BYTE *)v4 + 17))
    {
      goto LABEL_46;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 8) == 0)
      goto LABEL_46;
    if (self->_outputDeviceUpdates)
    {
      if (!*((_BYTE *)v4 + 19))
        goto LABEL_46;
    }
    else if (*((_BYTE *)v4 + 19))
    {
      goto LABEL_46;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 8) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    if ((*((_BYTE *)v4 + 24) & 0x10) == 0)
      goto LABEL_52;
LABEL_46:
    v5 = 0;
    goto LABEL_47;
  }
  if ((*((_BYTE *)v4 + 24) & 0x10) == 0)
    goto LABEL_46;
  if (!self->_systemEndpointUpdates)
  {
    if (!*((_BYTE *)v4 + 20))
      goto LABEL_52;
    goto LABEL_46;
  }
  if (!*((_BYTE *)v4 + 20))
    goto LABEL_46;
LABEL_52:
  subscribedPlayerPaths = self->_subscribedPlayerPaths;
  if ((unint64_t)subscribedPlayerPaths | *((_QWORD *)v4 + 1))
    v5 = -[NSMutableArray isEqual:](subscribedPlayerPaths, "isEqual:");
  else
    v5 = 1;
LABEL_47:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v2 = 2654435761 * self->_nowPlayingUpdates;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_artworkUpdates;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_volumeUpdates;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_keyboardUpdates;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
LABEL_12:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_7;
LABEL_13:
    v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ -[NSMutableArray hash](self->_subscribedPlayerPaths, "hash");
  }
LABEL_11:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_12;
LABEL_6:
  v6 = 2654435761 * self->_outputDeviceUpdates;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_13;
LABEL_7:
  v7 = 2654435761 * self->_systemEndpointUpdates;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ -[NSMutableArray hash](self->_subscribedPlayerPaths, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 24);
  if ((v6 & 4) != 0)
  {
    self->_nowPlayingUpdates = *((_BYTE *)v4 + 18);
    *(_BYTE *)&self->_has |= 4u;
    v6 = *((_BYTE *)v4 + 24);
    if ((v6 & 1) == 0)
    {
LABEL_3:
      if ((v6 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_artworkUpdates = *((_BYTE *)v4 + 16);
  *(_BYTE *)&self->_has |= 1u;
  v6 = *((_BYTE *)v4 + 24);
  if ((v6 & 0x20) == 0)
  {
LABEL_4:
    if ((v6 & 2) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  self->_volumeUpdates = *((_BYTE *)v4 + 21);
  *(_BYTE *)&self->_has |= 0x20u;
  v6 = *((_BYTE *)v4 + 24);
  if ((v6 & 2) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  self->_keyboardUpdates = *((_BYTE *)v4 + 17);
  *(_BYTE *)&self->_has |= 2u;
  v6 = *((_BYTE *)v4 + 24);
  if ((v6 & 8) == 0)
  {
LABEL_6:
    if ((v6 & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_20:
  self->_outputDeviceUpdates = *((_BYTE *)v4 + 19);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 24) & 0x10) != 0)
  {
LABEL_7:
    self->_systemEndpointUpdates = *((_BYTE *)v4 + 20);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_8:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v4 + 1);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[_MRClientUpdatesConfigurationProtobuf addSubscribedPlayerPaths:](self, "addSubscribedPlayerPaths:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (BOOL)nowPlayingUpdates
{
  return self->_nowPlayingUpdates;
}

- (BOOL)artworkUpdates
{
  return self->_artworkUpdates;
}

- (BOOL)volumeUpdates
{
  return self->_volumeUpdates;
}

- (BOOL)keyboardUpdates
{
  return self->_keyboardUpdates;
}

- (BOOL)outputDeviceUpdates
{
  return self->_outputDeviceUpdates;
}

- (BOOL)systemEndpointUpdates
{
  return self->_systemEndpointUpdates;
}

- (NSMutableArray)subscribedPlayerPaths
{
  return self->_subscribedPlayerPaths;
}

- (void)setSubscribedPlayerPaths:(id)a3
{
  objc_storeStrong((id *)&self->_subscribedPlayerPaths, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribedPlayerPaths, 0);
}

@end
