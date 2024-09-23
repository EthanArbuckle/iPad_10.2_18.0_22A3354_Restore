@implementation GEORPProblemRequest

- (GEORPProblemRequest)init
{
  GEORPProblemRequest *v2;
  GEORPProblemRequest *v3;
  GEORPProblemRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPProblemRequest;
  v2 = -[GEORPProblemRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPProblemRequest)initWithData:(id)a3
{
  GEORPProblemRequest *v3;
  GEORPProblemRequest *v4;
  GEORPProblemRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPProblemRequest;
  v3 = -[GEORPProblemRequest initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readProblem
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblem_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasProblem
{
  -[GEORPProblemRequest _readProblem]((uint64_t)self);
  return self->_problem != 0;
}

- (GEORPProblem)problem
{
  -[GEORPProblemRequest _readProblem]((uint64_t)self);
  return self->_problem;
}

- (void)setProblem:(id)a3
{
  *(_WORD *)&self->_flags |= 0x480u;
  objc_storeStrong((id *)&self->_problem, a3);
}

- (void)_readUserCredentials
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserCredentials_tags_2359);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasUserCredentials
{
  -[GEORPProblemRequest _readUserCredentials]((uint64_t)self);
  return self->_userCredentials != 0;
}

- (GEORPUserCredentials)userCredentials
{
  -[GEORPProblemRequest _readUserCredentials]((uint64_t)self);
  return self->_userCredentials;
}

- (void)setUserCredentials:(id)a3
{
  *(_WORD *)&self->_flags |= 0x500u;
  objc_storeStrong((id *)&self->_userCredentials, a3);
}

- (void)_readAnalyticMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnalyticMetadata_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasAnalyticMetadata
{
  -[GEORPProblemRequest _readAnalyticMetadata]((uint64_t)self);
  return self->_analyticMetadata != 0;
}

- (GEOPDAnalyticMetadata)analyticMetadata
{
  -[GEORPProblemRequest _readAnalyticMetadata]((uint64_t)self);
  return self->_analyticMetadata;
}

- (void)setAnalyticMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x401u;
  objc_storeStrong((id *)&self->_analyticMetadata, a3);
}

- (void)_readClientMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientMetadata_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasClientMetadata
{
  -[GEORPProblemRequest _readClientMetadata]((uint64_t)self);
  return self->_clientMetadata != 0;
}

- (GEOPDClientMetadata)clientMetadata
{
  -[GEORPProblemRequest _readClientMetadata]((uint64_t)self);
  return self->_clientMetadata;
}

- (void)setClientMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  objc_storeStrong((id *)&self->_clientMetadata, a3);
}

- (void)_readDevicePushToken
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDevicePushToken_tags_2360);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasDevicePushToken
{
  -[GEORPProblemRequest _readDevicePushToken]((uint64_t)self);
  return self->_devicePushToken != 0;
}

- (NSData)devicePushToken
{
  -[GEORPProblemRequest _readDevicePushToken]((uint64_t)self);
  return self->_devicePushToken;
}

- (void)setDevicePushToken:(id)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  objc_storeStrong((id *)&self->_devicePushToken, a3);
}

- (void)_readUserEmail
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserEmail_tags_2361);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasUserEmail
{
  -[GEORPProblemRequest _readUserEmail]((uint64_t)self);
  return self->_userEmail != 0;
}

- (NSString)userEmail
{
  -[GEORPProblemRequest _readUserEmail]((uint64_t)self);
  return self->_userEmail;
}

- (void)setUserEmail:(id)a3
{
  *(_WORD *)&self->_flags |= 0x600u;
  objc_storeStrong((id *)&self->_userEmail, a3);
}

- (void)_readInputLanguage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInputLanguage_tags_2362);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasInputLanguage
{
  -[GEORPProblemRequest _readInputLanguage]((uint64_t)self);
  return self->_inputLanguage != 0;
}

- (NSString)inputLanguage
{
  -[GEORPProblemRequest _readInputLanguage]((uint64_t)self);
  return self->_inputLanguage;
}

- (void)setInputLanguage:(id)a3
{
  *(_WORD *)&self->_flags |= 0x420u;
  objc_storeStrong((id *)&self->_inputLanguage, a3);
}

