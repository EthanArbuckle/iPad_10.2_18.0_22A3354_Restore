@implementation MapsSuggestionsShortcut

- (MapsSuggestionsShortcut)initWithFavoriteItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  MapsSuggestionsContact *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  MapsSuggestionsShortcut *v19;
  void *v20;
  void *v21;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "fetchContactHandles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v24 = v4;
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = -[MapsSuggestionsContact initWithHandleValue:]([MapsSuggestionsContact alloc], "initWithHandleValue:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v10));
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }
  v12 = (int)objc_msgSend(v3, "type");
  objc_msgSend(v3, "shortcutIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapItemStorage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "customName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v5, "copy");
  v17 = objc_msgSend(v3, "hidden");
  objc_msgSend(v3, "originatingAddressString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[MapsSuggestionsShortcut initWithType:identifier:geoMapItem:customName:contacts:isHidden:originatingAddress:](self, "initWithType:identifier:geoMapItem:customName:contacts:isHidden:originatingAddress:", v12, v13, v14, v15, v16, v17, v18);

  objc_msgSend(v3, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsShortcut setStorageIdentifier:](v19, "setStorageIdentifier:", v20);

  -[MapsSuggestionsShortcut setSource:](v19, "setSource:", (int)objc_msgSend(v3, "source"));
  objc_msgSend(v3, "createTime");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsShortcut setMapsSyncCreateTime:](v19, "setMapsSyncCreateTime:", v21);

  return v19;
}

- (BOOL)isEqualToFavoriteItem:(id)a3
{
  return MapsSuggestionsShortcutIsEqualToMapsSyncFavoriteItem(self, a3, 0);
}

- (int64_t)source
{
  return -[MapsSuggestionsShortcut derivedFromMeCard](self, "derivedFromMeCard");
}

- (void)setSource:(int64_t)a3
{
  -[MapsSuggestionsShortcut setDerivedFromMeCard:](self, "setDerivedFromMeCard:", a3 == 1);
}

- (MapsSuggestionsShortcut)initWithType:(int64_t)a3 identifier:(id)a4 geoMapItem:(id)a5 customName:(id)a6 contacts:(id)a7 isHidden:(BOOL)a8 originatingAddress:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  MapsSuggestionsShortcut *v20;
  MapsSuggestionsShortcut *v21;
  NSObject *originatingAddressString;
  uint64_t v23;
  NSString *identifier;
  uint64_t v25;
  GEOMapItemStorage *geoMapItem;
  uint64_t v27;
  NSArray *contacts;
  void *v29;
  NSString *customName;
  uint64_t v31;
  NSString *v32;
  uint64_t v33;
  objc_super v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v35.receiver = self;
  v35.super_class = (Class)MapsSuggestionsShortcut;
  v20 = -[MapsSuggestionsShortcut init](&v35, sel_init);
  v21 = v20;
  if (a3 == 6 && !v17)
  {
    GEOFindOrCreateLog();
    originatingAddressString = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(originatingAddressString, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v37 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcut.m";
      v38 = 1024;
      v39 = 49;
      v40 = 2082;
      v41 = "-[MapsSuggestionsShortcut initWithType:identifier:geoMapItem:customName:contacts:isHidden:originatingAddress:]";
      v42 = 2082;
      v43 = "nil == customName";
      _os_log_impl(&dword_1A427D000, originatingAddressString, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Custom name cannot be nil in init for FavoriteButton Shortcut", buf, 0x26u);
    }
    goto LABEL_15;
  }
  if (v20)
  {
    v20->_type = a3;
    v23 = objc_msgSend(v15, "copy");
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    geoMapItem = v21->_geoMapItem;
    v21->_geoMapItem = (GEOMapItemStorage *)v25;

    if (v18)
    {
      v27 = objc_msgSend(v18, "copy");
      contacts = v21->_contacts;
      v21->_contacts = (NSArray *)v27;
    }
    else
    {
      contacts = v21->_contacts;
      v21->_contacts = (NSArray *)MEMORY[0x1E0C9AA60];
    }

    objc_msgSend(v16, "name");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29
      && (objc_msgSend(v16, "name"),
          self = (MapsSuggestionsShortcut *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v17, "isEqualToString:", self)))
    {
      customName = v21->_customName;
      v21->_customName = 0;

    }
    else
    {
      v31 = objc_msgSend(v17, "copy");
      v32 = v21->_customName;
      v21->_customName = (NSString *)v31;

      if (!v29)
      {
LABEL_14:

        v21->_isHidden = a8;
        v33 = objc_msgSend(v19, "copy");
        originatingAddressString = v21->_originatingAddressString;
        v21->_originatingAddressString = (NSString *)v33;
LABEL_15:

        goto LABEL_16;
      }
    }

    goto LABEL_14;
  }
