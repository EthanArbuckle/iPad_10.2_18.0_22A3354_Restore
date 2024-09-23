@implementation JEImpressionDurationFilteringTreatmentAction

- (id)performAction:(id)a3 context:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSPredicate *filters;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)JEImpressionDurationFilteringTreatmentAction;
  -[JETreatmentAction performAction:context:](&v21, sel_performAction_context_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  if (v6)
  {
    v7 = (void *)objc_opt_new();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
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
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          filters = self->_filters;
          if (filters
            && !-[NSPredicate evaluateWithObject:](filters, "evaluateWithObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17))
          {
            objc_msgSend(v7, "addObject:", v13);
          }
          else
          {
            -[JEImpressionDurationFilteringTreatmentAction updatedImpression:](self, "updatedImpression:", v13, (_QWORD)v17);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
              objc_msgSend(v7, "addObject:", v15);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v10);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (JEImpressionDurationFilteringTreatmentAction)initWithField:(id)a3 configuration:(id)a4
{
  id v6;
  JEImpressionDurationFilteringTreatmentAction *v7;
  void *v8;
  JEImpressionDurationFilteringTreatmentAction *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSPredicate *filters;
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)JEImpressionDurationFilteringTreatmentAction;
  v7 = -[JETreatmentAction initWithField:configuration:](&v15, sel_initWithField_configuration_, a3, v6);
  if (!v7)
  {
LABEL_12:
    v9 = v7;
    goto LABEL_13;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("threshold"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  if (v9)
  {
    v7->_durationThreshold = -[JEImpressionDurationFilteringTreatmentAction longValue](v9, "longValue");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("filters"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      filters = v7->_filters;
      v7->_filters = (NSPredicate *)v12;

    }
    goto LABEL_12;
  }
LABEL_13:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filters, 0);
}

- (id)updatedImpression:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("viewedInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[JEImpressionDurationFilteringTreatmentAction filteredDurationArray:](self, "filteredDurationArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("viewedInfo"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("viewedInfoDetailed"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[JEImpressionDurationFilteringTreatmentAction filteredViewedInfoDetailed:](self, "filteredViewedInfoDetailed:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("viewedInfoDetailed"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("viewedInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {

  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("viewedInfoDetailed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (!v13)
    {
      v14 = 0;
      goto LABEL_9;
    }
  }
  v14 = v5;
LABEL_9:

  return v14;
}

- (id)filteredViewedInfoDetailed:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v3);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[JEImpressionDurationFilteringTreatmentAction filteredDurationArray:](self, "filteredDurationArray:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "count"))
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v10);
          else
            objc_msgSend(v4, "removeObjectForKey:", v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)filteredDurationArray:(id)a3
{
  void *v3;
  int64_t durationThreshold;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3880];
  durationThreshold = self->_durationThreshold;
  v5 = a3;
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("d >= %ld"), durationThreshold);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)durationThreshold
{
  return self->_durationThreshold;
}

- (NSPredicate)filters
{
  return self->_filters;
}

@end
