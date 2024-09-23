@implementation GEORPFeedbackUserInfo

- (GEORPFeedbackUserInfo)init
{
  GEORPFeedbackUserInfo *v2;
  GEORPFeedbackUserInfo *v3;
  GEORPFeedbackUserInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackUserInfo;
  v2 = -[GEORPFeedbackUserInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackUserInfo)initWithData:(id)a3
{
  GEORPFeedbackUserInfo *v3;
  GEORPFeedbackUserInfo *v4;
  GEORPFeedbackUserInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackUserInfo;
  v3 = -[GEORPFeedbackUserInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readUserCredentials
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackUserInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserCredentials_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasUserCredentials
{
  -[GEORPFeedbackUserInfo _readUserCredentials]((uint64_t)self);
  return self->_userCredentials != 0;
}

- (GEORPUserCredentials)userCredentials
{
  -[GEORPFeedbackUserInfo _readUserCredentials]((uint64_t)self);
  return self->_userCredentials;
}

- (void)setUserCredentials:(id)a3
{
  *(_WORD *)&self->_flags |= 0x280u;
  objc_storeStrong((id *)&self->_userCredentials, a3);
}

- (void)_readDevicePushToken
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackUserInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDevicePushToken_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasDevicePushToken
{
  -[GEORPFeedbackUserInfo _readDevicePushToken]((uint64_t)self);
  return self->_devicePushToken != 0;
}

- (NSData)devicePushToken
{
  -[GEORPFeedbackUserInfo _readDevicePushToken]((uint64_t)self);
  return self->_devicePushToken;
}

- (void)setDevicePushToken:(id)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  objc_storeStrong((id *)&self->_devicePushToken, a3);
}

- (void)_readUserEmail
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackUserInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserEmail_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasUserEmail
{
  -[GEORPFeedbackUserInfo _readUserEmail]((uint64_t)self);
  return self->_userEmail != 0;
}

- (NSString)userEmail
{
  -[GEORPFeedbackUserInfo _readUserEmail]((uint64_t)self);
  return self->_userEmail;
}

- (void)setUserEmail:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_userEmail, a3);
}

- (void)_readPreferredEmail
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackUserInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPreferredEmail_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasPreferredEmail
{
  -[GEORPFeedbackUserInfo _readPreferredEmail]((uint64_t)self);
  return self->_preferredEmail != 0;
}

- (NSString)preferredEmail
{
  -[GEORPFeedbackUserInfo _readPreferredEmail]((uint64_t)self);
  return self->_preferredEmail;
}

- (void)setPreferredEmail:(id)a3
{
  *(_WORD *)&self->_flags |= 0x208u;
  objc_storeStrong((id *)&self->_preferredEmail, a3);
}

- (void)_readUgcUserId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackUserInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUgcUserId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasUgcUserId
{
  -[GEORPFeedbackUserInfo _readUgcUserId]((uint64_t)self);
  return self->_ugcUserId != 0;
}

- (NSString)ugcUserId
{
  -[GEORPFeedbackUserInfo _readUgcUserId]((uint64_t)self);
  return self->_ugcUserId;
}

- (void)setUgcUserId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x240u;
  objc_storeStrong((id *)&self->_ugcUserId, a3);
}

- (void)_readAnonUserInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackUserInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnonUserInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasAnonUserInfo
{
  -[GEORPFeedbackUserInfo _readAnonUserInfo]((uint64_t)self);
  return self->_anonUserInfo != 0;
}

- (GEORPAppAttestInfo)anonUserInfo
{
  -[GEORPFeedbackUserInfo _readAnonUserInfo]((uint64_t)self);
  return self->_anonUserInfo;
}

- (void)setAnonUserInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  objc_storeStrong((id *)&self->_anonUserInfo, a3);
}

- (void)_readRolloverInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackUserInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRolloverInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasRolloverInfo
{
  -[GEORPFeedbackUserInfo _readRolloverInfo]((uint64_t)self);
  return self->_rolloverInfo != 0;
}

- (GEORPAppAttestInfo)rolloverInfo
{
  -[GEORPFeedbackUserInfo _readRolloverInfo]((uint64_t)self);
  return self->_rolloverInfo;
}

- (void)setRolloverInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  objc_storeStrong((id *)&self->_rolloverInfo, a3);
}

- (void)_readTdmUserInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackUserInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTdmUserInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasTdmUserInfo
{
  -[GEORPFeedbackUserInfo _readTdmUserInfo]((uint64_t)self);
  return self->_tdmUserInfo != 0;
}

