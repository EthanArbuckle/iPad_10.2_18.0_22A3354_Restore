@implementation GEOResourceFilter

- (unint64_t)scalesCount
{
  -[GEOResourceFilter _readScales]((uint64_t)self);
  return self->_scales.count;
}

- (void)_readScales
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourceFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readScales_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (unint64_t)scenariosCount
{
  -[GEOResourceFilter _readScenarios]((uint64_t)self);
  return self->_scenarios.count;
}

- (int)scaleAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_scales;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOResourceFilter _readScales]((uint64_t)self);
  p_scales = &self->_scales;
  count = self->_scales.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_scales->list[a3];
}

- (void)_readScenarios
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourceFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readScenarios_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEOResourceFilter readAll:](self, "readAll:", 1),
        objc_msgSend(v4, "readAll:", 1),
        PBRepeatedInt32IsEqual()))
  {
    IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_580;
    else
      v8 = (int *)&readAll__nonRecursiveTag_581;
    GEOResourceFilterReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

- (GEOResourceFilter)init
{
  GEOResourceFilter *v2;
  GEOResourceFilter *v3;
  GEOResourceFilter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOResourceFilter;
  v2 = -[GEOResourceFilter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOResourceFilter;
  -[GEOResourceFilter dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  PBDataReader *reader;
  PBDataReader *v6;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v6 = reader;
  objc_sync_enter(v6);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v6);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOResourceFilter readAll:](self, "readAll:", 0);
    PBRepeatedInt32Copy();
    PBRepeatedInt32Copy();
    objc_storeStrong(v4 + 2, self->_unknownFields);
    return v4;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOResourceFilterReadAllFrom((uint64_t)v4, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v6);

  return v4;
}

- (GEOResourceFilter)initWithData:(id)a3
{
  GEOResourceFilter *v3;
  GEOResourceFilter *v4;
  GEOResourceFilter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOResourceFilter;
  v3 = -[GEOResourceFilter initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)scales
{
  -[GEOResourceFilter _readScales]((uint64_t)self);
  return self->_scales.list;
}

- (void)clearScales
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  PBRepeatedInt32Clear();
}

- (void)addScale:(int)a3
{
  -[GEOResourceFilter _readScales]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (void)setScales:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  PBRepeatedInt32Set();
}

- (id)scalesAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C060D0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsScales:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCALE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCALE_1X")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCALE_2X")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCALE_3X")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)scenarios
{
  -[GEOResourceFilter _readScenarios]((uint64_t)self);
  return self->_scenarios.list;
}

- (void)clearScenarios
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  PBRepeatedInt32Clear();
}

- (void)addScenario:(int)a3
{
  -[GEOResourceFilter _readScenarios]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (int)scenarioAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_scenarios;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOResourceFilter _readScenarios]((uint64_t)self);
  p_scenarios = &self->_scenarios;
  count = self->_scenarios.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_scenarios->list[a3];
}

- (void)setScenarios:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  PBRepeatedInt32Set();
}

- (id)scenariosAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C060F0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsScenarios:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCENARIO_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCENARIO_CARPLAY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCENARIO_NAVIGATION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCENARIO_HIGHVISIBILITY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCENARIO_EXPLICIT")))
  {
    v4 = 4;
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
  v8.super_class = (Class)GEOResourceFilter;
  -[GEOResourceFilter description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOResourceFilter dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOResourceFilter _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  int v5;
  void *v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[4])
  {
    v5 = a2;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1 + 3;
    if (a1[4])
    {
      v8 = 0;
      do
      {
        v9 = *(int *)(*v7 + 4 * v8);
        if (v9 >= 4)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v9);
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = off_1E1C060D0[v9];
        }
        objc_msgSend(v6, "addObject:", v10);

        ++v8;
        v7 = a1 + 3;
      }
      while (v8 < a1[4]);
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("scale"));

    a2 = v5;
  }
  if (a1[7])
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = a1 + 6;
    if (a1[7])
    {
      v13 = 0;
      do
      {
        v14 = *(int *)(*v12 + 4 * v13);
        if (v14 >= 5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = off_1E1C060F0[v14];
        }
        objc_msgSend(v11, "addObject:", v15);

        ++v13;
        v12 = a1 + 6;
      }
      while (v13 < a1[7]);
    }
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("scenario"));

  }
  v16 = (void *)a1[2];
  if (v16)
  {
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __47__GEOResourceFilter__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E1C00600;
      v20 = v19;
      v24 = v20;
      objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v23);
      v21 = v20;

      v18 = v21;
    }
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOResourceFilter _dictionaryRepresentation:](self, 1);
}

