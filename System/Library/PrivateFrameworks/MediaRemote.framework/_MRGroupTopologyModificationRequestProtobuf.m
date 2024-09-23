@implementation _MRGroupTopologyModificationRequestProtobuf

- (BOOL)hasDetails
{
  return self->_details != 0;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E30CD060[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Add")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Remove")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Set")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearOutputDeviceUIDs
{
  -[NSMutableArray removeAllObjects](self->_outputDeviceUIDs, "removeAllObjects");
}

- (void)addOutputDeviceUIDs:(id)a3
{
  id v4;
  NSMutableArray *outputDeviceUIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  outputDeviceUIDs = self->_outputDeviceUIDs;
  v8 = v4;
  if (!outputDeviceUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_outputDeviceUIDs;
    self->_outputDeviceUIDs = v6;

    v4 = v8;
    outputDeviceUIDs = self->_outputDeviceUIDs;
  }
  -[NSMutableArray addObject:](outputDeviceUIDs, "addObject:", v4);

}

- (unint64_t)outputDeviceUIDsCount
{
  return -[NSMutableArray count](self->_outputDeviceUIDs, "count");
}

- (id)outputDeviceUIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_outputDeviceUIDs, "objectAtIndex:", a3);
}

+ (Class)outputDeviceUIDsType
{
  return (Class)objc_opt_class();
}

- (void)setFadeAudio:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_fadeAudio = a3;
}

- (void)setHasFadeAudio:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFadeAudio
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasPassword
{
  return self->_password != 0;
}

- (void)setSuppressErrorDialog:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_suppressErrorDialog = a3;
}

- (void)setHasSuppressErrorDialog:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSuppressErrorDialog
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setShouldNotPauseIfLastDeviceRemoved:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_shouldNotPauseIfLastDeviceRemoved = a3;
}

- (void)setHasShouldNotPauseIfLastDeviceRemoved:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasShouldNotPauseIfLastDeviceRemoved
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setMuteUntilFinished:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_muteUntilFinished = a3;
}

- (void)setHasMuteUntilFinished:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMuteUntilFinished
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)_MRGroupTopologyModificationRequestProtobuf;
  -[_MRGroupTopologyModificationRequestProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRGroupTopologyModificationRequestProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _MRRequestDetailsProtobuf *details;
  void *v5;
  uint64_t type;
  __CFString *v7;
  NSMutableArray *outputDeviceUIDs;
  void *v9;
  NSString *password;
  char has;
  void *v12;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  details = self->_details;
  if (details)
  {
    -[_MRRequestDetailsProtobuf dictionaryRepresentation](details, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("details"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    type = self->_type;
    if (type >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E30CD060[type];
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("type"));

  }
  outputDeviceUIDs = self->_outputDeviceUIDs;
  if (outputDeviceUIDs)
    objc_msgSend(v3, "setObject:forKey:", outputDeviceUIDs, CFSTR("outputDeviceUIDs"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_fadeAudio);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("fadeAudio"));

  }
  password = self->_password;
  if (password)
    objc_msgSend(v3, "setObject:forKey:", password, CFSTR("password"));
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_16;
LABEL_20:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldNotPauseIfLastDeviceRemoved);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("shouldNotPauseIfLastDeviceRemoved"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_suppressErrorDialog);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("suppressErrorDialog"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_20;
LABEL_16:
  if ((has & 4) != 0)
  {
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_muteUntilFinished);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("muteUntilFinished"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGroupTopologyModificationRequestProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_details)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_outputDeviceUIDs;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_password)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_18;
LABEL_22:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_22;
LABEL_18:
  if ((has & 4) != 0)
LABEL_19:
    PBDataWriterWriteBOOLField();
LABEL_20:

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  _BYTE *v9;
  char has;
  _BYTE *v11;

  v4 = a3;
  v11 = v4;
  if (self->_details)
  {
    objc_msgSend(v4, "setDetails:");
    v4 = v11;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_type;
    v4[40] |= 1u;
  }
  if (-[_MRGroupTopologyModificationRequestProtobuf outputDeviceUIDsCount](self, "outputDeviceUIDsCount"))
  {
    objc_msgSend(v11, "clearOutputDeviceUIDs");
    v5 = -[_MRGroupTopologyModificationRequestProtobuf outputDeviceUIDsCount](self, "outputDeviceUIDsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[_MRGroupTopologyModificationRequestProtobuf outputDeviceUIDsAtIndex:](self, "outputDeviceUIDsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addOutputDeviceUIDs:", v8);

      }
    }
  }
  v9 = v11;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v11[36] = self->_fadeAudio;
    v11[40] |= 2u;
  }
  if (self->_password)
  {
    objc_msgSend(v11, "setPassword:");
    v9 = v11;
  }
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_15;
LABEL_19:
    v9[38] = self->_shouldNotPauseIfLastDeviceRemoved;
    v9[40] |= 8u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
  v9[39] = self->_suppressErrorDialog;
  v9[40] |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_19;
LABEL_15:
  if ((has & 4) != 0)
  {
LABEL_16:
    v9[37] = self->_muteUntilFinished;
    v9[40] |= 4u;
  }
LABEL_17:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  char has;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_MRRequestDetailsProtobuf copyWithZone:](self->_details, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_type;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_outputDeviceUIDs;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend((id)v5, "addOutputDeviceUIDs:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 36) = self->_fadeAudio;
    *(_BYTE *)(v5 + 40) |= 2u;
  }
  v14 = -[NSString copyWithZone:](self->_password, "copyWithZone:", a3, (_QWORD)v18);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_14;
LABEL_18:
    *(_BYTE *)(v5 + 38) = self->_shouldNotPauseIfLastDeviceRemoved;
    *(_BYTE *)(v5 + 40) |= 8u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return (id)v5;
    goto LABEL_15;
  }
  *(_BYTE *)(v5 + 39) = self->_suppressErrorDialog;
  *(_BYTE *)(v5 + 40) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_18;
