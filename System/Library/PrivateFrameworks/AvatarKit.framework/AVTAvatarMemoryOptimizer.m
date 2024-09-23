@implementation AVTAvatarMemoryOptimizer

+ (void)optimizeMemoji:(uint64_t)a1
{
  AVTAvatarMemoryOptimizer *v2;
  id v3;

  v3 = a2;
  objc_opt_self();
  if (objc_msgSend(v3, "usageIntent") == 2)
  {
    v2 = -[AVTAvatarMemoryOptimizer initWithMemoji:]([AVTAvatarMemoryOptimizer alloc], "initWithMemoji:", v3);
    -[AVTAvatarMemoryOptimizer preprocessMemoji](v2, "preprocessMemoji");
    -[AVTAvatarMemoryOptimizer optimizeMemoji](v2, "optimizeMemoji");

  }
}

- (AVTAvatarMemoryOptimizer)initWithMemoji:(id)a3
{
  id v5;
  AVTAvatarMemoryOptimizer *v6;
  AVTAvatarMemoryOptimizer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTAvatarMemoryOptimizer;
  v6 = -[AVTAvatarMemoryOptimizer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_memoji, a3);

  return v7;
}

- (BOOL)shouldKeepCreasesAndCorners
{
  return -[AVTMemoji usageIntent](self->_memoji, "usageIntent") != 2;
}

- (BOOL)shouldClearCPUDataAfterUpload
{
  return -[AVTMemoji usageIntent](self->_memoji, "usageIntent") == 2;
}

- (void)registerRequiredVariant:(id)a3 weight:(float)a4 inHierarchy:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  AVTAvatarMemoryOptimizer *v14;
  float v15;

  v8 = a3;
  v9 = a5;
  if (!v9)
    -[AVTAvatarMemoryOptimizer registerRequiredVariant:weight:inHierarchy:].cold.1();
  v12[1] = 3221225472;
  v12[2] = __71__AVTAvatarMemoryOptimizer_registerRequiredVariant_weight_inHierarchy___block_invoke;
  v12[3] = &unk_1EA61D730;
  v15 = a4;
  v13 = v8;
  v14 = self;
  v11 = v9;
  v12[0] = MEMORY[0x1E0C809B0];
  v10 = v8;
  objc_msgSend(v11, "enumerateHierarchyUsingBlock:", v12);

}

void __71__AVTAvatarMemoryOptimizer_registerRequiredVariant_weight_inHierarchy___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  objc_msgSend(a2, "morpher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    v4 = objc_msgSend(v3, "_weightIndexForTargetNamed:", *(_QWORD *)(a1 + 32));
    v3 = v6;
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "setWeight:forTargetAtIndex:", *(float *)(a1 + 48));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKey:", v6);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setObject:forKey:", v5, v6);
      }
      objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 32));

      v3 = v6;
    }
  }

}

- (void)preprocessMemoji
{
  NSMapTable *v3;
  NSMapTable *requiredVariantsPerMorpher;
  NSMutableArray *v5;
  NSMutableArray *requiredMorphVariantComponents;
  NSMutableSet *v7;
  NSMutableSet *presetVariantPrefixes;
  unint64_t i;
  void *v10;
  void *v11;
  int v12;
  int v13;
  id v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t k;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  _QWORD v39[5];
  _QWORD v40[5];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 2, 0, 0);
  requiredVariantsPerMorpher = self->_requiredVariantsPerMorpher;
  self->_requiredVariantsPerMorpher = v3;

  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  requiredMorphVariantComponents = self->_requiredMorphVariantComponents;
  self->_requiredMorphVariantComponents = v5;

  v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  presetVariantPrefixes = self->_presetVariantPrefixes;
  self->_presetVariantPrefixes = v7;

  -[AVTMemoji allBuiltinAssetNodes](self->_memoji, "allBuiltinAssetNodes");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 42; ++i)
  {
    if (i)
    {
      AVTComponentTypeToString(i);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("variant_"), "stringByAppendingString:");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](self->_presetVariantPrefixes, "addObject:");
      v37 = i;
      -[AVTMemoji componentForType:](self->_memoji, "componentForType:", i);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "morphVariant");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10 && (objc_msgSend(v10, "isEqualToString:", CFSTR("variant_none")) & 1) == 0)
      {
        objc_msgSend(v38, "morphVariantIntensity");
        v13 = v12;
        -[NSMutableArray addObject:](self->_requiredMorphVariantComponents, "addObject:", v38);
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v14 = v34;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
        if (v15)
        {
          v17 = v15;
          v18 = *(_QWORD *)v46;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v46 != v18)
                objc_enumerationMutation(v14);
              LODWORD(v16) = v13;
              -[AVTAvatarMemoryOptimizer registerRequiredVariant:weight:inHierarchy:](self, "registerRequiredVariant:weight:inHierarchy:", v11, *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j), v16);
            }
            v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
          }
          while (v17);
        }

        for (k = 0; k != 42; ++k)
        {
          if (k)
          {
            -[AVTMemoji componentForType:](self->_memoji, "componentForType:", k);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = 0u;
            v42 = 0u;
            v43 = 0u;
            v44 = 0u;
            objc_msgSend(v21, "assets");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v42;
              do
              {
                for (m = 0; m != v24; ++m)
                {
                  if (*(_QWORD *)v42 != v25)
                    objc_enumerationMutation(v22);
                  v27 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * m);
                  if (objc_msgSend(v27, "is3DAsset"))
                  {
                    -[AVTMemoji assetResourceCache](self->_memoji, "assetResourceCache");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v28, "resourceForAsset:", v27);
                    v29 = (void *)objc_claimAutoreleasedReturnValue();

                    LODWORD(v30) = v13;
                    -[AVTAvatarMemoryOptimizer registerRequiredVariant:weight:inHierarchy:](self, "registerRequiredVariant:weight:inHierarchy:", v11, v29, v30);

                  }
                }
                v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
              }
              while (v24);
            }

          }
        }
      }

      i = v37;
    }
  }
  v31 = 0;
  v32 = MEMORY[0x1E0C809B0];
  do
  {
    -[AVTMemoji resolvedPresetForCategory:](self->_memoji, "resolvedPresetForCategory:", v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v32;
    v40[1] = 3221225472;
    v40[2] = __44__AVTAvatarMemoryOptimizer_preprocessMemoji__block_invoke;
    v40[3] = &unk_1EA61D758;
    v40[4] = self;
    objc_msgSend(v33, "enumerateVariantDependenciesOfKind:block:", 0, v40);
    v39[0] = v32;
    v39[1] = 3221225472;
    v39[2] = __44__AVTAvatarMemoryOptimizer_preprocessMemoji__block_invoke_2;
    v39[3] = &unk_1EA61D780;
    v39[4] = self;
    objc_msgSend(v33, "enumerateAssetSpecificVariantDependenciesOfKind:block:", 0, v39);

    ++v31;
  }
  while (v31 != 40);

}

void __44__AVTAvatarMemoryOptimizer_preprocessMemoji__block_invoke(uint64_t a1, unint64_t a2, void *a3, float a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = AVTPresetCategoryToComponentType(a2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "componentForType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v9, "assets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v15, "is3DAsset"))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "assetResourceCache");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "resourceForAsset:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          *(float *)&v18 = a4;
          objc_msgSend(*(id *)(a1 + 32), "registerRequiredVariant:weight:inHierarchy:", v7, v17, v18);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", v7);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v12);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "builtinAssetNodesForComponentType:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v20)
  {
    v22 = v20;
    v23 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v19);
        *(float *)&v21 = a4;
        objc_msgSend(*(id *)(a1 + 32), "registerRequiredVariant:weight:inHierarchy:", v7, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j), v21);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", v7);
      }
      v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v22);
  }

}

void __44__AVTAvatarMemoryOptimizer_preprocessMemoji__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v26 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "componentForType:", a2);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "assets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v14, "is3DAsset"))
        {
          objc_msgSend(v14, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v7);

          if (v16)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "assetResourceCache");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "resourceForAsset:", v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            LODWORD(v19) = 1.0;
            objc_msgSend(*(id *)(a1 + 32), "registerRequiredVariant:weight:inHierarchy:", v8, v18, v19);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", v8);

          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v11);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "builtinAssetNodesForComponentType:", v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v21)
  {
    v23 = v21;
    v24 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(v20);
        LODWORD(v22) = 1.0;
        objc_msgSend(*(id *)(a1 + 32), "registerRequiredVariant:weight:inHierarchy:", v8, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j), v22);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", v8);
      }
      v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v23);
  }

}

- (void)optimizeMemoji
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t j;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t k;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[AVTMemoji allBuiltinAssetNodes](self->_memoji, "allBuiltinAssetNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v3);
        -[AVTAvatarMemoryOptimizer optimizeNodeHierarchy:](self, "optimizeNodeHierarchy:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v5);
  }
  for (j = 0; j != 42; ++j)
  {
    if (j)
    {
      -[AVTMemoji componentForType:](self->_memoji, "componentForType:", j);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      objc_msgSend(v9, "assets", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v19;
        do
        {
          for (k = 0; k != v12; ++k)
          {
            if (*(_QWORD *)v19 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * k);
            if (objc_msgSend(v15, "is3DAsset"))
            {
              -[AVTMemoji assetResourceCache](self->_memoji, "assetResourceCache");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "resourceForAsset:", v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              -[AVTAvatarMemoryOptimizer optimizeNodeHierarchy:](self, "optimizeNodeHierarchy:", v17);
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        }
        while (v12);
      }

    }
  }

}

- (void)optimizeNodeHierarchy:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];

  v4 = a3;
  if (!v4)
    -[AVTAvatarMemoryOptimizer optimizeNodeHierarchy:].cold.1();
  v6[1] = 3221225472;
  v6[2] = __50__AVTAvatarMemoryOptimizer_optimizeNodeHierarchy___block_invoke;
  v6[3] = &unk_1EA61D7A8;
  v6[4] = self;
  v5 = v4;
  v6[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v4, "enumerateHierarchyUsingBlock:", v6);

}

uint64_t __50__AVTAvatarMemoryOptimizer_optimizeNodeHierarchy___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "optimizeNode:", a2);
}

