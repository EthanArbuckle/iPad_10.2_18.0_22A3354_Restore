@implementation _MRLyricsItemProtobuf

- (void)setUserProvided:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_userProvided = a3;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (void)setLyrics:(id)a3
{
  objc_storeStrong((id *)&self->_lyrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_lyrics, 0);
}

- (BOOL)hasLyrics
{
  return self->_lyrics != 0;
}

- (void)setHasUserProvided:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUserProvided
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasToken
{
  return self->_token != 0;
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
  v8.super_class = (Class)_MRLyricsItemProtobuf;
  -[_MRLyricsItemProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRLyricsItemProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *lyrics;
  void *v6;
  _MRLyricsTokenProtobuf *token;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  lyrics = self->_lyrics;
  if (lyrics)
    objc_msgSend(v3, "setObject:forKey:", lyrics, CFSTR("lyrics"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userProvided);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("userProvided"));

  }
  token = self->_token;
  if (token)
  {
    -[_MRLyricsTokenProtobuf dictionaryRepresentation](token, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("token"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRLyricsItemProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_lyrics)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_token)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  v5 = v4;
  if (self->_lyrics)
  {
    objc_msgSend(v4, "setLyrics:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[24] = self->_userProvided;
    v4[28] |= 1u;
  }
  if (self->_token)
  {
    objc_msgSend(v5, "setToken:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_lyrics, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 24) = self->_userProvided;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v8 = -[_MRLyricsTokenProtobuf copyWithZone:](self->_token, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *lyrics;
  char v6;
  _MRLyricsTokenProtobuf *token;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  lyrics = self->_lyrics;
  if ((unint64_t)lyrics | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](lyrics, "isEqual:"))
      goto LABEL_8;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0)
    {
      if (self->_userProvided)
      {
        if (*((_BYTE *)v4 + 24))
          goto LABEL_14;
      }
      else if (!*((_BYTE *)v4 + 24))
      {
        goto LABEL_14;
      }
    }
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
    goto LABEL_8;
LABEL_14:
  token = self->_token;
  if ((unint64_t)token | *((_QWORD *)v4 + 2))
    v6 = -[_MRLyricsTokenProtobuf isEqual:](token, "isEqual:");
  else
    v6 = 1;
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_lyrics, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_userProvided;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[_MRLyricsTokenProtobuf hash](self->_token, "hash");
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  _MRLyricsTokenProtobuf *token;
  uint64_t v6;
  BOOL *v7;

  v4 = (BOOL *)a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[_MRLyricsItemProtobuf setLyrics:](self, "setLyrics:");
    v4 = v7;
  }
  if (v4[28])
  {
    self->_userProvided = v4[24];
    *(_BYTE *)&self->_has |= 1u;
  }
  token = self->_token;
  v6 = *((_QWORD *)v4 + 2);
  if (token)
  {
    if (v6)
    {
      -[_MRLyricsTokenProtobuf mergeFrom:](token, "mergeFrom:");
LABEL_10:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[_MRLyricsItemProtobuf setToken:](self, "setToken:");
    goto LABEL_10;
  }

}

- (NSString)lyrics
{
  return self->_lyrics;
}

- (BOOL)userProvided
{
  return self->_userProvided;
}

- (_MRLyricsTokenProtobuf)token
{
  return self->_token;
}

@end
