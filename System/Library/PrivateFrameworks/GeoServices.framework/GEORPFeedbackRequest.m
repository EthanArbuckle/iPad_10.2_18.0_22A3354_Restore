@implementation GEORPFeedbackRequest

- (GEORPFeedbackRequest)init
{
  GEORPFeedbackRequest *v2;
  GEORPFeedbackRequest *v3;
  GEORPFeedbackRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackRequest;
  v2 = -[GEORPFeedbackRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackRequest)initWithData:(id)a3
{
  GEORPFeedbackRequest *v3;
  GEORPFeedbackRequest *v4;
  GEORPFeedbackRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackRequest;
  v3 = -[GEORPFeedbackRequest initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEORPFeedbackRequest;
  -[GEORPFeedbackRequest dealloc](&v3, sel_dealloc);
}

- (int)feedbackRequestType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_feedbackRequestType;
  else
    return 0;
}

- (void)setFeedbackRequestType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x801u;
  self->_feedbackRequestType = a3;
}

- (void)setHasFeedbackRequestType:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x800;
}

- (BOOL)hasFeedbackRequestType
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)feedbackRequestTypeAsString:(int)a3
{
  if (a3 < 8)
    return off_1E1C03B00[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFeedbackRequestType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_SUBMISSION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_ID_LOOKUP")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_QUERY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_IMAGE_UPLOAD")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_LAYOUT_CONFIG")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_TDM_FRAUD_NOTIFICATION")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_LOG_EVENT")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readFeedbackRequestParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeedbackRequestParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasFeedbackRequestParameters
{
  -[GEORPFeedbackRequest _readFeedbackRequestParameters]((uint64_t)self);
  return self->_feedbackRequestParameters != 0;
}

- (GEORPFeedbackRequestParameters)feedbackRequestParameters
{
  -[GEORPFeedbackRequest _readFeedbackRequestParameters]((uint64_t)self);
  return self->_feedbackRequestParameters;
}

- (void)setFeedbackRequestParameters:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA00u;
  objc_storeStrong((id *)&self->_feedbackRequestParameters, a3);
}

- (void)_readUserInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasUserInfo
{
  -[GEORPFeedbackRequest _readUserInfo]((uint64_t)self);
  return self->_userInfo != 0;
}

- (GEORPFeedbackUserInfo)userInfo
{
  -[GEORPFeedbackRequest _readUserInfo]((uint64_t)self);
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0xC00u;
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void)_readAnalyticMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnalyticMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasAnalyticMetadata
{
  -[GEORPFeedbackRequest _readAnalyticMetadata]((uint64_t)self);
  return self->_analyticMetadata != 0;
}

- (GEOPDAnalyticMetadata)analyticMetadata
{
  -[GEORPFeedbackRequest _readAnalyticMetadata]((uint64_t)self);
  return self->_analyticMetadata;
}

- (void)setAnalyticMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x810u;
  objc_storeStrong((id *)&self->_analyticMetadata, a3);
}

- (void)_readClientMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasClientMetadata
{
  -[GEORPFeedbackRequest _readClientMetadata]((uint64_t)self);
  return self->_clientMetadata != 0;
}

- (GEOPDClientMetadata)clientMetadata
{
  -[GEORPFeedbackRequest _readClientMetadata]((uint64_t)self);
  return self->_clientMetadata;
}

- (void)setClientMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x840u;
  objc_storeStrong((id *)&self->_clientMetadata, a3);
}

- (void)_readClientCapabilities
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientCapabilities_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasClientCapabilities
{
  -[GEORPFeedbackRequest _readClientCapabilities]((uint64_t)self);
  return self->_clientCapabilities != 0;
}

- (GEORPClientCapabilities)clientCapabilities
{
  -[GEORPFeedbackRequest _readClientCapabilities]((uint64_t)self);
  return self->_clientCapabilities;
}

- (void)setClientCapabilities:(id)a3
{
  *(_WORD *)&self->_flags |= 0x820u;
  objc_storeStrong((id *)&self->_clientCapabilities, a3);
}

- (void)_readDisplayLanguages
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayLanguages_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)displayLanguages
{
  -[GEORPFeedbackRequest _readDisplayLanguages]((uint64_t)self);
  return self->_displayLanguages;
}

- (void)setDisplayLanguages:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *displayLanguages;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  displayLanguages = self->_displayLanguages;
  self->_displayLanguages = v4;

}

- (void)clearDisplayLanguages
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  -[NSMutableArray removeAllObjects](self->_displayLanguages, "removeAllObjects");
}

- (void)addDisplayLanguage:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPFeedbackRequest _readDisplayLanguages]((uint64_t)self);
  -[GEORPFeedbackRequest _addNoFlagsDisplayLanguage:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (void)_addNoFlagsDisplayLanguage:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 88);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v5;

      v4 = *(void **)(a1 + 88);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)displayLanguagesCount
{
  -[GEORPFeedbackRequest _readDisplayLanguages]((uint64_t)self);
  return -[NSMutableArray count](self->_displayLanguages, "count");
}

- (id)displayLanguageAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackRequest _readDisplayLanguages]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_displayLanguages, "objectAtIndex:", a3);
}

+ (Class)displayLanguageType
{
  return (Class)objc_opt_class();
}

