@implementation _INPBStartPhotoPlaybackIntentResponse

- (void)setAlbumName:(id)a3
{
  NSString *v4;
  NSString *albumName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  albumName = self->_albumName;
  self->_albumName = v4;

}

- (BOOL)hasAlbumName
{
  return self->_albumName != 0;
}

- (void)setLocationCreated:(id)a3
{
  objc_storeStrong((id *)&self->_locationCreated, a3);
}

- (BOOL)hasLocationCreated
{
  return self->_locationCreated != 0;
}

- (void)setSearchResultsCount:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_searchResultsCount = a3;
}

- (BOOL)hasSearchResultsCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSearchResultsCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBStartPhotoPlaybackIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_INPBStartPhotoPlaybackIntentResponse albumName](self, "albumName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBStartPhotoPlaybackIntentResponse locationCreated](self, "locationCreated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBStartPhotoPlaybackIntentResponse locationCreated](self, "locationCreated");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBStartPhotoPlaybackIntentResponse hasSearchResultsCount](self, "hasSearchResultsCount"))
    PBDataWriterWriteInt32Field();

}

- (_INPBStartPhotoPlaybackIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBStartPhotoPlaybackIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBStartPhotoPlaybackIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBStartPhotoPlaybackIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBStartPhotoPlaybackIntentResponse initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBStartPhotoPlaybackIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBStartPhotoPlaybackIntentResponse *v5;
  void *v6;
  id v7;

  v5 = -[_INPBStartPhotoPlaybackIntentResponse init](+[_INPBStartPhotoPlaybackIntentResponse allocWithZone:](_INPBStartPhotoPlaybackIntentResponse, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_albumName, "copyWithZone:", a3);
  -[_INPBStartPhotoPlaybackIntentResponse setAlbumName:](v5, "setAlbumName:", v6);

  v7 = -[_INPBLocation copyWithZone:](self->_locationCreated, "copyWithZone:", a3);
  -[_INPBStartPhotoPlaybackIntentResponse setLocationCreated:](v5, "setLocationCreated:", v7);

  if (-[_INPBStartPhotoPlaybackIntentResponse hasSearchResultsCount](self, "hasSearchResultsCount"))
    -[_INPBStartPhotoPlaybackIntentResponse setSearchResultsCount:](v5, "setSearchResultsCount:", -[_INPBStartPhotoPlaybackIntentResponse searchResultsCount](self, "searchResultsCount"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  int v19;
  int searchResultsCount;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_INPBStartPhotoPlaybackIntentResponse albumName](self, "albumName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "albumName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBStartPhotoPlaybackIntentResponse albumName](self, "albumName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBStartPhotoPlaybackIntentResponse albumName](self, "albumName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "albumName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBStartPhotoPlaybackIntentResponse locationCreated](self, "locationCreated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[_INPBStartPhotoPlaybackIntentResponse locationCreated](self, "locationCreated");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBStartPhotoPlaybackIntentResponse locationCreated](self, "locationCreated");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationCreated");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  v19 = -[_INPBStartPhotoPlaybackIntentResponse hasSearchResultsCount](self, "hasSearchResultsCount");
  if (v19 == objc_msgSend(v4, "hasSearchResultsCount"))
  {
    if (!-[_INPBStartPhotoPlaybackIntentResponse hasSearchResultsCount](self, "hasSearchResultsCount")
      || !objc_msgSend(v4, "hasSearchResultsCount")
      || (searchResultsCount = self->_searchResultsCount,
          searchResultsCount == objc_msgSend(v4, "searchResultsCount")))
    {
      v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_albumName, "hash");
  v4 = -[_INPBLocation hash](self->_locationCreated, "hash");
  if (-[_INPBStartPhotoPlaybackIntentResponse hasSearchResultsCount](self, "hasSearchResultsCount"))
    v5 = 2654435761 * self->_searchResultsCount;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_albumName)
  {
    -[_INPBStartPhotoPlaybackIntentResponse albumName](self, "albumName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("albumName"));

  }
  -[_INPBStartPhotoPlaybackIntentResponse locationCreated](self, "locationCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("locationCreated"));

  if (-[_INPBStartPhotoPlaybackIntentResponse hasSearchResultsCount](self, "hasSearchResultsCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_INPBStartPhotoPlaybackIntentResponse searchResultsCount](self, "searchResultsCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("searchResultsCount"));

  }
  return v3;
}

- (NSString)albumName
{
  return self->_albumName;
}

- (_INPBLocation)locationCreated
{
  return self->_locationCreated;
}

- (int)searchResultsCount
{
  return self->_searchResultsCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationCreated, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
