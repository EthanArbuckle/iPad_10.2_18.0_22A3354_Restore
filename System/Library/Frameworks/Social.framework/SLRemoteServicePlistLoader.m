@implementation SLRemoteServicePlistLoader

+ (id)allServices
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_class();
  SLSocialFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadRemoteServicesFromPlistResourceName:inBundle:", CFSTR("SystemRemoteServices-iOS"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)loadRemoteServicesFromPlistResourceName:(id)a3 inBundle:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  SLRemoteService *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "pathForResource:ofType:", a3, CFSTR("plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfFile:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v17 = (id)objc_opt_new();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = -[SLRemoteService initWithServiceBundle:socialInfoDictionary:]([SLRemoteService alloc], "initWithServiceBundle:socialInfoDictionary:", v6, v14);
            if (v15)
              objc_msgSend(v17, "addObject:", v15);

          }
          else
          {
            _SLLog(v4, 3, CFSTR("Incorrect type for service info dict, service entries must be dictionaries"));
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

  }
  else
  {
    _SLLog(v4, 3, CFSTR("Unable to load remote service info dicts from %@"));
    v17 = 0;
  }

  return v17;
}

@end
