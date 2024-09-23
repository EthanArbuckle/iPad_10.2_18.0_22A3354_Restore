@implementation NTKFaceConfiguration

- (NTKFaceConfiguration)init
{
  NTKFaceConfiguration *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *complications;
  NSMutableDictionary *v5;
  NSMutableDictionary *editModeConfigurations;
  NSMutableDictionary *v7;
  NSMutableDictionary *metrics;
  NSMutableDictionary *v9;
  NSMutableDictionary *customData;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NTKFaceConfiguration;
  v2 = -[NTKFaceConfiguration init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    complications = v2->_complications;
    v2->_complications = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    editModeConfigurations = v2->_editModeConfigurations;
    v2->_editModeConfigurations = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    metrics = v2->_metrics;
    v2->_metrics = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    customData = v2->_customData;
    v2->_customData = v9;

    *(_QWORD *)&v2->_complicationsLock._os_unfair_lock_opaque = 0;
    *(_QWORD *)&v2->_metricsLock._os_unfair_lock_opaque = 0;
    *(_QWORD *)&v2->_cachedDescriptionLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)complicationForSlot:(id)a3
{
  os_unfair_lock_s *p_complicationsLock;
  id v5;
  void *v6;

  p_complicationsLock = &self->_complicationsLock;
  v5 = a3;
  os_unfair_lock_lock(p_complicationsLock);
  -[NSMutableDictionary objectForKey:](self->_complications, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_complicationsLock);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_customData, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_editModeConfigurations, 0);
  objc_storeStrong((id *)&self->_complications, 0);
}

- (id)optionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  os_unfair_lock_s *p_editModeConfigurationsLock;
  id v7;
  NSMutableDictionary *editModeConfigurations;
  void *v9;
  void *v10;
  void *v11;

  p_editModeConfigurationsLock = &self->_editModeConfigurationsLock;
  v7 = a4;
  os_unfair_lock_lock(p_editModeConfigurationsLock);
  editModeConfigurations = self->_editModeConfigurations;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](editModeConfigurations, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "editOptionForSlot:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_editModeConfigurationsLock);
  return v11;
}

- (void)setOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8;
  NSMutableDictionary *editModeConfigurations;
  void *v10;
  NTKEditModeConfiguration *v11;
  NSMutableDictionary *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a5;
  os_unfair_lock_lock(&self->_editModeConfigurationsLock);
  editModeConfigurations = self->_editModeConfigurations;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](editModeConfigurations, "objectForKey:", v10);
  v11 = (NTKEditModeConfiguration *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v11 = objc_alloc_init(NTKEditModeConfiguration);
    v12 = self->_editModeConfigurations;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v11, v13);

  }
  -[NTKEditModeConfiguration setEditOption:forSlot:](v11, "setEditOption:forSlot:", v14, v8);
  -[NTKFaceConfiguration _invalidateDescription](self, "_invalidateDescription");
  os_unfair_lock_unlock(&self->_editModeConfigurationsLock);

}

- (void)setComplication:(id)a3 forSlot:(id)a4
{
  id v6;
  NSMutableDictionary *complications;
  id v8;

  v8 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_complicationsLock);
  complications = self->_complications;
  if (v8)
    -[NSMutableDictionary setObject:forKey:](complications, "setObject:forKey:", v8, v6);
  else
    -[NSMutableDictionary removeObjectForKey:](complications, "removeObjectForKey:", v6);

  -[NTKFaceConfiguration _invalidateDescription](self, "_invalidateDescription");
  os_unfair_lock_unlock(&self->_complicationsLock);

}

- (id)description
{
  os_unfair_lock_s *p_descriptionLock;
  NSString *v4;

  p_descriptionLock = &self->_descriptionLock;
  os_unfair_lock_lock(&self->_descriptionLock);
  os_unfair_lock_lock(&self->_cachedDescriptionLock);
  v4 = self->_cachedDescription;
  os_unfair_lock_unlock(&self->_cachedDescriptionLock);
  if (!v4)
  {
    -[NTKFaceConfiguration validationString](self, "validationString");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&self->_cachedDescriptionLock);
    objc_storeStrong((id *)&self->_cachedDescription, v4);
    os_unfair_lock_unlock(&self->_cachedDescriptionLock);
  }
  os_unfair_lock_unlock(p_descriptionLock);
  return v4;
}

- (void)_invalidateDescription
{
  os_unfair_lock_s *p_cachedDescriptionLock;
  NSString *cachedDescription;

  p_cachedDescriptionLock = &self->_cachedDescriptionLock;
  os_unfair_lock_lock(&self->_cachedDescriptionLock);
  cachedDescription = self->_cachedDescription;
  self->_cachedDescription = 0;

  os_unfair_lock_unlock(p_cachedDescriptionLock);
}

