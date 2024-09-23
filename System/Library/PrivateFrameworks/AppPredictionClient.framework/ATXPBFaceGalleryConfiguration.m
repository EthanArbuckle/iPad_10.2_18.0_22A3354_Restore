@implementation ATXPBFaceGalleryConfiguration

- (uint64_t)clearSections
{
  if (result)
    return objc_msgSend(*(id *)(result + 8), "removeAllObjects");
  return result;
}

- (void)addSections:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v5;

      v4 = *(void **)(a1 + 8);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)sectionsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 8), "count");
  return result;
}

- (id)sectionsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[1], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (uint64_t)sectionsType
{
  objc_opt_self();
  return objc_opt_class();
}

- (uint64_t)source
{
  if (result)
  {
    if ((*(_BYTE *)(result + 20) & 1) != 0)
      return *(unsigned int *)(result + 16);
    else
      return 0;
  }
  return result;
}

- (uint64_t)setSource:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 20) |= 1u;
    *(_DWORD *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setHasSource:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 20) = *(_BYTE *)(result + 20) & 0xFE | a2;
  return result;
}

- (uint64_t)hasSource
{
  if (result)
    return *(_BYTE *)(result + 20) & 1;
  return result;
}

- (__CFString)sourceAsString:(__CFString *)a1
{
  if (a1)
  {
    if (!(_DWORD)a2)
      return CFSTR("Unknown");
    if ((_DWORD)a2 == 1)
    {
      a1 = CFSTR("Proactive");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  return a1;
}

- (uint64_t)StringAsSource:(uint64_t)a1
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
      a1 = 0;
    else
      a1 = objc_msgSend(v4, "isEqualToString:", CFSTR("Proactive"));
  }

  return a1;
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
  v8.super_class = (Class)ATXPBFaceGalleryConfiguration;
  -[ATXPBFaceGalleryConfiguration description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBFaceGalleryConfiguration dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int source;
  __CFString *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_sections, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_sections, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = self->_sections;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("sections"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    source = self->_source;
    if (source)
    {
      if (source == 1)
      {
        v12 = CFSTR("Proactive");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_source);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v12 = CFSTR("Unknown");
    }
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("source"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBFaceGalleryConfigurationReadFrom((uint64_t)self, (uint64_t)a3);
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
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_sections;
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

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(uint64_t)a1
{
  id *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id *v8;

  v3 = a2;
  if (a1)
  {
    v8 = v3;
    if (objc_msgSend(*(id *)(a1 + 8), "count"))
    {
      if (v8)
        objc_msgSend(v8[1], "removeAllObjects");
      v4 = objc_msgSend(*(id *)(a1 + 8), "count");
      if (v4)
      {
        v5 = v4;
        for (i = 0; i != v5; ++i)
        {
          objc_msgSend(*(id *)(a1 + 8), "objectAtIndex:", i);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXPBFaceGalleryConfiguration addSections:]((uint64_t)v8, v7);

        }
      }
    }
    v3 = v8;
    if ((*(_BYTE *)(a1 + 20) & 1) != 0)
    {
      *((_DWORD *)v8 + 4) = *(_DWORD *)(a1 + 16);
      *((_BYTE *)v8 + 20) |= 1u;
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_sections;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v13);
        -[ATXPBFaceGalleryConfiguration addSections:](v5, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_source;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *sections;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  sections = self->_sections;
  if ((unint64_t)sections | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](sections, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0 && self->_source == *((_DWORD *)v4 + 4))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSMutableArray hash](self->_sections, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_source;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(uint64_t)a1
{
  id *v3;
  id *v4;
  id v5;
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
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v3[1];
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
          -[ATXPBFaceGalleryConfiguration addSections:](a1, *(void **)(*((_QWORD *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    if ((*((_BYTE *)v4 + 20) & 1) != 0)
    {
      *(_DWORD *)(a1 + 16) = *((_DWORD *)v4 + 4);
      *(_BYTE *)(a1 + 20) |= 1u;
    }
  }

}

- (uint64_t)sections
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (void)setSections:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
