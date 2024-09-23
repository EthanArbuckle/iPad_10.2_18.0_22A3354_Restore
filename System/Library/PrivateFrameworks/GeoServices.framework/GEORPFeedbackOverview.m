@implementation GEORPFeedbackOverview

- (GEORPFeedbackOverview)init
{
  GEORPFeedbackOverview *v2;
  GEORPFeedbackOverview *v3;
  GEORPFeedbackOverview *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackOverview;
  v2 = -[GEORPFeedbackOverview init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackOverview)initWithData:(id)a3
{
  GEORPFeedbackOverview *v3;
  GEORPFeedbackOverview *v4;
  GEORPFeedbackOverview *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackOverview;
  v3 = -[GEORPFeedbackOverview initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)type
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -126;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_1E1C21388[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_TYPE_OTHER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_TYPE_POI")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_TYPE_TRANSIT_POI")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_TYPE_ADDRESS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_TYPE_TILE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_TYPE_SEARCH")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_TYPE_MERCHANT_LOOKUP")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_TYPE_DIRECTIONS")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_TYPE_GROUND_VIEW")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_TYPE_POI_ENRICHMENT")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_TYPE_INCIDENT")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_TYPE_CURATED_COLLECTION")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_TYPE_POI_IMAGE")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_TYPE_POI_ACTIVITY")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_TYPE_ADD_TO_MAP")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_TYPE_LOCALITY")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_TYPE_STREET")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_TYPE_THIRD_PARTY_PHOTO_SHARING_PREFERENCE")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_TYPE_PHOTO_ATTRIBUTION_PREFERENCE")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_TYPE_RUNNING_TRACK")) & 1) != 0)
  {
    v4 = 20;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_TYPE_RAP_USER_RESPONSE")))
  {
    v4 = 21;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readTitle
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackOverviewReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTitle_tags_498);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasTitle
{
  -[GEORPFeedbackOverview _readTitle]((uint64_t)self);
  return self->_title != 0;
}

- (NSString)title
{
  -[GEORPFeedbackOverview _readTitle]((uint64_t)self);
  return self->_title;
}

- (void)setTitle:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)_readCreatedAt
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackOverviewReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCreatedAt_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasCreatedAt
{
  -[GEORPFeedbackOverview _readCreatedAt]((uint64_t)self);
  return self->_createdAt != 0;
}

- (GEORPTimestamp)createdAt
{
  -[GEORPFeedbackOverview _readCreatedAt]((uint64_t)self);
  return self->_createdAt;
}

- (void)setCreatedAt:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_createdAt, a3);
}

- (void)_readLastUpdatedAt
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackOverviewReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLastUpdatedAt_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasLastUpdatedAt
{
  -[GEORPFeedbackOverview _readLastUpdatedAt]((uint64_t)self);
  return self->_lastUpdatedAt != 0;
}

- (GEORPTimestamp)lastUpdatedAt
{
  -[GEORPFeedbackOverview _readLastUpdatedAt]((uint64_t)self);
  return self->_lastUpdatedAt;
}

- (void)setLastUpdatedAt:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_lastUpdatedAt, a3);
}

- (int)feedbackState
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_feedbackState;
  else
    return 0;
}

- (void)setFeedbackState:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_feedbackState = a3;
}

- (void)setHasFeedbackState:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasFeedbackState
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)feedbackStateAsString:(int)a3
{
  if (a3 < 8)
    return off_1E1C21438[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFeedbackState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_STATE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_STATE_CREATED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_STATE_IN_PROGRESS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_STATE_ON_HOLD")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_STATE_REJECTED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_STATE_FIXED")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_STATE_ASSIGNED_TO_VENDOR")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_STATE_TELL_US_MORE")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readStateDescription
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackOverviewReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStateDescription_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasStateDescription
{
  -[GEORPFeedbackOverview _readStateDescription]((uint64_t)self);
  return self->_stateDescription != 0;
}

- (NSString)stateDescription
{
  -[GEORPFeedbackOverview _readStateDescription]((uint64_t)self);
  return self->_stateDescription;
}

