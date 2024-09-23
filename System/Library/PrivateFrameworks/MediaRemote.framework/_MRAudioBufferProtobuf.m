@implementation _MRAudioBufferProtobuf

- (BOOL)hasFormatSettings
{
  return self->_formatSettings != 0;
}

- (void)setPacketCapacity:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_packetCapacity = a3;
}

- (void)setHasPacketCapacity:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPacketCapacity
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMaximumPacketSize:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_maximumPacketSize = a3;
}

- (void)setHasMaximumPacketSize:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaximumPacketSize
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setPacketCount:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_packetCount = a3;
}

- (void)setHasPacketCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPacketCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasContents
{
  return self->_contents != 0;
}

- (void)clearPacketDescriptions
{
  -[NSMutableArray removeAllObjects](self->_packetDescriptions, "removeAllObjects");
}

- (void)addPacketDescriptions:(id)a3
{
  id v4;
  NSMutableArray *packetDescriptions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  packetDescriptions = self->_packetDescriptions;
  v8 = v4;
  if (!packetDescriptions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_packetDescriptions;
    self->_packetDescriptions = v6;

    v4 = v8;
    packetDescriptions = self->_packetDescriptions;
  }
  -[NSMutableArray addObject:](packetDescriptions, "addObject:", v4);

}

- (unint64_t)packetDescriptionsCount
{
  return -[NSMutableArray count](self->_packetDescriptions, "count");
}

- (id)packetDescriptionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_packetDescriptions, "objectAtIndex:", a3);
}

+ (Class)packetDescriptionsType
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
  v8.super_class = (Class)_MRAudioBufferProtobuf;
  -[_MRAudioBufferProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAudioBufferProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _MRAudioFormatSettingsProtobuf *formatSettings;
  void *v5;
  char has;
  void *v7;
  NSData *contents;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
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
  formatSettings = self->_formatSettings;
  if (formatSettings)
  {
    -[_MRAudioFormatSettingsProtobuf dictionaryRepresentation](formatSettings, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("formatSettings"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_packetCapacity);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("packetCapacity"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_maximumPacketSize);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("maximumPacketSize"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_packetCount);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("packetCount"));

  }
LABEL_7:
  contents = self->_contents;
  if (contents)
    objc_msgSend(v3, "setObject:forKey:", contents, CFSTR("contents"));
  if (-[NSMutableArray count](self->_packetDescriptions, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_packetDescriptions, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = self->_packetDescriptions;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v19);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("packetDescriptions"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRAudioBufferProtobufReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_formatSettings)
    PBDataWriterWriteSubmessage();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt64Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_6:
    PBDataWriterWriteInt64Field();
LABEL_7:
  if (self->_contents)
    PBDataWriterWriteDataField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_packetDescriptions;
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
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_formatSettings)
  {
    objc_msgSend(v4, "setFormatSettings:");
    v4 = v10;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_packetCapacity;
    *((_BYTE *)v4 + 56) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v4 + 1) = self->_maximumPacketSize;
  *((_BYTE *)v4 + 56) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_6:
    *((_QWORD *)v4 + 3) = self->_packetCount;
    *((_BYTE *)v4 + 56) |= 4u;
  }
LABEL_7:
  if (self->_contents)
    objc_msgSend(v10, "setContents:");
  if (-[_MRAudioBufferProtobuf packetDescriptionsCount](self, "packetDescriptionsCount"))
  {
    objc_msgSend(v10, "clearPacketDescriptions");
    v6 = -[_MRAudioBufferProtobuf packetDescriptionsCount](self, "packetDescriptionsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[_MRAudioBufferProtobuf packetDescriptionsAtIndex:](self, "packetDescriptionsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addPacketDescriptions:", v9);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_MRAudioFormatSettingsProtobuf copyWithZone:](self->_formatSettings, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_packetCapacity;
    *(_BYTE *)(v5 + 56) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 8) = self->_maximumPacketSize;
  *(_BYTE *)(v5 + 56) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 24) = self->_packetCount;
    *(_BYTE *)(v5 + 56) |= 4u;
  }
