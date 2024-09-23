@implementation ATXMagicalMomentsPredictionTable

- (ATXMagicalMomentsPredictionTable)init
{
  return -[ATXMagicalMomentsPredictionTable initWithPredictionTableEntries:](self, "initWithPredictionTableEntries:", 0);
}

- (ATXMagicalMomentsPredictionTable)initWithPredictionTableEntries:(id)a3
{
  id v4;
  ATXMagicalMomentsPredictionTable *v5;
  uint64_t v6;
  NSMutableArray *predictionTableEntries;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXMagicalMomentsPredictionTable;
  v5 = -[ATXMagicalMomentsPredictionTable init](&v9, sel_init);
  if (v5)
  {
    if (v4)
      v6 = objc_msgSend(v4, "mutableCopy");
    else
      v6 = objc_opt_new();
    predictionTableEntries = v5->_predictionTableEntries;
    v5->_predictionTableEntries = (NSMutableArray *)v6;

  }
  return v5;
}

- (id)describeTable
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableArray *obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = -[NSMutableArray count](self->_predictionTableEntries, "count");
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = self->_predictionTableEntries;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(obj);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[%lu of %lu] %@"), v7 + v9, v3, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9));
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v7 += v9;
    }
    while (v6);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  ATXMagicalMomentsPredictionTable *v4;
  NSMutableArray *predictionTableEntries;
  char v6;

  v4 = (ATXMagicalMomentsPredictionTable *)a3;
  if (self == v4)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
    goto LABEL_7;
  }
  predictionTableEntries = v4->_predictionTableEntries;
  if (predictionTableEntries == self->_predictionTableEntries)
LABEL_5:
    v6 = 1;
  else
    v6 = -[NSMutableArray isEqualToArray:](predictionTableEntries, "isEqualToArray:");
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  return -[NSMutableArray hash](self->_predictionTableEntries, "hash");
}

- (void)addPredictions:(id)a3 withApplicablePredicates:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v6);
        -[ATXMagicalMomentsPredictionTable addPrediction:withApplicablePredicates:](self, "addPrediction:withApplicablePredicates:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), v7);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)addPrediction:(id)a3 withApplicablePredicates:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ATXMagicalMomentsPredictionTableEntry *v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7 && objc_msgSend(v7, "count"))
    {
      v9 = -[ATXMagicalMomentsPredictionTableEntry initWithPrediction:applicablePredicates:]([ATXMagicalMomentsPredictionTableEntry alloc], "initWithPrediction:applicablePredicates:", v6, v8);
      if (v9)
      {
        -[NSMutableArray addObject:](self->_predictionTableEntries, "addObject:", v9);
      }
      else
      {
        __atxlog_handle_default();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[ATXMagicalMomentsPredictionTable addPrediction:withApplicablePredicates:].cold.2();

      }
    }
    else
    {
      __atxlog_handle_default();
      v9 = (ATXMagicalMomentsPredictionTableEntry *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
        -[ATXMagicalMomentsPredictionTable addPrediction:withApplicablePredicates:].cold.1();
    }

  }
}

- (id)predictionTableEntries
{
  NSMutableArray *predictionTableEntries;
  void *v3;
  NSObject *v4;

  predictionTableEntries = self->_predictionTableEntries;
  if (predictionTableEntries)
  {
    v3 = (void *)-[NSMutableArray copy](predictionTableEntries, "copy");
  }
  else
  {
    __atxlog_handle_default();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[ATXMagicalMomentsPredictionTable predictionTableEntries].cold.1();

    v3 = 0;
  }
  return v3;
}

- (id)validPredictionsFromTableEntries:(id)a3 event:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1CAA48B6C](v9);
        objc_msgSend(v13, "compoundPredicate", (_QWORD)v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "allowEvaluation");
        if (objc_msgSend(v15, "evaluateWithObject:", v6))
        {
          objc_msgSend(v13, "prediction");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v13, "prediction");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v17);

          }
        }

        objc_autoreleasePoolPop(v14);
        ++v12;
      }
      while (v10 != v12);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v10 = v9;
    }
    while (v9);
  }

  return v7;
}

- (id)deduplicatePredictions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(v11, "predictionIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v5, "containsObject:", v13);

        if ((v14 & 1) == 0)
        {
          objc_msgSend(v4, "addObject:", v11);
          objc_msgSend(v11, "predictionIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v15);

          __atxlog_handle_default();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v11;
            _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_INFO, "ATXMM: %@", buf, 0xCu);
          }

        }
        objc_autoreleasePoolPop(v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v8);
  }

  return v4;
}

- (id)removeRestrictedPredictions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(v10, "predictionIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(MEMORY[0x1E0CF8CE8], "isInstalledAndNotRestrictedForBundle:", v12) & 1) != 0)
        {
          if ((objc_msgSend(MEMORY[0x1E0CF8CE8], "isDeviceManagementPolicyOkForBundleId:", v12) & 1) != 0)
          {
            objc_msgSend(v4, "addObject:", v10);
            goto LABEL_15;
          }
          __atxlog_handle_default();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v22 = v12;
            v14 = v13;
            v15 = "ATXMM: Skipping screen time restricted app %@.";
            goto LABEL_13;
          }
        }
        else
        {
          __atxlog_handle_default();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v22 = v12;
            v14 = v13;
            v15 = "ATXMM: Skipping restricted app %@.";
LABEL_13:
            _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
          }
        }

LABEL_15:
        objc_autoreleasePoolPop(v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)predictionsForTriggerEvent:(id)a3
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
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1CAA48B6C]();
  -[ATXMagicalMomentsPredictionTable validPredictionsFromTableEntries:event:](self, "validPredictionsFromTableEntries:event:", self->_predictionTableEntries, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingDescriptors:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXMagicalMomentsPredictionTable deduplicatePredictions:](self, "deduplicatePredictions:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMagicalMomentsPredictionTable removeRestrictedPredictions:](self, "removeRestrictedPredictions:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  objc_autoreleasePoolPop(v5);
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSMutableArray *predictionTableEntries;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3928];
  v5 = a3;
  objc_msgSend(v4, "sortDescriptorWithKey:ascending:", CFSTR("prediction.confidence"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  predictionTableEntries = self->_predictionTableEntries;
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray sortUsingDescriptors:](predictionTableEntries, "sortUsingDescriptors:", v8);

  objc_msgSend(v5, "encodeObject:forKey:", self->_predictionTableEntries, CFSTR("predictionTableEntries"));
}

- (ATXMagicalMomentsPredictionTable)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  ATXMagicalMomentsPredictionTable *v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1CAA48B6C]();
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("predictionTableEntries"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ATXMagicalMomentsPredictionTable initWithPredictionTableEntries:](self, "initWithPredictionTableEntries:", v9);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionTableEntries, 0);
}

- (void)addPrediction:withApplicablePredicates:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ATXMM: Attempted to add an entry to the prediction table without specifying any applicable predicates.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)addPrediction:withApplicablePredicates:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ATXMM: Failed to insert prediction item into prediction table because we couldn't initialize a new prediction table entry object.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)predictionTableEntries
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ATXMM: Attempted to access predictions from prediction table, but the prediction table was empty.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
