@implementation SPProtoAudioFilePlayerAssetUpdateMetaData

- (BOOL)hasURL
{
  return self->_uRL != 0;
}

- (void)setDuration:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasAlbumTitle
{
  return self->_albumTitle != 0;
}

- (BOOL)hasArtist
{
  return self->_artist != 0;
}

- (BOOL)hasSandboxExtensionToken
{
  return self->_sandboxExtensionToken != 0;
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
  v8.super_class = (Class)SPProtoAudioFilePlayerAssetUpdateMetaData;
  -[SPProtoAudioFilePlayerAssetUpdateMetaData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPProtoAudioFilePlayerAssetUpdateMetaData dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *uRL;
  void *v7;
  NSString *title;
  NSString *albumTitle;
  NSString *artist;
  NSString *sandboxExtensionToken;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  uRL = self->_uRL;
  if (uRL)
    objc_msgSend(v4, "setObject:forKey:", uRL, CFSTR("URL"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_duration);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("duration"));

  }
  title = self->_title;
  if (title)
    objc_msgSend(v4, "setObject:forKey:", title, CFSTR("title"));
  albumTitle = self->_albumTitle;
  if (albumTitle)
    objc_msgSend(v4, "setObject:forKey:", albumTitle, CFSTR("albumTitle"));
  artist = self->_artist;
  if (artist)
    objc_msgSend(v4, "setObject:forKey:", artist, CFSTR("artist"));
  sandboxExtensionToken = self->_sandboxExtensionToken;
  if (sandboxExtensionToken)
    objc_msgSend(v4, "setObject:forKey:", sandboxExtensionToken, CFSTR("sandboxExtensionToken"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoAudioFilePlayerAssetUpdateMetaDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  PBDataWriterWriteStringField();
  if (self->_uRL)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  v4 = v5;
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_albumTitle)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_artist)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_sandboxExtensionToken)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setIdentifier:", self->_identifier);
  if (self->_uRL)
    objc_msgSend(v5, "setURL:");
  v4 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v5 + 1) = *(_QWORD *)&self->_duration;
    *((_BYTE *)v5 + 64) |= 1u;
  }
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    v4 = v5;
  }
  if (self->_albumTitle)
  {
    objc_msgSend(v5, "setAlbumTitle:");
    v4 = v5;
  }
  if (self->_artist)
  {
    objc_msgSend(v5, "setArtist:");
    v4 = v5;
  }
  if (self->_sandboxExtensionToken)
  {
    objc_msgSend(v5, "setSandboxExtensionToken:");
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
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_uRL, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_duration;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = -[NSString copyWithZone:](self->_albumTitle, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  v14 = -[NSString copyWithZone:](self->_artist, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  v16 = -[NSString copyWithZone:](self->_sandboxExtensionToken, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  NSString *uRL;
  NSString *title;
  NSString *albumTitle;
  NSString *artist;
  NSString *sandboxExtensionToken;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_19;
  }
  uRL = self->_uRL;
  if ((unint64_t)uRL | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](uRL, "isEqual:"))
      goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_duration != *((double *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 6) && !-[NSString isEqual:](title, "isEqual:"))
    goto LABEL_19;
  albumTitle = self->_albumTitle;
  if ((unint64_t)albumTitle | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](albumTitle, "isEqual:"))
      goto LABEL_19;
  }
  artist = self->_artist;
  if ((unint64_t)artist | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](artist, "isEqual:"))
      goto LABEL_19;
  }
  sandboxExtensionToken = self->_sandboxExtensionToken;
  if ((unint64_t)sandboxExtensionToken | *((_QWORD *)v4 + 5))
    v11 = -[NSString isEqual:](sandboxExtensionToken, "isEqual:");
  else
    v11 = 1;
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  double duration;
  double v7;
  long double v8;
  double v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_uRL, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    duration = self->_duration;
    v7 = -duration;
    if (duration >= 0.0)
      v7 = self->_duration;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  v10 = v4 ^ v3 ^ v5 ^ -[NSString hash](self->_title, "hash");
  v11 = -[NSString hash](self->_albumTitle, "hash");
  v12 = v11 ^ -[NSString hash](self->_artist, "hash");
  return v10 ^ v12 ^ -[NSString hash](self->_sandboxExtensionToken, "hash");
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;

  v4 = (double *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[SPProtoAudioFilePlayerAssetUpdateMetaData setIdentifier:](self, "setIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[SPProtoAudioFilePlayerAssetUpdateMetaData setURL:](self, "setURL:");
    v4 = v5;
  }
  if (((_BYTE)v4[8] & 1) != 0)
  {
    self->_duration = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[SPProtoAudioFilePlayerAssetUpdateMetaData setTitle:](self, "setTitle:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[SPProtoAudioFilePlayerAssetUpdateMetaData setAlbumTitle:](self, "setAlbumTitle:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[SPProtoAudioFilePlayerAssetUpdateMetaData setArtist:](self, "setArtist:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[SPProtoAudioFilePlayerAssetUpdateMetaData setSandboxExtensionToken:](self, "setSandboxExtensionToken:");
    v4 = v5;
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)uRL
{
  return self->_uRL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_uRL, a3);
}

- (double)duration
{
  return self->_duration;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (void)setAlbumTitle:(id)a3
{
  objc_storeStrong((id *)&self->_albumTitle, a3);
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
  objc_storeStrong((id *)&self->_artist, a3);
}

- (NSString)sandboxExtensionToken
{
  return self->_sandboxExtensionToken;
}

- (void)setSandboxExtensionToken:(id)a3
{
  objc_storeStrong((id *)&self->_sandboxExtensionToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uRL, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionToken, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_albumTitle, 0);
}

- (id)sockPuppetMessage
{
  SPProtoAudioFilePlayerAsset *v3;
  void *v4;

  v3 = objc_alloc_init(SPProtoAudioFilePlayerAsset);
  -[SPProtoAudioFilePlayerAsset setUpsertWithMetaData:](v3, "setUpsertWithMetaData:", self);
  -[SPProtoAudioFilePlayerAsset sockPuppetMessage](v3, "sockPuppetMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