- (id)validationString
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  uint64_t *v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_resourceDirectoryExists)
    objc_msgSend(v3, "appendString:", CFSTR("resource-directory "));
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v5 = (void *)MEMORY[0x1BCCA7FA8]();
  v6 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __40__NTKFaceConfiguration_validationString__block_invoke;
  v26[3] = &unk_1E6BD95F0;
  v28 = &v29;
  v7 = v4;
  v27 = v7;
  -[NTKFaceConfiguration _enumerateEditModeConfigurationsWithBlock:](self, "_enumerateEditModeConfigurationsWithBlock:", v26);

  objc_autoreleasePoolPop(v5);
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v8 = (void *)MEMORY[0x1BCCA7FA8]();
  v19[0] = v6;
  v19[1] = 3221225472;
  v19[2] = __40__NTKFaceConfiguration_validationString__block_invoke_2;
  v19[3] = &unk_1E6BD9618;
  v21 = &v22;
  v9 = v7;
  v20 = v9;
  -[NTKFaceConfiguration _enumerateComplicationsWithBlock:](self, "_enumerateComplicationsWithBlock:", v19);
  if (*((_BYTE *)v23 + 24))
    objc_msgSend(v9, "appendString:", CFSTR(">"));

  objc_autoreleasePoolPop(v8);
  *((_BYTE *)v30 + 24) = 0;
  v10 = (void *)MEMORY[0x1BCCA7FA8]();
  v13 = v6;
  v14 = 3221225472;
  v15 = __40__NTKFaceConfiguration_validationString__block_invoke_3;
  v16 = &unk_1E6BD9640;
  v18 = &v29;
  v11 = v9;
  v17 = v11;
  -[NTKFaceConfiguration _enumerateCustomDataWithBlock:](self, "_enumerateCustomDataWithBlock:", &v13);
  if (*((_BYTE *)v30 + 24))
    objc_msgSend(v11, "appendString:", CFSTR(">"), v13, v14, v15, v16);

  objc_autoreleasePoolPop(v10);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v29, 8);
  return v11;
}

void __40__NTKFaceConfiguration_validationString__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v4 + 24))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
  else
    *(_BYTE *)(v4 + 24) = 1;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v7, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@"), v6);

}

void __40__NTKFaceConfiguration_validationString__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  int v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v7 = a3;
  v8 = a2;
  if (v6)
  {
    objc_msgSend(v5, "appendString:", CFSTR(", "));
  }
  else
  {
    objc_msgSend(v5, "appendString:", CFSTR(" <"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@:%@"), v8, v7);

}

void __40__NTKFaceConfiguration_validationString__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  __CFString *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(v6, "appendString:", CFSTR(", "));
  }
  else
  {
    objc_msgSend(v6, "appendString:", CFSTR(" custom-data<"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "description");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("#");
  }
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@:%@"), v8, v7);

}

- (void)appendEditModesToDailySnapshotKey:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__NTKFaceConfiguration_appendEditModesToDailySnapshotKey___block_invoke;
  v6[3] = &unk_1E6BD9668;
  v7 = v4;
  v5 = v4;
  -[NTKFaceConfiguration _enumerateEditModeConfigurationsWithBlock:](self, "_enumerateEditModeConfigurationsWithBlock:", v6);

}

void __58__NTKFaceConfiguration_appendEditModesToDailySnapshotKey___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;

  objc_msgSend(a3, "dailySnapshotKey");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1E6BDC918;
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("(%@)"), v7);
}

- (void)appendCustomDataToDailySnapshotKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NTKFaceConfiguration customData](self, "customData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v5, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v4, "appendFormat:", CFSTR("(%@)"), v10);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v10, "stringValue");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "appendFormat:", CFSTR("(%@)"), v11);

          }
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (id)metricForKey:(id)a3
{
  os_unfair_lock_s *p_metricsLock;
  id v5;
  void *v6;

  p_metricsLock = &self->_metricsLock;
  v5 = a3;
  os_unfair_lock_lock(p_metricsLock);
  -[NSMutableDictionary objectForKey:](self->_metrics, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_metricsLock);
  return v6;
}

- (void)setMetric:(id)a3 forKey:(id)a4
{
  os_unfair_lock_s *p_metricsLock;
  id v7;
  id v8;

  p_metricsLock = &self->_metricsLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_metricsLock);
  -[NSMutableDictionary setObject:forKey:](self->_metrics, "setObject:forKey:", v8, v7);

  -[NTKFaceConfiguration _invalidateDescription](self, "_invalidateDescription");
  os_unfair_lock_unlock(p_metricsLock);
}