- (void)_readAbClientMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAbClientMetadata_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasAbClientMetadata
{
  -[GEORPFeedbackRequest _readAbClientMetadata]((uint64_t)self);
  return self->_abClientMetadata != 0;
}

- (GEOABSecondPartyPlaceRequestClientMetaData)abClientMetadata
{
  -[GEORPFeedbackRequest _readAbClientMetadata]((uint64_t)self);
  return self->_abClientMetadata;
}

- (void)setAbClientMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x808u;
  objc_storeStrong((id *)&self->_abClientMetadata, a3);
}

- (void)_readFeedbackClientCapabilities
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeedbackClientCapabilities_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)feedbackClientCapabilitiesCount
{
  -[GEORPFeedbackRequest _readFeedbackClientCapabilities]((uint64_t)self);
  return self->_feedbackClientCapabilities.count;
}

- (int)feedbackClientCapabilities
{
  -[GEORPFeedbackRequest _readFeedbackClientCapabilities]((uint64_t)self);
  return self->_feedbackClientCapabilities.list;
}

- (void)clearFeedbackClientCapabilities
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  PBRepeatedInt32Clear();
}

- (void)addFeedbackClientCapabilities:(int)a3
{
  -[GEORPFeedbackRequest _readFeedbackClientCapabilities]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (int)feedbackClientCapabilitiesAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_feedbackClientCapabilities;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORPFeedbackRequest _readFeedbackClientCapabilities]((uint64_t)self);
  p_feedbackClientCapabilities = &self->_feedbackClientCapabilities;
  count = self->_feedbackClientCapabilities.count;
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
  return p_feedbackClientCapabilities->list[a3];
}

- (void)setFeedbackClientCapabilities:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  PBRepeatedInt32Set();
}

- (id)feedbackClientCapabilitiesAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("FEEDBACK_CLIENT_CAPABILITIES_UNKNOWN");
  if (a3 == 1)
  {
    v3 = CFSTR("FEEDBACK_CLIENT_CAPABILITIES_COMMUNITY_ID");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsFeedbackClientCapabilities:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_CLIENT_CAPABILITIES_UNKNOWN")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_CLIENT_CAPABILITIES_COMMUNITY_ID"));

  return v4;
}

- (void)_readDebugSettings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDebugSettings_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasDebugSettings
{
  -[GEORPFeedbackRequest _readDebugSettings]((uint64_t)self);
  return self->_debugSettings != 0;
}

- (GEORPDebugSettings)debugSettings
{
  -[GEORPFeedbackRequest _readDebugSettings]((uint64_t)self);
  return self->_debugSettings;
}