- (void)optimizeNode:(id)a3
{
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *oldWeights;
  NSArray *v8;
  NSArray *oldMainTargets;
  void *v10;
  NSMutableArray *v11;
  NSMutableArray *newWeights;
  NSMutableArray *v13;
  NSMutableArray *newTargetsAndInBetweens;
  NSMutableArray *v15;
  NSMutableArray *newInBetweenCounts;
  NSMutableArray *v17;
  NSMutableArray *newInBetweenWeights;
  NSMutableArray *v19;
  NSMutableArray *indicesOfTargetsToFlattenInBaseGeometry;
  NSMutableDictionary *v21;
  NSMutableDictionary *indicesOfTargetsToFlattenInOtherTarget;
  NSMutableDictionary *v23;
  NSMutableDictionary *nonOneWeightsOfTargetsToFlatten;
  NSArray *v25;
  NSArray *oldCorrectives;
  NSArray *v27;
  NSArray *oldCorrectiveDriverCounts;
  NSArray *v29;
  NSArray *oldCorrectiveDriverIndices;
  NSUInteger v31;
  void *v32;
  BOOL *p_hasCorrectiveInBetweens;
  NSMutableArray *v34;
  NSMutableArray *newCorrectivesAndInBetweens;
  NSMutableArray *v36;
  NSMutableArray *newCorrectiveDriverCounts;
  NSMutableArray *v38;
  NSMutableArray *newCorrectiveDriverIndices;
  NSMutableArray *v40;
  NSMutableArray *newCorrectiveInBetweenCounts;
  NSMutableArray *v42;
  NSMutableArray *newCorrectiveInBetweenWeights;
  NSMutableArray *v44;
  NSMutableArray *indicesOfCorrectivesToFlattenInBaseGeometry;
  NSMutableDictionary *v46;
  NSMutableDictionary *indicesOfCorrectivesToFlattenInMainTarget;
  NSMutableDictionary *v48;
  NSMutableDictionary *indicesOfCorrectivesToFlattenInOtherCorrective;
  NSMutableDictionary *v50;
  NSMutableDictionary *nonOneWeightsOfCorrectivesToFlatten;
  id v52;

  v52 = a3;
  objc_msgSend(v52, "morpher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "weights");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    oldWeights = self->_oldWeights;
    self->_oldWeights = v6;

    objc_msgSend(v5, "targets");
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    oldMainTargets = self->_oldMainTargets;
    self->_oldMainTargets = v8;

    objc_msgSend(v5, "inBetweenCounts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hasInBetweens = objc_msgSend(v10, "count") != 0;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    newWeights = self->_newWeights;
    self->_newWeights = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    newTargetsAndInBetweens = self->_newTargetsAndInBetweens;
    self->_newTargetsAndInBetweens = v13;

    if (self->_hasInBetweens)
    {
      v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      newInBetweenCounts = self->_newInBetweenCounts;
      self->_newInBetweenCounts = v15;
    }
    else
    {
      newInBetweenCounts = self->_newInBetweenCounts;
      self->_newInBetweenCounts = 0;
    }

    if (self->_hasInBetweens)
    {
      v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      newInBetweenWeights = self->_newInBetweenWeights;
      self->_newInBetweenWeights = v17;
    }
    else
    {
      newInBetweenWeights = self->_newInBetweenWeights;
      self->_newInBetweenWeights = 0;
    }

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    indicesOfTargetsToFlattenInBaseGeometry = self->_indicesOfTargetsToFlattenInBaseGeometry;
    self->_indicesOfTargetsToFlattenInBaseGeometry = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    indicesOfTargetsToFlattenInOtherTarget = self->_indicesOfTargetsToFlattenInOtherTarget;
    self->_indicesOfTargetsToFlattenInOtherTarget = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    nonOneWeightsOfTargetsToFlatten = self->_nonOneWeightsOfTargetsToFlatten;
    self->_nonOneWeightsOfTargetsToFlatten = v23;

    objc_msgSend(v5, "correctives");
    v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
    oldCorrectives = self->_oldCorrectives;
    self->_oldCorrectives = v25;

    objc_msgSend(v5, "correctiveDriverCounts");
    v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
    oldCorrectiveDriverCounts = self->_oldCorrectiveDriverCounts;
    self->_oldCorrectiveDriverCounts = v27;

    objc_msgSend(v5, "correctiveDriverIndices");
    v29 = (NSArray *)objc_claimAutoreleasedReturnValue();
    oldCorrectiveDriverIndices = self->_oldCorrectiveDriverIndices;
    self->_oldCorrectiveDriverIndices = v29;

    v31 = -[NSArray count](self->_oldCorrectiveDriverCounts, "count");
    self->_hasCorrectives = v31 != 0;
    if (v31)
    {
      objc_msgSend(v5, "correctiveInBetweenCounts");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      self->_hasCorrectiveInBetweens = objc_msgSend(v32, "count") != 0;
      p_hasCorrectiveInBetweens = &self->_hasCorrectiveInBetweens;

    }
    else
    {
      self->_hasCorrectiveInBetweens = 0;
      p_hasCorrectiveInBetweens = &self->_hasCorrectiveInBetweens;
    }
    v34 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    newCorrectivesAndInBetweens = self->_newCorrectivesAndInBetweens;
    self->_newCorrectivesAndInBetweens = v34;

    if (self->_hasCorrectives)
    {
      v36 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      newCorrectiveDriverCounts = self->_newCorrectiveDriverCounts;
      self->_newCorrectiveDriverCounts = v36;
    }
    else
    {
      newCorrectiveDriverCounts = self->_newCorrectiveDriverCounts;
      self->_newCorrectiveDriverCounts = 0;
    }

    if (self->_hasCorrectives)
    {
      v38 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      newCorrectiveDriverIndices = self->_newCorrectiveDriverIndices;
      self->_newCorrectiveDriverIndices = v38;
    }
    else
    {
      newCorrectiveDriverIndices = self->_newCorrectiveDriverIndices;
      self->_newCorrectiveDriverIndices = 0;
    }

    if (*p_hasCorrectiveInBetweens)
    {
      v40 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      newCorrectiveInBetweenCounts = self->_newCorrectiveInBetweenCounts;
      self->_newCorrectiveInBetweenCounts = v40;
    }
    else
    {
      newCorrectiveInBetweenCounts = self->_newCorrectiveInBetweenCounts;
      self->_newCorrectiveInBetweenCounts = 0;
    }

    if (*p_hasCorrectiveInBetweens)
    {
      v42 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      newCorrectiveInBetweenWeights = self->_newCorrectiveInBetweenWeights;
      self->_newCorrectiveInBetweenWeights = v42;
    }
    else
    {
      newCorrectiveInBetweenWeights = self->_newCorrectiveInBetweenWeights;
      self->_newCorrectiveInBetweenWeights = 0;
    }

    if (self->_hasCorrectives)
    {
      v44 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      indicesOfCorrectivesToFlattenInBaseGeometry = self->_indicesOfCorrectivesToFlattenInBaseGeometry;
      self->_indicesOfCorrectivesToFlattenInBaseGeometry = v44;
    }
    else
    {
      indicesOfCorrectivesToFlattenInBaseGeometry = self->_indicesOfCorrectivesToFlattenInBaseGeometry;
      self->_indicesOfCorrectivesToFlattenInBaseGeometry = 0;
    }

    if (self->_hasCorrectives)
    {
      v46 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      indicesOfCorrectivesToFlattenInMainTarget = self->_indicesOfCorrectivesToFlattenInMainTarget;
      self->_indicesOfCorrectivesToFlattenInMainTarget = v46;
    }
    else
    {
      indicesOfCorrectivesToFlattenInMainTarget = self->_indicesOfCorrectivesToFlattenInMainTarget;
      self->_indicesOfCorrectivesToFlattenInMainTarget = 0;
    }

    if (self->_hasCorrectives)
    {
      v48 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      indicesOfCorrectivesToFlattenInOtherCorrective = self->_indicesOfCorrectivesToFlattenInOtherCorrective;
      self->_indicesOfCorrectivesToFlattenInOtherCorrective = v48;
    }
    else
    {
      indicesOfCorrectivesToFlattenInOtherCorrective = self->_indicesOfCorrectivesToFlattenInOtherCorrective;
      self->_indicesOfCorrectivesToFlattenInOtherCorrective = 0;
    }

    if (self->_hasCorrectives)
    {
      v50 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      nonOneWeightsOfCorrectivesToFlatten = self->_nonOneWeightsOfCorrectivesToFlatten;
      self->_nonOneWeightsOfCorrectivesToFlatten = v50;
    }
    else
    {
      nonOneWeightsOfCorrectivesToFlatten = self->_nonOneWeightsOfCorrectivesToFlatten;
      self->_nonOneWeightsOfCorrectivesToFlatten = 0;
    }

    -[AVTAvatarMemoryOptimizer classifyTargetsOfMorpher:node:](self, "classifyTargetsOfMorpher:node:", v5, v52);
    -[AVTAvatarMemoryOptimizer flattenTargetsOfMorpher:node:](self, "flattenTargetsOfMorpher:node:", v5, v52);
  }

}

- (void)classifyTargetsOfMorpher:(id)a3 node:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSArray *oldMainTargets;
  id v10;
  id v11;
  NSArray *oldCorrectives;
  unint64_t i;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[5];
  id v37;
  id v38;
  _QWORD *v39;
  _QWORD v40[4];
  _QWORD v41[5];
  id v42;
  id v43;
  uint8_t buf[4];
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29 = a4;
  -[NSMapTable objectForKey:](self->_requiredVariantsPerMorpher, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  oldMainTargets = self->_oldMainTargets;
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke;
  v41[3] = &unk_1EA61D7F8;
  v41[4] = self;
  v10 = v6;
  v42 = v10;
  v11 = v7;
  v43 = v11;
  -[NSArray enumerateObjectsUsingBlock:](oldMainTargets, "enumerateObjectsUsingBlock:", v41);
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v40[3] = 0;
  oldCorrectives = self->_oldCorrectives;
  v36[0] = v8;
  v36[1] = 3221225472;
  v36[2] = __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_2;
  v36[3] = &unk_1EA61D848;
  v36[4] = self;
  v39 = v40;
  v28 = v11;
  v37 = v28;
  v27 = v10;
  v38 = v27;
  -[NSArray enumerateObjectsUsingBlock:](oldCorrectives, "enumerateObjectsUsingBlock:", v36);
  for (i = 0; i < -[NSMutableArray count](self->_newCorrectiveDriverIndices, "count"); i = v31 + 1)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_newCorrectiveDriverIndices, "objectAtIndexedSubscript:", i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](self->_oldMainTargets, "objectAtIndexedSubscript:", objc_msgSend(v14, "unsignedIntegerValue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = i;
    if (-[NSMutableArray count](self->_newInBetweenCounts, "count"))
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v16 = self->_newInBetweenCounts;
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
      if (v17)
      {
        v18 = 0;
        v19 = 0;
        v20 = *(_QWORD *)v33;
        while (2)
        {
          v21 = 0;
          v30 = v19 + v17;
          do
          {
            if (*(_QWORD *)v33 != v20)
              objc_enumerationMutation(v16);
            v18 += objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v21), "unsignedIntegerValue");
            -[NSMutableArray objectAtIndexedSubscript:](self->_newTargetsAndInBetweens, "objectAtIndexedSubscript:", v18 - 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22 == v15;

            if (v23)
            {
              v24 = v19 + v21;
              goto LABEL_14;
            }
            ++v21;
          }
          while (v17 != v21);
          v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
          v19 = v30;
          if (v17)
            continue;
          break;
        }
      }
      v24 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:

    }
    else
    {
      v24 = -[NSMutableArray indexOfObject:](self->_newTargetsAndInBetweens, "indexOfObject:", v15);
    }
    if (v24 == 0x7FFFFFFFFFFFFFFFLL)
    {
      avt_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[AVTAvatarMemoryOptimizer classifyTargetsOfMorpher:node:].cold.1(buf, &v45, v25);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray setObject:atIndexedSubscript:](self->_newCorrectiveDriverIndices, "setObject:atIndexedSubscript:", v26, v31);

  }
  _Block_object_dispose(v40, 8);

}

