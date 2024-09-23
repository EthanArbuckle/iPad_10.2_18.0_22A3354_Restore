@implementation _CDInteractionsStatistics

- (_CDInteractionsStatistics)initWithProperties:(id)a3 features:(id)a4 defaultValues:(id)a5
{
  id v9;
  id v10;
  id v11;
  _CDInteractionsStatistics *v12;
  _CDInteractionsStatistics *v13;
  uint64_t v14;
  NSMutableSet *hasSharePlayedWith;
  uint64_t v16;
  NSMutableDictionary *personsCounts;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_CDInteractionsStatistics;
  v12 = -[_CDInteractionsStatistics init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_properties, a3);
    objc_storeStrong((id *)&v13->_features, a4);
    objc_storeStrong((id *)&v13->_defaultValues, a5);
    v14 = objc_opt_new();
    hasSharePlayedWith = v13->_hasSharePlayedWith;
    v13->_hasSharePlayedWith = (NSMutableSet *)v14;

    v16 = objc_opt_new();
    personsCounts = v13->_personsCounts;
    v13->_personsCounts = (NSMutableDictionary *)v16;

  }
  return v13;
}

- (_CDInteractionsStatistics)initWithDefaultValues:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _CDInteractionsStatistics *v7;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = -[_CDInteractionsStatistics initWithProperties:features:defaultValues:](self, "initWithProperties:features:defaultValues:", v5, v6, v4);

  return v7;
}

- (void)_addConversationId:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v5, v12);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%du"), arc4random());
    -[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("privatizedConversationIdentifier"));

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_features, "objectForKeyedSubscript:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_features, "setObject:forKeyedSubscript:", v9, v12);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_personsCounts, "objectForKeyedSubscript:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_personsCounts, "setObject:forKeyedSubscript:", v11, v12);

  }
}

- (void)setValue:(id)a3 forFeature:(id)a4 andConversationId:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  if (a3)
  {
    v8 = a5;
    v9 = a4;
    v10 = a3;
    -[_CDInteractionsStatistics _addConversationId:](self, "_addConversationId:", v8);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_features, "objectForKeyedSubscript:", v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v9);
  }
}

- (void)setValue:(id)a3 forProperty:(id)a4 andConversationId:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  if (a3)
  {
    v8 = a5;
    v9 = a4;
    v10 = a3;
    -[_CDInteractionsStatistics _addConversationId:](self, "_addConversationId:", v8);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v9);
  }
}

