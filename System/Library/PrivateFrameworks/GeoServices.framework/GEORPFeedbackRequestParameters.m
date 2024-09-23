@implementation GEORPFeedbackRequestParameters

- (GEORPFeedbackRequestParameters)init
{
  GEORPFeedbackRequestParameters *v2;
  GEORPFeedbackRequestParameters *v3;
  GEORPFeedbackRequestParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackRequestParameters;
  v2 = -[GEORPFeedbackRequestParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackRequestParameters)initWithData:(id)a3
{
  GEORPFeedbackRequestParameters *v3;
  GEORPFeedbackRequestParameters *v4;
  GEORPFeedbackRequestParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackRequestParameters;
  v3 = -[GEORPFeedbackRequestParameters initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSubmissionParameters
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
        GEORPFeedbackRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSubmissionParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasSubmissionParameters
{
  -[GEORPFeedbackRequestParameters _readSubmissionParameters]((uint64_t)self);
  return self->_submissionParameters != 0;
}

- (GEORPFeedbackSubmissionParameters)submissionParameters
{
  -[GEORPFeedbackRequestParameters _readSubmissionParameters]((uint64_t)self);
  return self->_submissionParameters;
}

- (void)setSubmissionParameters:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_submissionParameters, a3);
}

- (void)_readIdLookupParameters
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
        GEORPFeedbackRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIdLookupParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasIdLookupParameters
{
  -[GEORPFeedbackRequestParameters _readIdLookupParameters]((uint64_t)self);
  return self->_idLookupParameters != 0;
}

- (GEORPFeedbackIdLookupParameters)idLookupParameters
{
  -[GEORPFeedbackRequestParameters _readIdLookupParameters]((uint64_t)self);
  return self->_idLookupParameters;
}

- (void)setIdLookupParameters:(id)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  objc_storeStrong((id *)&self->_idLookupParameters, a3);
}

- (void)_readQueryParameters
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
        GEORPFeedbackRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQueryParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasQueryParameters
{
  -[GEORPFeedbackRequestParameters _readQueryParameters]((uint64_t)self);
  return self->_queryParameters != 0;
}

- (GEORPFeedbackQueryParameters)queryParameters
{
  -[GEORPFeedbackRequestParameters _readQueryParameters]((uint64_t)self);
  return self->_queryParameters;
}

- (void)setQueryParameters:(id)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  objc_storeStrong((id *)&self->_queryParameters, a3);
}

- (void)_readImageUploadParameters
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
        GEORPFeedbackRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readImageUploadParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasImageUploadParameters
{
  -[GEORPFeedbackRequestParameters _readImageUploadParameters]((uint64_t)self);
  return self->_imageUploadParameters != 0;
}

- (GEORPFeedbackImageUploadParameters)imageUploadParameters
{
  -[GEORPFeedbackRequestParameters _readImageUploadParameters]((uint64_t)self);
  return self->_imageUploadParameters;
}

- (void)setImageUploadParameters:(id)a3
{
  *(_WORD *)&self->_flags |= 0x104u;
  objc_storeStrong((id *)&self->_imageUploadParameters, a3);
}

- (void)_readLayoutConfigParameters
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
        GEORPFeedbackRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLayoutConfigParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasLayoutConfigParameters
{
  -[GEORPFeedbackRequestParameters _readLayoutConfigParameters]((uint64_t)self);
  return self->_layoutConfigParameters != 0;
}

- (GEORPFeedbackLayoutConfigParameters)layoutConfigParameters
{
  -[GEORPFeedbackRequestParameters _readLayoutConfigParameters]((uint64_t)self);
  return self->_layoutConfigParameters;
}

- (void)setLayoutConfigParameters:(id)a3
{
  *(_WORD *)&self->_flags |= 0x108u;
  objc_storeStrong((id *)&self->_layoutConfigParameters, a3);
}

- (void)_readTdmFraudNotificationParameters
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
        GEORPFeedbackRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTdmFraudNotificationParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasTdmFraudNotificationParameters
{
  -[GEORPFeedbackRequestParameters _readTdmFraudNotificationParameters]((uint64_t)self);
  return self->_tdmFraudNotificationParameters != 0;
}

- (GEORPTdmFraudNotificationParameters)tdmFraudNotificationParameters
{
  -[GEORPFeedbackRequestParameters _readTdmFraudNotificationParameters]((uint64_t)self);
  return self->_tdmFraudNotificationParameters;
}

- (void)setTdmFraudNotificationParameters:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_tdmFraudNotificationParameters, a3);
}

- (void)_readLogEventParameters
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
        GEORPFeedbackRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLogEventParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasLogEventParameters
{
  -[GEORPFeedbackRequestParameters _readLogEventParameters]((uint64_t)self);
  return self->_logEventParameters != 0;
}

- (GEORPFeedbackLogEventParameters)logEventParameters
{
  -[GEORPFeedbackRequestParameters _readLogEventParameters]((uint64_t)self);
  return self->_logEventParameters;
}