void __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  const char *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  float v20;
  void *v21;
  float v22;
  int v23;
  int v24;
  uint64_t v26;
  double v27;
  int v28;
  double v29;
  double v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  uint64_t v46;
  double v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  unint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  id v58;
  int v59;
  char v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (AVTMorphTargetNameIsUsedForFaceAnimation(v6) || AVTMorphTargetNameIsUsedForDynamics(v6, v7))
  {
LABEL_3:
    objc_msgSend(a1[4], "keepTargetAtIndex:morpher:", a3, a1[5]);
    goto LABEL_4;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Emoji")) & 1) != 0)
    goto LABEL_4;
  if (objc_msgSend(v6, "containsString:", CFSTR("__")))
  {
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("__"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    if (v9 < 6)
    {
      v11 = v9;
      v60 = 0;
      v59 = 0;
      if (v9)
      {
        v50 = a3;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 1.0;
        v51 = v8;
        v52 = v9;
        do
        {
          objc_msgSend(v8, "objectAtIndexedSubscript:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (AVTMorphTargetNameIsUsedForFaceAnimation(v16))
          {
            ++v13;
          }
          else
          {
            v17 = (void *)*((_QWORD *)a1[4] + 3);
            v57[0] = MEMORY[0x1E0C809B0];
            v57[1] = 3221225472;
            v57[2] = __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_30;
            v57[3] = &unk_1EA61D7D0;
            v18 = v16;
            v58 = v18;
            v19 = objc_msgSend(v17, "indexOfObjectPassingTest:", v57);
            v20 = 0.0;
            if (v19 != 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(*((id *)a1[4] + 3), "objectAtIndexedSubscript:", v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "morphVariantIntensity");
              v20 = v22;

            }
            v23 = objc_msgSend(a1[6], "containsObject:", v18);
            v24 = v23;
            if (v19 == 0x7FFFFFFFFFFFFFFFLL && v23 != 0)
            {
              v26 = objc_msgSend(a1[5], "_weightIndexForTargetNamed:", v18);
              if (v26 == 0x7FFFFFFFFFFFFFFFLL)
                __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_cold_4();
              objc_msgSend(a1[5], "weightForTargetAtIndex:", v26);
              v20 = v27;
            }
            if (v19 == 0x7FFFFFFFFFFFFFFFLL)
              v28 = v24;
            else
              v28 = 1;
            if (v28 != 1)
            {

              v8 = v51;
              goto LABEL_74;
            }
            v15 = fminf(v15, v20);
            *((_BYTE *)&v59 + v14) = 1;
            ++v12;

            v8 = v51;
            v11 = v52;
          }

          ++v14;
        }
        while (v11 != v14);
        a3 = v50;
        if (v13 == v11)
          goto LABEL_33;
        if (v12 == v11)
        {
          *(float *)&v29 = v15;
          objc_msgSend(a1[4], "flattenTargetAtIndex:inBaseGeometryUsingWeight:", v50, v29);
        }
        else
        {
          if (v12 + v13 != v11)
            __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_cold_3();
          if (v13 == 1)
          {
            v36 = 0;
            while (*((_BYTE *)&v59 + v36))
            {
              if (v11 == ++v36)
              {
                v37 = 0;
                goto LABEL_66;
              }
            }
            objc_msgSend(v8, "objectAtIndexedSubscript:");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_66:
            v46 = objc_msgSend(a1[5], "_weightIndexForTargetNamed:", v37);
            if (v46 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v48 = v8;
              avt_default_log();
              v49 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_cold_2();

              objc_msgSend(v5, "setName:", v37);
              objc_msgSend(a1[4], "keepTargetAtIndex:morpher:", v50, a1[5]);
              v8 = v48;
            }
            else
            {
              *(float *)&v47 = v15;
              objc_msgSend(a1[4], "flattenTargetAtIndex:inTargetAtIndex:weight:", v50, v46, v47);
            }

          }
          else
          {
            v38 = 0;
            v39 = 0;
            do
            {
              if (!*((_BYTE *)&v59 + v38))
              {
                objc_msgSend(v8, "objectAtIndexedSubscript:", v38);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = v40;
                if (v39)
                {
                  objc_msgSend(v39, "stringByAppendingFormat:", CFSTR("__%@"), v40);
                  v42 = v8;
                  v43 = objc_claimAutoreleasedReturnValue();

                  v39 = (id)v43;
                  v8 = v42;
                  v11 = v52;
                }
                else
                {
                  v39 = v40;
                }

              }
              ++v38;
            }
            while (v11 != v38);
            v44 = objc_msgSend(a1[5], "_weightIndexForTargetNamed:", v39);
            if (v44 == 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v5, "setName:", v39);
              objc_msgSend(a1[4], "keepTargetAtIndex:morpher:", v50, a1[5]);
            }
            else
            {
              *(float *)&v45 = v15;
              objc_msgSend(a1[4], "flattenTargetAtIndex:inTargetAtIndex:weight:", v50, v44, v45);
            }

          }
        }
      }
      else
      {
LABEL_33:
        objc_msgSend(a1[4], "keepTargetAtIndex:morpher:", a3, a1[5]);
      }
    }
    else
    {
      avt_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_cold_1();

    }
LABEL_74:

  }
  else
  {
    if (objc_msgSend(v6, "hasPrefix:", CFSTR("variant_sticker")))
    {
      if (objc_msgSend(*((id *)a1[4] + 1), "usageIntent") != 1)
        goto LABEL_4;
      goto LABEL_3;
    }
    if (objc_msgSend(a1[6], "containsObject:", v6))
    {
      objc_msgSend(a1[5], "weightForTargetAtIndex:", a3);
      *(float *)&v30 = v30;
      objc_msgSend(a1[4], "flattenTargetAtIndex:inBaseGeometryUsingWeight:", a3, v30);
    }
    else
    {
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v31 = *((id *)a1[4] + 4);
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v54;
        while (2)
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v54 != v34)
              objc_enumerationMutation(v31);
            if ((objc_msgSend(v6, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i)) & 1) != 0)
            {

              goto LABEL_4;
            }
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
          if (v33)
            continue;
          break;
        }
      }

      if ((objc_msgSend(v6, "hasPrefix:", CFSTR("variant_")) & 1) == 0)
        __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_cold_5();
    }
  }
LABEL_4:

}

