@implementation _HKCompoundFilter

- (_HKCompoundFilter)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _HKCompoundFilter *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "hk_typesForArrayOf:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v6, CFSTR("subfilters"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("compoundType"));
  v9 = -[_HKCompoundFilter initWithType:subfilters:](self, "initWithType:subfilters:", v8, v7);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subfilters, 0);
}

- (NSArray)subfilters
{
  return self->_subfilters;
}

- (BOOL)acceptsDataObject:(id)a3
{
  id v4;
  unint64_t compoundPredicateType;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  int v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_subfilterCount)
  {
LABEL_29:
    LOBYTE(v11) = 1;
    goto LABEL_30;
  }
  compoundPredicateType = self->_compoundPredicateType;
  switch(compoundPredicateType)
  {
    case 0uLL:
      -[NSArray firstObject](self->_subfilters, "firstObject");
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v11 = -[NSArray acceptsDataObject:](v6, "acceptsDataObject:", v4) ^ 1;
LABEL_27:

      goto LABEL_30;
    case 2uLL:
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v12 = self->_subfilters;
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v20 != v15)
              objc_enumerationMutation(v12);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "acceptsDataObject:", v4, (_QWORD)v19) & 1) != 0)
            {

              goto LABEL_29;
            }
          }
          v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v14)
            continue;
          break;
        }
      }
      break;
    case 1uLL:
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v6 = self->_subfilters;
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v24;
        while (2)
        {
          for (j = 0; j != v8; ++j)
          {
            if (*(_QWORD *)v24 != v9)
              objc_enumerationMutation(v6);
            if (!objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "acceptsDataObject:", v4))
            {
              LOBYTE(v11) = 0;
              goto LABEL_27;
            }
          }
          v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
          if (v8)
            continue;
          break;
        }
      }
      LOBYTE(v11) = 1;
      goto LABEL_27;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_HKCompoundFilter acceptsDataObject:]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray handleFailureInFunction:file:lineNumber:description:](v12, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("_HKCompoundFilter.m"), 114, CFSTR("Unreachable code has been executed"));

      break;
  }

  LOBYTE(v11) = 0;
LABEL_30:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKCompoundFilter)init
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

- (_HKCompoundFilter)initWithType:(unint64_t)a3 subfilters:(id)a4
{
  id v7;
  void *v8;
  _HKCompoundFilter *v9;
  uint64_t v10;
  NSArray *subfilters;
  void *v13;
  objc_super v14;

  v7 = a4;
  v8 = v7;
  if (a3 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKCompoundFilter.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_IsValidCompoundType(type)"));
LABEL_9:

    goto LABEL_4;
  }
  if (!a3 && (unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKCompoundFilter.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type != NSNotPredicateType || subfilters.count <= 1"));
    goto LABEL_9;
  }
LABEL_4:
  v14.receiver = self;
  v14.super_class = (Class)_HKCompoundFilter;
  v9 = -[_HKCompoundFilter init](&v14, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    subfilters = v9->_subfilters;
    v9->_subfilters = (NSArray *)v10;

    v9->_subfilterCount = -[NSArray count](v9->_subfilters, "count");
    v9->_compoundPredicateType = a3;
  }

  return v9;
}

+ (id)compoundFilterWithFilter:(id)a3 otherFilter:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _HKCompoundFilter *v8;
  void *v9;
  _HKCompoundFilter *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = [_HKCompoundFilter alloc];
    v13[0] = v5;
    v13[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[_HKCompoundFilter initWithType:subfilters:](v8, "initWithType:subfilters:", 1, v9);

  }
  else
  {
    if (v5)
      v11 = v5;
    else
      v11 = v6;
    v10 = v11;
  }

  return v10;
}

+ (id)andFilterWithSubfilters:(id)a3
{
  id v3;
  _HKCompoundFilter *v4;

  v3 = a3;
  v4 = -[_HKCompoundFilter initWithType:subfilters:]([_HKCompoundFilter alloc], "initWithType:subfilters:", 1, v3);

  return v4;
}

+ (id)orFilterWithSubfilters:(id)a3
{
  id v3;
  _HKCompoundFilter *v4;

  v3 = a3;
  v4 = -[_HKCompoundFilter initWithType:subfilters:]([_HKCompoundFilter alloc], "initWithType:subfilters:", 2, v3);

  return v4;
}

