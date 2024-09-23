@implementation GEORPFeedbackComponentValue

- (GEORPFeedbackComponentValue)init
{
  GEORPFeedbackComponentValue *v2;
  GEORPFeedbackComponentValue *v3;
  GEORPFeedbackComponentValue *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackComponentValue;
  v2 = -[GEORPFeedbackComponentValue init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackComponentValue)initWithData:(id)a3
{
  GEORPFeedbackComponentValue *v3;
  GEORPFeedbackComponentValue *v4;
  GEORPFeedbackComponentValue *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackComponentValue;
  v3 = -[GEORPFeedbackComponentValue initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readNotification
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
        GEORPFeedbackComponentValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNotification_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasNotification
{
  -[GEORPFeedbackComponentValue _readNotification]((uint64_t)self);
  return self->_notification != 0;
}

- (GEORPFeedbackNotification)notification
{
  -[GEORPFeedbackComponentValue _readNotification]((uint64_t)self);
  return self->_notification;
}

- (void)setNotification:(id)a3
{
  *(_WORD *)&self->_flags |= 0x104u;
  objc_storeStrong((id *)&self->_notification, a3);
}

- (void)_readOverview
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
        GEORPFeedbackComponentValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOverview_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasOverview
{
  -[GEORPFeedbackComponentValue _readOverview]((uint64_t)self);
  return self->_overview != 0;
}

- (GEORPFeedbackOverview)overview
{
  -[GEORPFeedbackComponentValue _readOverview]((uint64_t)self);
  return self->_overview;
}

- (void)setOverview:(id)a3
{
  *(_WORD *)&self->_flags |= 0x108u;
  objc_storeStrong((id *)&self->_overview, a3);
}

- (void)_readConversation
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
        GEORPFeedbackComponentValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readConversation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasConversation
{
  -[GEORPFeedbackComponentValue _readConversation]((uint64_t)self);
  return self->_conversation != 0;
}

- (GEORPFeedbackConversation)conversation
{
  -[GEORPFeedbackComponentValue _readConversation]((uint64_t)self);
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (void)_readPoiEnrichment
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
        GEORPFeedbackComponentValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPoiEnrichment_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasPoiEnrichment
{
  -[GEORPFeedbackComponentValue _readPoiEnrichment]((uint64_t)self);
  return self->_poiEnrichment != 0;
}

- (GEORPPoiEnrichment)poiEnrichment
{
  -[GEORPFeedbackComponentValue _readPoiEnrichment]((uint64_t)self);
  return self->_poiEnrichment;
}

- (void)setPoiEnrichment:(id)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  objc_storeStrong((id *)&self->_poiEnrichment, a3);
}

- (void)_readRapInfo
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
        GEORPFeedbackComponentValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRapInfo_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasRapInfo
{
  -[GEORPFeedbackComponentValue _readRapInfo]((uint64_t)self);
  return self->_rapInfo != 0;
}

- (GEORPRapInfo)rapInfo
{
  -[GEORPFeedbackComponentValue _readRapInfo]((uint64_t)self);
  return self->_rapInfo;
}

- (void)setRapInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_rapInfo, a3);
}

- (void)_readThirdPartyPhotoSharingPreferences
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
        GEORPFeedbackComponentValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readThirdPartyPhotoSharingPreferences_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasThirdPartyPhotoSharingPreferences
{
  -[GEORPFeedbackComponentValue _readThirdPartyPhotoSharingPreferences]((uint64_t)self);
  return self->_thirdPartyPhotoSharingPreferences != 0;
}

- (GEORPThirdPartyPhotoSharingPreference)thirdPartyPhotoSharingPreferences
{
  -[GEORPFeedbackComponentValue _readThirdPartyPhotoSharingPreferences]((uint64_t)self);
  return self->_thirdPartyPhotoSharingPreferences;
}

- (void)setThirdPartyPhotoSharingPreferences:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_thirdPartyPhotoSharingPreferences, a3);
}

