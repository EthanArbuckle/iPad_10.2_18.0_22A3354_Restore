@implementation GEOLaneInfo

- (BOOL)supportsManeuver
{
  return self->_supportsManeuver;
}

- (void)setSupportsManeuver:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_supportsManeuver = a3;
}

- (void)setHasSupportsManeuver:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasSupportsManeuver
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)preferredForMultipleManeuvers
{
  return self->_preferredForMultipleManeuvers;
}

- (void)setPreferredForMultipleManeuvers:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_preferredForMultipleManeuvers = a3;
}

- (void)setHasPreferredForMultipleManeuvers:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasPreferredForMultipleManeuvers
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)hov
{
  return self->_hov;
}

- (void)setHov:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_hov = a3;
}

- (void)setHasHov:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasHov
{
  return *(_BYTE *)&self->_flags & 1;
}

- (NSMutableArray)arrows
{
  return self->_arrows;
}

- (void)setArrows:(id)a3
{
  objc_storeStrong((id *)&self->_arrows, a3);
}

- (void)clearArrows
{
  -[NSMutableArray removeAllObjects](self->_arrows, "removeAllObjects");
}

- (void)addArrow:(id)a3
{
  id v4;
  NSMutableArray *arrows;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  arrows = self->_arrows;
  v8 = v4;
  if (!arrows)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_arrows;
    self->_arrows = v6;

    v4 = v8;
    arrows = self->_arrows;
  }
  -[NSMutableArray addObject:](arrows, "addObject:", v4);

}

- (unint64_t)arrowsCount
{
  return -[NSMutableArray count](self->_arrows, "count");
}

- (id)arrowAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_arrows, "objectAtIndex:", a3);
}

+ (Class)arrowType
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
  v8.super_class = (Class)GEOLaneInfo;
  -[GEOLaneInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLaneInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLaneInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 28);
  if ((v5 & 4) == 0)
  {
    if ((*(_BYTE *)(a1 + 28) & 2) == 0)
      goto LABEL_4;
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 25));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v25 = CFSTR("preferredForMultipleManeuvers");
    else
      v25 = CFSTR("preferred_for_multiple_maneuvers");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

    if ((*(_BYTE *)(a1 + 28) & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 26));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v23 = CFSTR("supportsManeuver");
  else
    v23 = CFSTR("supports_maneuver");
  objc_msgSend(v4, "setObject:forKey:", v22, v23);

  v5 = *(_BYTE *)(a1 + 28);
  if ((v5 & 2) != 0)
    goto LABEL_27;
LABEL_4:
  if ((v5 & 1) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 24));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("hov"));

  }
LABEL_6:
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v8 = *(id *)(a1 + 16);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("arrow"));
  }
  v15 = *(void **)(a1 + 8);
  if (v15)
  {
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __41__GEOLaneInfo__dictionaryRepresentation___block_invoke;
      v26[3] = &unk_1E1C00600;
      v19 = v18;
      v27 = v19;
      objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v26);
      v20 = v19;

      v17 = v20;
    }
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLaneInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __41__GEOLaneInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOLaneInfo)initWithDictionary:(id)a3
{
  return (GEOLaneInfo *)-[GEOLaneInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  GEOLaneArrowhead *v18;
  uint64_t v19;
  void *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("supportsManeuver");
      else
        v6 = CFSTR("supports_maneuver");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSupportsManeuver:", objc_msgSend(v7, "BOOLValue"));

      if (a3)
        v8 = CFSTR("preferredForMultipleManeuvers");
      else
        v8 = CFSTR("preferred_for_multiple_maneuvers");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setPreferredForMultipleManeuvers:", objc_msgSend(v9, "BOOLValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hov"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHov:", objc_msgSend(v10, "BOOLValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("arrow"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v22 = v11;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v24 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v18 = [GEOLaneArrowhead alloc];
                if ((a3 & 1) != 0)
                  v19 = -[GEOLaneArrowhead initWithJSON:](v18, "initWithJSON:", v17);
                else
                  v19 = -[GEOLaneArrowhead initWithDictionary:](v18, "initWithDictionary:", v17);
                v20 = (void *)v19;
                objc_msgSend(a1, "addArrow:", v19);

              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          }
          while (v14);
        }

        v11 = v22;
      }

    }
  }

  return a1;
}