- (void)setDebugSettings:(id)a3
{
  *(_WORD *)&self->_flags |= 0x880u;
  objc_storeStrong((id *)&self->_debugSettings, a3);
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
  v8.super_class = (Class)GEORPFeedbackRequest;
  -[GEORPFeedbackRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
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
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  _QWORD *v35;
  unint64_t v36;
  uint64_t v37;
  __CFString *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  _QWORD v51[4];
  id v52;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)(a1 + 128) & 1) != 0)
  {
    v5 = *(int *)(a1 + 124);
    if (v5 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 124));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C03B00[v5];
    }
    if (a2)
      v7 = CFSTR("feedbackRequestType");
    else
      v7 = CFSTR("feedback_request_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  objc_msgSend((id)a1, "feedbackRequestParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "jsonRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("feedbackRequestParameters");
    }
    else
    {
      objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("feedback_request_parameters");
    }
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  objc_msgSend((id)a1, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "jsonRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("userInfo");
    }
    else
    {
      objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("user_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  objc_msgSend((id)a1, "analyticMetadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v16, "jsonRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("analyticMetadata");
    }
    else
    {
      objc_msgSend(v16, "dictionaryRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("analytic_metadata");
    }
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  objc_msgSend((id)a1, "clientMetadata");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v20, "jsonRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("clientMetadata");
    }
    else
    {
      objc_msgSend(v20, "dictionaryRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("client_metadata");
    }
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
  objc_msgSend((id)a1, "clientCapabilities");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v24, "jsonRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("clientCapabilities");
    }
    else
    {
      objc_msgSend(v24, "dictionaryRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("client_capabilities");
    }
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

  }
  if (*(_QWORD *)(a1 + 88))
  {
    objc_msgSend((id)a1, "displayLanguages");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v29 = CFSTR("displayLanguage");
    else
      v29 = CFSTR("display_language");
    objc_msgSend(v4, "setObject:forKey:", v28, v29);

  }
  objc_msgSend((id)a1, "abClientMetadata");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v30, "jsonRepresentation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("abClientMetadata");
    }
    else
    {
      objc_msgSend(v30, "dictionaryRepresentation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("ab_client_metadata");
    }
    objc_msgSend(v4, "setObject:forKey:", v32, v33);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v36 = 0;
      do
      {
        v37 = *(unsigned int *)(*v35 + 4 * v36);
        if ((_DWORD)v37)
        {
          if ((_DWORD)v37 == 1)
          {
            v38 = CFSTR("FEEDBACK_CLIENT_CAPABILITIES_COMMUNITY_ID");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v37);
            v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v38 = CFSTR("FEEDBACK_CLIENT_CAPABILITIES_UNKNOWN");
        }
        objc_msgSend(v34, "addObject:", v38);

        ++v36;
        v35 = (_QWORD *)(a1 + 24);
      }
      while (v36 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v39 = CFSTR("feedbackClientCapabilities");
    else
      v39 = CFSTR("feedback_client_capabilities");
    objc_msgSend(v4, "setObject:forKey:", v34, v39);

  }
  objc_msgSend((id)a1, "debugSettings");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (v40)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v40, "jsonRepresentation");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = CFSTR("debugSettings");
    }
    else
    {
      objc_msgSend(v40, "dictionaryRepresentation");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = CFSTR("debug_settings");
    }
    objc_msgSend(v4, "setObject:forKey:", v42, v43);

  }
  v44 = *(void **)(a1 + 16);
  if (v44)
  {
    objc_msgSend(v44, "dictionaryRepresentation");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v45, "count"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __50__GEORPFeedbackRequest__dictionaryRepresentation___block_invoke;
      v51[3] = &unk_1E1C00600;
      v48 = v47;
      v52 = v48;
      objc_msgSend(v46, "enumerateKeysAndObjectsUsingBlock:", v51);
      v49 = v48;

      v46 = v49;
    }
    objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEORPFeedbackRequest__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPFeedbackRequest)initWithDictionary:(id)a3
{
  return (GEORPFeedbackRequest *)-[GEORPFeedbackRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  GEORPFeedbackRequestParameters *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  GEORPFeedbackUserInfo *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  GEOPDAnalyticMetadata *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  GEOPDClientMetadata *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  GEORPClientCapabilities *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  int v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  GEOABSecondPartyPlaceRequestClientMetaData *v48;
  uint64_t v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  void *v58;
  id v59;
  uint64_t v60;
  const __CFString *v61;
  void *v62;
  GEORPDebugSettings *v63;
  uint64_t v64;
  void *v65;
  int v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_119;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_119;
  if (a3)
    v6 = CFSTR("feedbackRequestType");
  else
    v6 = CFSTR("feedback_request_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_SUBMISSION")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_ID_LOOKUP")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_QUERY")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_IMAGE_UPLOAD")) & 1) != 0)
    {
      v9 = 4;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_LAYOUT_CONFIG")) & 1) != 0)
    {
      v9 = 5;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_TDM_FRAUD_NOTIFICATION")) & 1) != 0)
    {
      v9 = 6;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_LOG_EVENT")))
    {
      v9 = 7;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_27:
    objc_msgSend(a1, "setFeedbackRequestType:", v9);
  }

  if (a3)
    v10 = CFSTR("feedbackRequestParameters");
  else
    v10 = CFSTR("feedback_request_parameters");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = [GEORPFeedbackRequestParameters alloc];
    if ((a3 & 1) != 0)
      v13 = -[GEORPFeedbackRequestParameters initWithJSON:](v12, "initWithJSON:", v11);
    else
      v13 = -[GEORPFeedbackRequestParameters initWithDictionary:](v12, "initWithDictionary:", v11);
    v14 = (void *)v13;
    objc_msgSend(a1, "setFeedbackRequestParameters:", v13);

  }
  if (a3)
    v15 = CFSTR("userInfo");
  else
    v15 = CFSTR("user_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = [GEORPFeedbackUserInfo alloc];
    if ((a3 & 1) != 0)
      v18 = -[GEORPFeedbackUserInfo initWithJSON:](v17, "initWithJSON:", v16);
    else
      v18 = -[GEORPFeedbackUserInfo initWithDictionary:](v17, "initWithDictionary:", v16);
    v19 = (void *)v18;
    objc_msgSend(a1, "setUserInfo:", v18);

  }
  if (a3)
    v20 = CFSTR("analyticMetadata");
  else
    v20 = CFSTR("analytic_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = [GEOPDAnalyticMetadata alloc];
    if ((a3 & 1) != 0)
      v23 = -[GEOPDAnalyticMetadata initWithJSON:](v22, "initWithJSON:", v21);
    else
      v23 = -[GEOPDAnalyticMetadata initWithDictionary:](v22, "initWithDictionary:", v21);
    v24 = (void *)v23;
    objc_msgSend(a1, "setAnalyticMetadata:", v23);

  }
  if (a3)
    v25 = CFSTR("clientMetadata");
  else
    v25 = CFSTR("client_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = [GEOPDClientMetadata alloc];
    if ((a3 & 1) != 0)
      v28 = -[GEOPDClientMetadata initWithJSON:](v27, "initWithJSON:", v26);
    else
      v28 = -[GEOPDClientMetadata initWithDictionary:](v27, "initWithDictionary:", v26);
    v29 = (void *)v28;
    objc_msgSend(a1, "setClientMetadata:", v28);

  }
  if (a3)
    v30 = CFSTR("clientCapabilities");
  else
    v30 = CFSTR("client_capabilities");
  objc_msgSend(v5, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = [GEORPClientCapabilities alloc];
    if ((a3 & 1) != 0)
      v33 = -[GEORPClientCapabilities initWithJSON:](v32, "initWithJSON:", v31);
    else
      v33 = -[GEORPClientCapabilities initWithDictionary:](v32, "initWithDictionary:", v31);
    v34 = (void *)v33;
    objc_msgSend(a1, "setClientCapabilities:", v33);

  }
  if (a3)
    v35 = CFSTR("displayLanguage");
  else
    v35 = CFSTR("display_language");
  objc_msgSend(v5, "objectForKeyedSubscript:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = a3;
    v38 = v5;
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v39 = v36;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v74 != v42)
            objc_enumerationMutation(v39);
          v44 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v45 = (void *)objc_msgSend(v44, "copy");
            objc_msgSend(a1, "addDisplayLanguage:", v45);

          }
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
      }
      while (v41);
    }

    v5 = v38;
    a3 = v37;
  }

  if (a3)
    v46 = CFSTR("abClientMetadata");
  else
    v46 = CFSTR("ab_client_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v48 = [GEOABSecondPartyPlaceRequestClientMetaData alloc];
    if ((a3 & 1) != 0)
      v49 = -[GEOABSecondPartyPlaceRequestClientMetaData initWithJSON:](v48, "initWithJSON:", v47);
    else
      v49 = -[GEOABSecondPartyPlaceRequestClientMetaData initWithDictionary:](v48, "initWithDictionary:", v47);
    v50 = (void *)v49;
    objc_msgSend(a1, "setAbClientMetadata:", v49);

  }
  if (a3)
    v51 = CFSTR("feedbackClientCapabilities");
  else
    v51 = CFSTR("feedback_client_capabilities");
  objc_msgSend(v5, "objectForKeyedSubscript:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v67 = a3;
    v68 = v5;
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v53 = v52;
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
    if (!v54)
      goto LABEL_109;
    v55 = v54;
    v56 = *(_QWORD *)v70;
    while (1)
    {
      for (j = 0; j != v55; ++j)
      {
        if (*(_QWORD *)v70 != v56)
          objc_enumerationMutation(v53);
        v58 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v59 = v58;
          if ((objc_msgSend(v59, "isEqualToString:", CFSTR("FEEDBACK_CLIENT_CAPABILITIES_UNKNOWN")) & 1) != 0)
            v60 = 0;
          else
            v60 = objc_msgSend(v59, "isEqualToString:", CFSTR("FEEDBACK_CLIENT_CAPABILITIES_COMMUNITY_ID"));

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v60 = objc_msgSend(v58, "intValue");
        }
        objc_msgSend(a1, "addFeedbackClientCapabilities:", v60);
      }
      v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
      if (!v55)
      {
LABEL_109:

        v5 = v68;
        a3 = v67;
        break;
      }
    }
  }

  if (a3)
    v61 = CFSTR("debugSettings");
  else
    v61 = CFSTR("debug_settings");
  objc_msgSend(v5, "objectForKeyedSubscript:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v63 = [GEORPDebugSettings alloc];
    if ((a3 & 1) != 0)
      v64 = -[GEORPDebugSettings initWithJSON:](v63, "initWithJSON:", v62);
    else
      v64 = -[GEORPDebugSettings initWithDictionary:](v63, "initWithDictionary:", v62);
    v65 = (void *)v64;
    objc_msgSend(a1, "setDebugSettings:", v64);

  }
