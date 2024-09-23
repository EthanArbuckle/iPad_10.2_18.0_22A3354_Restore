@implementation INMediaItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateMediaItemValueData, 0);
  objc_storeStrong((id *)&self->_assetInfo, 0);
  objc_storeStrong((id *)&self->_namedEntities, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (INMediaItem)initWithIdentifier:(id)a3 title:(id)a4 type:(int64_t)a5 artwork:(id)a6 artist:(id)a7 topics:(id)a8 namedEntities:(id)a9 privateMediaItemValueData:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  INMediaItem *v23;
  uint64_t v24;
  NSString *identifier;
  uint64_t v26;
  NSString *title;
  uint64_t v28;
  INImage *artwork;
  uint64_t v30;
  NSString *artist;
  uint64_t v32;
  NSDictionary *topics;
  uint64_t v34;
  NSDictionary *namedEntities;
  uint64_t v36;
  INPrivateMediaItemValueData *privateMediaItemValueData;
  objc_super v39;

  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v39.receiver = self;
  v39.super_class = (Class)INMediaItem;
  v23 = -[INMediaItem init](&v39, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v16, "copy");
    identifier = v23->_identifier;
    v23->_identifier = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    title = v23->_title;
    v23->_title = (NSString *)v26;

    v23->_type = a5;
    v28 = objc_msgSend(v18, "copy");
    artwork = v23->_artwork;
    v23->_artwork = (INImage *)v28;

    v30 = objc_msgSend(v19, "copy");
    artist = v23->_artist;
    v23->_artist = (NSString *)v30;

    v32 = objc_msgSend(v20, "copy");
    topics = v23->_topics;
    v23->_topics = (NSDictionary *)v32;

    v34 = objc_msgSend(v21, "copy");
    namedEntities = v23->_namedEntities;
    v23->_namedEntities = (NSDictionary *)v34;

    v36 = objc_msgSend(v22, "copy");
    privateMediaItemValueData = v23->_privateMediaItemValueData;
    v23->_privateMediaItemValueData = (INPrivateMediaItemValueData *)v36;

  }
  return v23;
}

- (INImage)artwork
{
  return self->_artwork;
}

- (NSDictionary)topics
{
  return self->_topics;
}

- (NSDictionary)namedEntities
{
  return self->_namedEntities;
}

- (NSString)title
{
  return self->_title;
}

- (INMediaItemType)type
{
  return self->_type;
}

- (INPrivateMediaItemValueData)privateMediaItemValueData
{
  return self->_privateMediaItemValueData;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)artist
{
  return self->_artist;
}

uint64_t __73__INMediaItem_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setArtwork:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)setArtwork:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, _QWORD *);
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v6 = (void (**)(id, void *, _QWORD *))a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)-[INMediaItem copy](self, "copy");
    -[INMediaItem artwork](self, "artwork");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __73__INMediaItem_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
      v10[3] = &unk_1E2292618;
      v10[4] = v8;
      v11 = v7;
      v6[2](v6, v9, v10);

    }
    else
    {
      (*((void (**)(id, void *))v7 + 2))(v7, v8);
    }

  }
}

- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4
{
  return INKeyImageUtilitiesDefaultCompareSubProducers(a3, a4);
}

- (INMediaItem)initWithIdentifier:(NSString *)identifier title:(NSString *)title type:(INMediaItemType)type artwork:(INImage *)artwork artist:(NSString *)artist
{
  NSString *v12;
  NSString *v13;
  INImage *v14;
  NSString *v15;
  INMediaItem *v16;
  uint64_t v17;
  NSString *v18;
  uint64_t v19;
  NSString *v20;
  uint64_t v21;
  INImage *v22;
  uint64_t v23;
  NSString *v24;
  objc_super v26;

  v12 = identifier;
  v13 = title;
  v14 = artwork;
  v15 = artist;
  v26.receiver = self;
  v26.super_class = (Class)INMediaItem;
  v16 = -[INMediaItem init](&v26, sel_init);
  if (v16)
  {
    v17 = -[NSString copy](v12, "copy");
    v18 = v16->_identifier;
    v16->_identifier = (NSString *)v17;

    v19 = -[NSString copy](v13, "copy");
    v20 = v16->_title;
    v16->_title = (NSString *)v19;

    v16->_type = type;
    v21 = -[INImage copy](v14, "copy");
    v22 = v16->_artwork;
    v16->_artwork = (INImage *)v21;

    v23 = -[NSString copy](v15, "copy");
    v24 = v16->_artist;
    v16->_artist = (NSString *)v23;

  }
  return v16;
}

- (INMediaItem)initWithIdentifier:(NSString *)identifier title:(NSString *)title type:(INMediaItemType)type artwork:(INImage *)artwork
{
  return -[INMediaItem initWithIdentifier:title:type:artwork:artist:topics:namedEntities:privateMediaItemValueData:](self, "initWithIdentifier:title:type:artwork:artist:topics:namedEntities:privateMediaItemValueData:", identifier, title, type, artwork, 0, 0, 0, 0);
}

- (INMediaItem)initWithIdentifier:(id)a3 title:(id)a4 type:(int64_t)a5 artwork:(id)a6 artist:(id)a7 topics:(id)a8 namedEntities:(id)a9
{
  return -[INMediaItem initWithIdentifier:title:type:artwork:artist:topics:namedEntities:privateMediaItemValueData:](self, "initWithIdentifier:title:type:artwork:artist:topics:namedEntities:privateMediaItemValueData:", a3, a4, a5, a6, a7, a8, a9, 0);
}

