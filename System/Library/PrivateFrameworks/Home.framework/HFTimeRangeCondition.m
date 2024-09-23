@implementation HFTimeRangeCondition

+ (id)_primitiveTimePredicateClasses
{
  if (_MergedGlobals_2_6 != -1)
    dispatch_once(&_MergedGlobals_2_6, &__block_literal_global_8_12);
  return (id)qword_1ED378A48;
}

void __54__HFTimeRangeCondition__primitiveTimePredicateClasses__block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED378A48;
  qword_1ED378A48 = v2;

}

- (HFTimeRangeCondition)initWithPredicate:(id)a3
{
  id v4;
  HFTimeRangeCondition *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id *p_startCondition;
  HFPrimitiveTimeCondition *startCondition;
  void *v23;
  HFPrimitiveTimeCondition *v24;
  int v25;
  HFPrimitiveTimeCondition *v26;
  HFPrimitiveTimeCondition *v27;
  HFPrimitiveTimeCondition *endCondition;
  void *v29;
  HFPrimitiveTimeCondition *v30;
  HFPrimitiveTimeCondition *v31;
  HFPrimitiveTimeCondition *v32;
  HFPrimitiveTimeCondition *v33;
  HFPrimitiveTimeCondition *v34;
  HFPrimitiveTimeCondition *v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  HFTimeRangeCondition *v39;
  id v41;
  void *v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  objc_super v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)HFTimeRangeCondition;
  v5 = -[HFCondition initWithPredicate:](&v52, sel_initWithPredicate_, v4);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_51:
      v39 = 0;
      goto LABEL_52;
    }
    v6 = v4;
    objc_msgSend(v6, "subpredicates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 != 2)
      goto LABEL_50;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v42 = v6;
    objc_msgSend(v6, "subpredicates");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v49;
      v41 = v4;
LABEL_6:
      v12 = 0;
      while (2)
      {
        if (*(_QWORD *)v49 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v12);
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        objc_msgSend((id)objc_opt_class(), "_primitiveTimePredicateClasses");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v45;
LABEL_11:
          v18 = 0;
          while (1)
          {
            if (*(_QWORD *)v45 != v17)
              objc_enumerationMutation(v14);
            v19 = objc_msgSend(objc_alloc(*(Class *)(*((_QWORD *)&v44 + 1) + 8 * v18)), "initWithPredicate:", v13);
            if (v19)
              break;
            if (v16 == ++v18)
            {
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
              if (v16)
                goto LABEL_11;
              goto LABEL_26;
            }
          }
          v20 = (void *)v19;

          if (objc_msgSend(v20, "comparisonType") == 2
            && (p_startCondition = (id *)&v5->_startCondition, !v5->_startCondition)
            || !objc_msgSend(v20, "comparisonType") && (p_startCondition = (id *)&v5->_endCondition, !v5->_endCondition))
          {
            objc_storeStrong(p_startCondition, v20);
          }

          if (++v12 != v10)
            continue;
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
          v4 = v41;
          if (v10)
            goto LABEL_6;
        }
        else
        {
LABEL_26:

          v4 = v41;
        }
        break;
      }
    }

    startCondition = v5->_startCondition;
    v6 = v42;
    if (!startCondition || !v5->_endCondition)
    {
LABEL_50:

      goto LABEL_51;
    }
    v23 = &unk_1F0439530;
    v24 = startCondition;
    v25 = -[HFPrimitiveTimeCondition conformsToProtocol:](v24, "conformsToProtocol:", v23);
    if (v25)
      v26 = v24;
    else
      v26 = 0;
    v27 = v26;

    endCondition = v5->_endCondition;
    v29 = &unk_1F0439530;
    v30 = endCondition;
    if (-[HFPrimitiveTimeCondition conformsToProtocol:](v30, "conformsToProtocol:", v29))
      v31 = v30;
    else
      v31 = 0;
    v32 = v31;

    v33 = v27;
    v34 = v32;
    v35 = v34;
    v36 = 0;
    if (v33)
      v37 = v34 == 0;
    else
      v37 = 1;
    if (!v37)
      v36 = -[HFPrimitiveTimeCondition compare:](v33, "compare:", v34);
    v38 = objc_msgSend(v42, "compoundPredicateType");
    if (v38 == 2)
    {
      if (!v25 || !v35 || v36 == -1)
        goto LABEL_49;
    }
    else if (v38 != 1 || v36 == 1)
    {
LABEL_49:

      goto LABEL_50;
    }

  }
  v39 = v5;
LABEL_52:

  return v39;
}

- (HFTimeRangeCondition)initWithStartCondition:(id)a3 endCondition:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HFTimeRangeCondition *v23;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1F0439530))
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;
  v10 = v7;
  if (objc_msgSend(v10, "conformsToProtocol:", &unk_1F0439530))
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  v13 = v12;
  v14 = v9;
  v15 = v14;
  if (v14)
    v16 = v13 == 0;
  else
    v16 = 1;
  if (v16)
  {
    v17 = 1;
  }
  else if (objc_msgSend(v14, "compare:", v13) == 1)
  {
    v17 = 2;
  }
  else
  {
    v17 = 1;
  }
  v18 = objc_alloc(MEMORY[0x1E0CB3528]);
  objc_msgSend(v6, "predicate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v19;
  objc_msgSend(v10, "predicate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)objc_msgSend(v18, "initWithType:subpredicates:", v17, v21);
  v23 = -[HFTimeRangeCondition initWithPredicate:](self, "initWithPredicate:", v22);

  return v23;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTimeRangeCondition startCondition](self, "startCondition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("startCondition"));

  -[HFTimeRangeCondition endCondition](self, "endCondition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("endCondition"));

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)timeConditionType
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  objc_super v19;

  -[HFTimeRangeCondition startCondition](self, "startCondition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_7;
  }
  -[HFTimeRangeCondition endCondition](self, "endCondition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_7:
    -[HFTimeRangeCondition startCondition](self, "startCondition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_18:

      goto LABEL_19;
    }
    -[HFTimeRangeCondition endCondition](self, "endCondition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v15 = objc_opt_isKindOfClass();

    if ((v15 & 1) == 0)
      goto LABEL_19;
    -[HFTimeRangeCondition startCondition](self, "startCondition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFTimeRangeCondition endCondition](self, "endCondition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isTimeOfDayCondition")
      && objc_msgSend(v7, "isTimeOfDayCondition"))
    {

      return 2;
    }
LABEL_17:

    goto LABEL_18;
  }
  -[HFTimeRangeCondition startCondition](self, "startCondition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTimeRangeCondition endCondition](self, "endCondition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "significantEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CB9B90];
  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB9B90]) & 1) != 0)
  {
    objc_msgSend(v7, "significantEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0CB9B88];
    v12 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB9B88]);

    if (v12)
    {

      return 1;
    }
  }
  else
  {

    v11 = *MEMORY[0x1E0CB9B88];
  }
  objc_msgSend(v6, "significantEvent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "isEqualToString:", v11))
  {

    goto LABEL_17;
  }
  objc_msgSend(v7, "significantEvent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", v9);

  if ((v18 & 1) != 0)
    return 0;
LABEL_19:
  v19.receiver = self;
  v19.super_class = (Class)HFTimeRangeCondition;
  return -[HFTimeCondition timeConditionType](&v19, sel_timeConditionType);
}

- (HFPrimitiveTimeCondition)startCondition
{
  return self->_startCondition;
}

- (HFPrimitiveTimeCondition)endCondition
{
  return self->_endCondition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endCondition, 0);
  objc_storeStrong((id *)&self->_startCondition, 0);
}

@end
