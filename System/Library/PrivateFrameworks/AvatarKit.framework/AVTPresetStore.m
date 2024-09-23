@implementation AVTPresetStore

- (AVTPresetStore)init
{
  AVTPresetStore *v2;
  AVTPresetStore *v3;
  uint64_t v4;
  NSMutableArray **unresolvedDependencies;
  NSMutableArray *v6;
  NSMutableArray *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVTPresetStore;
  v2 = -[AVTPresetStore init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = 0;
    unresolvedDependencies = v2->_unresolvedDependencies;
    do
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = unresolvedDependencies[v4];
      unresolvedDependencies[v4] = v6;

      ++v4;
    }
    while (v4 != 40);
  }
  return v3;
}

- (id)presetForCategory:(id *)a1
{
  if (a1)
    a1 = (id *)a1[a2 + 1];
  return a1;
}

- (char)setPreset:(uint64_t)a3 forCategory:
{
  id v6;
  char *v7;
  id *v8;
  id v9;

  v6 = a2;
  if (a1)
  {
    v7 = &a1[8 * a3];
    v9 = (id)*((_QWORD *)v7 + 1);
    v8 = (id *)(v7 + 8);
    if (v9 == v6)
    {
      a1 = 0;
    }
    else
    {
      objc_storeStrong(v8, a2);
      a1 = (char *)objc_msgSend(a1, "solveDependencies");
    }
  }

  return a1;
}

- (id)resolvedPresetForCategory:(id *)a1
{
  if (a1)
    a1 = (id *)a1[a2 + 41];
  return a1;
}

- (BOOL)hasUnresolvedDependenciesForCategory:(int64_t)a3
{
  return -[NSMutableArray count](self->_unresolvedDependencies[a3], "count") != 0;
}

- (void)registerDependenciesForPreset:(id)a3 previouslyRegisteredPresets:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v10 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "containsObject:", v10) & 1) == 0)
  {
    objc_msgSend(v6, "addObject:", v10);
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __76__AVTPresetStore_registerDependenciesForPreset_previouslyRegisteredPresets___block_invoke;
    v14[3] = &unk_1EA61D6B8;
    v14[4] = self;
    v8 = v10;
    v15 = v8;
    v9 = v6;
    v16 = v9;
    objc_msgSend(v8, "enumeratePresetDependencies:", v14);
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __76__AVTPresetStore_registerDependenciesForPreset_previouslyRegisteredPresets___block_invoke_2;
    v11[3] = &unk_1EA61D6E0;
    v11[4] = self;
    v12 = v8;
    v13 = v9;
    objc_msgSend(v12, "enumeratePresetSpecificPresetDependencies:", v11);

  }
}

void __76__AVTPresetStore_registerDependenciesForPreset_previouslyRegisteredPresets___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  AVTPresetStoreDependency *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  AVTPresetStoreDependency *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 8 * a2 + 648);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (AVTPresetStoreDependency *)v6;
  v8 = -[AVTPresetStoreDependency countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "overridePreset", (_QWORD)v15);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == v5)
        {
          objc_msgSend(v12, "addConditionOnPreset:", *(_QWORD *)(a1 + 40));
          v14 = v7;
          goto LABEL_11;
        }
      }
      v9 = -[AVTPresetStoreDependency countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }

  v14 = -[AVTPresetStoreDependency initWithOverridePreset:conditionedOnPreset:]([AVTPresetStoreDependency alloc], "initWithOverridePreset:conditionedOnPreset:", v5, *(_QWORD *)(a1 + 40));
  -[AVTPresetStoreDependency addObject:](v7, "addObject:", v14);
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 968);
  objc_msgSend(*(id *)(a1 + 32), "registerDependenciesForPreset:previouslyRegisteredPresets:", v5, *(_QWORD *)(a1 + 48));
LABEL_11:

}

void __76__AVTPresetStore_registerDependenciesForPreset_previouslyRegisteredPresets___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  AVTPresetStoreDependency *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  AVTPresetStoreDependency *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = *(id *)(*(_QWORD *)(a1 + 32) + 8 * a2 + 648);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = (AVTPresetStoreDependency *)v9;
  v11 = -[AVTPresetStoreDependency countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v15, "overridePreset", (_QWORD)v18);
        v16 = (id)objc_claimAutoreleasedReturnValue();

        if (v16 == v8)
        {
          objc_msgSend(v15, "addConditionOnPreset:forSpecificPresetIdentifier:", *(_QWORD *)(a1 + 40), v7);
          v17 = v10;
          goto LABEL_11;
        }
      }
      v12 = -[AVTPresetStoreDependency countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v12)
        continue;
      break;
    }
  }

  v17 = -[AVTPresetStoreDependency initWithOverridePreset:conditionedOnPreset:forSpecificPresetIdentifier:]([AVTPresetStoreDependency alloc], "initWithOverridePreset:conditionedOnPreset:forSpecificPresetIdentifier:", v8, *(_QWORD *)(a1 + 40), v7);
  -[AVTPresetStoreDependency addObject:](v10, "addObject:", v17);
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 968);
  objc_msgSend(*(id *)(a1 + 32), "registerDependenciesForPreset:previouslyRegisteredPresets:", v8, *(_QWORD *)(a1 + 48));
