@implementation GEORPFeedbackSubmissionResult

- (GEORPFeedbackSubmissionResult)init
{
  GEORPFeedbackSubmissionResult *v2;
  GEORPFeedbackSubmissionResult *v3;
  GEORPFeedbackSubmissionResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackSubmissionResult;
  v2 = -[GEORPFeedbackSubmissionResult init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackSubmissionResult)initWithData:(id)a3
{
  GEORPFeedbackSubmissionResult *v3;
  GEORPFeedbackSubmissionResult *v4;
  GEORPFeedbackSubmissionResult *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackSubmissionResult;
  v3 = -[GEORPFeedbackSubmissionResult initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readFeedbackId
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
        GEORPFeedbackSubmissionResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeedbackId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasFeedbackId
{
  -[GEORPFeedbackSubmissionResult _readFeedbackId]((uint64_t)self);
  return self->_feedbackId != 0;
}

- (NSString)feedbackId
{
  -[GEORPFeedbackSubmissionResult _readFeedbackId]((uint64_t)self);
  return self->_feedbackId;
}

- (void)setFeedbackId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  objc_storeStrong((id *)&self->_feedbackId, a3);
}

- (void)_readImageIdMapEntrys
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
        GEORPFeedbackSubmissionResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readImageIdMapEntrys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)imageIdMapEntrys
{
  -[GEORPFeedbackSubmissionResult _readImageIdMapEntrys]((uint64_t)self);
  return self->_imageIdMapEntrys;
}

- (void)setImageIdMapEntrys:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *imageIdMapEntrys;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  imageIdMapEntrys = self->_imageIdMapEntrys;
  self->_imageIdMapEntrys = v4;

}

- (void)clearImageIdMapEntrys
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_imageIdMapEntrys, "removeAllObjects");
}

- (void)addImageIdMapEntry:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPFeedbackSubmissionResult _readImageIdMapEntrys]((uint64_t)self);
  -[GEORPFeedbackSubmissionResult _addNoFlagsImageIdMapEntry:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsImageIdMapEntry:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)imageIdMapEntrysCount
{
  -[GEORPFeedbackSubmissionResult _readImageIdMapEntrys]((uint64_t)self);
  return -[NSMutableArray count](self->_imageIdMapEntrys, "count");
}

- (id)imageIdMapEntryAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackSubmissionResult _readImageIdMapEntrys]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_imageIdMapEntrys, "objectAtIndex:", a3);
}

+ (Class)imageIdMapEntryType
{
  return (Class)objc_opt_class();
}

- (void)_readRapInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackSubmissionResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRapInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasRapInfo
{
  -[GEORPFeedbackSubmissionResult _readRapInfo]((uint64_t)self);
  return self->_rapInfo != 0;
}

- (GEORPRapProfileInfo)rapInfo
{
  -[GEORPFeedbackSubmissionResult _readRapInfo]((uint64_t)self);
  return self->_rapInfo;
}

- (void)setRapInfo:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_rapInfo, a3);
}

- (void)_readThirdPartyPhotoSharingPreferenceUpdateResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackSubmissionResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readThirdPartyPhotoSharingPreferenceUpdateResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasThirdPartyPhotoSharingPreferenceUpdateResult
{
  -[GEORPFeedbackSubmissionResult _readThirdPartyPhotoSharingPreferenceUpdateResult]((uint64_t)self);
  return self->_thirdPartyPhotoSharingPreferenceUpdateResult != 0;
}

- (GEORPThirdPartyPhotoSharingPreferenceUpdateResult)thirdPartyPhotoSharingPreferenceUpdateResult
{
  -[GEORPFeedbackSubmissionResult _readThirdPartyPhotoSharingPreferenceUpdateResult]((uint64_t)self);
  return self->_thirdPartyPhotoSharingPreferenceUpdateResult;
}

- (void)setThirdPartyPhotoSharingPreferenceUpdateResult:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_thirdPartyPhotoSharingPreferenceUpdateResult, a3);
}

- (void)_readPhotoAttributionPreferencesUpdateResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackSubmissionResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhotoAttributionPreferencesUpdateResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasPhotoAttributionPreferencesUpdateResult
{
  -[GEORPFeedbackSubmissionResult _readPhotoAttributionPreferencesUpdateResult]((uint64_t)self);
  return self->_photoAttributionPreferencesUpdateResult != 0;
}

