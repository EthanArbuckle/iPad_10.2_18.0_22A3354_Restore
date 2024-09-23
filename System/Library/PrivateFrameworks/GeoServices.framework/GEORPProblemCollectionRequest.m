@implementation GEORPProblemCollectionRequest

- (GEORPProblemCollectionRequest)init
{
  GEORPProblemCollectionRequest *v2;
  GEORPProblemCollectionRequest *v3;
  GEORPProblemCollectionRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPProblemCollectionRequest;
  v2 = -[GEORPProblemCollectionRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPProblemCollectionRequest)initWithData:(id)a3
{
  GEORPProblemCollectionRequest *v3;
  GEORPProblemCollectionRequest *v4;
  GEORPProblemCollectionRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPProblemCollectionRequest;
  v3 = -[GEORPProblemCollectionRequest initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRequestElements
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
        GEORPProblemCollectionRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRequestElements_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (NSMutableArray)requestElements
{
  -[GEORPProblemCollectionRequest _readRequestElements]((uint64_t)self);
  return self->_requestElements;
}

- (void)setRequestElements:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *requestElements;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  requestElements = self->_requestElements;
  self->_requestElements = v4;

}

- (void)clearRequestElements
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  -[NSMutableArray removeAllObjects](self->_requestElements, "removeAllObjects");
}

- (void)addRequestElement:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPProblemCollectionRequest _readRequestElements]((uint64_t)self);
  -[GEORPProblemCollectionRequest _addNoFlagsRequestElement:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsRequestElement:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)requestElementsCount
{
  -[GEORPProblemCollectionRequest _readRequestElements]((uint64_t)self);
  return -[NSMutableArray count](self->_requestElements, "count");
}

- (id)requestElementAtIndex:(unint64_t)a3
{
  -[GEORPProblemCollectionRequest _readRequestElements]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_requestElements, "objectAtIndex:", a3);
}

+ (Class)requestElementType
{
  return (Class)objc_opt_class();
}

- (void)_readHwMachine
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
        GEORPProblemCollectionRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHwMachine_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasHwMachine
{
  -[GEORPProblemCollectionRequest _readHwMachine]((uint64_t)self);
  return self->_hwMachine != 0;
}

- (NSString)hwMachine
{
  -[GEORPProblemCollectionRequest _readHwMachine]((uint64_t)self);
  return self->_hwMachine;
}

- (void)setHwMachine:(id)a3
{
  *(_WORD *)&self->_flags |= 0x408u;
  objc_storeStrong((id *)&self->_hwMachine, a3);
}

- (void)_readOsRelease
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
        GEORPProblemCollectionRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOsRelease_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasOsRelease
{
  -[GEORPProblemCollectionRequest _readOsRelease]((uint64_t)self);
  return self->_osRelease != 0;
}

- (NSString)osRelease
{
  -[GEORPProblemCollectionRequest _readOsRelease]((uint64_t)self);
  return self->_osRelease;
}

- (void)setOsRelease:(id)a3
{
  *(_WORD *)&self->_flags |= 0x420u;
  objc_storeStrong((id *)&self->_osRelease, a3);
}

- (void)_readCountryCode
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
        GEORPProblemCollectionRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCountryCode_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasCountryCode
{
  -[GEORPProblemCollectionRequest _readCountryCode]((uint64_t)self);
  return self->_countryCode != 0;
}

- (NSString)countryCode
{
  -[GEORPProblemCollectionRequest _readCountryCode]((uint64_t)self);
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  *(_WORD *)&self->_flags |= 0x401u;
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (void)_readInputLanguage
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
        GEORPProblemCollectionRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInputLanguage_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasInputLanguage
{
  -[GEORPProblemCollectionRequest _readInputLanguage]((uint64_t)self);
  return self->_inputLanguage != 0;
}

- (NSString)inputLanguage
{
  -[GEORPProblemCollectionRequest _readInputLanguage]((uint64_t)self);
  return self->_inputLanguage;
}

- (void)setInputLanguage:(id)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  objc_storeStrong((id *)&self->_inputLanguage, a3);
}