LABEL_119:

  return a1;
}

- (GEORPFeedbackRequest)initWithJSON:(id)a3
{
  return (GEORPFeedbackRequest *)-[GEORPFeedbackRequest _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1534;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1535;
    GEORPFeedbackRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPFeedbackRequestCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackRequestReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
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
  if (self->_reader && (_GEORPFeedbackRequestIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPFeedbackRequest readAll:](self, "readAll:", 0);
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_feedbackRequestParameters)
      PBDataWriterWriteSubmessage();
    if (self->_userInfo)
      PBDataWriterWriteSubmessage();
    if (self->_analyticMetadata)
      PBDataWriterWriteSubmessage();
    if (self->_clientMetadata)
      PBDataWriterWriteSubmessage();
    if (self->_clientCapabilities)
      PBDataWriterWriteSubmessage();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_displayLanguages;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteStringField();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    if (self->_abClientMetadata)
      PBDataWriterWriteSubmessage();
    if (self->_feedbackClientCapabilities.count)
    {
      PBDataWriterPlaceMark();
      if (self->_feedbackClientCapabilities.count)
      {
        v10 = 0;
        do
        {
          PBDataWriterWriteInt32Field();
          ++v10;
        }
        while (v10 < self->_feedbackClientCapabilities.count);
      }
      PBDataWriterRecallMark();
    }
    if (self->_debugSettings)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEORPFeedbackRequestClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPFeedbackRequest _readClientMetadata]((uint64_t)self);
  if (-[GEOPDClientMetadata hasGreenTeaWithValue:](self->_clientMetadata, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPFeedbackRequest _readFeedbackRequestParameters]((uint64_t)self);
  return -[GEORPFeedbackRequestParameters hasGreenTeaWithValue:](self->_feedbackRequestParameters, "hasGreenTeaWithValue:", v3);
}

- (unsigned)requestTypeCode
{
  return 1015;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
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
  -[GEORPFeedbackRequest readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 28) = self->_readerMarkPos;
  *((_DWORD *)v11 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v11 + 31) = self->_feedbackRequestType;
    *((_WORD *)v11 + 64) |= 1u;
  }
  if (self->_feedbackRequestParameters)
    objc_msgSend(v11, "setFeedbackRequestParameters:");
  if (self->_userInfo)
    objc_msgSend(v11, "setUserInfo:");
  if (self->_analyticMetadata)
    objc_msgSend(v11, "setAnalyticMetadata:");
  if (self->_clientMetadata)
    objc_msgSend(v11, "setClientMetadata:");
  if (self->_clientCapabilities)
    objc_msgSend(v11, "setClientCapabilities:");
  if (-[GEORPFeedbackRequest displayLanguagesCount](self, "displayLanguagesCount"))
  {
    objc_msgSend(v11, "clearDisplayLanguages");
    v4 = -[GEORPFeedbackRequest displayLanguagesCount](self, "displayLanguagesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPFeedbackRequest displayLanguageAtIndex:](self, "displayLanguageAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addDisplayLanguage:", v7);

      }
    }
  }
  if (self->_abClientMetadata)
    objc_msgSend(v11, "setAbClientMetadata:");
  if (-[GEORPFeedbackRequest feedbackClientCapabilitiesCount](self, "feedbackClientCapabilitiesCount"))
  {
    objc_msgSend(v11, "clearFeedbackClientCapabilities");
    v8 = -[GEORPFeedbackRequest feedbackClientCapabilitiesCount](self, "feedbackClientCapabilitiesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(v11, "addFeedbackClientCapabilities:", -[GEORPFeedbackRequest feedbackClientCapabilitiesAtIndex:](self, "feedbackClientCapabilitiesAtIndex:", j));
    }
  }
  if (self->_debugSettings)
    objc_msgSend(v11, "setDebugSettings:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  PBUnknownFields *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPFeedbackRequestReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPFeedbackRequest readAll:](self, "readAll:", 0);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 124) = self->_feedbackRequestType;
    *(_WORD *)(v5 + 128) |= 1u;
  }
  v9 = -[GEORPFeedbackRequestParameters copyWithZone:](self->_feedbackRequestParameters, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v9;

  v11 = -[GEORPFeedbackUserInfo copyWithZone:](self->_userInfo, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v11;

  v13 = -[GEOPDAnalyticMetadata copyWithZone:](self->_analyticMetadata, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v13;

  v15 = -[GEOPDClientMetadata copyWithZone:](self->_clientMetadata, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v15;

  v17 = -[GEORPClientCapabilities copyWithZone:](self->_clientCapabilities, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v17;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v19 = self->_displayLanguages;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v31 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v30);
        objc_msgSend((id)v5, "addDisplayLanguage:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v20);
  }

  v24 = -[GEOABSecondPartyPlaceRequestClientMetaData copyWithZone:](self->_abClientMetadata, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v24;

  PBRepeatedInt32Copy();
  v26 = -[GEORPDebugSettings copyWithZone:](self->_debugSettings, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v26;

  v28 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v28;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  GEORPFeedbackRequestParameters *feedbackRequestParameters;
  GEORPFeedbackUserInfo *userInfo;
  GEOPDAnalyticMetadata *analyticMetadata;
  GEOPDClientMetadata *clientMetadata;
  GEORPClientCapabilities *clientCapabilities;
  NSMutableArray *displayLanguages;
  GEOABSecondPartyPlaceRequestClientMetaData *abClientMetadata;
  GEORPDebugSettings *debugSettings;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[GEORPFeedbackRequest readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *((_WORD *)v4 + 64);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_feedbackRequestType != *((_DWORD *)v4 + 31))
      goto LABEL_24;
  }
  else if ((v5 & 1) != 0)
  {
LABEL_24:
    v14 = 0;
    goto LABEL_25;
  }
  feedbackRequestParameters = self->_feedbackRequestParameters;
  if ((unint64_t)feedbackRequestParameters | *((_QWORD *)v4 + 12)
    && !-[GEORPFeedbackRequestParameters isEqual:](feedbackRequestParameters, "isEqual:"))
  {
    goto LABEL_24;
  }
  userInfo = self->_userInfo;
  if ((unint64_t)userInfo | *((_QWORD *)v4 + 13))
  {
    if (!-[GEORPFeedbackUserInfo isEqual:](userInfo, "isEqual:"))
      goto LABEL_24;
  }
  analyticMetadata = self->_analyticMetadata;
  if ((unint64_t)analyticMetadata | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOPDAnalyticMetadata isEqual:](analyticMetadata, "isEqual:"))
      goto LABEL_24;
  }
  clientMetadata = self->_clientMetadata;
  if ((unint64_t)clientMetadata | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOPDClientMetadata isEqual:](clientMetadata, "isEqual:"))
      goto LABEL_24;
  }
  clientCapabilities = self->_clientCapabilities;
  if ((unint64_t)clientCapabilities | *((_QWORD *)v4 + 8))
  {
    if (!-[GEORPClientCapabilities isEqual:](clientCapabilities, "isEqual:"))
      goto LABEL_24;
  }
  displayLanguages = self->_displayLanguages;
  if ((unint64_t)displayLanguages | *((_QWORD *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](displayLanguages, "isEqual:"))
      goto LABEL_24;
  }
  abClientMetadata = self->_abClientMetadata;
  if ((unint64_t)abClientMetadata | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOABSecondPartyPlaceRequestClientMetaData isEqual:](abClientMetadata, "isEqual:"))
      goto LABEL_24;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_24;
  debugSettings = self->_debugSettings;
  if ((unint64_t)debugSettings | *((_QWORD *)v4 + 10))
    v14 = -[GEORPDebugSettings isEqual:](debugSettings, "isEqual:");
  else
    v14 = 1;