- (id)valueForFeature:(id)a3 forConversationId:(id)a4
{
  NSMutableDictionary *features;
  id v6;
  void *v7;
  void *v8;

  features = self->_features;
  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](features, "objectForKeyedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)valueOrDefaultValueForFeature:(id)a3 forConversationId:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_features, "objectForKeyedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_defaultValues, "objectForKeyedSubscript:", v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (BOOL)isUsingDefaultValue:(id)a3 forConversationId:(id)a4
{
  NSMutableDictionary *features;
  id v6;
  void *v7;
  void *v8;

  features = self->_features;
  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](features, "objectForKeyedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8 == 0;
}

- (id)valueForProperty:(id)a3 forConversationId:(id)a4
{
  NSMutableDictionary *properties;
  id v6;
  void *v7;
  void *v8;

  properties = self->_properties;
  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](properties, "objectForKeyedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)incrementValueForFeature:(id)a3 andConversationId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  -[_CDInteractionsStatistics _addConversationId:](self, "_addConversationId:", v6);
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_features, "objectForKeyedSubscript:", v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  objc_msgSend(v8, "numberWithDouble:", v10 + 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_features, "objectForKeyedSubscript:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v7);
}

- (void)recordSharePlayInformation:(id)a3
{
  if (a3)
    -[NSMutableSet addObject:](self->_hasSharePlayedWith, "addObject:");
}

- (BOOL)hasEverSharePlayed:(id)a3
{
  if (a3)
    return -[NSMutableSet containsObject:](self->_hasSharePlayedWith, "containsObject:");
  else
    return 0;
}

- (void)includeFeature:(id)a3 from:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[_CDInteractionsStatistics conversationIds](self, "conversationIds", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v7, "valueForFeature:forConversationId:", v6, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          -[_CDInteractionsStatistics setValue:forFeature:andConversationId:](self, "setValue:forFeature:andConversationId:", v14, v6, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (id)conversationIds
{
  return (id)-[NSMutableDictionary allKeys](self->_features, "allKeys");
}

- (void)removeConversationIds:(id)a3
{
  NSMutableDictionary *features;
  id v5;

  features = self->_features;
  v5 = a3;
  -[NSMutableDictionary removeObjectsForKeys:](features, "removeObjectsForKeys:", v5);
  -[NSMutableDictionary removeObjectsForKeys:](self->_properties, "removeObjectsForKeys:", v5);

}

- (id)features
{
  return (id)-[NSMutableDictionary copy](self->_features, "copy");
}

- (id)properties
{
  return (id)-[NSMutableDictionary copy](self->_properties, "copy");
}

- (id)nonNilFeaturesForConversationId:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_defaultValues;
  v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[_CDInteractionsStatistics valueOrDefaultValueForFeature:forConversationId:](self, "valueOrDefaultValueForFeature:forConversationId:", v11, v4, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

      }
      v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

- (id)privatizedConversationId:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("privatizedConversationIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  return -[_CDInteractionsStatistics descriptionRedacted:](self, "descriptionRedacted:", 0);
}

- (id)redactedDescription
{
  return -[_CDInteractionsStatistics descriptionRedacted:](self, "descriptionRedacted:", 1);
}

- (id)descriptionRedacted:(BOOL)a3
{
  id v5;
  NSMutableDictionary *features;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _CDInteractionsStatistics *v12;
  BOOL v13;

  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v5, "appendString:", CFSTR("_CDInteractionsStatistics(\n"));
  features = self->_features;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49___CDInteractionsStatistics_descriptionRedacted___block_invoke;
  v10[3] = &unk_1E26E69A0;
  v7 = v5;
  v13 = a3;
  v11 = v7;
  v12 = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](features, "enumerateKeysAndObjectsUsingBlock:", v10);
  objc_msgSend(v7, "appendString:", CFSTR(")"));
  v8 = v7;

  return v8;
}

- (id)bundleIdForConversationId:(id)a3
{
  return -[_CDInteractionsStatistics valueForProperty:forConversationId:](self, "valueForProperty:forConversationId:", CFSTR("ConversationBundleId"), a3);
}

- (void)savePersonId:(id)a3 forConversationId:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_personsCounts, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_personsCounts, "setObject:forKeyedSubscript:", v8, v6);

  }
  if (v15)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[NSMutableDictionary objectForKeyedSubscript:](self->_personsCounts, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    objc_msgSend(v9, "numberWithDouble:", v12 + 1.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_personsCounts, "objectForKeyedSubscript:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

  }
}

