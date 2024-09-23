@implementation ETPVideo

- (BOOL)hasIntroMessageData
{
  return self->_introMessageData != 0;
}

- (BOOL)hasPlayingMessagesData
{
  return self->_playingMessagesData != 0;
}

- (int)mediaType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_mediaType;
  else
    return 1;
}

- (void)setMediaType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_mediaType = a3;
}

- (void)setHasMediaType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMediaType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)mediaTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("Video");
  if (a3 == 2)
  {
    v3 = CFSTR("Photo");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsMediaType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Video")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Photo")))
      v4 = 2;
    else
      v4 = 1;
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)ETPVideo;
  -[ETPVideo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETPVideo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *introMessageData;
  NSData *playingMessagesData;
  int mediaType;
  __CFString *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  introMessageData = self->_introMessageData;
  if (introMessageData)
    objc_msgSend(v3, "setObject:forKey:", introMessageData, CFSTR("introMessageData"));
  playingMessagesData = self->_playingMessagesData;
  if (playingMessagesData)
    objc_msgSend(v4, "setObject:forKey:", playingMessagesData, CFSTR("playingMessagesData"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    mediaType = self->_mediaType;
    if (mediaType == 1)
    {
      v8 = CFSTR("Video");
    }
    else if (mediaType == 2)
    {
      v8 = CFSTR("Photo");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_mediaType);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("mediaType"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ETPVideoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_introMessageData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_playingMessagesData)
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

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_introMessageData, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSData copyWithZone:](self->_playingMessagesData, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_mediaType;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *introMessageData;
  NSData *playingMessagesData;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  introMessageData = self->_introMessageData;
  if ((unint64_t)introMessageData | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](introMessageData, "isEqual:"))
      goto LABEL_10;
  }
  playingMessagesData = self->_playingMessagesData;
  if ((unint64_t)playingMessagesData | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](playingMessagesData, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) != 0 && self->_mediaType == *((_DWORD *)v4 + 4))
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
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSData hash](self->_introMessageData, "hash");
  v4 = -[NSData hash](self->_playingMessagesData, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_mediaType;
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
    -[ETPVideo setIntroMessageData:](self, "setIntroMessageData:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[ETPVideo setPlayingMessagesData:](self, "setPlayingMessagesData:");
    v4 = v5;
  }
  if ((v4[8] & 1) != 0)
  {
    self->_mediaType = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSData)introMessageData
{
  return self->_introMessageData;
}

- (void)setIntroMessageData:(id)a3
{
  objc_storeStrong((id *)&self->_introMessageData, a3);
}

- (NSData)playingMessagesData
{
  return self->_playingMessagesData;
}

- (void)setPlayingMessagesData:(id)a3
{
  objc_storeStrong((id *)&self->_playingMessagesData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playingMessagesData, 0);
  objc_storeStrong((id *)&self->_introMessageData, 0);
}

@end
