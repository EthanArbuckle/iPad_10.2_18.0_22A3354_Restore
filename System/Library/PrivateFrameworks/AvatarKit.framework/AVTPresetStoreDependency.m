@implementation AVTPresetStoreDependency

- (AVTPresetStoreDependency)initWithOverridePreset:(id)a3 conditionedOnPreset:(id)a4
{
  id v7;
  id v8;
  AVTPresetStoreDependency *v9;
  uint64_t v10;
  NSMutableArray *conditions;
  AVTPresetStoreDependencyCondition *v13;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVTPresetStoreDependency;
  v9 = -[AVTPresetStoreDependency init](&v14, sel_init);
  if (v9)
  {
    v13 = objc_alloc_init(AVTPresetStoreDependencyCondition);
    -[AVTPresetStoreDependencyCondition setPresetOfOtherCategory:](v13, "setPresetOfOtherCategory:", v8);
    objc_storeStrong((id *)&v9->_overridePreset, a3);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", &v13, 1);
    conditions = v9->_conditions;
    v9->_conditions = (NSMutableArray *)v10;

  }
  return v9;
}

- (AVTPresetStoreDependency)initWithOverridePreset:(id)a3 conditionedOnPreset:(id)a4 forSpecificPresetIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  AVTPresetStoreDependency *v12;
  uint64_t v13;
  NSMutableArray *conditions;
  AVTPresetStoreDependencyCondition *v16;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AVTPresetStoreDependency;
  v12 = -[AVTPresetStoreDependency init](&v17, sel_init);
  if (v12)
  {
    v16 = objc_alloc_init(AVTPresetStoreDependencyCondition);
    -[AVTPresetStoreDependencyCondition setPresetOfOtherCategory:](v16, "setPresetOfOtherCategory:", v10);
    -[AVTPresetStoreDependencyCondition setSpecificPresetIdentifier:](v16, "setSpecificPresetIdentifier:", v11);
    objc_storeStrong((id *)&v12->_overridePreset, a3);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", &v16, 1);
    conditions = v12->_conditions;
    v12->_conditions = (NSMutableArray *)v13;

  }
  return v12;
}

- (void)addConditionOnPreset:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_conditions;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "presetOfOtherCategory", (_QWORD)v13);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if (v11 == v4)
        {
          objc_msgSend(v10, "specificPresetIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
            goto LABEL_12;
        }
        else
        {

        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v5 = objc_alloc_init(AVTPresetStoreDependencyCondition);
  -[NSMutableArray setPresetOfOtherCategory:](v5, "setPresetOfOtherCategory:", v4);
  -[NSMutableArray addObject:](self->_conditions, "addObject:", v5);
LABEL_12:

}

- (void)addConditionOnPreset:(id)a3 forSpecificPresetIdentifier:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = self->_conditions;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "presetOfOtherCategory", (_QWORD)v17);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        if (v14 == v6)
        {
          objc_msgSend(v13, "specificPresetIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v7);

          if ((v16 & 1) != 0)
            goto LABEL_12;
        }
        else
        {

        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v8 = objc_alloc_init(AVTPresetStoreDependencyCondition);
  -[NSMutableArray setPresetOfOtherCategory:](v8, "setPresetOfOtherCategory:", v6);
  -[NSMutableArray setSpecificPresetIdentifier:](v8, "setSpecificPresetIdentifier:", v7);
  -[NSMutableArray addObject:](self->_conditions, "addObject:", v8);
LABEL_12:

}

- (AVTPreset)overridePreset
{
  return self->_overridePreset;
}

- (void)setOverridePreset:(id)a3
{
  objc_storeStrong((id *)&self->_overridePreset, a3);
}

- (NSMutableArray)conditions
{
  return self->_conditions;
}

- (void)setConditions:(id)a3
{
  objc_storeStrong((id *)&self->_conditions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditions, 0);
  objc_storeStrong((id *)&self->_overridePreset, 0);
}

@end
