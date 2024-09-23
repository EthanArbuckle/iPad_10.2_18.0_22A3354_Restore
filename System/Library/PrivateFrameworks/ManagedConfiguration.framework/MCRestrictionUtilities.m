@implementation MCRestrictionUtilities

+ (id)intersectionFeaturesWithPayloadRestictionKeyAlias
{
  void *v2;
  void *v3;

  _intersectionFeaturesToAlias();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)intersectionPayloadRestrictionKeysForFeature:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _intersectionFeaturesToAlias();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

+ (id)intersectionFeatureForPayloadRestrictionKey:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = _intersectionAliasToFeatures_onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_intersectionAliasToFeatures_onceToken, &__block_literal_global_8);
  objc_msgSend((id)_intersectionAliasToFeatures_dict, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = v4;
  v7 = v5;

  return v7;
}

@end
