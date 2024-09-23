@implementation HKAccessibilityData

- (HKAccessibilityData)initWithPointData:(id)a3 accessibilitySpans:(id)a4
{
  id v7;
  id v8;
  HKAccessibilityData *v9;
  HKAccessibilityData *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKAccessibilityData;
  v9 = -[HKAccessibilityData init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessibilityPointData, a3);
    objc_storeStrong((id *)&v10->_accessibilitySpans, a4);
  }

  return v10;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HKChartAccessbilityData %p:"), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[HKAccessibilityData accessibilitySpans](self, "accessibilitySpans");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("  accessibilitySpans %lu"), objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[HKAccessibilityData accessibilitySpans](self, "accessibilitySpans");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v36;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v11);
        -[HKAccessibilityData accessibilitySpans](self, "accessibilitySpans");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "description");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("    key %@:"), v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v16);

        _IndentString(v15, 6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v17);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v9);
  }

  v18 = (void *)MEMORY[0x1E0CB3940];
  -[HKAccessibilityData accessibilityPointData](self, "accessibilityPointData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("  accessibilityPointData %lu"), objc_msgSend(v19, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v20);

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[HKAccessibilityData accessibilityPointData](self, "accessibilityPointData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v32;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v25), "description");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        _IndentString(v26, 4);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v27);

        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v23);
  }

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (NSArray)accessibilityPointData
{
  return self->_accessibilityPointData;
}

- (NSDictionary)accessibilitySpans
{
  return self->_accessibilitySpans;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilitySpans, 0);
  objc_storeStrong((id *)&self->_accessibilityPointData, 0);
}

@end