- (void)incrementMetricForKey:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  os_unfair_lock_lock(&self->_metricsLock);
  -[NSMutableDictionary objectForKey:](self->_metrics, "objectForKey:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "integerValue") + 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_metrics, "setObject:forKey:", v5, v6);

  }
  else if (!v4)
  {
    -[NSMutableDictionary setObject:forKey:](self->_metrics, "setObject:forKey:", &unk_1E6CA1788, v6);
  }
  -[NTKFaceConfiguration _invalidateDescription](self, "_invalidateDescription");
  os_unfair_lock_unlock(&self->_metricsLock);

}

- (void)setMetricsFromConfiguration:(id)a3
{
  os_unfair_lock_s *p_metricsLock;
  id *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *metrics;

  p_metricsLock = &self->_metricsLock;
  v6 = (id *)a3;
  os_unfair_lock_lock(p_metricsLock);
  if (a3)
    v7 = (NSMutableDictionary *)v6[3];
  else
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  metrics = self->_metrics;
  self->_metrics = v7;

  -[NTKFaceConfiguration _invalidateDescription](self, "_invalidateDescription");
  os_unfair_lock_unlock(p_metricsLock);
}

- (void)clearMetrics
{
  os_unfair_lock_s *p_metricsLock;

  p_metricsLock = &self->_metricsLock;
  os_unfair_lock_lock(&self->_metricsLock);
  -[NSMutableDictionary removeAllObjects](self->_metrics, "removeAllObjects");
  -[NTKFaceConfiguration _invalidateDescription](self, "_invalidateDescription");
  os_unfair_lock_unlock(p_metricsLock);
}

- (void)_enumerateEditModeConfigurationsWithBlock:(id)a3
{
  void (**v4)(id, uint64_t, void *, _BYTE *);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  char v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, void *, _BYTE *))a3;
  -[NTKFaceConfiguration editModeConfigurations](self, "editModeConfigurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
      v14 = objc_msgSend(v13, "integerValue", (_QWORD)v16);
      objc_msgSend(v5, "objectForKey:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v14, v15, &v20);

      if (v20)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)_enumerateCustomDataWithBlock:(id)a3
{
  void (**v4)(id, uint64_t, void *, char *);
  os_unfair_lock_s *p_customDataLock;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  char v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, void *, char *))a3;
  p_customDataLock = &self->_customDataLock;
  os_unfair_lock_lock(&self->_customDataLock);
  v6 = (void *)-[NSMutableDictionary copy](self->_customData, "copy");
  os_unfair_lock_unlock(p_customDataLock);
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v12)
        objc_enumerationMutation(v9);
      v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13);
      objc_msgSend(v6, "objectForKeyedSubscript:", v14, (_QWORD)v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v14, v15, &v20);

      if (v20)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)_enumerateComplicationsWithBlock:(id)a3
{
  void (**v4)(id, uint64_t, void *, char *);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, void *, char *))a3;
  -[NTKFaceConfiguration complications](self, "complications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v11)
        objc_enumerationMutation(v8);
      v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12);
      objc_msgSend(v5, "objectForKey:", v13, (_QWORD)v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v13, v14, &v19);

      if (v19)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, void *);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setName:", self->_name);
  objc_msgSend(v4, "setResourceDirectoryExists:", self->_resourceDirectoryExists);
  os_unfair_lock_lock(&self->_metricsLock);
  v5 = -[NSMutableDictionary mutableCopy](self->_metrics, "mutableCopy");
  v6 = (void *)v4[3];
  v4[3] = v5;

  os_unfair_lock_unlock(&self->_metricsLock);
  os_unfair_lock_lock(&self->_customDataLock);
  v7 = -[NSMutableDictionary mutableCopy](self->_customData, "mutableCopy");
  v8 = (void *)v4[4];
  v4[4] = v7;

  os_unfair_lock_unlock(&self->_customDataLock);
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __37__NTKFaceConfiguration_copyWithZone___block_invoke;
  v20[3] = &unk_1E6BD0B18;
  v10 = v4;
  v21 = v10;
  -[NTKFaceConfiguration _enumerateComplicationsWithBlock:](self, "_enumerateComplicationsWithBlock:", v20);
  v15 = v9;
  v16 = 3221225472;
  v17 = __37__NTKFaceConfiguration_copyWithZone___block_invoke_2;
  v18 = &unk_1E6BD9668;
  v11 = v10;
  v19 = v11;
  -[NTKFaceConfiguration _enumerateEditModeConfigurationsWithBlock:](self, "_enumerateEditModeConfigurationsWithBlock:", &v15);
  objc_msgSend(v11, "_invalidateDescription", v15, v16, v17, v18);
  v12 = v19;
  v13 = v11;

  return v13;
}

