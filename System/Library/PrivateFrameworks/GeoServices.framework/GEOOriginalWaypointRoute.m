@implementation GEOOriginalWaypointRoute

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_identifier = a3;
}

- (void)setHasIdentifier:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIdentifier
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (NSMutableArray)routeLegs
{
  return self->_routeLegs;
}

- (void)setRouteLegs:(id)a3
{
  objc_storeStrong((id *)&self->_routeLegs, a3);
}

- (void)clearRouteLegs
{
  -[NSMutableArray removeAllObjects](self->_routeLegs, "removeAllObjects");
}

- (void)addRouteLeg:(id)a3
{
  id v4;
  NSMutableArray *routeLegs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  routeLegs = self->_routeLegs;
  v8 = v4;
  if (!routeLegs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_routeLegs;
    self->_routeLegs = v6;

    v4 = v8;
    routeLegs = self->_routeLegs;
  }
  -[NSMutableArray addObject:](routeLegs, "addObject:", v4);

}

- (unint64_t)routeLegsCount
{
  return -[NSMutableArray count](self->_routeLegs, "count");
}

- (id)routeLegAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_routeLegs, "objectAtIndex:", a3);
}

+ (Class)routeLegType
{
  return (Class)objc_opt_class();
}

- (int)purpose
{
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    return self->_purpose;
  else
    return 1;
}

- (void)setPurpose:(int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_purpose = a3;
}

- (void)setHasPurpose:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasPurpose
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)purposeAsString:(int)a3
{
  if (a3 < 0xE)
    return off_1E1C08308[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPurpose:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PURPOSE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REROUTING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REROUTING_ONTO_ORIGINAL_ROUTE")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTE_FROM_ZILCH_POINTS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BIASED_DIRECTIONS_TO_POI")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BIASED_DIRECTIONS_FROM_POI")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHANGE_WAYPOINTS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHANGE_ANCHORS")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESUME_ROUTE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHANGE_TRANSPORT_MODE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESUME_NAV_AFTER_PAUSE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFFLINE_TO_ONLINE_NAV_TRANSITION")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFFLINE_TO_ONLINE_NEW_ROUTE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CONVERT_TO_NAVIGABLE_ROUTE")))
  {
    v4 = 12;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)source
{
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    return self->_source;
  else
    return 0;
}

- (void)setSource:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasSource
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (id)sourceAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C08378[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ONLINE_SERVICE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("OFFLINE_SERVICE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)lastValidUserOffsetCm
{
  return self->_lastValidUserOffsetCm;
}

- (void)setLastValidUserOffsetCm:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_lastValidUserOffsetCm = a3;
}

- (void)setHasLastValidUserOffsetCm:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasLastValidUserOffsetCm
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (int)creationMethod
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_creationMethod;
  else
    return 0;
}

- (void)setCreationMethod:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_creationMethod = a3;
}

- (void)setHasCreationMethod:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCreationMethod
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)creationMethodAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C08390[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCreationMethod:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTE_CREATION_METHOD_DEFAULT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTE_CREATION_METHOD_USER_CREATED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTE_CREATION_METHOD_APPLE_CURATED")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)GEOOriginalWaypointRoute;
  -[GEOOriginalWaypointRoute description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOOriginalWaypointRoute dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOOriginalWaypointRoute _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  const __CFString *v14;
  char v15;
  uint64_t v16;
  __CFString *v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  __CFString *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 44) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 28));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("identifier"));

  }
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v7 = *(id *)(a1 + 16);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v35 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v12, "jsonRepresentation");
          else
            objc_msgSend(v12, "dictionaryRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v9);
    }

    if (a2)
      v14 = CFSTR("routeLeg");
    else
      v14 = CFSTR("route_leg");
    objc_msgSend(v4, "setObject:forKey:", v6, v14);

  }
  v15 = *(_BYTE *)(a1 + 44);
  if ((v15 & 8) != 0)
  {
    v16 = *(int *)(a1 + 36);
    if (v16 >= 0xE)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 36));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E1C08308[v16];
    }
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("purpose"));

    v15 = *(_BYTE *)(a1 + 44);
    if ((v15 & 0x10) == 0)
    {
LABEL_21:
      if ((v15 & 4) == 0)
        goto LABEL_22;
LABEL_32:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 32));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v21 = CFSTR("lastValidUserOffsetCm");
      else
        v21 = CFSTR("last_valid_user_offset_cm");
      objc_msgSend(v4, "setObject:forKey:", v20, v21);

      if ((*(_BYTE *)(a1 + 44) & 1) == 0)
        goto LABEL_43;
      goto LABEL_36;
    }
  }
  else if ((*(_BYTE *)(a1 + 44) & 0x10) == 0)
  {
    goto LABEL_21;
  }
  v18 = *(int *)(a1 + 40);
  if (v18 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 40));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = off_1E1C08378[v18];
  }
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("source"));

  v15 = *(_BYTE *)(a1 + 44);
  if ((v15 & 4) != 0)
    goto LABEL_32;