+ (id)notFilterWithSubfilter:(id)a3
{
  id v3;
  _HKCompoundFilter *v4;
  void *v5;
  _HKCompoundFilter *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [_HKCompoundFilter alloc];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_HKCompoundFilter initWithType:subfilters:](v4, "initWithType:subfilters:", 0, v5);
  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  HKStringFromCompoundOperatorType(self->_compoundPredicateType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray componentsJoinedByString:](self->_subfilters, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@ [%@]>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)acceptsActivitySummary:(id)a3
{
  id v4;
  unint64_t compoundPredicateType;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  NSArray *v23;
  void *v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_subfilterCount)
  {
LABEL_31:
    v15 = 1;
    goto LABEL_36;
  }
  compoundPredicateType = self->_compoundPredicateType;
  if (compoundPredicateType)
  {
    if (compoundPredicateType == 2)
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v6 = self->_subfilters;
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v28;
        LOBYTE(v19) = 1;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v28 != v18)
              objc_enumerationMutation(v6);
            v21 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "acceptsActivitySummary:", v4, (_QWORD)v27);
            if (v21 == 1)
            {

              goto LABEL_31;
            }
            v19 = (v21 == 2) & v19;
          }
          v17 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v17)
            continue;
          break;
        }

        if (!v19)
          goto LABEL_35;
        goto LABEL_29;
      }
LABEL_28:

LABEL_29:
      v15 = 2;
      goto LABEL_36;
    }
    if (compoundPredicateType == 1)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v6 = self->_subfilters;
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v32;
        LOBYTE(v10) = 1;
LABEL_7:
        v11 = 0;
        while (1)
        {
          if (*(_QWORD *)v32 != v9)
            objc_enumerationMutation(v6);
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v11), "acceptsActivitySummary:", v4);
          if (!v12)
            goto LABEL_34;
          v10 = (v12 == 2) & v10;
          if (v8 == ++v11)
          {
            v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
            if (v8)
              goto LABEL_7;

            if (v10)
              goto LABEL_29;
            goto LABEL_31;
          }
        }
      }
      goto LABEL_28;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_HKCompoundFilter acceptsActivitySummary:]");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v6;
    v24 = v22;
    v25 = 162;
LABEL_33:
    -[NSArray handleFailureInFunction:file:lineNumber:description:](v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("_HKCompoundFilter.m"), v25, CFSTR("Unreachable code has been executed"));

LABEL_34:
LABEL_35:
    v15 = 0;
    goto LABEL_36;
  }
  -[NSArray firstObject](self->_subfilters, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "acceptsActivitySummary:", v4);

  if (v14 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_HKCompoundFilter acceptsActivitySummary:]");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v6;
    v24 = v22;
    v25 = 159;
    goto LABEL_33;
  }
  v15 = qword_19A44D268[v14];
LABEL_36:

  return v15;
}

- (int64_t)acceptsDataObjectWithStartTimestamp:(double)a3 endTimestamp:(double)a4 valueInCanonicalUnit:(double)a5
{
  unint64_t compoundPredicateType;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  NSArray *v26;
  void *v27;
  uint64_t v28;
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
  if (!self->_subfilterCount)
    return 1;
  compoundPredicateType = self->_compoundPredicateType;
  if (compoundPredicateType)
  {
    if (compoundPredicateType == 2)
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v9 = self->_subfilters;
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v30;
        LOBYTE(v22) = 1;
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v30 != v21)
              objc_enumerationMutation(v9);
            v24 = objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "acceptsDataObjectWithStartTimestamp:endTimestamp:valueInCanonicalUnit:", a3, a4, a5, (_QWORD)v29);
            if (v24 == 1)
            {

              return 1;
            }
            v22 = (v24 == 2) & v22;
          }
          v20 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v20)
            continue;
          break;
        }

        if (!v22)
          return 0;
        return 2;
      }
LABEL_28:

      return 2;
    }
    if (compoundPredicateType == 1)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v9 = self->_subfilters;
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v34;
        LOBYTE(v13) = 1;