LABEL_25:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  -[GEORPFeedbackRequest readAll:](self, "readAll:", 1);
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_feedbackRequestType;
  else
    v3 = 0;
  v4 = -[GEORPFeedbackRequestParameters hash](self->_feedbackRequestParameters, "hash") ^ v3;
  v5 = -[GEORPFeedbackUserInfo hash](self->_userInfo, "hash");
  v6 = v4 ^ v5 ^ -[GEOPDAnalyticMetadata hash](self->_analyticMetadata, "hash");
  v7 = -[GEOPDClientMetadata hash](self->_clientMetadata, "hash");
  v8 = v7 ^ -[GEORPClientCapabilities hash](self->_clientCapabilities, "hash");
  v9 = v6 ^ v8 ^ -[NSMutableArray hash](self->_displayLanguages, "hash");
  v10 = -[GEOABSecondPartyPlaceRequestClientMetaData hash](self->_abClientMetadata, "hash");
  v11 = v10 ^ PBRepeatedInt32Hash();
  return v9 ^ v11 ^ -[GEORPDebugSettings hash](self->_debugSettings, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEORPFeedbackRequestParameters *feedbackRequestParameters;
  uint64_t v6;
  GEORPFeedbackUserInfo *userInfo;
  uint64_t v8;
  GEOPDAnalyticMetadata *analyticMetadata;
  uint64_t v10;
  GEOPDClientMetadata *clientMetadata;
  uint64_t v12;
  GEORPClientCapabilities *clientCapabilities;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  GEOABSecondPartyPlaceRequestClientMetaData *abClientMetadata;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  GEORPDebugSettings *debugSettings;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_WORD *)v4 + 64) & 1) != 0)
  {
    self->_feedbackRequestType = *((_DWORD *)v4 + 31);
    *(_WORD *)&self->_flags |= 1u;
  }
  feedbackRequestParameters = self->_feedbackRequestParameters;
  v6 = *((_QWORD *)v4 + 12);
  if (feedbackRequestParameters)
  {
    if (v6)
      -[GEORPFeedbackRequestParameters mergeFrom:](feedbackRequestParameters, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEORPFeedbackRequest setFeedbackRequestParameters:](self, "setFeedbackRequestParameters:");
  }
  userInfo = self->_userInfo;
  v8 = *((_QWORD *)v4 + 13);
  if (userInfo)
  {
    if (v8)
      -[GEORPFeedbackUserInfo mergeFrom:](userInfo, "mergeFrom:");
  }
  else if (v8)
  {
    -[GEORPFeedbackRequest setUserInfo:](self, "setUserInfo:");
  }
  analyticMetadata = self->_analyticMetadata;
  v10 = *((_QWORD *)v4 + 7);
  if (analyticMetadata)
  {
    if (v10)
      -[GEOPDAnalyticMetadata mergeFrom:](analyticMetadata, "mergeFrom:");
  }
  else if (v10)
  {
    -[GEORPFeedbackRequest setAnalyticMetadata:](self, "setAnalyticMetadata:");
  }
  clientMetadata = self->_clientMetadata;
  v12 = *((_QWORD *)v4 + 9);
  if (clientMetadata)
  {
    if (v12)
      -[GEOPDClientMetadata mergeFrom:](clientMetadata, "mergeFrom:");
  }
  else if (v12)
  {
    -[GEORPFeedbackRequest setClientMetadata:](self, "setClientMetadata:");
  }
  clientCapabilities = self->_clientCapabilities;
  v14 = *((_QWORD *)v4 + 8);
  if (clientCapabilities)
  {
    if (v14)
      -[GEORPClientCapabilities mergeFrom:](clientCapabilities, "mergeFrom:");
  }
  else if (v14)
  {
    -[GEORPFeedbackRequest setClientCapabilities:](self, "setClientCapabilities:");
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v15 = *((id *)v4 + 11);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v15);
        -[GEORPFeedbackRequest addDisplayLanguage:](self, "addDisplayLanguage:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), (_QWORD)v27);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v17);
  }

  abClientMetadata = self->_abClientMetadata;
  v21 = *((_QWORD *)v4 + 6);
  if (abClientMetadata)
  {
    if (v21)
      -[GEOABSecondPartyPlaceRequestClientMetaData mergeFrom:](abClientMetadata, "mergeFrom:");
  }
  else if (v21)
  {
    -[GEORPFeedbackRequest setAbClientMetadata:](self, "setAbClientMetadata:");
  }
  v22 = objc_msgSend(v4, "feedbackClientCapabilitiesCount", (_QWORD)v27);
  if (v22)
  {
    v23 = v22;
    for (j = 0; j != v23; ++j)
      -[GEORPFeedbackRequest addFeedbackClientCapabilities:](self, "addFeedbackClientCapabilities:", objc_msgSend(v4, "feedbackClientCapabilitiesAtIndex:", j));
  }
  debugSettings = self->_debugSettings;
  v26 = *((_QWORD *)v4 + 10);
  if (debugSettings)
  {
    if (v26)
      -[GEORPDebugSettings mergeFrom:](debugSettings, "mergeFrom:");
  }
  else if (v26)
  {
    -[GEORPFeedbackRequest setDebugSettings:](self, "setDebugSettings:");
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
      GEORPFeedbackRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1539);
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
  *(_WORD *)&self->_flags |= 0x802u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORPFeedbackRequest readAll:](self, "readAll:", 0);
    -[GEORPFeedbackRequestParameters clearUnknownFields:](self->_feedbackRequestParameters, "clearUnknownFields:", 1);
    -[GEORPFeedbackUserInfo clearUnknownFields:](self->_userInfo, "clearUnknownFields:", 1);
    -[GEOPDAnalyticMetadata clearUnknownFields:](self->_analyticMetadata, "clearUnknownFields:", 1);
    -[GEOPDClientMetadata clearUnknownFields:](self->_clientMetadata, "clearUnknownFields:", 1);
    -[GEOABSecondPartyPlaceRequestClientMetaData clearUnknownFields:](self->_abClientMetadata, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_feedbackRequestParameters, 0);
  objc_storeStrong((id *)&self->_displayLanguages, 0);
  objc_storeStrong((id *)&self->_debugSettings, 0);
  objc_storeStrong((id *)&self->_clientMetadata, 0);
  objc_storeStrong((id *)&self->_clientCapabilities, 0);
  objc_storeStrong((id *)&self->_analyticMetadata, 0);
  objc_storeStrong((id *)&self->_abClientMetadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEORPFeedbackRequest)initWithFeedbackRequestParameters:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  GEORPFeedbackRequest *v8;
  GEORPFeedbackRequest *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[GEORPFeedbackRequest init](self, "init");
  v9 = v8;
  if (v8)
    -[GEORPFeedbackRequest _sharedInitWithRequestParameters:userInfo:traits:debugSettings:](v8, "_sharedInitWithRequestParameters:userInfo:traits:debugSettings:", v6, 0, v7, 0);

  return v9;
}