- (GEOLaneInfo)initWithJSON:(id)a3
{
  return (GEOLaneInfo *)-[GEOLaneInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLaneInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLaneInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
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
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
LABEL_4:
    PBDataWriterWriteBOOLField();
LABEL_5:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_arrows;
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
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v11);
}

- (void)copyTo:(id)a3
{
  char flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  _BYTE *v9;

  v9 = a3;
  -[GEOLaneInfo readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_11:
    v9[25] = self->_preferredForMultipleManeuvers;
    v9[28] |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v9[26] = self->_supportsManeuver;
  v9[28] |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_11;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    v9[24] = self->_hov;
    v9[28] |= 1u;
  }
LABEL_5:
  if (-[GEOLaneInfo arrowsCount](self, "arrowsCount"))
  {
    objc_msgSend(v9, "clearArrows");
    v5 = -[GEOLaneInfo arrowsCount](self, "arrowsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOLaneInfo arrowAtIndex:](self, "arrowAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addArrow:", v8);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  id *v6;
  char flags;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_BYTE *)v5 + 26) = self->_supportsManeuver;
    *((_BYTE *)v5 + 28) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)v5 + 25) = self->_preferredForMultipleManeuvers;
  *((_BYTE *)v5 + 28) |= 2u;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
LABEL_4:
    *((_BYTE *)v5 + 24) = self->_hov;
    *((_BYTE *)v5 + 28) |= 1u;
  }
LABEL_5:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_arrows;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend(v6, "addArrow:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  objc_storeStrong(v6 + 1, self->_unknownFields);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  NSMutableArray *arrows;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[GEOLaneInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0)
      goto LABEL_22;
    if (self->_supportsManeuver)
    {
      if (!*((_BYTE *)v4 + 26))
        goto LABEL_22;
    }
    else if (*((_BYTE *)v4 + 26))
    {
      goto LABEL_22;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0)
      goto LABEL_22;
    if (self->_preferredForMultipleManeuvers)
    {
      if (!*((_BYTE *)v4 + 25))
        goto LABEL_22;
    }
    else if (*((_BYTE *)v4 + 25))
    {
      goto LABEL_22;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0)
      goto LABEL_28;
LABEL_22:
    v5 = 0;
    goto LABEL_23;
  }
  if ((*((_BYTE *)v4 + 28) & 1) == 0)
    goto LABEL_22;
  if (!self->_hov)
  {
    if (!*((_BYTE *)v4 + 24))
      goto LABEL_28;
    goto LABEL_22;
  }
  if (!*((_BYTE *)v4 + 24))
    goto LABEL_22;
LABEL_28:
  arrows = self->_arrows;
  if ((unint64_t)arrows | *((_QWORD *)v4 + 2))
    v5 = -[NSMutableArray isEqual:](arrows, "isEqual:");
  else
    v5 = 1;
LABEL_23:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOLaneInfo readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    return v4 ^ v3 ^ v5 ^ -[NSMutableArray hash](self->_arrows, "hash");
  }
  v3 = 2654435761 * self->_supportsManeuver;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_preferredForMultipleManeuvers;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_hov;
  return v4 ^ v3 ^ v5 ^ -[NSMutableArray hash](self->_arrows, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
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
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 4) != 0)
  {
    self->_supportsManeuver = *((_BYTE *)v4 + 26);
    *(_BYTE *)&self->_flags |= 4u;
    v5 = *((_BYTE *)v4 + 28);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_preferredForMultipleManeuvers = *((_BYTE *)v4 + 25);
  *(_BYTE *)&self->_flags |= 2u;
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_4:
    self->_hov = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_5:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 2);
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
        -[GEOLaneInfo addArrow:](self, "addArrow:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  PBUnknownFields *unknownFields;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOLaneInfo readAll:](self, "readAll:", 0);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_arrows;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "clearUnknownFields:", 1, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrows, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