- (void)_readClientCapabilities
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientCapabilities_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasClientCapabilities
{
  -[GEORPProblemRequest _readClientCapabilities]((uint64_t)self);
  return self->_clientCapabilities != 0;
}

- (GEORPClientCapabilities)clientCapabilities
{
  -[GEORPProblemRequest _readClientCapabilities]((uint64_t)self);
  return self->_clientCapabilities;
}

- (void)setClientCapabilities:(id)a3
{
  *(_WORD *)&self->_flags |= 0x402u;
  objc_storeStrong((id *)&self->_clientCapabilities, a3);
}

- (void)_readProblemUuid
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblemUuid_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasProblemUuid
{
  -[GEORPProblemRequest _readProblemUuid]((uint64_t)self);
  return self->_problemUuid != 0;
}

- (NSString)problemUuid
{
  -[GEORPProblemRequest _readProblemUuid]((uint64_t)self);
  return self->_problemUuid;
}

- (void)setProblemUuid:(id)a3
{
  *(_WORD *)&self->_flags |= 0x440u;
  objc_storeStrong((id *)&self->_problemUuid, a3);
}

- (void)_readDebugSettings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDebugSettings_tags_2363);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasDebugSettings
{
  -[GEORPProblemRequest _readDebugSettings]((uint64_t)self);
  return self->_debugSettings != 0;
}

- (GEORPDebugSettings)debugSettings
{
  -[GEORPProblemRequest _readDebugSettings]((uint64_t)self);
  return self->_debugSettings;
}

- (void)setDebugSettings:(id)a3
{
  *(_WORD *)&self->_flags |= 0x408u;
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
  v8.super_class = (Class)GEORPProblemRequest;
  -[GEORPProblemRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPProblemRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPProblemRequest _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "problem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v5, "jsonRepresentation");
      else
        objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("problem"));

    }
    objc_msgSend(a1, "userCredentials");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v8, "jsonRepresentation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = CFSTR("userCredentials");
      }
      else
      {
        objc_msgSend(v8, "dictionaryRepresentation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = CFSTR("user_credentials");
      }
      objc_msgSend(v4, "setObject:forKey:", v10, v11);

    }
    objc_msgSend(a1, "analyticMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v12, "jsonRepresentation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = CFSTR("analyticMetadata");
      }
      else
      {
        objc_msgSend(v12, "dictionaryRepresentation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = CFSTR("analytic_metadata");
      }
      objc_msgSend(v4, "setObject:forKey:", v14, v15);

    }
    objc_msgSend(a1, "clientMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v16, "jsonRepresentation");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = CFSTR("clientMetadata");
      }
      else
      {
        objc_msgSend(v16, "dictionaryRepresentation");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = CFSTR("client_metadata");
      }
      objc_msgSend(v4, "setObject:forKey:", v18, v19);

    }
    objc_msgSend(a1, "devicePushToken");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v20, "base64EncodedStringWithOptions:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("devicePushToken"));

      }
      else
      {
        objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("device_push_token"));
      }
    }

    objc_msgSend(a1, "userEmail");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      if (a2)
        v24 = CFSTR("userEmail");
      else
        v24 = CFSTR("user_email");
      objc_msgSend(v4, "setObject:forKey:", v23, v24);
    }

    objc_msgSend(a1, "inputLanguage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      if (a2)
        v26 = CFSTR("inputLanguage");
      else
        v26 = CFSTR("input_language");
      objc_msgSend(v4, "setObject:forKey:", v25, v26);
    }

    objc_msgSend(a1, "clientCapabilities");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v27, "jsonRepresentation");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = CFSTR("clientCapabilities");
      }
      else
      {
        objc_msgSend(v27, "dictionaryRepresentation");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = CFSTR("client_capabilities");
      }
      objc_msgSend(v4, "setObject:forKey:", v29, v30);

    }
    objc_msgSend(a1, "problemUuid");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      if (a2)
        v32 = CFSTR("problemUuid");
      else
        v32 = CFSTR("problem_uuid");
      objc_msgSend(v4, "setObject:forKey:", v31, v32);
    }

    objc_msgSend(a1, "debugSettings");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v33)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v33, "jsonRepresentation");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = CFSTR("debugSettings");
      }
      else
      {
        objc_msgSend(v33, "dictionaryRepresentation");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = CFSTR("debug_settings");
      }
      objc_msgSend(v4, "setObject:forKey:", v35, v36);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPProblemRequest _dictionaryRepresentation:](self, 1);
}