- (void)setLogEventParameters:(id)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  objc_storeStrong((id *)&self->_logEventParameters, a3);
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
  v8.super_class = (Class)GEORPFeedbackRequestParameters;
  -[GEORPFeedbackRequestParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackRequestParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackRequestParameters _dictionaryRepresentation:](self, 0);
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
  objc_msgSend(a1, "submissionParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("submissionParameters");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("submission_parameters");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend(a1, "idLookupParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("idLookupParameters");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("id_lookup_parameters");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  objc_msgSend(a1, "queryParameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("queryParameters");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("query_parameters");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  objc_msgSend(a1, "imageUploadParameters");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v17, "jsonRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("imageUploadParameters");
    }
    else
    {
      objc_msgSend(v17, "dictionaryRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("image_upload_parameters");
    }
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  objc_msgSend(a1, "layoutConfigParameters");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v21, "jsonRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("layoutConfigParameters");
    }
    else
    {
      objc_msgSend(v21, "dictionaryRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("layout_config_parameters");
    }
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

  }
  objc_msgSend(a1, "tdmFraudNotificationParameters");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v25, "jsonRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("tdmFraudNotificationParameters");
    }
    else
    {
      objc_msgSend(v25, "dictionaryRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("tdm_fraud_notification_parameters");
    }
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

  }
  objc_msgSend(a1, "logEventParameters");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v29, "jsonRepresentation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("logEventParameters");
    }
    else
    {
      objc_msgSend(v29, "dictionaryRepresentation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("log_event_parameters");
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
      v40[2] = __60__GEORPFeedbackRequestParameters__dictionaryRepresentation___block_invoke;
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
  return -[GEORPFeedbackRequestParameters _dictionaryRepresentation:](self, 1);
}

void __60__GEORPFeedbackRequestParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPFeedbackRequestParameters)initWithDictionary:(id)a3
{
  return (GEORPFeedbackRequestParameters *)-[GEORPFeedbackRequestParameters _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEORPFeedbackSubmissionParameters *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEORPFeedbackIdLookupParameters *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  GEORPFeedbackQueryParameters *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  GEORPFeedbackImageUploadParameters *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  GEORPFeedbackLayoutConfigParameters *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  GEORPTdmFraudNotificationParameters *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  GEORPFeedbackLogEventParameters *v38;
  uint64_t v39;
  void *v40;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("submissionParameters");
      else
        v6 = CFSTR("submission_parameters");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEORPFeedbackSubmissionParameters alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEORPFeedbackSubmissionParameters initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEORPFeedbackSubmissionParameters initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setSubmissionParameters:", v9);

      }
      if (a3)
        v11 = CFSTR("idLookupParameters");
      else
        v11 = CFSTR("id_lookup_parameters");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEORPFeedbackIdLookupParameters alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEORPFeedbackIdLookupParameters initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEORPFeedbackIdLookupParameters initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setIdLookupParameters:", v14);

      }
      if (a3)
        v16 = CFSTR("queryParameters");
      else
        v16 = CFSTR("query_parameters");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = [GEORPFeedbackQueryParameters alloc];
        if ((a3 & 1) != 0)
          v19 = -[GEORPFeedbackQueryParameters initWithJSON:](v18, "initWithJSON:", v17);
        else
          v19 = -[GEORPFeedbackQueryParameters initWithDictionary:](v18, "initWithDictionary:", v17);
        v20 = (void *)v19;
        objc_msgSend(a1, "setQueryParameters:", v19);

      }
      if (a3)
        v21 = CFSTR("imageUploadParameters");
      else
        v21 = CFSTR("image_upload_parameters");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = [GEORPFeedbackImageUploadParameters alloc];
        if ((a3 & 1) != 0)
          v24 = -[GEORPFeedbackImageUploadParameters initWithJSON:](v23, "initWithJSON:", v22);
        else
          v24 = -[GEORPFeedbackImageUploadParameters initWithDictionary:](v23, "initWithDictionary:", v22);
        v25 = (void *)v24;
        objc_msgSend(a1, "setImageUploadParameters:", v24);

      }
      if (a3)
        v26 = CFSTR("layoutConfigParameters");
      else
        v26 = CFSTR("layout_config_parameters");
      objc_msgSend(v5, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = [GEORPFeedbackLayoutConfigParameters alloc];
        if ((a3 & 1) != 0)
          v29 = -[GEORPFeedbackLayoutConfigParameters initWithJSON:](v28, "initWithJSON:", v27);
        else
          v29 = -[GEORPFeedbackLayoutConfigParameters initWithDictionary:](v28, "initWithDictionary:", v27);
        v30 = (void *)v29;
        objc_msgSend(a1, "setLayoutConfigParameters:", v29);

      }
      if (a3)
        v31 = CFSTR("tdmFraudNotificationParameters");
      else
        v31 = CFSTR("tdm_fraud_notification_parameters");
      objc_msgSend(v5, "objectForKeyedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = [GEORPTdmFraudNotificationParameters alloc];
        if ((a3 & 1) != 0)
          v34 = -[GEORPTdmFraudNotificationParameters initWithJSON:](v33, "initWithJSON:", v32);
        else
          v34 = -[GEORPTdmFraudNotificationParameters initWithDictionary:](v33, "initWithDictionary:", v32);
        v35 = (void *)v34;
        objc_msgSend(a1, "setTdmFraudNotificationParameters:", v34);

      }
      if (a3)
        v36 = CFSTR("logEventParameters");
      else
        v36 = CFSTR("log_event_parameters");
      objc_msgSend(v5, "objectForKeyedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = [GEORPFeedbackLogEventParameters alloc];
        if ((a3 & 1) != 0)
          v39 = -[GEORPFeedbackLogEventParameters initWithJSON:](v38, "initWithJSON:", v37);
        else
          v39 = -[GEORPFeedbackLogEventParameters initWithDictionary:](v38, "initWithDictionary:", v37);
        v40 = (void *)v39;
        objc_msgSend(a1, "setLogEventParameters:", v39);

      }
    }
  }

  return a1;
}

