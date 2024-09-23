@implementation GEORPFeedbackQueryParameters

- (GEORPFeedbackQueryParameters)init
{
  GEORPFeedbackQueryParameters *v2;
  GEORPFeedbackQueryParameters *v3;
  GEORPFeedbackQueryParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackQueryParameters;
  v2 = -[GEORPFeedbackQueryParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackQueryParameters)initWithData:(id)a3
{
  GEORPFeedbackQueryParameters *v3;
  GEORPFeedbackQueryParameters *v4;
  GEORPFeedbackQueryParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackQueryParameters;
  v3 = -[GEORPFeedbackQueryParameters initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEORPFeedbackQueryParameters;
  -[GEORPFeedbackQueryParameters dealloc](&v3, sel_dealloc);
}

- (void)_readFeedbackComponentTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackQueryParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeedbackComponentTypes_tags_551);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)feedbackComponentTypesCount
{
  -[GEORPFeedbackQueryParameters _readFeedbackComponentTypes]((uint64_t)self);
  return self->_feedbackComponentTypes.count;
}

- (int)feedbackComponentTypes
{
  -[GEORPFeedbackQueryParameters _readFeedbackComponentTypes]((uint64_t)self);
  return self->_feedbackComponentTypes.list;
}

- (void)clearFeedbackComponentTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedInt32Clear();
}

- (void)addFeedbackComponentType:(int)a3
{
  -[GEORPFeedbackQueryParameters _readFeedbackComponentTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (int)feedbackComponentTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_feedbackComponentTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORPFeedbackQueryParameters _readFeedbackComponentTypes]((uint64_t)self);
  p_feedbackComponentTypes = &self->_feedbackComponentTypes;
  count = self->_feedbackComponentTypes.count;
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
  return p_feedbackComponentTypes->list[a3];
}

- (void)setFeedbackComponentTypes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedInt32Set();
}

- (id)feedbackComponentTypesAsString:(int)a3
{
  if (a3 < 8)
    return off_1E1C21478[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFeedbackComponentTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_COMPONENT_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_COMPONENT_TYPE_NOTIFICATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_COMPONENT_TYPE_OVERVIEW")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_COMPONENT_TYPE_CONVERSATION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_COMPONENT_TYPE_POI_ENRICHMENT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_COMPONENT_TYPE_RAP")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_COMPONENT_TYPE_THIRD_PARTY_PHOTO_SHARING_PREFERENCE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_COMPONENT_TYPE_PHOTO_ATTRIBUTION_PREFERENCES")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readFilter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackQueryParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFilter_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasFilter
{
  -[GEORPFeedbackQueryParameters _readFilter]((uint64_t)self);
  return self->_filter != 0;
}

- (GEORPFilter)filter
{
  -[GEORPFeedbackQueryParameters _readFilter]((uint64_t)self);
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_filter, a3);
}

- (void)_readComponentQueryParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackQueryParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readComponentQueryParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasComponentQueryParameters
{
  -[GEORPFeedbackQueryParameters _readComponentQueryParameters]((uint64_t)self);
  return self->_componentQueryParameters != 0;
}

- (GEORPFeedbackComponentQueryParameters)componentQueryParameters
{
  -[GEORPFeedbackQueryParameters _readComponentQueryParameters]((uint64_t)self);
  return self->_componentQueryParameters;
}

- (void)setComponentQueryParameters:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_componentQueryParameters, a3);
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
  v8.super_class = (Class)GEORPFeedbackQueryParameters;
  -[GEORPFeedbackQueryParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackQueryParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackQueryParameters _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v25[4];
  id v26;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[4])
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1 + 3;
    if (a1[4])
    {
      v7 = 0;
      do
      {
        v8 = *(int *)(*v6 + 4 * v7);
        if (v8 >= 8)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = off_1E1C21478[v8];
        }
        objc_msgSend(v5, "addObject:", v9);

        ++v7;
        v6 = a1 + 3;
      }
      while (v7 < a1[4]);
    }
    if (a2)
      v10 = CFSTR("feedbackComponentType");
    else
      v10 = CFSTR("feedback_component_type");
    objc_msgSend(v4, "setObject:forKey:", v5, v10);

  }
  objc_msgSend(a1, "filter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v11, "jsonRepresentation");
    else
      objc_msgSend(v11, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("filter"));

  }
  objc_msgSend(a1, "componentQueryParameters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v14, "jsonRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("componentQueryParameters");
    }
    else
    {
      objc_msgSend(v14, "dictionaryRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("component_query_parameters");
    }
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  v18 = (void *)a1[2];
  if (v18)
  {
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __58__GEORPFeedbackQueryParameters__dictionaryRepresentation___block_invoke;
      v25[3] = &unk_1E1C00600;
      v22 = v21;
      v26 = v22;
      objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v25);
      v23 = v22;

      v20 = v23;
    }
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackQueryParameters _dictionaryRepresentation:](self, 1);
}

void __58__GEORPFeedbackQueryParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPFeedbackQueryParameters)initWithDictionary:(id)a3
{
  return (GEORPFeedbackQueryParameters *)-[GEORPFeedbackQueryParameters _initWithDictionary:isJSON:](self, a3, 0);
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
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  GEORPFilter *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  GEORPFeedbackComponentQueryParameters *v23;
  uint64_t v24;
  void *v25;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = (void *)objc_msgSend(a1, "init");
    if (v6)
    {
      if (a3)
        v7 = CFSTR("feedbackComponentType");
      else
        v7 = CFSTR("feedback_component_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = v5;
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v27 = v8;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (!v10)
          goto LABEL_36;
        v11 = v10;
        v12 = *(_QWORD *)v30;
        while (1)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v30 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = v14;
              if ((objc_msgSend(v15, "isEqualToString:", CFSTR("FEEDBACK_COMPONENT_TYPE_UNKNOWN")) & 1) != 0)
              {
                v16 = 0;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("FEEDBACK_COMPONENT_TYPE_NOTIFICATION")) & 1) != 0)
              {
                v16 = 1;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("FEEDBACK_COMPONENT_TYPE_OVERVIEW")) & 1) != 0)
              {
                v16 = 2;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("FEEDBACK_COMPONENT_TYPE_CONVERSATION")) & 1) != 0)
              {
                v16 = 3;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("FEEDBACK_COMPONENT_TYPE_POI_ENRICHMENT")) & 1) != 0)
              {
                v16 = 4;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("FEEDBACK_COMPONENT_TYPE_RAP")) & 1) != 0)
              {
                v16 = 5;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("FEEDBACK_COMPONENT_TYPE_THIRD_PARTY_PHOTO_SHARING_PREFERENCE")) & 1) != 0)
              {
                v16 = 6;
              }
              else if (objc_msgSend(v15, "isEqualToString:", CFSTR("FEEDBACK_COMPONENT_TYPE_PHOTO_ATTRIBUTION_PREFERENCES")))
              {
                v16 = 7;
              }
              else
              {
                v16 = 0;
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              v16 = objc_msgSend(v14, "intValue");
            }
            objc_msgSend(v6, "addFeedbackComponentType:", v16);
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          if (!v11)
          {
LABEL_36:

            v5 = v28;
            v8 = v27;
            break;
          }
        }
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("filter"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = [GEORPFilter alloc];
        if ((a3 & 1) != 0)
          v19 = -[GEORPFilter initWithJSON:](v18, "initWithJSON:", v17);
        else
          v19 = -[GEORPFilter initWithDictionary:](v18, "initWithDictionary:", v17);
        v20 = (void *)v19;
        objc_msgSend(v6, "setFilter:", v19);

      }
      if (a3)
        v21 = CFSTR("componentQueryParameters");
      else
        v21 = CFSTR("component_query_parameters");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = [GEORPFeedbackComponentQueryParameters alloc];
        if ((a3 & 1) != 0)
          v24 = -[GEORPFeedbackComponentQueryParameters initWithJSON:](v23, "initWithJSON:", v22);
        else
          v24 = -[GEORPFeedbackComponentQueryParameters initWithDictionary:](v23, "initWithDictionary:", v22);
        v25 = (void *)v24;
        objc_msgSend(v6, "setComponentQueryParameters:", v24);

      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (GEORPFeedbackQueryParameters)initWithJSON:(id)a3
{
  return (GEORPFeedbackQueryParameters *)-[GEORPFeedbackQueryParameters _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_560;
    else
      v8 = (int *)&readAll__nonRecursiveTag_561;
    GEORPFeedbackQueryParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEORPFilter readAll:](self->_filter, "readAll:", 1);
    -[GEORPFeedbackComponentQueryParameters readAll:](self->_componentQueryParameters, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackQueryParametersIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackQueryParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  unint64_t v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEORPFeedbackQueryParametersIsDirty((uint64_t)self))
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPFeedbackQueryParameters readAll:](self, "readAll:", 0);
    v5 = v9;
    if (self->_feedbackComponentTypes.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        v5 = v9;
        ++v6;
      }
      while (v6 < self->_feedbackComponentTypes.count);
    }
    if (self->_filter)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_componentQueryParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id *v7;
  id *v8;

  v8 = (id *)a3;
  -[GEORPFeedbackQueryParameters readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 16) = self->_readerMarkPos;
  *((_DWORD *)v8 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEORPFeedbackQueryParameters feedbackComponentTypesCount](self, "feedbackComponentTypesCount"))
  {
    objc_msgSend(v8, "clearFeedbackComponentTypes");
    v4 = -[GEORPFeedbackQueryParameters feedbackComponentTypesCount](self, "feedbackComponentTypesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v8, "addFeedbackComponentType:", -[GEORPFeedbackQueryParameters feedbackComponentTypeAtIndex:](self, "feedbackComponentTypeAtIndex:", i));
    }
  }
  if (self->_filter)
    objc_msgSend(v8, "setFilter:");
  v7 = v8;
  if (self->_componentQueryParameters)
  {
    objc_msgSend(v8, "setComponentQueryParameters:");
    v7 = v8;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPFeedbackQueryParameters readAll:](self, "readAll:", 0);
    PBRepeatedInt32Copy();
    v8 = -[GEORPFilter copyWithZone:](self->_filter, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v8;

    v10 = -[GEORPFeedbackComponentQueryParameters copyWithZone:](self->_componentQueryParameters, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPFeedbackQueryParametersReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEORPFilter *filter;
  GEORPFeedbackComponentQueryParameters *componentQueryParameters;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEORPFeedbackQueryParameters readAll:](self, "readAll:", 1),
        objc_msgSend(v4, "readAll:", 1),
        PBRepeatedInt32IsEqual())
    && ((filter = self->_filter, !((unint64_t)filter | v4[7])) || -[GEORPFilter isEqual:](filter, "isEqual:")))
  {
    componentQueryParameters = self->_componentQueryParameters;
    if ((unint64_t)componentQueryParameters | v4[6])
      v7 = -[GEORPFeedbackComponentQueryParameters isEqual:](componentQueryParameters, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  -[GEORPFeedbackQueryParameters readAll:](self, "readAll:", 1);
  v3 = PBRepeatedInt32Hash();
  v4 = -[GEORPFilter hash](self->_filter, "hash");
  return v4 ^ v3 ^ -[GEORPFeedbackComponentQueryParameters hash](self->_componentQueryParameters, "hash");
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  GEORPFilter *filter;
  _QWORD *v8;
  uint64_t v9;
  GEORPFeedbackComponentQueryParameters *componentQueryParameters;
  uint64_t v11;
  _QWORD *v12;

  v12 = a3;
  objc_msgSend(v12, "readAll:", 0);
  v4 = objc_msgSend(v12, "feedbackComponentTypesCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEORPFeedbackQueryParameters addFeedbackComponentType:](self, "addFeedbackComponentType:", objc_msgSend(v12, "feedbackComponentTypeAtIndex:", i));
  }
  filter = self->_filter;
  v8 = v12;
  v9 = v12[7];
  if (filter)
  {
    if (!v9)
      goto LABEL_10;
    -[GEORPFilter mergeFrom:](filter, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_10;
    -[GEORPFeedbackQueryParameters setFilter:](self, "setFilter:");
  }
  v8 = v12;
LABEL_10:
  componentQueryParameters = self->_componentQueryParameters;
  v11 = v8[6];
  if (componentQueryParameters)
  {
    if (v11)
    {
      -[GEORPFeedbackComponentQueryParameters mergeFrom:](componentQueryParameters, "mergeFrom:");
LABEL_15:
      v8 = v12;
    }
  }
  else if (v11)
  {
    -[GEORPFeedbackQueryParameters setComponentQueryParameters:](self, "setComponentQueryParameters:");
    goto LABEL_15;
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
      GEORPFeedbackQueryParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_564);
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
  *(_BYTE *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORPFeedbackQueryParameters readAll:](self, "readAll:", 0);
    -[GEORPFilter clearUnknownFields:](self->_filter, "clearUnknownFields:", 1);
    -[GEORPFeedbackComponentQueryParameters clearUnknownFields:](self->_componentQueryParameters, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_componentQueryParameters, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