- (GEORPProblemRequest)initWithDictionary:(id)a3
{
  return (GEORPProblemRequest *)-[GEORPProblemRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  GEORPProblem *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  GEORPUserCredentials *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  GEOPDAnalyticMetadata *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  GEOPDClientMetadata *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  GEORPClientCapabilities *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  GEORPDebugSettings *v44;
  uint64_t v45;
  void *v46;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("problem"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEORPProblem alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEORPProblem initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEORPProblem initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setProblem:", v8);

      }
      if (a3)
        v10 = CFSTR("userCredentials");
      else
        v10 = CFSTR("user_credentials");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = [GEORPUserCredentials alloc];
        if ((a3 & 1) != 0)
          v13 = -[GEORPUserCredentials initWithJSON:](v12, "initWithJSON:", v11);
        else
          v13 = -[GEORPUserCredentials initWithDictionary:](v12, "initWithDictionary:", v11);
        v14 = (void *)v13;
        objc_msgSend(a1, "setUserCredentials:", v13);

      }
      if (a3)
        v15 = CFSTR("analyticMetadata");
      else
        v15 = CFSTR("analytic_metadata");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = [GEOPDAnalyticMetadata alloc];
        if ((a3 & 1) != 0)
          v18 = -[GEOPDAnalyticMetadata initWithJSON:](v17, "initWithJSON:", v16);
        else
          v18 = -[GEOPDAnalyticMetadata initWithDictionary:](v17, "initWithDictionary:", v16);
        v19 = (void *)v18;
        objc_msgSend(a1, "setAnalyticMetadata:", v18);

      }
      if (a3)
        v20 = CFSTR("clientMetadata");
      else
        v20 = CFSTR("client_metadata");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = [GEOPDClientMetadata alloc];
        if ((a3 & 1) != 0)
          v23 = -[GEOPDClientMetadata initWithJSON:](v22, "initWithJSON:", v21);
        else
          v23 = -[GEOPDClientMetadata initWithDictionary:](v22, "initWithDictionary:", v21);
        v24 = (void *)v23;
        objc_msgSend(a1, "setClientMetadata:", v23);

      }
      if (a3)
        v25 = CFSTR("devicePushToken");
      else
        v25 = CFSTR("device_push_token");
      objc_msgSend(v5, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v26, 0);
        objc_msgSend(a1, "setDevicePushToken:", v27);

      }
      if (a3)
        v28 = CFSTR("userEmail");
      else
        v28 = CFSTR("user_email");
      objc_msgSend(v5, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = (void *)objc_msgSend(v29, "copy");
        objc_msgSend(a1, "setUserEmail:", v30);

      }
      if (a3)
        v31 = CFSTR("inputLanguage");
      else
        v31 = CFSTR("input_language");
      objc_msgSend(v5, "objectForKeyedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = (void *)objc_msgSend(v32, "copy");
        objc_msgSend(a1, "setInputLanguage:", v33);

      }
      if (a3)
        v34 = CFSTR("clientCapabilities");
      else
        v34 = CFSTR("client_capabilities");
      objc_msgSend(v5, "objectForKeyedSubscript:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = [GEORPClientCapabilities alloc];
        if ((a3 & 1) != 0)
          v37 = -[GEORPClientCapabilities initWithJSON:](v36, "initWithJSON:", v35);
        else
          v37 = -[GEORPClientCapabilities initWithDictionary:](v36, "initWithDictionary:", v35);
        v38 = (void *)v37;
        objc_msgSend(a1, "setClientCapabilities:", v37);

      }
      if (a3)
        v39 = CFSTR("problemUuid");
      else
        v39 = CFSTR("problem_uuid");
      objc_msgSend(v5, "objectForKeyedSubscript:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v41 = (void *)objc_msgSend(v40, "copy");
        objc_msgSend(a1, "setProblemUuid:", v41);

      }
      if (a3)
        v42 = CFSTR("debugSettings");
      else
        v42 = CFSTR("debug_settings");
      objc_msgSend(v5, "objectForKeyedSubscript:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v44 = [GEORPDebugSettings alloc];
        if ((a3 & 1) != 0)
          v45 = -[GEORPDebugSettings initWithJSON:](v44, "initWithJSON:", v43);
        else
          v45 = -[GEORPDebugSettings initWithDictionary:](v44, "initWithDictionary:", v43);
        v46 = (void *)v45;
        objc_msgSend(a1, "setDebugSettings:", v45);

      }
    }
  }

  return a1;
}