- (void)computePASSFeatureWithPeopleDetectedInPhoto:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _CDInteractionsStatistics *v9;

  v4 = a3;
  -[_CDInteractionsStatistics conversationIds](self, "conversationIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73___CDInteractionsStatistics_computePASSFeatureWithPeopleDetectedInPhoto___block_invoke;
  v7[3] = &unk_1E26E69F0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

- (void)computeFeaturesForRecipe:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
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
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "subarrayWithRange:", 1, objc_msgSend(v9, "count") - 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CDInteractionsStatistics computeFeatureForMethod:arguments:](self, "computeFeatureForMethod:arguments:", v10, v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)computeFeatureForMethod:(id)a3 arguments:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v7, "count") <= 1)
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_CDInteractionsStatistics computeFeatureForMethod:arguments:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_10;
  }
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("sum:with:")))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteractionsStatistics sum:with:resultFeatureName:](self, "sum:with:resultFeatureName:", v8, v16, v17);
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("multiply:with:")))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteractionsStatistics multiply:with:resultFeatureName:](self, "multiply:with:resultFeatureName:", v8, v16, v17);
    goto LABEL_8;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("multiply:withMultiplier:")))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v19;

    objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteractionsStatistics multiply:withMultiplier:resultFeatureName:](self, "multiply:withMultiplier:resultFeatureName:", v8, v16, v20);
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("divide:withDivisor:")))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteractionsStatistics divide:withDivisor:resultFeatureName:](self, "divide:withDivisor:resultFeatureName:", v8, v16, v17);
    goto LABEL_8;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("exponential:withMultiplier:")))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v22;

    objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteractionsStatistics exponential:withMultiplier:resultFeatureName:](self, "exponential:withMultiplier:resultFeatureName:", v8, v16, v23);
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("reciprocal:withOffset:")))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    v26 = v25;

    objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteractionsStatistics reciprocal:withOffset:resultFeatureName:](self, "reciprocal:withOffset:resultFeatureName:", v8, v16, v26);
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("power:withExponent:")))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "doubleValue");
    v29 = v28;

    objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteractionsStatistics power:withExponent:resultFeatureName:](self, "power:withExponent:resultFeatureName:", v8, v16, v29);
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("laplaceProbability:withAlpha:")))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "doubleValue");
    v32 = v31;

    objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteractionsStatistics laplaceProbability:withAlpha:resultFeatureName:](self, "laplaceProbability:withAlpha:resultFeatureName:", v8, v16, v32);
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("laplaceProbabilityCorrected:withAlpha:")))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "doubleValue");
    v35 = v34;

    objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteractionsStatistics laplaceProbabilityCorrected:withAlpha:resultFeatureName:](self, "laplaceProbabilityCorrected:withAlpha:resultFeatureName:", v8, v16, v35);
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("log:withBase:")))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "doubleValue");
    v38 = v37;

    objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteractionsStatistics log:withBase:resultFeatureName:](self, "log:withBase:resultFeatureName:", v8, v16, v38);
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("rename:with:")))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteractionsStatistics renameFeature:withFeatureName:](self, "renameFeature:withFeatureName:", v8, v16);
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("copy:to:")))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteractionsStatistics copyFeature:toFeatureName:](self, "copyFeature:toFeatureName:", v8, v16);
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("impute:withConstant:")))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteractionsStatistics imputeFeature:withConstant:](self, "imputeFeature:withConstant:", v8, v16);
    goto LABEL_9;
  }
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    -[_CDInteractionsStatistics computeFeatureForMethod:arguments:].cold.2(v39, v40, v41, v42, v43, v44, v45, v46);

LABEL_10:
}

- (void)sum:(id)a3 with:(id)a4 resultFeatureName:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v23 = a5;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[_CDInteractionsStatistics conversationIds](self, "conversationIds");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        -[_CDInteractionsStatistics valueForFeature:forConversationId:](self, "valueForFeature:forConversationId:", v8, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CDInteractionsStatistics valueForFeature:forConversationId:](self, "valueForFeature:forConversationId:", v9, v14);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v15)
          v18 = v16 == 0;
        else
          v18 = 1;
        if (!v18)
        {
          objc_msgSend(v15, "doubleValue");
          v20 = v19;
          objc_msgSend(v17, "doubleValue");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20 + v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[_CDInteractionsStatistics setValue:forFeature:andConversationId:](self, "setValue:forFeature:andConversationId:", v22, v23, v14);

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

}

- (void)multiply:(id)a3 with:(id)a4 resultFeatureName:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v23 = a5;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[_CDInteractionsStatistics conversationIds](self, "conversationIds");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        -[_CDInteractionsStatistics valueForFeature:forConversationId:](self, "valueForFeature:forConversationId:", v8, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CDInteractionsStatistics valueForFeature:forConversationId:](self, "valueForFeature:forConversationId:", v9, v14);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v15)
          v18 = v16 == 0;
        else
          v18 = 1;
        if (!v18)
        {
          objc_msgSend(v15, "doubleValue");
          v20 = v19;
          objc_msgSend(v17, "doubleValue");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20 * v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[_CDInteractionsStatistics setValue:forFeature:andConversationId:](self, "setValue:forFeature:andConversationId:", v22, v23, v14);

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

}