LABEL_22:
  if ((v15 & 1) != 0)
  {
LABEL_36:
    v22 = *(int *)(a1 + 24);
    if (v22 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 24));
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_1E1C08390[v22];
    }
    if (a2)
      v24 = CFSTR("creationMethod");
    else
      v24 = CFSTR("creation_method");
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

  }
LABEL_43:
  v25 = *(void **)(a1 + 8);
  if (v25)
  {
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v26, "count"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __54__GEOOriginalWaypointRoute__dictionaryRepresentation___block_invoke;
      v32[3] = &unk_1E1C00600;
      v29 = v28;
      v33 = v29;
      objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v32);
      v30 = v29;

      v27 = v30;
    }
    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOOriginalWaypointRoute _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEOOriginalWaypointRoute__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOOriginalWaypointRoute)initWithDictionary:(id)a3
{
  return (GEOOriginalWaypointRoute *)-[GEOOriginalWaypointRoute _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  GEOOriginalRouteLeg *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIdentifier:", objc_msgSend(v6, "unsignedIntValue"));

      if (a3)
        v7 = CFSTR("routeLeg");
      else
        v7 = CFSTR("route_leg");
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = v5;
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v33 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v15 = [GEOOriginalRouteLeg alloc];
                if ((a3 & 1) != 0)
                  v16 = -[GEOOriginalRouteLeg initWithJSON:](v15, "initWithJSON:", v14);
                else
                  v16 = -[GEOOriginalRouteLeg initWithDictionary:](v15, "initWithDictionary:", v14);
                v17 = (void *)v16;
                objc_msgSend(a1, "addRouteLeg:", v16);

              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          }
          while (v11);
        }

        v5 = v31;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("purpose"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = v18;
        if ((objc_msgSend(v19, "isEqualToString:", CFSTR("PURPOSE_UNKNOWN")) & 1) != 0)
        {
          v20 = 0;
        }
        else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("REROUTING")) & 1) != 0)
        {
          v20 = 1;
        }
        else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("REROUTING_ONTO_ORIGINAL_ROUTE")) & 1) != 0)
        {
          v20 = 13;
        }
        else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("ROUTE_FROM_ZILCH_POINTS")) & 1) != 0)
        {
          v20 = 2;
        }
        else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("BIASED_DIRECTIONS_TO_POI")) & 1) != 0)
        {
          v20 = 3;
        }
        else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("BIASED_DIRECTIONS_FROM_POI")) & 1) != 0)
        {
          v20 = 4;
        }
        else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("CHANGE_WAYPOINTS")) & 1) != 0)
        {
          v20 = 5;
        }
        else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("CHANGE_ANCHORS")) & 1) != 0)
        {
          v20 = 11;
        }
        else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("RESUME_ROUTE")) & 1) != 0)
        {
          v20 = 6;
        }
        else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("CHANGE_TRANSPORT_MODE")) & 1) != 0)
        {
          v20 = 7;
        }
        else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("RESUME_NAV_AFTER_PAUSE")) & 1) != 0)
        {
          v20 = 8;
        }
        else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("OFFLINE_TO_ONLINE_NAV_TRANSITION")) & 1) != 0)
        {
          v20 = 9;
        }
        else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("OFFLINE_TO_ONLINE_NEW_ROUTE")) & 1) != 0)
        {
          v20 = 10;
        }
        else if (objc_msgSend(v19, "isEqualToString:", CFSTR("CONVERT_TO_NAVIGABLE_ROUTE")))
        {
          v20 = 12;
        }
        else
        {
          v20 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_56;
        v20 = objc_msgSend(v18, "intValue");
      }
      objc_msgSend(a1, "setPurpose:", v20);