LABEL_16:

  return v21;
}

- (MapsSuggestionsShortcut)initWithType:(int64_t)a3 identifier:(id)a4 geoMapItem:(id)a5 customName:(id)a6
{
  return -[MapsSuggestionsShortcut initWithType:identifier:geoMapItem:customName:contacts:isHidden:originatingAddress:](self, "initWithType:identifier:geoMapItem:customName:contacts:isHidden:originatingAddress:", a3, a4, a5, a6, 0, 0, 0);
}

- (MapsSuggestionsShortcut)initWithType:(int64_t)a3 geoMapItem:(id)a4 customName:(id)a5
{
  return -[MapsSuggestionsShortcut initWithType:identifier:geoMapItem:customName:](self, "initWithType:identifier:geoMapItem:customName:", a3, 0, a4, a5);
}

- (MapsSuggestionsShortcut)initWithGEOMapItem:(id)a3 customName:(id)a4
{
  return -[MapsSuggestionsShortcut initWithType:geoMapItem:customName:](self, "initWithType:geoMapItem:customName:", 1, a3, a4);
}

- (id)initBackedPlaceholderWithType:(int64_t)a3 identifier:(id)a4 originatingAddress:(id)a5 customName:(id)a6
{
  return -[MapsSuggestionsShortcut initWithType:identifier:geoMapItem:customName:contacts:isHidden:originatingAddress:](self, "initWithType:identifier:geoMapItem:customName:contacts:isHidden:originatingAddress:", a3, a4, 0, a6, 0, 0, a5);
}

- (id)initBackedPlaceholderWithType:(int64_t)a3 identifier:(id)a4 customName:(id)a5
{
  return -[MapsSuggestionsShortcut initWithType:identifier:geoMapItem:customName:contacts:isHidden:originatingAddress:](self, "initWithType:identifier:geoMapItem:customName:contacts:isHidden:originatingAddress:", a3, a4, 0, a5, 0, 0, 0);
}

- (id)initSetupPlaceholderOfType:(int64_t)a3
{
  return -[MapsSuggestionsShortcut initWithType:identifier:geoMapItem:customName:](self, "initWithType:identifier:geoMapItem:customName:", a3, 0, 0, 0);
}

- (NSString)identifier
{
  MapsSuggestionsShortcut *v2;
  NSString *identifier;
  uint64_t v4;
  NSString *v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  identifier = v2->_identifier;
  if (identifier
    || (MapsSuggestionsShortcutUniqueIdentifier(v2),
        v4 = objc_claimAutoreleasedReturnValue(),
        v5 = v2->_identifier,
        v2->_identifier = (NSString *)v4,
        v5,
        (identifier = v2->_identifier) != 0))
  {
    v6 = (void *)-[NSString copy](identifier, "copy");
  }
  else
  {
    v6 = 0;
  }
  objc_sync_exit(v2);

  return (NSString *)v6;
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;
  MapsSuggestionsShortcut *obj;

  v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  identifier = obj->_identifier;
  obj->_identifier = v4;

  objc_sync_exit(obj);
}