- (void)multiply:(id)a3 withMultiplier:(double)a4 resultFeatureName:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[_CDInteractionsStatistics conversationIds](self, "conversationIds", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[_CDInteractionsStatistics valueForFeature:forConversationId:](self, "valueForFeature:forConversationId:", v8, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          v18 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v16, "doubleValue");
          objc_msgSend(v18, "numberWithDouble:", v19 * a4);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[_CDInteractionsStatistics setValue:forFeature:andConversationId:](self, "setValue:forFeature:andConversationId:", v20, v9, v15);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

}

- (void)divide:(id)a3 withDivisor:(id)a4 resultFeatureName:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v24 = a5;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[_CDInteractionsStatistics conversationIds](self, "conversationIds");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        -[_CDInteractionsStatistics valueForFeature:forConversationId:](self, "valueForFeature:forConversationId:", v8, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CDInteractionsStatistics valueForFeature:forConversationId:](self, "valueForFeature:forConversationId:", v9, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v15)
          v18 = v16 == 0;
        else
          v18 = 1;
        if (!v18)
        {
          objc_msgSend(v16, "doubleValue");
          if (v19 != 0.0)
          {
            objc_msgSend(v15, "doubleValue");
            v21 = v20;
            objc_msgSend(v17, "doubleValue");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21 / v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[_CDInteractionsStatistics setValue:forFeature:andConversationId:](self, "setValue:forFeature:andConversationId:", v23, v24, v14);

          }
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v11);
  }

}

- (void)exponential:(id)a3 withMultiplier:(double)a4 resultFeatureName:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[_CDInteractionsStatistics conversationIds](self, "conversationIds", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[_CDInteractionsStatistics valueForFeature:forConversationId:](self, "valueForFeature:forConversationId:", v8, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "doubleValue");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)exp(v18 * a4));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[_CDInteractionsStatistics setValue:forFeature:andConversationId:](self, "setValue:forFeature:andConversationId:", v19, v9, v15);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

}

- (void)reciprocal:(id)a3 withOffset:(double)a4 resultFeatureName:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[_CDInteractionsStatistics conversationIds](self, "conversationIds", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[_CDInteractionsStatistics valueForFeature:forConversationId:](self, "valueForFeature:forConversationId:", v8, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "doubleValue");
          if (v18 + a4 != 0.0)
          {
            objc_msgSend(v17, "doubleValue");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 / (v19 + a4));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[_CDInteractionsStatistics setValue:forFeature:andConversationId:](self, "setValue:forFeature:andConversationId:", v20, v9, v15);

          }
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

}

- (void)power:(id)a3 withExponent:(double)a4 resultFeatureName:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  long double v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[_CDInteractionsStatistics conversationIds](self, "conversationIds", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[_CDInteractionsStatistics valueForFeature:forConversationId:](self, "valueForFeature:forConversationId:", v8, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "doubleValue");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)pow(v18, a4));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[_CDInteractionsStatistics setValue:forFeature:andConversationId:](self, "setValue:forFeature:andConversationId:", v19, v9, v15);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

}

- (void)laplaceProbability:(id)a3 withAlpha:(double)a4 resultFeatureName:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v28 = a5;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[_CDInteractionsStatistics conversationIds](self, "conversationIds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    v13 = 0.0;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v9);
        -[_CDInteractionsStatistics valueForFeature:forConversationId:](self, "valueForFeature:forConversationId:", v8, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "doubleValue");
        v13 = v13 + v16;

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v11);
  }
  else
  {
    v13 = 0.0;
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[_CDInteractionsStatistics conversationIds](self, "conversationIds");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v30;
    v21 = v13 + a4;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(v17);
        v23 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
        -[_CDInteractionsStatistics valueForFeature:forConversationId:](self, "valueForFeature:forConversationId:", v8, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v24)
        {
          objc_msgSend(v24, "doubleValue");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v26 + a4) / v21);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[_CDInteractionsStatistics setValue:forFeature:andConversationId:](self, "setValue:forFeature:andConversationId:", v27, v28, v23);

        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v19);
  }

}