LABEL_11:

}

- (unint64_t)solveDependencies
{
  uint64_t v3;
  AVTPreset **resolvedPresets;
  id v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  NSObject *v10;
  unint64_t v11;
  int64x2_t v12;
  int8x16_t v13;
  uint64x2_t v14;
  int64x2_t v15;
  uint64_t k;
  int8x16_t v18;
  _OWORD v19[20];
  uint64_t v20;

  v3 = 0;
  v20 = *MEMORY[0x1E0C80C00];
  memset(v19, 0, sizeof(v19));
  resolvedPresets = self->_resolvedPresets;
  self->_unresolvedDependencyCount = 0;
  do
  {
    objc_storeStrong((id *)((char *)v19 + v3 * 8), self->_resolvedPresets[v3]);
    objc_storeStrong((id *)&self->_resolvedPresets[v3], self->_presets[v3]);
    -[NSMutableArray removeAllObjects](self->_unresolvedDependencies[v3++], "removeAllObjects");
  }
  while (v3 != 40);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  for (i = 8; i != 328; i += 8)
  {
    v7 = *(uint64_t *)((char *)&self->super.isa + i);
    if (v7)
      -[AVTPresetStore registerDependenciesForPreset:previouslyRegisteredPresets:](self, "registerDependenciesForPreset:previouslyRegisteredPresets:", v7, v5);
  }
  v8 = 0;
  while (self->_unresolvedDependencyCount)
  {
    for (j = 0; j != 40; ++j)
      -[AVTPresetStore solveDependenciesForCategory:](self, "solveDependenciesForCategory:", j);
    if (++v8 == 5)
    {
      avt_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[AVTPresetStore solveDependencies].cold.1(v10);

      break;
    }
  }
  v11 = 0;
  v12 = (int64x2_t)xmmword_1DD269F90;
  v13 = 0uLL;
  v14 = (uint64x2_t)vdupq_n_s64(1uLL);
  v15 = vdupq_n_s64(2uLL);
  do
  {
    v13 = vorrq_s8(vbicq_s8((int8x16_t)vshlq_u64(v14, (uint64x2_t)v12), (int8x16_t)vceqq_s64((int64x2_t)v19[v11 / 2], *(int64x2_t *)&resolvedPresets[v11])), v13);
    v12 = vaddq_s64(v12, v15);
    v11 += 2;
  }
  while (v11 != 40);
  v18 = v13;

  for (k = 312; k != -8; k -= 8)
  return (unint64_t)vorr_s8(*(int8x8_t *)v18.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v18, v18, 8uLL));
}

- (void)solveDependenciesForCategory:(int64_t)a3
{
  int64_t v3;
  AVTPresetStore *v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  void *v7;
  uint64_t i;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v14;
  AVTPreset *v15;
  AVTPreset *v16;
  _BOOL4 v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  uint64_t v34;
  void *v35;
  void *v36;
  objc_class *v37;
  unint64_t v38;
  void *v39;
  objc_class *v40;
  void *v41;
  NSObject *v42;
  Class *v43;
  Class v44;
  objc_class *v45;
  void *v46;
  void *v47;
  void *v48;
  NSMutableArray *v49;
  int64_t v50;
  NSMutableArray *v51;
  AVTPresetStore *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  AVTPreset **presets;
  AVTPreset **resolvedPresets;
  void *v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[8];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v3 = a3;
  v4 = self;
  v73 = *MEMORY[0x1E0C80C00];
  v5 = self->_unresolvedDependencies[a3];
  if (!-[NSMutableArray count](v5, "count"))
    goto LABEL_69;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v6 = v5;
  v49 = v5;
  v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
  v7 = 0;
  if (!v54)
  {
    v47 = 0;
    v48 = 0;
    goto LABEL_57;
  }
  v47 = 0;
  v48 = 0;
  v52 = v4;
  v53 = *(_QWORD *)v67;
  presets = v4->_presets;
  resolvedPresets = v4->_resolvedPresets;
  v50 = v3;
  v51 = v6;
  do
  {
    for (i = 0; i != v54; ++i)
    {
      if (*(_QWORD *)v67 != v53)
        objc_enumerationMutation(v6);
      *(_QWORD *)buf = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i);
      objc_msgSend(v7, "removeAllObjects", v47);
      objc_msgSend(*(id *)buf, "conditions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v9, "count");
      if (!v60)
      {
        v34 = objc_msgSend(v7, "count");
        goto LABEL_46;
      }
      v55 = i;
      v10 = 0;
      v11 = 0;
      v59 = v9;
      do
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
        v65 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "presetOfOtherCategory");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "category");

        v14 = -[AVTPresetStore hasUnresolvedDependenciesForCategory:](v4, "hasUnresolvedDependenciesForCategory:", v13);
        if (v14)
        {
LABEL_10:
          v10 |= !v14;
          goto LABEL_35;
        }
        objc_msgSend(v65, "presetOfOtherCategory");
        v15 = (AVTPreset *)objc_claimAutoreleasedReturnValue();
        v16 = resolvedPresets[v13];

        if (v15 == v16)
        {
          objc_msgSend(v65, "specificPresetIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v9 = v59;
          if (!v19)
            goto LABEL_10;
          objc_msgSend(v65, "specificPresetIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVTPreset identifier](presets[v3], "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v20, "isEqualToString:", v21);

          v23 = -[NSMutableArray count](v6, "count");
          v17 = v23 != 1;
          if (v23 == 1)
            v18 = v22;
          else
            v18 = 1;
          if (v23 != 1 && (v22 & 1) == 0)
          {
            v63 = 0u;
            v64 = 0u;
            v61 = 0u;
            v62 = 0u;
            v24 = v6;
            v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
            if (v25)
            {
              v26 = v25;
              v56 = v7;
              v27 = *(_QWORD *)v62;
              while (2)
              {
                for (j = 0; j != v26; ++j)
                {
                  if (*(_QWORD *)v62 != v27)
                    objc_enumerationMutation(v24);
                  v29 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
                  if (v29 != *(void **)buf)
                  {
                    objc_msgSend(v65, "specificPresetIdentifier");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "overridePreset");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "identifier");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    v33 = objc_msgSend(v30, "isEqualToString:", v32);

                    if ((v33 & 1) != 0)
                    {
                      v17 = 1;
                      goto LABEL_38;
                    }
                  }
                }
                v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
                if (v26)
                  continue;
                break;
              }
              v17 = 0;
LABEL_38:
              v6 = v51;
              v4 = v52;
              v3 = v50;
              v7 = v56;
            }
            else
            {
              v17 = 0;
            }

            v18 = v17;
          }
        }
        else
        {
          v17 = 0;
          v18 = 0;
        }
        if (v17 || (v18 & 1) != 0)
        {
          v10 |= !v17;
          v9 = v59;
        }
        else
        {
          v9 = v59;
          if (v7)
            objc_msgSend(v7, "addObject:", v65);
          else
            v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", &v65, 1);
        }