uint64_t __37__NTKFaceConfiguration_copyWithZone___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setComplication:forSlot:", a3, a2);
}

void __37__NTKFaceConfiguration_copyWithZone___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__NTKFaceConfiguration_copyWithZone___block_invoke_3;
  v7[3] = &unk_1E6BD4DB0;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v10 = a2;
  v6 = v5;
  objc_msgSend(v6, "enumerateSlotsWithBlock:", v7);

}

void __37__NTKFaceConfiguration_copyWithZone___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)a1[4];
  v4 = (void *)a1[5];
  v5 = a2;
  objc_msgSend(v4, "editOptionForSlot:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOption:forCustomEditMode:slot:", v6, a1[6], v5);

}

- (id)complications
{
  os_unfair_lock_s *p_complicationsLock;
  void *v4;

  p_complicationsLock = &self->_complicationsLock;
  os_unfair_lock_lock(&self->_complicationsLock);
  v4 = (void *)-[NSMutableDictionary copy](self->_complications, "copy");
  os_unfair_lock_unlock(p_complicationsLock);
  return v4;
}

- (id)editModeConfigurations
{
  os_unfair_lock_s *p_editModeConfigurationsLock;
  void *v4;

  p_editModeConfigurationsLock = &self->_editModeConfigurationsLock;
  os_unfair_lock_lock(&self->_editModeConfigurationsLock);
  v4 = (void *)-[NSMutableDictionary copy](self->_editModeConfigurations, "copy");
  os_unfair_lock_unlock(p_editModeConfigurationsLock);
  return v4;
}

- (id)metrics
{
  os_unfair_lock_s *p_metricsLock;
  void *v4;

  p_metricsLock = &self->_metricsLock;
  os_unfair_lock_lock(&self->_metricsLock);
  v4 = (void *)-[NSMutableDictionary copy](self->_metrics, "copy");
  os_unfair_lock_unlock(p_metricsLock);
  return v4;
}