- (void)_readPhotoAttributionPreferences
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
        GEORPFeedbackComponentValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhotoAttributionPreferences_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasPhotoAttributionPreferences
{
  -[GEORPFeedbackComponentValue _readPhotoAttributionPreferences]((uint64_t)self);
  return self->_photoAttributionPreferences != 0;
}

- (GEORPPhotoAttributionPreferences)photoAttributionPreferences
{
  -[GEORPFeedbackComponentValue _readPhotoAttributionPreferences]((uint64_t)self);
  return self->_photoAttributionPreferences;
}

- (void)setPhotoAttributionPreferences:(id)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  objc_storeStrong((id *)&self->_photoAttributionPreferences, a3);
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
  v8.super_class = (Class)GEORPFeedbackComponentValue;
  -[GEORPFeedbackComponentValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackComponentValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackComponentValue _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  _QWORD v37[4];
  id v38;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "notification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("notification"));

  }
  objc_msgSend(a1, "overview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("overview"));

  }
  objc_msgSend(a1, "conversation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v11, "jsonRepresentation");
    else
      objc_msgSend(v11, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("conversation"));

  }
  objc_msgSend(a1, "poiEnrichment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v14, "jsonRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("poiEnrichment");
    }
    else
    {
      objc_msgSend(v14, "dictionaryRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("poi_enrichment");
    }
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  objc_msgSend(a1, "rapInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v18, "jsonRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("rapInfo");
    }
    else
    {
      objc_msgSend(v18, "dictionaryRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("rap_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  objc_msgSend(a1, "thirdPartyPhotoSharingPreferences");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v22, "jsonRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("thirdPartyPhotoSharingPreferences");
    }
    else
    {
      objc_msgSend(v22, "dictionaryRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("third_party_photo_sharing_preferences");
    }
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

  }
  objc_msgSend(a1, "photoAttributionPreferences");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v26, "jsonRepresentation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("photoAttributionPreferences");
    }
    else
    {
      objc_msgSend(v26, "dictionaryRepresentation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("photo_attribution_preferences");
    }
    objc_msgSend(v4, "setObject:forKey:", v28, v29);

  }
  v30 = (void *)a1[2];
  if (v30)
  {
    objc_msgSend(v30, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v31, "count"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __57__GEORPFeedbackComponentValue__dictionaryRepresentation___block_invoke;
      v37[3] = &unk_1E1C00600;
      v34 = v33;
      v38 = v34;
      objc_msgSend(v32, "enumerateKeysAndObjectsUsingBlock:", v37);
      v35 = v34;

      v32 = v35;
    }
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackComponentValue _dictionaryRepresentation:](self, 1);
}