- (void)_readUserCredentials
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
        GEORPProblemCollectionRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserCredentials_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasUserCredentials
{
  -[GEORPProblemCollectionRequest _readUserCredentials]((uint64_t)self);
  return self->_userCredentials != 0;
}

- (GEORPUserCredentials)userCredentials
{
  -[GEORPProblemCollectionRequest _readUserCredentials]((uint64_t)self);
  return self->_userCredentials;
}

- (void)setUserCredentials:(id)a3
{
  *(_WORD *)&self->_flags |= 0x480u;
  objc_storeStrong((id *)&self->_userCredentials, a3);
}

- (void)_readDevicePushToken
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
        GEORPProblemCollectionRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDevicePushToken_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasDevicePushToken
{
  -[GEORPProblemCollectionRequest _readDevicePushToken]((uint64_t)self);
  return self->_devicePushToken != 0;
}

- (NSData)devicePushToken
{
  -[GEORPProblemCollectionRequest _readDevicePushToken]((uint64_t)self);
  return self->_devicePushToken;
}

- (void)setDevicePushToken:(id)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  objc_storeStrong((id *)&self->_devicePushToken, a3);
}

- (void)_readUserEmail
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
        GEORPProblemCollectionRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserEmail_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasUserEmail
{
  -[GEORPProblemCollectionRequest _readUserEmail]((uint64_t)self);
  return self->_userEmail != 0;
}

- (NSString)userEmail
{
  -[GEORPProblemCollectionRequest _readUserEmail]((uint64_t)self);
  return self->_userEmail;
}

- (void)setUserEmail:(id)a3
{
  *(_WORD *)&self->_flags |= 0x500u;
  objc_storeStrong((id *)&self->_userEmail, a3);
}

- (void)_readUserLocation
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
        GEORPProblemCollectionRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserLocation_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasUserLocation
{
  -[GEORPProblemCollectionRequest _readUserLocation]((uint64_t)self);
  return self->_userLocation != 0;
}

- (GEOLocation)userLocation
{
  -[GEORPProblemCollectionRequest _readUserLocation]((uint64_t)self);
  return self->_userLocation;
}

- (void)setUserLocation:(id)a3
{
  *(_WORD *)&self->_flags |= 0x600u;
  objc_storeStrong((id *)&self->_userLocation, a3);
}

- (void)_readDebugSettings
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
        GEORPProblemCollectionRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDebugSettings_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasDebugSettings
{
  -[GEORPProblemCollectionRequest _readDebugSettings]((uint64_t)self);
  return self->_debugSettings != 0;
}

- (GEORPDebugSettings)debugSettings
{
  -[GEORPProblemCollectionRequest _readDebugSettings]((uint64_t)self);
  return self->_debugSettings;
}

