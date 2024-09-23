@implementation ATXActionLOIBoost

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7 != -1)
    dispatch_once(&sharedInstance_onceToken_7, &__block_literal_global_161);
  return (id)sharedInstance_instance_2;
}

void __35__ATXActionLOIBoost_sharedInstance__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  ATXBoostObject *v9;
  void *v10;
  ATXBoostObject *v11;
  ATXActionLOIBoost *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8CF8]), "initWithAssetsForResource:ofType:", CFSTR("ATXActionLOIBoost"), CFSTR("plist"));
  objc_msgSend(v0, "abGroupContents");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v1, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
        v9 = [ATXBoostObject alloc];
        objc_msgSend(v3, "objectForKeyedSubscript:", v8, (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[ATXBoostObject initWithDictionary:](v9, "initWithDictionary:", v10);
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  v12 = -[ATXActionLOIBoost initWithBoostDictionary:]([ATXActionLOIBoost alloc], "initWithBoostDictionary:", v2);
  v13 = (void *)sharedInstance_instance_2;
  sharedInstance_instance_2 = (uint64_t)v12;

}

+ (double)decayRateWithScale:(double)a3 distance:(double)a4
{
  double result;
  double v6;

  result = 0.0;
  if (a3 > 0.0 && a4 >= 0.0)
  {
    v6 = a4 / (a3 + a3);
    if (v6 >= 0.5)
    {
      if (v6 < 1.0)
        return (1.0 - v6) * (1.0 - v6 + 1.0 - v6);
    }
    else
    {
      return 0.5 - v6 * v6 + 0.5 - v6 * v6;
    }
  }
  return result;
}

- (ATXActionLOIBoost)initWithBoostDictionary:(id)a3
{
  id v5;
  ATXActionLOIBoost *v6;
  ATXActionLOIBoost *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXActionLOIBoost;
  v6 = -[ATXActionLOIBoost init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_boostDictionary, a3);

  return v7;
}

- (double)boostForActionKey:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  -[NSDictionary objectForKeyedSubscript:](self->_boostDictionary, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "distanceFromHomeOfCurrentLocationInMeters");
    objc_msgSend(v4, "distanceFromWorkOfCurrentLocationInMeters");
    objc_msgSend(v4, "distanceFromGymOfCurrentLocationInMeters");
    objc_msgSend(v4, "distanceFromSchoolOfCurrentLocationInMeters");
    objc_msgSend(v3, "homeBoost");
    v6 = v5;
    objc_msgSend(v3, "homeScale");
    +[ATXActionLOIBoost decayRateWithScale:distance:](ATXActionLOIBoost, "decayRateWithScale:distance:");
    v8 = v6 * v7;
    objc_msgSend(v3, "workBoost");
    v10 = v9;
    objc_msgSend(v3, "workScale");
    +[ATXActionLOIBoost decayRateWithScale:distance:](ATXActionLOIBoost, "decayRateWithScale:distance:");
    v12 = v10 * v11;
    objc_msgSend(v3, "gymBoost");
    v14 = v13;
    objc_msgSend(v3, "gymScale");
    +[ATXActionLOIBoost decayRateWithScale:distance:](ATXActionLOIBoost, "decayRateWithScale:distance:");
    v16 = v14 * v15;
    objc_msgSend(v3, "schoolBoost");
    v18 = v17;
    objc_msgSend(v3, "schoolScale");
    +[ATXActionLOIBoost decayRateWithScale:distance:](ATXActionLOIBoost, "decayRateWithScale:distance:");
    v20 = v8 + v12 + v16 + v18 * v19;

  }
  else
  {
    v20 = 0.0;
  }

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boostDictionary, 0);
}

@end