uint64_t __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_30(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "morphVariant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_2(id *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id *v7;
  id *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id *v25;
  void *v26;
  id v27;
  uint64_t v28;
  float v29;
  void *v30;
  float v31;
  int v32;
  int v33;
  double v35;
  int v36;
  double v37;
  unsigned __int8 *v38;
  void *v40;
  void *v41;
  id v42;
  unsigned __int8 *v43;
  void *v45;
  id *v46;
  void *v47;
  id *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  double v55;
  void *v56;
  uint64_t v57;
  void *v58;
  double v59;
  NSObject *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  unint64_t v64;
  id *v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  int v70;
  char v71;

  v5 = a2;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = a1;
  v8 = (id *)a1[4];
  v7 = a1 + 4;
  objc_msgSend(v8[16], "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  v11 = *((_QWORD *)v7[3] + 1);
  v12 = *(_QWORD *)(v11 + 24);
  *(_QWORD *)(v11 + 24) = v12 + v10;
  if (v10 < 6)
  {
    v71 = 0;
    v70 = 0;
    if (v10)
    {
      v61 = a3;
      v62 = v6;
      v63 = v5;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 1.0;
      v64 = v10;
      do
      {
        objc_msgSend(*((id *)*v7 + 17), "objectAtIndexedSubscript:", v12 + v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "unsignedIntegerValue");

        objc_msgSend(*((id *)*v7 + 6), "objectAtIndexedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (AVTMorphTargetNameIsUsedForFaceAnimation(v21))
        {
          ++v16;
        }
        else
        {
          v22 = v12;
          v23 = v16;
          v24 = v14;
          v25 = v7;
          v26 = (void *)*((_QWORD *)*v7 + 3);
          v68[0] = MEMORY[0x1E0C809B0];
          v68[1] = 3221225472;
          v68[2] = __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_41;
          v68[3] = &unk_1EA61D7D0;
          v27 = v21;
          v69 = v27;
          v28 = objc_msgSend(v26, "indexOfObjectPassingTest:", v68);
          v29 = 0.0;
          if (v28 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(*((id *)*v25 + 3), "objectAtIndexedSubscript:", v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "morphVariantIntensity");
            v29 = v31;

          }
          v32 = objc_msgSend(v65[5], "containsObject:", v27);
          v33 = v32;
          if (v28 == 0x7FFFFFFFFFFFFFFFLL && v32 != 0)
          {
            objc_msgSend(v65[6], "weightForTargetAtIndex:", v19);
            v29 = v35;
          }
          if (v28 == 0x7FFFFFFFFFFFFFFFLL)
            v36 = v33;
          else
            v36 = 1;
          if (v36 != 1)
          {

            v5 = v63;
LABEL_25:
            v6 = v62;
            goto LABEL_51;
          }
          v17 = fminf(v17, v29);
          *((_BYTE *)&v70 + v15) = 1;
          v14 = v24 + 1;

          v16 = v23;
          v12 = v22;
          v10 = v64;
          v7 = v25;
        }

        ++v15;
      }
      while (v10 != v15);
      v6 = v62;
      v5 = v63;
      a3 = v61;
      if (v16 == v10)
        goto LABEL_23;
      if (v14 == v10)
      {
        *(float *)&v37 = v17;
        objc_msgSend(*v7, "flattenCorrectiveAtIndex:inBaseGeometryUsingWeight:", v61, v37);
      }
      else
      {
        if (v14 + v16 != v10)
          __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_2_cold_3();
        if (v16 != 1)
        {
          v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10);
          v42 = 0;
          v43 = (unsigned __int8 *)&v70;
          do
          {
            if (!*v43++)
            {
              objc_msgSend(*((id *)*v7 + 17), "objectAtIndexedSubscript:", v12);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = v7;
              v47 = v45;
              v48 = v46;
              objc_msgSend(*((id *)*v46 + 6), "objectAtIndexedSubscript:", objc_msgSend(v45, "unsignedIntegerValue"));
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "name");
              v50 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v41, "addObject:", v47);
              if (v42)
              {
                objc_msgSend(v42, "stringByAppendingFormat:", CFSTR("__%@"), v50);
                v51 = objc_claimAutoreleasedReturnValue();

                v42 = (id)v51;
              }
              else
              {
                v42 = v50;
              }

              v7 = v48;
            }
            ++v12;
            --v10;
          }
          while (v10);
          v52 = (void *)*((_QWORD *)*v7 + 15);
          v66[0] = MEMORY[0x1E0C809B0];
          v66[1] = 3221225472;
          v66[2] = __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_42;
          v66[3] = &unk_1EA61D820;
          v67 = v42;
          v53 = v42;
          v54 = objc_msgSend(v52, "indexOfObjectPassingTest:", v66);
          if (v54 == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v63, "setName:", v53);
            objc_msgSend(v65[4], "keepCorrectiveAtIndex:withDriverIndices:morpher:", v61, v41, v65[6]);
          }
          else
          {
            *(float *)&v55 = v17;
            objc_msgSend(*v7, "flattenCorrectiveAtIndex:inCorrectiveAtIndex:weight:", v61, v54, v55);
          }

          goto LABEL_25;
        }
        v38 = (unsigned __int8 *)&v70;
        while (*v38++)
        {
          ++v12;
          if (!--v10)
          {
            v40 = 0;
            goto LABEL_44;
          }
        }
        objc_msgSend(*((id *)*v7 + 17), "objectAtIndexedSubscript:", v12);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "unsignedIntegerValue");

        objc_msgSend(*((id *)*v7 + 6), "objectAtIndexedSubscript:", v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "name");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v57 != 0x7FFFFFFFFFFFFFFFLL)
        {
          *(float *)&v59 = v17;
          objc_msgSend(*v7, "flattenCorrectiveAtIndex:inTargetAtIndex:weight:", v61, v57, v59);
          goto LABEL_50;
        }
LABEL_44:
        avt_default_log();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_cold_2();

LABEL_50:
        v5 = v63;
      }
    }
    else
    {
LABEL_23:
      objc_msgSend(v65[4], "keepCorrectiveAtIndex:morpher:", a3, v65[6]);
    }
  }
  else
  {
    avt_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_2_cold_1((uint64_t)v7, a3, v13);

  }
LABEL_51:

}

uint64_t __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_41(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "morphVariant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_42(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)flattenTargetsOfMorpher:(id)a3 node:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[AVTAvatarMemoryOptimizer flattenRelevantTargetsOfMorpher:inBaseGeometryOfNode:](self, "flattenRelevantTargetsOfMorpher:inBaseGeometryOfNode:", v7, v6);
  -[AVTAvatarMemoryOptimizer flattenRelevantTargetsInOtherTargetsOfMorpher:](self, "flattenRelevantTargetsInOtherTargetsOfMorpher:", v7);

  if (-[NSMutableArray count](self->_newTargetsAndInBetweens, "count"))
  {
    objc_msgSend(v6, "morpher");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (-[AVTAvatarMemoryOptimizer shouldClearCPUDataAfterUpload](self, "shouldClearCPUDataAfterUpload"))
      objc_msgSend(v9, "setShouldClearCPUDataAfterUpload:", 1);
    if (-[NSMutableArray count](self->_newInBetweenCounts, "count")
      && -[NSMutableArray count](self->_newInBetweenWeights, "count"))
    {
      objc_msgSend(v9, "setTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:correctives:driverCounts:driverIndices:inBetweenCounts:inBetweenWeights:", self->_newTargetsAndInBetweens, self->_newInBetweenCounts, self->_newInBetweenWeights, self->_newCorrectivesAndInBetweens, self->_newCorrectiveDriverCounts, self->_newCorrectiveDriverIndices, self->_newCorrectiveInBetweenCounts, self->_newCorrectiveInBetweenWeights);
    }
    else
    {
      objc_msgSend(v9, "setTargets:", self->_newTargetsAndInBetweens);
    }
    objc_msgSend(v9, "setWeights:", self->_newWeights);
    v8 = v9;
  }
  else
  {
    objc_msgSend(v6, "setMorpher:", 0);
    v8 = v6;
  }

}

- (void)keepTargetAtIndex:(unint64_t)a3 morpher:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSMutableArray *newInBetweenCounts;
  void *v10;
  void *v11;
  NSMutableArray *newWeights;
  void *v13;
  id v14;

  v6 = a4;
  v14 = v6;
  if (self->_hasInBetweens)
  {
    objc_msgSend(v6, "inBetweenTargetsForTargetAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inBetweenWeightsForTargetAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    newInBetweenCounts = self->_newInBetweenCounts;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count") + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](newInBetweenCounts, "addObject:", v10);

    -[NSMutableArray addObjectsFromArray:](self->_newInBetweenWeights, "addObjectsFromArray:", v8);
    -[NSArray objectAtIndexedSubscript:](self->_oldMainTargets, "objectAtIndexedSubscript:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](self->_newTargetsAndInBetweens, "addObjectsFromArray:", v7);
    -[NSMutableArray addObject:](self->_newTargetsAndInBetweens, "addObject:", v11);

  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_oldMainTargets, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](self->_newTargetsAndInBetweens, "addObject:", v7);
  }

  newWeights = self->_newWeights;
  -[NSArray objectAtIndexedSubscript:](self->_oldWeights, "objectAtIndexedSubscript:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](newWeights, "addObject:", v13);

}

- (void)keepCorrectiveAtIndex:(unint64_t)a3 morpher:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *newCorrectiveInBetweenCounts;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  -[NSArray objectAtIndexedSubscript:](self->_oldCorrectiveDriverCounts, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "correctiveDriverIndicesForCorrectiveAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](self->_newCorrectiveDriverCounts, "addObject:", v6);
  -[NSMutableArray addObjectsFromArray:](self->_newCorrectiveDriverIndices, "addObjectsFromArray:", v7);
  if (self->_hasInBetweens)
  {
    objc_msgSend(v13, "inBetweenTargetsForCorrectiveAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "inBetweenWeightsForCorrectiveAtIndex:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    newCorrectiveInBetweenCounts = self->_newCorrectiveInBetweenCounts;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count") + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](newCorrectiveInBetweenCounts, "addObject:", v11);

    -[NSMutableArray addObjectsFromArray:](self->_newCorrectiveInBetweenWeights, "addObjectsFromArray:", v9);
    -[NSArray objectAtIndexedSubscript:](self->_oldCorrectives, "objectAtIndexedSubscript:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](self->_newCorrectivesAndInBetweens, "addObjectsFromArray:", v8);
    -[NSMutableArray addObject:](self->_newCorrectivesAndInBetweens, "addObject:", v12);

  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_oldCorrectives, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](self->_newCorrectivesAndInBetweens, "addObject:", v8);
  }

}

- (void)keepCorrectiveAtIndex:(unint64_t)a3 withDriverIndices:(id)a4 morpher:(id)a5
{
  NSMutableArray *newCorrectiveDriverCounts;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *newCorrectiveInBetweenCounts;
  void *v15;
  void *v16;
  id v17;

  v17 = a5;
  newCorrectiveDriverCounts = self->_newCorrectiveDriverCounts;
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a4;
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](newCorrectiveDriverCounts, "addObject:", v11);

  -[NSMutableArray addObjectsFromArray:](self->_newCorrectiveDriverIndices, "addObjectsFromArray:", v10);
  if (self->_hasInBetweens)
  {
    objc_msgSend(v17, "inBetweenTargetsForCorrectiveAtIndex:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "inBetweenWeightsForCorrectiveAtIndex:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    newCorrectiveInBetweenCounts = self->_newCorrectiveInBetweenCounts;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "count") + 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](newCorrectiveInBetweenCounts, "addObject:", v15);

    -[NSMutableArray addObjectsFromArray:](self->_newCorrectiveInBetweenWeights, "addObjectsFromArray:", v13);
    -[NSArray objectAtIndexedSubscript:](self->_oldCorrectives, "objectAtIndexedSubscript:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](self->_newCorrectivesAndInBetweens, "addObjectsFromArray:", v12);
    -[NSMutableArray addObject:](self->_newCorrectivesAndInBetweens, "addObject:", v16);

  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_oldCorrectives, "objectAtIndexedSubscript:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](self->_newCorrectivesAndInBetweens, "addObject:", v12);
  }

}

- (void)flattenTargetAtIndex:(unint64_t)a3 inBaseGeometryUsingWeight:(float)a4
{
  void *v6;
  NSMutableDictionary *nonOneWeightsOfTargetsToFlatten;
  void *v8;
  NSMutableArray *indicesOfTargetsToFlattenInBaseGeometry;
  id v10;

  if (a4 != 0.0)
  {
    if (a4 < 1.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      nonOneWeightsOfTargetsToFlatten = self->_nonOneWeightsOfTargetsToFlatten;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](nonOneWeightsOfTargetsToFlatten, "setObject:forKeyedSubscript:", v6, v8);

    }
    indicesOfTargetsToFlattenInBaseGeometry = self->_indicesOfTargetsToFlattenInBaseGeometry;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](indicesOfTargetsToFlattenInBaseGeometry, "addObject:", v10);

  }
}