- (void)setDebugSettings:(id)a3
{
  *(_WORD *)&self->_flags |= 0x402u;
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
  v8.super_class = (Class)GEORPProblemCollectionRequest;
  -[GEORPProblemCollectionRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPProblemCollectionRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPProblemCollectionRequest _dictionaryRepresentation:]((id *)&self->super.super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
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
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1[8], "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[8], "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v6 = a1[8];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v41 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation", (_QWORD)v40);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12, (_QWORD)v40);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("requestElement");
    else
      v13 = CFSTR("request_element");
    objc_msgSend(v4, "setObject:forKey:", v5, v13, (_QWORD)v40);

  }
  objc_msgSend(a1, "hwMachine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (a2)
      v15 = CFSTR("hwMachine");
    else
      v15 = CFSTR("hw_machine");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);
  }

  objc_msgSend(a1, "osRelease");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    if (a2)
      v17 = CFSTR("osRelease");
    else
      v17 = CFSTR("os_release");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);
  }

  objc_msgSend(a1, "countryCode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (a2)
      v19 = CFSTR("countryCode");
    else
      v19 = CFSTR("country_code");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);
  }

  objc_msgSend(a1, "inputLanguage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    if (a2)
      v21 = CFSTR("inputLanguage");
    else
      v21 = CFSTR("input_language");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);
  }

  objc_msgSend(a1, "userCredentials");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v22, "jsonRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("userCredentials");
    }
    else
    {
      objc_msgSend(v22, "dictionaryRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("user_credentials");
    }
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

  }
  objc_msgSend(a1, "devicePushToken");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v26, "base64EncodedStringWithOptions:", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("devicePushToken"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("device_push_token"));
    }
  }

  objc_msgSend(a1, "userEmail");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    if (a2)
      v30 = CFSTR("userEmail");
    else
      v30 = CFSTR("user_email");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);
  }

  objc_msgSend(a1, "userLocation");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v31, "jsonRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("userLocation");
    }
    else
    {
      objc_msgSend(v31, "dictionaryRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("user_location");
    }
    objc_msgSend(v4, "setObject:forKey:", v33, v34);

  }
  objc_msgSend(a1, "debugSettings");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v35, "jsonRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("debugSettings");
    }
    else
    {
      objc_msgSend(v35, "dictionaryRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("debug_settings");
    }
    objc_msgSend(v4, "setObject:forKey:", v37, v38);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPProblemCollectionRequest _dictionaryRepresentation:]((id *)&self->super.super.super.isa, 1);
}

- (GEORPProblemCollectionRequest)initWithDictionary:(id)a3
{
  return (GEORPProblemCollectionRequest *)-[GEORPProblemCollectionRequest _initWithDictionary:isJSON:](self, a3, 0);
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
  uint64_t i;
  uint64_t v13;
  GEORPProblem *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  GEORPUserCredentials *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  GEOLocation *v42;
  uint64_t v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  GEORPDebugSettings *v47;
  uint64_t v48;
  void *v49;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("requestElement");
      else
        v6 = CFSTR("request_element");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v51 = v5;
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v53;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v53 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = [GEORPProblem alloc];
                if ((a3 & 1) != 0)
                  v15 = -[GEORPProblem initWithJSON:](v14, "initWithJSON:", v13);
                else
                  v15 = -[GEORPProblem initWithDictionary:](v14, "initWithDictionary:", v13);
                v16 = (void *)v15;
                objc_msgSend(a1, "addRequestElement:", v15);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
          }
          while (v10);
        }

        v5 = v51;
      }

      if (a3)
        v17 = CFSTR("hwMachine");
      else
        v17 = CFSTR("hw_machine");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = (void *)objc_msgSend(v18, "copy");
        objc_msgSend(a1, "setHwMachine:", v19);

      }
      if (a3)
        v20 = CFSTR("osRelease");
      else
        v20 = CFSTR("os_release");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = (void *)objc_msgSend(v21, "copy");
        objc_msgSend(a1, "setOsRelease:", v22);

      }
      if (a3)
        v23 = CFSTR("countryCode");
      else
        v23 = CFSTR("country_code");
      objc_msgSend(v5, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = (void *)objc_msgSend(v24, "copy");
        objc_msgSend(a1, "setCountryCode:", v25);

      }
      if (a3)
        v26 = CFSTR("inputLanguage");
      else
        v26 = CFSTR("input_language");
      objc_msgSend(v5, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = (void *)objc_msgSend(v27, "copy");
        objc_msgSend(a1, "setInputLanguage:", v28);

      }
      if (a3)
        v29 = CFSTR("userCredentials");
      else
        v29 = CFSTR("user_credentials");
      objc_msgSend(v5, "objectForKeyedSubscript:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = [GEORPUserCredentials alloc];
        if ((a3 & 1) != 0)
          v32 = -[GEORPUserCredentials initWithJSON:](v31, "initWithJSON:", v30);
        else
          v32 = -[GEORPUserCredentials initWithDictionary:](v31, "initWithDictionary:", v30);
        v33 = (void *)v32;
        objc_msgSend(a1, "setUserCredentials:", v32);

      }
      if (a3)
        v34 = CFSTR("devicePushToken");
      else
        v34 = CFSTR("device_push_token");
      objc_msgSend(v5, "objectForKeyedSubscript:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v35, 0);
        objc_msgSend(a1, "setDevicePushToken:", v36);

      }
      if (a3)
        v37 = CFSTR("userEmail");
      else
        v37 = CFSTR("user_email");
      objc_msgSend(v5, "objectForKeyedSubscript:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v39 = (void *)objc_msgSend(v38, "copy");
        objc_msgSend(a1, "setUserEmail:", v39);

      }
      if (a3)
        v40 = CFSTR("userLocation");
      else
        v40 = CFSTR("user_location");
      objc_msgSend(v5, "objectForKeyedSubscript:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v42 = [GEOLocation alloc];
        if ((a3 & 1) != 0)
          v43 = -[GEOLocation initWithJSON:](v42, "initWithJSON:", v41);
        else
          v43 = -[GEOLocation initWithDictionary:](v42, "initWithDictionary:", v41);
        v44 = (void *)v43;
        objc_msgSend(a1, "setUserLocation:", v43);

      }
      if (a3)
        v45 = CFSTR("debugSettings");
      else
        v45 = CFSTR("debug_settings");
      objc_msgSend(v5, "objectForKeyedSubscript:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v47 = [GEORPDebugSettings alloc];
        if ((a3 & 1) != 0)
          v48 = -[GEORPDebugSettings initWithJSON:](v47, "initWithJSON:", v46);
        else
          v48 = -[GEORPDebugSettings initWithDictionary:](v47, "initWithDictionary:", v46);
        v49 = (void *)v48;
        objc_msgSend(a1, "setDebugSettings:", v48);

      }
    }
  }

  return a1;
}