- (GEORPFeedbackRequestParameters)initWithJSON:(id)a3
{
  return (GEORPFeedbackRequestParameters *)-[GEORPFeedbackRequestParameters _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1667_0;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1668_0;
    GEORPFeedbackRequestParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPFeedbackRequestParametersCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackRequestParametersIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackRequestParametersReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && !_GEORPFeedbackRequestParametersIsDirty((uint64_t)self))
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
    -[GEORPFeedbackRequestParameters readAll:](self, "readAll:", 0);
    if (self->_submissionParameters)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_idLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_queryParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_imageUploadParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_layoutConfigParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_tdmFraudNotificationParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_logEventParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEORPFeedbackRequestParametersClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPFeedbackRequestParameters _readImageUploadParameters]((uint64_t)self);
  if (-[GEORPFeedbackImageUploadParameters hasGreenTeaWithValue:](self->_imageUploadParameters, "hasGreenTeaWithValue:", v3))
  {
    return 1;
  }
  -[GEORPFeedbackRequestParameters _readLayoutConfigParameters]((uint64_t)self);
  if (-[GEORPFeedbackLayoutConfigParameters hasGreenTeaWithValue:](self->_layoutConfigParameters, "hasGreenTeaWithValue:", v3))
  {
    return 1;
  }
  -[GEORPFeedbackRequestParameters _readSubmissionParameters]((uint64_t)self);
  return -[GEORPFeedbackSubmissionParameters hasGreenTeaWithValue:](self->_submissionParameters, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORPFeedbackRequestParameters readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 20) = self->_readerMarkPos;
  *((_DWORD *)v5 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_submissionParameters)
    objc_msgSend(v5, "setSubmissionParameters:");
  if (self->_idLookupParameters)
    objc_msgSend(v5, "setIdLookupParameters:");
  v4 = v5;
  if (self->_queryParameters)
  {
    objc_msgSend(v5, "setQueryParameters:");
    v4 = v5;
  }
  if (self->_imageUploadParameters)
  {
    objc_msgSend(v5, "setImageUploadParameters:");
    v4 = v5;
  }
  if (self->_layoutConfigParameters)
  {
    objc_msgSend(v5, "setLayoutConfigParameters:");
    v4 = v5;
  }
  if (self->_tdmFraudNotificationParameters)
  {
    objc_msgSend(v5, "setTdmFraudNotificationParameters:");
    v4 = v5;
  }
  if (self->_logEventParameters)
  {
    objc_msgSend(v5, "setLogEventParameters:");
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
    -[GEORPFeedbackRequestParameters readAll:](self, "readAll:", 0);
    v8 = -[GEORPFeedbackSubmissionParameters copyWithZone:](self->_submissionParameters, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v8;

    v10 = -[GEORPFeedbackIdLookupParameters copyWithZone:](self->_idLookupParameters, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v10;

    v12 = -[GEORPFeedbackQueryParameters copyWithZone:](self->_queryParameters, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v12;

    v14 = -[GEORPFeedbackImageUploadParameters copyWithZone:](self->_imageUploadParameters, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v14;

    v16 = -[GEORPFeedbackLayoutConfigParameters copyWithZone:](self->_layoutConfigParameters, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v16;

    v18 = -[GEORPTdmFraudNotificationParameters copyWithZone:](self->_tdmFraudNotificationParameters, "copyWithZone:", a3);
    v19 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v18;

    v20 = -[GEORPFeedbackLogEventParameters copyWithZone:](self->_logEventParameters, "copyWithZone:", a3);
    v21 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v20;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPFeedbackRequestParametersReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEORPFeedbackSubmissionParameters *submissionParameters;
  GEORPFeedbackIdLookupParameters *idLookupParameters;
  GEORPFeedbackQueryParameters *queryParameters;
  GEORPFeedbackImageUploadParameters *imageUploadParameters;
  GEORPFeedbackLayoutConfigParameters *layoutConfigParameters;
  GEORPTdmFraudNotificationParameters *tdmFraudNotificationParameters;
  GEORPFeedbackLogEventParameters *logEventParameters;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEORPFeedbackRequestParameters readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  submissionParameters = self->_submissionParameters;
  if ((unint64_t)submissionParameters | v4[8])
  {
    if (!-[GEORPFeedbackSubmissionParameters isEqual:](submissionParameters, "isEqual:"))
      goto LABEL_16;
  }
  if (((idLookupParameters = self->_idLookupParameters, !((unint64_t)idLookupParameters | v4[3]))
     || -[GEORPFeedbackIdLookupParameters isEqual:](idLookupParameters, "isEqual:"))
    && ((queryParameters = self->_queryParameters, !((unint64_t)queryParameters | v4[7]))
     || -[GEORPFeedbackQueryParameters isEqual:](queryParameters, "isEqual:"))
    && ((imageUploadParameters = self->_imageUploadParameters, !((unint64_t)imageUploadParameters | v4[4]))
     || -[GEORPFeedbackImageUploadParameters isEqual:](imageUploadParameters, "isEqual:"))
    && ((layoutConfigParameters = self->_layoutConfigParameters, !((unint64_t)layoutConfigParameters | v4[5]))
     || -[GEORPFeedbackLayoutConfigParameters isEqual:](layoutConfigParameters, "isEqual:"))
    && ((tdmFraudNotificationParameters = self->_tdmFraudNotificationParameters,
         !((unint64_t)tdmFraudNotificationParameters | v4[9]))
     || -[GEORPTdmFraudNotificationParameters isEqual:](tdmFraudNotificationParameters, "isEqual:")))
  {
    logEventParameters = self->_logEventParameters;
    if ((unint64_t)logEventParameters | v4[6])
      v12 = -[GEORPFeedbackLogEventParameters isEqual:](logEventParameters, "isEqual:");
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

  -[GEORPFeedbackRequestParameters readAll:](self, "readAll:", 1);
  v3 = -[GEORPFeedbackSubmissionParameters hash](self->_submissionParameters, "hash");
  v4 = -[GEORPFeedbackIdLookupParameters hash](self->_idLookupParameters, "hash") ^ v3;
  v5 = -[GEORPFeedbackQueryParameters hash](self->_queryParameters, "hash");
  v6 = v4 ^ v5 ^ -[GEORPFeedbackImageUploadParameters hash](self->_imageUploadParameters, "hash");
  v7 = -[GEORPFeedbackLayoutConfigParameters hash](self->_layoutConfigParameters, "hash");
  v8 = v7 ^ -[GEORPTdmFraudNotificationParameters hash](self->_tdmFraudNotificationParameters, "hash");
  return v6 ^ v8 ^ -[GEORPFeedbackLogEventParameters hash](self->_logEventParameters, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEORPFeedbackSubmissionParameters *submissionParameters;
  uint64_t v5;
  GEORPFeedbackIdLookupParameters *idLookupParameters;
  uint64_t v7;
  GEORPFeedbackQueryParameters *queryParameters;
  uint64_t v9;
  GEORPFeedbackImageUploadParameters *imageUploadParameters;
  uint64_t v11;
  GEORPFeedbackLayoutConfigParameters *layoutConfigParameters;
  uint64_t v13;
  GEORPTdmFraudNotificationParameters *tdmFraudNotificationParameters;
  uint64_t v15;
  GEORPFeedbackLogEventParameters *logEventParameters;
  uint64_t v17;
  _QWORD *v18;

  v18 = a3;
  objc_msgSend(v18, "readAll:", 0);
  submissionParameters = self->_submissionParameters;
  v5 = v18[8];
  if (submissionParameters)
  {
    if (v5)
      -[GEORPFeedbackSubmissionParameters mergeFrom:](submissionParameters, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEORPFeedbackRequestParameters setSubmissionParameters:](self, "setSubmissionParameters:");
  }
  idLookupParameters = self->_idLookupParameters;
  v7 = v18[3];
  if (idLookupParameters)
  {
    if (v7)
      -[GEORPFeedbackIdLookupParameters mergeFrom:](idLookupParameters, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEORPFeedbackRequestParameters setIdLookupParameters:](self, "setIdLookupParameters:");
  }
  queryParameters = self->_queryParameters;
  v9 = v18[7];
  if (queryParameters)
  {
    if (v9)
      -[GEORPFeedbackQueryParameters mergeFrom:](queryParameters, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEORPFeedbackRequestParameters setQueryParameters:](self, "setQueryParameters:");
  }
  imageUploadParameters = self->_imageUploadParameters;
  v11 = v18[4];
  if (imageUploadParameters)
  {
    if (v11)
      -[GEORPFeedbackImageUploadParameters mergeFrom:](imageUploadParameters, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEORPFeedbackRequestParameters setImageUploadParameters:](self, "setImageUploadParameters:");
  }
  layoutConfigParameters = self->_layoutConfigParameters;
  v13 = v18[5];
  if (layoutConfigParameters)
  {
    if (v13)
      -[GEORPFeedbackLayoutConfigParameters mergeFrom:](layoutConfigParameters, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEORPFeedbackRequestParameters setLayoutConfigParameters:](self, "setLayoutConfigParameters:");
  }
  tdmFraudNotificationParameters = self->_tdmFraudNotificationParameters;
  v15 = v18[9];
  if (tdmFraudNotificationParameters)
  {
    if (v15)
      -[GEORPTdmFraudNotificationParameters mergeFrom:](tdmFraudNotificationParameters, "mergeFrom:");
  }
  else if (v15)
  {
    -[GEORPFeedbackRequestParameters setTdmFraudNotificationParameters:](self, "setTdmFraudNotificationParameters:");
  }
  logEventParameters = self->_logEventParameters;
  v17 = v18[6];
  if (logEventParameters)
  {
    if (v17)
      -[GEORPFeedbackLogEventParameters mergeFrom:](logEventParameters, "mergeFrom:");
  }
  else if (v17)
  {
    -[GEORPFeedbackRequestParameters setLogEventParameters:](self, "setLogEventParameters:");
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
      GEORPFeedbackRequestParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1671_0);
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
    -[GEORPFeedbackRequestParameters readAll:](self, "readAll:", 0);
    -[GEORPFeedbackSubmissionParameters clearUnknownFields:](self->_submissionParameters, "clearUnknownFields:", 1);
    -[GEORPFeedbackIdLookupParameters clearUnknownFields:](self->_idLookupParameters, "clearUnknownFields:", 1);
    -[GEORPFeedbackQueryParameters clearUnknownFields:](self->_queryParameters, "clearUnknownFields:", 1);
    -[GEORPFeedbackImageUploadParameters clearUnknownFields:](self->_imageUploadParameters, "clearUnknownFields:", 1);
    -[GEORPTdmFraudNotificationParameters clearUnknownFields:](self->_tdmFraudNotificationParameters, "clearUnknownFields:", 1);
    -[GEORPFeedbackLogEventParameters clearUnknownFields:](self->_logEventParameters, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tdmFraudNotificationParameters, 0);
  objc_storeStrong((id *)&self->_submissionParameters, 0);
  objc_storeStrong((id *)&self->_queryParameters, 0);
  objc_storeStrong((id *)&self->_logEventParameters, 0);
  objc_storeStrong((id *)&self->_layoutConfigParameters, 0);
  objc_storeStrong((id *)&self->_imageUploadParameters, 0);
  objc_storeStrong((id *)&self->_idLookupParameters, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (BOOL)isPOIEnrichment
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  unint64_t v8;
  int v9;

  -[GEORPFeedbackRequestParameters submissionParameters](self, "submissionParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackRequestParameters imageUploadParameters](self, "imageUploadParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackRequestParameters queryParameters](self, "queryParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v7 = objc_msgSend(v4, "isEnrichment");
  }
  else if (v3)
  {
    v7 = objc_msgSend(v3, "type") == 10;
  }
  else if (v5 && objc_msgSend(v5, "feedbackComponentTypesCount"))
  {
    v8 = 0;
    do
    {
      v9 = objc_msgSend(v6, "feedbackComponentTypeAtIndex:", v8);
      v7 = v9 == 4;
      if (v9 == 4)
        break;
      ++v8;
    }
    while (v8 < objc_msgSend(v6, "feedbackComponentTypesCount"));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (GEORPFeedbackRequestParameters)initWithMerchantIndustryCode:(int64_t)a3 mapsIdentifier:(unint64_t)a4 merchantName:(id)a5 merchantRawName:(id)a6 merchantIndustryCategory:(id)a7 merchantURL:(id)a8 merchantFormattedAddress:(id)a9 transactionTime:(double)a10 transactionType:(id)a11 transactionLocation:(id)a12 merchantBankTransactionInfo:(id)a13
{
  double var1;
  double var0;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  GEORPFeedbackRequestParameters *v27;
  GEORPFeedbackSubmissionParameters *v28;
  void *v29;
  GEORPFeedbackCommonContext *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  unint64_t v35;
  void *v36;
  double Current;
  void *v38;
  void *v39;
  GEORPFeedbackDetails *v40;
  void *v41;
  GEORPMerchantLookupFeedback *v42;
  void *v43;
  void *v44;
  GEORPMerchantLookupContext *v45;
  GEOPDMapsIdentifier *v46;
  GEOPDShardedId *v47;
  void *v48;
  void *v49;
  void *v50;
  unint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  GEOLocation *v58;
  void *v59;
  void *v60;
  void *v61;
  id v63;
  id v64;
  id v65;
  objc_super v66;

  var1 = a12.var1;
  var0 = a12.var0;
  v65 = a5;
  v64 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a11;
  v26 = a13;
  v66.receiver = self;
  v66.super_class = (Class)GEORPFeedbackRequestParameters;
  v27 = -[GEORPFeedbackRequestParameters init](&v66, sel_init);
  if (v27)
  {
    v28 = objc_alloc_init(GEORPFeedbackSubmissionParameters);
    -[GEORPFeedbackRequestParameters setSubmissionParameters:](v27, "setSubmissionParameters:", v28);

    -[GEORPFeedbackRequestParameters submissionParameters](v27, "submissionParameters");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setType:", 7);

    v30 = objc_alloc_init(GEORPFeedbackCommonContext);
    -[GEORPFeedbackRequestParameters submissionParameters](v27, "submissionParameters");
    v63 = v26;
    v31 = v25;
    v32 = v24;
    v33 = v23;
    v34 = v22;
    v35 = a4;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setCommonContext:", v30);

    Current = CFAbsoluteTimeGetCurrent();
    -[GEORPFeedbackRequestParameters submissionParameters](v27, "submissionParameters");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "commonContext");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setClientCreatedAt:", Current);

    v40 = objc_alloc_init(GEORPFeedbackDetails);
    -[GEORPFeedbackRequestParameters submissionParameters](v27, "submissionParameters");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setDetails:", v40);

    v42 = objc_alloc_init(GEORPMerchantLookupFeedback);
    -[GEORPFeedbackRequestParameters submissionParameters](v27, "submissionParameters");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "details");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setMerchantLookupFeedback:", v42);

    v45 = objc_alloc_init(GEORPMerchantLookupContext);
    -[GEORPMerchantLookupContext setMerchantIndustryCode:](v45, "setMerchantIndustryCode:", a3);
    v46 = objc_alloc_init(GEOPDMapsIdentifier);
    -[GEORPMerchantLookupContext setMerchantId:](v45, "setMerchantId:", v46);

    v47 = objc_alloc_init(GEOPDShardedId);
    -[GEORPMerchantLookupContext merchantId](v45, "merchantId");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setShardedId:", v47);

    -[GEORPMerchantLookupContext merchantId](v45, "merchantId");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "shardedId");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v35;
    v22 = v34;
    v23 = v33;
    v24 = v32;
    v25 = v31;
    v26 = v63;
    objc_msgSend(v50, "setMuid:", v51);

    v52 = (void *)objc_msgSend(v65, "copy");
    -[GEORPMerchantLookupContext setMerchantName:](v45, "setMerchantName:", v52);

    v53 = (void *)objc_msgSend(v64, "copy");
    -[GEORPMerchantLookupContext setMerchantRawName:](v45, "setMerchantRawName:", v53);

    v54 = (void *)objc_msgSend(v22, "copy");
    -[GEORPMerchantLookupContext setMerchantIndustryCategory:](v45, "setMerchantIndustryCategory:", v54);

    v55 = (void *)objc_msgSend(v23, "copy");
    -[GEORPMerchantLookupContext setMerchantUrl:](v45, "setMerchantUrl:", v55);

    v56 = (void *)objc_msgSend(v24, "copy");
    -[GEORPMerchantLookupContext setMerchantFormattedAddress:](v45, "setMerchantFormattedAddress:", v56);

    -[GEORPMerchantLookupContext setTransactionTime:](v45, "setTransactionTime:", a10);
    v57 = (void *)objc_msgSend(v25, "copy");
    -[GEORPMerchantLookupContext setTransactionType:](v45, "setTransactionType:", v57);

    v58 = -[GEOLocation initWithGEOCoordinate:]([GEOLocation alloc], "initWithGEOCoordinate:", var0, var1);
    -[GEORPMerchantLookupContext setTransactionLocation:](v45, "setTransactionLocation:", v58);

    -[GEORPMerchantLookupContext setMerchantBankTransactionInfo:](v45, "setMerchantBankTransactionInfo:", v63);
    -[GEORPFeedbackRequestParameters submissionParameters](v27, "submissionParameters");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "details");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "merchantLookupFeedback");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setContext:", v45);

  }
  return v27;
}

- (id)initForRunningTrackIssue:(int)a3 trackCoordinateLatitude:(double)a4 trackCoordinateLongitude:(double)a5 trackFeatureID:(id)a6 nameOfTrack:(id)a7 numberOfLanes:(id)a8 comment:(id)a9
{
  uint64_t v14;
  id v16;
  id v17;
  id v18;
  id v19;
  GEORPFeedbackRequestParameters *v20;
  GEORPFeedbackSubmissionParameters *v21;
  void *v22;
  GEORPFeedbackCommonContext *v23;
  void *v24;
  double Current;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  GEORPMapLocation *v30;
  void *v31;
  void *v32;
  GEOLatLng *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  GEORPFeedbackDetails *v45;
  void *v46;
  GEORPRunningTrackFeedback *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  GEORPFeedbackDynamicForm *v53;
  GEORPFeedbackFormField *v54;
  GEORPFeedbackFieldValue *v55;
  void *v56;
  GEORPFeedbackSingleSelectField *v57;
  void *v58;
  GEORPFeedbackFieldOption *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  __CFString *v65;
  void *v66;
  void *v67;
  void *v68;
  GEORPFeedbackFormField *v69;
  GEORPFeedbackFieldValue *v70;
  void *v71;
  GEORPFeedbackTextField *v72;
  void *v73;
  void *v74;
  void *v75;
  GEORPFeedbackFormField *v76;
  GEORPFeedbackFieldValue *v77;
  void *v78;
  GEORPFeedbackIntField *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  GEORPFeedbackFormField *v84;
  GEORPFeedbackFieldValue *v85;
  void *v86;
  GEORPFeedbackTextField *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v93;
  id v94;
  objc_super v95;

  v14 = *(_QWORD *)&a3;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v95.receiver = self;
  v95.super_class = (Class)GEORPFeedbackRequestParameters;
  v20 = -[GEORPFeedbackRequestParameters init](&v95, sel_init);
  if (!v20)
    goto LABEL_175;
  v94 = v17;
  v21 = objc_alloc_init(GEORPFeedbackSubmissionParameters);
  -[GEORPFeedbackRequestParameters setSubmissionParameters:](v20, "setSubmissionParameters:", v21);

  -[GEORPFeedbackRequestParameters submissionParameters](v20, "submissionParameters");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setType:", 20);

  v23 = objc_alloc_init(GEORPFeedbackCommonContext);
  -[GEORPFeedbackRequestParameters submissionParameters](v20, "submissionParameters");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCommonContext:", v23);

  Current = CFAbsoluteTimeGetCurrent();
  -[GEORPFeedbackRequestParameters submissionParameters](v20, "submissionParameters");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commonContext");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setClientCreatedAt:", Current);

  -[GEORPFeedbackRequestParameters submissionParameters](v20, "submissionParameters");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "commonContext");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "recordEnvironmentAndManifestURLs");

  v30 = objc_alloc_init(GEORPMapLocation);
  -[GEORPFeedbackRequestParameters submissionParameters](v20, "submissionParameters");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commonContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setMapLocation:", v30);

  v33 = objc_alloc_init(GEOLatLng);
  -[GEORPFeedbackRequestParameters submissionParameters](v20, "submissionParameters");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "commonContext");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "mapLocation");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setCoordinate:", v33);

  -[GEORPFeedbackRequestParameters submissionParameters](v20, "submissionParameters");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "commonContext");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "mapLocation");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "coordinate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setLat:", a4);

  -[GEORPFeedbackRequestParameters submissionParameters](v20, "submissionParameters");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "commonContext");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "mapLocation");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "coordinate");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setLng:", a5);

  v45 = objc_alloc_init(GEORPFeedbackDetails);
  -[GEORPFeedbackRequestParameters submissionParameters](v20, "submissionParameters");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setDetails:", v45);

  v47 = objc_alloc_init(GEORPRunningTrackFeedback);
  -[GEORPFeedbackRequestParameters submissionParameters](v20, "submissionParameters");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "details");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setRunningTrackFeedback:", v47);

  -[GEORPFeedbackRequestParameters submissionParameters](v20, "submissionParameters");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "details");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "runningTrackFeedback");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = v16;
  objc_msgSend(v52, "setTrackFeatureId:", v16);

  v53 = objc_alloc_init(GEORPFeedbackDynamicForm);
  v54 = objc_alloc_init(GEORPFeedbackFormField);
  -[GEORPFeedbackFormField setName:](v54, "setName:", 10001);
  v55 = objc_alloc_init(GEORPFeedbackFieldValue);
  -[GEORPFeedbackFormField setValue:](v54, "setValue:", v55);

  -[GEORPFeedbackFormField value](v54, "value");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setFieldValueType:", 1);

  v57 = objc_alloc_init(GEORPFeedbackSingleSelectField);
  -[GEORPFeedbackFormField value](v54, "value");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setSingleSelectField:", v57);

  v59 = objc_alloc_init(GEORPFeedbackFieldOption);
  -[GEORPFeedbackFormField value](v54, "value");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "singleSelectField");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setSelected:", v59);

  -[GEORPFeedbackFormField value](v54, "value");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "singleSelectField");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "selected");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setKey:", v14);

  if ((int)v14 <= 1300)
  {
    if ((int)v14 > 1100)
    {
      switch((int)v14)
      {
        case 1251:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_STREET_WRONG_WAY_ONE_WAY");
          break;
        case 1252:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_STREET_WRONG_WAY_NOT_ONE_WAY");
          break;
        case 1253:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_BLOCKED");
          break;
        case 1254:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_CONSTRUCTION");
          break;
        case 1255:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_TURN_NOT_ALLOWED");
          break;
        case 1256:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_RESTRICTION");
          break;
        case 1257:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_STREET");
          break;
        case 1258:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_STREET_SURFACE");
          break;
        case 1259:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_LANE");
          break;
        case 1260:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_CROSSWALK");
          break;
        case 1261:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_MEDIAN");
          break;
        case 1262:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_WALK_PATH");
          break;
        case 1263:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_TUNNEL");
          break;
        default:
          switch((int)v14)
          {
            case 1101:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_NAME");
              break;
            case 1102:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_LOCATION");
              break;
            case 1103:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_ENTRANCE");
              break;
            case 1104:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_EXIT");
              break;
            case 1105:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_LINE_NAME");
              break;
            case 1106:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_LINE_SHAPE");
              break;
            case 1107:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_LINE_SCHEDULE");
              break;
            case 1108:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_LINE_DELAY");
              break;
            case 1109:
              goto LABEL_155;
            case 1110:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_CLOSED_TEMPORARILY");
              break;
            case 1111:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_CLOSED_PERMANENTLY");
              break;
            case 1112:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_LINE_INFO_WRONG");
              break;
            case 1113:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_SOMETHING_ELSE");
              break;
            default:
              switch((int)v14)
              {
                case 1201:
                  v65 = CFSTR("FEEDBACK_FIELD_OPTION_STREET_NAME_WRONG");
                  break;
                case 1202:
                  v65 = CFSTR("FEEDBACK_FIELD_OPTION_STREET_MISSING");
                  break;
                case 1206:
                  v65 = CFSTR("FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY");
                  break;
                case 1207:
                  v65 = CFSTR("FEEDBACK_FIELD_OPTION_STREET_WRONG_WAY");
                  break;
                case 1208:
                  v65 = CFSTR("FEEDBACK_FIELD_OPTION_STREET_SOMETHING_ELSE");
                  break;
                case 1209:
                  v65 = CFSTR("FEEDBACK_FIELD_OPTION_STREET_PRIVATE");
                  break;
                case 1210:
                  v65 = CFSTR("FEEDBACK_FIELD_OPTION_STREET_SHAPE_WRONG");
                  break;
                case 1211:
                  v65 = CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_WRONG");
                  break;
                default:
                  goto LABEL_155;
              }
              break;
          }
          break;
      }
    }
    else
    {
      v65 = CFSTR("FEEDBACK_FIELD_OPTION_UNKNOWN");
      switch((int)v14)
      {
        case 0:
          goto LABEL_168;
        case 1:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_POI_NAME");
          break;
        case 2:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_POI_ADDRESS");
          break;
        case 3:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_POI_LOCATION");
          break;
        case 4:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_POI_WEBSITE");
          break;
        case 5:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_POI_HOURS");
          break;
        case 6:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_POI_PHONE");
          break;
        case 7:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_POI_CLOSED_TEMPORARY");
          break;
        case 8:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_POI_CLOSED_PERMANENT");
          break;
        case 9:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_POI_MULTIPLE");
          break;
        case 10:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_POI_SOMETHING_ELSE");
          break;
        case 11:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_POI_CATEGORY");
          break;
        case 12:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_POI_PHONE_OR_WEBSITE");
          break;
        case 13:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_POI_CLOSED");
          break;
        case 14:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_POI_CLOSED_UNSURE");
          break;
        case 15:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_POI_REOPENING");
          break;
        case 16:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_POI_ADDRESS_WRONG");
          break;
        case 17:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_POI_WEBSITE_WRONG");
          break;
        case 18:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_POI_HOURS_WRONG");
          break;
        case 19:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_POI_PHONE_WRONG");
          break;
        default:
          switch((int)v14)
          {
            case 501:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_NAME");
              break;
            case 502:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_PIN");
              break;
            case 503:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_ZIPCODE");
              break;
            case 504:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY");
              break;
            case 505:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY_TOO_LARGE");
              break;
            case 506:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY_TOO_SMALL");
              break;
            case 507:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_SOMETHING_ELSE");
              break;
            default:
              switch((int)v14)
              {
                case 1001:
                  v65 = CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_LOCATION");
                  break;
                case 1002:
                  v65 = CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_WRONG");
                  break;
                case 1003:
                  v65 = CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_SOMETHING_ELSE");
                  break;
                case 1004:
                  v65 = CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT");
                  break;
                case 1005:
                  v65 = CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_DRIVING");
                  break;
                case 1006:
                  v65 = CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_WALKING");
                  break;
                case 1007:
                  v65 = CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_BOTH");
                  break;
                default:
                  goto LABEL_155;
              }
              break;
          }
          break;
      }
    }
    goto LABEL_168;
  }
  if ((int)v14 <= 2100)
  {
    if ((int)v14 <= 2000)
    {
      switch((int)v14)
      {
        case 1701:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET");
          break;
        case 1702:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_ADDRESS");
          break;
        case 1703:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_SIGN");
          break;
        case 1704:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_STOP_SIGN");
          break;
        case 1705:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_LIGHT");
          break;
        case 1706:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_CAMERA");
          break;
        case 1707:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_OTHER");
          break;
        case 1708:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_PLACE");
          break;
        case 1709:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_NEIGHBORHOOD");
          break;
        case 1710:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRANSIT_STOP");
          break;
        case 1711:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_BIKE_WALK_PATH");
          break;
        case 1712:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_SOMETHING_ELSE");
          break;
        case 1713:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRANSIT_LINE");
          break;
        case 1714:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_SIGN_LIGHT");
          break;
        case 1715:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET_FEATURES");
          break;
        case 1716:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET_SURFACE");
          break;
        case 1717:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET_LANE");
          break;
        case 1718:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET_CROSSWALK");
          break;
        case 1719:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET_MEDIAN");
          break;
        case 1720:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_MISSING_PATH_OR_TRAIL");
          break;
        default:
          switch((int)v14)
          {
            case 1301:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_NAME_WRONG");
              break;
            case 1302:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_CLOSED");
              break;
            case 1303:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_SOMETHING_ELSE");
              break;
            case 1304:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_TEMPORARY");
              break;
            case 1305:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_PERMANENT");
              break;
            case 1306:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_UNSURE");
              break;
            default:
              goto LABEL_155;
          }
          break;
      }
      goto LABEL_168;
    }
    if ((int)v14 > 2050)
    {
      switch((int)v14)
      {
        case 2051:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_LANE_GUIDANCE");
          break;
        case 2052:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_SPOKEN_TOO_LATE");
          break;
        case 2053:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_DRIVING_NOT_ALLOWED");
          break;
        case 2054:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_TURN_NOT_SAFE");
          break;
        default:
          goto LABEL_155;
      }
      goto LABEL_168;
    }
    switch((_DWORD)v14)
    {
      case 0x7D1:
        v65 = CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_TURN_NOT_ALLOWED");
        goto LABEL_168;
      case 0x7D2:
        v65 = CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_SPOKEN_WRONG");
        goto LABEL_168;
      case 0x7D3:
        v65 = CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_SOMETHING_ELSE");
        goto LABEL_168;
    }
    goto LABEL_155;
  }
  if ((int)v14 > 2500)
  {
    if ((int)v14 <= 2600)
    {
      switch((int)v14)
      {
        case 2501:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_NOT_RELEVANT");
          break;
        case 2502:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_INAPPROPRIATE");
          break;
        case 2503:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_IMAGE_QUALITY");
          break;
        case 2504:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_BUTTON");
          break;
        case 2505:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_PRIVACY_CONCERN");
          break;
        case 2506:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_LEGAL_ISSUE");
          break;
        case 2507:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_SOMETHING_ELSE");
          break;
        default:
          goto LABEL_155;
      }
    }
    else
    {
      switch((int)v14)
      {
        case 2601:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_RUNNING_TRACK_MISSING");
          break;
        case 2602:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_RUNNING_TRACK_REMOVAL");
          break;
        case 2603:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_RUNNING_TRACK_NAME_WRONG");
          break;
        case 2604:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_RUNNING_TRACK_LANE_COUNT_WRONG");
          break;
        case 2605:
          v65 = CFSTR("FEEDBACK_FIELD_OPTION_RUNNING_TRACK_SHAPE_WRONG");
          break;
        default:
          switch((int)v14)
          {
            case 5000:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_TRAFFIC_LIGHT_ERROR");
              break;
            case 5001:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_STOP_SIGN_ERROR");
              break;
            case 5002:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_LIGHT_SIGN_WRONG");
              break;
            case 5003:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_TRAFFIC_LIGHT_MISSING");
              break;
            case 5004:
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_STOP_SIGN_MISSING");
              break;
            default:
              if ((_DWORD)v14 != 10000)
                goto LABEL_155;
              v65 = CFSTR("FEEDBACK_FIELD_OPTION_CHOICE");
              break;
          }
          break;
      }
    }
    goto LABEL_168;
  }
  if ((int)v14 <= 2300)
  {
    switch((int)v14)
    {
      case 2201:
        v65 = CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_BIKING_NOT_ALLOWED");
        break;
      case 2202:
        v65 = CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_BIKING_NOT_SAFE");
        break;
      case 2203:
        v65 = CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING");
        break;
      case 2204:
        v65 = CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING_ADD");
        break;
      case 2205:
        v65 = CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING_REMOVE");
        break;
      case 2206:
        v65 = CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT");
        break;
      case 2207:
        v65 = CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT_ADD");
        break;
      case 2208:
        v65 = CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT_REMOVE");
        break;
      default:
        switch((int)v14)
        {
          case 2101:
            v65 = CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_LOCATION_WRONG");
            break;
          case 2102:
            v65 = CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE");
            break;
          case 2103:
            v65 = CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_DRIVING");
            break;
          case 2104:
            v65 = CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_WALKING");
            break;
          case 2105:
            v65 = CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_BOTH");
            break;
          case 2106:
            v65 = CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ADDRESS_WRONG");
            break;
          default:
            goto LABEL_155;
        }
        break;
    }
    goto LABEL_168;
  }
  if ((_DWORD)v14 == 2301)
  {
    v65 = CFSTR("FEEDBACK_FIELD_OPTION_WALK_STEP_WALKING_NOT_ALLOWED");
    goto LABEL_168;
  }
  if ((_DWORD)v14 == 2302)
  {
    v65 = CFSTR("FEEDBACK_FIELD_OPTION_WALK_STEP_WALKING_NOT_SAFE");
    goto LABEL_168;
  }
  if ((_DWORD)v14 != 2401)
  {
LABEL_155:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
    v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_168;
  }
  v65 = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_STEP_BETTER_ROUTE_AVAILABLE");