LABEL_14:
  if ((has & 4) != 0)
  {
LABEL_15:
    *(_BYTE *)(v5 + 37) = self->_muteUntilFinished;
    *(_BYTE *)(v5 + 40) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _MRRequestDetailsProtobuf *details;
  char has;
  NSMutableArray *outputDeviceUIDs;
  NSString *password;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_41;
  details = self->_details;
  if ((unint64_t)details | *((_QWORD *)v4 + 1))
  {
    if (!-[_MRRequestDetailsProtobuf isEqual:](details, "isEqual:"))
      goto LABEL_41;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_type != *((_DWORD *)v4 + 8))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_41;
  }
  outputDeviceUIDs = self->_outputDeviceUIDs;
  if ((unint64_t)outputDeviceUIDs | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](outputDeviceUIDs, "isEqual:"))
      goto LABEL_41;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0)
      goto LABEL_41;
    if (self->_fadeAudio)
    {
      if (!*((_BYTE *)v4 + 36))
        goto LABEL_41;
    }
    else if (*((_BYTE *)v4 + 36))
    {
      goto LABEL_41;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_41;
  }
  password = self->_password;
  if ((unint64_t)password | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](password, "isEqual:"))
      goto LABEL_41;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 0x10) == 0)
      goto LABEL_41;
    if (self->_suppressErrorDialog)
    {
      if (!*((_BYTE *)v4 + 39))
        goto LABEL_41;
    }
    else if (*((_BYTE *)v4 + 39))
    {
      goto LABEL_41;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 0x10) != 0)
  {
    goto LABEL_41;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) == 0)
      goto LABEL_41;
    if (self->_shouldNotPauseIfLastDeviceRemoved)
    {
      if (!*((_BYTE *)v4 + 38))
        goto LABEL_41;
    }
    else if (*((_BYTE *)v4 + 38))
    {
      goto LABEL_41;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 8) != 0)
  {
    goto LABEL_41;
  }
  v9 = (*((_BYTE *)v4 + 40) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) != 0)
    {
      if (self->_muteUntilFinished)
      {
        if (!*((_BYTE *)v4 + 37))
          goto LABEL_41;
      }
      else if (*((_BYTE *)v4 + 37))
      {
        goto LABEL_41;
      }
      v9 = 1;
      goto LABEL_42;
    }
LABEL_41:
    v9 = 0;
  }
LABEL_42:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[_MRRequestDetailsProtobuf hash](self->_details, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_type;
  else
    v4 = 0;
  v5 = -[NSMutableArray hash](self->_outputDeviceUIDs, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761 * self->_fadeAudio;
  else
    v6 = 0;
  v7 = -[NSString hash](self->_password, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_9;
LABEL_12:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_10;
LABEL_13:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
  v8 = 2654435761 * self->_suppressErrorDialog;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_12;
LABEL_9:
  v9 = 2654435761 * self->_shouldNotPauseIfLastDeviceRemoved;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_13;
LABEL_10:
  v10 = 2654435761 * self->_muteUntilFinished;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _MRRequestDetailsProtobuf *details;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  details = self->_details;
  v6 = *((_QWORD *)v4 + 1);
  if (details)
  {
    if (v6)
      -[_MRRequestDetailsProtobuf mergeFrom:](details, "mergeFrom:");
  }
  else if (v6)
  {
    -[_MRGroupTopologyModificationRequestProtobuf setDetails:](self, "setDetails:");
  }
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_type = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = *((id *)v4 + 2);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        -[_MRGroupTopologyModificationRequestProtobuf addOutputDeviceUIDs:](self, "addOutputDeviceUIDs:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    self->_fadeAudio = *((_BYTE *)v4 + 36);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 3))
    -[_MRGroupTopologyModificationRequestProtobuf setPassword:](self, "setPassword:");
  v12 = *((_BYTE *)v4 + 40);
  if ((v12 & 0x10) == 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) == 0)
      goto LABEL_21;
LABEL_25:
    self->_shouldNotPauseIfLastDeviceRemoved = *((_BYTE *)v4 + 38);
    *(_BYTE *)&self->_has |= 8u;
    if ((*((_BYTE *)v4 + 40) & 4) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
  self->_suppressErrorDialog = *((_BYTE *)v4 + 39);
  *(_BYTE *)&self->_has |= 0x10u;
  v12 = *((_BYTE *)v4 + 40);
  if ((v12 & 8) != 0)
    goto LABEL_25;
LABEL_21:
  if ((v12 & 4) != 0)
  {
LABEL_22:
    self->_muteUntilFinished = *((_BYTE *)v4 + 37);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_23:

}

- (_MRRequestDetailsProtobuf)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
  objc_storeStrong((id *)&self->_details, a3);
}

- (NSMutableArray)outputDeviceUIDs
{
  return self->_outputDeviceUIDs;
}

- (void)setOutputDeviceUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_outputDeviceUIDs, a3);
}

- (BOOL)fadeAudio
{
  return self->_fadeAudio;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_storeStrong((id *)&self->_password, a3);
}

- (BOOL)suppressErrorDialog
{
  return self->_suppressErrorDialog;
}

- (BOOL)shouldNotPauseIfLastDeviceRemoved
{
  return self->_shouldNotPauseIfLastDeviceRemoved;
}

- (BOOL)muteUntilFinished
{
  return self->_muteUntilFinished;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_outputDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_details, 0);
}

@end