- (void)laplaceProbabilityCorrected:(id)a3 withAlpha:(double)a4 resultFeatureName:(id)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t i;
  void *v17;
  double v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  id v30;
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
  v8 = a3;
  v30 = a5;
  -[_CDInteractionsStatistics conversationIds](self, "conversationIds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[_CDInteractionsStatistics conversationIds](self, "conversationIds");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v36;
    v15 = 0.0;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(v11);
        -[_CDInteractionsStatistics valueForFeature:forConversationId:](self, "valueForFeature:forConversationId:", v8, *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "doubleValue");
        v15 = v15 + v18;

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v13);
  }
  else
  {
    v15 = 0.0;
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[_CDInteractionsStatistics conversationIds](self, "conversationIds");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v32;
    v23 = v15 + a4 * (double)v10;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v32 != v22)
          objc_enumerationMutation(v19);
        v25 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
        -[_CDInteractionsStatistics valueForFeature:forConversationId:](self, "valueForFeature:forConversationId:", v8, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v26)
        {
          objc_msgSend(v26, "doubleValue");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v28 + a4) / v23);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[_CDInteractionsStatistics setValue:forFeature:andConversationId:](self, "setValue:forFeature:andConversationId:", v29, v30, v25);

        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v21);
  }

}

- (void)log:(id)a3 withBase:(double)a4 resultFeatureName:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  long double v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[_CDInteractionsStatistics conversationIds](self, "conversationIds", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    v14 = log(a4);
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[_CDInteractionsStatistics valueForFeature:forConversationId:](self, "valueForFeature:forConversationId:", v8, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          objc_msgSend(v17, "doubleValue");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(log(v19) / v14));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[_CDInteractionsStatistics setValue:forFeature:andConversationId:](self, "setValue:forFeature:andConversationId:", v20, v9, v16);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

}

- (void)renameFeature:(id)a3 withFeatureName:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_features;
  v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_features, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_features, "objectForKeyedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v7);

        -[NSMutableDictionary objectForKeyedSubscript:](self->_features, "objectForKeyedSubscript:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, v6);

      }
      v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

}

- (void)copyFeature:(id)a3 toFeatureName:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
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
  v8 = self->_features;
  v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
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
        -[NSMutableDictionary objectForKeyedSubscript:](self->_features, "objectForKeyedSubscript:", v13, (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_features, "objectForKeyedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v7);

      }
      v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

}

- (void)imputeFeature:(id)a3 withConstant:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
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
  v8 = self->_features;
  v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
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
        -[NSMutableDictionary objectForKeyedSubscript:](self->_features, "objectForKeyedSubscript:", v13, (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_features, "objectForKeyedSubscript:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v7, v6);

        }
      }
      v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

}

- (NSDictionary)queryStats
{
  return self->_queryStats;
}

- (void)setQueryStats:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryStats, 0);
  objc_storeStrong((id *)&self->_hasSharePlayedWith, 0);
  objc_storeStrong((id *)&self->_defaultValues, 0);
  objc_storeStrong((id *)&self->_personsCounts, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

- (void)computeFeatureForMethod:(uint64_t)a3 arguments:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, a1, a3, "_CDInteractionsStatistics: insufficient arguments passed to computeFeatureForMethod", a5, a6, a7, a8, 0);
}

- (void)computeFeatureForMethod:(uint64_t)a3 arguments:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, a1, a3, "_CDInteractionsStatistics: unknown methodName passed to computeFeatureForMethod", a5, a6, a7, a8, 0);
}

@end
