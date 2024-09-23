@implementation _INPBOpenSettingIntent

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setSearchQuery:(id)a3
{
  objc_storeStrong((id *)&self->_searchQuery, a3);
}

- (BOOL)hasSearchQuery
{
  return self->_searchQuery != 0;
}

- (void)setSettingMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_settingMetadata, a3);
}

- (BOOL)hasSettingMetadata
{
  return self->_settingMetadata != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBOpenSettingIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[_INPBOpenSettingIntent intentMetadata](self, "intentMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBOpenSettingIntent intentMetadata](self, "intentMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBOpenSettingIntent searchQuery](self, "searchQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBOpenSettingIntent searchQuery](self, "searchQuery");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBOpenSettingIntent settingMetadata](self, "settingMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBOpenSettingIntent settingMetadata](self, "settingMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBOpenSettingIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBOpenSettingIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBOpenSettingIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBOpenSettingIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBOpenSettingIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBOpenSettingIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBOpenSettingIntent *v5;
  id v6;
  id v7;
  id v8;

  v5 = -[_INPBOpenSettingIntent init](+[_INPBOpenSettingIntent allocWithZone:](_INPBOpenSettingIntent, "allocWithZone:"), "init");
  v6 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBOpenSettingIntent setIntentMetadata:](v5, "setIntentMetadata:", v6);

  v7 = -[_INPBDataString copyWithZone:](self->_searchQuery, "copyWithZone:", a3);
  -[_INPBOpenSettingIntent setSearchQuery:](v5, "setSearchQuery:", v7);

  v8 = -[_INPBSettingMetadata copyWithZone:](self->_settingMetadata, "copyWithZone:", a3);
  -[_INPBOpenSettingIntent setSettingMetadata:](v5, "setSettingMetadata:", v8);

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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_INPBOpenSettingIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBOpenSettingIntent intentMetadata](self, "intentMetadata");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBOpenSettingIntent intentMetadata](self, "intentMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBOpenSettingIntent searchQuery](self, "searchQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBOpenSettingIntent searchQuery](self, "searchQuery");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBOpenSettingIntent searchQuery](self, "searchQuery");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchQuery");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBOpenSettingIntent settingMetadata](self, "settingMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settingMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBOpenSettingIntent settingMetadata](self, "settingMetadata");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_INPBOpenSettingIntent settingMetadata](self, "settingMetadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "settingMetadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  v4 = -[_INPBDataString hash](self->_searchQuery, "hash") ^ v3;
  return v4 ^ -[_INPBSettingMetadata hash](self->_settingMetadata, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBOpenSettingIntent intentMetadata](self, "intentMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("intentMetadata"));

  -[_INPBOpenSettingIntent searchQuery](self, "searchQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("searchQuery"));

  -[_INPBOpenSettingIntent settingMetadata](self, "settingMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("settingMetadata"));

  return v3;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBDataString)searchQuery
{
  return self->_searchQuery;
}

- (_INPBSettingMetadata)settingMetadata
{
  return self->_settingMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingMetadata, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
