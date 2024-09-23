@implementation VSExpressionEvaluator

- (void)dealloc
{
  objc_super v3;

  if (-[VSExpressionEvaluator isMonitoringForChanges](self, "isMonitoringForChanges"))
    -[VSExpressionEvaluator _stopMonitoringForChanges](self, "_stopMonitoringForChanges");
  v3.receiver = self;
  v3.super_class = (Class)VSExpressionEvaluator;
  -[VSExpressionEvaluator dealloc](&v3, sel_dealloc);
}

- (id)_observersForExpression:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  VSObservance *v27;
  void *v28;
  VSObservance *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_msgSend(v4, "expressionType");
  switch(v6)
  {
    case 0:
    case 1:
      goto LABEL_55;
    case 2:
      objc_msgSend(v4, "variable");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[VSExpressionEvaluator substitutionVariables](self, "substitutionVariables");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (!v9)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The variableValueOrNil parameter must not be nil."));
        v10 = v9;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v11 = (void *)MEMORY[0x1E0C99DA0];
          v12 = *MEMORY[0x1E0C99778];
          v13 = (objc_class *)objc_opt_class();
          NSStringFromClass(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "raise:format:", v12, CFSTR("Unexpectedly, variableValue was %@, instead of NSExpression."), v14);

        }
        -[VSExpressionEvaluator _observersForExpression:](self, "_observersForExpression:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v15);

      }
      goto LABEL_50;
    case 3:
      -[VSExpressionEvaluator object](self, "object");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v27 = [VSObservance alloc];
        objc_msgSend(v4, "keyPath");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[VSObservance initWithObject:keyPath:options:](v27, "initWithObject:keyPath:options:", v26, v28, 0);

        objc_msgSend(v5, "addObject:", v29);
      }

      goto LABEL_55;
    case 4:
      objc_msgSend(v4, "function");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqual:", CFSTR("sum:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("count:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("min:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("max:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("average:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("median:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("mode:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("stddev:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("add:to:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("from:subtract:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("multiply:by:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("divide:by:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("modulus:by:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("sqrt:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("log:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("ln:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("raise:toPower:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("exp:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("floor:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("ceiling:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("abs:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("trunc:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("uppercase:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("lowercase:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("bitwiseAnd:with:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("bitwiseOr:with:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("bitwiseXor:with:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("leftshift:by:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("rightshift:by:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("onesCompliment:")) & 1) != 0
        || (objc_msgSend(v7, "isEqual:", CFSTR("distanceToLocation:fromLocation:")) & 1) != 0
        || objc_msgSend(v7, "isEqual:", CFSTR("length:")))
      {

        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        objc_msgSend(v4, "arguments");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v32;
          do
          {
            v24 = 0;
            do
            {
              if (*(_QWORD *)v32 != v23)
                objc_enumerationMutation(v9);
              -[VSExpressionEvaluator _observersForExpression:](self, "_observersForExpression:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v24));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObjectsFromArray:", v25);

              ++v24;
            }
            while (v22 != v24);
            v22 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          }
          while (v22);
        }
LABEL_50:

      }
      else
      {

        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported expression: %@"), v4);
      }
      goto LABEL_51;
    default:
      if (v6 == 20)
      {
        objc_msgSend(v4, "predicate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSExpressionEvaluator _observersForPredicate:](self, "_observersForPredicate:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v17);

        objc_msgSend(v4, "trueExpression");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSExpressionEvaluator _observersForExpression:](self, "_observersForExpression:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v19);

        objc_msgSend(v4, "falseExpression");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        -[VSExpressionEvaluator _observersForExpression:](self, "_observersForExpression:", v7);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v20);

LABEL_51:
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported expression: %@"), v4);
      }
LABEL_55:

      return v5;
  }
}

- (id)_observersForPredicate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = (void *)MEMORY[0x1E0C99DA0];
      v7 = *MEMORY[0x1E0C99778];
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "raise:format:", v7, CFSTR("Unexpectedly, predicate was %@, instead of NSCompoundPredicate."), v9);

    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v4, "subpredicates");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          -[VSExpressionEvaluator _observersForPredicate:](self, "_observersForPredicate:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v12);
    }
LABEL_19:

    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99778];
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "raise:format:", v17, CFSTR("Unexpectedly, predicate was %@, instead of NSComparisonPredicate."), v19);

    }
    v10 = v4;
    if (objc_msgSend(v10, "predicateOperatorType") == 11)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported comparison predicate: %@"), v10);
    }
    else
    {
      objc_msgSend(v10, "leftExpression");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSExpressionEvaluator _observersForExpression:](self, "_observersForExpression:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v21);

      objc_msgSend(v10, "rightExpression");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSExpressionEvaluator _observersForExpression:](self, "_observersForExpression:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v23);

    }
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported predicate: %@"), v4);
LABEL_20:

  return v5;
}