LABEL_56:

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("source"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = v21;
        if ((objc_msgSend(v22, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
        {
          v23 = 0;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("ONLINE_SERVICE")) & 1) != 0)
        {
          v23 = 1;
        }
        else if (objc_msgSend(v22, "isEqualToString:", CFSTR("OFFLINE_SERVICE")))
        {
          v23 = 2;
        }
        else
        {
          v23 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_68;
        v23 = objc_msgSend(v21, "intValue");
      }
      objc_msgSend(a1, "setSource:", v23);
LABEL_68:

      if (a3)
        v24 = CFSTR("lastValidUserOffsetCm");
      else
        v24 = CFSTR("last_valid_user_offset_cm");
      objc_msgSend(v5, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLastValidUserOffsetCm:", objc_msgSend(v25, "unsignedIntValue"));

      if (a3)
        v26 = CFSTR("creationMethod");
      else
        v26 = CFSTR("creation_method");
      objc_msgSend(v5, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = v27;
        if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ROUTE_CREATION_METHOD_DEFAULT")) & 1) != 0)
        {
          v29 = 0;
        }
        else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ROUTE_CREATION_METHOD_USER_CREATED")) & 1) != 0)
        {
          v29 = 1;
        }
        else if (objc_msgSend(v28, "isEqualToString:", CFSTR("ROUTE_CREATION_METHOD_APPLE_CURATED")))
        {
          v29 = 2;
        }
        else
        {
          v29 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_88:

          goto LABEL_89;
        }
        v29 = objc_msgSend(v27, "intValue");
      }
      objc_msgSend(a1, "setCreationMethod:", v29);
      goto LABEL_88;
    }
  }
LABEL_89:

  return a1;
}

- (GEOOriginalWaypointRoute)initWithJSON:(id)a3
{
  return (GEOOriginalWaypointRoute *)-[GEOOriginalWaypointRoute _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOOriginalWaypointRouteIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOOriginalWaypointRouteReadAllFrom((uint64_t)self, a3, 0);
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
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    PBDataWriterWriteUint32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_routeLegs;
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
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_12:
      if ((flags & 4) == 0)
        goto LABEL_13;
LABEL_18:
      PBDataWriterWriteUint32Field();
      if ((*(_BYTE *)&self->_flags & 1) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteInt32Field();
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_18;
LABEL_13:
  if ((flags & 1) != 0)
LABEL_14:
    PBDataWriterWriteInt32Field();
LABEL_15:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v11);

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_routeLegs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v11) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char flags;
  _DWORD *v9;

  v9 = a3;
  -[GEOOriginalWaypointRoute readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v9[7] = self->_identifier;
    *((_BYTE *)v9 + 44) |= 2u;
  }
  if (-[GEOOriginalWaypointRoute routeLegsCount](self, "routeLegsCount"))
  {
    objc_msgSend(v9, "clearRouteLegs");
    v4 = -[GEOOriginalWaypointRoute routeLegsCount](self, "routeLegsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOOriginalWaypointRoute routeLegAtIndex:](self, "routeLegAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addRouteLeg:", v7);

      }
    }
  }
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    v9[9] = self->_purpose;
    *((_BYTE *)v9 + 44) |= 8u;
    flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_9:
      if ((flags & 4) == 0)
        goto LABEL_10;
LABEL_15:
      v9[8] = self->_lastValidUserOffsetCm;
      *((_BYTE *)v9 + 44) |= 4u;
      if ((*(_BYTE *)&self->_flags & 1) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_9;
  }
  v9[10] = self->_source;
  *((_BYTE *)v9 + 44) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_15;
LABEL_10:
  if ((flags & 1) != 0)
  {
LABEL_11:
    v9[6] = self->_creationMethod;
    *((_BYTE *)v9 + 44) |= 1u;
  }
