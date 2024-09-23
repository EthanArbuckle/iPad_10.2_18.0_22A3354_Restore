@implementation GEORPFeedbackIdLookupParameters

- (GEORPFeedbackIdLookupParameters)init
{
  GEORPFeedbackIdLookupParameters *v2;
  GEORPFeedbackIdLookupParameters *v3;
  GEORPFeedbackIdLookupParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackIdLookupParameters;
  v2 = -[GEORPFeedbackIdLookupParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackIdLookupParameters)initWithData:(id)a3
{
  GEORPFeedbackIdLookupParameters *v3;
  GEORPFeedbackIdLookupParameters *v4;
  GEORPFeedbackIdLookupParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackIdLookupParameters;
  v3 = -[GEORPFeedbackIdLookupParameters initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEORPFeedbackIdLookupParameters;
  -[GEORPFeedbackIdLookupParameters dealloc](&v3, sel_dealloc);
}

- (void)_readFeedbackIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackIdLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeedbackIds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)feedbackIds
{
  -[GEORPFeedbackIdLookupParameters _readFeedbackIds]((uint64_t)self);
  return self->_feedbackIds;
}

- (void)setFeedbackIds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *feedbackIds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  feedbackIds = self->_feedbackIds;
  self->_feedbackIds = v4;

}

- (void)clearFeedbackIds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  -[NSMutableArray removeAllObjects](self->_feedbackIds, "removeAllObjects");
}

- (void)addFeedbackId:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPFeedbackIdLookupParameters _readFeedbackIds]((uint64_t)self);
  -[GEORPFeedbackIdLookupParameters _addNoFlagsFeedbackId:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (void)_addNoFlagsFeedbackId:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)feedbackIdsCount
{
  -[GEORPFeedbackIdLookupParameters _readFeedbackIds]((uint64_t)self);
  return -[NSMutableArray count](self->_feedbackIds, "count");
}

- (id)feedbackIdAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackIdLookupParameters _readFeedbackIds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_feedbackIds, "objectAtIndex:", a3);
}

+ (Class)feedbackIdType
{
  return (Class)objc_opt_class();
}

- (void)_readFeedbackComponentTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackIdLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeedbackComponentTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)feedbackComponentTypesCount
{
  -[GEORPFeedbackIdLookupParameters _readFeedbackComponentTypes]((uint64_t)self);
  return self->_feedbackComponentTypes.count;
}

- (int)feedbackComponentTypes
{
  -[GEORPFeedbackIdLookupParameters _readFeedbackComponentTypes]((uint64_t)self);
  return self->_feedbackComponentTypes.list;
}

- (void)clearFeedbackComponentTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  PBRepeatedInt32Clear();
}

- (void)addFeedbackComponentType:(int)a3
{
  -[GEORPFeedbackIdLookupParameters _readFeedbackComponentTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (int)feedbackComponentTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_feedbackComponentTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORPFeedbackIdLookupParameters _readFeedbackComponentTypes]((uint64_t)self);
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
  *(_BYTE *)&self->_flags |= 8u;
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackIdLookupParameters;
  -[GEORPFeedbackIdLookupParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackIdLookupParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackIdLookupParameters _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[6])
  {
    objc_msgSend(a1, "feedbackIds");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("feedbackId");
    else
      v6 = CFSTR("feedback_id");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  if (a1[4])
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = a1 + 3;
    if (a1[4])
    {
      v9 = 0;
      do
      {
        v10 = *(int *)(*v8 + 4 * v9);
        if (v10 >= 8)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = off_1E1C21478[v10];
        }
        objc_msgSend(v7, "addObject:", v11);

        ++v9;
        v8 = a1 + 3;
      }
      while (v9 < a1[4]);
    }
    if (a2)
      v12 = CFSTR("feedbackComponentType");
    else
      v12 = CFSTR("feedback_component_type");
    objc_msgSend(v4, "setObject:forKey:", v7, v12);

  }
  v13 = (void *)a1[2];
  if (v13)
  {
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __61__GEORPFeedbackIdLookupParameters__dictionaryRepresentation___block_invoke;
      v20[3] = &unk_1E1C00600;
      v17 = v16;
      v21 = v17;
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v20);
      v18 = v17;

      v15 = v18;
    }
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackIdLookupParameters _dictionaryRepresentation:](self, 1);
}

void __61__GEORPFeedbackIdLookupParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPFeedbackIdLookupParameters)initWithDictionary:(id)a3
{
  return (GEORPFeedbackIdLookupParameters *)-[GEORPFeedbackIdLookupParameters _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("feedbackId");
      else
        v6 = CFSTR("feedback_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v27 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v33;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v33 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v12);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = (void *)objc_msgSend(v13, "copy");
                objc_msgSend(a1, "addFeedbackId:", v14);

              }
              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
          }
          while (v10);
        }

        v5 = v27;
      }

      if (a3)
        v15 = CFSTR("feedbackComponentType");
      else
        v15 = CFSTR("feedback_component_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v26 = v16;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (!v18)
          goto LABEL_50;
        v19 = v18;
        v20 = *(_QWORD *)v29;
        while (1)
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v29 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v21);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v23 = v22;
              if ((objc_msgSend(v23, "isEqualToString:", CFSTR("FEEDBACK_COMPONENT_TYPE_UNKNOWN")) & 1) != 0)
              {
                v24 = 0;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("FEEDBACK_COMPONENT_TYPE_NOTIFICATION")) & 1) != 0)
              {
                v24 = 1;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("FEEDBACK_COMPONENT_TYPE_OVERVIEW")) & 1) != 0)
              {
                v24 = 2;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("FEEDBACK_COMPONENT_TYPE_CONVERSATION")) & 1) != 0)
              {
                v24 = 3;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("FEEDBACK_COMPONENT_TYPE_POI_ENRICHMENT")) & 1) != 0)
              {
                v24 = 4;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("FEEDBACK_COMPONENT_TYPE_RAP")) & 1) != 0)
              {
                v24 = 5;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("FEEDBACK_COMPONENT_TYPE_THIRD_PARTY_PHOTO_SHARING_PREFERENCE")) & 1) != 0)
              {
                v24 = 6;
              }
              else if (objc_msgSend(v23, "isEqualToString:", CFSTR("FEEDBACK_COMPONENT_TYPE_PHOTO_ATTRIBUTION_PREFERENCES")))
              {
                v24 = 7;
              }
              else
              {
                v24 = 0;
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_48;
              v24 = objc_msgSend(v22, "intValue");
            }
            objc_msgSend(a1, "addFeedbackComponentType:", v24, v26);
LABEL_48:
            ++v21;
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (!v19)
          {
LABEL_50:

            v16 = v26;
            v5 = v27;
            break;
          }
        }
      }

    }
  }

  return a1;
}

- (GEORPFeedbackIdLookupParameters)initWithJSON:(id)a3
{
  return (GEORPFeedbackIdLookupParameters *)-[GEORPFeedbackIdLookupParameters _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_414;
    else
      v8 = (int *)&readAll__nonRecursiveTag_415;
    GEORPFeedbackIdLookupParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackIdLookupParametersIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackIdLookupParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  PBDataReader *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0xE) == 0))
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v12);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPFeedbackIdLookupParameters readAll:](self, "readAll:", 0);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_feedbackIds;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteStringField();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    if (self->_feedbackComponentTypes.count)
    {
      v10 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v10;
      }
      while (v10 < self->_feedbackComponentTypes.count);
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  id *v11;

  v11 = (id *)a3;
  -[GEORPFeedbackIdLookupParameters readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 14) = self->_readerMarkPos;
  *((_DWORD *)v11 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEORPFeedbackIdLookupParameters feedbackIdsCount](self, "feedbackIdsCount"))
  {
    objc_msgSend(v11, "clearFeedbackIds");
    v4 = -[GEORPFeedbackIdLookupParameters feedbackIdsCount](self, "feedbackIdsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPFeedbackIdLookupParameters feedbackIdAtIndex:](self, "feedbackIdAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addFeedbackId:", v7);

      }
    }
  }
  if (-[GEORPFeedbackIdLookupParameters feedbackComponentTypesCount](self, "feedbackComponentTypesCount"))
  {
    objc_msgSend(v11, "clearFeedbackComponentTypes");
    v8 = -[GEORPFeedbackIdLookupParameters feedbackComponentTypesCount](self, "feedbackComponentTypesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(v11, "addFeedbackComponentType:", -[GEORPFeedbackIdLookupParameters feedbackComponentTypeAtIndex:](self, "feedbackComponentTypeAtIndex:", j));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 8) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPFeedbackIdLookupParametersReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPFeedbackIdLookupParameters readAll:](self, "readAll:", 0);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_feedbackIds;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (_QWORD)v14);
        objc_msgSend(v5, "addFeedbackId:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  PBRepeatedInt32Copy();
  objc_storeStrong(v5 + 2, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *feedbackIds;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPFeedbackIdLookupParameters readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         feedbackIds = self->_feedbackIds,
         !((unint64_t)feedbackIds | v4[6]))
     || -[NSMutableArray isEqual:](feedbackIds, "isEqual:")))
  {
    IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;

  -[GEORPFeedbackIdLookupParameters readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_feedbackIds, "hash");
  return PBRepeatedInt32Hash() ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4[6];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        -[GEORPFeedbackIdLookupParameters addFeedbackId:](self, "addFeedbackId:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9++), (_QWORD)v13);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v10 = objc_msgSend(v4, "feedbackComponentTypesCount");
  if (v10)
  {
    v11 = v10;
    for (i = 0; i != v11; ++i)
      -[GEORPFeedbackIdLookupParameters addFeedbackComponentType:](self, "addFeedbackComponentType:", objc_msgSend(v4, "feedbackComponentTypeAtIndex:", i, (_QWORD)v13));
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
      GEORPFeedbackIdLookupParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_418);
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
    -[GEORPFeedbackIdLookupParameters readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackIds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
