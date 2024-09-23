@implementation VNRPNTrackerEspressoResourcesCache

- (VNRPNTrackerEspressoResourcesCache)init
{
  VNRPNTrackerEspressoResourcesCache *v2;
  uint64_t v3;
  NSMutableDictionary *rpnEspressoResourcesKeyToEspressoResourcesCache;
  NSLock *v5;
  NSLock *rpnEspressoResourcesKeyToEspressoResourcesCacheLock;
  VNRPNTrackerEspressoResourcesCache *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNRPNTrackerEspressoResourcesCache;
  v2 = -[VNRPNTrackerEspressoResourcesCache init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 6);
    rpnEspressoResourcesKeyToEspressoResourcesCache = v2->_rpnEspressoResourcesKeyToEspressoResourcesCache;
    v2->_rpnEspressoResourcesKeyToEspressoResourcesCache = (NSMutableDictionary *)v3;

    v5 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    rpnEspressoResourcesKeyToEspressoResourcesCacheLock = v2->_rpnEspressoResourcesKeyToEspressoResourcesCacheLock;
    v2->_rpnEspressoResourcesKeyToEspressoResourcesCacheLock = v5;

    v7 = v2;
  }

  return v2;
}

- (BOOL)addRPNTrackerResourcesConfiguredForOptions:(id)a3 resources:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;

  v8 = a3;
  v9 = a4;
  -[NSLock lock](self->_rpnEspressoResourcesKeyToEspressoResourcesCacheLock, "lock");
  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "cacheKeyFromOptions:error:", v8, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 != 0;
    if (v10)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_rpnEspressoResourcesKeyToEspressoResourcesCache, "setObject:forKeyedSubscript:", v9, v10);

  }
  else if (a5)
  {
    +[VNError errorForInvalidArgument:named:](VNError, "errorForInvalidArgument:named:", 0, CFSTR("Tracker resources"));
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  -[NSLock unlock](self->_rpnEspressoResourcesKeyToEspressoResourcesCacheLock, "unlock");

  return v11;
}

- (id)locateRPNTrackerResourcesConfiguredForOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a3;
  -[NSLock lock](self->_rpnEspressoResourcesKeyToEspressoResourcesCacheLock, "lock");
  objc_msgSend((id)objc_opt_class(), "cacheKeyFromOptions:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_rpnEspressoResourcesKeyToEspressoResourcesCache, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else if (a4)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Could not locate RPN Tracker resources for '%@'"), v7);
      +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = 0;
  }

  -[NSLock unlock](self->_rpnEspressoResourcesKeyToEspressoResourcesCacheLock, "unlock");
  return v9;
}