- (id)customData
{
  os_unfair_lock_s *p_customDataLock;
  void *v4;

  p_customDataLock = &self->_customDataLock;
  os_unfair_lock_lock(&self->_customDataLock);
  v4 = (void *)-[NSMutableDictionary copy](self->_customData, "copy");
  os_unfair_lock_unlock(p_customDataLock);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void **v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (void **)a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && NTKEqualObjects(self->_name, v4[10])
    && self->_resourceDirectoryExists == *((unsigned __int8 *)v4 + 72))
  {
    -[NTKFaceConfiguration metrics](self, "metrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (NTKEqualObjects(v5, v6))
    {
      -[NTKFaceConfiguration customData](self, "customData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "customData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (NTKEqualObjects(v7, v8))
      {
        -[NTKFaceConfiguration complications](self, "complications");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "complications");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (NTKEqualObjects(v9, v10))
        {
          -[NTKFaceConfiguration editModeConfigurations](self, "editModeConfigurations");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "editModeConfigurations");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = NTKEqualObjects(v11, v12);

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSUInteger v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;

  v3 = -[NSString hash](self->_name, "hash");
  -[NTKFaceConfiguration complications](self, "complications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[NTKFaceConfiguration editModeConfigurations](self, "editModeConfigurations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 + objc_msgSend(v6, "hash") + self->_resourceDirectoryExists + v3;
  -[NTKFaceConfiguration metrics](self, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[NTKFaceConfiguration customData](self, "customData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7 + v9 + objc_msgSend(v10, "hash");

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("Name"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_resourceDirectoryExists, CFSTR("ResourceDirectoryExists"));
  -[NTKFaceConfiguration metrics](self, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("Metrics"));

  -[NTKFaceConfiguration customData](self, "customData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("CustomData"));

  -[NTKFaceConfiguration editModeConfigurations](self, "editModeConfigurations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("EditModeConfigurations"));

  -[NTKFaceConfiguration complications](self, "complications");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v13, "mutableCopy");
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("Complications"));

}

- (NTKFaceConfiguration)initWithCoder:(id)a3
{
  id v4;
  NTKFaceConfiguration *v5;
  uint64_t v6;
  NSString *name;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *metrics;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSMutableDictionary *customData;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSMutableDictionary *editModeConfigurations;
  NSMutableDictionary *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSMutableDictionary *complications;
  NSMutableDictionary *v39;
  uint64_t v40;
  uint64_t v41;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)NTKFaceConfiguration;
  v5 = -[NTKFaceConfiguration init](&v43, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_resourceDirectoryExists = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ResourceDirectoryExists"));
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("Metrics"));
    v13 = objc_claimAutoreleasedReturnValue();
    metrics = v5->_metrics;
    v5->_metrics = (NSMutableDictionary *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("CustomData"));
    v19 = objc_claimAutoreleasedReturnValue();
    customData = v5->_customData;
    v5->_customData = (NSMutableDictionary *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("EditModeConfigurations"));
    v25 = objc_claimAutoreleasedReturnValue();
    editModeConfigurations = v5->_editModeConfigurations;
    v5->_editModeConfigurations = (NSMutableDictionary *)v25;

    v27 = v5->_editModeConfigurations;
    v28 = objc_opt_class();
    v29 = objc_opt_class();
    NTKValidateDictionary(v27, v28, v29);
    v30 = (void *)MEMORY[0x1E0C99E60];
    v31 = objc_opt_class();
    v32 = objc_opt_class();
    v33 = objc_opt_class();
    v34 = objc_opt_class();
    v35 = objc_opt_class();
    objc_msgSend(v30, "setWithObjects:", v31, v32, v33, v34, v35, objc_opt_class(), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("Complications"));
    v37 = objc_claimAutoreleasedReturnValue();
    complications = v5->_complications;
    v5->_complications = (NSMutableDictionary *)v37;

    v39 = v5->_complications;
    v40 = objc_opt_class();
    v41 = objc_opt_class();
    NTKValidateDictionary(v39, v40, v41);

  }
  return v5;
}

- (void)addConfigurationKeysToJSONDictionary:(id)a3 face:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD aBlock[4];
  id v33;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_name, CFSTR("face name"));
  if (self->_resourceDirectoryExists)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("resource directory"));

  }
  v9 = (void *)objc_opt_new();
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__NTKFaceConfiguration_addConfigurationKeysToJSONDictionary_face___block_invoke;
  aBlock[3] = &unk_1E6BD9690;
  v11 = v9;
  v33 = v11;
  v12 = _Block_copy(aBlock);
  -[NTKFaceConfiguration metrics](self, "metrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v10;
  v29[1] = 3221225472;
  v29[2] = __66__NTKFaceConfiguration_addConfigurationKeysToJSONDictionary_face___block_invoke_2;
  v29[3] = &unk_1E6BD96B8;
  v29[4] = self;
  v14 = v12;
  v31 = v14;
  v15 = v11;
  v30 = v15;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v29);

  if (objc_msgSend(v15, "count"))
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("metrics"));
  v26[0] = v10;
  v26[1] = 3221225472;
  v26[2] = __66__NTKFaceConfiguration_addConfigurationKeysToJSONDictionary_face___block_invoke_3;
  v26[3] = &unk_1E6BD96E0;
  v16 = (id)objc_opt_new();
  v27 = v16;
  v17 = v7;
  v28 = v17;
  -[NTKFaceConfiguration _enumerateEditModeConfigurationsWithBlock:](self, "_enumerateEditModeConfigurationsWithBlock:", v26);
  if (objc_msgSend(v16, "count"))
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("customization"));
  v24[0] = v10;
  v24[1] = 3221225472;
  v24[2] = __66__NTKFaceConfiguration_addConfigurationKeysToJSONDictionary_face___block_invoke_4;
  v24[3] = &unk_1E6BD0B18;
  v18 = (id)objc_opt_new();
  v25 = v18;
  -[NTKFaceConfiguration _enumerateComplicationsWithBlock:](self, "_enumerateComplicationsWithBlock:", v24);
  if (objc_msgSend(v18, "count"))
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("complications"));
  v19 = (void *)objc_opt_new();
  -[NTKFaceConfiguration customData](self, "customData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = __66__NTKFaceConfiguration_addConfigurationKeysToJSONDictionary_face___block_invoke_5;
  v22[3] = &unk_1E6BD9708;
  v21 = v19;
  v23 = v21;
  objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v22);

  if (objc_msgSend(v21, "count"))
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("customData"));

}

void __66__NTKFaceConfiguration_addConfigurationKeysToJSONDictionary_face___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "timeIntervalSince1970");
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, v8);

  }
}

void __66__NTKFaceConfiguration_addConfigurationKeysToJSONDictionary_face___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v8 = a2;
  objc_msgSend(v5, "_dateMetricsKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "containsObject:", v8);

  if ((_DWORD)v5)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v8);

}

void __66__NTKFaceConfiguration_addConfigurationKeysToJSONDictionary_face___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  NTKFaceBundleStringFromCustomEditMode(a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "JSONObjectRepresentationForFace:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);
}