- (void)flattenTargetAtIndex:(unint64_t)a3 inTargetAtIndex:(unint64_t)a4 weight:(float)a5
{
  void *v8;
  NSMutableDictionary *nonOneWeightsOfTargetsToFlatten;
  void *v10;
  NSMutableDictionary *indicesOfTargetsToFlattenInOtherTarget;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  id v16;

  if (a5 != 0.0)
  {
    if (a5 < 1.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      nonOneWeightsOfTargetsToFlatten = self->_nonOneWeightsOfTargetsToFlatten;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](nonOneWeightsOfTargetsToFlatten, "setObject:forKeyedSubscript:", v8, v10);

    }
    indicesOfTargetsToFlattenInOtherTarget = self->_indicesOfTargetsToFlattenInOtherTarget;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](indicesOfTargetsToFlattenInOtherTarget, "objectForKeyedSubscript:", v12);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v13 = self->_indicesOfTargetsToFlattenInOtherTarget;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v16, v14);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v15);

  }
}

- (void)flattenCorrectiveAtIndex:(unint64_t)a3 inBaseGeometryUsingWeight:(float)a4
{
  void *v6;
  NSMutableDictionary *nonOneWeightsOfCorrectivesToFlatten;
  void *v8;
  NSMutableArray *indicesOfCorrectivesToFlattenInBaseGeometry;
  id v10;

  if (a4 != 0.0)
  {
    if (a4 < 1.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      nonOneWeightsOfCorrectivesToFlatten = self->_nonOneWeightsOfCorrectivesToFlatten;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](nonOneWeightsOfCorrectivesToFlatten, "setObject:forKeyedSubscript:", v6, v8);

    }
    indicesOfCorrectivesToFlattenInBaseGeometry = self->_indicesOfCorrectivesToFlattenInBaseGeometry;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](indicesOfCorrectivesToFlattenInBaseGeometry, "addObject:", v10);

  }
}

- (void)flattenCorrectiveAtIndex:(unint64_t)a3 inTargetAtIndex:(unint64_t)a4 weight:(float)a5
{
  void *v8;
  NSMutableDictionary *nonOneWeightsOfCorrectivesToFlatten;
  void *v10;
  NSMutableDictionary *indicesOfCorrectivesToFlattenInMainTarget;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  id v16;

  if (a5 != 0.0)
  {
    if (a5 < 1.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      nonOneWeightsOfCorrectivesToFlatten = self->_nonOneWeightsOfCorrectivesToFlatten;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](nonOneWeightsOfCorrectivesToFlatten, "setObject:forKeyedSubscript:", v8, v10);

    }
    indicesOfCorrectivesToFlattenInMainTarget = self->_indicesOfCorrectivesToFlattenInMainTarget;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](indicesOfCorrectivesToFlattenInMainTarget, "objectForKeyedSubscript:", v12);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v13 = self->_indicesOfCorrectivesToFlattenInMainTarget;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v16, v14);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v15);

  }
}

- (void)flattenCorrectiveAtIndex:(unint64_t)a3 inCorrectiveAtIndex:(unint64_t)a4 weight:(float)a5
{
  void *v8;
  NSMutableDictionary *nonOneWeightsOfCorrectivesToFlatten;
  void *v10;
  NSMutableDictionary *indicesOfCorrectivesToFlattenInOtherCorrective;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  id v16;

  if (a5 != 0.0)
  {
    if (a5 < 1.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      nonOneWeightsOfCorrectivesToFlatten = self->_nonOneWeightsOfCorrectivesToFlatten;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](nonOneWeightsOfCorrectivesToFlatten, "setObject:forKeyedSubscript:", v8, v10);

    }
    indicesOfCorrectivesToFlattenInOtherCorrective = self->_indicesOfCorrectivesToFlattenInOtherCorrective;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](indicesOfCorrectivesToFlattenInOtherCorrective, "objectForKeyedSubscript:", v12);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v13 = self->_indicesOfCorrectivesToFlattenInOtherCorrective;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v16, v14);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v15);

  }
}

- (void)flattenRelevantTargetsOfMorpher:(id)a3 inBaseGeometryOfNode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  float v40;
  float v41;
  void *v42;
  void *v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  float v54;
  float v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  NSMutableArray *v62;
  NSMutableArray *v63;
  id obj;
  void *v65;
  uint64_t v66;
  _QWORD v67[7];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[7];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[NSMutableArray count](self->_indicesOfTargetsToFlattenInBaseGeometry, "count")
    || -[NSMutableArray count](self->_indicesOfCorrectivesToFlattenInBaseGeometry, "count"))
  {
    v61 = v7;
    objc_msgSend(v7, "geometry");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "geometrySources");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    obj = v8;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v66 = 0;
      v12 = *(_QWORD *)v78;
      v13 = *MEMORY[0x1E0CD5A88];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v78 != v12)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
          objc_msgSend(v15, "semantic");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", v13);

          if (v17)
          {
            v11 = objc_msgSend(v15, "vectorCount");
            objc_msgSend(v15, "data");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)objc_msgSend(v18, "mutableCopy");

            v20 = objc_retainAutorelease(v19);
            v66 = objc_msgSend(v20, "mutableBytes");
            objc_msgSend(MEMORY[0x1E0CD5988], "geometrySourceWithData:semantic:vectorCount:floatComponents:componentsPerVector:bytesPerComponent:dataOffset:dataStride:", v20, v13, v11, 1, 3, 2, 0, 8);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "addObject:", v21);

          }
          else
          {
            objc_msgSend(v65, "addObject:", v15);
          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
      v66 = 0;
    }

    v22 = (void *)MEMORY[0x1E0CD5978];
    objc_msgSend(v60, "geometryElements");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "geometrySourceChannels");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "geometryWithSources:elements:sourceChannels:", v65, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v60, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setName:", v26);

    objc_msgSend(v60, "materials");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setMaterials:", v27);

    objc_msgSend(v60, "edgeCreasesSource");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setEdgeCreasesSource:", v28);

    objc_msgSend(v60, "edgeCreasesElement");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setEdgeCreasesElement:", v29);

    objc_msgSend(v60, "tessellator");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTessellator:", v30);

    objc_msgSend(v25, "setSubdivisionLevel:", objc_msgSend(v60, "subdivisionLevel"));
    v59 = v25;
    objc_msgSend(v61, "setGeometry:", v25);
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v62 = self->_indicesOfTargetsToFlattenInBaseGeometry;
    v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v74;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v74 != v33)
            objc_enumerationMutation(v62);
          v35 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
          v36 = objc_msgSend(v35, "unsignedIntegerValue");
          -[NSArray objectAtIndexedSubscript:](self->_oldMainTargets, "objectAtIndexedSubscript:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](self->_nonOneWeightsOfTargetsToFlatten, "objectForKeyedSubscript:", v35);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38;
          if (v38)
          {
            objc_msgSend(v38, "floatValue");
            v41 = v40;
          }
          else
          {
            v41 = 1.0;
          }
          objc_msgSend(v6, "inBetweenWeightsForTargetAtIndex:", v36);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "inBetweenTargetsForTargetAtIndex:", v36);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v72[0] = MEMORY[0x1E0C809B0];
          v72[1] = 3221225472;
          v72[2] = __81__AVTAvatarMemoryOptimizer_flattenRelevantTargetsOfMorpher_inBaseGeometryOfNode___block_invoke;
          v72[3] = &unk_1EA61D870;
          v72[4] = self;
          v72[5] = v66;
          v72[6] = v11;
          *(float *)&v44 = v41;
          -[AVTAvatarMemoryOptimizer resolveInBetweensForTarget:weight:inBetweenWeights:inBetweenTargets:block:](self, "resolveInBetweensForTarget:weight:inBetweenWeights:inBetweenTargets:block:", v37, v42, v43, v72, v44);

        }
        v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
      }
      while (v32);
    }

    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v63 = self->_indicesOfCorrectivesToFlattenInBaseGeometry;
    v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v69;
      do
      {
        for (k = 0; k != v46; ++k)
        {
          if (*(_QWORD *)v69 != v47)
            objc_enumerationMutation(v63);
          v49 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * k);
          v50 = objc_msgSend(v49, "unsignedIntegerValue");
          -[NSArray objectAtIndexedSubscript:](self->_oldCorrectives, "objectAtIndexedSubscript:", v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](self->_nonOneWeightsOfCorrectivesToFlatten, "objectForKeyedSubscript:", v49);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v52;
          if (v52)
          {
            objc_msgSend(v52, "floatValue");
            v55 = v54;
          }
          else
          {
            v55 = 1.0;
          }
          objc_msgSend(v6, "inBetweenWeightsForCorrectiveAtIndex:", v50);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "inBetweenTargetsForCorrectiveAtIndex:", v50);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v67[0] = MEMORY[0x1E0C809B0];
          v67[1] = 3221225472;
          v67[2] = __81__AVTAvatarMemoryOptimizer_flattenRelevantTargetsOfMorpher_inBaseGeometryOfNode___block_invoke_2;
          v67[3] = &unk_1EA61D870;
          v67[4] = self;
          v67[5] = v66;
          v67[6] = v11;
          *(float *)&v58 = v55;
          -[AVTAvatarMemoryOptimizer resolveInBetweensForTarget:weight:inBetweenWeights:inBetweenTargets:block:](self, "resolveInBetweensForTarget:weight:inBetweenWeights:inBetweenTargets:block:", v51, v56, v57, v67, v58);

        }
        v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
      }
      while (v46);
    }

    v7 = v61;
  }

}

void __81__AVTAvatarMemoryOptimizer_flattenRelevantTargetsOfMorpher_inBaseGeometryOfNode___block_invoke(uint64_t a1, uint64_t a2, void *a3, float a4, float a5)
{
  double v9;
  double v10;
  void *v11;
  id v12;

  v12 = a3;
  *(float *)&v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "applyMorphTarget:weight:toBaseGeometryBuffer:vertexCount:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v9);
  v11 = v12;
  if (v12)
  {
    *(float *)&v10 = a5;
    objc_msgSend(*(id *)(a1 + 32), "applyMorphTarget:weight:toBaseGeometryBuffer:vertexCount:", v12, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v10);
    v11 = v12;
  }

}