LABEL_168:
  -[GEORPFeedbackFormField value](v54, "value");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "singleSelectField");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "selected");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setDefaultText:", v65);

  -[GEORPFeedbackDynamicForm addFormFields:](v53, "addFormFields:", v54);
  v17 = v94;
  if (v94)
  {
    v69 = objc_alloc_init(GEORPFeedbackFormField);
    -[GEORPFeedbackFormField setName:](v69, "setName:", 2001);
    v70 = objc_alloc_init(GEORPFeedbackFieldValue);
    -[GEORPFeedbackFormField setValue:](v69, "setValue:", v70);

    -[GEORPFeedbackFormField value](v69, "value");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setFieldValueType:", 3);

    v72 = objc_alloc_init(GEORPFeedbackTextField);
    -[GEORPFeedbackFormField value](v69, "value");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setTextField:", v72);

    -[GEORPFeedbackFormField value](v69, "value");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "textField");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setEdited:", v94);

    -[GEORPFeedbackDynamicForm addFormFields:](v53, "addFormFields:", v69);
  }
  if (v18)
  {
    v76 = objc_alloc_init(GEORPFeedbackFormField);
    -[GEORPFeedbackFormField setName:](v76, "setName:", 2002);
    v77 = objc_alloc_init(GEORPFeedbackFieldValue);
    -[GEORPFeedbackFormField setValue:](v76, "setValue:", v77);

    -[GEORPFeedbackFormField value](v76, "value");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setFieldValueType:", 11);

    v79 = objc_alloc_init(GEORPFeedbackIntField);
    -[GEORPFeedbackFormField value](v76, "value");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setIntField:", v79);

    v81 = objc_msgSend(v18, "intValue");
    -[GEORPFeedbackFormField value](v76, "value");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "intField");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setEdited:", v81);

    v17 = v94;
    -[GEORPFeedbackDynamicForm addFormFields:](v53, "addFormFields:", v76);

  }
  if (v19)
  {
    v84 = objc_alloc_init(GEORPFeedbackFormField);
    -[GEORPFeedbackFormField setName:](v84, "setName:", 1);
    v85 = objc_alloc_init(GEORPFeedbackFieldValue);
    -[GEORPFeedbackFormField setValue:](v84, "setValue:", v85);

    -[GEORPFeedbackFormField value](v84, "value");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setFieldValueType:", 3);

    v87 = objc_alloc_init(GEORPFeedbackTextField);
    -[GEORPFeedbackFormField value](v84, "value");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setTextField:", v87);

    -[GEORPFeedbackFormField value](v84, "value");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "textField");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setEdited:", v19);

    -[GEORPFeedbackDynamicForm addFormFields:](v53, "addFormFields:", v84);
  }
  -[GEORPFeedbackRequestParameters submissionParameters](v20, "submissionParameters");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setDynamicForm:", v53);

  v16 = v93;