void __66__NTKFaceConfiguration_addConfigurationKeysToJSONDictionary_face___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_msgSend(a3, "JSONObjectRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  NTKFaceBundleStringFromComplicationSlot(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);
}

uint64_t __66__NTKFaceConfiguration_addConfigurationKeysToJSONDictionary_face___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a3, a2);
}

- (NTKFaceConfiguration)initWithJSONDictionary:(id)a3 editModeMapping:(id)a4 forDevice:(id)a5
{
  id v8;
  id v9;
  id v10;
  NTKFaceConfiguration *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[NTKFaceConfiguration init](self, "init");
  if (v11)
  {
    v25 = v10;
    v26 = v9;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("face name"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[NTKFaceConfiguration initWithJSONDictionary:editModeMapping:forDevice:].cold.6();

        v12 = 0;
      }
    }
    objc_storeStrong((id *)&v11->_name, v12);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("resource directory"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[NTKFaceConfiguration initWithJSONDictionary:editModeMapping:forDevice:].cold.5();

      }
    }
    v11->_resourceDirectoryExists = objc_msgSend(v14, "BOOLValue");
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("metrics"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[NTKFaceConfiguration initWithJSONDictionary:editModeMapping:forDevice:].cold.1();

        v16 = 0;
      }
    }
    -[NTKFaceConfiguration _applyMetrics:](v11, "_applyMetrics:", v16);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("customData"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[NTKFaceConfiguration initWithJSONDictionary:editModeMapping:forDevice:].cold.1();

        v18 = 0;
      }
    }
    -[NTKFaceConfiguration _applyCustomData:](v11, "_applyCustomData:", v18);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("customization"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[NTKFaceConfiguration initWithJSONDictionary:editModeMapping:forDevice:].cold.1();

        v20 = 0;
      }
    }
    -[NTKFaceConfiguration _applyCustomizationDescription:editModeMapping:forDevice:](v11, "_applyCustomizationDescription:editModeMapping:forDevice:", v20, v26, v25);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("complications"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[NTKFaceConfiguration initWithJSONDictionary:editModeMapping:forDevice:].cold.1();

        v22 = 0;
      }
    }
    -[NTKFaceConfiguration _applyComplicationsDescription:](v11, "_applyComplicationsDescription:", v22);

    v10 = v25;
    v9 = v26;
  }

  return v11;
}

- (void)_applyCustomizationDescription:(id)a3 editModeMapping:(id)a4 forDevice:(id)a5
{
  __CFString *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NTKEditModeConfiguration *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *p_super;
  NSMutableDictionary *editModeConfigurations;
  void *v22;
  uint64_t v23;
  __int128 v24;
  id v25;
  id v26;
  __CFString *v27;
  os_unfair_lock_t lock;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const __CFString *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v26 = a4;
  v25 = a5;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v27 = v8;
  -[__CFString allKeys](v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v10)
  {
    lock = &self->_editModeConfigurationsLock;
    v12 = *(_QWORD *)v31;
    *(_QWORD *)&v11 = 138412802;
    v24 = v11;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v29 = 0;
          if (NTKFaceBundleGetCustomEditModeFromString(v14, &v29))
          {
            -[__CFString objectForKey:](v27, "objectForKey:", v14, v24);
            v15 = objc_claimAutoreleasedReturnValue();
            if (v29 == 10)
            {
              _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                v35 = v27;
                _os_log_debug_impl(&dword_1B72A3000, v16, OS_LOG_TYPE_DEBUG, "applying color option %{public}@", buf, 0xCu);
              }

              -[NTKFaceConfiguration colorEditModeConfigurationWithJsonRepresentation:editMode:editModeMapping:forDevice:](self, "colorEditModeConfigurationWithJsonRepresentation:editMode:editModeMapping:forDevice:", v15, v29, v26, v25);
              v17 = (NTKEditModeConfiguration *)objc_claimAutoreleasedReturnValue();
LABEL_19:
              p_super = &v17->super;
              os_unfair_lock_lock(lock);
              editModeConfigurations = self->_editModeConfigurations;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v29);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](editModeConfigurations, "setObject:forKeyedSubscript:", p_super, v22);

              -[NTKFaceConfiguration _invalidateDescription](self, "_invalidateDescription");
              os_unfair_lock_unlock(lock);
            }
            else
            {
              v19 = objc_msgSend(v26, "editOptionClassFromEditMode:resourceDirectoryExists:", v29, self->_resourceDirectoryExists);
              if (v19)
              {
                v17 = -[NTKEditModeConfiguration initWithJSONObjectRepresentation:editOptionClass:forDevice:]([NTKEditModeConfiguration alloc], "initWithJSONObjectRepresentation:editOptionClass:forDevice:", v15, v19, v25);
                goto LABEL_19;
              }
              _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
              p_super = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v35 = CFSTR("customization");
                v36 = 2112;
                v37 = v14;
                _os_log_error_impl(&dword_1B72A3000, p_super, OS_LOG_TYPE_ERROR, "Face bundle warning: invalid key in %@ dictionary: %@", buf, 0x16u);
              }
            }

          }
          else
          {
            _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v35 = CFSTR("customization");
              v36 = 2112;
              v37 = v14;
              _os_log_error_impl(&dword_1B72A3000, v15, OS_LOG_TYPE_ERROR, "Face bundle warning: invalid key in %@ dictionary: %@", buf, 0x16u);
            }
          }

          goto LABEL_22;
        }
        _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v35 = CFSTR("customization");
          v36 = 2112;
          v37 = v14;
          _os_log_error_impl(&dword_1B72A3000, v18, OS_LOG_TYPE_ERROR, "Face bundle warning: keys in %@ dictionary must be strings - invalid key: %@", buf, 0x16u);
        }