- (GEORPTdmInfo)tdmUserInfo
{
  -[GEORPFeedbackUserInfo _readTdmUserInfo]((uint64_t)self);
  return self->_tdmUserInfo;
}

- (void)setTdmUserInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x220u;
  objc_storeStrong((id *)&self->_tdmUserInfo, a3);
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
  v8.super_class = (Class)GEORPFeedbackUserInfo;
  -[GEORPFeedbackUserInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackUserInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackUserInfo _dictionaryRepresentation:](self, 0);
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
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
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
  objc_msgSend(a1, "userCredentials");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("userCredentials");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("user_credentials");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend(a1, "devicePushToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("devicePushToken"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("device_push_token"));
    }
  }

  objc_msgSend(a1, "userEmail");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (a2)
      v13 = CFSTR("userEmail");
    else
      v13 = CFSTR("user_email");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);
  }

  objc_msgSend(a1, "preferredEmail");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (a2)
      v15 = CFSTR("preferredEmail");
    else
      v15 = CFSTR("preferred_email");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);
  }

  objc_msgSend(a1, "ugcUserId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    if (a2)
      v17 = CFSTR("ugcUserId");
    else
      v17 = CFSTR("ugc_user_id");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);
  }

  objc_msgSend(a1, "anonUserInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v18, "jsonRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("anonUserInfo");
    }
    else
    {
      objc_msgSend(v18, "dictionaryRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("anon_user_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  objc_msgSend(a1, "rolloverInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v22, "jsonRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("rolloverInfo");
    }
    else
    {
      objc_msgSend(v22, "dictionaryRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("rollover_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

  }
  objc_msgSend(a1, "tdmUserInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v26, "jsonRepresentation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("tdmUserInfo");
    }
    else
    {
      objc_msgSend(v26, "dictionaryRepresentation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("tdm_user_info");
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
      v37[2] = __51__GEORPFeedbackUserInfo__dictionaryRepresentation___block_invoke;
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
  return -[GEORPFeedbackUserInfo _dictionaryRepresentation:](self, 1);
}

void __51__GEORPFeedbackUserInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPFeedbackUserInfo)initWithDictionary:(id)a3
{
  return (GEORPFeedbackUserInfo *)-[GEORPFeedbackUserInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEORPUserCredentials *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  GEORPAppAttestInfo *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  GEORPAppAttestInfo *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  GEORPTdmInfo *v35;
  uint64_t v36;
  void *v37;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("userCredentials");
      else
        v6 = CFSTR("user_credentials");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEORPUserCredentials alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEORPUserCredentials initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEORPUserCredentials initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setUserCredentials:", v9);

      }
      if (a3)
        v11 = CFSTR("devicePushToken");
      else
        v11 = CFSTR("device_push_token");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v12, 0);
        objc_msgSend(a1, "setDevicePushToken:", v13);

      }
      if (a3)
        v14 = CFSTR("userEmail");
      else
        v14 = CFSTR("user_email");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = (void *)objc_msgSend(v15, "copy");
        objc_msgSend(a1, "setUserEmail:", v16);

      }
      if (a3)
        v17 = CFSTR("preferredEmail");
      else
        v17 = CFSTR("preferred_email");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = (void *)objc_msgSend(v18, "copy");
        objc_msgSend(a1, "setPreferredEmail:", v19);

      }
      if (a3)
        v20 = CFSTR("ugcUserId");
      else
        v20 = CFSTR("ugc_user_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = (void *)objc_msgSend(v21, "copy");
        objc_msgSend(a1, "setUgcUserId:", v22);

      }
      if (a3)
        v23 = CFSTR("anonUserInfo");
      else
        v23 = CFSTR("anon_user_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = [GEORPAppAttestInfo alloc];
        if ((a3 & 1) != 0)
          v26 = -[GEORPAppAttestInfo initWithJSON:](v25, "initWithJSON:", v24);
        else
          v26 = -[GEORPAppAttestInfo initWithDictionary:](v25, "initWithDictionary:", v24);
        v27 = (void *)v26;
        objc_msgSend(a1, "setAnonUserInfo:", v26);

      }
      if (a3)
        v28 = CFSTR("rolloverInfo");
      else
        v28 = CFSTR("rollover_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = [GEORPAppAttestInfo alloc];
        if ((a3 & 1) != 0)
          v31 = -[GEORPAppAttestInfo initWithJSON:](v30, "initWithJSON:", v29);
        else
          v31 = -[GEORPAppAttestInfo initWithDictionary:](v30, "initWithDictionary:", v29);
        v32 = (void *)v31;
        objc_msgSend(a1, "setRolloverInfo:", v31);

      }
      if (a3)
        v33 = CFSTR("tdmUserInfo");
      else
        v33 = CFSTR("tdm_user_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = [GEORPTdmInfo alloc];
        if ((a3 & 1) != 0)
          v36 = -[GEORPTdmInfo initWithJSON:](v35, "initWithJSON:", v34);
        else
          v36 = -[GEORPTdmInfo initWithDictionary:](v35, "initWithDictionary:", v34);
        v37 = (void *)v36;
        objc_msgSend(a1, "setTdmUserInfo:", v36);

      }
    }
  }

  return a1;
}

