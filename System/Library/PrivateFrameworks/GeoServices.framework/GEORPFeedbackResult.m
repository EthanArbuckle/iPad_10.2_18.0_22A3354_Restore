@implementation GEORPFeedbackResult

- (GEORPFeedbackResult)init
{
  GEORPFeedbackResult *v2;
  GEORPFeedbackResult *v3;
  GEORPFeedbackResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackResult;
  v2 = -[GEORPFeedbackResult init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackResult)initWithData:(id)a3
{
  GEORPFeedbackResult *v3;
  GEORPFeedbackResult *v4;
  GEORPFeedbackResult *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackResult;
  v3 = -[GEORPFeedbackResult initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSubmissionResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 92) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSubmissionResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasSubmissionResult
{
  -[GEORPFeedbackResult _readSubmissionResult]((uint64_t)self);
  return self->_submissionResult != 0;
}

- (GEORPFeedbackSubmissionResult)submissionResult
{
  -[GEORPFeedbackResult _readSubmissionResult]((uint64_t)self);
  return self->_submissionResult;
}

- (void)setSubmissionResult:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_submissionResult, a3);
}

- (void)_readIdLookupResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 92) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIdLookupResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasIdLookupResult
{
  -[GEORPFeedbackResult _readIdLookupResult]((uint64_t)self);
  return self->_idLookupResult != 0;
}

- (GEORPFeedbackIdLookupResult)idLookupResult
{
  -[GEORPFeedbackResult _readIdLookupResult]((uint64_t)self);
  return self->_idLookupResult;
}

- (void)setIdLookupResult:(id)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  objc_storeStrong((id *)&self->_idLookupResult, a3);
}

- (void)_readQueryResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 92) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQueryResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasQueryResult
{
  -[GEORPFeedbackResult _readQueryResult]((uint64_t)self);
  return self->_queryResult != 0;
}

- (GEORPFeedbackQueryResult)queryResult
{
  -[GEORPFeedbackResult _readQueryResult]((uint64_t)self);
  return self->_queryResult;
}

- (void)setQueryResult:(id)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  objc_storeStrong((id *)&self->_queryResult, a3);
}

- (void)_readImageUploadResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 92) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readImageUploadResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasImageUploadResult
{
  -[GEORPFeedbackResult _readImageUploadResult]((uint64_t)self);
  return self->_imageUploadResult != 0;
}

- (GEORPFeedbackImageUploadResult)imageUploadResult
{
  -[GEORPFeedbackResult _readImageUploadResult]((uint64_t)self);
  return self->_imageUploadResult;
}

- (void)setImageUploadResult:(id)a3
{
  *(_WORD *)&self->_flags |= 0x104u;
  objc_storeStrong((id *)&self->_imageUploadResult, a3);
}

- (void)_readLayoutConfigResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 92) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLayoutConfigResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasLayoutConfigResult
{
  -[GEORPFeedbackResult _readLayoutConfigResult]((uint64_t)self);
  return self->_layoutConfigResult != 0;
}

- (GEORPFeedbackLayoutConfigResult)layoutConfigResult
{
  -[GEORPFeedbackResult _readLayoutConfigResult]((uint64_t)self);
  return self->_layoutConfigResult;
}

- (void)setLayoutConfigResult:(id)a3
{
  *(_WORD *)&self->_flags |= 0x108u;
  objc_storeStrong((id *)&self->_layoutConfigResult, a3);
}

- (void)_readTdmFraudNotificationResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 92) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTdmFraudNotificationResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasTdmFraudNotificationResult
{
  -[GEORPFeedbackResult _readTdmFraudNotificationResult]((uint64_t)self);
  return self->_tdmFraudNotificationResult != 0;
}

- (GEORPFeedbackTdmFraudNotificationResult)tdmFraudNotificationResult
{
  -[GEORPFeedbackResult _readTdmFraudNotificationResult]((uint64_t)self);
  return self->_tdmFraudNotificationResult;
}

- (void)setTdmFraudNotificationResult:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_tdmFraudNotificationResult, a3);
}

- (void)_readLogEventResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 92) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLogEventResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasLogEventResult
{
  -[GEORPFeedbackResult _readLogEventResult]((uint64_t)self);
  return self->_logEventResult != 0;
}