LABEL_22:
        ++v13;
      }
      while (v10 != v13);
      v23 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      v10 = v23;
    }
    while (v23);
  }

}

- (id)colorEditModeConfigurationWithJsonRepresentation:(id)a3 editMode:(int64_t)a4 editModeMapping:(id)a5 forDevice:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NTKEditModeConfiguration *v15;
  _QWORD aBlock[4];
  id v18;
  NTKFaceConfiguration *v19;
  int64_t v20;

  v10 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__NTKFaceConfiguration_colorEditModeConfigurationWithJsonRepresentation_editMode_editModeMapping_forDevice___block_invoke;
  aBlock[3] = &unk_1E6BD9730;
  v19 = self;
  v20 = a4;
  v18 = v10;
  v11 = v10;
  v12 = a6;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  v15 = -[NTKEditModeConfiguration initWithJSONObjectRepresentation:device:editOptionFactory:]([NTKEditModeConfiguration alloc], "initWithJSONObjectRepresentation:device:editOptionFactory:", v13, v12, v14);

  return v15;
}

id __108__NTKFaceConfiguration_colorEditModeConfigurationWithJsonRepresentation_editMode_editModeMapping_forDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "deviceSupportsPigmentEditOption");
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(void **)(a1 + 32);
  v10 = *(_BYTE *)(*(_QWORD *)(a1 + 40) + 72) != 0;
  if (v7)
  {
    v11 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v9, "editOptionClassFromEditMode:resourceDirectoryExists:", v8, v10)), "initWithJSONObjectRepresentation:forDevice:", v5, v6);
    if (!v11)
    {
      v12 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(*(id *)(a1 + 32), "legacyEditOptionClassFromCustomEditMode:resourceDirectoryExists:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 72))), "initWithJSONObjectRepresentation:forDevice:", v5, v6);
      if (objc_msgSend(v12, "conformsToProtocol:", &unk_1F8E91518))
      {
        objc_msgSend(v12, "pigmentEditOption");
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = v12;
      }
      v11 = v13;

    }
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v9, "editOptionClassFromEditMode:resourceDirectoryExists:", v8, v10)), "initWithJSONObjectRepresentation:forDevice:", v5, v6);
  }

  return v11;
}

- (void)_applyComplicationsDescription:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  BOOL ComplicationSlotFromString;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v14 = a3;
  objc_msgSend(v14, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = 0;
          ComplicationSlotFromString = NTKFaceBundleGetComplicationSlotFromString(v7, &v15);
          v9 = v15;
          if (ComplicationSlotFromString)
          {
            objc_msgSend(v14, "objectForKey:", v7);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            +[NTKComplication complicationWithJSONObjectRepresentation:](NTKComplication, "complicationWithJSONObjectRepresentation:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_complications, "setObject:forKeyedSubscript:", v11, v9);

          }
          else
          {
            _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v21 = CFSTR("complications");
              v22 = 2112;
              v23 = v7;
              _os_log_error_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_ERROR, "Face bundle warning: invalid key in %@ dictionary: %@", buf, 0x16u);
            }

          }
        }
        else
        {
          _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v21 = CFSTR("complications");
            v22 = 2112;
            v23 = v7;
            _os_log_error_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_ERROR, "Face bundle warning: keys in '%@' dictionary must be strings - invalid key: %@", buf, 0x16u);
          }
        }

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v4);
  }

}