void __81__AVTAvatarMemoryOptimizer_flattenRelevantTargetsOfMorpher_inBaseGeometryOfNode___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, float a4, float a5)
{
  double v9;
  double v10;
  void *v11;
  id v12;

  v12 = a3;
  *(float *)&v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "applyMorphTarget:weight:toBaseGeometryBuffer:vertexCount:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v9);
  v11 = v12;
  if (v12)
  {
    *(float *)&v10 = a5;
    objc_msgSend(*(id *)(a1 + 32), "applyMorphTarget:weight:toBaseGeometryBuffer:vertexCount:", v12, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v10);
    v11 = v12;
  }

}

- (void)flattenRelevantTargetsInOtherTargetsOfMorpher:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableDictionary *indicesOfTargetsToFlattenInOtherTarget;
  id v12;
  NSMutableDictionary *indicesOfCorrectivesToFlattenInMainTarget;
  NSMutableDictionary *indicesOfCorrectivesToFlattenInOtherCorrective;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;

  v4 = a3;
  v5 = -[NSMutableDictionary count](self->_indicesOfTargetsToFlattenInOtherTarget, "count");
  v6 = MEMORY[0x1E0C809B0];
  if (v5 && self->_indicesOfCorrectivesToFlattenInMainTarget)
  {
    if (-[NSArray count](self->_oldMainTargets, "count"))
    {
      v7 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_indicesOfTargetsToFlattenInOtherTarget, "objectForKeyedSubscript:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_indicesOfCorrectivesToFlattenInMainTarget, "objectForKeyedSubscript:", v8);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v9 | v10)
          -[AVTAvatarMemoryOptimizer flattenTargetsAtIndices:correctivesAtIndices:inTargetAtIndex:morpher:](self, "flattenTargetsAtIndices:correctivesAtIndices:inTargetAtIndex:morpher:", v9, v10, v7, v4);

        ++v7;
      }
      while (v7 < -[NSArray count](self->_oldMainTargets, "count"));
    }
  }
  else
  {
    indicesOfTargetsToFlattenInOtherTarget = self->_indicesOfTargetsToFlattenInOtherTarget;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __74__AVTAvatarMemoryOptimizer_flattenRelevantTargetsInOtherTargetsOfMorpher___block_invoke;
    v20[3] = &unk_1EA61D898;
    v20[4] = self;
    v12 = v4;
    v21 = v12;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](indicesOfTargetsToFlattenInOtherTarget, "enumerateKeysAndObjectsUsingBlock:", v20);
    indicesOfCorrectivesToFlattenInMainTarget = self->_indicesOfCorrectivesToFlattenInMainTarget;
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __74__AVTAvatarMemoryOptimizer_flattenRelevantTargetsInOtherTargetsOfMorpher___block_invoke_2;
    v18[3] = &unk_1EA61D898;
    v18[4] = self;
    v19 = v12;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](indicesOfCorrectivesToFlattenInMainTarget, "enumerateKeysAndObjectsUsingBlock:", v18);

  }
  indicesOfCorrectivesToFlattenInOtherCorrective = self->_indicesOfCorrectivesToFlattenInOtherCorrective;
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __74__AVTAvatarMemoryOptimizer_flattenRelevantTargetsInOtherTargetsOfMorpher___block_invoke_3;
  v16[3] = &unk_1EA61D898;
  v16[4] = self;
  v17 = v4;
  v15 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](indicesOfCorrectivesToFlattenInOtherCorrective, "enumerateKeysAndObjectsUsingBlock:", v16);

}

void __74__AVTAvatarMemoryOptimizer_flattenRelevantTargetsInOtherTargetsOfMorpher___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "flattenTargetsAtIndices:correctivesAtIndices:inTargetAtIndex:morpher:", v5, 0, objc_msgSend(a2, "unsignedIntegerValue"), *(_QWORD *)(a1 + 40));

}

void __74__AVTAvatarMemoryOptimizer_flattenRelevantTargetsInOtherTargetsOfMorpher___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "flattenTargetsAtIndices:correctivesAtIndices:inTargetAtIndex:morpher:", 0, v5, objc_msgSend(a2, "unsignedIntegerValue"), *(_QWORD *)(a1 + 40));

}

void __74__AVTAvatarMemoryOptimizer_flattenRelevantTargetsInOtherTargetsOfMorpher___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "flattenCorrectivesAtIndices:inCorrectiveAtIndex:morpher:", v5, objc_msgSend(a2, "unsignedIntegerValue"), *(_QWORD *)(a1 + 40));

}

- (void)flattenTargetsAtIndices:(id)a3 correctivesAtIndices:(id)a4 inTargetAtIndex:(unint64_t)a5 morpher:(id)a6
{
  id v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  int v22;
  double v23;
  id v24;

  v24 = a3;
  v10 = a4;
  v11 = a6;
  -[NSArray objectAtIndexedSubscript:](self->_oldMainTargets, "objectAtIndexedSubscript:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 1.0;
  -[AVTAvatarMemoryOptimizer flattenTargetsAtIndices:correctivesAtIndices:inTarget:weight:morpher:](self, "flattenTargetsAtIndices:correctivesAtIndices:inTarget:weight:morpher:", v24, v10, v12, v11, v13);
  objc_msgSend(v11, "inBetweenWeightsForTargetAtIndex:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inBetweenTargetsForTargetAtIndex:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");
  if (v16)
  {
    v17 = v16;
    for (i = 0; i != v17; ++i)
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", i);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", i);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "floatValue");
      v22 = v21;

      LODWORD(v23) = v22;
      -[AVTAvatarMemoryOptimizer flattenTargetsAtIndices:correctivesAtIndices:inTarget:weight:morpher:](self, "flattenTargetsAtIndices:correctivesAtIndices:inTarget:weight:morpher:", v24, v10, v19, v11, v23);

    }
  }

}

- (void)flattenTargetsAtIndices:(id)a3 correctivesAtIndices:(id)a4 inTarget:(id)a5 weight:(float)a6 morpher:(id)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  float v24;
  float v25;
  void *v26;
  void *v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  float v37;
  float v38;
  void *v39;
  void *v40;
  double v41;
  uint64_t v42;
  id v43;
  id v44;
  id obj;
  _QWORD v46[5];
  id v47;
  uint64_t *v48;
  float v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[5];
  id v55;
  uint64_t *v56;
  float v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v43 = a4;
  v13 = a5;
  v14 = a7;
  v15 = -[NSMutableArray indexOfObjectIdenticalTo:](self->_newTargetsAndInBetweens, "indexOfObjectIdenticalTo:", v13);
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    -[AVTAvatarMemoryOptimizer flattenTargetsAtIndices:correctivesAtIndices:inTarget:weight:morpher:].cold.1();
  v42 = v15;
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy_;
  v66 = __Block_byref_object_dispose_;
  v67 = 0;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v12;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v59 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        v20 = objc_msgSend(v19, "unsignedIntegerValue");
        -[NSArray objectAtIndexedSubscript:](self->_oldMainTargets, "objectAtIndexedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_nonOneWeightsOfTargetsToFlatten, "objectForKeyedSubscript:", v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22)
        {
          objc_msgSend(v22, "floatValue");
          v25 = v24;
        }
        else
        {
          v25 = 1.0;
        }
        objc_msgSend(v14, "inBetweenWeightsForTargetAtIndex:", v20);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "inBetweenTargetsForTargetAtIndex:", v20);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = MEMORY[0x1E0C809B0];
        v54[1] = 3221225472;
        v54[2] = __97__AVTAvatarMemoryOptimizer_flattenTargetsAtIndices_correctivesAtIndices_inTarget_weight_morpher___block_invoke;
        v54[3] = &unk_1EA61D8C0;
        v56 = &v62;
        v54[4] = self;
        v57 = a6;
        v55 = v13;
        *(float *)&v28 = v25;
        -[AVTAvatarMemoryOptimizer resolveInBetweensForTarget:weight:inBetweenWeights:inBetweenTargets:block:](self, "resolveInBetweensForTarget:weight:inBetweenWeights:inBetweenTargets:block:", v21, v26, v27, v54, v28);

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
    }
    while (v16);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v44 = v43;
  v29 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v51 != v30)
          objc_enumerationMutation(v44);
        v32 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
        v33 = objc_msgSend(v32, "unsignedIntegerValue");
        -[NSArray objectAtIndexedSubscript:](self->_oldCorrectives, "objectAtIndexedSubscript:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_nonOneWeightsOfCorrectivesToFlatten, "objectForKeyedSubscript:", v32);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35;
        if (v35)
        {
          objc_msgSend(v35, "floatValue");
          v38 = v37;
        }
        else
        {
          v38 = 1.0;
        }
        objc_msgSend(v14, "inBetweenWeightsForCorrectiveAtIndex:", v33);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "inBetweenTargetsForCorrectiveAtIndex:", v33);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __97__AVTAvatarMemoryOptimizer_flattenTargetsAtIndices_correctivesAtIndices_inTarget_weight_morpher___block_invoke_2;
        v46[3] = &unk_1EA61D8C0;
        v48 = &v62;
        v46[4] = self;
        v49 = a6;
        v47 = v13;
        *(float *)&v41 = v38;
        -[AVTAvatarMemoryOptimizer resolveInBetweensForTarget:weight:inBetweenWeights:inBetweenTargets:block:](self, "resolveInBetweensForTarget:weight:inBetweenWeights:inBetweenTargets:block:", v34, v39, v40, v46, v41);

      }
      v29 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
    }
    while (v29);
  }

  if (!v63[5])
    __assert_rtn("-[AVTAvatarMemoryOptimizer flattenTargetsAtIndices:correctivesAtIndices:inTarget:weight:morpher:]", "AVTAvatarMemoryOptimizer.m", 1219, "newTargetWithFlattenedTargets != nil");
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_newTargetsAndInBetweens, "replaceObjectAtIndex:withObject:", v42);
  _Block_object_dispose(&v62, 8);

}

