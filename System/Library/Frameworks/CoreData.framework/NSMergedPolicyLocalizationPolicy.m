@implementation NSMergedPolicyLocalizationPolicy

- (NSMergedPolicyLocalizationPolicy)init
{
  NSMergedPolicyLocalizationPolicy *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSMergedPolicyLocalizationPolicy;
  result = -[NSMergedPolicyLocalizationPolicy init](&v3, sel_init);
  if (result)
    result->_mergedPolicies = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSMergedPolicyLocalizationPolicy;
  -[NSValidationErrorLocalizationPolicy dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSMergedPolicyLocalizationPolicy;
  v4 = -[NSValidationErrorLocalizationPolicy copyWithZone:](&v6, sel_copyWithZone_, a3);
  if (v4)
    v4[6] = -[NSSet copy](self->_mergedPolicies, "copy");
  return v4;
}

- (void)addPolicy:(id)a3
{
  NSSet *mergedPolicies;

  mergedPolicies = self->_mergedPolicies;
  if (!mergedPolicies)
  {
    mergedPolicies = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 4);
    self->_mergedPolicies = mergedPolicies;
  }
  -[NSSet addObject:](mergedPolicies, "addObject:", a3);
}

- (void)_ensureFullLocalizationDictionaryIsLoaded
{
  NSSet *mergedPolicies;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->super._hasSetLocalizationDictionary)
  {
    self->super._localizationDictionary = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSSet count](self->_mergedPolicies, "count"));
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    mergedPolicies = self->_mergedPolicies;
    v4 = -[NSSet countByEnumeratingWithState:objects:count:](mergedPolicies, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(mergedPolicies);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          objc_msgSend(v8, "_ensureFullLocalizationDictionaryIsLoaded");
          -[NSDictionary addEntriesFromDictionary:](self->super._localizationDictionary, "addEntriesFromDictionary:", objc_msgSend(v8, "localizationDictionary"));
        }
        v5 = -[NSSet countByEnumeratingWithState:objects:count:](mergedPolicies, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }
    self->super._hasSetLocalizationDictionary = 1;
  }
}

@end