- (void)_startMonitoringForChanges
{
  void *v3;
  void *v4;
  id v5;

  if (!-[VSExpressionEvaluator isMonitoringForChanges](self, "isMonitoringForChanges"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[VSExpressionEvaluator expression](self, "expression");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[VSExpressionEvaluator _observersForExpression:](self, "_observersForExpression:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v4);

    }
    objc_msgSend(v5, "makeObjectsPerformSelector:withObject:", sel_setDelegate_, self);
    objc_msgSend(v5, "makeObjectsPerformSelector:", sel_startObserving);
    -[VSExpressionEvaluator setObservers:](self, "setObservers:", v5);
    -[VSExpressionEvaluator setMonitoringForChanges:](self, "setMonitoringForChanges:", 1);

  }
}

- (void)_stopMonitoringForChanges
{
  void *v3;

  if (-[VSExpressionEvaluator isMonitoringForChanges](self, "isMonitoringForChanges"))
  {
    -[VSExpressionEvaluator observers](self, "observers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "makeObjectsPerformSelector:", sel_stopObserving);

    -[VSExpressionEvaluator setObservers:](self, "setObservers:", MEMORY[0x1E0C9AA60]);
    -[VSExpressionEvaluator setMonitoringForChanges:](self, "setMonitoringForChanges:", 0);
  }
}

- (void)_updateComputedResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[VSExpressionEvaluator expression](self, "expression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSExpressionEvaluator object](self, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSExpressionEvaluator substitutionVariables](self, "substitutionVariables");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v5, "expressionValueWithObject:context:", v6, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = -[VSExpressionEvaluator hasDeterminedValue](self, "hasDeterminedValue");
  if (!(_DWORD)v5 || v9 == v4)
  {
    -[VSExpressionEvaluator setHasDeterminedValue:](self, "setHasDeterminedValue:", 1);
    -[VSExpressionEvaluator setValue:](self, "setValue:", v9);
  }
  else
  {
    -[VSExpressionEvaluator willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("value"));
    -[VSExpressionEvaluator setHasDeterminedValue:](self, "setHasDeterminedValue:", 1);
    -[VSExpressionEvaluator setValue:](self, "setValue:", v9);
    -[VSExpressionEvaluator didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("value"));
  }

}

- (void)_updateComputedResultIfNeeded
{
  id v3;

  if (-[VSExpressionEvaluator hasDeterminedValue](self, "hasDeterminedValue"))
  {
    -[VSExpressionEvaluator value](self, "value");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[VSExpressionEvaluator _updateComputedResult:](self, "_updateComputedResult:", v3);

  }
}

- (NSDictionary)substitutionVariables
{
  NSDictionary *v2;

  v2 = self->_substitutionVariables;
  if (!v2)
    v2 = (NSDictionary *)MEMORY[0x1E0C9AA70];
  return v2;
}

- (void)setSubstitutionVariables:(id)a3
{
  NSDictionary *v4;
  NSDictionary *v5;
  NSDictionary *substitutionVariables;
  NSDictionary *v7;
  NSDictionary *v8;
  NSDictionary *v9;

  v4 = (NSDictionary *)a3;
  if (self->_substitutionVariables != v4)
  {
    v9 = v4;
    if (-[VSExpressionEvaluator isMonitoringForChanges](self, "isMonitoringForChanges"))
    {
      -[VSExpressionEvaluator _startMonitoringForChanges](self, "_startMonitoringForChanges");
      v5 = (NSDictionary *)-[NSDictionary copy](v9, "copy");
      substitutionVariables = self->_substitutionVariables;
      self->_substitutionVariables = v5;

      -[VSExpressionEvaluator _startMonitoringForChanges](self, "_startMonitoringForChanges");
    }
    else
    {
      v7 = (NSDictionary *)-[NSDictionary copy](v9, "copy");
      v8 = self->_substitutionVariables;
      self->_substitutionVariables = v7;

    }
    -[VSExpressionEvaluator _updateComputedResultIfNeeded](self, "_updateComputedResultIfNeeded");
    v4 = v9;
  }

}

- (void)setObject:(id)a3
{
  if (self->_object != a3)
  {
    if (-[VSExpressionEvaluator isMonitoringForChanges](self, "isMonitoringForChanges"))
    {
      -[VSExpressionEvaluator _stopMonitoringForChanges](self, "_stopMonitoringForChanges");
      self->_object = a3;
      -[VSExpressionEvaluator _startMonitoringForChanges](self, "_startMonitoringForChanges");
    }
    else
    {
      self->_object = a3;
    }
    -[VSExpressionEvaluator _updateComputedResultIfNeeded](self, "_updateComputedResultIfNeeded");
  }
}

+ (BOOL)automaticallyNotifiesObserversOfValue
{
  return 0;
}

- (id)value
{
  id v3;

  if (-[VSExpressionEvaluator hasDeterminedValue](self, "hasDeterminedValue"))
  {
    v3 = self->_value;
  }
  else
  {
    -[VSExpressionEvaluator _updateComputedResult:](self, "_updateComputedResult:", 0);
    -[VSExpressionEvaluator _startMonitoringForChanges](self, "_startMonitoringForChanges");
    -[VSExpressionEvaluator value](self, "value");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSExpression)expression
{
  return self->_expression;
}

- (void)setExpression:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)object
{
  return self->_object;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (BOOL)isMonitoringForChanges
{
  return self->_monitoringForChanges;
}

- (void)setMonitoringForChanges:(BOOL)a3
{
  self->_monitoringForChanges = a3;
}

- (NSArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)hasDeterminedValue
{
  return self->_hasDeterminedValue;
}

- (void)setHasDeterminedValue:(BOOL)a3
{
  self->_hasDeterminedValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_expression, 0);
  objc_storeStrong((id *)&self->_substitutionVariables, 0);
}

@end