- (INMediaItem)initWithIdentifier:(id)a3 title:(id)a4 type:(int64_t)a5 artwork:(id)a6 artist:(id)a7 topics:(id)a8 namedEntities:(id)a9 assetInfo:(id)a10
{
  return -[INMediaItem initWithIdentifier:title:type:artwork:artist:topics:namedEntities:privateMediaItemValueData:](self, "initWithIdentifier:title:type:artwork:artist:topics:namedEntities:privateMediaItemValueData:", a3, a4, a5, a6, a7, a8);
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  void *v5;
  uint64_t v6;
  NSUInteger v7;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_title, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = v4 ^ -[NSString hash](self->_artist, "hash") ^ v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  INMediaItem *v4;
  INMediaItem *v5;
  NSString *identifier;
  NSString *title;
  NSString *artist;
  BOOL v9;

  v4 = (INMediaItem *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      identifier = self->_identifier;
      v9 = 0;
      if (identifier == v5->_identifier || -[NSString isEqual:](identifier, "isEqual:"))
      {
        title = self->_title;
        if ((title == v5->_title || -[NSString isEqual:](title, "isEqual:")) && self->_type == v5->_type)
        {
          artist = self->_artist;
          if (artist == v5->_artist || -[NSString isEqual:](artist, "isEqual:"))
            v9 = 1;
        }
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (INMediaItem)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  INMediaItem *v20;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("title"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artwork"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v9, CFSTR("artist"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  v28[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v13, CFSTR("topics"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0C99E60];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  v27[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v17, CFSTR("namedEntities"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privateMediaItemValueData"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[INMediaItem initWithIdentifier:title:type:artwork:artist:topics:namedEntities:privateMediaItemValueData:](self, "initWithIdentifier:title:type:artwork:artist:topics:namedEntities:privateMediaItemValueData:", v25, v24, v23, v22, v10, v14, v18, v19);
  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_artwork, CFSTR("artwork"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_artist, CFSTR("artist"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_topics, CFSTR("topics"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_namedEntities, CFSTR("namedEntities"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_privateMediaItemValueData, CFSTR("privateMediaItemValueData"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_identifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("identifier"));

  objc_msgSend(v6, "encodeObject:", self->_title);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("title"));

  v10 = self->_type - 1;
  if (v10 > 0x13)
    v11 = CFSTR("unknown");
  else
    v11 = *(&off_1E22928C8 + v10);
  v12 = v11;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("type"));

  objc_msgSend(v6, "encodeObject:", self->_artwork);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("artwork"));

  objc_msgSend(v6, "encodeObject:", self->_artist);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, CFSTR("artist"));

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", self->_topics, CFSTR("topics"));
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", self->_namedEntities, CFSTR("namedEntities"));
  objc_msgSend(v6, "encodeObject:", self->_privateMediaItemValueData);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, CFSTR("privateMediaItemValueData"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INMediaItem descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INMediaItem;
  -[INMediaItem description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INMediaItem _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *identifier;
  void *v4;
  NSString *title;
  void *v6;
  void *v7;
  INImage *artwork;
  void *v9;
  NSString *artist;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("identifier");
  identifier = self->_identifier;
  v4 = identifier;
  if (!identifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[0] = v4;
  v14[1] = CFSTR("title");
  title = self->_title;
  v6 = title;
  if (!title)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v6;
  v14[2] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("artwork");
  artwork = self->_artwork;
  v9 = artwork;
  if (!artwork)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[3] = v9;
  v14[4] = CFSTR("artist");
  artist = self->_artist;
  v11 = artist;
  if (!artist)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (artist)
  {
    if (artwork)
      goto LABEL_11;
  }
  else
  {

    if (artwork)
      goto LABEL_11;
  }

LABEL_11:
  if (!title)
  {

    if (identifier)
      return v12;
LABEL_17:

    return v12;
  }
  if (!identifier)
    goto LABEL_17;
  return v12;
}

- (NSString)assetInfo
{
  return self->_assetInfo;
}

- (void)setPrivateMediaItemValueData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
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
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v7 = a5;
  v8 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("title"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = INMediaItemTypeWithString(v11);

  v13 = objc_opt_class();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("artwork"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "decodeObjectOfClass:from:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("artist"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("topics"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("topics"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("privateMediaItemValueData"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:title:type:artwork:artist:topics:namedEntities:privateMediaItemValueData:", v9, v10, v12, v15, v16, v17, v18, v19);
  return v20;
}

- (id)spokenPhrase
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v11;
  __CFString *v12;

  -[INMediaItem title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[INMediaItem artist](self, "artist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length") || !objc_msgSend(v4, "length"))
  {
    if (objc_msgSend(v3, "length"))
    {
      v9 = v3;
    }
    else
    {
      if (!objc_msgSend(v4, "length"))
      {
        -[INMediaItem identifier](self, "identifier");
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v11 = -[__CFString length](v6, "length");
        v12 = &stru_1E2295770;
        if (v11)
          v12 = v6;
        v8 = v12;
        goto LABEL_4;
      }
      v9 = v4;
    }
    v8 = v9;
    goto LABEL_10;
  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  +[INStringLocalizer siriLocalizer](INStringLocalizer, "siriLocalizer");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  INLocalizedStringWithLocalizer(CFSTR("%1$@ by %2$@"), 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v7, v3, v4);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_4:
LABEL_10:

  return v8;
}

- (id)_intents_cacheableObjects
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[INMediaItem artwork](self, "artwork");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[INMediaItem artwork](self, "artwork");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  if (objc_msgSend(v3, "count"))
    v6 = v3;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[INMediaItem artwork](self, "artwork");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[INMediaItem artwork](self, "artwork");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cacheableObjectForIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[INMediaItem artwork](self, "artwork");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "cacheableObjectForIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[INMediaItem artwork](self, "artwork");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_imageSize");
        objc_msgSend(v12, "_setImageSize:");

      }
    }
  }

}

@end
