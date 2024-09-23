@implementation GEOMapDataSubscriptionState

- (GEOMapDataSubscriptionState)init
{
  GEOMapDataSubscriptionState *v2;
  GEOMapDataSubscriptionState *v3;
  GEOMapDataSubscriptionState *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOMapDataSubscriptionState;
  v2 = -[GEOMapDataSubscriptionState init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[GEOMapDataSubscriptionState _commonInit](v2, "_commonInit");
    v4 = v3;
  }

  return v3;
}

- (GEOMapDataSubscriptionState)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v5;
  GEOMapDataSubscriptionState *v6;
  GEOMapDataSubscriptionState *v7;
  GEOMapDataSubscriptionState *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMapDataSubscriptionState;
  v6 = -[GEOMapDataSubscriptionState init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[GEOMapDataSubscriptionState _commonInit](v6, "_commonInit");
    -[GEOMapDataSubscriptionState _updateWithXPCDictionary:]((uint64_t)v7, v5);
    v8 = v7;
  }

  return v7;
}

- (void)_updateWithXPCDictionary:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id *v18;
  int v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t int64;
  int64_t v31;
  uint64_t uint64;
  id v33;

  if (a1)
  {
    v3 = a2;
    int64 = xpc_dictionary_get_int64(v3, "load_state");
    v31 = xpc_dictionary_get_int64(v3, "download_state");
    uint64 = xpc_dictionary_get_uint64(v3, "data_count");
    v4 = xpc_dictionary_get_uint64(v3, "data_size");
    xpc_dictionary_get_dictionary(v3, "progress");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_value(v3, "last_error");
    v5 = objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_dictionary(v3, "user_info");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v6;
    v23 = v4;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = xpc_dictionary_get_uint64(v7, (const char *)objc_msgSend(CFSTR("GEOMapDataSubscriptionStateWaitingReasonKey"), "UTF8String"));
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("GEOMapDataSubscriptionStateWaitingReasonKey"));

      }
      v11 = xpc_dictionary_get_uint64(v7, (const char *)objc_msgSend(CFSTR("GEOMapDataSubscriptionStateWaitingMinimumBatteryLevelKey"), "UTF8String"));
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("GEOMapDataSubscriptionStateWaitingMinimumBatteryLevelKey"));

      }
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0C9AA70];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v26 = *(_QWORD *)(a1 + 16);
    v27 = *(_QWORD *)(a1 + 24);
    v28 = *(_QWORD *)(a1 + 56);
    v29 = *(_QWORD *)(a1 + 64);
    v13 = *(_QWORD *)(a1 + 32) == 0;
    obj = v8;
    v14 = objc_msgSend(v8, "isEqualToDictionary:", *(_QWORD *)(a1 + 48));
    v24 = (void *)v5;
    if (v5)
    {
      _geo_NSErrorFromXPCDictionaryRepresentationCopy();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v18 = (id *)(a1 + 40);
      v17 = *(_QWORD *)(a1 + 40);
      v19 = (v15 != 0) ^ (v17 != 0);
      if (v15 && v17)
        v19 = objc_msgSend(v15, "isEqual:") ^ 1;
    }
    else
    {
      v16 = 0;
      v18 = (id *)(a1 + 40);
      v19 = *(_QWORD *)(a1 + 40) != 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (int64 != v26)
      objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("loadState"));
    if (v31 != v27)
      objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("downloadState"));
    if (uint64 != v28)
      objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("downloadedDataCount"));
    if (v4 == v29)
    {
      if ((((v33 != 0) ^ v13) & 1) != 0)
        goto LABEL_20;
    }
    else
    {
      objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("downloadedDataSize"));
      if ((((v33 != 0) ^ v13) & 1) != 0)
      {
LABEL_20:
        if (!v19)
          goto LABEL_21;
        goto LABEL_28;
      }
    }
    objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("downloadProgress"));
    if (!v19)
    {
LABEL_21:
      if ((v14 & 1) != 0)
        goto LABEL_23;
      goto LABEL_22;
    }