void __57__GEORPFeedbackComponentValue__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPFeedbackComponentValue)initWithDictionary:(id)a3
{
  return (GEORPFeedbackComponentValue *)-[GEORPFeedbackComponentValue _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  GEORPFeedbackNotification *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  GEORPFeedbackOverview *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  GEORPFeedbackConversation *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  GEORPPoiEnrichment *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  GEORPRapInfo *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  GEORPThirdPartyPhotoSharingPreference *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  GEORPPhotoAttributionPreferences *v35;
  uint64_t v36;
  void *v37;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("notification"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEORPFeedbackNotification alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEORPFeedbackNotification initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEORPFeedbackNotification initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setNotification:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("overview"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = [GEORPFeedbackOverview alloc];
        if ((a3 & 1) != 0)
          v12 = -[GEORPFeedbackOverview initWithJSON:](v11, "initWithJSON:", v10);
        else
          v12 = -[GEORPFeedbackOverview initWithDictionary:](v11, "initWithDictionary:", v10);
        v13 = (void *)v12;
        objc_msgSend(a1, "setOverview:", v12);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("conversation"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = [GEORPFeedbackConversation alloc];
        if ((a3 & 1) != 0)
          v16 = -[GEORPFeedbackConversation initWithJSON:](v15, "initWithJSON:", v14);
        else
          v16 = -[GEORPFeedbackConversation initWithDictionary:](v15, "initWithDictionary:", v14);
        v17 = (void *)v16;
        objc_msgSend(a1, "setConversation:", v16);

      }
      if (a3)
        v18 = CFSTR("poiEnrichment");
      else
        v18 = CFSTR("poi_enrichment");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = [GEORPPoiEnrichment alloc];
        if ((a3 & 1) != 0)
          v21 = -[GEORPPoiEnrichment initWithJSON:](v20, "initWithJSON:", v19);
        else
          v21 = -[GEORPPoiEnrichment initWithDictionary:](v20, "initWithDictionary:", v19);
        v22 = (void *)v21;
        objc_msgSend(a1, "setPoiEnrichment:", v21);

      }
      if (a3)
        v23 = CFSTR("rapInfo");
      else
        v23 = CFSTR("rap_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = [GEORPRapInfo alloc];
        if ((a3 & 1) != 0)
          v26 = -[GEORPRapInfo initWithJSON:](v25, "initWithJSON:", v24);
        else
          v26 = -[GEORPRapInfo initWithDictionary:](v25, "initWithDictionary:", v24);
        v27 = (void *)v26;
        objc_msgSend(a1, "setRapInfo:", v26);

      }
      if (a3)
        v28 = CFSTR("thirdPartyPhotoSharingPreferences");
      else
        v28 = CFSTR("third_party_photo_sharing_preferences");
      objc_msgSend(v5, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = [GEORPThirdPartyPhotoSharingPreference alloc];
        if ((a3 & 1) != 0)
          v31 = -[GEORPThirdPartyPhotoSharingPreference initWithJSON:](v30, "initWithJSON:", v29);
        else
          v31 = -[GEORPThirdPartyPhotoSharingPreference initWithDictionary:](v30, "initWithDictionary:", v29);
        v32 = (void *)v31;
        objc_msgSend(a1, "setThirdPartyPhotoSharingPreferences:", v31);

      }
      if (a3)
        v33 = CFSTR("photoAttributionPreferences");
      else
        v33 = CFSTR("photo_attribution_preferences");
      objc_msgSend(v5, "objectForKeyedSubscript:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = [GEORPPhotoAttributionPreferences alloc];
        if ((a3 & 1) != 0)
          v36 = -[GEORPPhotoAttributionPreferences initWithJSON:](v35, "initWithJSON:", v34);
        else
          v36 = -[GEORPPhotoAttributionPreferences initWithDictionary:](v35, "initWithDictionary:", v34);
        v37 = (void *)v36;
        objc_msgSend(a1, "setPhotoAttributionPreferences:", v36);

      }
    }
  }

  return a1;
}