LABEL_175:

  return v20;
}

- (GEORPFeedbackRequestParameters)initWithIncidentLocation:(id)a3 userLocation:(id)a4 type:(int)a5 historicalLocations:(id)a6 userPath:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  id v15;
  GEORPFeedbackRequestParameters *v16;
  GEORPFeedbackSubmissionParameters *v17;
  void *v18;
  GEORPFeedbackCommonContext *v19;
  void *v20;
  double Current;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  GEORPFeedbackDetails *v26;
  void *v27;
  GEORPIncidentFeedback *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  GEORPNewIncidentDetails *v34;
  GEORPUserLocationDetails *v35;
  void *v36;
  void *v37;
  void *v38;
  GEORPIncidentLocation *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_super v49;

  v9 = *(_QWORD *)&a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v49.receiver = self;
  v49.super_class = (Class)GEORPFeedbackRequestParameters;
  v16 = -[GEORPFeedbackRequestParameters init](&v49, sel_init);
  if (v16)
  {
    v17 = objc_alloc_init(GEORPFeedbackSubmissionParameters);
    -[GEORPFeedbackRequestParameters setSubmissionParameters:](v16, "setSubmissionParameters:", v17);

    -[GEORPFeedbackRequestParameters submissionParameters](v16, "submissionParameters");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setType:", 11);

    v19 = objc_alloc_init(GEORPFeedbackCommonContext);
    -[GEORPFeedbackRequestParameters submissionParameters](v16, "submissionParameters");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCommonContext:", v19);

    Current = CFAbsoluteTimeGetCurrent();
    -[GEORPFeedbackRequestParameters submissionParameters](v16, "submissionParameters");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "commonContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setClientCreatedAt:", Current);

    -[GEORPFeedbackRequestParameters submissionParameters](v16, "submissionParameters");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "commonContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "recordEnvironmentAndManifestURLs");

    v26 = objc_alloc_init(GEORPFeedbackDetails);
    -[GEORPFeedbackRequestParameters submissionParameters](v16, "submissionParameters");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setDetails:", v26);

    v28 = objc_alloc_init(GEORPIncidentFeedback);
    -[GEORPFeedbackRequestParameters submissionParameters](v16, "submissionParameters");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "details");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setIncidentFeedback:", v28);

    -[GEORPFeedbackRequestParameters submissionParameters](v16, "submissionParameters");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "details");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "incidentFeedback");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setType:", 1);

    v34 = objc_alloc_init(GEORPNewIncidentDetails);
    v35 = objc_alloc_init(GEORPUserLocationDetails);
    -[GEORPNewIncidentDetails setUserLocation:](v34, "setUserLocation:", v35);

    -[GEORPNewIncidentDetails userLocation](v34, "userLocation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setCurrentUserLocation:", v13);

    v37 = (void *)objc_msgSend(v14, "mutableCopy");
    -[GEORPNewIncidentDetails userLocation](v34, "userLocation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setDeviceHistoricalLocations:", v37);

    -[GEORPNewIncidentDetails setType:](v34, "setType:", v9);
    v39 = objc_alloc_init(GEORPIncidentLocation);
    -[GEORPNewIncidentDetails setIncidentLocation:](v34, "setIncidentLocation:", v39);

    objc_msgSend(v12, "latLng");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEORPNewIncidentDetails incidentLocation](v34, "incidentLocation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setLatLng:", v40);

    -[GEORPFeedbackRequestParameters submissionParameters](v16, "submissionParameters");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "details");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "incidentFeedback");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setNewIncidentDetails:", v34);

    -[GEORPFeedbackRequestParameters submissionParameters](v16, "submissionParameters");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "details");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "incidentFeedback");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setUserPath:", v15);

  }
  return v16;
}

