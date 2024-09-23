@implementation GEOPDTemplatePlaceModuleConfiguration

- (id)sectionTitle
{
  void *v2;
  void *v3;

  -[GEOPDTemplatePlaceModuleConfiguration sectionTitles]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOLocalizedString bestStringForCurrentLocale:fallbackToFirstAvailable:](GEOLocalizedString, "bestStringForCurrentLocale:fallbackToFirstAvailable:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = *(id *)(a1 + 16);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "clearUnknownFields:", 1, (_QWORD)v8);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (id)sectionTitles
{
  if (a1)
    a1 = (id *)a1[2];
  return a1;
}

- (void)addSectionTitle:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

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
  v8.super_class = (Class)GEOPDTemplatePlaceModuleConfiguration;
  -[GEOPDTemplatePlaceModuleConfiguration description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDTemplatePlaceModuleConfiguration dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTemplatePlaceModuleConfiguration _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  const __CFString *v15;
  char v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  __CFString *v20;
  uint64_t v21;
  __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 40) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 36));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("templatePlaceComponentId");
    else
      v6 = CFSTR("template_place_component_id");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v8 = *(id *)(a1 + 16);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v34 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v10);
    }

    if (a2)
      v15 = CFSTR("sectionTitle");
    else
      v15 = CFSTR("section_title");
    objc_msgSend(v4, "setObject:forKey:", v7, v15);

  }
  v16 = *(_BYTE *)(a1 + 40);
  if ((v16 & 2) == 0)
  {
    if ((*(_BYTE *)(a1 + 40) & 4) == 0)
      goto LABEL_24;
LABEL_30:
    v19 = *(int *)(a1 + 32);
    if (v19 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 32));
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E1C0C398[v19];
    }
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("orientation"));

    if ((*(_BYTE *)(a1 + 40) & 1) == 0)
      goto LABEL_41;
    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 28));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v18 = CFSTR("numberOfRows");
  else
    v18 = CFSTR("number_of_rows");
  objc_msgSend(v4, "setObject:forKey:", v17, v18);

  v16 = *(_BYTE *)(a1 + 40);
  if ((v16 & 4) != 0)
    goto LABEL_30;
LABEL_24:
  if ((v16 & 1) != 0)
  {
LABEL_34:
    v21 = *(int *)(a1 + 24);
    if (v21 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 24));
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_1E1C0C3B0[v21];
    }
    if (a2)
      v23 = CFSTR("layoutType");
    else
      v23 = CFSTR("layout_type");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
LABEL_41:
  v24 = *(void **)(a1 + 8);
  if (v24)
  {
    objc_msgSend(v24, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v25, "count"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __67__GEOPDTemplatePlaceModuleConfiguration__dictionaryRepresentation___block_invoke;
      v31[3] = &unk_1E1C00600;
      v28 = v27;
      v32 = v28;
      objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v31);
      v29 = v28;

      v26 = v29;
    }
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDTemplatePlaceModuleConfiguration _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __67__GEOPDTemplatePlaceModuleConfiguration__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  GEOLocalizedString *v18;
  GEOLocalizedString *v19;
  GEOLocalizedString *v20;
  const __CFString *v21;
  void *v22;
  int v23;
  void *v24;
  id v25;
  int v26;
  const __CFString *v27;
  void *v28;
  id v29;
  int v30;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("templatePlaceComponentId");
    else
      v7 = CFSTR("template_place_component_id");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_msgSend(v8, "intValue");
      *(_BYTE *)(v6 + 40) |= 8u;
      *(_DWORD *)(v6 + 36) = v9;
    }

    if (a3)
      v10 = CFSTR("sectionTitle");
    else
      v10 = CFSTR("section_title");
    objc_msgSend(v5, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = v5;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v34 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v18 = [GEOLocalizedString alloc];
              if ((a3 & 1) != 0)
                v19 = -[GEOLocalizedString initWithJSON:](v18, "initWithJSON:", v17);
              else
                v19 = -[GEOLocalizedString initWithDictionary:](v18, "initWithDictionary:", v17);
              v20 = v19;
              -[GEOPDTemplatePlaceModuleConfiguration addSectionTitle:](v6, v19);

            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v14);
      }

      v5 = v32;
    }

    if (a3)
      v21 = CFSTR("numberOfRows");
    else
      v21 = CFSTR("number_of_rows");
    objc_msgSend(v5, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = objc_msgSend(v22, "intValue");
      *(_BYTE *)(v6 + 40) |= 2u;
      *(_DWORD *)(v6 + 28) = v23;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("orientation"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = v24;
      if ((objc_msgSend(v25, "isEqualToString:", CFSTR("ORIENTATION_UNKNOWN")) & 1) != 0)
      {
        v26 = 0;
      }
      else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("ORIENTATION_HORIZONTAL")) & 1) != 0)
      {
        v26 = 1;
      }
      else if (objc_msgSend(v25, "isEqualToString:", CFSTR("ORIENTATION_VERTICAL")))
      {
        v26 = 2;
      }
      else
      {
        v26 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_41;
      v26 = objc_msgSend(v24, "intValue");
    }
    *(_BYTE *)(v6 + 40) |= 4u;
    *(_DWORD *)(v6 + 32) = v26;