LABEL_12:

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
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_identifier;
    *(_BYTE *)(v5 + 44) |= 2u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_routeLegs;
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
        objc_msgSend((id)v6, "addRouteLeg:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v6 + 36) = self->_purpose;
    *(_BYTE *)(v6 + 44) |= 8u;
    flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_12:
      if ((flags & 4) == 0)
        goto LABEL_13;
LABEL_18:
      *(_DWORD *)(v6 + 32) = self->_lastValidUserOffsetCm;
      *(_BYTE *)(v6 + 44) |= 4u;
      if ((*(_BYTE *)&self->_flags & 1) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_12;
  }
  *(_DWORD *)(v6 + 40) = self->_source;
  *(_BYTE *)(v6 + 44) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_18;
LABEL_13:
  if ((flags & 1) != 0)
  {
LABEL_14:
    *(_DWORD *)(v6 + 24) = self->_creationMethod;
    *(_BYTE *)(v6 + 44) |= 1u;
  }
LABEL_15:
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSMutableArray *routeLegs;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  -[GEOOriginalWaypointRoute readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 44);
  if ((flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_identifier != *((_DWORD *)v4 + 7))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_29;
  }
  routeLegs = self->_routeLegs;
  if ((unint64_t)routeLegs | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](routeLegs, "isEqual:"))
    {
LABEL_29:
      v8 = 0;
      goto LABEL_30;
    }
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 44);
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_purpose != *((_DWORD *)v4 + 9))
      goto LABEL_29;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_source != *((_DWORD *)v4 + 10))
      goto LABEL_29;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_29;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_lastValidUserOffsetCm != *((_DWORD *)v4 + 8))
      goto LABEL_29;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_29;
  }
  v8 = (v6 & 1) == 0;
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_creationMethod != *((_DWORD *)v4 + 6))
      goto LABEL_29;
    v8 = 1;
  }
LABEL_30:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  -[GEOOriginalWaypointRoute readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v3 = 2654435761 * self->_identifier;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_routeLegs, "hash");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v5 = 2654435761 * self->_purpose;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    {
LABEL_6:
      v6 = 2654435761 * self->_source;
      if ((*(_BYTE *)&self->_flags & 4) != 0)
        goto LABEL_7;
LABEL_11:
      v7 = 0;
      if ((*(_BYTE *)&self->_flags & 1) != 0)
        goto LABEL_8;
LABEL_12:
      v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
      goto LABEL_6;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_11;
LABEL_7:
  v7 = 2654435761 * self->_lastValidUserOffsetCm;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_12;
LABEL_8:
  v8 = 2654435761 * self->_creationMethod;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    self->_identifier = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_flags |= 2u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *((id *)v4 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        -[GEOOriginalWaypointRoute addRouteLeg:](self, "addRouteLeg:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10 = *((_BYTE *)v4 + 44);
  if ((v10 & 8) != 0)
  {
    self->_purpose = *((_DWORD *)v4 + 9);
    *(_BYTE *)&self->_flags |= 8u;
    v10 = *((_BYTE *)v4 + 44);
    if ((v10 & 0x10) == 0)
    {
LABEL_12:
      if ((v10 & 4) == 0)
        goto LABEL_13;
LABEL_18:
      self->_lastValidUserOffsetCm = *((_DWORD *)v4 + 8);
      *(_BYTE *)&self->_flags |= 4u;
      if ((*((_BYTE *)v4 + 44) & 1) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 0x10) == 0)
  {
    goto LABEL_12;
  }
  self->_source = *((_DWORD *)v4 + 10);
  *(_BYTE *)&self->_flags |= 0x10u;
  v10 = *((_BYTE *)v4 + 44);
  if ((v10 & 4) != 0)
    goto LABEL_18;
LABEL_13:
  if ((v10 & 1) != 0)
  {
LABEL_14:
    self->_creationMethod = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_15:

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
    -[GEOOriginalWaypointRoute readAll:](self, "readAll:", 0);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_routeLegs;
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
  objc_storeStrong((id *)&self->_routeLegs, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
