@implementation _DKSyncUrgencyTracker

+ (id)sharedInstance
{
  objc_opt_self();
  if (sharedInstance_initialized_4 != -1)
    dispatch_once(&sharedInstance_initialized_4, &__block_literal_global_72);
  return (id)sharedInstance_tracker;
}

- (void)updateUrgency:(void *)a3 forClient:
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    if (a2 >= 0xC)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543874;
        v21 = v18;
        v22 = 2112;
        v23 = v5;
        v24 = 2112;
        v25 = v19;
        _os_log_error_impl(&dword_18DDBE000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Invalid urgency from %@: %@", (uint8_t *)&v20, 0x20u);

      }
      a2 = 10;
    }
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v9;
      v22 = 2112;
      v23 = v5;
      v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_18DDBE000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating urgency for %@ to %@", (uint8_t *)&v20, 0x20u);

    }
    v11 = a1[2];
    if (!v11)
    {
      v12 = objc_opt_new();
      v13 = a1[2];
      a1[2] = (id)v12;

      v11 = a1[2];
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqualToNumber:", v15);

      if ((v16 & 1) == 0)
      {
        if (!a2)
        {
          objc_msgSend(a1[2], "setObject:forKeyedSubscript:", 0, v5);
LABEL_16:
          objc_msgSend(a1, "recomputeUrgency");
          goto LABEL_17;
        }
LABEL_15:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[2], "setObject:forKeyedSubscript:", v17, v5);

        goto LABEL_16;
      }
    }
    else if (a2)
    {
      goto LABEL_15;
    }
LABEL_17:

  }
}

- (uint64_t)urgencyForClient:(uint64_t)result
{
  void *v2;
  uint64_t v3;

  if (result)
  {
    objc_msgSend(*(id *)(result + 16), "objectForKeyedSubscript:", a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "unsignedIntegerValue");

    return v3;
  }
  return result;
}

- (id)allUrgencies
{
  if (a1)
    a1 = (id *)objc_msgSend(a1[2], "copy");
  return a1;
}

- (uint64_t)ageUrgencies
{
  _QWORD *v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;

  if (result)
  {
    v1 = (_QWORD *)result;
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    v3 = objc_opt_new();
    v4 = (void *)v1[2];
    v1[2] = v3;

    return objc_msgSend(v1, "recomputeUrgency");
  }
  return result;
}

- (void)recomputeUrgency
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  const __CFString *v17;
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = self->_urgencies;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        v9 = -[_DKSyncUrgencyTracker urgencyForClient:]((uint64_t)self, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        if (v6 <= v9)
          v6 = v9;
      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  if (v6 != self->_urgency)
  {
    self->_urgency = v6;
    +[_CDObservationCenter sharedInstance](_CDObservationCenter, "sharedInstance", (_QWORD)v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = CFSTR("urgency");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_urgency);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:userInfo:sender:", CFSTR("_DKSyncUrgencyDidChangeNotification"), v12, self);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urgencies, 0);
}

@end