- (GEORPProblemRequest)initWithJSON:(id)a3
{
  return (GEORPProblemRequest *)-[GEORPProblemRequest _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2385;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2386;
    GEORPProblemRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPProblemRequestCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPProblemRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPProblemRequestReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *v5;
  void *v6;
  id v7;

  v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPProblemRequestIsDirty((uint64_t)self) & 1) == 0)
  {
    v5 = self->_reader;
    objc_sync_enter(v5);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeData:", v6);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPProblemRequest readAll:](self, "readAll:", 0);
    if (self->_problem)
      PBDataWriterWriteSubmessage();
    if (self->_userCredentials)
      PBDataWriterWriteSubmessage();
    if (self->_analyticMetadata)
      PBDataWriterWriteSubmessage();
    if (self->_clientMetadata)
      PBDataWriterWriteSubmessage();
    if (self->_devicePushToken)
      PBDataWriterWriteDataField();
    if (self->_userEmail)
      PBDataWriterWriteStringField();
    if (self->_inputLanguage)
      PBDataWriterWriteStringField();
    if (self->_clientCapabilities)
      PBDataWriterWriteSubmessage();
    if (self->_problemUuid)
      PBDataWriterWriteStringField();
    if (self->_debugSettings)
      PBDataWriterWriteSubmessage();
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEORPProblemRequestClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPProblemRequest _readClientMetadata]((uint64_t)self);
  if (-[GEOPDClientMetadata hasGreenTeaWithValue:](self->_clientMetadata, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPProblemRequest _readProblem]((uint64_t)self);
  return -[GEORPProblem hasGreenTeaWithValue:](self->_problem, "hasGreenTeaWithValue:", v3);
}