- (GEORPFeedbackRequest)initWithFeedbackRequestParameters:(id)a3 userInfo:(id)a4 traits:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEORPFeedbackRequest *v11;
  GEORPFeedbackRequest *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[GEORPFeedbackRequest init](self, "init");
  v12 = v11;
  if (v11)
    -[GEORPFeedbackRequest _sharedInitWithRequestParameters:userInfo:traits:debugSettings:](v11, "_sharedInitWithRequestParameters:userInfo:traits:debugSettings:", v8, v9, v10, 0);

  return v12;
}

- (GEORPFeedbackRequest)initWithFeedbackRequestParameters:(id)a3 userInfo:(id)a4 traits:(id)a5 debugSettings:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  GEORPFeedbackRequest *v14;
  GEORPFeedbackRequest *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[GEORPFeedbackRequest init](self, "init");
  v15 = v14;
  if (v14)
    -[GEORPFeedbackRequest _sharedInitWithRequestParameters:userInfo:traits:debugSettings:](v14, "_sharedInitWithRequestParameters:userInfo:traits:debugSettings:", v10, v11, v12, v13);

  return v15;
}

- (GEORPFeedbackRequest)initWithFeedbackRequestParameters:(id)a3 userCredentials:(id)a4 pushToken:(id)a5 allowContactBackAtEmailAddress:(id)a6 traits:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  GEORPFeedbackRequest *v17;
  GEORPFeedbackUserInfo *v18;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = -[GEORPFeedbackRequest init](self, "init");
  if (v17)
  {
    v18 = objc_alloc_init(GEORPFeedbackUserInfo);
    -[GEORPFeedbackUserInfo setUserCredentials:](v18, "setUserCredentials:", v13);
    -[GEORPFeedbackUserInfo setUserEmail:](v18, "setUserEmail:", v15);
    -[GEORPFeedbackUserInfo setDevicePushToken:](v18, "setDevicePushToken:", v14);
    -[GEORPFeedbackRequest _sharedInitWithRequestParameters:userInfo:traits:debugSettings:](v17, "_sharedInitWithRequestParameters:userInfo:traits:debugSettings:", v12, v18, v16, 0);

  }
  return v17;
}