- (GEORPPhotoAttributionPreferencesUpdateResult)photoAttributionPreferencesUpdateResult
{
  -[GEORPFeedbackSubmissionResult _readPhotoAttributionPreferencesUpdateResult]((uint64_t)self);
  return self->_photoAttributionPreferencesUpdateResult;
}

- (void)setPhotoAttributionPreferencesUpdateResult:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_photoAttributionPreferencesUpdateResult, a3);
}

- (void)_readTdmFraudRequestInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackSubmissionResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTdmFraudRequestInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTdmFraudRequestInfo
{
  -[GEORPFeedbackSubmissionResult _readTdmFraudRequestInfo]((uint64_t)self);
  return self->_tdmFraudRequestInfo != 0;
}

- (GEORPTdmFraudRequestInfo)tdmFraudRequestInfo
{
  -[GEORPFeedbackSubmissionResult _readTdmFraudRequestInfo]((uint64_t)self);
  return self->_tdmFraudRequestInfo;
}

- (void)setTdmFraudRequestInfo:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_tdmFraudRequestInfo, a3);
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
  v8.super_class = (Class)GEORPFeedbackSubmissionResult;
  -[GEORPFeedbackSubmissionResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackSubmissionResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackSubmissionResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  _QWORD v39[4];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "feedbackId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("feedbackId");
    else
      v6 = CFSTR("feedback_id");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v8 = *(id *)(a1 + 32);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v42 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v10);
    }

    if (a2)
      v15 = CFSTR("imageIdMapEntry");
    else
      v15 = CFSTR("image_id_map_entry");
    objc_msgSend(v4, "setObject:forKey:", v7, v15);

  }
  objc_msgSend((id)a1, "rapInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v16, "jsonRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("rapInfo");
    }
    else
    {
      objc_msgSend(v16, "dictionaryRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("rap_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  objc_msgSend((id)a1, "thirdPartyPhotoSharingPreferenceUpdateResult");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v20, "jsonRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("thirdPartyPhotoSharingPreferenceUpdateResult");
    }
    else
    {
      objc_msgSend(v20, "dictionaryRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("third_party_photo_sharing_preference_update_result");
    }
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
  objc_msgSend((id)a1, "photoAttributionPreferencesUpdateResult");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v24, "jsonRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("photoAttributionPreferencesUpdateResult");
    }
    else
    {
      objc_msgSend(v24, "dictionaryRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("photo_attribution_preferences_update_result");
    }
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

  }
  objc_msgSend((id)a1, "tdmFraudRequestInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v28, "jsonRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("tdmFraudRequestInfo");
    }
    else
    {
      objc_msgSend(v28, "dictionaryRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("tdm_fraud_request_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v30, v31);

  }
  v32 = *(void **)(a1 + 16);
  if (v32)
  {
    objc_msgSend(v32, "dictionaryRepresentation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v33, "count"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __59__GEORPFeedbackSubmissionResult__dictionaryRepresentation___block_invoke;
      v39[3] = &unk_1E1C00600;
      v36 = v35;
      v40 = v36;
      objc_msgSend(v34, "enumerateKeysAndObjectsUsingBlock:", v39);
      v37 = v36;

      v34 = v37;
    }
    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackSubmissionResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __59__GEORPFeedbackSubmissionResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPFeedbackSubmissionResult)initWithDictionary:(id)a3
{
  return (GEORPFeedbackSubmissionResult *)-[GEORPFeedbackSubmissionResult _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  GEORPFeedbackImageIdMapEntry *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  GEORPRapProfileInfo *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  GEORPThirdPartyPhotoSharingPreferenceUpdateResult *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  GEORPPhotoAttributionPreferencesUpdateResult *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  GEORPTdmFraudRequestInfo *v37;
  uint64_t v38;
  void *v39;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
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
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setFeedbackId:", v8);

      }
      if (a3)
        v9 = CFSTR("imageIdMapEntry");
      else
        v9 = CFSTR("image_id_map_entry");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v41 = v5;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v43;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v43 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v17 = [GEORPFeedbackImageIdMapEntry alloc];
                if ((a3 & 1) != 0)
                  v18 = -[GEORPFeedbackImageIdMapEntry initWithJSON:](v17, "initWithJSON:", v16);
                else
                  v18 = -[GEORPFeedbackImageIdMapEntry initWithDictionary:](v17, "initWithDictionary:", v16);
                v19 = (void *)v18;
                objc_msgSend(a1, "addImageIdMapEntry:", v18);

              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
          }
          while (v13);
        }

        v5 = v41;
      }

      if (a3)
        v20 = CFSTR("rapInfo");
      else
        v20 = CFSTR("rap_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = [GEORPRapProfileInfo alloc];
        if ((a3 & 1) != 0)
          v23 = -[GEORPRapProfileInfo initWithJSON:](v22, "initWithJSON:", v21);
        else
          v23 = -[GEORPRapProfileInfo initWithDictionary:](v22, "initWithDictionary:", v21);
        v24 = (void *)v23;
        objc_msgSend(a1, "setRapInfo:", v23);

      }
      if (a3)
        v25 = CFSTR("thirdPartyPhotoSharingPreferenceUpdateResult");
      else
        v25 = CFSTR("third_party_photo_sharing_preference_update_result");
      objc_msgSend(v5, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = [GEORPThirdPartyPhotoSharingPreferenceUpdateResult alloc];
        if ((a3 & 1) != 0)
          v28 = -[GEORPThirdPartyPhotoSharingPreferenceUpdateResult initWithJSON:](v27, "initWithJSON:", v26);
        else
          v28 = -[GEORPThirdPartyPhotoSharingPreferenceUpdateResult initWithDictionary:](v27, "initWithDictionary:", v26);
        v29 = (void *)v28;
        objc_msgSend(a1, "setThirdPartyPhotoSharingPreferenceUpdateResult:", v28);

      }
      if (a3)
        v30 = CFSTR("photoAttributionPreferencesUpdateResult");
      else
        v30 = CFSTR("photo_attribution_preferences_update_result");
      objc_msgSend(v5, "objectForKeyedSubscript:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = [GEORPPhotoAttributionPreferencesUpdateResult alloc];
        if ((a3 & 1) != 0)
          v33 = -[GEORPPhotoAttributionPreferencesUpdateResult initWithJSON:](v32, "initWithJSON:", v31);
        else
          v33 = -[GEORPPhotoAttributionPreferencesUpdateResult initWithDictionary:](v32, "initWithDictionary:", v31);
        v34 = (void *)v33;
        objc_msgSend(a1, "setPhotoAttributionPreferencesUpdateResult:", v33);

      }
      if (a3)
        v35 = CFSTR("tdmFraudRequestInfo");
      else
        v35 = CFSTR("tdm_fraud_request_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = [GEORPTdmFraudRequestInfo alloc];
        if ((a3 & 1) != 0)
          v38 = -[GEORPTdmFraudRequestInfo initWithJSON:](v37, "initWithJSON:", v36);
        else
          v38 = -[GEORPTdmFraudRequestInfo initWithDictionary:](v37, "initWithDictionary:", v36);
        v39 = (void *)v38;
        objc_msgSend(a1, "setTdmFraudRequestInfo:", v38);

      }
    }
  }

  return a1;
}