LABEL_35:

        ++v11;
      }
      while (v11 != v60);
      v34 = objc_msgSend(v7, "count");
      if ((v10 & 1) == 0)
      {
        v5 = v49;
        i = v55;
LABEL_46:
        if (v34 == v60)
        {
          if (v48)
            objc_msgSend(v48, "addObject:", *(_QWORD *)buf);
          else
            v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", buf, 1);
        }
        else
        {
          objc_msgSend(v9, "removeObjectsInArray:", v7);
        }
        goto LABEL_53;
      }
      if (v47)
        objc_msgSend(v47, "addObject:", *(_QWORD *)buf);
      else
        v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", buf, 1);
      v5 = v49;
      i = v55;
LABEL_53:

    }
    v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
  }
  while (v54);
LABEL_57:

  v35 = v47;
  if (objc_msgSend(v47, "count"))
  {
    objc_msgSend(v47, "firstObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "overridePreset");
    v37 = (objc_class *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v47, "count") >= 2)
    {
      v38 = 1;
      do
      {
        objc_msgSend(v35, "objectAtIndexedSubscript:", v38, v47);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "overridePreset");
        v40 = (objc_class *)objc_claimAutoreleasedReturnValue();

        if (v37 != v40)
        {
          v41 = v7;
          avt_default_log();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            -[AVTPresetStore solveDependenciesForCategory:].cold.1(buf, &buf[4], v42);

          v7 = v41;
        }

        ++v38;
        v35 = v47;
      }
      while (v38 < objc_msgSend(v47, "count"));
    }
    v43 = &v4->super.isa + v3;
    v44 = v43[41];
    v43[41] = v37;
    v45 = v37;

    v4->_unresolvedDependencyCount -= -[NSMutableArray count](v6, "count");
    -[NSMutableArray removeAllObjects](v6, "removeAllObjects");

    v46 = v48;
    v5 = v49;
  }
  else
  {
    v46 = v48;
    if (objc_msgSend(v48, "count"))
    {
      v4->_unresolvedDependencyCount -= objc_msgSend(v48, "count");
      -[NSMutableArray removeObjectsInArray:](v6, "removeObjectsInArray:", v48);
    }
  }

LABEL_69:
}

- (void).cxx_destruct
{
  uint64_t v3;
  NSMutableArray **v4;
  uint64_t i;

  v3 = 0;
  v4 = &self->_unresolvedDependencies[39];
  do
    objc_storeStrong((id *)&v4[v3--], 0);
  while (v3 != -40);
  for (i = 640; i != 320; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
    i -= 8;
  }
  while (i);
}

- (void)solveDependencies
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD1FA000, log, OS_LOG_TYPE_ERROR, "Error: Unreachable code: Failed to resolve dependencies in a fair number of steps!", v1, 2u);
}

- (void)solveDependenciesForCategory:(os_log_t)log .cold.1(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "overridePreset == otherOverridePreset";
  _os_log_error_impl(&dword_1DD1FA000, log, OS_LOG_TYPE_ERROR, "Error: Condition '%s' failed. Two resolved dependencies disagree on the resolved preset!", buf, 0xCu);
}

@end
