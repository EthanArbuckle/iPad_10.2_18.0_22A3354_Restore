@implementation _DPPrivacyBudgetProperties

- (_DPPrivacyBudgetProperties)init
{

  return 0;
}

- (_DPPrivacyBudgetProperties)initWithName:(id)a3 dictionary:(id)a4
{
  id v7;
  id v8;
  _DPPrivacyBudgetProperties *v9;
  _DPPrivacyBudgetProperties *v10;
  NSString **p_name;
  id *p_interval;
  id *p_intervalBudgetValue;
  id *p_refillInterval;
  void *v15;
  id *p_refillAmount;
  uint64_t v17;
  void *v18;
  void *v19;
  id *p_intervalCohortAggregateBudgetValue;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  NSObject *v24;
  NSString *v25;
  id v26;
  const char *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  _DPPrivacyBudgetProperties *v32;
  NSString *v34;
  id v35;
  NSString *v36;
  uint64_t intervalChunksValue;
  NSObject *v38;
  uint32_t v39;
  void *v40;
  unint64_t v41;
  NSObject *v42;
  NSString *v43;
  id v44;
  id v45;
  NSString *v46;
  id v47;
  double v48;
  NSString *v49;
  id v50;
  id *p_intervalChunksValue;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  objc_super v57;
  uint8_t buf[4];
  NSString *v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v57.receiver = self;
  v57.super_class = (Class)_DPPrivacyBudgetProperties;
  v9 = -[_DPPrivacyBudgetProperties init](&v57, sel_init);
  v10 = v9;
  if (!v9)
    goto LABEL_19;
  v56 = v7;
  p_name = &v9->_name;
  objc_storeStrong((id *)&v9->_name, a3);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SessionSeconds"));
  p_interval = (id *)&v10->_interval;
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&v10->_interval, v55);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SessionAmount"));
  p_intervalBudgetValue = (id *)&v10->_intervalBudgetValue;
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&v10->_intervalBudgetValue, v54);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RefillInterval"));
  p_refillInterval = (id *)&v10->_refillInterval;
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&v10->_refillInterval, v53);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RefillAmount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  p_refillAmount = (id *)&v10->_refillAmount;
  objc_storeStrong((id *)&v10->_refillAmount, v15);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CohortAggregateSessionAmount"));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (void *)v17;
  else
    v19 = &unk_1E9748D38;
  p_intervalCohortAggregateBudgetValue = (id *)&v10->_intervalCohortAggregateBudgetValue;
  objc_storeStrong((id *)&v10->_intervalCohortAggregateBudgetValue, v19);
  if (!v10->_name || !*p_interval || !*p_intervalBudgetValue || !*p_refillInterval || !*p_refillAmount)
  {
    v28 = 1;
    v29 = v55;
    v7 = v56;
    v31 = v53;
    v30 = v54;
    goto LABEL_17;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SessionChunks"));
  v21 = objc_claimAutoreleasedReturnValue();
  v52 = (void *)v21;
  if (v21)
    v22 = (void *)v21;
  else
    v22 = &unk_1E96FB040;
  p_intervalChunksValue = (id *)&v10->_intervalChunksValue;
  objc_storeStrong((id *)&v10->_intervalChunksValue, v22);
  v23 = -[NSNumber unsignedLongLongValue](v10->_interval, "unsignedLongLongValue");
  if (v23 >= kSecondsInOneDay)
  {
    if ((unint64_t)objc_msgSend(*p_intervalBudgetValue, "unsignedLongLongValue") < 0xB)
    {
      if (objc_msgSend(*p_intervalChunksValue, "unsignedLongLongValue")
        && (unint64_t)objc_msgSend(*p_intervalChunksValue, "unsignedLongLongValue") < 0x12D)
      {
        if (!objc_msgSend(*p_refillInterval, "unsignedLongLongValue")
          || (v41 = objc_msgSend(*p_interval, "unsignedIntegerValue"),
              v41 < objc_msgSend(*p_refillInterval, "unsignedIntegerValue")))
        {
          +[_DPLog framework](_DPLog, "framework", p_intervalChunksValue);
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            v43 = *p_name;
            v44 = *p_interval;
            v45 = *p_refillInterval;
            *(_DWORD *)buf = 138412802;
            v59 = v43;
            v60 = 2112;
            v61 = (uint64_t)v44;
            v62 = 2112;
            v63 = (uint64_t)v45;
            _os_log_impl(&dword_1D3FAA000, v42, OS_LOG_TYPE_INFO, "%@:  _interval=%@ ; _refillInterval=%@", buf, 0x20u);
          }
          v24 = v42;
          goto LABEL_30;
        }
        if ((unint64_t)objc_msgSend(*p_refillAmount, "unsignedIntegerValue") >= 0x65)
        {
          +[_DPLog framework](_DPLog, "framework");
          v24 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            goto LABEL_30;
          v46 = *p_name;
          v47 = *p_refillAmount;
          *(_DWORD *)buf = 138412802;
          v59 = v46;
          v60 = 2048;
          v61 = 100;
          v62 = 2112;
          v63 = (uint64_t)v47;
          v27 = "%@: _kDPMaxRefillAmount=%lu ; _refillAmount=%@";
          goto LABEL_28;
        }
        objc_msgSend(*p_intervalCohortAggregateBudgetValue, "doubleValue");
        if (v48 >= 0.0)
        {
          v28 = 0;
          v29 = v55;
          v7 = v56;
          v31 = v53;
          v30 = v54;
          v40 = v52;
          goto LABEL_31;
        }
        +[_DPLog framework](_DPLog, "framework");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v49 = *p_name;
          v50 = *p_intervalCohortAggregateBudgetValue;
          *(_DWORD *)buf = 138412546;
          v59 = v49;
          v60 = 2112;
          v61 = (uint64_t)v50;
          v27 = "%@: _intervalCohortAggregateBudgetValue=%@";
          v38 = v24;
          v39 = 22;
          goto LABEL_29;
        }
      }
      else
      {
        +[_DPLog framework](_DPLog, "framework", p_intervalChunksValue);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v36 = *p_name;
          intervalChunksValue = (uint64_t)v10->_intervalChunksValue;
          *(_DWORD *)buf = 138412802;
          v59 = v36;
          v60 = 2112;
          v61 = intervalChunksValue;
          v62 = 2048;
          v63 = 300;
          v27 = "%@: _intervalChunksValue=%@ ; chunksValueInIntervalMAX()=%lld";
          goto LABEL_28;
        }
      }
    }
    else
    {
      +[_DPLog framework](_DPLog, "framework");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v34 = *p_name;
        v35 = *p_intervalBudgetValue;
        *(_DWORD *)buf = 138412802;
        v59 = v34;
        v60 = 2112;
        v61 = (uint64_t)v35;
        v62 = 2048;
        v63 = 10;
        v27 = "%@: _intervalBudgetValue=%@ ; budgetValueInIntervalMAX()=%lld";
        goto LABEL_28;
      }
    }
  }
  else
  {
    +[_DPLog framework](_DPLog, "framework");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = *p_name;
      v26 = *p_interval;
      *(_DWORD *)buf = 138412802;
      v59 = v25;
      v60 = 2112;
      v61 = (uint64_t)v26;
      v62 = 2048;
      v63 = kSecondsInOneDay;
      v27 = "%@: _interval=%@ ; budgetIntervalSecondsMIN()=%lld";
LABEL_28:
      v38 = v24;
      v39 = 32;
LABEL_29:
      _os_log_impl(&dword_1D3FAA000, v38, OS_LOG_TYPE_INFO, v27, buf, v39);
    }
  }