- (unsigned)requestTypeCode
{
  return 1014;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORPProblemRequest readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 24) = self->_readerMarkPos;
  *((_DWORD *)v5 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_problem)
    objc_msgSend(v5, "setProblem:");
  if (self->_userCredentials)
    objc_msgSend(v5, "setUserCredentials:");
  v4 = v5;
  if (self->_analyticMetadata)
  {
    objc_msgSend(v5, "setAnalyticMetadata:");
    v4 = v5;
  }
  if (self->_clientMetadata)
  {
    objc_msgSend(v5, "setClientMetadata:");
    v4 = v5;
  }
  if (self->_devicePushToken)
  {
    objc_msgSend(v5, "setDevicePushToken:");
    v4 = v5;
  }
  if (self->_userEmail)
  {
    objc_msgSend(v5, "setUserEmail:");
    v4 = v5;
  }
  if (self->_inputLanguage)
  {
    objc_msgSend(v5, "setInputLanguage:");
    v4 = v5;
  }
  if (self->_clientCapabilities)
  {
    objc_msgSend(v5, "setClientCapabilities:");
    v4 = v5;
  }
  if (self->_problemUuid)
  {
    objc_msgSend(v5, "setProblemUuid:");
    v4 = v5;
  }
  if (self->_debugSettings)
  {
    objc_msgSend(v5, "setDebugSettings:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
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
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPProblemRequest readAll:](self, "readAll:", 0);
    v8 = -[GEORPProblem copyWithZone:](self->_problem, "copyWithZone:", a3);
    v9 = (void *)v5[9];
    v5[9] = v8;

    v10 = -[GEORPUserCredentials copyWithZone:](self->_userCredentials, "copyWithZone:", a3);
    v11 = (void *)v5[10];
    v5[10] = v10;

    v12 = -[GEOPDAnalyticMetadata copyWithZone:](self->_analyticMetadata, "copyWithZone:", a3);
    v13 = (void *)v5[2];
    v5[2] = v12;

    v14 = -[GEOPDClientMetadata copyWithZone:](self->_clientMetadata, "copyWithZone:", a3);
    v15 = (void *)v5[4];
    v5[4] = v14;

    v16 = -[NSData copyWithZone:](self->_devicePushToken, "copyWithZone:", a3);
    v17 = (void *)v5[6];
    v5[6] = v16;

    v18 = -[NSString copyWithZone:](self->_userEmail, "copyWithZone:", a3);
    v19 = (void *)v5[11];
    v5[11] = v18;

    v20 = -[NSString copyWithZone:](self->_inputLanguage, "copyWithZone:", a3);
    v21 = (void *)v5[7];
    v5[7] = v20;

    v22 = -[GEORPClientCapabilities copyWithZone:](self->_clientCapabilities, "copyWithZone:", a3);
    v23 = (void *)v5[3];
    v5[3] = v22;

    v24 = -[NSString copyWithZone:](self->_problemUuid, "copyWithZone:", a3);
    v25 = (void *)v5[8];
    v5[8] = v24;

    v26 = -[GEORPDebugSettings copyWithZone:](self->_debugSettings, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[5];
    v5[5] = v26;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPProblemRequestReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEORPProblem *problem;
  GEORPUserCredentials *userCredentials;
  GEOPDAnalyticMetadata *analyticMetadata;
  GEOPDClientMetadata *clientMetadata;
  NSData *devicePushToken;
  NSString *userEmail;
  NSString *inputLanguage;
  GEORPClientCapabilities *clientCapabilities;
  NSString *problemUuid;
  GEORPDebugSettings *debugSettings;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[GEORPProblemRequest readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  problem = self->_problem;
  if ((unint64_t)problem | v4[9])
  {
    if (!-[GEORPProblem isEqual:](problem, "isEqual:"))
      goto LABEL_22;
  }
  userCredentials = self->_userCredentials;
  if ((unint64_t)userCredentials | v4[10] && !-[GEORPUserCredentials isEqual:](userCredentials, "isEqual:"))
    goto LABEL_22;
  if (((analyticMetadata = self->_analyticMetadata, !((unint64_t)analyticMetadata | v4[2]))
     || -[GEOPDAnalyticMetadata isEqual:](analyticMetadata, "isEqual:"))
    && ((clientMetadata = self->_clientMetadata, !((unint64_t)clientMetadata | v4[4]))
     || -[GEOPDClientMetadata isEqual:](clientMetadata, "isEqual:"))
    && ((devicePushToken = self->_devicePushToken, !((unint64_t)devicePushToken | v4[6]))
     || -[NSData isEqual:](devicePushToken, "isEqual:"))
    && ((userEmail = self->_userEmail, !((unint64_t)userEmail | v4[11]))
     || -[NSString isEqual:](userEmail, "isEqual:"))
    && ((inputLanguage = self->_inputLanguage, !((unint64_t)inputLanguage | v4[7]))
     || -[NSString isEqual:](inputLanguage, "isEqual:"))
    && ((clientCapabilities = self->_clientCapabilities, !((unint64_t)clientCapabilities | v4[3]))
     || -[GEORPClientCapabilities isEqual:](clientCapabilities, "isEqual:"))
    && ((problemUuid = self->_problemUuid, !((unint64_t)problemUuid | v4[8]))
     || -[NSString isEqual:](problemUuid, "isEqual:")))
  {
    debugSettings = self->_debugSettings;
    if ((unint64_t)debugSettings | v4[5])
      v15 = -[GEORPDebugSettings isEqual:](debugSettings, "isEqual:");
    else
      v15 = 1;
  }
  else
  {
LABEL_22:
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  unint64_t v10;
  NSUInteger v11;

  -[GEORPProblemRequest readAll:](self, "readAll:", 1);
  v3 = -[GEORPProblem hash](self->_problem, "hash");
  v4 = -[GEORPUserCredentials hash](self->_userCredentials, "hash") ^ v3;
  v5 = -[GEOPDAnalyticMetadata hash](self->_analyticMetadata, "hash");
  v6 = v4 ^ v5 ^ -[GEOPDClientMetadata hash](self->_clientMetadata, "hash");
  v7 = -[NSData hash](self->_devicePushToken, "hash");
  v8 = v7 ^ -[NSString hash](self->_userEmail, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_inputLanguage, "hash");
  v10 = -[GEORPClientCapabilities hash](self->_clientCapabilities, "hash");
  v11 = v10 ^ -[NSString hash](self->_problemUuid, "hash");
  return v9 ^ v11 ^ -[GEORPDebugSettings hash](self->_debugSettings, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEORPProblem *problem;
  uint64_t v5;
  GEORPUserCredentials *userCredentials;
  uint64_t v7;
  GEOPDAnalyticMetadata *analyticMetadata;
  uint64_t v9;
  GEOPDClientMetadata *clientMetadata;
  uint64_t v11;
  GEORPClientCapabilities *clientCapabilities;
  uint64_t v13;
  GEORPDebugSettings *debugSettings;
  uint64_t v15;
  _QWORD *v16;

  v16 = a3;
  objc_msgSend(v16, "readAll:", 0);
  problem = self->_problem;
  v5 = v16[9];
  if (problem)
  {
    if (v5)
      -[GEORPProblem mergeFrom:](problem, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEORPProblemRequest setProblem:](self, "setProblem:");
  }
  userCredentials = self->_userCredentials;
  v7 = v16[10];
  if (userCredentials)
  {
    if (v7)
      -[GEORPUserCredentials mergeFrom:](userCredentials, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEORPProblemRequest setUserCredentials:](self, "setUserCredentials:");
  }
  analyticMetadata = self->_analyticMetadata;
  v9 = v16[2];
  if (analyticMetadata)
  {
    if (v9)
      -[GEOPDAnalyticMetadata mergeFrom:](analyticMetadata, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEORPProblemRequest setAnalyticMetadata:](self, "setAnalyticMetadata:");
  }
  clientMetadata = self->_clientMetadata;
  v11 = v16[4];
  if (clientMetadata)
  {
    if (v11)
      -[GEOPDClientMetadata mergeFrom:](clientMetadata, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEORPProblemRequest setClientMetadata:](self, "setClientMetadata:");
  }
  if (v16[6])
    -[GEORPProblemRequest setDevicePushToken:](self, "setDevicePushToken:");
  if (v16[11])
    -[GEORPProblemRequest setUserEmail:](self, "setUserEmail:");
  if (v16[7])
    -[GEORPProblemRequest setInputLanguage:](self, "setInputLanguage:");
  clientCapabilities = self->_clientCapabilities;
  v13 = v16[3];
  if (clientCapabilities)
  {
    if (v13)
      -[GEORPClientCapabilities mergeFrom:](clientCapabilities, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEORPProblemRequest setClientCapabilities:](self, "setClientCapabilities:");
  }
  if (v16[8])
    -[GEORPProblemRequest setProblemUuid:](self, "setProblemUuid:");
  debugSettings = self->_debugSettings;
  v15 = v16[5];
  if (debugSettings)
  {
    if (v15)
      -[GEORPDebugSettings mergeFrom:](debugSettings, "mergeFrom:");
  }
  else if (v15)
  {
    -[GEORPProblemRequest setDebugSettings:](self, "setDebugSettings:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userEmail, 0);
  objc_storeStrong((id *)&self->_userCredentials, 0);
  objc_storeStrong((id *)&self->_problem, 0);
  objc_storeStrong((id *)&self->_problemUuid, 0);
  objc_storeStrong((id *)&self->_inputLanguage, 0);
  objc_storeStrong((id *)&self->_devicePushToken, 0);
  objc_storeStrong((id *)&self->_debugSettings, 0);
  objc_storeStrong((id *)&self->_clientMetadata, 0);
  objc_storeStrong((id *)&self->_clientCapabilities, 0);
  objc_storeStrong((id *)&self->_analyticMetadata, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
