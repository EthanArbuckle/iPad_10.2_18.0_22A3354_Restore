@implementation ATXDirichletDistribution

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_1 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_1, &__block_literal_global_88);
  return (id)sharedInstance__pasExprOnceResult_15;
}

void __42__ATXDirichletDistribution_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_15;
  sharedInstance__pasExprOnceResult_15 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXDirichletDistribution)init
{
  ATXDirichletDistribution *v2;
  void *v3;
  double v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXDirichletDistribution;
  v2 = -[ATXDirichletDistribution init](&v7, sel_init);
  if (v2)
  {
    +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appPredictionGlobalScoreMultiplierPerApp");
    v2->kGlobalScoreMultiplier = v4;
    objc_msgSend(v3, "appPredictionBlendedScoreNormalizationConstant");
    v2->kBlendedScoreNormalizationConstant = v5;

  }
  return v2;
}

- (id)sampleProbabilitiesFromDirichletWithNormalizedParameters:(id)a3 andNormalizationConstant:(double)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  double v16;

  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v6, "count"));
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __110__ATXDirichletDistribution_sampleProbabilitiesFromDirichletWithNormalizedParameters_andNormalizationConstant___block_invoke;
  v14 = &unk_1E82E1A38;
  v16 = a4;
  v15 = v7;
  v8 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v11);

  +[ATXGlobalAppScoresUtil normalizeValues:](ATXGlobalAppScoresUtil, "normalizeValues:", v8, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __110__ATXDirichletDistribution_sampleProbabilitiesFromDirichletWithNormalizedParameters_andNormalizationConstant___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  id v7;

  v5 = a2;
  objc_msgSend(a3, "doubleValue");
  +[ATXDirichletDistribution getGammaDistributionShapeParameterForComputingGlobalAppScoresWithAlpha:andNormalizationConstant:](ATXDirichletDistribution, "getGammaDistributionShapeParameterForComputingGlobalAppScoresWithAlpha:andNormalizationConstant:");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmax(ATXSampleFromGammaDistribution(v6, 1.0), 0.0));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v5);

}

+ (double)getGammaDistributionShapeParameterForComputingGlobalAppScoresWithAlpha:(double)a3 andNormalizationConstant:(double)a4
{
  return fmax(a3 * a4, 2.0);
}

- (id)getBlendedLocalAndGlobalScoresWithLocalCounts:(id)a3 andGlobalScores:(id)a4 withSamplingEnabled:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  ATXDirichletDistribution *v18;
  id v19;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v8, "count"));
  if (v5)
  {
    -[ATXDirichletDistribution sampleProbabilitiesFromDirichletWithNormalizedParameters:andNormalizationConstant:](self, "sampleProbabilitiesFromDirichletWithNormalizedParameters:andNormalizationConstant:", v9, self->kBlendedScoreNormalizationConstant);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v11;
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __110__ATXDirichletDistribution_getBlendedLocalAndGlobalScoresWithLocalCounts_andGlobalScores_withSamplingEnabled___block_invoke;
  v16[3] = &unk_1E82E1A60;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v16);
  +[ATXGlobalAppScoresUtil normalizeValues:](ATXGlobalAppScoresUtil, "normalizeValues:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __110__ATXDirichletDistribution_getBlendedLocalAndGlobalScoresWithLocalCounts_andGlobalScores_withSamplingEnabled___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = &unk_1E83CC8C8;
  if (v8)
    v10 = (void *)v8;
  v11 = v10;

  objc_msgSend(v6, "doubleValue");
  v13 = v12;

  v14 = *(double *)(*(_QWORD *)(a1 + 40) + 8);
  objc_msgSend(v11, "doubleValue");
  v16 = v15;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13 + v14 * v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v17, v7);

}

@end