+ (id)clientTestingDebugSettings
{
  GEORPDebugSettings *v2;
  void *v3;

  v2 = objc_alloc_init(GEORPDebugSettings);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", CFSTR("CLIENT_TEST"), 0);
  -[GEORPDebugSettings setKeywords:](v2, "setKeywords:", v3);

  return v2;
}

+ (id)defaultDebugSettingsMergedWithSettings:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  GEORPDebugSettings *v8;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  _getValue(GeoServicesConfig_RAPDebugSubmissionKeywords, (uint64_t)off_1EDF4E118, 1, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__GEORPFeedbackRequest_GEORPProtoExtras__defaultDebugSettingsMergedWithSettings___block_invoke;
  v10[3] = &unk_1E1C210F0;
  v7 = v6;
  v11 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  if (objc_msgSend(v7, "count")
    && (v8 = objc_alloc_init(GEORPDebugSettings),
        -[GEORPDebugSettings setKeywords:](v8, "setKeywords:", v7),
        v8))
  {
    if (v3)
      -[GEORPDebugSettings mergeFrom:](v8, "mergeFrom:", v3);
  }
  else
  {
    v8 = (GEORPDebugSettings *)v3;
  }

  return v8;
}

void __81__GEORPFeedbackRequest_GEORPProtoExtras__defaultDebugSettingsMergedWithSettings___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a2;
  objc_msgSend(v3, "whitespaceCharacterSet");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObject:", v5);
}