LABEL_28:
    objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("lastError"));
    if ((v14 & 1) != 0)
    {
LABEL_23:
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
      *(_QWORD *)(a1 + 16) = int64;
      *(_QWORD *)(a1 + 24) = v31;
      *(_QWORD *)(a1 + 56) = uint64;
      *(_QWORD *)(a1 + 64) = v4;
      v20 = *(void **)(a1 + 32);
      if (v33)
      {
        if (v20)
          goto LABEL_33;
        objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
        v21 = objc_claimAutoreleasedReturnValue();
        v20 = *(void **)(a1 + 32);
      }
      else
      {
        if (!v20)
          goto LABEL_33;
        v21 = 0;
      }
      *(_QWORD *)(a1 + 32) = v21;

LABEL_33:
      objc_storeStrong(v18, v16);
      if ((v14 & 1) == 0)
        objc_storeStrong((id *)(a1 + 48), obj);
      v22 = *(id *)(a1 + 32);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      objc_msgSend(v22, "_geo_configureFromMirroredProgressXPCDictionary:", v33);

      if (int64 != v26)
        objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("loadState"));
      if (v31 != v27)
        objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("downloadState"));
      if (uint64 != v28)
        objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("downloadedDataCount"));
      if (v23 == v29)
      {
        if ((((v33 != 0) ^ v13) & 1) != 0)
          goto LABEL_43;
      }
      else
      {
        objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("downloadedDataSize"));
        if ((((v33 != 0) ^ v13) & 1) != 0)
        {
LABEL_43:
          if (!v19)
            goto LABEL_44;
          goto LABEL_49;
        }
      }
      objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("downloadProgress"));
      if (!v19)
      {
LABEL_44:
        if ((v14 & 1) != 0)
        {
LABEL_46:

          return;
        }
LABEL_45:
        objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("userInfo"));
        goto LABEL_46;
      }
LABEL_49:
      objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("lastError"));
      if ((v14 & 1) != 0)
        goto LABEL_46;
      goto LABEL_45;
    }
LABEL_22:
    objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("userInfo"));
    goto LABEL_23;
  }
}

- (void)_commonInit
{
  NSDictionary *userInfo;

  self->_lock._os_unfair_lock_opaque = 0;
  userInfo = self->_userInfo;
  self->_userInfo = (NSDictionary *)MEMORY[0x1E0C9AA70];

}

- (void)_handleXPCError:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v4 = *(_QWORD *)(a1 + 32);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (v4)
    {
      objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("downloadProgress"));
      objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("lastError"));
      objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("downloadState"));
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
      objc_msgSend(*(id *)(a1 + 32), "cancel");
      v5 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = 0;

      objc_storeStrong((id *)(a1 + 40), a2);
      *(_QWORD *)(a1 + 24) = 4;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("downloadProgress"));
      objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("lastError"));
      objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("downloadState"));
    }
  }

}

- (void)encodeToXPCDictionary:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSProgress *progress;
  void *v6;
  NSError *lastError;
  void *v8;
  NSDictionary *v9;
  xpc_object_t empty;
  void *v11;
  void *v12;
  xpc_object_t xdict;

  xdict = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  xpc_dictionary_set_int64(xdict, "load_state", self->_loadState);
  xpc_dictionary_set_int64(xdict, "download_state", self->_downloadState);
  xpc_dictionary_set_uint64(xdict, "data_count", self->_dataCount);
  xpc_dictionary_set_uint64(xdict, "data_size", self->_dataSize);
  progress = self->_progress;
  if (progress)
  {
    -[NSProgress _geo_mirroredProgressXPCDictionary](progress, "_geo_mirroredProgressXPCDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_value(xdict, "progress", v6);

  }
  lastError = self->_lastError;
  if (lastError)
  {
    _geo_NSErrorXPCDictionaryRepresentationCopy(lastError);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_value(xdict, "last_error", v8);

  }
  v9 = self->_userInfo;
  empty = xpc_dictionary_create_empty();
  -[NSDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("GEOMapDataSubscriptionStateWaitingReasonKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    xpc_dictionary_set_uint64(empty, (const char *)objc_msgSend(CFSTR("GEOMapDataSubscriptionStateWaitingReasonKey"), "UTF8String"), objc_msgSend(v11, "unsignedIntegerValue"));
  -[NSDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("GEOMapDataSubscriptionStateWaitingMinimumBatteryLevelKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    xpc_dictionary_set_uint64(empty, (const char *)objc_msgSend(CFSTR("GEOMapDataSubscriptionStateWaitingMinimumBatteryLevelKey"), "UTF8String"), objc_msgSend(v12, "unsignedIntegerValue"));

  xpc_dictionary_set_value(xdict, "user_info", empty);
  os_unfair_lock_unlock(p_lock);

}

- (int64_t)loadState
{
  os_unfair_lock_s *p_lock;
  int64_t loadState;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  loadState = self->_loadState;
  os_unfair_lock_unlock(p_lock);
  return loadState;
}

- (int64_t)downloadState
{
  os_unfair_lock_s *p_lock;
  int64_t downloadState;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  downloadState = self->_downloadState;
  os_unfair_lock_unlock(p_lock);
  return downloadState;
}

- (NSProgress)downloadProgress
{
  os_unfair_lock_s *p_lock;
  NSProgress *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_progress;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSError)lastError
{
  os_unfair_lock_s *p_lock;
  NSError *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lastError;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)downloadedDataCount
{
  os_unfair_lock_s *p_lock;
  unint64_t dataCount;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dataCount = self->_dataCount;
  os_unfair_lock_unlock(p_lock);
  return dataCount;
}

- (unint64_t)downloadedDataSize
{
  os_unfair_lock_s *p_lock;
  unint64_t dataSize;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dataSize = self->_dataSize;
  os_unfair_lock_unlock(p_lock);
  return dataSize;
}

- (NSDictionary)userInfo
{
  os_unfair_lock_s *p_lock;
  NSDictionary *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_userInfo;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_setLoadState:(uint64_t)a3 downloadState:(void *)a4 downloadProgress:(void *)a5 lastError:(uint64_t)a6 downloadedDataCount:(uint64_t)a7 downloadedDataSize:(void *)a8 userInfo:
{
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a4;
  v15 = a5;
  v16 = a8;
  if (a1)
  {
    objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("loadState"));
    objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("downloadState"));
    objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("downloadProgress"));
    objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("lastError"));
    objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("downloadedDataCount"));
    objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("downloadedDataSize"));
    objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("userInfo"));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    *(_QWORD *)(a1 + 16) = a2;
    *(_QWORD *)(a1 + 24) = a3;
    v17 = *(void **)(a1 + 32);
    if (v20)
    {
      if (v17)
      {
        objc_msgSend(v17, "_geo_mirroredProgressReplaceObservedProgressWith:");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB38A8], "_geo_progressMirroringProgress:");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(a1 + 32);
        *(_QWORD *)(a1 + 32) = v18;

      }
    }
    else
    {
      *(_QWORD *)(a1 + 32) = 0;

    }
    objc_storeStrong((id *)(a1 + 40), a5);
    *(_QWORD *)(a1 + 56) = a6;
    *(_QWORD *)(a1 + 64) = a7;
    objc_storeStrong((id *)(a1 + 48), a8);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("loadState"));
    objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("downloadState"));
    objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("downloadProgress"));
    objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("lastError"));
    objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("downloadedDataCount"));
    objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("downloadedDataSize"));
    objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("userInfo"));
  }

}

