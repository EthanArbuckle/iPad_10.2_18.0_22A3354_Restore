@implementation GEORPFeedbackSubmissionParameters

- (GEORPFeedbackSubmissionParameters)init
{
  GEORPFeedbackSubmissionParameters *v2;
  GEORPFeedbackSubmissionParameters *v3;
  GEORPFeedbackSubmissionParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackSubmissionParameters;
  v2 = -[GEORPFeedbackSubmissionParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackSubmissionParameters)initWithData:(id)a3
{
  GEORPFeedbackSubmissionParameters *v3;
  GEORPFeedbackSubmissionParameters *v4;
  GEORPFeedbackSubmissionParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackSubmissionParameters;
  v3 = -[GEORPFeedbackSubmissionParameters initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readClientSubmissionUuid
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackSubmissionParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientSubmissionUuid_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasClientSubmissionUuid
{
  -[GEORPFeedbackSubmissionParameters _readClientSubmissionUuid]((uint64_t)self);
  return self->_clientSubmissionUuid != 0;
}

- (NSString)clientSubmissionUuid
{
  -[GEORPFeedbackSubmissionParameters _readClientSubmissionUuid]((uint64_t)self);
  return self->_clientSubmissionUuid;
}

- (void)setClientSubmissionUuid:(id)a3
{
  *(_WORD *)&self->_flags |= 0x104u;
  objc_storeStrong((id *)&self->_clientSubmissionUuid, a3);
}

- (int)type
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasType
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_1E1C03B40[a3];
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

- (void)_readDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackSubmissionParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDetails_tags_1882);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasDetails
{
  -[GEORPFeedbackSubmissionParameters _readDetails]((uint64_t)self);
  return self->_details != 0;
}

- (GEORPFeedbackDetails)details
{
  -[GEORPFeedbackSubmissionParameters _readDetails]((uint64_t)self);
  return self->_details;
}

- (void)setDetails:(id)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  objc_storeStrong((id *)&self->_details, a3);
}

- (void)_readCommonContext
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackSubmissionParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCommonContext_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasCommonContext
{
  -[GEORPFeedbackSubmissionParameters _readCommonContext]((uint64_t)self);
  return self->_commonContext != 0;
}

- (GEORPFeedbackCommonContext)commonContext
{
  -[GEORPFeedbackSubmissionParameters _readCommonContext]((uint64_t)self);
  return self->_commonContext;
}

- (void)setCommonContext:(id)a3
{
  *(_WORD *)&self->_flags |= 0x108u;
  objc_storeStrong((id *)&self->_commonContext, a3);
}

- (void)_readCommonCorrections
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackSubmissionParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCommonCorrections_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasCommonCorrections
{
  -[GEORPFeedbackSubmissionParameters _readCommonCorrections]((uint64_t)self);
  return self->_commonCorrections != 0;
}

- (GEORPFeedbackCommonCorrections)commonCorrections
{
  -[GEORPFeedbackSubmissionParameters _readCommonCorrections]((uint64_t)self);
  return self->_commonCorrections;
}

- (void)setCommonCorrections:(id)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  objc_storeStrong((id *)&self->_commonCorrections, a3);
}

- (void)_readParentFeedbackId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackSubmissionParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readParentFeedbackId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasParentFeedbackId
{
  -[GEORPFeedbackSubmissionParameters _readParentFeedbackId]((uint64_t)self);
  return self->_parentFeedbackId != 0;
}

- (NSString)parentFeedbackId
{
  -[GEORPFeedbackSubmissionParameters _readParentFeedbackId]((uint64_t)self);
  return self->_parentFeedbackId;
}

- (void)setParentFeedbackId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_parentFeedbackId, a3);
}

- (void)_readDynamicForm
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackSubmissionParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDynamicForm_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasDynamicForm
{
  -[GEORPFeedbackSubmissionParameters _readDynamicForm]((uint64_t)self);
  return self->_dynamicForm != 0;
}

- (GEORPFeedbackDynamicForm)dynamicForm
{
  -[GEORPFeedbackSubmissionParameters _readDynamicForm]((uint64_t)self);
  return self->_dynamicForm;
}