- (void)_sharedInitWithRequestParameters:(id)a3 userInfo:(id)a4 traits:(id)a5 debugSettings:(id)a6
{
  id v10;
  id v11;
  id v12;
  GEOPDAnalyticMetadata *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  GEOPDClientMetadata *v21;
  void *v22;
  void *v23;
  GEORPClientCapabilities *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[GEORPFeedbackRequest setFeedbackRequestParameters:](self, "setFeedbackRequestParameters:", v29);
  -[GEORPFeedbackRequest setUserInfo:](self, "setUserInfo:", v10);
  v13 = -[GEOPDAnalyticMetadata initWithTraits:]([GEOPDAnalyticMetadata alloc], "initWithTraits:", v11);
  -[GEORPFeedbackRequest setAnalyticMetadata:](self, "setAnalyticMetadata:", v13);

  objc_msgSend(v29, "submissionParameters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "type");

  if (v15 != 11)
  {
    -[GEORPFeedbackRequest analyticMetadata](self, "analyticMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHasSessionId:", 0);

    -[GEORPFeedbackRequest analyticMetadata](self, "analyticMetadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHasSequenceNumber:", 0);

    -[GEORPFeedbackRequest analyticMetadata](self, "analyticMetadata");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setHasRelativeTimestamp:", 0);

  }
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isInternalInstall");

  if (v20)
    -[GEORPFeedbackRequest setDebugSettings:](self, "setDebugSettings:", v12);
  v21 = -[GEOPDClientMetadata initWithTraits:]([GEOPDClientMetadata alloc], "initWithTraits:", v11);
  -[GEORPFeedbackRequest setClientMetadata:](self, "setClientMetadata:", v21);

  objc_msgSend(v11, "deviceDisplayLanguages");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "mutableCopy");
  -[GEORPFeedbackRequest setDisplayLanguages:](self, "setDisplayLanguages:", v23);

  v24 = objc_alloc_init(GEORPClientCapabilities);
  -[GEORPClientCapabilities setHasConstrainedProblemStatusSize:](v24, "setHasConstrainedProblemStatusSize:", 0);
  -[GEORPClientCapabilities setHasNoOptInRequest:](v24, "setHasNoOptInRequest:", 1);
  -[GEORPClientCapabilities setHasSupportForIdsBasedNotifications:](v24, "setHasSupportForIdsBasedNotifications:", 1);
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "clientCapabilities");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPClientCapabilities setTransitMarketSupport:](v24, "setTransitMarketSupport:", objc_msgSend(v26, "transitMarketSupport"));

  -[GEORPFeedbackRequest setClientCapabilities:](self, "setClientCapabilities:", v24);
  -[GEORPFeedbackRequest addFeedbackClientCapabilities:](self, "addFeedbackClientCapabilities:", 1);
  if ((GEOConfigGetBOOL(GeoServicesConfig_IncludeSensitiveDataInRAP, (uint64_t)off_1EDF4D168) & 1) == 0)
    objc_msgSend(v10, "setUserEmail:", 0);
  if (objc_msgSend(v29, "isPOIEnrichment"))
  {
    if (objc_msgSend(v29, "hasQueryParameters"))
    {
      -[GEORPFeedbackRequest clientMetadata](self, "clientMetadata");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setDeviceExtendedLocation:", 0);

    }
    objc_msgSend(v10, "setUserEmail:", 0);
    objc_msgSend(v10, "setPreferredEmail:", 0);
    -[GEORPFeedbackRequest analyticMetadata](self, "analyticMetadata");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "clearServiceTags");

  }
  -[GEORPFeedbackRequest _initForSubmissionParameters](self, "_initForSubmissionParameters");

}

- (void)_initForSubmissionParameters
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[GEORPFeedbackRequest feedbackRequestParameters](self, "feedbackRequestParameters");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "submissionParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[GEORPFeedbackRequest _setupSubmissionParameters](self, "_setupSubmissionParameters");
    v4 = 1;
  }
  else
  {
    objc_msgSend(v9, "queryParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v4 = 3;
    }
    else
    {
      objc_msgSend(v9, "imageUploadParameters");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v4 = 4;
      }
      else
      {
        objc_msgSend(v9, "layoutConfigParameters");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          v4 = 5;
        }
        else
        {
          objc_msgSend(v9, "tdmFraudNotificationParameters");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
            v4 = 6;
          else
            v4 = 0;
        }
      }
    }
  }
  -[GEORPFeedbackRequest setFeedbackRequestType:](self, "setFeedbackRequestType:", v4);

}

- (void)_setupSubmissionParameters
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  GEORPFeedbackCommonContext *v7;
  void *v8;
  double Current;
  void *v10;
  uint8_t v11[16];

  -[GEORPFeedbackRequest feedbackRequestParameters](self, "feedbackRequestParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "submissionParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setClientSubmissionUuid:", v5);
    objc_msgSend(v3, "commonContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = objc_alloc_init(GEORPFeedbackCommonContext);
      objc_msgSend(v3, "setCommonContext:", v7);

    }
    objc_msgSend(v3, "commonContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordEnvironmentAndManifestURLs");

    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v3, "commonContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClientCreatedAt:", Current);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: submissionParams != ((void *)0)", v11, 2u);
  }

}

- (BOOL)isPOIEnrichment
{
  void *v2;
  char v3;

  -[GEORPFeedbackRequest feedbackRequestParameters](self, "feedbackRequestParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPOIEnrichment");

  return v3;
}

@end