void __97__AVTAvatarMemoryOptimizer_flattenTargetsAtIndices_correctivesAtIndices_inTarget_weight_morpher___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  float v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v6 = *(float *)(a1 + 56);
  *(float *)&a4 = v6 * *(float *)&a4;
  *(float *)&a5 = v6 * *(float *)&a5;
  objc_msgSend(*(id *)(a1 + 32), "flattenTarget0:weight0:target1:weight1:inMorphTarget:originalMorphTarget:", a2, a3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40), a4, a5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void __97__AVTAvatarMemoryOptimizer_flattenTargetsAtIndices_correctivesAtIndices_inTarget_weight_morpher___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  float v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v6 = *(float *)(a1 + 56);
  *(float *)&a4 = v6 * *(float *)&a4;
  *(float *)&a5 = v6 * *(float *)&a5;
  objc_msgSend(*(id *)(a1 + 32), "flattenTarget0:weight0:target1:weight1:inMorphTarget:originalMorphTarget:", a2, a3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40), a4, a5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)flattenCorrectivesAtIndices:(id)a3 inCorrectiveAtIndex:(unint64_t)a4 morpher:(id)a5
{
  id v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  int v19;
  double v20;
  id v21;

  v21 = a3;
  v8 = a5;
  -[NSArray objectAtIndexedSubscript:](self->_oldCorrectives, "objectAtIndexedSubscript:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 1.0;
  -[AVTAvatarMemoryOptimizer flattenCorrectivesAtIndices:inCorrective:weight:morpher:](self, "flattenCorrectivesAtIndices:inCorrective:weight:morpher:", v21, v9, v8, v10);
  objc_msgSend(v8, "inBetweenWeightsForCorrectiveAtIndex:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inBetweenTargetsForCorrectiveAtIndex:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  if (v13)
  {
    v14 = v13;
    for (i = 0; i != v14; ++i)
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", i);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "floatValue");
      v19 = v18;

      LODWORD(v20) = v19;
      -[AVTAvatarMemoryOptimizer flattenCorrectivesAtIndices:inCorrective:weight:morpher:](self, "flattenCorrectivesAtIndices:inCorrective:weight:morpher:", v21, v16, v8, v20);

    }
  }

}

- (void)flattenCorrectivesAtIndices:(id)a3 inCorrective:(id)a4 weight:(float)a5 morpher:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  float v22;
  float v23;
  void *v24;
  void *v25;
  double v26;
  uint64_t v27;
  id obj;
  _QWORD v29[5];
  id v30;
  uint64_t *v31;
  float v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = -[NSMutableArray indexOfObjectIdenticalTo:](self->_newCorrectivesAndInBetweens, "indexOfObjectIdenticalTo:", v11);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    -[AVTAvatarMemoryOptimizer flattenCorrectivesAtIndices:inCorrective:weight:morpher:].cold.1();
  v27 = v13;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy_;
  v41 = __Block_byref_object_dispose_;
  v42 = 0;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v10;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "unsignedIntegerValue", v27);
        -[NSArray objectAtIndexedSubscript:](self->_oldCorrectives, "objectAtIndexedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_nonOneWeightsOfCorrectivesToFlatten, "objectForKeyedSubscript:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
        {
          objc_msgSend(v20, "floatValue");
          v23 = v22;
        }
        else
        {
          v23 = 1.0;
        }
        objc_msgSend(v12, "inBetweenWeightsForCorrectiveAtIndex:", v18);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "inBetweenTargetsForCorrectiveAtIndex:", v18);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __84__AVTAvatarMemoryOptimizer_flattenCorrectivesAtIndices_inCorrective_weight_morpher___block_invoke;
        v29[3] = &unk_1EA61D8C0;
        v31 = &v37;
        v29[4] = self;
        v32 = a5;
        v30 = v11;
        *(float *)&v26 = v23;
        -[AVTAvatarMemoryOptimizer resolveInBetweensForTarget:weight:inBetweenWeights:inBetweenTargets:block:](self, "resolveInBetweensForTarget:weight:inBetweenWeights:inBetweenTargets:block:", v19, v24, v25, v29, v26);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v14);
  }

  if (!v38[5])
    __assert_rtn("-[AVTAvatarMemoryOptimizer flattenCorrectivesAtIndices:inCorrective:weight:morpher:]", "AVTAvatarMemoryOptimizer.m", 1281, "newCorrectiveWithFlattenedCorrectives != nil");
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_newCorrectivesAndInBetweens, "replaceObjectAtIndex:withObject:", v27);
  _Block_object_dispose(&v37, 8);

}

void __84__AVTAvatarMemoryOptimizer_flattenCorrectivesAtIndices_inCorrective_weight_morpher___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  float v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v6 = *(float *)(a1 + 56);
  *(float *)&a4 = v6 * *(float *)&a4;
  *(float *)&a5 = v6 * *(float *)&a5;
  objc_msgSend(*(id *)(a1 + 32), "flattenTarget0:weight0:target1:weight1:inMorphTarget:originalMorphTarget:", a2, a3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40), a4, a5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)resolveInBetweensForTarget:(id)a3 weight:(float)a4 inBetweenWeights:(id)a5 inBetweenTargets:(id)a6 block:(id)a7
{
  id v11;
  id v12;
  void (**v13)(id, id, _QWORD, float, float);
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  __n128 v18;
  __n128 v19;
  float v20;
  void *v21;
  float v22;
  uint64_t v23;
  void *v24;
  float v25;
  float v26;
  void *v27;
  id v28;

  v28 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void (**)(id, id, _QWORD, float, float))a7;
  v14 = objc_msgSend(v12, "count");
  if (!v14)
  {
    v13[2](v13, v28, 0, a4, 0.0);
    goto LABEL_18;
  }
  v15 = v14;
  v16 = 0;
  while (v15 != v16)
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (a4 < 1.0)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "floatValue");
      v20 = v22;

      goto LABEL_8;
    }
LABEL_9:

    if (++v16 > v15)
      goto LABEL_18;
  }
  v17 = v28;
  v20 = 1.0;
  if (a4 >= 1.0)
    goto LABEL_15;
LABEL_8:
  if (v20 < a4)
    goto LABEL_9;
  if (v16)
  {
    v23 = v16 - 1;
    objc_msgSend(v11, "objectAtIndexedSubscript:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "floatValue");
    v26 = v25;

    a4 = (float)(a4 - v26) / (float)(v20 - v26);
    if (a4 < 1.0)
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, id, id, float, float))v13)[2](v13, v27, v17, 1.0 - a4, a4);

      goto LABEL_17;
    }
LABEL_15:
    v19.n128_u32[0] = 0;
    v18.n128_f32[0] = a4;
    ((void (*)(void (**)(id, id, _QWORD, float, float), id, _QWORD, __n128, __n128))v13[2])(v13, v17, 0, v18, v19);
    goto LABEL_17;
  }
  v18.n128_f32[0] = a4 / v20;
  v19.n128_u32[0] = 0;
  ((void (*)(void (**)(id, id, _QWORD, float, float), id, _QWORD, __n128, __n128))v13[2])(v13, v17, 0, v18, v19);
LABEL_17:

LABEL_18:
}

- (id)flattenTarget0:(id)a3 weight0:(float)a4 target1:(id)a5 weight1:(float)a6 inMorphTarget:(id)a7 originalMorphTarget:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  AVTAvatarMemoryOptimizer *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v18 = v17;
  if (v16)
  {
    objc_msgSend(v16, "geometrySources");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v20, "vectorCount");
    objc_msgSend(v20, "data");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = objc_msgSend(v22, "mutableBytes");

  }
  else
  {
    objc_msgSend(v17, "geometrySources");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v20, "vectorCount");
    objc_msgSend(v20, "data");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "mutableCopy");

    v35 = self;
    v27 = objc_retainAutorelease(v26);
    v23 = objc_msgSend(v27, "mutableBytes");
    objc_msgSend(MEMORY[0x1E0CD5988], "geometrySourceWithData:semantic:vectorCount:floatComponents:componentsPerVector:bytesPerComponent:dataOffset:dataStride:", v27, *MEMORY[0x1E0CD5A88], v21, 1, 3, 4, 0, 12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x1E0CD5978];
    v36[0] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "geometryWithSources:elements:", v30, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "name");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setName:", v31);

    self = v35;
  }

  *(float *)&v32 = a4;
  -[AVTAvatarMemoryOptimizer applyMorphTarget:weight:toMorphTargetBuffer:vertexCount:](self, "applyMorphTarget:weight:toMorphTargetBuffer:vertexCount:", v14, v23, v21, v32);
  if (v15)
  {
    *(float *)&v33 = a6;
    -[AVTAvatarMemoryOptimizer applyMorphTarget:weight:toMorphTargetBuffer:vertexCount:](self, "applyMorphTarget:weight:toMorphTargetBuffer:vertexCount:", v15, v23, v21, v33);
  }

  return v16;
}

