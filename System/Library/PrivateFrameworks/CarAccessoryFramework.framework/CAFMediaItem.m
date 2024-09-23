@implementation CAFMediaItem

- (CAFMediaItem)initWithDictionary:(id)a3
{
  id v4;
  CAFMediaItem *v5;
  id v6;
  NSString *v7;
  NSString *artist;
  id v9;
  NSString *v10;
  NSString *ensemble;
  id v12;
  id v13;
  id v14;
  NSString *v15;
  NSString *identifier;
  id v17;
  id v18;
  id v19;
  NSString *v20;
  NSString *mediaItemCategoryUserVisibleLabel;
  id v22;
  NSString *v23;
  NSString *mediaItemGroup;
  id v25;
  NSString *v26;
  NSString *mediaItemImageIdentifier;
  id v28;
  NSString *v29;
  NSString *mediaItemName;
  id v31;
  NSString *v32;
  NSString *mediaItemShortName;
  id v34;
  NSString *v35;
  NSString *mediaItemType;
  id v37;
  id v38;
  id v39;
  NSString *v40;
  NSString *title;
  id v42;
  NSString *v43;
  NSString *userVisibleDescription;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)CAFMediaItem;
  v5 = -[CAFMediaItem init](&v46, sel_init);
  if (v5)
  {
    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("artist"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_isKindOfClass() & 1) != 0)
      v7 = (NSString *)v6;
    else
      v7 = 0;

    artist = v5->_artist;
    v5->_artist = v7;

    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("ensemble"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_isKindOfClass() & 1) != 0)
      v10 = (NSString *)v9;
    else
      v10 = 0;

    ensemble = v5->_ensemble;
    v5->_ensemble = v10;

    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("frequency"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    v5->_frequency = objc_msgSend(v13, "unsignedIntValue");
    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("identifier"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v14 && (objc_opt_isKindOfClass() & 1) != 0)
      v15 = (NSString *)v14;
    else
      v15 = 0;

    identifier = v5->_identifier;
    v5->_identifier = v15;

    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("mediaItemCategory"));
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17 && (objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;

    v5->_mediaItemCategory = objc_msgSend(v18, "unsignedCharValue");
    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("mediaItemCategoryUserVisibleLabel"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (v19 && (objc_opt_isKindOfClass() & 1) != 0)
      v20 = (NSString *)v19;
    else
      v20 = 0;

    mediaItemCategoryUserVisibleLabel = v5->_mediaItemCategoryUserVisibleLabel;
    v5->_mediaItemCategoryUserVisibleLabel = v20;

    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("mediaItemGroup"));
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (v22 && (objc_opt_isKindOfClass() & 1) != 0)
      v23 = (NSString *)v22;
    else
      v23 = 0;

    mediaItemGroup = v5->_mediaItemGroup;
    v5->_mediaItemGroup = v23;

    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("mediaItemImageIdentifier"));
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (v25 && (objc_opt_isKindOfClass() & 1) != 0)
      v26 = (NSString *)v25;
    else
      v26 = 0;

    mediaItemImageIdentifier = v5->_mediaItemImageIdentifier;
    v5->_mediaItemImageIdentifier = v26;

    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("mediaItemName"));
    v28 = (id)objc_claimAutoreleasedReturnValue();
    if (v28 && (objc_opt_isKindOfClass() & 1) != 0)
      v29 = (NSString *)v28;
    else
      v29 = 0;

    mediaItemName = v5->_mediaItemName;
    v5->_mediaItemName = v29;

    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("mediaItemShortName"));
    v31 = (id)objc_claimAutoreleasedReturnValue();
    if (v31 && (objc_opt_isKindOfClass() & 1) != 0)
      v32 = (NSString *)v31;
    else
      v32 = 0;

    mediaItemShortName = v5->_mediaItemShortName;
    v5->_mediaItemShortName = v32;

    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("mediaItemType"));
    v34 = (id)objc_claimAutoreleasedReturnValue();
    if (v34 && (objc_opt_isKindOfClass() & 1) != 0)
      v35 = (NSString *)v34;
    else
      v35 = 0;

    mediaItemType = v5->_mediaItemType;
    v5->_mediaItemType = v35;

    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("multicast"));
    v37 = (id)objc_claimAutoreleasedReturnValue();
    if (v37 && (objc_opt_isKindOfClass() & 1) != 0)
      v38 = v37;
    else
      v38 = 0;

    v5->_multicast = objc_msgSend(v38, "unsignedCharValue");
    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("title"));
    v39 = (id)objc_claimAutoreleasedReturnValue();
    if (v39 && (objc_opt_isKindOfClass() & 1) != 0)
      v40 = (NSString *)v39;
    else
      v40 = 0;

    title = v5->_title;
    v5->_title = v40;

    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("userVisibleDescription"));
    v42 = (id)objc_claimAutoreleasedReturnValue();
    if (v42 && (objc_opt_isKindOfClass() & 1) != 0)
      v43 = (NSString *)v42;
    else
      v43 = 0;

    userVisibleDescription = v5->_userVisibleDescription;
    v5->_userVisibleDescription = v43;

  }
  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[14];
  _QWORD v41[16];

  v41[14] = *MEMORY[0x24BDAC8D0];
  v40[0] = CFSTR("artist");
  -[CAFMediaItem artist](self, "artist");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v39 = v4;
  v31 = (void *)v3;
  v41[0] = v3;
  v40[1] = CFSTR("ensemble");
  -[CAFMediaItem ensemble](self, "ensemble");
  v5 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v5;
  v41[1] = v5;
  v40[2] = CFSTR("frequency");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[CAFMediaItem frequency](self, "frequency"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v37;
  v40[3] = CFSTR("identifier");
  -[CAFMediaItem identifier](self, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v6;
  v41[3] = v6;
  v40[4] = CFSTR("mediaItemCategory");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", -[CAFMediaItem mediaItemCategory](self, "mediaItemCategory"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v41[4] = v35;
  v40[5] = CFSTR("mediaItemCategoryUserVisibleLabel");
  -[CAFMediaItem mediaItemCategoryUserVisibleLabel](self, "mediaItemCategoryUserVisibleLabel");
  v8 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v8;
  v41[5] = v8;
  v40[6] = CFSTR("mediaItemGroup");
  -[CAFMediaItem mediaItemGroup](self, "mediaItemGroup");
  v9 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v9;
  v41[6] = v9;
  v40[7] = CFSTR("mediaItemImageIdentifier");
  -[CAFMediaItem mediaItemImageIdentifier](self, "mediaItemImageIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v10;
  v41[7] = v10;
  v40[8] = CFSTR("mediaItemName");
  -[CAFMediaItem mediaItemName](self, "mediaItemName");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v36 = v7;
  v25 = (void *)v12;
  v41[8] = v12;
  v40[9] = CFSTR("mediaItemShortName");
  -[CAFMediaItem mediaItemShortName](self, "mediaItemShortName");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v41[9] = v14;
  v40[10] = CFSTR("mediaItemType");
  -[CAFMediaItem mediaItemType](self, "mediaItemType", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v41[10] = v17;
  v40[11] = CFSTR("multicast");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", -[CAFMediaItem multicast](self, "multicast"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v41[11] = v18;
  v40[12] = CFSTR("title");
  -[CAFMediaItem title](self, "title");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v41[12] = v20;
  v40[13] = CFSTR("userVisibleDescription");
  -[CAFMediaItem userVisibleDescription](self, "userVisibleDescription");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v41[13] = v22;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 14);
  v32 = (id)objc_claimAutoreleasedReturnValue();
  if (!v21)

  if (!v19)
  if (!v16)

  if (!v15)
  if (!v13)

  if (!v11)
  if (!v33)

  if (!v34)
  if (!v36)

  if (!v38)
  if (!v39)

  return (NSDictionary *)v32;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v19 = (void *)MEMORY[0x24BDD17C8];
  v18 = objc_opt_class();
  -[CAFMediaItem artist](self, "artist");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFMediaItem ensemble](self, "ensemble");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[CAFMediaItem frequency](self, "frequency");
  -[CAFMediaItem identifier](self, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CAFMediaItem mediaItemCategory](self, "mediaItemCategory");
  -[CAFMediaItem mediaItemCategoryUserVisibleLabel](self, "mediaItemCategoryUserVisibleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFMediaItem mediaItemGroup](self, "mediaItemGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFMediaItem mediaItemImageIdentifier](self, "mediaItemImageIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFMediaItem mediaItemName](self, "mediaItemName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFMediaItem mediaItemShortName](self, "mediaItemShortName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFMediaItem mediaItemType](self, "mediaItemType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CAFMediaItem multicast](self, "multicast");
  -[CAFMediaItem title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFMediaItem userVisibleDescription](self, "userVisibleDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@: %p { %@: %@, %@: %@, %@: %u, %@: %@, %@: %hhu, %@: %@, %@: %@, %@: %@, %@: %@, %@: %@, %@: %@, %@: %hhu, %@: %@, %@: %@ }>"), v18, self, CFSTR("artist"), v17, CFSTR("ensemble"), v16, CFSTR("frequency"), v15, CFSTR("identifier"), v20, CFSTR("mediaItemCategory"), v14, CFSTR("mediaItemCategoryUserVisibleLabel"), v3, CFSTR("mediaItemGroup"), v4,
    CFSTR("mediaItemImageIdentifier"),
    v5,
    CFSTR("mediaItemName"),
    v6,
    CFSTR("mediaItemShortName"),
    v13,
    CFSTR("mediaItemType"),
    v7,
    CFSTR("multicast"),
    v8,
    CFSTR("title"),
    v9,
    CFSTR("userVisibleDescription"),
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)artist
{
  return self->_artist;
}

- (NSString)ensemble
{
  return self->_ensemble;
}

- (unsigned)frequency
{
  return self->_frequency;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unsigned)mediaItemCategory
{
  return self->_mediaItemCategory;
}

- (NSString)mediaItemCategoryUserVisibleLabel
{
  return self->_mediaItemCategoryUserVisibleLabel;
}

- (NSString)mediaItemGroup
{
  return self->_mediaItemGroup;
}

- (NSString)mediaItemImageIdentifier
{
  return self->_mediaItemImageIdentifier;
}

- (NSString)mediaItemName
{
  return self->_mediaItemName;
}

- (NSString)mediaItemShortName
{
  return self->_mediaItemShortName;
}

- (NSString)mediaItemType
{
  return self->_mediaItemType;
}

- (unsigned)multicast
{
  return self->_multicast;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)userVisibleDescription
{
  return self->_userVisibleDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userVisibleDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_mediaItemType, 0);
  objc_storeStrong((id *)&self->_mediaItemShortName, 0);
  objc_storeStrong((id *)&self->_mediaItemName, 0);
  objc_storeStrong((id *)&self->_mediaItemImageIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaItemGroup, 0);
  objc_storeStrong((id *)&self->_mediaItemCategoryUserVisibleLabel, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_ensemble, 0);
  objc_storeStrong((id *)&self->_artist, 0);
}

@end
