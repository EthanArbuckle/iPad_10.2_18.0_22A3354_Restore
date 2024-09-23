@implementation _MRNowPlayingClientProtobuf

- (int)nowPlayingVisibility
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_nowPlayingVisibility;
  else
    return 0;
}

- (_MRColorProtobuf)tintColor
{
  return self->_tintColor;
}

- (int)processUserIdentifier
{
  return self->_processUserIdentifier;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (NSString)parentApplicationBundleIdentifier
{
  return self->_parentApplicationBundleIdentifier;
}

- (BOOL)hasIconURL
{
  return self->_iconURL != 0;
}

- (NSMutableArray)extendedBundleIdentifierHierarchys
{
  return self->_extendedBundleIdentifierHierarchys;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_parentApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_extendedBundleIdentifierHierarchys, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_bundleIdentifier)
    PBDataWriterWriteStringField();
  if (self->_parentApplicationBundleIdentifier)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_tintColor)
    PBDataWriterWriteSubmessage();
  if (self->_displayName)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_extendedBundleIdentifierHierarchys;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_iconURL)
    PBDataWriterWriteStringField();

}

- (void)setHasProcessIdentifier:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (void)setProcessUserIdentifier:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_processUserIdentifier = a3;
}

- (void)setProcessIdentifier:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_processIdentifier = a3;
}

- (void)setParentApplicationBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_parentApplicationBundleIdentifier, a3);
}

- (void)setNowPlayingVisibility:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_nowPlayingVisibility = a3;
}

- (void)setIconURL:(id)a3
{
  objc_storeStrong((id *)&self->_iconURL, a3);
}

- (void)setHasProcessUserIdentifier:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)setHasNowPlayingVisibility:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setExtendedBundleIdentifierHierarchys:(id)a3
{
  objc_storeStrong((id *)&self->_extendedBundleIdentifierHierarchys, a3);
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (BOOL)hasProcessIdentifier
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (BOOL)hasParentApplicationBundleIdentifier
{
  return self->_parentApplicationBundleIdentifier != 0;
}

- (BOOL)hasProcessUserIdentifier
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasNowPlayingVisibility
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)nowPlayingVisibilityAsString:(int)a3
{
  if (a3 < 4)
    return off_1E30CCE90[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNowPlayingVisibility:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Undefined")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AlwaysVisible")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VisibleWhenBackgrounded")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NeverVisible")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasTintColor
{
  return self->_tintColor != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (void)clearExtendedBundleIdentifierHierarchys
{
  -[NSMutableArray removeAllObjects](self->_extendedBundleIdentifierHierarchys, "removeAllObjects");
}

- (void)addExtendedBundleIdentifierHierarchy:(id)a3
{
  id v4;
  NSMutableArray *extendedBundleIdentifierHierarchys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  extendedBundleIdentifierHierarchys = self->_extendedBundleIdentifierHierarchys;
  v8 = v4;
  if (!extendedBundleIdentifierHierarchys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_extendedBundleIdentifierHierarchys;
    self->_extendedBundleIdentifierHierarchys = v6;

    v4 = v8;
    extendedBundleIdentifierHierarchys = self->_extendedBundleIdentifierHierarchys;
  }
  -[NSMutableArray addObject:](extendedBundleIdentifierHierarchys, "addObject:", v4);

}

- (unint64_t)extendedBundleIdentifierHierarchysCount
{
  return -[NSMutableArray count](self->_extendedBundleIdentifierHierarchys, "count");
}

- (id)extendedBundleIdentifierHierarchyAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_extendedBundleIdentifierHierarchys, "objectAtIndex:", a3);
}

+ (Class)extendedBundleIdentifierHierarchyType
{
  return (Class)objc_opt_class();
}

- (void)setIsEmptyDeprecated:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isEmptyDeprecated = a3;
}