- (GEORPFeedbackLogEventResult)logEventResult
{
  -[GEORPFeedbackResult _readLogEventResult]((uint64_t)self);
  return self->_logEventResult;
}

- (void)setLogEventResult:(id)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  objc_storeStrong((id *)&self->_logEventResult, a3);
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
  v8.super_class = (Class)GEORPFeedbackResult;
  -[GEORPFeedbackResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackResult _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  _QWORD v40[4];
  id v41;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "submissionResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("submissionResult");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("submission_result");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend(a1, "idLookupResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("idLookupResult");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("id_lookup_result");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  objc_msgSend(a1, "queryResult");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("queryResult");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("query_result");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  objc_msgSend(a1, "imageUploadResult");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v17, "jsonRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("imageUploadResult");
    }
    else
    {
      objc_msgSend(v17, "dictionaryRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("image_upload_result");
    }
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  objc_msgSend(a1, "layoutConfigResult");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v21, "jsonRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("layoutConfigResult");
    }
    else
    {
      objc_msgSend(v21, "dictionaryRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("layout_config_result");
    }
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

  }
  objc_msgSend(a1, "tdmFraudNotificationResult");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v25, "jsonRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("tdmFraudNotificationResult");
    }
    else
    {
      objc_msgSend(v25, "dictionaryRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("tdm_fraud_notification_result");
    }
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

  }
  objc_msgSend(a1, "logEventResult");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v29, "jsonRepresentation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("logEventResult");
    }
    else
    {
      objc_msgSend(v29, "dictionaryRepresentation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("log_event_result");
    }
    objc_msgSend(v4, "setObject:forKey:", v31, v32);

  }
  v33 = (void *)a1[2];
  if (v33)
  {
    objc_msgSend(v33, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v34, "count"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __49__GEORPFeedbackResult__dictionaryRepresentation___block_invoke;
      v40[3] = &unk_1E1C00600;
      v37 = v36;
      v41 = v37;
      objc_msgSend(v35, "enumerateKeysAndObjectsUsingBlock:", v40);
      v38 = v37;

      v35 = v38;
    }
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackResult _dictionaryRepresentation:](self, 1);
}

