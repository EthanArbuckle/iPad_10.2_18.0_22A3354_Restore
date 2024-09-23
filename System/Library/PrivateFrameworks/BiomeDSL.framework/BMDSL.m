@implementation BMDSL

- (id)filterWithKeyPath:(id)a3 value:(id)a4
{
  return -[BMDSL filterWithKeyPath:comparison:value:](self, "filterWithKeyPath:comparison:value:", a3, 0, a4);
}

- (id)filterWithKeyPath:(id)a3 comparison:(int64_t)a4 value:(id)a5
{
  return -[BMDSL filterWithKeyPath:comparison:negation:value:](self, "filterWithKeyPath:comparison:negation:value:", a3, a4, 0, a5);
}

- (id)filterWithKeyPath:(id)a3 comparison:(int64_t)a4 negation:(BOOL)a5 value:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  BMDSLFilter *v12;
  uint64_t v14;

  v6 = a5;
  v10 = a6;
  v11 = a3;
  LODWORD(v14) = 1;
  v12 = -[BMDSLFilter initWithUpstream:keyPath:comparison:negation:value:name:version:]([BMDSLFilter alloc], "initWithUpstream:keyPath:comparison:negation:value:name:version:", self, v11, a4, v6, v10, CFSTR("filter"), v14);

  return v12;
}

- (id)collect
{
  return -[BMDSLCollect initWithUpstream:]([BMDSLCollect alloc], "initWithUpstream:", self);
}

- (id)subscribeOn:(id)a3
{
  id v4;
  BMDSLSubscribeOn *v5;

  v4 = a3;
  v5 = -[BMDSLSubscribeOn initWithUpstream:scheduler:]([BMDSLSubscribeOn alloc], "initWithUpstream:scheduler:", self, v4);

  return v5;
}

- (id)windowByKeyedPath:(id)a3 assigner:(id)a4
{
  id v6;
  id v7;
  BMDSLWindower *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[BMDSLWindower initWithUpstream:keyedPath:assigner:]([BMDSLWindower alloc], "initWithUpstream:keyedPath:assigner:", self, v7, v6);

  return v8;
}

- (id)mapWithTransform:(id)a3
{
  id v4;
  BMDSLMap *v5;

  v4 = a3;
  v5 = -[BMDSLMap initWithUpstream:transform:]([BMDSLMap alloc], "initWithUpstream:transform:", self, v4);

  return v5;
}

- (id)mapWithTransform:(id)a3 keyPaths:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  BMDSLMap *v9;
  void *v10;

  v6 = a3;
  +[BMDSLKeyPathSelector withKeyPaths:](BMDSLKeyPathSelector, "withKeyPaths:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMDSLArgumentTransform withSelector:](BMDSLArgumentTransform, "withSelector:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[BMDSLMap initWithUpstream:transform:]([BMDSLMap alloc], "initWithUpstream:transform:", self, v8);
  -[BMDSL mapWithTransform:](v9, "mapWithTransform:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)mapWithSelector:(SEL)a3
{
  void *v4;
  BMDSLMap *v5;

  +[BMDSLInstanceTransform withSelector:](BMDSLInstanceTransform, "withSelector:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BMDSLMap initWithUpstream:transform:]([BMDSLMap alloc], "initWithUpstream:transform:", self, v4);

  return v5;
}

- (id)insertState:(id)a3 as:(id)a4
{
  id v6;
  id v7;
  BMDSLState *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[BMDSLState initWithUpstream:key:value:]([BMDSLState alloc], "initWithUpstream:key:value:", self, v6, v7);

  return v8;
}

- (id)as:(id)a3
{
  id v4;
  BMDSLState *v5;

  v4 = a3;
  v5 = -[BMDSLState initWithUpstream:key:value:]([BMDSLState alloc], "initWithUpstream:key:value:", self, v4, 0);

  return v5;
}

- (id)orderedMergeWithOther:(id)a3 key:(id)a4 selector:(SEL)a5
{
  id v8;
  id v9;
  BMDSLOrderedMerge *v10;

  v8 = a4;
  v9 = a3;
  v10 = -[BMDSLOrderedMerge initWithA:b:key:selector:]([BMDSLOrderedMerge alloc], "initWithA:b:key:selector:", self, v9, v8, a5);

  return v10;
}

- (NSArray)upstreams
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)allowEvaluation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[BMDSL upstreams](self, "upstreams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "allowEvaluation");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)BMDSL;
  -[BMDSLBaseCodable allowEvaluation](&v8, sel_allowEvaluation);
}

- (id)combinedState
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[BMDSL upstreams](self, "upstreams", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "combinedState");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v5)
        {
          objc_msgSend(v5, "reduceWithNext:", v8);
          v10 = objc_claimAutoreleasedReturnValue();

          v5 = (id)v10;
        }
        else
        {
          v5 = v8;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)mergeWithOther:(id)a3
{
  id v4;
  BMDSLMerge *v5;

  v4 = a3;
  v5 = -[BMDSLMerge initWithA:b:]([BMDSLMerge alloc], "initWithA:b:", self, v4);

  return v5;
}

- (id)subscribeOn:(id)a3 with:(id)a4
{
  NSObject *v4;

  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[BMDSL(BMDSLSubscribeWith) subscribeOn:with:].cold.1(v4);

  return 0;
}

- (id)bpsPublisher
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Override method %@ in subclass %@"), v4, objc_opt_class());

  return 0;
}

@end