- (void)setHasIsEmptyDeprecated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsEmptyDeprecated
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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
  v8.super_class = (Class)_MRNowPlayingClientProtobuf;
  -[_MRNowPlayingClientProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRNowPlayingClientProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *bundleIdentifier;
  NSString *parentApplicationBundleIdentifier;
  char has;
  void *v8;
  uint64_t nowPlayingVisibility;
  __CFString *v10;
  _MRColorProtobuf *tintColor;
  void *v12;
  NSString *displayName;
  NSMutableArray *extendedBundleIdentifierHierarchys;
  void *v15;
  NSString *iconURL;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_processIdentifier);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("processIdentifier"));

  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
    objc_msgSend(v3, "setObject:forKey:", bundleIdentifier, CFSTR("bundleIdentifier"));
  parentApplicationBundleIdentifier = self->_parentApplicationBundleIdentifier;
  if (parentApplicationBundleIdentifier)
    objc_msgSend(v3, "setObject:forKey:", parentApplicationBundleIdentifier, CFSTR("parentApplicationBundleIdentifier"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_processUserIdentifier);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("processUserIdentifier"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    nowPlayingVisibility = self->_nowPlayingVisibility;
    if (nowPlayingVisibility >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_nowPlayingVisibility);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E30CCE90[nowPlayingVisibility];
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("nowPlayingVisibility"));

  }
  tintColor = self->_tintColor;
  if (tintColor)
  {
    -[_MRColorProtobuf dictionaryRepresentation](tintColor, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("tintColor"));

  }
  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v3, "setObject:forKey:", displayName, CFSTR("displayName"));
  extendedBundleIdentifierHierarchys = self->_extendedBundleIdentifierHierarchys;
  if (extendedBundleIdentifierHierarchys)
    objc_msgSend(v3, "setObject:forKey:", extendedBundleIdentifierHierarchys, CFSTR("extendedBundleIdentifierHierarchy"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isEmptyDeprecated);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("isEmptyDeprecated"));

  }
  iconURL = self->_iconURL;
  if (iconURL)
    objc_msgSend(v3, "setObject:forKey:", iconURL, CFSTR("iconURL"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRNowPlayingClientProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  _BYTE *v11;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[14] = self->_processIdentifier;
    *((_BYTE *)v4 + 76) |= 2u;
  }
  v11 = v4;
  if (self->_bundleIdentifier)
  {
    objc_msgSend(v4, "setBundleIdentifier:");
    v4 = v11;
  }
  if (self->_parentApplicationBundleIdentifier)
  {
    objc_msgSend(v11, "setParentApplicationBundleIdentifier:");
    v4 = v11;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[15] = self->_processUserIdentifier;
    *((_BYTE *)v4 + 76) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[10] = self->_nowPlayingVisibility;
    *((_BYTE *)v4 + 76) |= 1u;
  }
  if (self->_tintColor)
    objc_msgSend(v11, "setTintColor:");
  if (self->_displayName)
    objc_msgSend(v11, "setDisplayName:");
  if (-[_MRNowPlayingClientProtobuf extendedBundleIdentifierHierarchysCount](self, "extendedBundleIdentifierHierarchysCount"))
  {
    objc_msgSend(v11, "clearExtendedBundleIdentifierHierarchys");
    v6 = -[_MRNowPlayingClientProtobuf extendedBundleIdentifierHierarchysCount](self, "extendedBundleIdentifierHierarchysCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[_MRNowPlayingClientProtobuf extendedBundleIdentifierHierarchyAtIndex:](self, "extendedBundleIdentifierHierarchyAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addExtendedBundleIdentifierHierarchy:", v9);

      }
    }
  }
  v10 = v11;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v11[72] = self->_isEmptyDeprecated;
    v11[76] |= 8u;
  }
  if (self->_iconURL)
  {
    objc_msgSend(v11, "setIconURL:");
    v10 = v11;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char has;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_processIdentifier;
    *(_BYTE *)(v5 + 76) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_bundleIdentifier, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v7;

  v9 = -[NSString copyWithZone:](self->_parentApplicationBundleIdentifier, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v9;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 60) = self->_processUserIdentifier;
    *(_BYTE *)(v6 + 76) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_nowPlayingVisibility;
    *(_BYTE *)(v6 + 76) |= 1u;
  }
  v12 = -[_MRColorProtobuf copyWithZone:](self->_tintColor, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v12;

  v14 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v14;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = self->_extendedBundleIdentifierHierarchys;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend((id)v6, "addExtendedBundleIdentifierHierarchy:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v18);
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_BYTE *)(v6 + 72) = self->_isEmptyDeprecated;
    *(_BYTE *)(v6 + 76) |= 8u;
  }
  v22 = -[NSString copyWithZone:](self->_iconURL, "copyWithZone:", a3, (_QWORD)v25);
  v23 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v22;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *bundleIdentifier;
  NSString *parentApplicationBundleIdentifier;
  _MRColorProtobuf *tintColor;
  NSString *displayName;
  NSMutableArray *extendedBundleIdentifierHierarchys;
  char v10;
  NSString *iconURL;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_processIdentifier != *((_DWORD *)v4 + 14))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
    goto LABEL_31;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((_QWORD *)v4 + 1)
    && !-[NSString isEqual:](bundleIdentifier, "isEqual:"))
  {
    goto LABEL_31;
  }
  parentApplicationBundleIdentifier = self->_parentApplicationBundleIdentifier;
  if ((unint64_t)parentApplicationBundleIdentifier | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](parentApplicationBundleIdentifier, "isEqual:"))
      goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 4) == 0 || self->_processUserIdentifier != *((_DWORD *)v4 + 15))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 76) & 4) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_nowPlayingVisibility != *((_DWORD *)v4 + 10))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    goto LABEL_31;
  }
  tintColor = self->_tintColor;
  if ((unint64_t)tintColor | *((_QWORD *)v4 + 8) && !-[_MRColorProtobuf isEqual:](tintColor, "isEqual:"))
    goto LABEL_31;
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_31;
  }
  extendedBundleIdentifierHierarchys = self->_extendedBundleIdentifierHierarchys;
  if ((unint64_t)extendedBundleIdentifierHierarchys | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](extendedBundleIdentifierHierarchys, "isEqual:"))
      goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    if ((*((_BYTE *)v4 + 76) & 8) == 0)
      goto LABEL_37;