- (void)applyMorphTarget:(id)a3 weight:(float)a4 toBaseGeometryBuffer:(void *)a5 vertexCount:(unint64_t)a6
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  float *v14;
  _WORD *v15;
  unsigned int v16;
  int v17;
  int v18;
  BOOL v19;
  int v20;
  float v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  float v26;
  int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  __int16 v31;
  int v32;
  int v33;
  unsigned int v34;
  int v35;
  float v36;
  float v37;
  int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  __int16 v42;
  int v43;
  int v44;
  id v45;

  v9 = a3;
  if (a4 <= 0.0)
    -[AVTAvatarMemoryOptimizer applyMorphTarget:weight:toBaseGeometryBuffer:vertexCount:].cold.1();
  v45 = v9;
  objc_msgSend(v9, "geometrySources");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "data");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = objc_msgSend(v12, "bytes");

  if (a6)
  {
    v14 = (float *)(v13 + 8);
    v15 = (char *)a5 + 4;
    do
    {
      v16 = (unsigned __int16)*(v15 - 2);
      v17 = (v16 >> 10) & 0x1F;
      if (v17 == 31)
        v18 = 2139095040;
      else
        v18 = (v16 >> 10) & 0x1F;
      if (v17)
        v19 = v17 == 31;
      else
        v19 = 1;
      if (v19)
        v20 = v18;
      else
        v20 = (v17 << 23) + 939524096;
      v21 = COERCE_FLOAT(v20 | (v16 << 16) & 0x80000000 | (v16 >> 7) & 7 | (8 * (v16 & 0x3FF)) & 0x1FFF | ((v16 & 0x3FF) << 13))
          + (float)(a4 * *(v14 - 2));
      v22 = HIWORD(LODWORD(v21)) & 0x8000;
      v23 = (LODWORD(v21) >> 23);
      if (v23 - 113 > 0x1D)
      {
        if (v23 >= 0x71)
        {
          if (v23 == 255)
            LOWORD(v22) = HIWORD(v21) & 0x8000 | ((LODWORD(v21) & 0x7FFFFF) != 0) | 0x7C00;
          else
            LOWORD(v22) = v22 | 0x7BFF;
        }
      }
      else
      {
        v22 = HIWORD(LODWORD(v21)) & 0x8000 | (LODWORD(v21) >> 13) & 0x3FF | ((v23 - 112) << 10);
      }
      *(v15 - 2) = v22;
      v24 = (unsigned __int16)*(v15 - 1);
      v25 = (v24 >> 10) & 0x1F;
      if (v25 && v25 != 31)
      {
        v25 = (v25 << 23) + 939524096;
      }
      else if (v25 == 31)
      {
        v25 = 2139095040;
      }
      v26 = COERCE_FLOAT(v25 | (v24 << 16) & 0x80000000 | (v24 >> 7) & 7 | (8 * (v24 & 0x3FF)) & 0x1FFF | ((v24 & 0x3FF) << 13))
          + (float)(a4 * *(v14 - 1));
      v27 = HIWORD(LODWORD(v26)) & 0x8000;
      v28 = (LODWORD(v26) >> 23);
      v29 = v28 - 112;
      v30 = v28 - 113;
      v31 = v27 | 0x7BFF;
      if (v28 == 255)
        v31 = v27 | ((LODWORD(v26) & 0x7FFFFF) != 0) | 0x7C00;
      if (v28 >= 0x71)
        LOWORD(v32) = v31;
      else
        v32 = HIWORD(LODWORD(v26)) & 0x8000;
      v33 = HIWORD(LODWORD(v26)) & 0x8000 | (LODWORD(v26) >> 13) & 0x3FF | (v29 << 10);
      if (v30 > 0x1D)
        LOWORD(v33) = v32;
      *(v15 - 1) = v33;
      v34 = (unsigned __int16)*v15;
      v35 = (v34 >> 10) & 0x1F;
      if (v35 && v35 != 31)
      {
        v35 = (v35 << 23) + 939524096;
      }
      else if (v35 == 31)
      {
        v35 = 2139095040;
      }
      v36 = *v14;
      v14 += 3;
      v37 = COERCE_FLOAT(v35 | (v34 << 16) & 0x80000000 | (v34 >> 7) & 7 | (8 * (v34 & 0x3FF)) & 0x1FFF | ((v34 & 0x3FF) << 13))
          + (float)(a4 * v36);
      v38 = HIWORD(LODWORD(v37)) & 0x8000;
      v39 = (LODWORD(v37) >> 23);
      v40 = v39 - 112;
      v41 = v39 - 113;
      v42 = v38 | 0x7BFF;
      if (v39 == 255)
        v42 = v38 | ((LODWORD(v37) & 0x7FFFFF) != 0) | 0x7C00;
      if (v39 >= 0x71)
        LOWORD(v43) = v42;
      else
        v43 = HIWORD(LODWORD(v37)) & 0x8000;
      v44 = HIWORD(LODWORD(v37)) & 0x8000 | (LODWORD(v37) >> 13) & 0x3FF | (v40 << 10);
      if (v41 > 0x1D)
        LOWORD(v44) = v43;
      *v15 = v44;
      v15 += 4;
      --a6;
    }
    while (a6);
  }

}

- (void)applyMorphTarget:(id)a3 weight:(float)a4 toMorphTargetBuffer:(id *)a5 vertexCount:(unint64_t)a6
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  _DWORD *v16;
  id v17;
  double v18;

  v18 = *(double *)&a4;
  v8 = a3;
  if (*(float *)&v18 <= 0.0)
    -[AVTAvatarMemoryOptimizer applyMorphTarget:weight:toMorphTargetBuffer:vertexCount:].cold.1();
  v17 = v8;
  objc_msgSend(v8, "geometrySources", v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "data");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = objc_msgSend(v11, "bytes");

  if (a6)
  {
    v15 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v18, 0);
    v16 = (_DWORD *)(v12 + 8);
    do
    {
      v13.i64[0] = *(_QWORD *)&a5->var0;
      v13.i32[2] = LODWORD(a5->var2);
      v14.i64[0] = *((_QWORD *)v16 - 1);
      v14.i32[2] = *v16;
      v13 = vmlaq_f32(v13, v14, v15);
      LODWORD(a5->var2) = v13.i32[2];
      *(_QWORD *)&a5->var0 = v13.i64[0];
      ++a5;
      v16 += 3;
      --a6;
    }
    while (a6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonOneWeightsOfCorrectivesToFlatten, 0);
  objc_storeStrong((id *)&self->_indicesOfCorrectivesToFlattenInOtherCorrective, 0);
  objc_storeStrong((id *)&self->_indicesOfCorrectivesToFlattenInMainTarget, 0);
  objc_storeStrong((id *)&self->_indicesOfCorrectivesToFlattenInBaseGeometry, 0);
  objc_storeStrong((id *)&self->_newCorrectiveInBetweenWeights, 0);
  objc_storeStrong((id *)&self->_newCorrectiveInBetweenCounts, 0);
  objc_storeStrong((id *)&self->_newCorrectiveDriverIndices, 0);
  objc_storeStrong((id *)&self->_newCorrectiveDriverCounts, 0);
  objc_storeStrong((id *)&self->_newCorrectivesAndInBetweens, 0);
  objc_storeStrong((id *)&self->_oldCorrectiveDriverIndices, 0);
  objc_storeStrong((id *)&self->_oldCorrectiveDriverCounts, 0);
  objc_storeStrong((id *)&self->_oldCorrectives, 0);
  objc_storeStrong((id *)&self->_nonOneWeightsOfTargetsToFlatten, 0);
  objc_storeStrong((id *)&self->_indicesOfTargetsToFlattenInOtherTarget, 0);
  objc_storeStrong((id *)&self->_indicesOfTargetsToFlattenInBaseGeometry, 0);
  objc_storeStrong((id *)&self->_newInBetweenWeights, 0);
  objc_storeStrong((id *)&self->_newInBetweenCounts, 0);
  objc_storeStrong((id *)&self->_newTargetsAndInBetweens, 0);
  objc_storeStrong((id *)&self->_newWeights, 0);
  objc_storeStrong((id *)&self->_oldMainTargets, 0);
  objc_storeStrong((id *)&self->_oldWeights, 0);
  objc_storeStrong((id *)&self->_presetVariantPrefixes, 0);
  objc_storeStrong((id *)&self->_requiredMorphVariantComponents, 0);
  objc_storeStrong((id *)&self->_requiredVariantsPerMorpher, 0);
  objc_storeStrong((id *)&self->_memoji, 0);
}

- (void)registerRequiredVariant:weight:inHierarchy:.cold.1()
{
  __assert_rtn("-[AVTAvatarMemoryOptimizer registerRequiredVariant:weight:inHierarchy:]", "AVTAvatarMemoryOptimizer.m", 148, "hierarchy");
}

- (void)optimizeNodeHierarchy:.cold.1()
{
  __assert_rtn("-[AVTAvatarMemoryOptimizer optimizeNodeHierarchy:]", "AVTAvatarMemoryOptimizer.m", 273, "hierarchy");
}

- (void)classifyTargetsOfMorpher:(os_log_t)log node:.cold.1(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "newDriverIndex != NSNotFound";
  _os_log_error_impl(&dword_1DD1FA000, log, OS_LOG_TYPE_ERROR, "Error: Condition '%s' failed. Failed to find driver in new updated main targets", buf, 0xCu);
}

void __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_0(&dword_1DD1FA000, v0, v1, "Error: Failed to optimize corrective with more than %d targets: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1DD1FA000, v0, v1, "Error: Unreachable code: Flattening the corrective %@ should lead to single animation target %@ that is always supposed to exist");
  OUTLINED_FUNCTION_1_0();
}

void __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_cold_3()
{
  __assert_rtn("-[AVTAvatarMemoryOptimizer classifyTargetsOfMorpher:node:]_block_invoke_2", "AVTAvatarMemoryOptimizer.m", 465, "numberOfDrivingTargetsKeptForVariant + numberOfDrivingTargetsKeptForAnimation == numberOfDrivingTargets");
}

void __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_cold_4()
{
  __assert_rtn("-[AVTAvatarMemoryOptimizer classifyTargetsOfMorpher:node:]_block_invoke_2", "AVTAvatarMemoryOptimizer.m", 415, "index != NSNotFound");
}

void __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_cold_5()
{
  __assert_rtn("-[AVTAvatarMemoryOptimizer classifyTargetsOfMorpher:node:]_block_invoke", "AVTAvatarMemoryOptimizer.m", 584, "0");
}

void __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)a1 + 136), "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_0(&dword_1DD1FA000, a3, v5, "Error: Failed to optimize corrective with more than %d targets: %@", v6);

}

void __58__AVTAvatarMemoryOptimizer_classifyTargetsOfMorpher_node___block_invoke_2_cold_3()
{
  __assert_rtn("-[AVTAvatarMemoryOptimizer classifyTargetsOfMorpher:node:]_block_invoke_2", "AVTAvatarMemoryOptimizer.m", 680, "numberOfDrivingTargetsKeptForVariant + numberOfDrivingTargetsKeptForAnimation == numberOfDrivingTargets");
}

- (void)flattenTargetsAtIndices:correctivesAtIndices:inTarget:weight:morpher:.cold.1()
{
  __assert_rtn("-[AVTAvatarMemoryOptimizer flattenTargetsAtIndices:correctivesAtIndices:inTarget:weight:morpher:]", "AVTAvatarMemoryOptimizer.m", 1171, "indexOfDestinationTargetInTargetsAndInBetweens != NSNotFound");
}

- (void)flattenCorrectivesAtIndices:inCorrective:weight:morpher:.cold.1()
{
  __assert_rtn("-[AVTAvatarMemoryOptimizer flattenCorrectivesAtIndices:inCorrective:weight:morpher:]", "AVTAvatarMemoryOptimizer.m", 1255, "indexOfDestinationCorrectiveInCorrectivesAndInBetweens != NSNotFound");
}

- (void)applyMorphTarget:weight:toBaseGeometryBuffer:vertexCount:.cold.1()
{
  __assert_rtn("-[AVTAvatarMemoryOptimizer applyMorphTarget:weight:toBaseGeometryBuffer:vertexCount:]", "AVTAvatarMemoryOptimizer.m", 1404, "weight > 0.f");
}

- (void)applyMorphTarget:weight:toMorphTargetBuffer:vertexCount:.cold.1()
{
  __assert_rtn("-[AVTAvatarMemoryOptimizer applyMorphTarget:weight:toMorphTargetBuffer:vertexCount:]", "AVTAvatarMemoryOptimizer.m", 1431, "weight > 0.f");
}

@end
