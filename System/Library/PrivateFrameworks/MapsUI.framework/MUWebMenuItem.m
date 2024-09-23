@implementation MUWebMenuItem

- (BOOL)hasMenuItemId
{
  return self->_menuItemId != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasSymbolImage
{
  return self->_symbolImage != 0;
}

- (BOOL)hasAppArtwork
{
  return self->_appArtwork != 0;
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (void)clearGroupDatas
{
  -[NSMutableArray removeAllObjects](self->_groupDatas, "removeAllObjects");
}

- (void)addGroupData:(id)a3
{
  id v4;
  NSMutableArray *groupDatas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  groupDatas = self->_groupDatas;
  v8 = v4;
  if (!groupDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_groupDatas;
    self->_groupDatas = v6;

    v4 = v8;
    groupDatas = self->_groupDatas;
  }
  -[NSMutableArray addObject:](groupDatas, "addObject:", v4);

}

- (unint64_t)groupDatasCount
{
  return -[NSMutableArray count](self->_groupDatas, "count");
}

- (id)groupDataAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_groupDatas, "objectAtIndex:", a3);
}

+ (Class)groupDataType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAction
{
  return self->_action != 0;
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
  v8.super_class = (Class)MUWebMenuItem;
  -[MUWebMenuItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUWebMenuItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *menuItemId;
  NSString *displayName;
  NSString *symbolImage;
  NSString *appArtwork;
  NSString *url;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  MUUserInteractionAction *action;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  menuItemId = self->_menuItemId;
  if (menuItemId)
    objc_msgSend(v3, "setObject:forKey:", menuItemId, CFSTR("menu_item_id"));
  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v4, "setObject:forKey:", displayName, CFSTR("display_name"));
  symbolImage = self->_symbolImage;
  if (symbolImage)
    objc_msgSend(v4, "setObject:forKey:", symbolImage, CFSTR("symbol_image"));
  appArtwork = self->_appArtwork;
  if (appArtwork)
    objc_msgSend(v4, "setObject:forKey:", appArtwork, CFSTR("app_artwork"));
  url = self->_url;
  if (url)
    objc_msgSend(v4, "setObject:forKey:", url, CFSTR("url"));
  if (-[NSMutableArray count](self->_groupDatas, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_groupDatas, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = self->_groupDatas;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v20);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("groupData"));
  }
  action = self->_action;
  if (action)
  {
    -[MUUserInteractionAction dictionaryRepresentation](action, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("action"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MUWebMenuItemReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_menuItemId)
    PBDataWriterWriteStringField();
  if (self->_displayName)
    PBDataWriterWriteStringField();
  if (self->_symbolImage)
    PBDataWriterWriteStringField();
  if (self->_appArtwork)
    PBDataWriterWriteStringField();
  if (self->_url)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_groupDatas;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_action)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_menuItemId)
    objc_msgSend(v8, "setMenuItemId:");
  if (self->_displayName)
    objc_msgSend(v8, "setDisplayName:");
  if (self->_symbolImage)
    objc_msgSend(v8, "setSymbolImage:");
  if (self->_appArtwork)
    objc_msgSend(v8, "setAppArtwork:");
  if (self->_url)
    objc_msgSend(v8, "setUrl:");
  if (-[MUWebMenuItem groupDatasCount](self, "groupDatasCount"))
  {
    objc_msgSend(v8, "clearGroupDatas");
    v4 = -[MUWebMenuItem groupDatasCount](self, "groupDatasCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[MUWebMenuItem groupDataAtIndex:](self, "groupDataAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addGroupData:", v7);

      }
    }
  }
  if (self->_action)
    objc_msgSend(v8, "setAction:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
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
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_menuItemId, "copyWithZone:", a3);
  v7 = (void *)v5[5];
  v5[5] = v6;

  v8 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_symbolImage, "copyWithZone:", a3);
  v11 = (void *)v5[6];
  v5[6] = v10;

  v12 = -[NSString copyWithZone:](self->_appArtwork, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  v14 = -[NSString copyWithZone:](self->_url, "copyWithZone:", a3);
  v15 = (void *)v5[7];
  v5[7] = v14;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = self->_groupDatas;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v20), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend(v5, "addGroupData:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v18);
  }

  v22 = -[MUUserInteractionAction copyWithZone:](self->_action, "copyWithZone:", a3);
  v23 = (void *)v5[1];
  v5[1] = v22;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *menuItemId;
  NSString *displayName;
  NSString *symbolImage;
  NSString *appArtwork;
  NSString *url;
  NSMutableArray *groupDatas;
  MUUserInteractionAction *action;
  char v12;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((menuItemId = self->_menuItemId, !((unint64_t)menuItemId | v4[5]))
     || -[NSString isEqual:](menuItemId, "isEqual:"))
    && ((displayName = self->_displayName, !((unint64_t)displayName | v4[3]))
     || -[NSString isEqual:](displayName, "isEqual:"))
    && ((symbolImage = self->_symbolImage, !((unint64_t)symbolImage | v4[6]))
     || -[NSString isEqual:](symbolImage, "isEqual:"))
    && ((appArtwork = self->_appArtwork, !((unint64_t)appArtwork | v4[2]))
     || -[NSString isEqual:](appArtwork, "isEqual:"))
    && ((url = self->_url, !((unint64_t)url | v4[7])) || -[NSString isEqual:](url, "isEqual:"))
    && ((groupDatas = self->_groupDatas, !((unint64_t)groupDatas | v4[4]))
     || -[NSMutableArray isEqual:](groupDatas, "isEqual:")))
  {
    action = self->_action;
    if ((unint64_t)action | v4[1])
      v12 = -[MUUserInteractionAction isEqual:](action, "isEqual:");
    else
      v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_menuItemId, "hash");
  v4 = -[NSString hash](self->_displayName, "hash") ^ v3;
  v5 = -[NSString hash](self->_symbolImage, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_appArtwork, "hash");
  v7 = -[NSString hash](self->_url, "hash");
  v8 = v7 ^ -[NSMutableArray hash](self->_groupDatas, "hash");
  return v6 ^ v8 ^ -[MUUserInteractionAction hash](self->_action, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  MUUserInteractionAction *action;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 5))
    -[MUWebMenuItem setMenuItemId:](self, "setMenuItemId:");
  if (*((_QWORD *)v4 + 3))
    -[MUWebMenuItem setDisplayName:](self, "setDisplayName:");
  if (*((_QWORD *)v4 + 6))
    -[MUWebMenuItem setSymbolImage:](self, "setSymbolImage:");
  if (*((_QWORD *)v4 + 2))
    -[MUWebMenuItem setAppArtwork:](self, "setAppArtwork:");
  if (*((_QWORD *)v4 + 7))
    -[MUWebMenuItem setUrl:](self, "setUrl:");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[MUWebMenuItem addGroupData:](self, "addGroupData:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  action = self->_action;
  v11 = *((_QWORD *)v4 + 1);
  if (action)
  {
    if (v11)
      -[MUUserInteractionAction mergeFrom:](action, "mergeFrom:");
  }
  else if (v11)
  {
    -[MUWebMenuItem setAction:](self, "setAction:");
  }

}

- (NSString)menuItemId
{
  return self->_menuItemId;
}

- (void)setMenuItemId:(id)a3
{
  objc_storeStrong((id *)&self->_menuItemId, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSString)symbolImage
{
  return self->_symbolImage;
}

- (void)setSymbolImage:(id)a3
{
  objc_storeStrong((id *)&self->_symbolImage, a3);
}

- (NSString)appArtwork
{
  return self->_appArtwork;
}

- (void)setAppArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_appArtwork, a3);
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSMutableArray)groupDatas
{
  return self->_groupDatas;
}

- (void)setGroupDatas:(id)a3
{
  objc_storeStrong((id *)&self->_groupDatas, a3);
}

- (MUUserInteractionAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_symbolImage, 0);
  objc_storeStrong((id *)&self->_menuItemId, 0);
  objc_storeStrong((id *)&self->_groupDatas, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_appArtwork, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end