- (GEORPFeedbackRequestParameters)initWithIncidentAnnotationDetails:(id)a3 userPath:(id)a4
{
  id v6;
  id v7;
  GEORPFeedbackRequestParameters *v8;
  GEORPFeedbackSubmissionParameters *v9;
  void *v10;
  GEORPFeedbackCommonContext *v11;
  void *v12;
  double Current;
  void *v14;
  void *v15;
  GEORPFeedbackDetails *v16;
  void *v17;
  GEORPIncidentFeedback *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;

  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)GEORPFeedbackRequestParameters;
  v8 = -[GEORPFeedbackRequestParameters init](&v31, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(GEORPFeedbackSubmissionParameters);
    -[GEORPFeedbackRequestParameters setSubmissionParameters:](v8, "setSubmissionParameters:", v9);

    -[GEORPFeedbackRequestParameters submissionParameters](v8, "submissionParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setType:", 11);

    v11 = objc_alloc_init(GEORPFeedbackCommonContext);
    -[GEORPFeedbackRequestParameters submissionParameters](v8, "submissionParameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCommonContext:", v11);

    Current = CFAbsoluteTimeGetCurrent();
    -[GEORPFeedbackRequestParameters submissionParameters](v8, "submissionParameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "commonContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setClientCreatedAt:", Current);

    v16 = objc_alloc_init(GEORPFeedbackDetails);
    -[GEORPFeedbackRequestParameters submissionParameters](v8, "submissionParameters");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDetails:", v16);

    v18 = objc_alloc_init(GEORPIncidentFeedback);
    -[GEORPFeedbackRequestParameters submissionParameters](v8, "submissionParameters");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "details");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setIncidentFeedback:", v18);

    -[GEORPFeedbackRequestParameters submissionParameters](v8, "submissionParameters");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "details");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "incidentFeedback");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setType:", 2);

    -[GEORPFeedbackRequestParameters submissionParameters](v8, "submissionParameters");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "details");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "incidentFeedback");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setIncidentAnnotationDetails:", v6);

    -[GEORPFeedbackRequestParameters submissionParameters](v8, "submissionParameters");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "details");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "incidentFeedback");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setUserPath:", v7);

  }
  return v8;
}

@end
