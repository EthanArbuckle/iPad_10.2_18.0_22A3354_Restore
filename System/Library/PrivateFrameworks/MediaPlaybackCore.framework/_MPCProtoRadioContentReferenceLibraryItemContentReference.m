@implementation _MPCProtoRadioContentReferenceLibraryItemContentReference

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)_MPCProtoRadioContentReferenceLibraryItemContentReference;
  -[_MPCProtoRadioContentReferenceLibraryItemContentReference description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCProtoRadioContentReferenceLibraryItemContentReference dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *albumArtistName;
  NSString *albumName;
  NSString *artistName;
  NSString *composerName;
  void *v9;
  NSString *copyrightText;
  __int16 has;
  void *v12;
  NSString *genreName;
  __int16 v14;
  void *v15;
  void *v16;
  NSString *title;
  __int16 v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  albumArtistName = self->_albumArtistName;
  if (albumArtistName)
    objc_msgSend(v3, "setObject:forKey:", albumArtistName, CFSTR("albumArtistName"));
  albumName = self->_albumName;
  if (albumName)
    objc_msgSend(v4, "setObject:forKey:", albumName, CFSTR("albumName"));
  artistName = self->_artistName;
  if (artistName)
    objc_msgSend(v4, "setObject:forKey:", artistName, CFSTR("artistName"));
  composerName = self->_composerName;
  if (composerName)
    objc_msgSend(v4, "setObject:forKey:", composerName, CFSTR("composerName"));
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_contentType);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("contentType"));

  }
  copyrightText = self->_copyrightText;
  if (copyrightText)
    objc_msgSend(v4, "setObject:forKey:", copyrightText, CFSTR("copyrightText"));
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_albumDiscCount);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("albumDiscCount"));

    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_15:
      if ((has & 4) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_discNumber);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("discNumber"));

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_fileSize);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("fileSize"));

  }
LABEL_17:
  genreName = self->_genreName;
  if (genreName)
    objc_msgSend(v4, "setObject:forKey:", genreName, CFSTR("genreName"));
  v14 = (__int16)self->_has;
  if ((v14 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isCompilation);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("isCompilation"));

    v14 = (__int16)self->_has;
  }
  if ((v14 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_duration);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("duration"));

  }
  title = self->_title;
  if (title)
    objc_msgSend(v4, "setObject:forKey:", title, CFSTR("title"));
  v18 = (__int16)self->_has;
  if ((v18 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_storeAdamID);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("storeAdamID"));

    v18 = (__int16)self->_has;
    if ((v18 & 1) == 0)
    {
LABEL_27:
      if ((v18 & 0x20) == 0)
        goto LABEL_28;
      goto LABEL_37;
    }
  }
  else if ((v18 & 1) == 0)
  {
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_cloudID);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("cloudID"));

  v18 = (__int16)self->_has;
  if ((v18 & 0x20) == 0)
  {
LABEL_28:
    if ((v18 & 0x100) == 0)
      goto LABEL_29;
LABEL_38:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_trackNumber);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("trackNumber"));

    if ((*(_WORD *)&self->_has & 0x200) == 0)
      return v4;
    goto LABEL_30;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_albumTrackCount);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("albumTrackCount"));

  v18 = (__int16)self->_has;
  if ((v18 & 0x100) != 0)
    goto LABEL_38;
LABEL_29:
  if ((v18 & 0x200) != 0)
  {
LABEL_30:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_year);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("year"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MPCProtoRadioContentReferenceLibraryItemContentReferenceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self->_albumArtistName)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_albumName)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_artistName)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_composerName)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v8;
  }
  if (self->_copyrightText)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v8;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_15:
      if ((has & 4) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteInt32Field();
  v4 = v8;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_16:
    PBDataWriterWriteDoubleField();
    v4 = v8;
  }
