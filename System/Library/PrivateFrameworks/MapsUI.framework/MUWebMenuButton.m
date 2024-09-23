@implementation MUWebMenuButton

- (BOOL)hasMenuId
{
  return self->_menuId != 0;
}

- (BOOL)hasBoundingBox
{
  return self->_boundingBox != 0;
}

- (void)clearMenuItems
{
  -[NSMutableArray removeAllObjects](self->_menuItems, "removeAllObjects");
}

- (void)addMenuItem:(id)a3
{
  id v4;
  NSMutableArray *menuItems;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  menuItems = self->_menuItems;
  v8 = v4;
  if (!menuItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_menuItems;
    self->_menuItems = v6;

    v4 = v8;
    menuItems = self->_menuItems;
  }
  -[NSMutableArray addObject:](menuItems, "addObject:", v4);

}

- (unint64_t)menuItemsCount
{
  return -[NSMutableArray count](self->_menuItems, "count");
}

- (id)menuItemAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_menuItems, "objectAtIndex:", a3);
}

+ (Class)menuItemType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)MUWebMenuButton;
  -[MUWebMenuButton description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUWebMenuButton dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *menuId;
  MUWebMenuButtonBoundingBox *boundingBox;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  menuId = self->_menuId;
  if (menuId)
    objc_msgSend(v3, "setObject:forKey:", menuId, CFSTR("menu_id"));
  boundingBox = self->_boundingBox;
  if (boundingBox)
  {
    -[MUWebMenuButtonBoundingBox dictionaryRepresentation](boundingBox, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("bounding_box"));

  }
  if (-[NSMutableArray count](self->_menuItems, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_menuItems, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = self->_menuItems;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("menu_item"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MUWebMenuButtonReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_menuId)
    PBDataWriterWriteStringField();
  if (self->_boundingBox)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_menuItems;
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

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_menuId)
    objc_msgSend(v8, "setMenuId:");
  if (self->_boundingBox)
    objc_msgSend(v8, "setBoundingBox:");
  if (-[MUWebMenuButton menuItemsCount](self, "menuItemsCount"))
  {
    objc_msgSend(v8, "clearMenuItems");
    v4 = -[MUWebMenuButton menuItemsCount](self, "menuItemsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[MUWebMenuButton menuItemAtIndex:](self, "menuItemAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addMenuItem:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_menuId, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[MUWebMenuButtonBoundingBox copyWithZone:](self->_boundingBox, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_menuItems;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend(v5, "addMenuItem:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *menuId;
  MUWebMenuButtonBoundingBox *boundingBox;
  NSMutableArray *menuItems;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((menuId = self->_menuId, !((unint64_t)menuId | v4[2]))
     || -[NSString isEqual:](menuId, "isEqual:"))
    && ((boundingBox = self->_boundingBox, !((unint64_t)boundingBox | v4[1]))
     || -[MUWebMenuButtonBoundingBox isEqual:](boundingBox, "isEqual:")))
  {
    menuItems = self->_menuItems;
    if ((unint64_t)menuItems | v4[3])
      v8 = -[NSMutableArray isEqual:](menuItems, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_menuId, "hash");
  v4 = -[MUWebMenuButtonBoundingBox hash](self->_boundingBox, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_menuItems, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  MUWebMenuButtonBoundingBox *boundingBox;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 2))
    -[MUWebMenuButton setMenuId:](self, "setMenuId:");
  boundingBox = self->_boundingBox;
  v6 = *((_QWORD *)v4 + 1);
  if (boundingBox)
  {
    if (v6)
      -[MUWebMenuButtonBoundingBox mergeFrom:](boundingBox, "mergeFrom:");
  }
  else if (v6)
  {
    -[MUWebMenuButton setBoundingBox:](self, "setBoundingBox:");
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v4 + 3);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[MUWebMenuButton addMenuItem:](self, "addMenuItem:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (NSString)menuId
{
  return self->_menuId;
}

- (void)setMenuId:(id)a3
{
  objc_storeStrong((id *)&self->_menuId, a3);
}

- (MUWebMenuButtonBoundingBox)boundingBox
{
  return self->_boundingBox;
}

- (void)setBoundingBox:(id)a3
{
  objc_storeStrong((id *)&self->_boundingBox, a3);
}

- (NSMutableArray)menuItems
{
  return self->_menuItems;
}

- (void)setMenuItems:(id)a3
{
  objc_storeStrong((id *)&self->_menuItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuItems, 0);
  objc_storeStrong((id *)&self->_menuId, 0);
  objc_storeStrong((id *)&self->_boundingBox, 0);
}

@end