void __49__GEORPFeedbackResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPFeedbackResult)initWithDictionary:(id)a3
{
  return (GEORPFeedbackResult *)-[GEORPFeedbackResult _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEORPFeedbackSubmissionResult *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEORPFeedbackIdLookupResult *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  GEORPFeedbackQueryResult *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  GEORPFeedbackImageUploadResult *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  GEORPFeedbackLayoutConfigResult *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  GEORPFeedbackTdmFraudNotificationResult *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  GEORPFeedbackLogEventResult *v38;
  uint64_t v39;
  void *v40;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("submissionResult");
      else
        v6 = CFSTR("submission_result");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEORPFeedbackSubmissionResult alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEORPFeedbackSubmissionResult initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEORPFeedbackSubmissionResult initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setSubmissionResult:", v9);

      }
      if (a3)
        v11 = CFSTR("idLookupResult");
      else
        v11 = CFSTR("id_lookup_result");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEORPFeedbackIdLookupResult alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEORPFeedbackIdLookupResult initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEORPFeedbackIdLookupResult initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setIdLookupResult:", v14);

      }
      if (a3)
        v16 = CFSTR("queryResult");
      else
        v16 = CFSTR("query_result");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = [GEORPFeedbackQueryResult alloc];
        if ((a3 & 1) != 0)
          v19 = -[GEORPFeedbackQueryResult initWithJSON:](v18, "initWithJSON:", v17);
        else
          v19 = -[GEORPFeedbackQueryResult initWithDictionary:](v18, "initWithDictionary:", v17);
        v20 = (void *)v19;
        objc_msgSend(a1, "setQueryResult:", v19);

      }
      if (a3)
        v21 = CFSTR("imageUploadResult");
      else
        v21 = CFSTR("image_upload_result");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = [GEORPFeedbackImageUploadResult alloc];
        if ((a3 & 1) != 0)
          v24 = -[GEORPFeedbackImageUploadResult initWithJSON:](v23, "initWithJSON:", v22);
        else
          v24 = -[GEORPFeedbackImageUploadResult initWithDictionary:](v23, "initWithDictionary:", v22);
        v25 = (void *)v24;
        objc_msgSend(a1, "setImageUploadResult:", v24);

      }
      if (a3)
        v26 = CFSTR("layoutConfigResult");
      else
        v26 = CFSTR("layout_config_result");
      objc_msgSend(v5, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = [GEORPFeedbackLayoutConfigResult alloc];
        if ((a3 & 1) != 0)
          v29 = -[GEORPFeedbackLayoutConfigResult initWithJSON:](v28, "initWithJSON:", v27);
        else
          v29 = -[GEORPFeedbackLayoutConfigResult initWithDictionary:](v28, "initWithDictionary:", v27);
        v30 = (void *)v29;
        objc_msgSend(a1, "setLayoutConfigResult:", v29);

      }
      if (a3)
        v31 = CFSTR("tdmFraudNotificationResult");
      else
        v31 = CFSTR("tdm_fraud_notification_result");
      objc_msgSend(v5, "objectForKeyedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = [GEORPFeedbackTdmFraudNotificationResult alloc];
        if ((a3 & 1) != 0)
          v34 = -[GEORPFeedbackTdmFraudNotificationResult initWithJSON:](v33, "initWithJSON:", v32);
        else
          v34 = -[GEORPFeedbackTdmFraudNotificationResult initWithDictionary:](v33, "initWithDictionary:", v32);
        v35 = (void *)v34;
        objc_msgSend(a1, "setTdmFraudNotificationResult:", v34);

      }
      if (a3)
        v36 = CFSTR("logEventResult");
      else
        v36 = CFSTR("log_event_result");
      objc_msgSend(v5, "objectForKeyedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = [GEORPFeedbackLogEventResult alloc];
        if ((a3 & 1) != 0)
          v39 = -[GEORPFeedbackLogEventResult initWithJSON:](v38, "initWithJSON:", v37);
        else
          v39 = -[GEORPFeedbackLogEventResult initWithDictionary:](v38, "initWithDictionary:", v37);
        v40 = (void *)v39;
        objc_msgSend(a1, "setLogEventResult:", v39);

      }
    }
  }

  return a1;
}

