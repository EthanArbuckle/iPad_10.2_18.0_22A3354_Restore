@implementation ATXPBFaceGalleryEvent

- (uint64_t)eventType
{
  if (result)
  {
    if ((*(_BYTE *)(result + 32) & 1) != 0)
      return *(unsigned int *)(result + 16);
    else
      return 0;
  }
  return result;
}

- (uint64_t)setEventType:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 32) |= 1u;
    *(_DWORD *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setHasEventType:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 32) = *(_BYTE *)(result + 32) & 0xFE | a2;
  return result;
}

- (uint64_t)hasEventType
{
  if (result)
    return *(_BYTE *)(result + 32) & 1;
  return result;
}

- (__CFString)eventTypeAsString:(void *)a1
{
  if (a1)
  {
    if (a2 < 4)
      return off_1E4D5A1A0[(int)a2];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (__CFString *)a1;
}

- (uint64_t)StringAsEventType:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = v3;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("GalleryDidAppear")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("GalleryDidDisappear")) & 1) != 0)
    {
      v6 = 2;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("GalleryItemsDidAppear")))
    {
      v6 = 3;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)hasConfiguration
{
  if (result)
    return *(_QWORD *)(result + 8) != 0;
  return result;
}

- (uint64_t)clearItems
{
  if (result)
    return objc_msgSend(*(id *)(result + 24), "removeAllObjects");
  return result;
}

- (void)addItems:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)itemsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 24), "count");
  return result;
}

- (id)itemsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[3], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (uint64_t)itemsType
{
  objc_opt_self();
  return objc_opt_class();
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
  v8.super_class = (Class)ATXPBFaceGalleryEvent;
  -[ATXPBFaceGalleryEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBFaceGalleryEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t eventType;
  __CFString *v5;
  ATXPBFaceGalleryConfiguration *configuration;
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    eventType = self->_eventType;
    if (eventType >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_eventType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E4D5A1A0[eventType];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("eventType"));

  }
  configuration = self->_configuration;
  if (configuration)
  {
    -[ATXPBFaceGalleryConfiguration dictionaryRepresentation](configuration, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("configuration"));

  }
  if (-[NSMutableArray count](self->_items, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_items, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = self->_items;
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
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("items"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBFaceGalleryEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_configuration)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_items;
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

- (void)copyTo:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a2;
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 32) & 1) != 0)
    {
      *((_DWORD *)v8 + 4) = *(_DWORD *)(a1 + 16);
      *((_BYTE *)v8 + 32) |= 1u;
    }
    v3 = *(void **)(a1 + 8);
    if (v3)
      -[ATXPBFaceGalleryEvent setConfiguration:]((uint64_t)v8, v3);
    if (objc_msgSend(*(id *)(a1 + 24), "count"))
    {
      if (v8)
        objc_msgSend(*((id *)v8 + 3), "removeAllObjects");
      v4 = objc_msgSend(*(id *)(a1 + 24), "count");
      if (v4)
      {
        v5 = v4;
        for (i = 0; i != v5; ++i)
        {
          objc_msgSend(*(id *)(a1 + 24), "objectAtIndex:", i);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXPBFaceGalleryEvent addItems:]((uint64_t)v8, v7);

        }
      }
    }
  }

}

- (void)setConfiguration:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_eventType;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v7 = -[ATXPBFaceGalleryConfiguration copyWithZone:](self->_configuration, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = self->_items;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "copyWithZone:", a3, (_QWORD)v16);
        -[ATXPBFaceGalleryEvent addItems:]((uint64_t)v6, v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  ATXPBFaceGalleryConfiguration *configuration;
  NSMutableArray *items;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_eventType != *((_DWORD *)v4 + 4))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  configuration = self->_configuration;
  if ((unint64_t)configuration | *((_QWORD *)v4 + 1)
    && !-[ATXPBFaceGalleryConfiguration isEqual:](configuration, "isEqual:"))
  {
    goto LABEL_11;
  }
  items = self->_items;
  if ((unint64_t)items | *((_QWORD *)v4 + 3))
    v7 = -[NSMutableArray isEqual:](items, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_eventType;
  else
    v3 = 0;
  v4 = -[ATXPBFaceGalleryConfiguration hash](self->_configuration, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_items, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  id *v3;
  id *v4;
  id v5;
  id v6;
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
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (((_BYTE)v3[4] & 1) != 0)
    {
      *(_DWORD *)(a1 + 16) = *((_DWORD *)v3 + 4);
      *(_BYTE *)(a1 + 32) |= 1u;
    }
    v5 = v3[1];
    if (*(_QWORD *)(a1 + 8))
    {
      if (v5)
        -[ATXPBFaceGalleryConfiguration mergeFrom:](*(_QWORD *)(a1 + 8), v5);
    }
    else if (v5)
    {
      objc_storeStrong((id *)(a1 + 8), v5);
    }
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v4[3];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
          -[ATXPBFaceGalleryEvent addItems:](a1, *(void **)(*((_QWORD *)&v11 + 1) + 8 * i));
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (uint64_t)configuration
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (uint64_t)items
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (void)setItems:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