- (GEORPProblemCollectionRequest)initWithJSON:(id)a3
{
  return (GEORPProblemCollectionRequest *)-[GEORPProblemCollectionRequest _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1782;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1783;
    GEORPProblemCollectionRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPProblemCollectionRequestCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPProblemCollectionRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPProblemCollectionRequestReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEORPProblemCollectionRequestIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPProblemCollectionRequest readAll:](self, "readAll:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_requestElements;
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

    if (self->_hwMachine)
      PBDataWriterWriteStringField();
    if (self->_osRelease)
      PBDataWriterWriteStringField();
    if (self->_countryCode)
      PBDataWriterWriteStringField();
    if (self->_inputLanguage)
      PBDataWriterWriteStringField();
    if (self->_userCredentials)
      PBDataWriterWriteSubmessage();
    if (self->_devicePushToken)
      PBDataWriterWriteDataField();
    if (self->_userEmail)
      PBDataWriterWriteStringField();
    if (self->_userLocation)
      PBDataWriterWriteSubmessage();
    if (self->_debugSettings)
      PBDataWriterWriteSubmessage();
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEORPProblemCollectionRequestClearSensitiveFields((id *)&self->super.super.super.isa, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  -[GEORPProblemCollectionRequest _readRequestElements]((uint64_t)self);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_requestElements;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3, (_QWORD)v11) & 1) != 0)
        {

          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[GEORPProblemCollectionRequest _readUserLocation]((uint64_t)self);
  return -[GEOLocation hasGreenTeaWithValue:](self->_userLocation, "hasGreenTeaWithValue:", v3);
}

