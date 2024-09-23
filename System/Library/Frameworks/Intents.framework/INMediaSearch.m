@implementation INMediaSearch

- (INMediaSearch)initWithMediaType:(INMediaItemType)mediaType sortOrder:(INMediaSortOrder)sortOrder mediaName:(NSString *)mediaName artistName:(NSString *)artistName albumName:(NSString *)albumName genreNames:(NSArray *)genreNames moodNames:(NSArray *)moodNames releaseDate:(INDateComponentsRange *)releaseDate reference:(INMediaReference)reference mediaIdentifier:(NSString *)mediaIdentifier
{
  NSString *v18;
  NSString *v19;
  NSString *v20;
  NSArray *v21;
  NSArray *v22;
  INDateComponentsRange *v23;
  NSString *v24;
  INMediaSearch *v25;
  INMediaSearch *v26;
  uint64_t v27;
  NSString *v28;
  uint64_t v29;
  NSString *v30;
  uint64_t v31;
  NSString *v32;
  uint64_t v33;
  NSArray *v34;
  uint64_t v35;
  NSArray *v36;
  uint64_t v37;
  INDateComponentsRange *v38;
  uint64_t v39;
  NSString *v40;
  objc_super v42;

  v18 = mediaName;
  v19 = artistName;
  v20 = albumName;
  v21 = genreNames;
  v22 = moodNames;
  v23 = releaseDate;
  v24 = mediaIdentifier;
  v42.receiver = self;
  v42.super_class = (Class)INMediaSearch;
  v25 = -[INMediaSearch init](&v42, sel_init);
  v26 = v25;
  if (v25)
  {
    v25->_mediaType = mediaType;
    v25->_sortOrder = sortOrder;
    v27 = -[NSString copy](v18, "copy");
    v28 = v26->_mediaName;
    v26->_mediaName = (NSString *)v27;

    v29 = -[NSString copy](v19, "copy");
    v30 = v26->_artistName;
    v26->_artistName = (NSString *)v29;

    v31 = -[NSString copy](v20, "copy");
    v32 = v26->_albumName;
    v26->_albumName = (NSString *)v31;

    v33 = -[NSArray copy](v21, "copy");
    v34 = v26->_genreNames;
    v26->_genreNames = (NSArray *)v33;

    v35 = -[NSArray copy](v22, "copy");
    v36 = v26->_moodNames;
    v26->_moodNames = (NSArray *)v35;

    v37 = -[INDateComponentsRange copy](v23, "copy");
    v38 = v26->_releaseDate;
    v26->_releaseDate = (INDateComponentsRange *)v37;

    v26->_reference = reference;
    v39 = -[NSString copy](v24, "copy");
    v40 = v26->_mediaIdentifier;
    v26->_mediaIdentifier = (NSString *)v39;

  }
  return v26;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  NSUInteger v15;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_mediaType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_sortOrder);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = -[NSString hash](self->_mediaName, "hash");
  v8 = v7 ^ -[NSString hash](self->_artistName, "hash");
  v9 = v8 ^ -[NSString hash](self->_albumName, "hash");
  v10 = v6 ^ v9 ^ -[NSArray hash](self->_genreNames, "hash");
  v11 = -[NSArray hash](self->_moodNames, "hash");
  v12 = v11 ^ -[INDateComponentsRange hash](self->_releaseDate, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_reference);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  v15 = v10 ^ v14 ^ -[NSString hash](self->_mediaIdentifier, "hash");

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  INMediaSearch *v4;
  INMediaSearch *v5;
  INMediaSearch *v6;
  NSString *mediaName;
  NSString *artistName;
  NSString *albumName;
  NSArray *genreNames;
  NSArray *moodNames;
  INDateComponentsRange *releaseDate;
  NSString *mediaIdentifier;
  BOOL v14;

  v4 = (INMediaSearch *)a3;
  if (v4 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      v14 = 0;
      if (self->_mediaType == v5->_mediaType && self->_sortOrder == v5->_sortOrder)
      {
        mediaName = self->_mediaName;
        if (mediaName == v6->_mediaName || -[NSString isEqual:](mediaName, "isEqual:"))
        {
          artistName = self->_artistName;
          if (artistName == v6->_artistName || -[NSString isEqual:](artistName, "isEqual:"))
          {
            albumName = self->_albumName;
            if (albumName == v6->_albumName || -[NSString isEqual:](albumName, "isEqual:"))
            {
              genreNames = self->_genreNames;
              if (genreNames == v6->_genreNames || -[NSArray isEqual:](genreNames, "isEqual:"))
              {
                moodNames = self->_moodNames;
                if (moodNames == v6->_moodNames || -[NSArray isEqual:](moodNames, "isEqual:"))
                {
                  releaseDate = self->_releaseDate;
                  if ((releaseDate == v6->_releaseDate || -[INDateComponentsRange isEqual:](releaseDate, "isEqual:"))
                    && self->_reference == v6->_reference)
                  {
                    mediaIdentifier = self->_mediaIdentifier;
                    if (mediaIdentifier == v6->_mediaIdentifier
                      || -[NSString isEqual:](mediaIdentifier, "isEqual:"))
                    {
                      v14 = 1;
                    }
                  }
                }
              }
            }
          }
        }
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (INMediaSearch)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  INMediaSearch *v18;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v21 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("mediaType"));
  v20 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("sortOrder"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artistName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("albumName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v9, CFSTR("genreNames"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v13, CFSTR("moodNames"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("releaseDate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("reference"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[INMediaSearch initWithMediaType:sortOrder:mediaName:artistName:albumName:genreNames:moodNames:releaseDate:reference:mediaIdentifier:](self, "initWithMediaType:sortOrder:mediaName:artistName:albumName:genreNames:moodNames:releaseDate:reference:mediaIdentifier:", v21, v20, v4, v5, v6, v10, v14, v15, v16, v17);
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t mediaType;
  id v5;

  mediaType = self->_mediaType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", mediaType, CFSTR("mediaType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sortOrder, CFSTR("sortOrder"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaName, CFSTR("mediaName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_artistName, CFSTR("artistName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_albumName, CFSTR("albumName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_genreNames, CFSTR("genreNames"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_moodNames, CFSTR("moodNames"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_releaseDate, CFSTR("releaseDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_reference, CFSTR("reference"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaIdentifier, CFSTR("mediaIdentifier"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  __CFString *v9;
  __CFString *v10;
  unint64_t v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t reference;
  const __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_mediaType - 1;
  if (v8 > 0x13)
    v9 = CFSTR("unknown");
  else
    v9 = *(&off_1E22928C8 + v8);
  v10 = v9;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("mediaType"));

  v11 = self->_sortOrder - 1;
  if (v11 > 7)
    v12 = CFSTR("unknown");
  else
    v12 = off_1E22932A0[v11];
  v13 = v12;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("sortOrder"));

  objc_msgSend(v6, "encodeObject:", self->_mediaName);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, CFSTR("mediaName"));

  objc_msgSend(v6, "encodeObject:", self->_artistName);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, CFSTR("artistName"));

  objc_msgSend(v6, "encodeObject:", self->_albumName);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, CFSTR("albumName"));

  objc_msgSend(v6, "encodeObject:", self->_genreNames);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v17, CFSTR("genreNames"));

  objc_msgSend(v6, "encodeObject:", self->_moodNames);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v18, CFSTR("moodNames"));

  objc_msgSend(v6, "encodeObject:", self->_releaseDate);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v19, CFSTR("releaseDate"));

  reference = self->_reference;
  v21 = CFSTR("unknown");
  if (reference == 2)
    v21 = CFSTR("my");
  if (reference == 1)
    v22 = CFSTR("currentlyPlaying");
  else
    v22 = (__CFString *)v21;
  v23 = v22;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v23, CFSTR("reference"));

  objc_msgSend(v6, "encodeObject:", self->_mediaIdentifier);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v24, CFSTR("mediaIdentifier"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INMediaSearch descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INMediaSearch;
  -[INMediaSearch description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INMediaSearch _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  uint64_t mediaName;
  uint64_t artistName;
  NSString *albumName;
  uint64_t v6;
  NSArray *genreNames;
  uint64_t v8;
  NSArray *moodNames;
  void *v10;
  INDateComponentsRange *releaseDate;
  void *v12;
  void *v13;
  NSString *mediaIdentifier;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _QWORD v27[10];
  _QWORD v28[12];

  v28[10] = *MEMORY[0x1E0C80C00];
  v27[0] = CFSTR("mediaType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_mediaType);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v26;
  v27[1] = CFSTR("sortOrder");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_sortOrder);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v25;
  v27[2] = CFSTR("mediaName");
  mediaName = (uint64_t)self->_mediaName;
  v24 = mediaName;
  if (!mediaName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    mediaName = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)mediaName;
  v28[2] = mediaName;
  v27[3] = CFSTR("artistName");
  artistName = (uint64_t)self->_artistName;
  v23 = artistName;
  if (!artistName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    artistName = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)artistName;
  v28[3] = artistName;
  v27[4] = CFSTR("albumName");
  albumName = self->_albumName;
  v6 = (uint64_t)albumName;
  if (!albumName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v6;
  v28[4] = v6;
  v27[5] = CFSTR("genreNames");
  genreNames = self->_genreNames;
  v8 = (uint64_t)genreNames;
  if (!genreNames)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v18 = v8;
  v28[5] = v8;
  v27[6] = CFSTR("moodNames");
  moodNames = self->_moodNames;
  v10 = moodNames;
  if (!moodNames)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v8, v20, v21, v22);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[6] = v10;
  v27[7] = CFSTR("releaseDate");
  releaseDate = self->_releaseDate;
  v12 = releaseDate;
  if (!releaseDate)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[7] = v12;
  v27[8] = CFSTR("reference");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_reference, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[8] = v13;
  v27[9] = CFSTR("mediaIdentifier");
  mediaIdentifier = self->_mediaIdentifier;
  v15 = mediaIdentifier;
  if (!mediaIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[9] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!mediaIdentifier)

  if (releaseDate)
  {
    if (moodNames)
      goto LABEL_19;
  }
  else
  {

    if (moodNames)
    {
LABEL_19:
      if (genreNames)
        goto LABEL_20;
LABEL_28:

      if (albumName)
        goto LABEL_21;
      goto LABEL_29;
    }
  }

  if (!genreNames)
    goto LABEL_28;
LABEL_20:
  if (albumName)
    goto LABEL_21;
LABEL_29:

LABEL_21:
  if (!v23)

  if (!v24)
  return v16;
}

- (INMediaItemType)mediaType
{
  return self->_mediaType;
}

- (INMediaSortOrder)sortOrder
{
  return self->_sortOrder;
}

- (NSString)mediaName
{
  return self->_mediaName;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (NSString)albumName
{
  return self->_albumName;
}

- (NSArray)genreNames
{
  return self->_genreNames;
}

- (NSArray)moodNames
{
  return self->_moodNames;
}

- (INDateComponentsRange)releaseDate
{
  return self->_releaseDate;
}

- (INMediaReference)reference
{
  return self->_reference;
}

- (NSString)mediaIdentifier
{
  return self->_mediaIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaIdentifier, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_moodNames, 0);
  objc_storeStrong((id *)&self->_genreNames, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_mediaName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mediaType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = INMediaItemTypeWithString(v9);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sortOrder"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = INMediaSortOrderWithString(v10);

    v11 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mediaName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v11, v12);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("artistName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v13, v14);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("albumName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("genreNames"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("moodNames"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("releaseDate"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reference"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = INMediaReferenceWithString(v27);

    v29 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mediaIdentifier"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMediaType:sortOrder:mediaName:artistName:albumName:genreNames:moodNames:releaseDate:reference:mediaIdentifier:", v37, v36, v35, v34, v17, v20, v23, v26, v28, v31);
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

@end
