@implementation CDRecentInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidVolumes, 0);
  objc_storeStrong((id *)&self->_pushingServices, 0);
  objc_storeStrong((id *)&self->_volumes, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)servicesForVolume:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CDRecentInfo volumes](self, "volumes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "volumeServices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)hasSnapshotForVolume:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CDRecentInfo volumes](self, "volumes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "hasSnapshot");
  return (char)v5;
}

- (id)_recentInfoForVolume:(id)a3 atUrgency:(int)a4 validateResults:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if ((objc_msgSend(v8, "validate") & 1) != 0)
  {
    -[CDRecentInfo volumes](self, "volumes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mountPoint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "_recentInfoAtUrgency:validateResults:", v6, v5);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v13 = v12;
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(v8, "mountPoint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    CDGetLogHandle((uint64_t)"client");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "mountPoint");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v17;
      _os_log_error_impl(&dword_1A3662000, v14, OS_LOG_TYPE_ERROR, "Unable to validate volume: %@. Discarding its purgeable cache", (uint8_t *)&v18, 0xCu);

    }
    -[CDRecentInfo volumes](self, "volumes");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mountPoint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v15);

    v13 = 0;
    goto LABEL_7;
  }
LABEL_8:

  return v13;
}

- (BOOL)updateServiceInfoAmount:(id)a3 forService:(id)a4 onVolume:(id)a5 atUrgency:(int)a6 withTimestamp:(double)a7 nonPurgeableAmount:(id)a8 deductFromCurrentAmount:(BOOL)a9 info:(id)a10
{
  _BOOL8 v10;
  uint64_t v13;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v27;
  void *v28;
  void *v29;
  _DWORD v30[2];
  uint64_t v31;

  v10 = a9;
  v13 = *(_QWORD *)&a6;
  v31 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a8;
  v21 = a10;
  -[CDRecentInfo volumes](self, "volumes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDRecentInfo volumes](self, "volumes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    if (v23)
      goto LABEL_3;
LABEL_7:
    -[CDRecentInfo _createNewRecentVolumeInfoWithName:](self, "_createNewRecentVolumeInfoWithName:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDRecentInfo volumes](self, "volumes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v23, v19);

    goto LABEL_3;
  }
  CDGetLogHandle((uint64_t)"client");
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    v30[0] = 67109120;
    v30[1] = 238;
    _os_log_error_impl(&dword_1A3662000, v27, OS_LOG_TYPE_ERROR, "%d Deleted cache's volume dictionary is nulled. Initializing a new, empty one.", (uint8_t *)v30, 8u);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDRecentInfo setVolumes:](self, "setVolumes:", v28);

  if (!v23)
    goto LABEL_7;
LABEL_3:
  v25 = objc_msgSend(v23, "updateServiceInfoAmount:forService:atUrgency:withTimestamp:nonPurgeableAmount:deductFromCurrentAmount:info:", v17, v18, v13, v20, v10, v21, a7);

  return v25;
}

- (NSMutableDictionary)volumes
{
  return self->_volumes;
}

- (id)copyInvalidsForVolume:(id)a3 atUrgency:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[CDRecentInfo volumes](self, "volumes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDRecentInfo pushingServices](self, "pushingServices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "copyInvalidsAtUrgency:currentlyPushing:", v4, v9);

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CDRecentInfo version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CACHE_DELETE_CACHED_RESULTS_VERSION"));

  -[CDRecentInfo volumes](self, "volumes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("CACHE_DELETE_RECENT_PURGEABLE_STATS"));

  -[CDRecentInfo pushingServices](self, "pushingServices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("CACHE_DELETE_CACHED_PUSHING_SERVICES"));

  -[CDRecentInfo invalidVolumes](self, "invalidVolumes");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("CACHE_DELETE_CACHED_INVALID_VOLUMES"));

}