void __47__GEOResourceFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOResourceFilter)initWithDictionary:(id)a3
{
  return (GEOResourceFilter *)-[GEOResourceFilter _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!a1)
  {
    v4 = 0;
    goto LABEL_52;
  }
  v4 = (void *)objc_msgSend(a1, "init");
  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("scale"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v26 = v3;
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_26;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v24 = v5;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (!v7)
      goto LABEL_25;
    v8 = v7;
    v9 = *(_QWORD *)v32;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v11;
          if ((objc_msgSend(v12, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCALE_UNKNOWN")) & 1) != 0)
          {
            v13 = 0;
          }
          else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCALE_1X")) & 1) != 0)
          {
            v13 = 1;
          }
          else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCALE_2X")) & 1) != 0)
          {
            v13 = 2;
          }
          else if (objc_msgSend(v12, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCALE_3X")))
          {
            v13 = 3;
          }
          else
          {
            v13 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v13 = objc_msgSend(v11, "intValue");
        }
        objc_msgSend(v4, "addScale:", v13, v24);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (!v8)
      {
LABEL_25:

        v5 = v24;
LABEL_26:

        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("scenario"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_51;
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v25 = v14;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (!v16)
          goto LABEL_50;
        v17 = v16;
        v18 = *(_QWORD *)v28;
LABEL_29:
        v19 = 0;
LABEL_30:
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v19);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = v20;
          if ((objc_msgSend(v21, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCENARIO_UNKNOWN")) & 1) != 0)
          {
            v22 = 0;
          }
          else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCENARIO_CARPLAY")) & 1) != 0)
          {
            v22 = 1;
          }
          else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCENARIO_NAVIGATION")) & 1) != 0)
          {
            v22 = 2;
          }
          else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCENARIO_HIGHVISIBILITY")) & 1) != 0)
          {
            v22 = 3;
          }
          else if (objc_msgSend(v21, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCENARIO_EXPLICIT")))
          {
            v22 = 4;
          }
          else
          {
            v22 = 0;
          }

LABEL_47:
          objc_msgSend(v4, "addScenario:", v22, v25);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v22 = objc_msgSend(v20, "intValue");
            goto LABEL_47;
          }
        }
        if (v17 == ++v19)
        {
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (!v17)
          {
LABEL_50:

            v14 = v25;
            v3 = v26;
LABEL_51:

            break;
          }
          goto LABEL_29;
        }
        goto LABEL_30;
      }
    }
  }
LABEL_52:

  return v4;
}

- (GEOResourceFilter)initWithJSON:(id)a3
{
  return (GEOResourceFilter *)-[GEOResourceFilter _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOResourceFilterIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOResourceFilterReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  unint64_t v6;
  unint64_t v7;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0xE) == 0))
  {
    v8 = self->_reader;
    objc_sync_enter(v8);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "writeData:", v9);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOResourceFilter readAll:](self, "readAll:", 0);
    v5 = v10;
    if (self->_scales.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        v5 = v10;
        ++v6;
      }
      while (v6 < self->_scales.count);
    }
    if (self->_scenarios.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        v5 = v10;
        ++v7;
      }
      while (v7 < self->_scenarios.count);
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  id *v10;

  v10 = (id *)a3;
  -[GEOResourceFilter readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 18) = self->_readerMarkPos;
  *((_DWORD *)v10 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOResourceFilter scalesCount](self, "scalesCount"))
  {
    objc_msgSend(v10, "clearScales");
    v4 = -[GEOResourceFilter scalesCount](self, "scalesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v10, "addScale:", -[GEOResourceFilter scaleAtIndex:](self, "scaleAtIndex:", i));
    }
  }
  if (-[GEOResourceFilter scenariosCount](self, "scenariosCount"))
  {
    objc_msgSend(v10, "clearScenarios");
    v7 = -[GEOResourceFilter scenariosCount](self, "scenariosCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
        objc_msgSend(v10, "addScenario:", -[GEOResourceFilter scenarioAtIndex:](self, "scenarioAtIndex:", j));
    }
  }

}

- (unint64_t)hash
{
  uint64_t v2;

  -[GEOResourceFilter readAll:](self, "readAll:", 1);
  v2 = PBRepeatedInt32Hash();
  return PBRepeatedInt32Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "readAll:", 0);
  v4 = objc_msgSend(v10, "scalesCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEOResourceFilter addScale:](self, "addScale:", objc_msgSend(v10, "scaleAtIndex:", i));
  }
  v7 = objc_msgSend(v10, "scenariosCount");
  if (v7)
  {
    v8 = v7;
    for (j = 0; j != v8; ++j)
      -[GEOResourceFilter addScenario:](self, "addScenario:", objc_msgSend(v10, "scenarioAtIndex:", j));
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOResourceFilterReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_584);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOResourceFilter readAll:](self, "readAll:", 0);
}

@end