LABEL_17:
  if (self->_genreName)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v8;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v8;
    v7 = (__int16)self->_has;
    if ((v7 & 1) == 0)
    {
LABEL_27:
      if ((v7 & 0x20) == 0)
        goto LABEL_28;
      goto LABEL_37;
    }
  }
  else if ((v7 & 1) == 0)
  {
    goto LABEL_27;
  }
  PBDataWriterWriteInt64Field();
  v4 = v8;
  v7 = (__int16)self->_has;
  if ((v7 & 0x20) == 0)
  {
LABEL_28:
    if ((v7 & 0x100) == 0)
      goto LABEL_29;
LABEL_38:
    PBDataWriterWriteInt32Field();
    v4 = v8;
    if ((*(_WORD *)&self->_has & 0x200) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_37:
  PBDataWriterWriteInt32Field();
  v4 = v8;
  v7 = (__int16)self->_has;
  if ((v7 & 0x100) != 0)
    goto LABEL_38;
LABEL_29:
  if ((v7 & 0x200) != 0)
  {
LABEL_30:
    PBDataWriterWriteInt32Field();
    v4 = v8;
  }
LABEL_31:

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
  __int16 has;
  uint64_t v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  void *v21;
  __int16 v22;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_albumArtistName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[NSString copyWithZone:](self->_albumName, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  v10 = -[NSString copyWithZone:](self->_artistName, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v10;

  v12 = -[NSString copyWithZone:](self->_composerName, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v12;

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_contentType;
    *(_WORD *)(v5 + 140) |= 0x40u;
  }
  v14 = -[NSString copyWithZone:](self->_copyrightText, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v14;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_albumDiscCount;
    *(_WORD *)(v5 + 140) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v5 + 104) = self->_discNumber;
  *(_WORD *)(v5 + 140) |= 0x80u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_6:
    *(double *)(v5 + 24) = self->_fileSize;
    *(_WORD *)(v5 + 140) |= 4u;
  }
LABEL_7:
  v17 = -[NSString copyWithZone:](self->_genreName, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v17;

  v19 = (__int16)self->_has;
  if ((v19 & 0x400) != 0)
  {
    *(_BYTE *)(v5 + 136) = self->_isCompilation;
    *(_WORD *)(v5 + 140) |= 0x400u;
    v19 = (__int16)self->_has;
  }
  if ((v19 & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_duration;
    *(_WORD *)(v5 + 140) |= 2u;
  }
  v20 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v20;

  v22 = (__int16)self->_has;
  if ((v22 & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_storeAdamID;
    *(_WORD *)(v5 + 140) |= 8u;
    v22 = (__int16)self->_has;
    if ((v22 & 1) == 0)
    {
LABEL_13:
      if ((v22 & 0x20) == 0)
        goto LABEL_14;
      goto LABEL_23;
    }
  }
  else if ((v22 & 1) == 0)
  {
    goto LABEL_13;
  }
  *(_QWORD *)(v5 + 8) = self->_cloudID;
  *(_WORD *)(v5 + 140) |= 1u;
  v22 = (__int16)self->_has;
  if ((v22 & 0x20) == 0)
  {
LABEL_14:
    if ((v22 & 0x100) == 0)
      goto LABEL_15;
LABEL_24:
    *(_DWORD *)(v5 + 128) = self->_trackNumber;
    *(_WORD *)(v5 + 140) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x200) == 0)
      return (id)v5;
    goto LABEL_16;
  }
LABEL_23:
  *(_DWORD *)(v5 + 64) = self->_albumTrackCount;
  *(_WORD *)(v5 + 140) |= 0x20u;
  v22 = (__int16)self->_has;
  if ((v22 & 0x100) != 0)
    goto LABEL_24;
LABEL_15:
  if ((v22 & 0x200) != 0)
  {
LABEL_16:
    *(_DWORD *)(v5 + 132) = self->_year;
    *(_WORD *)(v5 + 140) |= 0x200u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *albumArtistName;
  NSString *albumName;
  NSString *artistName;
  NSString *composerName;
  __int16 has;
  __int16 v10;
  NSString *copyrightText;
  NSString *genreName;
  NSString *title;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_77;
  albumArtistName = self->_albumArtistName;
  if ((unint64_t)albumArtistName | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](albumArtistName, "isEqual:"))
      goto LABEL_77;
  }
  albumName = self->_albumName;
  if ((unint64_t)albumName | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](albumName, "isEqual:"))
      goto LABEL_77;
  }
  artistName = self->_artistName;
  if ((unint64_t)artistName | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](artistName, "isEqual:"))
      goto LABEL_77;
  }
  composerName = self->_composerName;
  if ((unint64_t)composerName | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](composerName, "isEqual:"))
      goto LABEL_77;
  }
  has = (__int16)self->_has;
  v10 = *((_WORD *)v4 + 70);
  if ((has & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_contentType != *((_DWORD *)v4 + 22))
      goto LABEL_77;
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_77;
  }
  copyrightText = self->_copyrightText;
  if ((unint64_t)copyrightText | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](copyrightText, "isEqual:"))
      goto LABEL_77;
    has = (__int16)self->_has;
    v10 = *((_WORD *)v4 + 70);
  }
  if ((has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_albumDiscCount != *((_DWORD *)v4 + 12))
      goto LABEL_77;
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_discNumber != *((_DWORD *)v4 + 26))
      goto LABEL_77;
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_fileSize != *((double *)v4 + 3))
      goto LABEL_77;
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_77;
  }
  genreName = self->_genreName;
  if ((unint64_t)genreName | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](genreName, "isEqual:"))
      goto LABEL_77;
    has = (__int16)self->_has;
    v10 = *((_WORD *)v4 + 70);
  }
  if ((has & 0x400) != 0)
  {
    if ((v10 & 0x400) == 0)
      goto LABEL_77;
    if (self->_isCompilation)
    {
      if (!*((_BYTE *)v4 + 136))
        goto LABEL_77;
    }
    else if (*((_BYTE *)v4 + 136))
    {
      goto LABEL_77;
    }
  }
  else if ((v10 & 0x400) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_duration != *((double *)v4 + 2))
      goto LABEL_77;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_77;
  }
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 15))
  {
    if (-[NSString isEqual:](title, "isEqual:"))
    {
      has = (__int16)self->_has;
      v10 = *((_WORD *)v4 + 70);
      goto LABEL_52;
    }
LABEL_77:
    v14 = 0;
    goto LABEL_78;
  }