- (void)setCustomName:(id)a3
{
  void *v4;
  NSString *customName;
  NSString *v6;
  id v7;

  v7 = a3;
  -[MapsSuggestionsShortcut _originalName]((uint64_t *)self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", v4))
  {
    customName = self->_customName;
    self->_customName = 0;
  }
  else
  {
    v6 = (NSString *)objc_msgSend(v7, "copy");
    customName = self->_customName;
    self->_customName = v6;
  }

}

- (uint64_t)_originalName
{
  uint64_t *v1;
  void *v2;

  v1 = a1;
  if (a1)
  {
    if (objc_msgSend(a1, "isBackedPlaceholder"))
    {
      MapsSuggestionsLocalizedTitleForShortcutType(v1[3]);
      v1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v1, "geoMapItem");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "name");
      v1 = (uint64_t *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v1;
}

- (void)setGeoMapItem:(id)a3
{
  MapsSuggestionsShortcut *v4;
  uint64_t v5;
  GEOMapItemStorage *geoMapItem;
  NSString *customName;
  void *v8;
  NSString *v9;
  NSString *identifier;
  id v11;

  v11 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v11, "copy");
  geoMapItem = v4->_geoMapItem;
  v4->_geoMapItem = (GEOMapItemStorage *)v5;

  customName = v4->_customName;
  -[GEOMapItemStorage name](v4->_geoMapItem, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(customName) = -[NSString isEqualToString:](customName, "isEqualToString:", v8);

  if ((_DWORD)customName)
  {
    v9 = v4->_customName;
    v4->_customName = 0;

  }
  identifier = v4->_identifier;
  v4->_identifier = 0;

  objc_sync_exit(v4);
}

- (NSString)title
{
  NSString *v3;
  NSString *v4;
  MapsSuggestionsShortcut *v5;
  void *v6;
  int v7;
  void *v8;
  NSString *customName;
  NSString *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[MapsSuggestionsShortcut isSetupPlaceholder](self, "isSetupPlaceholder"))
    goto LABEL_2;
  if (!-[MapsSuggestionsShortcut isBackedPlaceholder](self, "isBackedPlaceholder"))
  {
    v5 = self;
    if (-[MapsSuggestionsShortcut type](v5, "type") == 6)
    {
      -[MapsSuggestionsShortcut identifier](v5, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("NearbyTransit"));

      if (v7)
      {
        MapsSuggestionsLocalizedNearbyTransitShortString();
        v3 = (NSString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
    else
    {

    }
    if (v5)
    {
      customName = v5->_customName;
      if (customName)
      {
        v11 = customName;
        -[MapsSuggestionsShortcut isSetupPlaceholder](v5, "isSetupPlaceholder");
        return v11;
      }
      -[MapsSuggestionsShortcut _originalName]((uint64_t *)v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[MapsSuggestionsShortcut isSetupPlaceholder](v5, "isSetupPlaceholder") || v8)
        return (NSString *)v8;
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = 136446978;
        v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcut.m";
        v15 = 1024;
        v16 = 184;
        v17 = 2082;
        v18 = "-[MapsSuggestionsShortcut _name]";
        v19 = 2082;
        v20 = "nil == (name)";
        _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. It doesn't make sense that there is no name at all", (uint8_t *)&v13, 0x26u);
      }

    }
    return (NSString *)0;
  }
  v4 = self->_customName;
  if (!v4)
  {
LABEL_2:
    MapsSuggestionsLocalizedTitleForShortcutType(self->_type);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = v4;
  }
LABEL_9:
  v8 = v3;
  return (NSString *)v8;
}

- (NSString)subtitle
{
  void *v3;
  MapsSuggestionsShortcut *v4;
  void *v5;
  int v6;
  void *v8;
  __CFString *v9;
  unint64_t type;
  NSObject *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (-[MapsSuggestionsShortcut isSetupPlaceholder](self, "isSetupPlaceholder"))
  {
    MapsSuggestionsShortcutSetupStringForType(self->_type, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return (NSString *)v3;
  }
  v4 = self;
  if (-[MapsSuggestionsShortcut type](v4, "type") == 6)
  {
    -[MapsSuggestionsShortcut identifier](v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("NearbyTransit"));

    if (v6)
    {
      MapsSuggestionsLocalizedNearbyTransitShortSubtitleString();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return (NSString *)v3;
    }
  }
  else
  {

  }
  -[MapsSuggestionsShortcut geoMapItem](v4, "geoMapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsMapItemCityName(v8);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v4->_customName)
  {
    type = v4->_type;
    if (type > 6)
    {
LABEL_12:
      GEOFindOrCreateLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v15 = 136446978;
        v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcut.m";
        v17 = 1024;
        v18 = 221;
        v19 = 2082;
        v20 = "BOOL _isHomeOrWorkOrSchool(MapsSuggestionsShortcutType)";
        v21 = 2082;
        v22 = "YES";
        _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsShortcutType!", (uint8_t *)&v15, 0x26u);
      }

LABEL_15:
      -[MapsSuggestionsShortcut _originalName]((uint64_t *)v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        goto LABEL_17;
      goto LABEL_16;
    }
    if (((1 << type) & 0x2C) == 0)
    {
      if (((1 << type) & 0x43) != 0)
        goto LABEL_15;
      goto LABEL_12;
    }
  }
LABEL_16:
  MapsSuggestionsMapItemStreetWithNumber(v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v14 = &stru_1E4BDFC28;
    if (v9)
      v14 = v9;
    v13 = v14;
    goto LABEL_21;
  }
LABEL_17:
  MapsSuggestionsLocalizedShortcutSubString(v12, v9);
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_21:
  return (NSString *)v13;
}

- (BOOL)isBackedPlaceholder
{
  unint64_t type;
  NSObject *v4;
  BOOL v5;
  void *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  type = self->_type;
  if (type > 6)
    goto LABEL_9;
  if (((1 << type) & 0x2C) != 0)
  {
    -[MapsSuggestionsShortcut identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

    return v5;
  }
  if (((1 << type) & 0x42) != 0)
    return 0;
  if (type)
  {
LABEL_9:
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 136446978;
      v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcut.m";
      v11 = 1024;
      v12 = 272;
      v13 = 2082;
      v14 = "-[MapsSuggestionsShortcut isBackedPlaceholder]";
      v15 = 2082;
      v16 = "YES";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsShortcutType!", (uint8_t *)&v9, 0x26u);
    }

    return 0;
  }
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v9 = 136446978;
    v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcut.m";
    v11 = 1024;
    v12 = 268;
    v13 = 2082;
    v14 = "-[MapsSuggestionsShortcut isBackedPlaceholder]";
    v15 = 2082;
    v16 = "YES";
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. A type should have been set!", (uint8_t *)&v9, 0x26u);
  }

  return self->_geoMapItem == 0;
}

- (BOOL)isSetupPlaceholder
{
  return !self->_geoMapItem && self->_customName == 0;
}

- (void)addContact:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *contacts;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (!-[NSArray containsObject:](self->_contacts, "containsObject:", v4))
    {
      v5 = (void *)-[NSArray mutableCopy](self->_contacts, "mutableCopy");
      objc_msgSend(v5, "addObject:", v4);
      v6 = (NSArray *)objc_msgSend(v5, "copy");
      contacts = self->_contacts;
      self->_contacts = v6;

    }
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136446978;
      v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcut.m";
      v11 = 1024;
      v12 = 287;
      v13 = 2082;
      v14 = "-[MapsSuggestionsShortcut addContact:]";
      v15 = 2082;
      v16 = "nil == (contact)";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a contact", (uint8_t *)&v9, 0x26u);
    }

  }
}

- (void)removeContact:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *contacts;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (-[NSArray containsObject:](self->_contacts, "containsObject:", v4))
    {
      v5 = (void *)-[NSArray mutableCopy](self->_contacts, "mutableCopy");
      objc_msgSend(v5, "removeObject:", v4);
      v6 = (NSArray *)objc_msgSend(v5, "copy");
      contacts = self->_contacts;
      self->_contacts = v6;

    }
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136446978;
      v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcut.m";
      v11 = 1024;
      v12 = 298;
      v13 = 2082;
      v14 = "-[MapsSuggestionsShortcut removeContact:]";
      v15 = 2082;
      v16 = "nil == (contact)";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a contact", (uint8_t *)&v9, 0x26u);
    }

  }
}

