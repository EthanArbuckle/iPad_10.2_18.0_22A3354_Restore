@implementation _DKEventStatsCounterInternal

- (id)initWithCollectionName:(void *)a3 eventName:(void *)a4 eventType:(void *)a5 eventTypePossibleValues:(char)a6 hasResult:(int)a7 scalar:
{
  id v13;
  id v14;
  id v15;
  id v16;
  id *v17;
  BOOL v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  size_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  objc_class *PETScalarEventTrackerClass;
  id *v31;
  uint64_t v33;
  id v34;
  id *v35;
  id *v36;
  objc_super v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  if (!a1)
    goto LABEL_24;
  v37.receiver = a1;
  v37.super_class = (Class)_DKEventStatsCounterInternal;
  v17 = (id *)objc_msgSendSuper2(&v37, sel_init);
  a1 = v17;
  if (!v17)
    goto LABEL_23;
  *((_DWORD *)v17 + 2) = 0;
  objc_storeStrong(v17 + 4, a3);
  objc_storeStrong(a1 + 5, a4);
  objc_storeStrong(a1 + 6, a5);
  v18 = 0;
  if (v15 && v16)
    v18 = objc_msgSend(v16, "count") != 0;
  *((_BYTE *)a1 + 12) = v18;
  *((_BYTE *)a1 + 13) = a6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coreduet.%@.%@"), v13, v14);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = a1[7];
  a1[7] = (id)v19;

  v21 = *((_BYTE *)a1 + 12) ? objc_msgSend(v16, "count") : 1;
  v22 = v21 << a6;
  a1[2] = (id)v22;
  v23 = malloc_type_calloc(v22, 8uLL, 0x100004000313F17uLL);
  a1[3] = v23;
  if (!v23)
  {
LABEL_24:
    v31 = 0;
    goto LABEL_25;
  }
  if (getPETEventPropertyClass() && getPETScalarEventTrackerClass() && getPETDistributionEventTrackerClass())
  {
    if ((_DKEventStatsLogExternally & 1) == 0)
    {
      v24 = (void *)objc_opt_new();
      if (*((_BYTE *)a1 + 12))
      {
        -[objc_class propertyWithName:possibleValues:](getPETEventPropertyClass(), "propertyWithName:possibleValues:", v15, v16);
        v25 = objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          v35 = a1;
          goto LABEL_30;
        }
        v26 = (void *)v25;
        objc_msgSend(v24, "addObject:", v25);

      }
      if (!*((_BYTE *)a1 + 13))
      {
LABEL_20:
        if (a7)
          PETScalarEventTrackerClass = getPETScalarEventTrackerClass();
        else
          PETScalarEventTrackerClass = getPETDistributionEventTrackerClass();
        v33 = objc_msgSend([PETScalarEventTrackerClass alloc], "initWithFeatureId:event:registerProperties:", v13, v14, v24);
        v34 = a1[8];
        a1[8] = (id)v33;

        goto LABEL_23;
      }
      v38[0] = CFSTR("true");
      v38[1] = CFSTR("false");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class propertyWithName:possibleValues:](getPETEventPropertyClass(), "propertyWithName:possibleValues:", CFSTR("success"), v27);
      v28 = objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        v29 = (void *)v28;
        objc_msgSend(v24, "addObject:", v28);

        goto LABEL_20;
      }
      v36 = a1;

LABEL_30:
      v31 = a1;
      goto LABEL_25;
    }
  }
  else
  {
    _DKEventStatsLogExternally = 1;
  }
LABEL_23:
  a1 = a1;
  v31 = a1;
LABEL_25:

  return v31;
}

- (void)dealloc
{
  unint64_t *counters;
  objc_super v4;

  counters = self->_counters;
  if (counters)
  {
    free(counters);
    self->_counters = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_DKEventStatsCounterInternal;
  -[_DKEventStatsCounterInternal dealloc](&v4, sel_dealloc);
}

- (uint64_t)indexOfTypeValue:(unsigned int)a3 success:
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if (*(_BYTE *)(a1 + 12) == (v5 != 0))
    {
      if (!v5)
      {
        if (*(_BYTE *)(a1 + 13))
          v23 = a3;
        else
          v23 = 0;
        if (*(_BYTE *)(a1 + 13))
          v22 = v23;
        else
          v22 = -1;
        goto LABEL_21;
      }
      v7 = objc_msgSend(*(id *)(a1 + 48), "indexOfObject:", v5);
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v22 = v7;
        if (*(_BYTE *)(a1 + 13))
        {
          v24 = objc_msgSend(*(id *)(a1 + 48), "count");
          if (a3)
            v25 = v24;
          else
            v25 = 0;
          v22 += v25;
        }
        goto LABEL_21;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        -[_DKEventStatsCounterInternal indexOfTypeValue:success:].cold.1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      -[_DKEventStatsCounterInternal indexOfTypeValue:success:].cold.2(a1 + 12, v15, v16, v17, v18, v19, v20, v21);
    }
    v22 = -1;
LABEL_21:
    if (v22 >= *(_QWORD *)(a1 + 16))
      a1 = -1;
    else
      a1 = v22;
  }

  return a1;
}

- (void)incrementCountByNumber:(void *)a3 typeValue:(unsigned int)a4 success:
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v7 = a3;
  if (a1)
  {
    v10 = v7;
    v8 = -[_DKEventStatsCounterInternal indexOfTypeValue:success:](a1, v7, a4);
    v7 = v10;
    if (v8 >= 1)
    {
      v9 = v8;
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
      *(_QWORD *)(*(_QWORD *)(a1 + 24) + 8 * v9) += a2;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      v7 = v10;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventTracker, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_typeValues, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

- (void)indexOfTypeValue:(uint64_t)a3 success:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_5(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Skipping %s due to unrecognized type parameter: %@", a5, a6, a7, a8, 2u);
}

- (void)indexOfTypeValue:(uint64_t)a3 success:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_5(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Skipping %s due to %@ type parameter", a5, a6, a7, a8, 2u);
}

@end