- (id)copyPushingServices
{
  void *v2;
  void *v3;

  -[CDRecentInfo pushingServices](self, "pushingServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (NSMutableSet)pushingServices
{
  return self->_pushingServices;
}

- (NSNumber)version
{
  return self->_version;
}

- (CDRecentInfo)initWithRecentInfo:(id)a3
{
  id v4;
  CDRecentInfo *v5;
  uint64_t v6;
  NSMutableDictionary *volumes;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSNumber *version;
  uint64_t v20;
  NSMutableSet *pushingServices;
  void *v22;
  uint64_t v23;
  NSMutableSet *invalidVolumes;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CDRecentInfo;
  v5 = -[CDRecentInfo init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    volumes = v5->_volumes;
    v5->_volumes = (NSMutableDictionary *)v6;

    objc_msgSend(v4, "volumes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      objc_msgSend(v4, "volumes", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v27;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v27 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v13);
            -[CDRecentInfo _createNewRecentVolumeInfo](v5, "_createNewRecentVolumeInfo");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "volumes");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (void *)objc_msgSend(v15, "initWithVolumeInfo:", v17);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_volumes, "setObject:forKeyedSubscript:", v18, v14);

            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        }
        while (v11);
      }

    }
    version = v5->_version;
    v5->_version = (NSNumber *)&unk_1E4A38D58;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v20 = objc_claimAutoreleasedReturnValue();
    pushingServices = v5->_pushingServices;
    v5->_pushingServices = (NSMutableSet *)v20;

    objc_msgSend(v4, "invalidVolumes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "mutableCopy");
    invalidVolumes = v5->_invalidVolumes;
    v5->_invalidVolumes = (NSMutableSet *)v23;

  }
  return v5;
}

- (id)_createNewRecentVolumeInfo
{
  return [CDRecentVolumeInfo alloc];
}

- (BOOL)isInvalidForVolume:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  +[CacheDeleteVolume volumeWithMountpoint:](CacheDeleteVolume, "volumeWithMountpoint:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "validate"))
  {
    -[CDRecentInfo invalidVolumes](self, "invalidVolumes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mountPoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (NSMutableSet)invalidVolumes
{
  return self->_invalidVolumes;
}

- (BOOL)isStaleForVolume:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CDRecentInfo volumes](self, "volumes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "isStale");
  return (char)v5;
}

- (id)thresholdsForVolume:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CDRecentInfo volumes](self, "volumes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "thresholds");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CDRecentInfo)initWithCoder:(id)a3
{
  id v4;
  CDRecentInfo *v5;
  void *v6;
  NSNumber *v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *volumes;
  void *v15;
  void *v16;
  uint64_t v17;
  NSMutableSet *pushingServices;
  void *v19;
  void *v20;
  uint64_t v21;
  NSMutableSet *invalidVolumes;
  NSMutableDictionary *v23;
  NSMutableDictionary *v24;
  NSMutableDictionary *v25;
  NSMutableSet *v26;
  NSMutableSet *v27;
  NSMutableSet *v28;
  NSMutableSet *v29;
  NSMutableSet *v30;
  NSMutableSet *v31;
  NSNumber *version;
  objc_super v34;
  uint8_t buf[4];
  NSNumber *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CDRecentInfo;
  v5 = -[CDRecentInfo init](&v34, sel_init);
  if (v5)
  {
    objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CACHE_DELETE_CACHED_RESULTS_VERSION"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    evaluateNumberProperty(v6);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();

    v8 = -[NSNumber isEqualToNumber:](v7, "isEqualToNumber:", &unk_1E4A38D58);
    CDGetLogHandle((uint64_t)"client");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3662000, v10, OS_LOG_TYPE_DEFAULT, "got a compatible version", buf, 2u);
      }

      objc_msgSend((id)objc_opt_class(), "fetchAllowedClassesSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("CACHE_DELETE_RECENT_PURGEABLE_STATS"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "mutableCopy");
      volumes = v5->_volumes;
      v5->_volumes = (NSMutableDictionary *)v13;

      objc_msgSend((id)objc_opt_class(), "fetchAllowedClassesSet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("CACHE_DELETE_CACHED_PUSHING_SERVICES"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "mutableCopy");
      pushingServices = v5->_pushingServices;
      v5->_pushingServices = (NSMutableSet *)v17;

      objc_msgSend((id)objc_opt_class(), "fetchAllowedClassesSet");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("CACHE_DELETE_CACHED_INVALID_VOLUMES"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "mutableCopy");
      invalidVolumes = v5->_invalidVolumes;
      v5->_invalidVolumes = (NSMutableSet *)v21;

    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v7;
        _os_log_error_impl(&dword_1A3662000, v10, OS_LOG_TYPE_ERROR, "incompatible version: %@", buf, 0xCu);
      }

    }
    v23 = v5->_volumes;
    if (v23)
    {
      v24 = v23;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v24 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    }
    v25 = v5->_volumes;
    v5->_volumes = v24;

    v26 = v5->_pushingServices;
    if (v26)
    {
      v27 = v26;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v27 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    }
    v28 = v5->_pushingServices;
    v5->_pushingServices = v27;

    v29 = v5->_invalidVolumes;
    if (v29)
    {
      v30 = v29;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v30 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    }
    v31 = v5->_invalidVolumes;
    v5->_invalidVolumes = v30;

    version = v5->_version;
    v5->_version = v7;

  }
  return v5;
}