- (NSArray)stringContacts
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_contacts, "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_contacts;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "handleValue", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[MapsSuggestionsShortcut type](self, "type");
  -[MapsSuggestionsShortcut identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsShortcut geoMapItem](self, "geoMapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsShortcut customName](self, "customName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsShortcut contacts](self, "contacts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MapsSuggestionsShortcut isHidden](self, "isHidden");
  -[MapsSuggestionsShortcut originatingAddressString](self, "originatingAddressString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v4, "initWithType:identifier:geoMapItem:customName:contacts:isHidden:originatingAddress:", v5, v6, v7, v8, v9, v10, v11);

  -[MapsSuggestionsShortcut storageIdentifier](self, "storageIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setStorageIdentifier:", v13);

  objc_msgSend(v12, "setDerivedFromMeCard:", -[MapsSuggestionsShortcut derivedFromMeCard](self, "derivedFromMeCard"));
  -[MapsSuggestionsShortcut mapsSyncCreateTime](self, "mapsSyncCreateTime");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMapsSyncCreateTime:", v14);

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  void *v5;
  id v6;

  type = self->_type;
  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", type, CFSTR("MapsSuggestionsShortcutTypeKey"));
  -[MapsSuggestionsShortcut identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("MapsSuggestionsShortcutIdentifierKey"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_customName, CFSTR("MapsSuggestionsShortcutNameKey"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_geoMapItem, CFSTR("MapsSuggestionsShortcutMapItemKey"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_contacts, CFSTR("MapsSuggestionsShortcutETAContactsKey"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isHidden, CFSTR("MapsSuggestionsShortcutIsHiddenKey"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_originatingAddressString, CFSTR("MapsSuggestionsShortcutOriginatingAddressKey"));

}

- (MapsSuggestionsShortcut)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  MapsSuggestionsShortcut *v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MapsSuggestionsShortcutTypeKey"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MapsSuggestionsShortcutNameKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v8 = objc_opt_class();
  v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("MapsSuggestionsShortcutETAContactsKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MapsSuggestionsShortcutIdentifierKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MapsSuggestionsShortcutMapItemKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MapsSuggestionsShortcutIsHiddenKey"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MapsSuggestionsShortcutOriginatingAddressKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[MapsSuggestionsShortcut initWithType:identifier:geoMapItem:customName:contacts:isHidden:originatingAddress:](self, "initWithType:identifier:geoMapItem:customName:contacts:isHidden:originatingAddress:", v5, v11, v12, v6, v10, v13, v14);
  return v15;
}

- (id)data
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v3, "encodeObject:forKey:", self, *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v3, "finishEncoding");
  objc_msgSend(v3, "encodedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)shortcutWithData:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  char *v10;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v12 = 0;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, &v12);
    v5 = (uint64_t)v12;
    objc_msgSend(v4, "setDecodingFailurePolicy:", 1);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishDecoding");
    objc_msgSend(v4, "error");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7 | v5)
    {

    }
    else if (v6)
    {
      v8 = v6;
LABEL_15:

      goto LABEL_16;
    }
    GEOFindOrCreateLog();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (char *)v5;
      if (!v5)
      {
        objc_msgSend(v4, "error");
        v10 = (char *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "Could not deserialize MapsSuggestionsShortcut, error: %@", buf, 0xCu);
      if (!v5)

    }
    v8 = 0;
    goto LABEL_15;
  }
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcut.m";
    v15 = 1024;
    v16 = 390;
    v17 = 2082;
    v18 = "+[MapsSuggestionsShortcut shortcutWithData:]";
    v19 = 2082;
    v20 = "nil == (data)";
    _os_log_impl(&dword_1A427D000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires serialized data", buf, 0x26u);
  }
  v8 = 0;
LABEL_16:

  return v8;
}

- (id)description
{
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const __CFString *v15;
  id v16;
  __CFString *v17;
  const __CFString *v18;
  NSString *originatingAddressString;
  __CFString *v20;
  void *v21;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const __CFString *v27;
  const __CFString *v28;
  id v29;
  void *v30;

  if (self)
    v3 = -[MapsSuggestionsShortcut isBackedPlaceholder](self, "isBackedPlaceholder")
      || -[MapsSuggestionsShortcut isSetupPlaceholder](self, "isSetupPlaceholder");
  else
    v3 = 0;
  v29 = objc_alloc(MEMORY[0x1E0CB3940]);
  NSStringFromMapsSuggestionsShortcutType(self->_type);
  v4 = objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsShortcut title](self, "title");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_1E4BDFC28;
  v28 = v7;
  -[MapsSuggestionsShortcut subtitle](self, "subtitle");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_1E4BDFC28;
  v27 = v10;
  -[MapsSuggestionsShortcut geoMapItem](self, "geoMapItem");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
    v12 = 89;
  else
    v12 = 78;
  v26 = v12;
  v13 = "id";
  if (v3)
    v13 = "placeholder";
  v24 = (void *)v11;
  v25 = v13;
  -[MapsSuggestionsShortcut identifier](self, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = CFSTR("Y");
  v30 = (void *)v4;
  if (v14)
  {
    v16 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MapsSuggestionsShortcut identifier](self, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (__CFString *)objc_msgSend(v16, "initWithFormat:", CFSTR("'%@'"), v23);
  }
  else if (v3)
  {
    v17 = CFSTR("Y");
  }
  else
  {
    v17 = CFSTR("N");
  }
  if (self->_isHidden)
    v18 = CFSTR("Y");
  else
    v18 = CFSTR("N");
  if (!self->_derivedFromMeCard)
    v15 = CFSTR("N");
  originatingAddressString = self->_originatingAddressString;
  if (originatingAddressString)
    v20 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" ori='%@'"), self->_originatingAddressString);
  else
    v20 = &stru_1E4BDFC28;
  v21 = (void *)objc_msgSend(v29, "initWithFormat:", CFSTR("SHORTCUT{%@} '%@' / '%@' mapItem=%c %s=%@ hidden=%@ meCard=%@%@ sharedETAs=%u"), v30, v28, v27, v26, v25, v17, v18, v15, v20, -[NSArray count](self->_contacts, "count"));
  if (originatingAddressString)

  if (v14)
  {

  }
  return v21;
}

- (BOOL)isEqualToShortcut:(id)a3
{
  MapsSuggestionsShortcut *v4;
  MapsSuggestionsShortcut *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSString *customName;
  NSString *originatingAddressString;
  GEOMapItemStorage *geoMapItem;
  GEOMapItemStorage *v14;
  BOOL v15;

  v4 = (MapsSuggestionsShortcut *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_14;
  if (self == v4)
  {
    v15 = 1;
    goto LABEL_16;
  }
  if (self->_type != v4->_type)
    goto LABEL_14;
  if (self->_isHidden != v4->_isHidden)
    goto LABEL_14;
  -[MapsSuggestionsShortcut identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsShortcut identifier](v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    -[MapsSuggestionsShortcut identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsShortcut identifier](v5, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (!v10)
      goto LABEL_14;
  }
  if (((customName = self->_customName, customName == v5->_customName)
     || -[NSString isEqualToString:](customName, "isEqualToString:"))
    && ((originatingAddressString = self->_originatingAddressString,
         originatingAddressString == v5->_originatingAddressString)
     || -[NSString isEqualToString:](originatingAddressString, "isEqualToString:"))
    && ((geoMapItem = self->_geoMapItem, v14 = v5->_geoMapItem, geoMapItem == v14)
     || MapsSuggestionsMapItemsAreEqual(geoMapItem, v14, 1, 1, 1)))
  {
    v15 = -[NSArray isEqualToArray:](self->_contacts, "isEqualToArray:", v5->_contacts);
  }
  else
  {
LABEL_14:
    v15 = 0;
  }
LABEL_16:

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  MapsSuggestionsShortcut *v4;
  BOOL v5;

  v4 = (MapsSuggestionsShortcut *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[MapsSuggestionsShortcut isEqualToShortcut:](self, "isEqualToShortcut:", v4);
  }

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSUUID)storageIdentifier
{
  return self->_storageIdentifier;
}

- (void)setStorageIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)customName
{
  return self->_customName;
}

- (GEOMapItemStorage)geoMapItem
{
  return self->_geoMapItem;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (void)setIsHidden:(BOOL)a3
{
  self->_isHidden = a3;
}

- (NSString)originatingAddressString
{
  return self->_originatingAddressString;
}

- (void)setOriginatingAddressString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)derivedFromMeCard
{
  return self->_derivedFromMeCard;
}

- (void)setDerivedFromMeCard:(BOOL)a3
{
  self->_derivedFromMeCard = a3;
}

- (NSDate)mapsSyncCreateTime
{
  return self->_mapsSyncCreateTime;
}

- (void)setMapsSyncCreateTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_mapsSyncCreateTime, 0);
  objc_storeStrong((id *)&self->_originatingAddressString, 0);
  objc_storeStrong((id *)&self->_geoMapItem, 0);
  objc_storeStrong((id *)&self->_customName, 0);
  objc_storeStrong((id *)&self->_storageIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