- (GEORPFeedbackComponentValue)initWithJSON:(id)a3
{
  return (GEORPFeedbackComponentValue *)-[GEORPFeedbackComponentValue _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_255;
    else
      v8 = (int *)&readAll__nonRecursiveTag_256;
    GEORPFeedbackComponentValueReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPFeedbackComponentValueCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackComponentValueIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackComponentValueReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && !_GEORPFeedbackComponentValueIsDirty((uint64_t)self))
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
    -[GEORPFeedbackComponentValue readAll:](self, "readAll:", 0);
    if (self->_notification)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_overview)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_conversation)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_poiEnrichment)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_rapInfo)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_thirdPartyPhotoSharingPreferences)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_photoAttributionPreferences)
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
  -[GEORPFeedbackComponentValue _readRapInfo]((uint64_t)self);
  return -[GEORPRapInfo hasGreenTeaWithValue:](self->_rapInfo, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORPFeedbackComponentValue readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 20) = self->_readerMarkPos;
  *((_DWORD *)v5 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_notification)
    objc_msgSend(v5, "setNotification:");
  if (self->_overview)
    objc_msgSend(v5, "setOverview:");
  v4 = v5;
  if (self->_conversation)
  {
    objc_msgSend(v5, "setConversation:");
    v4 = v5;
  }
  if (self->_poiEnrichment)
  {
    objc_msgSend(v5, "setPoiEnrichment:");
    v4 = v5;
  }
  if (self->_rapInfo)
  {
    objc_msgSend(v5, "setRapInfo:");
    v4 = v5;
  }
  if (self->_thirdPartyPhotoSharingPreferences)
  {
    objc_msgSend(v5, "setThirdPartyPhotoSharingPreferences:");
    v4 = v5;
  }
  if (self->_photoAttributionPreferences)
  {
    objc_msgSend(v5, "setPhotoAttributionPreferences:");
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
    -[GEORPFeedbackComponentValue readAll:](self, "readAll:", 0);
    v8 = -[GEORPFeedbackNotification copyWithZone:](self->_notification, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v8;

    v10 = -[GEORPFeedbackOverview copyWithZone:](self->_overview, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v10;

    v12 = -[GEORPFeedbackConversation copyWithZone:](self->_conversation, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v12;

    v14 = -[GEORPPoiEnrichment copyWithZone:](self->_poiEnrichment, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v14;

    v16 = -[GEORPRapInfo copyWithZone:](self->_rapInfo, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v16;

    v18 = -[GEORPThirdPartyPhotoSharingPreference copyWithZone:](self->_thirdPartyPhotoSharingPreferences, "copyWithZone:", a3);
    v19 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v18;

    v20 = -[GEORPPhotoAttributionPreferences copyWithZone:](self->_photoAttributionPreferences, "copyWithZone:", a3);
    v21 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v20;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPFeedbackComponentValueReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEORPFeedbackNotification *notification;
  GEORPFeedbackOverview *overview;
  GEORPFeedbackConversation *conversation;
  GEORPPoiEnrichment *poiEnrichment;
  GEORPRapInfo *rapInfo;
  GEORPThirdPartyPhotoSharingPreference *thirdPartyPhotoSharingPreferences;
  GEORPPhotoAttributionPreferences *photoAttributionPreferences;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEORPFeedbackComponentValue readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  notification = self->_notification;
  if ((unint64_t)notification | v4[4])
  {
    if (!-[GEORPFeedbackNotification isEqual:](notification, "isEqual:"))
      goto LABEL_16;
  }
  if (((overview = self->_overview, !((unint64_t)overview | v4[5]))
     || -[GEORPFeedbackOverview isEqual:](overview, "isEqual:"))
    && ((conversation = self->_conversation, !((unint64_t)conversation | v4[3]))
     || -[GEORPFeedbackConversation isEqual:](conversation, "isEqual:"))
    && ((poiEnrichment = self->_poiEnrichment, !((unint64_t)poiEnrichment | v4[7]))
     || -[GEORPPoiEnrichment isEqual:](poiEnrichment, "isEqual:"))
    && ((rapInfo = self->_rapInfo, !((unint64_t)rapInfo | v4[8])) || -[GEORPRapInfo isEqual:](rapInfo, "isEqual:"))&& ((thirdPartyPhotoSharingPreferences = self->_thirdPartyPhotoSharingPreferences, !((unint64_t)thirdPartyPhotoSharingPreferences | v4[9]))|| -[GEORPThirdPartyPhotoSharingPreference isEqual:](thirdPartyPhotoSharingPreferences, "isEqual:")))
  {
    photoAttributionPreferences = self->_photoAttributionPreferences;
    if ((unint64_t)photoAttributionPreferences | v4[6])
      v12 = -[GEORPPhotoAttributionPreferences isEqual:](photoAttributionPreferences, "isEqual:");
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

  -[GEORPFeedbackComponentValue readAll:](self, "readAll:", 1);
  v3 = -[GEORPFeedbackNotification hash](self->_notification, "hash");
  v4 = -[GEORPFeedbackOverview hash](self->_overview, "hash") ^ v3;
  v5 = -[GEORPFeedbackConversation hash](self->_conversation, "hash");
  v6 = v4 ^ v5 ^ -[GEORPPoiEnrichment hash](self->_poiEnrichment, "hash");
  v7 = -[GEORPRapInfo hash](self->_rapInfo, "hash");
  v8 = v7 ^ -[GEORPThirdPartyPhotoSharingPreference hash](self->_thirdPartyPhotoSharingPreferences, "hash");
  return v6 ^ v8 ^ -[GEORPPhotoAttributionPreferences hash](self->_photoAttributionPreferences, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEORPFeedbackNotification *notification;
  uint64_t v5;
  GEORPFeedbackOverview *overview;
  uint64_t v7;
  GEORPFeedbackConversation *conversation;
  uint64_t v9;
  GEORPPoiEnrichment *poiEnrichment;
  uint64_t v11;
  GEORPRapInfo *rapInfo;
  uint64_t v13;
  GEORPThirdPartyPhotoSharingPreference *thirdPartyPhotoSharingPreferences;
  uint64_t v15;
  GEORPPhotoAttributionPreferences *photoAttributionPreferences;
  uint64_t v17;
  _QWORD *v18;

  v18 = a3;
  objc_msgSend(v18, "readAll:", 0);
  notification = self->_notification;
  v5 = v18[4];
  if (notification)
  {
    if (v5)
      -[GEORPFeedbackNotification mergeFrom:](notification, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEORPFeedbackComponentValue setNotification:](self, "setNotification:");
  }
  overview = self->_overview;
  v7 = v18[5];
  if (overview)
  {
    if (v7)
      -[GEORPFeedbackOverview mergeFrom:](overview, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEORPFeedbackComponentValue setOverview:](self, "setOverview:");
  }
  conversation = self->_conversation;
  v9 = v18[3];
  if (conversation)
  {
    if (v9)
      -[GEORPFeedbackConversation mergeFrom:](conversation, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEORPFeedbackComponentValue setConversation:](self, "setConversation:");
  }
  poiEnrichment = self->_poiEnrichment;
  v11 = v18[7];
  if (poiEnrichment)
  {
    if (v11)
      -[GEORPPoiEnrichment mergeFrom:](poiEnrichment, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEORPFeedbackComponentValue setPoiEnrichment:](self, "setPoiEnrichment:");
  }
  rapInfo = self->_rapInfo;
  v13 = v18[8];
  if (rapInfo)
  {
    if (v13)
      -[GEORPRapInfo mergeFrom:](rapInfo, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEORPFeedbackComponentValue setRapInfo:](self, "setRapInfo:");
  }
  thirdPartyPhotoSharingPreferences = self->_thirdPartyPhotoSharingPreferences;
  v15 = v18[9];
  if (thirdPartyPhotoSharingPreferences)
  {
    if (v15)
      -[GEORPThirdPartyPhotoSharingPreference mergeFrom:](thirdPartyPhotoSharingPreferences, "mergeFrom:");
  }
  else if (v15)
  {
    -[GEORPFeedbackComponentValue setThirdPartyPhotoSharingPreferences:](self, "setThirdPartyPhotoSharingPreferences:");
  }
  photoAttributionPreferences = self->_photoAttributionPreferences;
  v17 = v18[6];
  if (photoAttributionPreferences)
  {
    if (v17)
      -[GEORPPhotoAttributionPreferences mergeFrom:](photoAttributionPreferences, "mergeFrom:");
  }
  else if (v17)
  {
    -[GEORPFeedbackComponentValue setPhotoAttributionPreferences:](self, "setPhotoAttributionPreferences:");
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
      GEORPFeedbackComponentValueReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_259);
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
    -[GEORPFeedbackComponentValue readAll:](self, "readAll:", 0);
    -[GEORPFeedbackNotification clearUnknownFields:](self->_notification, "clearUnknownFields:", 1);
    -[GEORPFeedbackOverview clearUnknownFields:](self->_overview, "clearUnknownFields:", 1);
    -[GEORPFeedbackConversation clearUnknownFields:](self->_conversation, "clearUnknownFields:", 1);
    -[GEORPRapInfo clearUnknownFields:](self->_rapInfo, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thirdPartyPhotoSharingPreferences, 0);
  objc_storeStrong((id *)&self->_rapInfo, 0);
  objc_storeStrong((id *)&self->_poiEnrichment, 0);
  objc_storeStrong((id *)&self->_photoAttributionPreferences, 0);
  objc_storeStrong((id *)&self->_overview, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
