@implementation GEORPPhotoAttributionPreferencesUpdate

- (BOOL)hasPreferences
{
  return self->_preferences != 0;
}

- (GEORPPhotoAttributionPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
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
  v8.super_class = (Class)GEORPPhotoAttributionPreferencesUpdate;
  -[GEORPPhotoAttributionPreferencesUpdate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPPhotoAttributionPreferencesUpdate dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPhotoAttributionPreferencesUpdate _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "preferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v5, "jsonRepresentation");
      else
        objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("preferences"));

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPPhotoAttributionPreferencesUpdate _dictionaryRepresentation:](self, 1);
}

- (GEORPPhotoAttributionPreferencesUpdate)initWithDictionary:(id)a3
{
  return (GEORPPhotoAttributionPreferencesUpdate *)-[GEORPPhotoAttributionPreferencesUpdate _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  GEORPPhotoAttributionPreferences *v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("preferences"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEORPPhotoAttributionPreferences alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEORPPhotoAttributionPreferences initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEORPPhotoAttributionPreferences initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setPreferences:", v8);

      }
    }
  }

  return a1;
}

- (GEORPPhotoAttributionPreferencesUpdate)initWithJSON:(id)a3
{
  return (GEORPPhotoAttributionPreferencesUpdate *)-[GEORPPhotoAttributionPreferencesUpdate _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPhotoAttributionPreferencesUpdateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPhotoAttributionPreferencesUpdateReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  if (self->_preferences)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPPhotoAttributionPreferencesUpdate readAll:](self, "readAll:", 0);
  if (self->_preferences)
    objc_msgSend(v4, "setPreferences:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEORPPhotoAttributionPreferences copyWithZone:](self->_preferences, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  GEORPPhotoAttributionPreferences *preferences;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = 1;
    -[GEORPPhotoAttributionPreferencesUpdate readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
    preferences = self->_preferences;
    if ((unint64_t)preferences | v4[1])
      v5 = -[GEORPPhotoAttributionPreferences isEqual:](preferences, "isEqual:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  -[GEORPPhotoAttributionPreferencesUpdate readAll:](self, "readAll:", 1);
  return -[GEORPPhotoAttributionPreferences hash](self->_preferences, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEORPPhotoAttributionPreferences *preferences;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  preferences = self->_preferences;
  v6 = v4[1];

  if (preferences)
  {
    if (v6)
      -[GEORPPhotoAttributionPreferences mergeFrom:](preferences, "mergeFrom:", v6);
  }
  else if (v6)
  {
    -[GEORPPhotoAttributionPreferencesUpdate setPreferences:](self, "setPreferences:", v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
}

@end