LABEL_30:
  v29 = v55;
  v7 = v56;
  v31 = v53;
  v30 = v54;
  v40 = v52;

  v28 = 1;
LABEL_31:

LABEL_17:
  if (!v28)
  {
LABEL_19:
    v32 = v10;
    goto LABEL_20;
  }
  v32 = 0;
LABEL_20:

  return v32;
}

+ (_DPPrivacyBudgetProperties)budgetPropertiesWithName:(id)a3 fromDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:dictionary:", v7, v6);

  return (_DPPrivacyBudgetProperties *)v8;
}

+ (void)initializeAllBudgetProperties
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x1D8256B78](a1, a2);
  +[_DPStrings budgetPropertiesPath](_DPStrings, "budgetPropertiesPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[_DPPrivacyBudgetProperties budgetPropertiesFromFile:](_DPPrivacyBudgetProperties, "budgetPropertiesFromFile:", v3);

  objc_autoreleasePoolPop(v2);
}

+ (id)budgetPropertiesForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[_DPStrings budgetPropertiesPath](_DPStrings, "budgetPropertiesPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DPPrivacyBudgetProperties budgetPropertiesFromFile:](_DPPrivacyBudgetProperties, "budgetPropertiesFromFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { name=%@ ; interval=%@ ; intervalBudgetValue=%@ ; intervalCohortAggregateBudgetValue=%@ ; refillInterval=%@ ; refillAmount=%@ }"),
    v5,
    self->_name,
    self->_interval,
    self->_intervalBudgetValue,
    self->_intervalCohortAggregateBudgetValue,
    self->_refillInterval,
    self->_refillAmount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)budgetPropertiesFromFile:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55___DPPrivacyBudgetProperties_budgetPropertiesFromFile___block_invoke;
  v9[3] = &unk_1E95D92C0;
  v10 = v4;
  v11 = a1;
  v5 = budgetPropertiesFromFile__onceToken;
  v6 = v4;
  if (v5 != -1)
    dispatch_once(&budgetPropertiesFromFile__onceToken, v9);
  v7 = (id)gAllBudgetProperties;

  return v7;
}