- (GEORPFeedbackResult)initWithJSON:(id)a3
{
  return (GEORPFeedbackResult *)-[GEORPFeedbackResult _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1817;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1818;
    GEORPFeedbackResultReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPFeedbackResultCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackResultIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackResultReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEORPFeedbackResultIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPFeedbackResult readAll:](self, "readAll:", 0);
    if (self->_submissionResult)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_idLookupResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_queryResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_imageUploadResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_layoutConfigResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_tdmFraudNotificationResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_logEventResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPFeedbackResult _readIdLookupResult]((uint64_t)self);
  if (-[GEORPFeedbackIdLookupResult hasGreenTeaWithValue:](self->_idLookupResult, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPFeedbackResult _readQueryResult]((uint64_t)self);
  return -[GEORPFeedbackQueryResult hasGreenTeaWithValue:](self->_queryResult, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORPFeedbackResult readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 20) = self->_readerMarkPos;
  *((_DWORD *)v5 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_submissionResult)
    objc_msgSend(v5, "setSubmissionResult:");
  if (self->_idLookupResult)
    objc_msgSend(v5, "setIdLookupResult:");
  v4 = v5;
  if (self->_queryResult)
  {
    objc_msgSend(v5, "setQueryResult:");
    v4 = v5;
  }
  if (self->_imageUploadResult)
  {
    objc_msgSend(v5, "setImageUploadResult:");
    v4 = v5;
  }
  if (self->_layoutConfigResult)
  {
    objc_msgSend(v5, "setLayoutConfigResult:");
    v4 = v5;
  }
  if (self->_tdmFraudNotificationResult)
  {
    objc_msgSend(v5, "setTdmFraudNotificationResult:");
    v4 = v5;
  }
  if (self->_logEventResult)
  {
    objc_msgSend(v5, "setLogEventResult:");
    v4 = v5;
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
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPFeedbackResult readAll:](self, "readAll:", 0);
    v8 = -[GEORPFeedbackSubmissionResult copyWithZone:](self->_submissionResult, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v8;

    v10 = -[GEORPFeedbackIdLookupResult copyWithZone:](self->_idLookupResult, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v10;

    v12 = -[GEORPFeedbackQueryResult copyWithZone:](self->_queryResult, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v12;

    v14 = -[GEORPFeedbackImageUploadResult copyWithZone:](self->_imageUploadResult, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v14;

    v16 = -[GEORPFeedbackLayoutConfigResult copyWithZone:](self->_layoutConfigResult, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v16;

    v18 = -[GEORPFeedbackTdmFraudNotificationResult copyWithZone:](self->_tdmFraudNotificationResult, "copyWithZone:", a3);
    v19 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v18;

    v20 = -[GEORPFeedbackLogEventResult copyWithZone:](self->_logEventResult, "copyWithZone:", a3);
    v21 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v20;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPFeedbackResultReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEORPFeedbackSubmissionResult *submissionResult;
  GEORPFeedbackIdLookupResult *idLookupResult;
  GEORPFeedbackQueryResult *queryResult;
  GEORPFeedbackImageUploadResult *imageUploadResult;
  GEORPFeedbackLayoutConfigResult *layoutConfigResult;
  GEORPFeedbackTdmFraudNotificationResult *tdmFraudNotificationResult;
  GEORPFeedbackLogEventResult *logEventResult;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEORPFeedbackResult readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  submissionResult = self->_submissionResult;
  if ((unint64_t)submissionResult | v4[8])
  {
    if (!-[GEORPFeedbackSubmissionResult isEqual:](submissionResult, "isEqual:"))
      goto LABEL_16;
  }
  if (((idLookupResult = self->_idLookupResult, !((unint64_t)idLookupResult | v4[3]))
     || -[GEORPFeedbackIdLookupResult isEqual:](idLookupResult, "isEqual:"))
    && ((queryResult = self->_queryResult, !((unint64_t)queryResult | v4[7]))
     || -[GEORPFeedbackQueryResult isEqual:](queryResult, "isEqual:"))
    && ((imageUploadResult = self->_imageUploadResult, !((unint64_t)imageUploadResult | v4[4]))
     || -[GEORPFeedbackImageUploadResult isEqual:](imageUploadResult, "isEqual:"))
    && ((layoutConfigResult = self->_layoutConfigResult, !((unint64_t)layoutConfigResult | v4[5]))
     || -[GEORPFeedbackLayoutConfigResult isEqual:](layoutConfigResult, "isEqual:"))
    && ((tdmFraudNotificationResult = self->_tdmFraudNotificationResult,
         !((unint64_t)tdmFraudNotificationResult | v4[9]))
     || -[GEORPFeedbackTdmFraudNotificationResult isEqual:](tdmFraudNotificationResult, "isEqual:")))
  {
    logEventResult = self->_logEventResult;
    if ((unint64_t)logEventResult | v4[6])
      v12 = -[GEORPFeedbackLogEventResult isEqual:](logEventResult, "isEqual:");
    else
      v12 = 1;
  }
  else
  {
LABEL_16:
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  -[GEORPFeedbackResult readAll:](self, "readAll:", 1);
  v3 = -[GEORPFeedbackSubmissionResult hash](self->_submissionResult, "hash");
  v4 = -[GEORPFeedbackIdLookupResult hash](self->_idLookupResult, "hash") ^ v3;
  v5 = -[GEORPFeedbackQueryResult hash](self->_queryResult, "hash");
  v6 = v4 ^ v5 ^ -[GEORPFeedbackImageUploadResult hash](self->_imageUploadResult, "hash");
  v7 = -[GEORPFeedbackLayoutConfigResult hash](self->_layoutConfigResult, "hash");
  v8 = v7 ^ -[GEORPFeedbackTdmFraudNotificationResult hash](self->_tdmFraudNotificationResult, "hash");
  return v6 ^ v8 ^ -[GEORPFeedbackLogEventResult hash](self->_logEventResult, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEORPFeedbackSubmissionResult *submissionResult;
  uint64_t v5;
  GEORPFeedbackIdLookupResult *idLookupResult;
  uint64_t v7;
  GEORPFeedbackQueryResult *queryResult;
  uint64_t v9;
  GEORPFeedbackImageUploadResult *imageUploadResult;
  uint64_t v11;
  GEORPFeedbackLayoutConfigResult *layoutConfigResult;
  uint64_t v13;
  GEORPFeedbackTdmFraudNotificationResult *tdmFraudNotificationResult;
  uint64_t v15;
  GEORPFeedbackLogEventResult *logEventResult;
  uint64_t v17;
  _QWORD *v18;

  v18 = a3;
  objc_msgSend(v18, "readAll:", 0);
  submissionResult = self->_submissionResult;
  v5 = v18[8];
  if (submissionResult)
  {
    if (v5)
      -[GEORPFeedbackSubmissionResult mergeFrom:](submissionResult, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEORPFeedbackResult setSubmissionResult:](self, "setSubmissionResult:");
  }
  idLookupResult = self->_idLookupResult;
  v7 = v18[3];
  if (idLookupResult)
  {
    if (v7)
      -[GEORPFeedbackIdLookupResult mergeFrom:](idLookupResult, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEORPFeedbackResult setIdLookupResult:](self, "setIdLookupResult:");
  }
  queryResult = self->_queryResult;
  v9 = v18[7];
  if (queryResult)
  {
    if (v9)
      -[GEORPFeedbackQueryResult mergeFrom:](queryResult, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEORPFeedbackResult setQueryResult:](self, "setQueryResult:");
  }
  imageUploadResult = self->_imageUploadResult;
  v11 = v18[4];
  if (imageUploadResult)
  {
    if (v11)
      -[GEORPFeedbackImageUploadResult mergeFrom:](imageUploadResult, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEORPFeedbackResult setImageUploadResult:](self, "setImageUploadResult:");
  }
  layoutConfigResult = self->_layoutConfigResult;
  v13 = v18[5];
  if (layoutConfigResult)
  {
    if (v13)
      -[GEORPFeedbackLayoutConfigResult mergeFrom:](layoutConfigResult, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEORPFeedbackResult setLayoutConfigResult:](self, "setLayoutConfigResult:");
  }
  tdmFraudNotificationResult = self->_tdmFraudNotificationResult;
  v15 = v18[9];
  if (tdmFraudNotificationResult)
  {
    if (v15)
      -[GEORPFeedbackTdmFraudNotificationResult mergeFrom:](tdmFraudNotificationResult, "mergeFrom:");
  }
  else if (v15)
  {
    -[GEORPFeedbackResult setTdmFraudNotificationResult:](self, "setTdmFraudNotificationResult:");
  }
  logEventResult = self->_logEventResult;
  v17 = v18[6];
  if (logEventResult)
  {
    if (v17)
      -[GEORPFeedbackLogEventResult mergeFrom:](logEventResult, "mergeFrom:");
  }
  else if (v17)
  {
    -[GEORPFeedbackResult setLogEventResult:](self, "setLogEventResult:");
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEORPFeedbackResultReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1821);
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
  *(_WORD *)&self->_flags |= 0x101u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORPFeedbackResult readAll:](self, "readAll:", 0);
    -[GEORPFeedbackSubmissionResult clearUnknownFields:](self->_submissionResult, "clearUnknownFields:", 1);
    -[GEORPFeedbackIdLookupResult clearUnknownFields:](self->_idLookupResult, "clearUnknownFields:", 1);
    -[GEORPFeedbackQueryResult clearUnknownFields:](self->_queryResult, "clearUnknownFields:", 1);
    -[GEORPFeedbackImageUploadResult clearUnknownFields:](self->_imageUploadResult, "clearUnknownFields:", 1);
    -[GEORPFeedbackTdmFraudNotificationResult clearUnknownFields:](self->_tdmFraudNotificationResult, "clearUnknownFields:", 1);
    -[GEORPFeedbackLogEventResult clearUnknownFields:](self->_logEventResult, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tdmFraudNotificationResult, 0);
  objc_storeStrong((id *)&self->_submissionResult, 0);
  objc_storeStrong((id *)&self->_queryResult, 0);
  objc_storeStrong((id *)&self->_logEventResult, 0);
  objc_storeStrong((id *)&self->_layoutConfigResult, 0);
  objc_storeStrong((id *)&self->_imageUploadResult, 0);
  objc_storeStrong((id *)&self->_idLookupResult, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
