@implementation CPLFeature

- (BOOL)disableFeatureInStore:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLFeature.m");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v8, 40, CFSTR("%@ should be implemented by subclasses"), v9);

  abort();
}

- (BOOL)enableFeatureInStore:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLFeature.m");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v8, 45, CFSTR("%@ should be implemented by subclasses"), v9);

  abort();
}

- (BOOL)shouldDisableScopeWhenFeatureIsDisabled:(id)a3
{
  return 0;
}

- (BOOL)handleScopeWhenFeatureIsDisabled:(id)a3 scopeType:(int64_t)a4 store:(id)a5 error:(id *)a6
{
  return 1;
}

+ (id)featureWithName:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = featureWithName__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&featureWithName__onceToken, &__block_literal_global_16031);
  objc_msgSend((id)featureWithName__features, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __30__CPLFeature_featureWithName___block_invoke()
{
  CPLMomentShareFeature *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("MomentShare");
  v0 = objc_alloc_init(CPLMomentShareFeature);
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)featureWithName__features;
  featureWithName__features = v1;

}

@end