+ (id)fetchAllowedClassesSet
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

+ (id)recentInfoForVolumes:(id)a3
{
  id v3;
  CDRecentInfo *v4;

  v3 = a3;
  v4 = -[CDRecentInfo initWithVolumes:]([CDRecentInfo alloc], "initWithVolumes:", v3);

  return v4;
}

- (CDRecentInfo)initWithVolumes:(id)a3
{
  id v4;
  CDRecentInfo *v5;
  uint64_t v6;
  NSMutableDictionary *volumes;
  NSNumber *version;
  uint64_t v9;
  NSMutableSet *pushingServices;
  uint64_t v11;
  NSMutableSet *invalidVolumes;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CDRecentInfo;
  v5 = -[CDRecentInfo init](&v14, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = objc_msgSend(v4, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    volumes = v5->_volumes;
    v5->_volumes = (NSMutableDictionary *)v6;

    version = v5->_version;
    v5->_version = (NSNumber *)&unk_1E4A38D58;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    pushingServices = v5->_pushingServices;
    v5->_pushingServices = (NSMutableSet *)v9;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    invalidVolumes = v5->_invalidVolumes;
    v5->_invalidVolumes = (NSMutableSet *)v11;

  }
  return v5;
}

- (id)_createNewRecentVolumeInfoWithName:(id)a3
{
  return +[CDRecentVolumeInfo CDRecentVolumeInfo:](CDRecentVolumeInfo, "CDRecentVolumeInfo:", a3);
}

- (BOOL)validateForVolume:(id)a3 andService:(id)a4 atUrgency:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  v9 = a3;
  -[CDRecentInfo volumes](self, "volumes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v11, "validateServiceInfo:atUrgency:", v8, v5);
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CDRecentInfo *v5;
  void *v6;
  void *v7;
  CDRecentInfo *v8;

  v5 = [CDRecentInfo alloc];
  -[CDRecentInfo volumes](self, "volumes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  v8 = -[CDRecentInfo initWithVolumes:](v5, "initWithVolumes:", v7);

  return v8;
}

- (id)recentInfoForVolume:(id)a3 atUrgency:(int)a4
{
  return -[CDRecentInfo _recentInfoForVolume:atUrgency:validateResults:](self, "_recentInfoForVolume:atUrgency:validateResults:", a3, *(_QWORD *)&a4, 1);
}

- (int64_t)recentStateForVolume:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  if (v4
    && (-[CDRecentInfo volumes](self, "volumes"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "objectForKeyedSubscript:", v4),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    v7 = objc_msgSend(v6, "volumeState");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)updateRecentState:(int64_t)a3 forVolume:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v12;
  void *v13;
  void *v14;
  _DWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[CDRecentInfo volumes](self, "volumes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDRecentInfo volumes](self, "volumes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (v8)
      goto LABEL_3;
    goto LABEL_9;
  }
  CDGetLogHandle((uint64_t)"client");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v15[0] = 67109120;
    v15[1] = 197;
    _os_log_error_impl(&dword_1A3662000, v12, OS_LOG_TYPE_ERROR, "%d Deleted cache's volume dictionary is nulled. Initializing a new, empty one.", (uint8_t *)v15, 8u);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDRecentInfo setVolumes:](self, "setVolumes:", v13);

  if (!v8)
  {
LABEL_9:
    -[CDRecentInfo _createNewRecentVolumeInfoWithName:](self, "_createNewRecentVolumeInfoWithName:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDRecentInfo volumes](self, "volumes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v8, v6);

  }
LABEL_3:
  v10 = objc_msgSend(v8, "volumeState");
  if (v10 != a3)
    objc_msgSend(v8, "setVolumeState:", a3);

  return v10 != a3;
}

- (void)removeServiceInfo:(id)a3 forVolume:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[CDRecentInfo volumes](self, "volumes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "removeServiceInfo:", v7);
}

- (void)removeServiceInfo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CDRecentInfo volumes](self, "volumes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[CDRecentInfo removeServiceInfo:forVolume:](self, "removeServiceInfo:forVolume:", v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)bsdDiskForVolume:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CDRecentInfo volumes](self, "volumes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "bsdDisk");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isStale
{
  BOOL v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[CDRecentInfo isEmpty](self, "isEmpty"))
    return 1;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CDRecentInfo volumes](self, "volumes", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[CDRecentInfo volumes](self, "volumes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isStale");

        if ((v12 & 1) != 0)
        {
          v3 = 1;
          goto LABEL_13;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v3 = 0;
LABEL_13:

  return v3;
}

- (BOOL)isEmpty
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  -[CDRecentInfo volumes](self, "volumes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __23__CDRecentInfo_isEmpty__block_invoke;
  v4[3] = &unk_1E4A32F70;
  v4[4] = &v5;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __23__CDRecentInfo_isEmpty__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "isEmpty");
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (BOOL)hasInvalids
{
  CDRecentInfo *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[CDRecentInfo volumes](self, "volumes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__CDRecentInfo_hasInvalids__block_invoke;
  v5[3] = &unk_1E4A32F98;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __27__CDRecentInfo_hasInvalids__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = 1;
  while (1)
  {
    objc_msgSend(*(id *)(a1 + 32), "pushingServices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v9, "copyInvalidsAtUrgency:currentlyPushing:", v6, v7);

    if (objc_msgSend(v8, "count"))
      break;

    v6 = (v6 + 1);
    if ((_DWORD)v6 == 4)
      goto LABEL_6;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  *a4 = 1;

LABEL_6:
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[CDRecentInfo volumes](self, "volumes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Volume: %@"), v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        v10 = (void *)MEMORY[0x1E0CB3940];
        -[CDRecentInfo volumes](self, "volumes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v13);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)log
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CDRecentInfo volumes](self, "volumes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v15;
    *(_QWORD *)&v5 = 138412290;
    v13 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        -[CDRecentInfo volumes](self, "volumes", v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        CDGetLogHandle((uint64_t)"client");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v13;
          v19 = v9;
          _os_log_impl(&dword_1A3662000, v12, OS_LOG_TYPE_DEFAULT, " Volume: %@", buf, 0xCu);
        }

        objc_msgSend(v11, "log");
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);
  }

}

- (void)invalidateForVolume:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CDRecentInfo volumes](self, "volumes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (void)setVolumes:(id)a3
{
  objc_storeStrong((id *)&self->_volumes, a3);
}

- (void)setPushingServices:(id)a3
{
  objc_storeStrong((id *)&self->_pushingServices, a3);
}

- (void)setInvalidVolumes:(id)a3
{
  objc_storeStrong((id *)&self->_invalidVolumes, a3);
}

@end