- (unsigned)requestTypeCode
{
  return 1009;
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
  id *v8;
  id *v9;

  v9 = (id *)a3;
  -[GEORPProblemCollectionRequest readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 24) = self->_readerMarkPos;
  *((_DWORD *)v9 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEORPProblemCollectionRequest requestElementsCount](self, "requestElementsCount"))
  {
    objc_msgSend(v9, "clearRequestElements");
    v4 = -[GEORPProblemCollectionRequest requestElementsCount](self, "requestElementsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPProblemCollectionRequest requestElementAtIndex:](self, "requestElementAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addRequestElement:", v7);

      }
    }
  }
  if (self->_hwMachine)
    objc_msgSend(v9, "setHwMachine:");
  v8 = v9;
  if (self->_osRelease)
  {
    objc_msgSend(v9, "setOsRelease:");
    v8 = v9;
  }
  if (self->_countryCode)
  {
    objc_msgSend(v9, "setCountryCode:");
    v8 = v9;
  }
  if (self->_inputLanguage)
  {
    objc_msgSend(v9, "setInputLanguage:");
    v8 = v9;
  }
  if (self->_userCredentials)
  {
    objc_msgSend(v9, "setUserCredentials:");
    v8 = v9;
  }
  if (self->_devicePushToken)
  {
    objc_msgSend(v9, "setDevicePushToken:");
    v8 = v9;
  }
  if (self->_userEmail)
  {
    objc_msgSend(v9, "setUserEmail:");
    v8 = v9;
  }
  if (self->_userLocation)
  {
    objc_msgSend(v9, "setUserLocation:");
    v8 = v9;
  }
  if (self->_debugSettings)
  {
    objc_msgSend(v9, "setDebugSettings:");
    v8 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPProblemCollectionRequestReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPProblemCollectionRequest readAll:](self, "readAll:", 0);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = self->_requestElements;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v32);
        objc_msgSend(v5, "addRequestElement:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v9);
  }

  v13 = -[NSString copyWithZone:](self->_hwMachine, "copyWithZone:", a3);
  v14 = (void *)v5[5];
  v5[5] = v13;

  v15 = -[NSString copyWithZone:](self->_osRelease, "copyWithZone:", a3);
  v16 = (void *)v5[7];
  v5[7] = v15;

  v17 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  v18 = (void *)v5[2];
  v5[2] = v17;

  v19 = -[NSString copyWithZone:](self->_inputLanguage, "copyWithZone:", a3);
  v20 = (void *)v5[6];
  v5[6] = v19;

  v21 = -[GEORPUserCredentials copyWithZone:](self->_userCredentials, "copyWithZone:", a3);
  v22 = (void *)v5[9];
  v5[9] = v21;

  v23 = -[NSData copyWithZone:](self->_devicePushToken, "copyWithZone:", a3);
  v24 = (void *)v5[4];
  v5[4] = v23;

  v25 = -[NSString copyWithZone:](self->_userEmail, "copyWithZone:", a3);
  v26 = (void *)v5[10];
  v5[10] = v25;

  v27 = -[GEOLocation copyWithZone:](self->_userLocation, "copyWithZone:", a3);
  v28 = (void *)v5[11];
  v5[11] = v27;

  v29 = -[GEORPDebugSettings copyWithZone:](self->_debugSettings, "copyWithZone:", a3);
  v30 = (void *)v5[3];
  v5[3] = v29;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *requestElements;
  NSString *hwMachine;
  NSString *osRelease;
  NSString *countryCode;
  NSString *inputLanguage;
  GEORPUserCredentials *userCredentials;
  NSData *devicePushToken;
  NSString *userEmail;
  GEOLocation *userLocation;
  GEORPDebugSettings *debugSettings;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[GEORPProblemCollectionRequest readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  requestElements = self->_requestElements;
  if ((unint64_t)requestElements | v4[8])
  {
    if (!-[NSMutableArray isEqual:](requestElements, "isEqual:"))
      goto LABEL_22;
  }
  hwMachine = self->_hwMachine;
  if ((unint64_t)hwMachine | v4[5] && !-[NSString isEqual:](hwMachine, "isEqual:"))
    goto LABEL_22;
  if (((osRelease = self->_osRelease, !((unint64_t)osRelease | v4[7]))
     || -[NSString isEqual:](osRelease, "isEqual:"))
    && ((countryCode = self->_countryCode, !((unint64_t)countryCode | v4[2]))
     || -[NSString isEqual:](countryCode, "isEqual:"))
    && ((inputLanguage = self->_inputLanguage, !((unint64_t)inputLanguage | v4[6]))
     || -[NSString isEqual:](inputLanguage, "isEqual:"))
    && ((userCredentials = self->_userCredentials, !((unint64_t)userCredentials | v4[9]))
     || -[GEORPUserCredentials isEqual:](userCredentials, "isEqual:"))
    && ((devicePushToken = self->_devicePushToken, !((unint64_t)devicePushToken | v4[4]))
     || -[NSData isEqual:](devicePushToken, "isEqual:"))
    && ((userEmail = self->_userEmail, !((unint64_t)userEmail | v4[10]))
     || -[NSString isEqual:](userEmail, "isEqual:"))
    && ((userLocation = self->_userLocation, !((unint64_t)userLocation | v4[11]))
     || -[GEOLocation isEqual:](userLocation, "isEqual:")))
  {
    debugSettings = self->_debugSettings;
    if ((unint64_t)debugSettings | v4[3])
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
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  unint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  unint64_t v11;

  -[GEORPProblemCollectionRequest readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_requestElements, "hash");
  v4 = -[NSString hash](self->_hwMachine, "hash") ^ v3;
  v5 = -[NSString hash](self->_osRelease, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_countryCode, "hash");
  v7 = -[NSString hash](self->_inputLanguage, "hash");
  v8 = v7 ^ -[GEORPUserCredentials hash](self->_userCredentials, "hash");
  v9 = v6 ^ v8 ^ -[NSData hash](self->_devicePushToken, "hash");
  v10 = -[NSString hash](self->_userEmail, "hash");
  v11 = v10 ^ -[GEOLocation hash](self->_userLocation, "hash");
  return v9 ^ v11 ^ -[GEORPDebugSettings hash](self->_debugSettings, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  GEORPUserCredentials *userCredentials;
  id v11;
  GEOLocation *userLocation;
  id v13;
  GEORPDebugSettings *debugSettings;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v4[8];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        -[GEORPProblemCollectionRequest addRequestElement:](self, "addRequestElement:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  if (v4[5])
    -[GEORPProblemCollectionRequest setHwMachine:](self, "setHwMachine:");
  if (v4[7])
    -[GEORPProblemCollectionRequest setOsRelease:](self, "setOsRelease:");
  if (v4[2])
    -[GEORPProblemCollectionRequest setCountryCode:](self, "setCountryCode:");
  if (v4[6])
    -[GEORPProblemCollectionRequest setInputLanguage:](self, "setInputLanguage:");
  userCredentials = self->_userCredentials;
  v11 = v4[9];
  if (userCredentials)
  {
    if (v11)
      -[GEORPUserCredentials mergeFrom:](userCredentials, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEORPProblemCollectionRequest setUserCredentials:](self, "setUserCredentials:");
  }
  if (v4[4])
    -[GEORPProblemCollectionRequest setDevicePushToken:](self, "setDevicePushToken:");
  if (v4[10])
    -[GEORPProblemCollectionRequest setUserEmail:](self, "setUserEmail:");
  userLocation = self->_userLocation;
  v13 = v4[11];
  if (userLocation)
  {
    if (v13)
      -[GEOLocation mergeFrom:](userLocation, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEORPProblemCollectionRequest setUserLocation:](self, "setUserLocation:");
  }
  debugSettings = self->_debugSettings;
  v15 = v4[3];
  if (debugSettings)
  {
    if (v15)
      -[GEORPDebugSettings mergeFrom:](debugSettings, "mergeFrom:");
  }
  else if (v15)
  {
    -[GEORPProblemCollectionRequest setDebugSettings:](self, "setDebugSettings:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLocation, 0);
  objc_storeStrong((id *)&self->_userEmail, 0);
  objc_storeStrong((id *)&self->_userCredentials, 0);
  objc_storeStrong((id *)&self->_requestElements, 0);
  objc_storeStrong((id *)&self->_osRelease, 0);
  objc_storeStrong((id *)&self->_inputLanguage, 0);
  objc_storeStrong((id *)&self->_hwMachine, 0);
  objc_storeStrong((id *)&self->_devicePushToken, 0);
  objc_storeStrong((id *)&self->_debugSettings, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