- (id)createRPNTrackerResourcesConfiguredWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void (**v18)(void *, id, id *);
  void *v19;
  void *v20;
  void *v21;
  id v23;
  objc_class *v24;
  id v25;
  id v26;
  void *v27;
  _QWORD aBlock[4];
  id v29;
  id v30;
  id v31;

  v6 = a3;
  -[NSLock lock](self->_rpnEspressoResourcesKeyToEspressoResourcesCacheLock, "lock");
  objc_msgSend((id)objc_opt_class(), "cacheKeyFromOptions:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_rpnEspressoResourcesKeyToEspressoResourcesCache, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
    }
    else
    {
      v10 = objc_opt_class();
      +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", v10, CFSTR("VNObjectTrackerRevision2Type_RPNTrackerInitModelName"), v6, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", v10, CFSTR("VNObjectTrackerRevision2Type_RPNTrackerTrackModelName"), v6, a4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
          goto LABEL_22;
        v13 = v6;
        v26 = v11;
        v14 = v12;
        v27 = v13;
        v15 = objc_opt_self();
        +[VNValidationUtilities requiredObjectConformingToProtocol:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectConformingToProtocol:forKey:inOptions:error:", &unk_1EE66D668, CFSTR("VNTrackingOption_ComputeDevice"), v13, a4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v24 = (objc_class *)v15;
          +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNDetectorOption_PreferBackgroundProcessing"), v27, a4);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v25 = v14;
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = __110__VNRPNTrackerEspressoResources_resourcesForOptions_PRNInitEspressoModelName_RPNTrackEspressoModelName_error___block_invoke;
            aBlock[3] = &unk_1E4548068;
            v29 = v27;
            v30 = v16;
            v31 = v17;
            v18 = (void (**)(void *, id, id *))_Block_copy(aBlock);
            v18[2](v18, v26, a4);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              v23 = v19;
              v18[2](v18, v25, a4);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v20
                  ? (void *)objc_msgSend([v24 alloc], "_initWithRPNInitEspressoResources:RPNTrackEspressoResources:", v23, v20): 0;

              v19 = v23;
            }
            else
            {
              v21 = 0;
            }

            v14 = v25;
          }
          else
          {
            v21 = 0;
          }

        }
        else
        {
          v21 = 0;
        }

        if (v21)
        {
          -[NSMutableDictionary setValue:forKey:](self->_rpnEspressoResourcesKeyToEspressoResourcesCache, "setValue:forKey:", v21, v7);
          v9 = v21;
        }
        else
        {
LABEL_22:
          v9 = 0;
        }

      }
      else
      {
        v9 = 0;
      }

    }
  }
  else
  {
    v9 = 0;
  }

  -[NSLock unlock](self->_rpnEspressoResourcesKeyToEspressoResourcesCacheLock, "unlock");
  return v9;
}

- (void)releaseCachedResources
{
  NSMutableDictionary *v3;
  NSMutableDictionary *rpnEspressoResourcesKeyToEspressoResourcesCache;

  -[NSLock lock](self->_rpnEspressoResourcesKeyToEspressoResourcesCacheLock, "lock");
  -[NSMutableDictionary removeAllObjects](self->_rpnEspressoResourcesKeyToEspressoResourcesCache, "removeAllObjects");
  v3 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 6);
  rpnEspressoResourcesKeyToEspressoResourcesCache = self->_rpnEspressoResourcesKeyToEspressoResourcesCache;
  self->_rpnEspressoResourcesKeyToEspressoResourcesCache = v3;

  -[NSLock unlock](self->_rpnEspressoResourcesKeyToEspressoResourcesCacheLock, "unlock");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rpnEspressoResourcesKeyToEspressoResourcesCacheLock, 0);
  objc_storeStrong((id *)&self->_rpnEspressoResourcesKeyToEspressoResourcesCache, 0);
}

+ (id)cacheOptionsKeys
{
  if (+[VNRPNTrackerEspressoResourcesCache cacheOptionsKeys]::onceToken != -1)
    dispatch_once(&+[VNRPNTrackerEspressoResourcesCache cacheOptionsKeys]::onceToken, &__block_literal_global_28926);
  return (id)+[VNRPNTrackerEspressoResourcesCache cacheOptionsKeys]::cacheOptionsKeys;
}

+ (id)cacheKeyFromOptions:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "cacheOptionsKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v17;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v11);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (!v12)
        {
          if (a4)
            v15 = +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Option value for option key %@ is a mandatory parameter"));

          v14 = 0;
          goto LABEL_13;
        }
        objc_msgSend(v6, "appendFormat:", CFSTR(":%@=%@"), v11, v12);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
        continue;
      break;
    }
  }

  v14 = (void *)objc_msgSend(v6, "copy");
LABEL_13:

  return v14;
}

void __54__VNRPNTrackerEspressoResourcesCache_cacheOptionsKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("VNDetectorOption_PreferBackgroundProcessing");
  v2[1] = CFSTR("VNTrackingOption_ComputeDevice");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNRPNTrackerEspressoResourcesCache cacheOptionsKeys]::cacheOptionsKeys;
  +[VNRPNTrackerEspressoResourcesCache cacheOptionsKeys]::cacheOptionsKeys = v0;

}

@end