- (void)setDynamicForm:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_dynamicForm, a3);
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
  v8.super_class = (Class)GEORPFeedbackSubmissionParameters;
  -[GEORPFeedbackSubmissionParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackSubmissionParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackSubmissionParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  _QWORD v33[4];
  id v34;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "clientSubmissionUuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("clientSubmissionUuid");
    else
      v6 = CFSTR("client_submission_uuid");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  if ((*(_WORD *)(a1 + 88) & 1) != 0)
  {
    v7 = *(int *)(a1 + 84);
    if (v7 >= 0x16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 84));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E1C03B40[v7];
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("type"));

  }
  objc_msgSend((id)a1, "details");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v9, "jsonRepresentation");
    else
      objc_msgSend(v9, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("details"));

  }
  objc_msgSend((id)a1, "commonContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "jsonRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("commonContext");
    }
    else
    {
      objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("common_context");
    }
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  objc_msgSend((id)a1, "commonCorrections");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v16, "jsonRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("commonCorrections");
    }
    else
    {
      objc_msgSend(v16, "dictionaryRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("common_corrections");
    }
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  objc_msgSend((id)a1, "parentFeedbackId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    if (a2)
      v21 = CFSTR("parentFeedbackId");
    else
      v21 = CFSTR("parent_feedback_id");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);
  }

  objc_msgSend((id)a1, "dynamicForm");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v22, "jsonRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("dynamicForm");
    }
    else
    {
      objc_msgSend(v22, "dictionaryRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("dynamic_form");
    }
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

  }
  v26 = *(void **)(a1 + 16);
  if (v26)
  {
    objc_msgSend(v26, "dictionaryRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v27, "count"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __63__GEORPFeedbackSubmissionParameters__dictionaryRepresentation___block_invoke;
      v33[3] = &unk_1E1C00600;
      v30 = v29;
      v34 = v30;
      objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v33);
      v31 = v30;

      v28 = v31;
    }
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackSubmissionParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __63__GEORPFeedbackSubmissionParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPFeedbackSubmissionParameters)initWithDictionary:(id)a3
{
  return (GEORPFeedbackSubmissionParameters *)-[GEORPFeedbackSubmissionParameters _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  GEORPFeedbackDetails *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  GEORPFeedbackCommonContext *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  GEORPFeedbackCommonCorrections *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  GEORPFeedbackDynamicForm *v31;
  uint64_t v32;
  void *v33;

  v5 = a2;
  if (!a1)
    goto LABEL_93;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_93;
  if (a3)
    v6 = CFSTR("clientSubmissionUuid");
  else
    v6 = CFSTR("client_submission_uuid");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(a1, "setClientSubmissionUuid:", v8);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FEEDBACK_TYPE_UNKNOWN")) & 1) != 0)
    {
      v11 = 0;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FEEDBACK_TYPE_OTHER")) & 1) != 0)
    {
      v11 = 1;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FEEDBACK_TYPE_POI")) & 1) != 0)
    {
      v11 = 2;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FEEDBACK_TYPE_TRANSIT_POI")) & 1) != 0)
    {
      v11 = 3;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FEEDBACK_TYPE_ADDRESS")) & 1) != 0)
    {
      v11 = 4;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FEEDBACK_TYPE_TILE")) & 1) != 0)
    {
      v11 = 5;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FEEDBACK_TYPE_SEARCH")) & 1) != 0)
    {
      v11 = 6;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FEEDBACK_TYPE_MERCHANT_LOOKUP")) & 1) != 0)
    {
      v11 = 7;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FEEDBACK_TYPE_DIRECTIONS")) & 1) != 0)
    {
      v11 = 8;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FEEDBACK_TYPE_GROUND_VIEW")) & 1) != 0)
    {
      v11 = 9;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FEEDBACK_TYPE_POI_ENRICHMENT")) & 1) != 0)
    {
      v11 = 10;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FEEDBACK_TYPE_INCIDENT")) & 1) != 0)
    {
      v11 = 11;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FEEDBACK_TYPE_CURATED_COLLECTION")) & 1) != 0)
    {
      v11 = 12;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FEEDBACK_TYPE_POI_IMAGE")) & 1) != 0)
    {
      v11 = 13;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FEEDBACK_TYPE_POI_ACTIVITY")) & 1) != 0)
    {
      v11 = 14;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FEEDBACK_TYPE_ADD_TO_MAP")) & 1) != 0)
    {
      v11 = 15;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FEEDBACK_TYPE_LOCALITY")) & 1) != 0)
    {
      v11 = 16;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FEEDBACK_TYPE_STREET")) & 1) != 0)
    {
      v11 = 17;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FEEDBACK_TYPE_THIRD_PARTY_PHOTO_SHARING_PREFERENCE")) & 1) != 0)
    {
      v11 = 18;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FEEDBACK_TYPE_PHOTO_ATTRIBUTION_PREFERENCE")) & 1) != 0)
    {
      v11 = 19;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FEEDBACK_TYPE_RUNNING_TRACK")) & 1) != 0)
    {
      v11 = 20;
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("FEEDBACK_TYPE_RAP_USER_RESPONSE")))
    {
      v11 = 21;
    }
    else
    {
      v11 = 0;
    }

    goto LABEL_57;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = objc_msgSend(v9, "intValue");
LABEL_57:
    objc_msgSend(a1, "setType:", v11);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("details"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = [GEORPFeedbackDetails alloc];
    if ((a3 & 1) != 0)
      v14 = -[GEORPFeedbackDetails initWithJSON:](v13, "initWithJSON:", v12);
    else
      v14 = -[GEORPFeedbackDetails initWithDictionary:](v13, "initWithDictionary:", v12);
    v15 = (void *)v14;
    objc_msgSend(a1, "setDetails:", v14);

  }
  if (a3)
    v16 = CFSTR("commonContext");
  else
    v16 = CFSTR("common_context");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = [GEORPFeedbackCommonContext alloc];
    if ((a3 & 1) != 0)
      v19 = -[GEORPFeedbackCommonContext initWithJSON:](v18, "initWithJSON:", v17);
    else
      v19 = -[GEORPFeedbackCommonContext initWithDictionary:](v18, "initWithDictionary:", v17);
    v20 = (void *)v19;
    objc_msgSend(a1, "setCommonContext:", v19);

  }
  if (a3)
    v21 = CFSTR("commonCorrections");
  else
    v21 = CFSTR("common_corrections");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = [GEORPFeedbackCommonCorrections alloc];
    if ((a3 & 1) != 0)
      v24 = -[GEORPFeedbackCommonCorrections initWithJSON:](v23, "initWithJSON:", v22);
    else
      v24 = -[GEORPFeedbackCommonCorrections initWithDictionary:](v23, "initWithDictionary:", v22);
    v25 = (void *)v24;
    objc_msgSend(a1, "setCommonCorrections:", v24);

  }
  if (a3)
    v26 = CFSTR("parentFeedbackId");
  else
    v26 = CFSTR("parent_feedback_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = (void *)objc_msgSend(v27, "copy");
    objc_msgSend(a1, "setParentFeedbackId:", v28);

  }
  if (a3)
    v29 = CFSTR("dynamicForm");
  else
    v29 = CFSTR("dynamic_form");
  objc_msgSend(v5, "objectForKeyedSubscript:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = [GEORPFeedbackDynamicForm alloc];
    if ((a3 & 1) != 0)
      v32 = -[GEORPFeedbackDynamicForm initWithJSON:](v31, "initWithJSON:", v30);
    else
      v32 = -[GEORPFeedbackDynamicForm initWithDictionary:](v31, "initWithDictionary:", v30);
    v33 = (void *)v32;
    objc_msgSend(a1, "setDynamicForm:", v32);

  }
LABEL_93:

  return a1;
}

- (GEORPFeedbackSubmissionParameters)initWithJSON:(id)a3
{
  return (GEORPFeedbackSubmissionParameters *)-[GEORPFeedbackSubmissionParameters _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1907;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1908;
    GEORPFeedbackSubmissionParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPFeedbackSubmissionParametersCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackSubmissionParametersIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackSubmissionParametersReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && !_GEORPFeedbackSubmissionParametersIsDirty((uint64_t)self))
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
    -[GEORPFeedbackSubmissionParameters readAll:](self, "readAll:", 0);
    if (self->_clientSubmissionUuid)
      PBDataWriterWriteStringField();
    v5 = v8;
    if ((*(_WORD *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v8;
    }
    if (self->_details)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_commonContext)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_commonCorrections)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_parentFeedbackId)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_dynamicForm)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEORPFeedbackSubmissionParametersClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPFeedbackSubmissionParameters _readCommonContext]((uint64_t)self);
  if (-[GEORPFeedbackCommonContext hasGreenTeaWithValue:](self->_commonContext, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPFeedbackSubmissionParameters _readDetails]((uint64_t)self);
  if (-[GEORPFeedbackDetails hasGreenTeaWithValue:](self->_details, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPFeedbackSubmissionParameters _readDynamicForm]((uint64_t)self);
  return -[GEORPFeedbackDynamicForm hasGreenTeaWithValue:](self->_dynamicForm, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORPFeedbackSubmissionParameters readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 18) = self->_readerMarkPos;
  *((_DWORD *)v5 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_clientSubmissionUuid)
    objc_msgSend(v5, "setClientSubmissionUuid:");
  v4 = v5;
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 21) = self->_type;
    *((_WORD *)v5 + 44) |= 1u;
  }
  if (self->_details)
  {
    objc_msgSend(v5, "setDetails:");
    v4 = v5;
  }
  if (self->_commonContext)
  {
    objc_msgSend(v5, "setCommonContext:");
    v4 = v5;
  }
  if (self->_commonCorrections)
  {
    objc_msgSend(v5, "setCommonCorrections:");
    v4 = v5;
  }
  if (self->_parentFeedbackId)
  {
    objc_msgSend(v5, "setParentFeedbackId:");
    v4 = v5;
  }
  if (self->_dynamicForm)
  {
    objc_msgSend(v5, "setDynamicForm:");
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
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  PBUnknownFields *v21;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPFeedbackSubmissionParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPFeedbackSubmissionParameters readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_clientSubmissionUuid, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_type;
    *(_WORD *)(v5 + 88) |= 1u;
  }
  v11 = -[GEORPFeedbackDetails copyWithZone:](self->_details, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v11;

  v13 = -[GEORPFeedbackCommonContext copyWithZone:](self->_commonContext, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v13;

  v15 = -[GEORPFeedbackCommonCorrections copyWithZone:](self->_commonCorrections, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v15;

  v17 = -[NSString copyWithZone:](self->_parentFeedbackId, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v17;

  v19 = -[GEORPFeedbackDynamicForm copyWithZone:](self->_dynamicForm, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v19;

  v21 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v21;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *clientSubmissionUuid;
  __int16 v6;
  GEORPFeedbackDetails *details;
  GEORPFeedbackCommonContext *commonContext;
  GEORPFeedbackCommonCorrections *commonCorrections;
  NSString *parentFeedbackId;
  GEORPFeedbackDynamicForm *dynamicForm;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEORPFeedbackSubmissionParameters readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  clientSubmissionUuid = self->_clientSubmissionUuid;
  if ((unint64_t)clientSubmissionUuid | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](clientSubmissionUuid, "isEqual:"))
      goto LABEL_19;
  }
  v6 = *((_WORD *)v4 + 44);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_type != *((_DWORD *)v4 + 21))
      goto LABEL_19;
  }
  else if ((v6 & 1) != 0)
  {
LABEL_19:
    v12 = 0;
    goto LABEL_20;
  }
  details = self->_details;
  if ((unint64_t)details | *((_QWORD *)v4 + 6) && !-[GEORPFeedbackDetails isEqual:](details, "isEqual:"))
    goto LABEL_19;
  commonContext = self->_commonContext;
  if ((unint64_t)commonContext | *((_QWORD *)v4 + 4))
  {
    if (!-[GEORPFeedbackCommonContext isEqual:](commonContext, "isEqual:"))
      goto LABEL_19;
  }
  commonCorrections = self->_commonCorrections;
  if ((unint64_t)commonCorrections | *((_QWORD *)v4 + 5))
  {
    if (!-[GEORPFeedbackCommonCorrections isEqual:](commonCorrections, "isEqual:"))
      goto LABEL_19;
  }
  parentFeedbackId = self->_parentFeedbackId;
  if ((unint64_t)parentFeedbackId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](parentFeedbackId, "isEqual:"))
      goto LABEL_19;
  }
  dynamicForm = self->_dynamicForm;
  if ((unint64_t)dynamicForm | *((_QWORD *)v4 + 7))
    v12 = -[GEORPFeedbackDynamicForm isEqual:](dynamicForm, "isEqual:");
  else
    v12 = 1;
LABEL_20:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSUInteger v9;

  -[GEORPFeedbackSubmissionParameters readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_clientSubmissionUuid, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_type;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[GEORPFeedbackDetails hash](self->_details, "hash");
  v7 = v5 ^ v6 ^ -[GEORPFeedbackCommonContext hash](self->_commonContext, "hash");
  v8 = -[GEORPFeedbackCommonCorrections hash](self->_commonCorrections, "hash");
  v9 = v8 ^ -[NSString hash](self->_parentFeedbackId, "hash");
  return v7 ^ v9 ^ -[GEORPFeedbackDynamicForm hash](self->_dynamicForm, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEORPFeedbackDetails *details;
  uint64_t v6;
  GEORPFeedbackCommonContext *commonContext;
  uint64_t v8;
  GEORPFeedbackCommonCorrections *commonCorrections;
  uint64_t v10;
  GEORPFeedbackDynamicForm *dynamicForm;
  uint64_t v12;
  _QWORD *v13;

  v13 = a3;
  objc_msgSend(v13, "readAll:", 0);
  v4 = v13;
  if (v13[3])
  {
    -[GEORPFeedbackSubmissionParameters setClientSubmissionUuid:](self, "setClientSubmissionUuid:");
    v4 = v13;
  }
  if ((v4[11] & 1) != 0)
  {
    self->_type = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 1u;
  }
  details = self->_details;
  v6 = v4[6];
  if (details)
  {
    if (!v6)
      goto LABEL_11;
    -[GEORPFeedbackDetails mergeFrom:](details, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[GEORPFeedbackSubmissionParameters setDetails:](self, "setDetails:");
  }
  v4 = v13;
LABEL_11:
  commonContext = self->_commonContext;
  v8 = v4[4];
  if (commonContext)
  {
    if (!v8)
      goto LABEL_17;
    -[GEORPFeedbackCommonContext mergeFrom:](commonContext, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_17;
    -[GEORPFeedbackSubmissionParameters setCommonContext:](self, "setCommonContext:");
  }
  v4 = v13;
LABEL_17:
  commonCorrections = self->_commonCorrections;
  v10 = v4[5];
  if (commonCorrections)
  {
    if (!v10)
      goto LABEL_23;
    -[GEORPFeedbackCommonCorrections mergeFrom:](commonCorrections, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_23;
    -[GEORPFeedbackSubmissionParameters setCommonCorrections:](self, "setCommonCorrections:");
  }
  v4 = v13;
LABEL_23:
  if (v4[8])
  {
    -[GEORPFeedbackSubmissionParameters setParentFeedbackId:](self, "setParentFeedbackId:");
    v4 = v13;
  }
  dynamicForm = self->_dynamicForm;
  v12 = v4[7];
  if (dynamicForm)
  {
    if (v12)
    {
      -[GEORPFeedbackDynamicForm mergeFrom:](dynamicForm, "mergeFrom:");
LABEL_30:
      v4 = v13;
    }
  }
  else if (v12)
  {
    -[GEORPFeedbackSubmissionParameters setDynamicForm:](self, "setDynamicForm:");
    goto LABEL_30;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEORPFeedbackSubmissionParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1911);
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
  *(_WORD *)&self->_flags |= 0x102u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORPFeedbackSubmissionParameters readAll:](self, "readAll:", 0);
    -[GEORPFeedbackDetails clearUnknownFields:](self->_details, "clearUnknownFields:", 1);
    -[GEORPFeedbackCommonContext clearUnknownFields:](self->_commonContext, "clearUnknownFields:", 1);
    -[GEORPFeedbackCommonCorrections clearUnknownFields:](self->_commonCorrections, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentFeedbackId, 0);
  objc_storeStrong((id *)&self->_dynamicForm, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_commonCorrections, 0);
  objc_storeStrong((id *)&self->_commonContext, 0);
  objc_storeStrong((id *)&self->_clientSubmissionUuid, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