- (void)setStateDescription:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_stateDescription, a3);
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
  v8.super_class = (Class)GEORPFeedbackOverview;
  -[GEORPFeedbackOverview description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackOverview dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackOverview _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  __CFString *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v28[4];
  id v29;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 76) & 2) != 0)
  {
    v5 = *(int *)(a1 + 72);
    if (v5 >= 0x16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 72));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C21388[v5];
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("type"));

  }
  objc_msgSend((id)a1, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("title"));

  objc_msgSend((id)a1, "createdAt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "jsonRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("createdAt");
    }
    else
    {
      objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("created_at");
    }
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  objc_msgSend((id)a1, "lastUpdatedAt");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "jsonRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("lastUpdatedAt");
    }
    else
    {
      objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("last_updated_at");
    }
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  if ((*(_BYTE *)(a1 + 76) & 1) != 0)
  {
    v16 = *(int *)(a1 + 68);
    if (v16 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E1C21438[v16];
    }
    if (a2)
      v18 = CFSTR("feedbackState");
    else
      v18 = CFSTR("feedback_state");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  objc_msgSend((id)a1, "stateDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (a2)
      v20 = CFSTR("stateDescription");
    else
      v20 = CFSTR("state_description");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);
  }

  v21 = *(void **)(a1 + 16);
  if (v21)
  {
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __51__GEORPFeedbackOverview__dictionaryRepresentation___block_invoke;
      v28[3] = &unk_1E1C00600;
      v25 = v24;
      v29 = v25;
      objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v28);
      v26 = v25;

      v23 = v26;
    }
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackOverview _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEORPFeedbackOverview__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPFeedbackOverview)initWithDictionary:(id)a3
{
  return (GEORPFeedbackOverview *)-[GEORPFeedbackOverview _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEORPTimestamp *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  GEORPTimestamp *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  const __CFString *v25;
  void *v26;
  void *v27;

  v5 = a2;
  if (!a1)
    goto LABEL_102;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_102;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_TYPE_UNKNOWN")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_TYPE_OTHER")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_TYPE_POI")) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_TYPE_TRANSIT_POI")) & 1) != 0)
    {
      v8 = 3;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_TYPE_ADDRESS")) & 1) != 0)
    {
      v8 = 4;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_TYPE_TILE")) & 1) != 0)
    {
      v8 = 5;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_TYPE_SEARCH")) & 1) != 0)
    {
      v8 = 6;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_TYPE_MERCHANT_LOOKUP")) & 1) != 0)
    {
      v8 = 7;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_TYPE_DIRECTIONS")) & 1) != 0)
    {
      v8 = 8;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_TYPE_GROUND_VIEW")) & 1) != 0)
    {
      v8 = 9;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_TYPE_POI_ENRICHMENT")) & 1) != 0)
    {
      v8 = 10;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_TYPE_INCIDENT")) & 1) != 0)
    {
      v8 = 11;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_TYPE_CURATED_COLLECTION")) & 1) != 0)
    {
      v8 = 12;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_TYPE_POI_IMAGE")) & 1) != 0)
    {
      v8 = 13;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_TYPE_POI_ACTIVITY")) & 1) != 0)
    {
      v8 = 14;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_TYPE_ADD_TO_MAP")) & 1) != 0)
    {
      v8 = 15;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_TYPE_LOCALITY")) & 1) != 0)
    {
      v8 = 16;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_TYPE_STREET")) & 1) != 0)
    {
      v8 = 17;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_TYPE_THIRD_PARTY_PHOTO_SHARING_PREFERENCE")) & 1) != 0)
    {
      v8 = 18;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_TYPE_PHOTO_ATTRIBUTION_PREFERENCE")) & 1) != 0)
    {
      v8 = 19;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_TYPE_RUNNING_TRACK")) & 1) != 0)
    {
      v8 = 20;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_TYPE_RAP_USER_RESPONSE")))
    {
      v8 = 21;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_53;
    v8 = objc_msgSend(v6, "intValue");
  }
  objc_msgSend(a1, "setType:", v8);
LABEL_53:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(a1, "setTitle:", v10);

  }
  if (a3)
    v11 = CFSTR("createdAt");
  else
    v11 = CFSTR("created_at");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = [GEORPTimestamp alloc];
    if ((a3 & 1) != 0)
      v14 = -[GEORPTimestamp initWithJSON:](v13, "initWithJSON:", v12);
    else
      v14 = -[GEORPTimestamp initWithDictionary:](v13, "initWithDictionary:", v12);
    v15 = (void *)v14;
    objc_msgSend(a1, "setCreatedAt:", v14);

  }
  if (a3)
    v16 = CFSTR("lastUpdatedAt");
  else
    v16 = CFSTR("last_updated_at");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = [GEORPTimestamp alloc];
    if ((a3 & 1) != 0)
      v19 = -[GEORPTimestamp initWithJSON:](v18, "initWithJSON:", v17);
    else
      v19 = -[GEORPTimestamp initWithDictionary:](v18, "initWithDictionary:", v17);
    v20 = (void *)v19;
    objc_msgSend(a1, "setLastUpdatedAt:", v19);

  }
  if (a3)
    v21 = CFSTR("feedbackState");
  else
    v21 = CFSTR("feedback_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = v22;
    if ((objc_msgSend(v23, "isEqualToString:", CFSTR("FEEDBACK_STATE_UNKNOWN")) & 1) != 0)
    {
      v24 = 0;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("FEEDBACK_STATE_CREATED")) & 1) != 0)
    {
      v24 = 1;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("FEEDBACK_STATE_IN_PROGRESS")) & 1) != 0)
    {
      v24 = 2;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("FEEDBACK_STATE_ON_HOLD")) & 1) != 0)
    {
      v24 = 3;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("FEEDBACK_STATE_REJECTED")) & 1) != 0)
    {
      v24 = 4;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("FEEDBACK_STATE_FIXED")) & 1) != 0)
    {
      v24 = 5;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("FEEDBACK_STATE_ASSIGNED_TO_VENDOR")) & 1) != 0)
    {
      v24 = 6;
    }
    else if (objc_msgSend(v23, "isEqualToString:", CFSTR("FEEDBACK_STATE_TELL_US_MORE")))
    {
      v24 = 7;
    }
    else
    {
      v24 = 0;
    }

    goto LABEL_95;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = objc_msgSend(v22, "intValue");
LABEL_95:
    objc_msgSend(a1, "setFeedbackState:", v24);
  }

  if (a3)
    v25 = CFSTR("stateDescription");
  else
    v25 = CFSTR("state_description");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = (void *)objc_msgSend(v26, "copy");
    objc_msgSend(a1, "setStateDescription:", v27);

  }
LABEL_102:

  return a1;
}

- (GEORPFeedbackOverview)initWithJSON:(id)a3
{
  return (GEORPFeedbackOverview *)-[GEORPFeedbackOverview _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_515;
    else
      v8 = (int *)&readAll__nonRecursiveTag_516;
    GEORPFeedbackOverviewReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEORPTimestamp readAll:](self->_createdAt, "readAll:", 1);
    -[GEORPTimestamp readAll:](self->_lastUpdatedAt, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackOverviewIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackOverviewReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(_BYTE *)&self->_flags <= 7u))
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v7);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPFeedbackOverview readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    v5 = v8;
    if (self->_title)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_createdAt)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_lastUpdatedAt)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v8;
    }
    if (self->_stateDescription)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORPFeedbackOverview readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v5 + 18) = self->_type;
    *((_BYTE *)v5 + 76) |= 2u;
  }
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    v4 = v5;
  }
  if (self->_createdAt)
  {
    objc_msgSend(v5, "setCreatedAt:");
    v4 = v5;
  }
  if (self->_lastUpdatedAt)
  {
    objc_msgSend(v5, "setLastUpdatedAt:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 17) = self->_feedbackState;
    *((_BYTE *)v4 + 76) |= 1u;
  }
  if (self->_stateDescription)
  {
    objc_msgSend(v5, "setStateDescription:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  PBUnknownFields *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPFeedbackOverviewReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPFeedbackOverview readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_type;
    *(_BYTE *)(v5 + 76) |= 2u;
  }
  v9 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  v11 = -[GEORPTimestamp copyWithZone:](self->_createdAt, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  v13 = -[GEORPTimestamp copyWithZone:](self->_lastUpdatedAt, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v13;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_feedbackState;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v15 = -[NSString copyWithZone:](self->_stateDescription, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v15;

  v17 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v17;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *title;
  GEORPTimestamp *createdAt;
  GEORPTimestamp *lastUpdatedAt;
  NSString *stateDescription;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[GEORPFeedbackOverview readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_type != *((_DWORD *)v4 + 18))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
LABEL_20:
    v9 = 0;
    goto LABEL_21;
  }
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 6) && !-[NSString isEqual:](title, "isEqual:"))
    goto LABEL_20;
  createdAt = self->_createdAt;
  if ((unint64_t)createdAt | *((_QWORD *)v4 + 3))
  {
    if (!-[GEORPTimestamp isEqual:](createdAt, "isEqual:"))
      goto LABEL_20;
  }
  lastUpdatedAt = self->_lastUpdatedAt;
  if ((unint64_t)lastUpdatedAt | *((_QWORD *)v4 + 4))
  {
    if (!-[GEORPTimestamp isEqual:](lastUpdatedAt, "isEqual:"))
      goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_feedbackState != *((_DWORD *)v4 + 17))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    goto LABEL_20;
  }
  stateDescription = self->_stateDescription;
  if ((unint64_t)stateDescription | *((_QWORD *)v4 + 5))
    v9 = -[NSString isEqual:](stateDescription, "isEqual:");
  else
    v9 = 1;
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  -[GEORPFeedbackOverview readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_title, "hash");
  v5 = -[GEORPTimestamp hash](self->_createdAt, "hash");
  v6 = -[GEORPTimestamp hash](self->_lastUpdatedAt, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v7 = 2654435761 * self->_feedbackState;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSString hash](self->_stateDescription, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  GEORPTimestamp *createdAt;
  uint64_t v6;
  GEORPTimestamp *lastUpdatedAt;
  uint64_t v8;
  int *v9;

  v9 = (int *)a3;
  objc_msgSend(v9, "readAll:", 0);
  v4 = v9;
  if ((v9[19] & 2) != 0)
  {
    self->_type = v9[18];
    *(_BYTE *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v9 + 6))
  {
    -[GEORPFeedbackOverview setTitle:](self, "setTitle:");
    v4 = v9;
  }
  createdAt = self->_createdAt;
  v6 = *((_QWORD *)v4 + 3);
  if (createdAt)
  {
    if (!v6)
      goto LABEL_11;
    -[GEORPTimestamp mergeFrom:](createdAt, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[GEORPFeedbackOverview setCreatedAt:](self, "setCreatedAt:");
  }
  v4 = v9;
LABEL_11:
  lastUpdatedAt = self->_lastUpdatedAt;
  v8 = *((_QWORD *)v4 + 4);
  if (lastUpdatedAt)
  {
    if (!v8)
      goto LABEL_17;
    -[GEORPTimestamp mergeFrom:](lastUpdatedAt, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_17;
    -[GEORPFeedbackOverview setLastUpdatedAt:](self, "setLastUpdatedAt:");
  }
  v4 = v9;
LABEL_17:
  if ((v4[19] & 1) != 0)
  {
    self->_feedbackState = v4[17];
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[GEORPFeedbackOverview setStateDescription:](self, "setStateDescription:");
    v4 = v9;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEORPFeedbackOverviewReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_519);
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
  *(_BYTE *)&self->_flags |= 0x84u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEORPFeedbackOverview readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_stateDescription, 0);
  objc_storeStrong((id *)&self->_lastUpdatedAt, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