LABEL_41:

    if (a3)
      v27 = CFSTR("layoutType");
    else
      v27 = CFSTR("layout_type");
    objc_msgSend(v5, "objectForKeyedSubscript:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = v28;
      if ((objc_msgSend(v29, "isEqualToString:", CFSTR("LAYOUT_TYPE_UNKNOWN")) & 1) != 0)
      {
        v30 = 0;
      }
      else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("LAYOUT_TYPE_IMAGE_TEXT")) & 1) != 0)
      {
        v30 = 1;
      }
      else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("LAYOUT_TYPE_IMAGE_ICON_TEXT")) & 1) != 0)
      {
        v30 = 2;
      }
      else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("LAYOUT_TYPE_ICON_TEXT")) & 1) != 0)
      {
        v30 = 3;
      }
      else if (objc_msgSend(v29, "isEqualToString:", CFSTR("LAYOUT_TYPE_TEXT_ONLY")))
      {
        v30 = 4;
      }
      else
      {
        v30 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_60:

        goto LABEL_61;
      }
      v30 = objc_msgSend(v28, "intValue");
    }
    *(_BYTE *)(v6 + 40) |= 1u;
    *(_DWORD *)(v6 + 24) = v30;
    goto LABEL_60;
  }
LABEL_61:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDTemplatePlaceModuleConfigurationReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char flags;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    PBDataWriterWriteInt32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_sectionTitles;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_12;
LABEL_16:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
  PBDataWriterWriteInt32Field();
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_16;
LABEL_12:
  if ((flags & 1) != 0)
LABEL_13:
    PBDataWriterWriteInt32Field();
LABEL_14:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v11);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char flags;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_templatePlaceComponentId;
    *(_BYTE *)(v5 + 40) |= 8u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_sectionTitles;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v15);
        -[GEOPDTemplatePlaceModuleConfiguration addSectionTitle:](v6, v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_12;
LABEL_16:
    *(_DWORD *)(v6 + 32) = self->_orientation;
    *(_BYTE *)(v6 + 40) |= 4u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
  *(_DWORD *)(v6 + 28) = self->_numberOfRows;
  *(_BYTE *)(v6 + 40) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_16;
LABEL_12:
  if ((flags & 1) != 0)
  {
LABEL_13:
    *(_DWORD *)(v6 + 24) = self->_layoutType;
    *(_BYTE *)(v6 + 40) |= 1u;
  }
LABEL_14:
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSMutableArray *sectionTitles;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 40);
  if ((flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) == 0 || self->_templatePlaceComponentId != *((_DWORD *)v4 + 9))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 40) & 8) != 0)
  {
    goto LABEL_24;
  }
  sectionTitles = self->_sectionTitles;
  if ((unint64_t)sectionTitles | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](sectionTitles, "isEqual:"))
    {
LABEL_24:
      v8 = 0;
      goto LABEL_25;
    }
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 40);
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_numberOfRows != *((_DWORD *)v4 + 7))
      goto LABEL_24;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_orientation != *((_DWORD *)v4 + 8))
      goto LABEL_24;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_24;
  }
  v8 = (v6 & 1) == 0;
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_layoutType != *((_DWORD *)v4 + 6))
      goto LABEL_24;
    v8 = 1;
  }
LABEL_25:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_flags & 8) != 0)
    v3 = 2654435761 * self->_templatePlaceComponentId;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_sectionTitles, "hash");
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_6;
LABEL_9:
    v6 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_7;
LABEL_10:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v5 = 2654435761 * self->_numberOfRows;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_9;
LABEL_6:
  v6 = 2654435761 * self->_orientation;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_10;
LABEL_7:
  v7 = 2654435761 * self->_layoutType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionTitles, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