LABEL_7:
        v14 = 0;
        while (1)
        {
          if (*(_QWORD *)v34 != v12)
            objc_enumerationMutation(v9);
          v15 = objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v14), "acceptsDataObjectWithStartTimestamp:endTimestamp:valueInCanonicalUnit:", a3, a4, a5);
          if (!v15)
            goto LABEL_34;
          v13 = (v15 == 2) & v13;
          if (v11 == ++v14)
          {
            v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
            if (v11)
              goto LABEL_7;

            if (v13)
              return 2;
            return 1;
          }
        }
      }
      goto LABEL_28;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_HKCompoundFilter acceptsDataObjectWithStartTimestamp:endTimestamp:valueInCanonicalUnit:]");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v9;
    v27 = v25;
    v28 = 210;
  }
  else
  {
    -[NSArray firstObject](self->_subfilters, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "acceptsDataObjectWithStartTimestamp:endTimestamp:valueInCanonicalUnit:", a3, a4, a5);

    if (v17 < 3)
      return qword_19A44D268[v17];
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_HKCompoundFilter acceptsDataObjectWithStartTimestamp:endTimestamp:valueInCanonicalUnit:]");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v9;
    v27 = v25;
    v28 = 207;
  }
  -[NSArray handleFailureInFunction:file:lineNumber:description:](v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("_HKCompoundFilter.m"), v28, CFSTR("Unreachable code has been executed"));

LABEL_34:
  return 0;
}

- (BOOL)acceptsWorkoutActivity:(id)a3
{
  id v4;
  unint64_t compoundPredicateType;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  int v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_subfilterCount)
  {
LABEL_29:
    LOBYTE(v11) = 1;
    goto LABEL_30;
  }
  compoundPredicateType = self->_compoundPredicateType;
  switch(compoundPredicateType)
  {
    case 0uLL:
      -[NSArray firstObject](self->_subfilters, "firstObject");
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v11 = -[NSArray acceptsWorkoutActivity:](v6, "acceptsWorkoutActivity:", v4) ^ 1;
LABEL_27:

      goto LABEL_30;
    case 2uLL:
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v12 = self->_subfilters;
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v20 != v15)
              objc_enumerationMutation(v12);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "acceptsWorkoutActivity:", v4, (_QWORD)v19) & 1) != 0)
            {

              goto LABEL_29;
            }
          }
          v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v14)
            continue;
          break;
        }
      }
      break;
    case 1uLL:
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v6 = self->_subfilters;
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v24;
        while (2)
        {
          for (j = 0; j != v8; ++j)
          {
            if (*(_QWORD *)v24 != v9)
              objc_enumerationMutation(v6);
            if (!objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "acceptsWorkoutActivity:", v4))
            {
              LOBYTE(v11) = 0;
              goto LABEL_27;
            }
          }
          v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
          if (v8)
            continue;
          break;
        }
      }
      LOBYTE(v11) = 1;
      goto LABEL_27;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_HKCompoundFilter acceptsWorkoutActivity:]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray handleFailureInFunction:file:lineNumber:description:](v12, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("_HKCompoundFilter.m"), 243, CFSTR("Unreachable code has been executed"));

      break;
  }

  LOBYTE(v11) = 0;
LABEL_30:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  _HKCompoundFilter *v4;
  NSUInteger v5;
  BOOL v6;

  v4 = (_HKCompoundFilter *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    v6 = (objc_opt_isKindOfClass() & 1) != 0
      && self->_compoundPredicateType == v4->_compoundPredicateType
      && (v5 = -[NSArray count](self->_subfilters, "count"), v5 == -[NSArray count](v4->_subfilters, "count"))
      && -[NSArray isEqualToArray:](self->_subfilters, "isEqualToArray:", v4->_subfilters);
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t compoundPredicateType;

  compoundPredicateType = self->_compoundPredicateType;
  return -[NSArray hash](self->_subfilters, "hash") ^ compoundPredicateType;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKCompoundFilter;
  v4 = a3;
  -[_HKFilter encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_subfilters, CFSTR("subfilters"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_compoundPredicateType, CFSTR("compoundType"));

}

- (unint64_t)compoundPredicateType
{
  return self->_compoundPredicateType;
}

@end
