@implementation ATXHeroAndClipDefaultSampler

- (BOOL)_isEventEligibleForSampling:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  v3 = a3;
  objc_msgSend(v3, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLocationNearKnownTypeLocationOfInterest:", v4) ^ 1;

  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isClip") & 1) == 0)
  {
    objc_msgSend(v3, "bundleId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "launchAndLocationHarvesterAppBlacklist");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[ATXLaunchAndLocationFilterer appBundleIdIsBlacklisted:blacklist:](ATXLaunchAndLocationFilterer, "appBundleIdIsBlacklisted:blacklist:", v8, v9);

    objc_msgSend(v3, "bundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "launchAndLocationHarvesterGenreIdBlacklist");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6 &= (v10 | +[ATXLaunchAndLocationFilterer genreIdIsBlacklistedGivenAppBundleId:blacklist:](ATXLaunchAndLocationFilterer, "genreIdIsBlacklistedGivenAppBundleId:blacklist:", v11, v12)) ^ 1;

  }
  objc_msgSend(v4, "timestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v6 & !+[ATXLaunchAndLocationFilterer locationIsStaleOrNotAccurateEnough:now:](ATXLaunchAndLocationFilterer, "locationIsStaleOrNotAccurateEnough:now:", v4, v13);

  return v14;
}

- (id)sampleEvents:(id)a3 numToSample:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v19[5];

  v6 = a3;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __57__ATXHeroAndClipDefaultSampler_sampleEvents_numToSample___block_invoke;
  v19[3] = &unk_1E82DC870;
  v19[4] = self;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  if (v9 < a4)
    a4 = v9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v11 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:atIndexedSubscript:", v12, v11);

      ++v11;
    }
    while (v11 < objc_msgSend(v8, "count"));
  }
  objc_msgSend(MEMORY[0x1E0CF94E0], "sampleWeightedArray:numToSample:", v10, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v15 = 0;
    do
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v16, "unsignedIntegerValue"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:atIndexedSubscript:", v17, v15);

      ++v15;
    }
    while (a4 != v15);
  }

  return v14;
}

uint64_t __57__ATXHeroAndClipDefaultSampler_sampleEvents_numToSample___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isEventEligibleForSampling:", a2);
}

@end
