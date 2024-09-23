@implementation CSFBnnsIrLookUp

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && +[CSFBnnsIrLookUp initialize]::onceToken != -1)
    dispatch_once(&+[CSFBnnsIrLookUp initialize]::onceToken, &__block_literal_global_896);
}

+ (id)getBnnsIrPathFromMilFile:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if ((objc_msgSend(v4, "hasSuffix:", CFSTR("bnns.mil")) & 1) != 0)
  {
    +[CSFBnnsIrLookUp readBnnsIrFromCacheMapWithMilFile:](CSFBnnsIrLookUp, "readBnnsIrFromCacheMapWithMilFile:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(a1, "_generateHashBnnsIrPathForMilFile:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)readBnnsIrFromCacheMapWithMilFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&milBnnsIrCacheMapLock);
    v4 = (void *)modelMilBnnsIrCacheMap;
    objc_msgSend(v3, "stringByStandardizingPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock((os_unfair_lock_t)&milBnnsIrCacheMapLock);
    v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = "+[CSFBnnsIrLookUp readBnnsIrFromCacheMapWithMilFile:]";
      v11 = 2112;
      v12 = v6;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s obtained bnnsir : %@ for milFile: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)setCacheMapWithMilFile:(id)a3 bnnsIr:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (v8 && v5)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&milBnnsIrCacheMapLock);
    v6 = (void *)modelMilBnnsIrCacheMap;
    objc_msgSend(v8, "stringByStandardizingPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v5, v7);

    os_unfair_lock_unlock((os_unfair_lock_t)&milBnnsIrCacheMapLock);
  }

}

+ (void)removeBnnsIrFromCacheMapWithMilFile:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    os_unfair_lock_lock((os_unfair_lock_t)&milBnnsIrCacheMapLock);
    objc_msgSend((id)modelMilBnnsIrCacheMap, "removeObjectForKey:", v4);
    os_unfair_lock_lock((os_unfair_lock_t)&milBnnsIrCacheMapLock);
    v3 = v4;
  }

}

+ (id)_generateHashBnnsIrPathForMilFile:(id)a3
{
  const char *v3;
  CC_LONG v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t i;
  void *v9;
  void *v10;
  unsigned __int8 md[32];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v4 = strlen(v3);
  CC_SHA256(v3, v4, md);
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getOnDeviceCompilationCacheDirectoryForBenchmark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  for (i = 0; i != 5; ++i)
    objc_msgSend(v7, "appendFormat:", CFSTR("%02x"), md[i]);
  objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathExtension:", CFSTR("bnnsir"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __29__CSFBnnsIrLookUp_initialize__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)modelMilBnnsIrCacheMap;
  modelMilBnnsIrCacheMap = (uint64_t)v0;

}

@end