- (void)_updateWithPairedDeviceState:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  if (a1)
  {
    v3 = a2;
    v17 = objc_msgSend(v3, "loadState");
    v18 = objc_msgSend(v3, "downloadState");
    objc_msgSend(v3, "progress");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "hasWaitingReasons"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "waitingReasons"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("GEOMapDataSubscriptionStateWaitingReasonKey"));

      }
      if (objc_msgSend(v4, "hasMinBatteryLevel"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "minBatteryLevel"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("GEOMapDataSubscriptionStateWaitingMinimumBatteryLevelKey"));

      }
      v8 = v5;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0C9AA70];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v10 = *(_QWORD *)(a1 + 16);
    v9 = *(_QWORD *)(a1 + 24);
    v11 = *(_QWORD *)(a1 + 32) == 0;
    v12 = v8;
    v13 = objc_msgSend(*(id *)(a1 + 48), "isEqualToDictionary:", v8);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (v10 != v17)
      objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("loadState"));
    if (v9 == v18)
    {
      if ((((v19 != 0) ^ v11) & 1) != 0)
        goto LABEL_13;
    }
    else
    {
      objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("downloadState"));
      if ((((v19 != 0) ^ v11) & 1) != 0)
      {
LABEL_13:
        if ((v13 & 1) != 0)
        {
LABEL_14:
          os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
          *(_QWORD *)(a1 + 16) = v17;
          *(_QWORD *)(a1 + 24) = v18;
          goto LABEL_18;
        }
LABEL_17:
        objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("userInfo"));
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
        *(_QWORD *)(a1 + 16) = v17;
        *(_QWORD *)(a1 + 24) = v18;
        objc_storeStrong((id *)(a1 + 48), v12);
LABEL_18:
        v14 = *(void **)(a1 + 32);
        if (v19)
        {
          if (v14)
            goto LABEL_24;
          objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
          v15 = objc_claimAutoreleasedReturnValue();
          v14 = *(void **)(a1 + 32);
        }
        else
        {
          if (!v14)
            goto LABEL_24;
          v15 = 0;
        }
        *(_QWORD *)(a1 + 32) = v15;

LABEL_24:
        v16 = *(id *)(a1 + 32);
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
        objc_msgSend(v16, "_geo_configureFromPairedDeviceProgress:", v19);

        if (v10 != v17)
          objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("loadState"));
        if (v9 == v18)
        {
          if ((((v19 != 0) ^ v11) & 1) != 0)
            goto LABEL_28;
        }
        else
        {
          objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("downloadState"));
          if ((((v19 != 0) ^ v11) & 1) != 0)
          {
LABEL_28:
            if ((v13 & 1) != 0)
            {
LABEL_30:

              return;
            }
LABEL_29:
            objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("userInfo"));
            goto LABEL_30;
          }
        }
        objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("downloadProgress"));
        if ((v13 & 1) != 0)
          goto LABEL_30;
        goto LABEL_29;
      }
    }
    objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("downloadProgress"));
    if ((v13 & 1) != 0)
      goto LABEL_14;
    goto LABEL_17;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

@end