+ (id)allBudgetPropertiesKeys
{
  return (id)objc_msgSend((id)gAllBudgetProperties, "allKeys");
}

+ (id)budgetMaintenanceSchedule
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend((id)gAllBudgetProperties, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "interval");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v2, "objectForKeyedSubscript:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = v11;
            objc_msgSend(v11, "addObject:", v10);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, v9);
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  return v2;
}

- (NSString)name
{
  return self->_name;
}

- (NSNumber)interval
{
  return self->_interval;
}

- (void)setInterval:(id)a3
{
  objc_storeStrong((id *)&self->_interval, a3);
}

- (NSNumber)intervalBudgetValue
{
  return self->_intervalBudgetValue;
}

- (void)setIntervalBudgetValue:(id)a3
{
  objc_storeStrong((id *)&self->_intervalBudgetValue, a3);
}

- (NSNumber)intervalCohortAggregateBudgetValue
{
  return self->_intervalCohortAggregateBudgetValue;
}

- (void)setIntervalCohortAggregateBudgetValue:(id)a3
{
  objc_storeStrong((id *)&self->_intervalCohortAggregateBudgetValue, a3);
}

- (NSNumber)intervalChunksValue
{
  return self->_intervalChunksValue;
}

- (void)setIntervalChunksValue:(id)a3
{
  objc_storeStrong((id *)&self->_intervalChunksValue, a3);
}

- (NSNumber)refillInterval
{
  return self->_refillInterval;
}

- (void)setRefillInterval:(id)a3
{
  objc_storeStrong((id *)&self->_refillInterval, a3);
}

- (NSNumber)refillAmount
{
  return self->_refillAmount;
}

- (void)setRefillAmount:(id)a3
{
  objc_storeStrong((id *)&self->_refillAmount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refillAmount, 0);
  objc_storeStrong((id *)&self->_refillInterval, 0);
  objc_storeStrong((id *)&self->_intervalChunksValue, 0);
  objc_storeStrong((id *)&self->_intervalCohortAggregateBudgetValue, 0);
  objc_storeStrong((id *)&self->_intervalBudgetValue, 0);
  objc_storeStrong((id *)&self->_interval, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