LABEL_31:
    v10 = 0;
    goto LABEL_32;
  }
  if ((*((_BYTE *)v4 + 76) & 8) == 0)
    goto LABEL_31;
  if (!self->_isEmptyDeprecated)
  {
    if (!*((_BYTE *)v4 + 72))
      goto LABEL_37;
    goto LABEL_31;
  }
  if (!*((_BYTE *)v4 + 72))
    goto LABEL_31;
LABEL_37:
  iconURL = self->_iconURL;
  if ((unint64_t)iconURL | *((_QWORD *)v4 + 4))
    v10 = -[NSString isEqual:](iconURL, "isEqual:");
  else
    v10 = 1;
LABEL_32:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_processIdentifier;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_bundleIdentifier, "hash");
  v5 = -[NSString hash](self->_parentApplicationBundleIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v6 = 2654435761 * self->_processUserIdentifier;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_6:
      v7 = 2654435761 * self->_nowPlayingVisibility;
      goto LABEL_9;
    }
  }
  v7 = 0;
LABEL_9:
  v8 = -[_MRColorProtobuf hash](self->_tintColor, "hash");
  v9 = -[NSString hash](self->_displayName, "hash");
  v10 = -[NSMutableArray hash](self->_extendedBundleIdentifierHierarchys, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v11 = 2654435761 * self->_isEmptyDeprecated;
  else
    v11 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[NSString hash](self->_iconURL, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  char v6;
  _MRColorProtobuf *tintColor;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((v4[19] & 2) != 0)
  {
    self->_processIdentifier = v4[14];
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 1))
    -[_MRNowPlayingClientProtobuf setBundleIdentifier:](self, "setBundleIdentifier:");
  if (*((_QWORD *)v5 + 6))
    -[_MRNowPlayingClientProtobuf setParentApplicationBundleIdentifier:](self, "setParentApplicationBundleIdentifier:");
  v6 = *((_BYTE *)v5 + 76);
  if ((v6 & 4) != 0)
  {
    self->_processUserIdentifier = *((_DWORD *)v5 + 15);
    *(_BYTE *)&self->_has |= 4u;
    v6 = *((_BYTE *)v5 + 76);
  }
  if ((v6 & 1) != 0)
  {
    self->_nowPlayingVisibility = *((_DWORD *)v5 + 10);
    *(_BYTE *)&self->_has |= 1u;
  }
  tintColor = self->_tintColor;
  v8 = *((_QWORD *)v5 + 8);
  if (tintColor)
  {
    if (v8)
      -[_MRColorProtobuf mergeFrom:](tintColor, "mergeFrom:");
  }
  else if (v8)
  {
    -[_MRNowPlayingClientProtobuf setTintColor:](self, "setTintColor:");
  }
  if (*((_QWORD *)v5 + 2))
    -[_MRNowPlayingClientProtobuf setDisplayName:](self, "setDisplayName:");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = *((id *)v5 + 3);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[_MRNowPlayingClientProtobuf addExtendedBundleIdentifierHierarchy:](self, "addExtendedBundleIdentifierHierarchy:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  if ((*((_BYTE *)v5 + 76) & 8) != 0)
  {
    self->_isEmptyDeprecated = *((_BYTE *)v5 + 72);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v5 + 4))
    -[_MRNowPlayingClientProtobuf setIconURL:](self, "setIconURL:");

}

- (BOOL)isEmptyDeprecated
{
  return self->_isEmptyDeprecated;
}

- (NSString)iconURL
{
  return self->_iconURL;
}

@end
