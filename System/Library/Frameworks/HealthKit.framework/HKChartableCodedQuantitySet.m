@implementation HKChartableCodedQuantitySet

- (HKChartableCodedQuantitySet)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (id)_initWithMedicalCodings:(id)a3 date:(id)a4 quantities:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKChartableCodedQuantitySet *v11;
  uint64_t v12;
  NSArray *codings;
  uint64_t v14;
  NSDate *date;
  uint64_t v16;
  NSArray *quantities;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKChartableCodedQuantitySet;
  v11 = -[HKChartableCodedQuantitySet init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    codings = v11->_codings;
    v11->_codings = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    date = v11->_date;
    v11->_date = (NSDate *)v14;

    v16 = objc_msgSend(v10, "copy");
    quantities = v11->_quantities;
    v11->_quantities = (NSArray *)v16;

  }
  return v11;
}

+ (id)setWithMedicalCodings:(id)a3 quantities:(id)a4 date:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "quantity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_unit");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __75__HKChartableCodedQuantitySet_setWithMedicalCodings_quantities_date_error___block_invoke;
    v20[3] = &unk_1E37F1E38;
    v16 = v15;
    v21 = v16;
    objc_msgSend(v11, "hk_filter:", v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a6, 3, CFSTR("Some quantities are incompatible with unit %@: %@"), v16, v17);
      v18 = 0;
    }
    else
    {
      v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithMedicalCodings:date:quantities:", v10, v12, v11);
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

uint64_t __75__HKChartableCodedQuantitySet_setWithMedicalCodings_quantities_date_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCompatibleWithUnit:", *(_QWORD *)(a1 + 32)) ^ 1;
}

+ (id)setWithChartableQuantity:(id)a3 date:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKChartableCodedQuantitySet.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("quantity"));

  }
  v9 = objc_alloc((Class)a1);
  objc_msgSend(v7, "codings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "_initWithMedicalCodings:date:quantities:", v10, v8, v11);

  return v12;
}

- (id)chartableCodedQuantitySetByChangingDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[HKChartableCodedQuantitySet _initWithMedicalCodings:date:quantities:]([HKChartableCodedQuantitySet alloc], "_initWithMedicalCodings:date:quantities:", self->_codings, v4, self->_quantities);

  return v5;
}

- (void)addChartableCodedQuantities:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSArray *quantities;
  HKChartableCodedQuantitySet *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = self;
  -[HKChartableCodedQuantitySet compatibleUnit](self, "compatibleUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
        v21 = 0;
        objc_msgSend(v12, "chartableCodedQuantityInUnit:error:", v5, &v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v21;
        if (v13)
        {
          objc_msgSend(v6, "addObject:", v13);
        }
        else
        {
          _HKInitializeLogging();
          v15 = (void *)HKLogHealthRecords;
          if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_ERROR))
          {
            v16 = v15;
            HKSensitiveLogItem(v12);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v27 = v17;
            v28 = 2114;
            v29 = v14;
            _os_log_error_impl(&dword_19A0E6000, v16, OS_LOG_TYPE_ERROR, "Unable to add chartable coded quantity %{public}@ to set: %{public}@", buf, 0x16u);

          }
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v9);
  }

  -[NSArray arrayByAddingObjectsFromArray:](v20->_quantities, "arrayByAddingObjectsFromArray:", v6);
  v18 = objc_claimAutoreleasedReturnValue();
  quantities = v20->_quantities;
  v20->_quantities = (NSArray *)v18;

}

- (id)chartableCodedQuantitySetConvertedToUnit:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_quantities, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = self->_quantities;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "chartableCodedQuantityInUnit:error:", v6, a4, (_QWORD)v17);
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {

          v15 = 0;
          goto LABEL_11;
        }
        v14 = (void *)v13;
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }

  v15 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithMedicalCodings:date:quantities:", self->_codings, self->_date, v7);
LABEL_11:

  return v15;
}

- (HKUnit)compatibleUnit
{
  void *v2;
  void *v3;
  void *v4;

  -[NSArray firstObject](self->_quantities, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quantity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_unit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKUnit *)v4;
}

- (BOOL)isCompatibleWithUnit:(id)a3
{
  NSArray *quantities;
  id v4;
  void *v5;
  void *v6;
  char v7;

  quantities = self->_quantities;
  v4 = a3;
  -[NSArray firstObject](quantities, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isCompatibleWithUnit:", v4);

  return v7;
}

- (double)minValueForUnit:(id)a3
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_quantities;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = 1.79769313e308;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "doubleValue", (_QWORD)v11);
        if (v7 >= v9)
          v7 = v9;
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 1.79769313e308;
  }

  return v7;
}

- (double)maxValueForUnit:(id)a3
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_quantities;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = -1.79769313e308;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "doubleValue", (_QWORD)v11);
        if (v7 < v9)
          v7 = v9;
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v7 = -1.79769313e308;
  }

  return v7;
}

- (double)minValueIncludingReferenceRangeForUnit:(id)a3
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = self->_quantities;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    v7 = 1.79769313e308;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "rangeLow", (_QWORD)v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "doubleValue");
        v12 = v11;
        if (v10)
        {
          objc_msgSend(v9, "rangeLow");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "doubleValue");
          v15 = v14;

          if (v12 >= v15)
            v12 = v15;
        }

        if (v7 >= v12)
          v7 = v12;
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 1.79769313e308;
  }

  return v7;
}

- (double)maxValueIncludingReferenceRangeForUnit:(id)a3
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = self->_quantities;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    v7 = -1.79769313e308;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "rangeHigh", (_QWORD)v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "doubleValue");
        v12 = v11;
        if (v10)
        {
          objc_msgSend(v9, "rangeHigh");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "doubleValue");
          v15 = v14;

          if (v12 < v15)
            v12 = v15;
        }

        if (v7 < v12)
          v7 = v12;
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }
  else
  {
    v7 = -1.79769313e308;
  }

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSDate *date;
  NSUInteger v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray componentsJoinedByString:](self->_codings, "componentsJoinedByString:", CFSTR("; "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  date = self->_date;
  v8 = -[NSArray count](self->_quantities, "count");
  -[HKChartableCodedQuantitySet compatibleUnit](self, "compatibleUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> codings: %@, date: %@, %lu quantities in unit %@"), v5, self, v6, date, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSArray)codings
{
  return self->_codings;
}

- (NSDate)date
{
  return self->_date;
}

- (NSArray)quantities
{
  return self->_quantities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantities, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_codings, 0);
}

@end