- (GEORPFeedbackUserInfo)initWithJSON:(id)a3
{
  return (GEORPFeedbackUserInfo *)-[GEORPFeedbackUserInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2077;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2078;
    GEORPFeedbackUserInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPFeedbackUserInfoCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackUserInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackUserInfoReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && !_GEORPFeedbackUserInfoIsDirty((uint64_t)self))
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
    -[GEORPFeedbackUserInfo readAll:](self, "readAll:", 0);
    if (self->_userCredentials)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_devicePushToken)
    {
      PBDataWriterWriteDataField();
      v5 = v8;
    }
    if (self->_userEmail)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_preferredEmail)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_ugcUserId)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_anonUserInfo)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_rolloverInfo)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_tdmUserInfo)
    {
      PBDataWriterWriteSubmessage();
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
  -[GEORPFeedbackUserInfo readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 22) = self->_readerMarkPos;
  *((_DWORD *)v5 + 23) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_userCredentials)
    objc_msgSend(v5, "setUserCredentials:");
  if (self->_devicePushToken)
    objc_msgSend(v5, "setDevicePushToken:");
  v4 = v5;
  if (self->_userEmail)
  {
    objc_msgSend(v5, "setUserEmail:");
    v4 = v5;
  }
  if (self->_preferredEmail)
  {
    objc_msgSend(v5, "setPreferredEmail:");
    v4 = v5;
  }
  if (self->_ugcUserId)
  {
    objc_msgSend(v5, "setUgcUserId:");
    v4 = v5;
  }
  if (self->_anonUserInfo)
  {
    objc_msgSend(v5, "setAnonUserInfo:");
    v4 = v5;
  }
  if (self->_rolloverInfo)
  {
    objc_msgSend(v5, "setRolloverInfo:");
    v4 = v5;
  }
  if (self->_tdmUserInfo)
  {
    objc_msgSend(v5, "setTdmUserInfo:");
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
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPFeedbackUserInfo readAll:](self, "readAll:", 0);
    v8 = -[GEORPUserCredentials copyWithZone:](self->_userCredentials, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v8;

    v10 = -[NSData copyWithZone:](self->_devicePushToken, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v10;

    v12 = -[NSString copyWithZone:](self->_userEmail, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v12;

    v14 = -[NSString copyWithZone:](self->_preferredEmail, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v14;

    v16 = -[NSString copyWithZone:](self->_ugcUserId, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v16;

    v18 = -[GEORPAppAttestInfo copyWithZone:](self->_anonUserInfo, "copyWithZone:", a3);
    v19 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v18;

    v20 = -[GEORPAppAttestInfo copyWithZone:](self->_rolloverInfo, "copyWithZone:", a3);
    v21 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v20;

    v22 = -[GEORPTdmInfo copyWithZone:](self->_tdmUserInfo, "copyWithZone:", a3);
    v23 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v22;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPFeedbackUserInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEORPUserCredentials *userCredentials;
  NSData *devicePushToken;
  NSString *userEmail;
  NSString *preferredEmail;
  NSString *ugcUserId;
  GEORPAppAttestInfo *anonUserInfo;
  GEORPAppAttestInfo *rolloverInfo;
  GEORPTdmInfo *tdmUserInfo;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[GEORPFeedbackUserInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  userCredentials = self->_userCredentials;
  if ((unint64_t)userCredentials | v4[9])
  {
    if (!-[GEORPUserCredentials isEqual:](userCredentials, "isEqual:"))
      goto LABEL_18;
  }
  if (((devicePushToken = self->_devicePushToken, !((unint64_t)devicePushToken | v4[4]))
     || -[NSData isEqual:](devicePushToken, "isEqual:"))
    && ((userEmail = self->_userEmail, !((unint64_t)userEmail | v4[10]))
     || -[NSString isEqual:](userEmail, "isEqual:"))
    && ((preferredEmail = self->_preferredEmail, !((unint64_t)preferredEmail | v4[5]))
     || -[NSString isEqual:](preferredEmail, "isEqual:"))
    && ((ugcUserId = self->_ugcUserId, !((unint64_t)ugcUserId | v4[8]))
     || -[NSString isEqual:](ugcUserId, "isEqual:"))
    && ((anonUserInfo = self->_anonUserInfo, !((unint64_t)anonUserInfo | v4[3]))
     || -[GEORPAppAttestInfo isEqual:](anonUserInfo, "isEqual:"))
    && ((rolloverInfo = self->_rolloverInfo, !((unint64_t)rolloverInfo | v4[6]))
     || -[GEORPAppAttestInfo isEqual:](rolloverInfo, "isEqual:")))
  {
    tdmUserInfo = self->_tdmUserInfo;
    if ((unint64_t)tdmUserInfo | v4[7])
      v13 = -[GEORPTdmInfo isEqual:](tdmUserInfo, "isEqual:");
    else
      v13 = 1;
  }
  else
  {
LABEL_18:
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  unint64_t v8;
  unint64_t v9;

  -[GEORPFeedbackUserInfo readAll:](self, "readAll:", 1);
  v3 = -[GEORPUserCredentials hash](self->_userCredentials, "hash");
  v4 = -[NSData hash](self->_devicePushToken, "hash") ^ v3;
  v5 = -[NSString hash](self->_userEmail, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_preferredEmail, "hash");
  v7 = -[NSString hash](self->_ugcUserId, "hash");
  v8 = v7 ^ -[GEORPAppAttestInfo hash](self->_anonUserInfo, "hash");
  v9 = v6 ^ v8 ^ -[GEORPAppAttestInfo hash](self->_rolloverInfo, "hash");
  return v9 ^ -[GEORPTdmInfo hash](self->_tdmUserInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEORPUserCredentials *userCredentials;
  uint64_t v5;
  GEORPAppAttestInfo *anonUserInfo;
  uint64_t v7;
  GEORPAppAttestInfo *rolloverInfo;
  uint64_t v9;
  GEORPTdmInfo *tdmUserInfo;
  uint64_t v11;
  _QWORD *v12;

  v12 = a3;
  objc_msgSend(v12, "readAll:", 0);
  userCredentials = self->_userCredentials;
  v5 = v12[9];
  if (userCredentials)
  {
    if (v5)
      -[GEORPUserCredentials mergeFrom:](userCredentials, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEORPFeedbackUserInfo setUserCredentials:](self, "setUserCredentials:");
  }
  if (v12[4])
    -[GEORPFeedbackUserInfo setDevicePushToken:](self, "setDevicePushToken:");
  if (v12[10])
    -[GEORPFeedbackUserInfo setUserEmail:](self, "setUserEmail:");
  if (v12[5])
    -[GEORPFeedbackUserInfo setPreferredEmail:](self, "setPreferredEmail:");
  if (v12[8])
    -[GEORPFeedbackUserInfo setUgcUserId:](self, "setUgcUserId:");
  anonUserInfo = self->_anonUserInfo;
  v7 = v12[3];
  if (anonUserInfo)
  {
    if (v7)
      -[GEORPAppAttestInfo mergeFrom:](anonUserInfo, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEORPFeedbackUserInfo setAnonUserInfo:](self, "setAnonUserInfo:");
  }
  rolloverInfo = self->_rolloverInfo;
  v9 = v12[6];
  if (rolloverInfo)
  {
    if (v9)
      -[GEORPAppAttestInfo mergeFrom:](rolloverInfo, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEORPFeedbackUserInfo setRolloverInfo:](self, "setRolloverInfo:");
  }
  tdmUserInfo = self->_tdmUserInfo;
  v11 = v12[7];
  if (tdmUserInfo)
  {
    if (v11)
      -[GEORPTdmInfo mergeFrom:](tdmUserInfo, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEORPFeedbackUserInfo setTdmUserInfo:](self, "setTdmUserInfo:");
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
      GEORPFeedbackUserInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2081);
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
  *(_WORD *)&self->_flags |= 0x201u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORPFeedbackUserInfo readAll:](self, "readAll:", 0);
    -[GEORPAppAttestInfo clearUnknownFields:](self->_anonUserInfo, "clearUnknownFields:", 1);
    -[GEORPAppAttestInfo clearUnknownFields:](self->_rolloverInfo, "clearUnknownFields:", 1);
    -[GEORPTdmInfo clearUnknownFields:](self->_tdmUserInfo, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userEmail, 0);
  objc_storeStrong((id *)&self->_userCredentials, 0);
  objc_storeStrong((id *)&self->_ugcUserId, 0);
  objc_storeStrong((id *)&self->_tdmUserInfo, 0);
  objc_storeStrong((id *)&self->_rolloverInfo, 0);
  objc_storeStrong((id *)&self->_preferredEmail, 0);
  objc_storeStrong((id *)&self->_devicePushToken, 0);
  objc_storeStrong((id *)&self->_anonUserInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
