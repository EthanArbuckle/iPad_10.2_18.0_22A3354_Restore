@implementation ATXCandidateRelevanceModelDatasetGeneratorConfigApp

+ (id)candidatePublisherFromStartTime:(double)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidatePublisherWithStartTime:endTime:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)candidatePublisherWithStartTime:(id)a3 endTime:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a4;
  v7 = a3;
  +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allInstalledAppsKnownToSpringBoard");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  BiomeLibrary();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "App");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "InFocus");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "atx_publisherWithStartTime:endTime:maxEvents:lastN:reversed:", v7, v6, 0, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __95__ATXCandidateRelevanceModelDatasetGeneratorConfigApp_candidatePublisherWithStartTime_endTime___block_invoke;
  v19[3] = &unk_1E82DF748;
  v20 = v10;
  v15 = v10;
  objc_msgSend(v14, "filterWithIsIncluded:", v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "mapWithTransform:", &__block_literal_global_131);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __95__ATXCandidateRelevanceModelDatasetGeneratorConfigApp_candidatePublisherWithStartTime_endTime___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("unknown")) & 1) == 0
    && (objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.springboard.")) & 1) == 0
    && objc_msgSend(v5, "length")
    && (objc_msgSend(v3, "eventBody"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "starting"),
        v6,
        v7))
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __95__ATXCandidateRelevanceModelDatasetGeneratorConfigApp_candidatePublisherWithStartTime_endTime___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  ATXCandidateApp *v3;
  void *v4;
  ATXCandidateApp *v5;
  id v6;
  double v7;
  double v8;
  void *v9;

  v2 = a2;
  v3 = [ATXCandidateApp alloc];
  objc_msgSend(v2, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ATXCandidate initWithBiomeStoreData:](v3, "initWithBiomeStoreData:", v4);

  v6 = objc_alloc(MEMORY[0x1E0CF94A8]);
  objc_msgSend(v2, "timestamp");
  v8 = v7;

  v9 = (void *)objc_msgSend(v6, "initWithEventBody:timestamp:", v5, v8);
  return v9;
}

@end