LABEL_5:
  v9 = -[NSData copyWithZone:](self->_contents, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_packetDescriptions;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend((id)v5, "addPacketDescriptions:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _MRAudioFormatSettingsProtobuf *formatSettings;
  NSData *contents;
  NSMutableArray *packetDescriptions;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  formatSettings = self->_formatSettings;
  if ((unint64_t)formatSettings | *((_QWORD *)v4 + 5))
  {
    if (!-[_MRAudioFormatSettingsProtobuf isEqual:](formatSettings, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_packetCapacity != *((_QWORD *)v4 + 2))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
LABEL_23:
    v8 = 0;
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_maximumPacketSize != *((_QWORD *)v4 + 1))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_packetCount != *((_QWORD *)v4 + 3))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_23;
  }
  contents = self->_contents;
  if ((unint64_t)contents | *((_QWORD *)v4 + 4) && !-[NSData isEqual:](contents, "isEqual:"))
    goto LABEL_23;
  packetDescriptions = self->_packetDescriptions;
  if ((unint64_t)packetDescriptions | *((_QWORD *)v4 + 6))
    v8 = -[NSMutableArray isEqual:](packetDescriptions, "isEqual:");
  else
    v8 = 1;
LABEL_24:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[_MRAudioFormatSettingsProtobuf hash](self->_formatSettings, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v4 = 2654435761 * self->_packetCapacity;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_maximumPacketSize;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_packetCount;
LABEL_8:
  v7 = v4 ^ v3 ^ v5 ^ v6 ^ -[NSData hash](self->_contents, "hash");
  return v7 ^ -[NSMutableArray hash](self->_packetDescriptions, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _MRAudioFormatSettingsProtobuf *formatSettings;
  uint64_t v6;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  formatSettings = self->_formatSettings;
  v6 = *((_QWORD *)v4 + 5);
  if (formatSettings)
  {
    if (v6)
      -[_MRAudioFormatSettingsProtobuf mergeFrom:](formatSettings, "mergeFrom:");
  }
  else if (v6)
  {
    -[_MRAudioBufferProtobuf setFormatSettings:](self, "setFormatSettings:");
  }
  v7 = *((_BYTE *)v4 + 56);
  if ((v7 & 2) != 0)
  {
    self->_packetCapacity = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v7 = *((_BYTE *)v4 + 56);
    if ((v7 & 1) == 0)
    {
LABEL_8:
      if ((v7 & 4) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*((_BYTE *)v4 + 56) & 1) == 0)
  {
    goto LABEL_8;
  }
  self->_maximumPacketSize = *((_QWORD *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
LABEL_9:
    self->_packetCount = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_10:
  if (*((_QWORD *)v4 + 4))
    -[_MRAudioBufferProtobuf setContents:](self, "setContents:");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *((id *)v4 + 6);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[_MRAudioBufferProtobuf addPacketDescriptions:](self, "addPacketDescriptions:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (_MRAudioFormatSettingsProtobuf)formatSettings
{
  return self->_formatSettings;
}

- (void)setFormatSettings:(id)a3
{
  objc_storeStrong((id *)&self->_formatSettings, a3);
}

- (int64_t)packetCapacity
{
  return self->_packetCapacity;
}

- (int64_t)maximumPacketSize
{
  return self->_maximumPacketSize;
}

- (int64_t)packetCount
{
  return self->_packetCount;
}

- (NSData)contents
{
  return self->_contents;
}

- (void)setContents:(id)a3
{
  objc_storeStrong((id *)&self->_contents, a3);
}

- (NSMutableArray)packetDescriptions
{
  return self->_packetDescriptions;
}

- (void)setPacketDescriptions:(id)a3
{
  objc_storeStrong((id *)&self->_packetDescriptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packetDescriptions, 0);
  objc_storeStrong((id *)&self->_formatSettings, 0);
  objc_storeStrong((id *)&self->_contents, 0);
}

@end