- (GEORPFeedbackSubmissionResult)initWithJSON:(id)a3
{
  return (GEORPFeedbackSubmissionResult *)-[GEORPFeedbackSubmissionResult _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1983;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1984;
    GEORPFeedbackSubmissionResultReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPFeedbackSubmissionResultCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackSubmissionResultIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackSubmissionResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  PBDataReader *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPFeedbackSubmissionResultIsDirty((uint64_t)self) & 1) == 0)
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v11);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPFeedbackSubmissionResult readAll:](self, "readAll:", 0);
    if (self->_feedbackId)
      PBDataWriterWriteStringField();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_imageIdMapEntrys;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    if (self->_rapInfo)
      PBDataWriterWriteSubmessage();
    if (self->_thirdPartyPhotoSharingPreferenceUpdateResult)
      PBDataWriterWriteSubmessage();
    if (self->_photoAttributionPreferencesUpdateResult)
      PBDataWriterWriteSubmessage();
    if (self->_tdmFraudRequestInfo)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id *v8;
  id *v9;

  v9 = (id *)a3;
  -[GEORPFeedbackSubmissionResult readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 18) = self->_readerMarkPos;
  *((_DWORD *)v9 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_feedbackId)
    objc_msgSend(v9, "setFeedbackId:");
  if (-[GEORPFeedbackSubmissionResult imageIdMapEntrysCount](self, "imageIdMapEntrysCount"))
  {
    objc_msgSend(v9, "clearImageIdMapEntrys");
    v4 = -[GEORPFeedbackSubmissionResult imageIdMapEntrysCount](self, "imageIdMapEntrysCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPFeedbackSubmissionResult imageIdMapEntryAtIndex:](self, "imageIdMapEntryAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addImageIdMapEntry:", v7);

      }
    }
  }
  if (self->_rapInfo)
    objc_msgSend(v9, "setRapInfo:");
  v8 = v9;
  if (self->_thirdPartyPhotoSharingPreferenceUpdateResult)
  {
    objc_msgSend(v9, "setThirdPartyPhotoSharingPreferenceUpdateResult:");
    v8 = v9;
  }
  if (self->_photoAttributionPreferencesUpdateResult)
  {
    objc_msgSend(v9, "setPhotoAttributionPreferencesUpdateResult:");
    v8 = v9;
  }
  if (self->_tdmFraudRequestInfo)
  {
    objc_msgSend(v9, "setTdmFraudRequestInfo:");
    v8 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
      GEORPFeedbackSubmissionResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPFeedbackSubmissionResult readAll:](self, "readAll:", 0);
  v8 = -[NSString copyWithZone:](self->_feedbackId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_imageIdMapEntrys;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v24);
        objc_msgSend((id)v5, "addImageIdMapEntry:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }

  v15 = -[GEORPRapProfileInfo copyWithZone:](self->_rapInfo, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v15;

  v17 = -[GEORPThirdPartyPhotoSharingPreferenceUpdateResult copyWithZone:](self->_thirdPartyPhotoSharingPreferenceUpdateResult, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v17;

  v19 = -[GEORPPhotoAttributionPreferencesUpdateResult copyWithZone:](self->_photoAttributionPreferencesUpdateResult, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v19;

  v21 = -[GEORPTdmFraudRequestInfo copyWithZone:](self->_tdmFraudRequestInfo, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v21;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *feedbackId;
  NSMutableArray *imageIdMapEntrys;
  GEORPRapProfileInfo *rapInfo;
  GEORPThirdPartyPhotoSharingPreferenceUpdateResult *thirdPartyPhotoSharingPreferenceUpdateResult;
  GEORPPhotoAttributionPreferencesUpdateResult *photoAttributionPreferencesUpdateResult;
  GEORPTdmFraudRequestInfo *tdmFraudRequestInfo;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPFeedbackSubmissionResult readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         feedbackId = self->_feedbackId,
         !((unint64_t)feedbackId | v4[3]))
     || -[NSString isEqual:](feedbackId, "isEqual:"))
    && ((imageIdMapEntrys = self->_imageIdMapEntrys, !((unint64_t)imageIdMapEntrys | v4[4]))
     || -[NSMutableArray isEqual:](imageIdMapEntrys, "isEqual:"))
    && ((rapInfo = self->_rapInfo, !((unint64_t)rapInfo | v4[6]))
     || -[GEORPRapProfileInfo isEqual:](rapInfo, "isEqual:"))
    && ((thirdPartyPhotoSharingPreferenceUpdateResult = self->_thirdPartyPhotoSharingPreferenceUpdateResult,
         !((unint64_t)thirdPartyPhotoSharingPreferenceUpdateResult | v4[8]))
     || -[GEORPThirdPartyPhotoSharingPreferenceUpdateResult isEqual:](thirdPartyPhotoSharingPreferenceUpdateResult, "isEqual:"))&& ((photoAttributionPreferencesUpdateResult = self->_photoAttributionPreferencesUpdateResult, !((unint64_t)photoAttributionPreferencesUpdateResult | v4[5]))|| -[GEORPPhotoAttributionPreferencesUpdateResult isEqual:](photoAttributionPreferencesUpdateResult, "isEqual:")))
  {
    tdmFraudRequestInfo = self->_tdmFraudRequestInfo;
    if ((unint64_t)tdmFraudRequestInfo | v4[7])
      v11 = -[GEORPTdmFraudRequestInfo isEqual:](tdmFraudRequestInfo, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  -[GEORPFeedbackSubmissionResult readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_feedbackId, "hash");
  v4 = -[NSMutableArray hash](self->_imageIdMapEntrys, "hash") ^ v3;
  v5 = -[GEORPRapProfileInfo hash](self->_rapInfo, "hash");
  v6 = v4 ^ v5 ^ -[GEORPThirdPartyPhotoSharingPreferenceUpdateResult hash](self->_thirdPartyPhotoSharingPreferenceUpdateResult, "hash");
  v7 = -[GEORPPhotoAttributionPreferencesUpdateResult hash](self->_photoAttributionPreferencesUpdateResult, "hash");
  return v6 ^ v7 ^ -[GEORPTdmFraudRequestInfo hash](self->_tdmFraudRequestInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  GEORPRapProfileInfo *rapInfo;
  id v11;
  GEORPThirdPartyPhotoSharingPreferenceUpdateResult *thirdPartyPhotoSharingPreferenceUpdateResult;
  id v13;
  GEORPPhotoAttributionPreferencesUpdateResult *photoAttributionPreferencesUpdateResult;
  id v15;
  GEORPTdmFraudRequestInfo *tdmFraudRequestInfo;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  if (v4[3])
    -[GEORPFeedbackSubmissionResult setFeedbackId:](self, "setFeedbackId:");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v4[4];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        -[GEORPFeedbackSubmissionResult addImageIdMapEntry:](self, "addImageIdMapEntry:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  rapInfo = self->_rapInfo;
  v11 = v4[6];
  if (rapInfo)
  {
    if (v11)
      -[GEORPRapProfileInfo mergeFrom:](rapInfo, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEORPFeedbackSubmissionResult setRapInfo:](self, "setRapInfo:");
  }
  thirdPartyPhotoSharingPreferenceUpdateResult = self->_thirdPartyPhotoSharingPreferenceUpdateResult;
  v13 = v4[8];
  if (thirdPartyPhotoSharingPreferenceUpdateResult)
  {
    if (v13)
      -[GEORPThirdPartyPhotoSharingPreferenceUpdateResult mergeFrom:](thirdPartyPhotoSharingPreferenceUpdateResult, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEORPFeedbackSubmissionResult setThirdPartyPhotoSharingPreferenceUpdateResult:](self, "setThirdPartyPhotoSharingPreferenceUpdateResult:");
  }
  photoAttributionPreferencesUpdateResult = self->_photoAttributionPreferencesUpdateResult;
  v15 = v4[5];
  if (photoAttributionPreferencesUpdateResult)
  {
    if (v15)
      -[GEORPPhotoAttributionPreferencesUpdateResult mergeFrom:](photoAttributionPreferencesUpdateResult, "mergeFrom:");
  }
  else if (v15)
  {
    -[GEORPFeedbackSubmissionResult setPhotoAttributionPreferencesUpdateResult:](self, "setPhotoAttributionPreferencesUpdateResult:");
  }
  tdmFraudRequestInfo = self->_tdmFraudRequestInfo;
  v17 = v4[7];
  if (tdmFraudRequestInfo)
  {
    if (v17)
      -[GEORPTdmFraudRequestInfo mergeFrom:](tdmFraudRequestInfo, "mergeFrom:");
  }
  else if (v17)
  {
    -[GEORPFeedbackSubmissionResult setTdmFraudRequestInfo:](self, "setTdmFraudRequestInfo:");
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
      GEORPFeedbackSubmissionResultReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1987);
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
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x81u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORPFeedbackSubmissionResult readAll:](self, "readAll:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_imageIdMapEntrys;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    -[GEORPRapProfileInfo clearUnknownFields:](self->_rapInfo, "clearUnknownFields:", 1);
    -[GEORPTdmFraudRequestInfo clearUnknownFields:](self->_tdmFraudRequestInfo, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thirdPartyPhotoSharingPreferenceUpdateResult, 0);
  objc_storeStrong((id *)&self->_tdmFraudRequestInfo, 0);
  objc_storeStrong((id *)&self->_rapInfo, 0);
  objc_storeStrong((id *)&self->_photoAttributionPreferencesUpdateResult, 0);
  objc_storeStrong((id *)&self->_imageIdMapEntrys, 0);
  objc_storeStrong((id *)&self->_feedbackId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