LABEL_52:
  if ((has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_storeAdamID != *((_QWORD *)v4 + 4))
      goto LABEL_77;
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 1) != 0)
  {
    if ((v10 & 1) == 0 || self->_cloudID != *((_QWORD *)v4 + 1))
      goto LABEL_77;
  }
  else if ((v10 & 1) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_albumTrackCount != *((_DWORD *)v4 + 16))
      goto LABEL_77;
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 0x100) != 0)
  {
    if ((v10 & 0x100) == 0 || self->_trackNumber != *((_DWORD *)v4 + 32))
      goto LABEL_77;
  }
  else if ((v10 & 0x100) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 0x200) != 0)
  {
    if ((v10 & 0x200) == 0 || self->_year != *((_DWORD *)v4 + 33))
      goto LABEL_77;
    v14 = 1;
  }
  else
  {
    v14 = (v10 & 0x200) == 0;
  }
LABEL_78:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  __int16 has;
  uint64_t v5;
  uint64_t v6;
  double fileSize;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  NSUInteger v12;
  __int16 v13;
  uint64_t v14;
  double duration;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  NSUInteger v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  NSUInteger v32;

  v32 = -[NSString hash](self->_albumArtistName, "hash");
  v31 = -[NSString hash](self->_albumName, "hash");
  v30 = -[NSString hash](self->_artistName, "hash");
  v29 = -[NSString hash](self->_composerName, "hash");
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    v28 = 2654435761 * self->_contentType;
  else
    v28 = 0;
  v3 = -[NSString hash](self->_copyrightText, "hash");
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
    v5 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_6;
LABEL_12:
    v6 = 0;
    if ((has & 4) != 0)
      goto LABEL_7;
LABEL_13:
    v11 = 0;
    goto LABEL_16;
  }
  v5 = 2654435761 * self->_albumDiscCount;
  if ((has & 0x80) == 0)
    goto LABEL_12;
LABEL_6:
  v6 = 2654435761 * self->_discNumber;
  if ((has & 4) == 0)
    goto LABEL_13;
LABEL_7:
  fileSize = self->_fileSize;
  v8 = -fileSize;
  if (fileSize >= 0.0)
    v8 = self->_fileSize;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_16:
  v12 = -[NSString hash](self->_genreName, "hash");
  v13 = (__int16)self->_has;
  if ((v13 & 0x400) != 0)
  {
    v14 = 2654435761 * self->_isCompilation;
    if ((v13 & 2) != 0)
      goto LABEL_18;
LABEL_23:
    v19 = 0;
    goto LABEL_26;
  }
  v14 = 0;
  if ((v13 & 2) == 0)
    goto LABEL_23;
LABEL_18:
  duration = self->_duration;
  v16 = -duration;
  if (duration >= 0.0)
    v16 = self->_duration;
  v17 = floor(v16 + 0.5);
  v18 = (v16 - v17) * 1.84467441e19;
  v19 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
  if (v18 >= 0.0)
  {
    if (v18 > 0.0)
      v19 += (unint64_t)v18;
  }
  else
  {
    v19 -= (unint64_t)fabs(v18);
  }
LABEL_26:
  v20 = -[NSString hash](self->_title, "hash");
  v21 = (__int16)self->_has;
  if ((v21 & 8) != 0)
  {
    v22 = 2654435761 * self->_storeAdamID;
    if ((v21 & 1) != 0)
    {
LABEL_28:
      v23 = 2654435761 * self->_cloudID;
      if ((v21 & 0x20) != 0)
        goto LABEL_29;
      goto LABEL_34;
    }
  }
  else
  {
    v22 = 0;
    if ((v21 & 1) != 0)
      goto LABEL_28;
  }
  v23 = 0;
  if ((v21 & 0x20) != 0)
  {
LABEL_29:
    v24 = 2654435761 * self->_albumTrackCount;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_30;
LABEL_35:
    v25 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_31;
LABEL_36:
    v26 = 0;
    return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v3 ^ v5 ^ v6 ^ v11 ^ v12 ^ v14 ^ v19 ^ v20 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26;
  }
LABEL_34:
  v24 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_35;
LABEL_30:
  v25 = 2654435761 * self->_trackNumber;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_36;
LABEL_31:
  v26 = 2654435761 * self->_year;
  return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v3 ^ v5 ^ v6 ^ v11 ^ v12 ^ v14 ^ v19 ^ v20 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_genreName, 0);
  objc_storeStrong((id *)&self->_copyrightText, 0);
  objc_storeStrong((id *)&self->_composerName, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_albumArtistName, 0);
}

@end