- (void)_applyMetrics:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSMutableDictionary *v8;
  id v9;
  NSMutableDictionary *metrics;
  NSMutableDictionary *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  NTKFaceConfiguration *v16;
  NSMutableDictionary *v17;
  id v18;
  _QWORD aBlock[4];
  id v20;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_opt_new();
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __38__NTKFaceConfiguration__applyMetrics___block_invoke;
    aBlock[3] = &unk_1E6BD9690;
    v7 = v5;
    v20 = v7;
    v12 = v6;
    v13 = 3221225472;
    v14 = __38__NTKFaceConfiguration__applyMetrics___block_invoke_2;
    v15 = &unk_1E6BD96B8;
    v16 = self;
    v18 = _Block_copy(aBlock);
    v8 = (NSMutableDictionary *)v7;
    v17 = v8;
    v9 = v18;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v12);

    os_unfair_lock_lock(&self->_metricsLock);
    metrics = self->_metrics;
    self->_metrics = v8;
    v11 = v8;

    -[NTKFaceConfiguration _invalidateDescription](self, "_invalidateDescription", v12, v13, v14, v15, v16);
    os_unfair_lock_unlock(&self->_metricsLock);

  }
}

void __38__NTKFaceConfiguration__applyMetrics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "doubleValue");
    if (v6 > 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v8);

    }
  }

}

void __38__NTKFaceConfiguration__applyMetrics___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_dateMetricsKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v5);

  if (v8)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v5);
    }
    else
    {
      _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __38__NTKFaceConfiguration__applyMetrics___block_invoke_2_cold_1((uint64_t)v6, v9);

    }
  }

}

- (void)_applyCustomData:(id)a3
{
  os_unfair_lock_s *p_customDataLock;
  id v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *customData;

  p_customDataLock = &self->_customDataLock;
  v5 = a3;
  os_unfair_lock_lock(p_customDataLock);
  v6 = (NSMutableDictionary *)objc_msgSend(v5, "mutableCopy");

  customData = self->_customData;
  self->_customData = v6;

  -[NTKFaceConfiguration _invalidateDescription](self, "_invalidateDescription");
  os_unfair_lock_unlock(p_customDataLock);
}

- (id)_dateMetricsKeys
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("dateCreated");
  v3[1] = CFSTR("dateLastEdited");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)customDataForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NTKFaceConfiguration customData](self, "customData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setCustomData:(id)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *customData;
  id v8;

  v8 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_customDataLock);
  customData = self->_customData;
  if (v8)
    -[NSMutableDictionary setObject:forKey:](customData, "setObject:forKey:", v8, v6);
  else
    -[NSMutableDictionary removeObjectForKey:](customData, "removeObjectForKey:", v6);

  -[NTKFaceConfiguration _invalidateDescription](self, "_invalidateDescription");
  os_unfair_lock_unlock(&self->_customDataLock);

}

- (void)setCustomDataFromConfiguration:(id)a3
{
  os_unfair_lock_s *p_customDataLock;
  _QWORD *v5;
  uint64_t v6;

  p_customDataLock = &self->_customDataLock;
  v5 = a3;
  os_unfair_lock_lock(p_customDataLock);
  -[NSMutableDictionary removeAllObjects](self->_customData, "removeAllObjects");
  v6 = v5[4];

  if (v6)
    -[NSMutableDictionary addEntriesFromDictionary:](self->_customData, "addEntriesFromDictionary:", v6);
  -[NTKFaceConfiguration _invalidateDescription](self, "_invalidateDescription");
  os_unfair_lock_unlock(p_customDataLock);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)resourceDirectoryExists
{
  return self->_resourceDirectoryExists;
}

- (void)setResourceDirectoryExists:(BOOL)a3
{
  self->_resourceDirectoryExists = a3;
}

- (void)initWithJSONDictionary:editModeMapping:forDevice:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "Face bundle warning: value for '%@' must be a dictionary - invalid value: %@");
  OUTLINED_FUNCTION_1();
}

- (void)initWithJSONDictionary:editModeMapping:forDevice:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "Face bundle warning: value for '%@' must be a number - invalid value: %@");
  OUTLINED_FUNCTION_1();
}

- (void)initWithJSONDictionary:editModeMapping:forDevice:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "Face bundle warning: value for '%@' must be a string - invalid value: %@");
  OUTLINED_FUNCTION_1();
}

void __108__NTKFaceConfiguration_colorEditModeConfigurationWithJsonRepresentation_editMode_editModeMapping_forDevice___block_invoke_cold_1(uint64_t a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = *a2;
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, (uint64_t)a2, a3, "Could not create a color option with class %{public}@, %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

void __38__NTKFaceConfiguration__applyMetrics___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "Face metrics warning: allowableTypes does not contain metric:%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
