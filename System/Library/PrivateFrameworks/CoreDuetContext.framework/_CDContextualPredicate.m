@implementation _CDContextualPredicate

- (NSSet)keyPaths
{
  return self->_keyPaths;
}

- (BOOL)firesOnAnyChange
{
  return self->_predicate == 0;
}

- (double)minimumDurationInPreviousState
{
  return self->_minimumDurationInPreviousState;
}

- (BOOL)evaluateWithState:(id)a3 previousValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  BOOL v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  char v25;
  void *v26;
  char v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  BOOL v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  unint64_t v40;
  NSObject *v41;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[_CDContextualPredicate keyPaths](self, "keyPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v45 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12 == 0;

        if (v13)
        {

          goto LABEL_50;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v9);
  }

  if (!v7)
    goto LABEL_20;
  -[_CDContextualPredicate predicateForPreviousState](self, "predicateForPreviousState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0
    || (-[_CDContextualPredicate predicateForPreviousState](self, "predicateForPreviousState"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "compoundPredicateType") == 0,
        v16,
        v17))
  {
LABEL_20:
    -[_CDContextualPredicate predicate](self, "predicate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "evaluateWithObject:", v6);

    if ((v27 & 1) != 0)
    {
      v28 = v7 != 0;
      -[_CDContextualPredicate predicateForPreviousState](self, "predicateForPreviousState");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v29)
        v28 = 0;

      if (v28)
      {
        -[_CDContextualPredicate predicateForPreviousState](self, "predicateForPreviousState");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v30, "evaluateWithObject:", v7);

      }
      else
      {
        v25 = 1;
      }
      goto LABEL_51;
    }
LABEL_50:
    v25 = 0;
    goto LABEL_51;
  }
  -[_CDContextualPredicate predicate](self, "predicate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContextualPredicate predicateForPreviousState](self, "predicateForPreviousState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_26;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_26;
  v20 = objc_msgSend(v18, "compoundPredicateType");
  if (v20 != objc_msgSend(v19, "compoundPredicateType"))
    goto LABEL_26;
  objc_msgSend(v18, "subpredicates");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");
  objc_msgSend(v19, "subpredicates");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v22) = v22 == objc_msgSend(v23, "count");

  if ((v22 & 1) == 0)
  {
LABEL_26:
    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      -[_CDContextualPredicate evaluateWithState:previousValue:].cold.3();
    goto LABEL_28;
  }
  v24 = objc_msgSend(v18, "compoundPredicateType");
  v43 = v24;
  if (v24 == 2)
  {
    v25 = 0;
    goto LABEL_32;
  }
  if (v24 != 1)
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      -[_CDContextualPredicate evaluateWithState:previousValue:].cold.1(v18, v31);
LABEL_28:
    v25 = 0;
    goto LABEL_29;
  }
  v25 = 1;
LABEL_32:
  objc_msgSend(v18, "subpredicates");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "count") == 0;

  if (v33)
    goto LABEL_30;
  v34 = 0;
  while (1)
  {
    objc_msgSend(v18, "subpredicates");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectAtIndexedSubscript:", v34);
    v31 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "subpredicates");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectAtIndexedSubscript:", v34);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = -[NSObject evaluateWithObject:](v31, "evaluateWithObject:", v6);
    if (v38)
      LOBYTE(v38) = objc_msgSend(v37, "evaluateWithObject:", v7);
    if (v43 != 1)
      break;
    if ((v38 & 1) == 0)
      goto LABEL_48;
LABEL_41:

    objc_msgSend(v18, "subpredicates");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "count");

    if (++v34 >= v40)
      goto LABEL_30;
  }
  if (v43 == 2)
  {
    if ((v38 & 1) != 0)
    {
      v25 = 1;
      goto LABEL_49;
    }
    goto LABEL_41;
  }
  objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
    -[_CDContextualPredicate evaluateWithState:previousValue:].cold.2(v18, v41);

LABEL_48:
  v25 = 0;
LABEL_49:

LABEL_29:
LABEL_30:

LABEL_51:
  return v25;
}

- (NSPredicate)predicateForPreviousState
{
  return self->_predicateForPreviousState;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyPaths, CFSTR("keyPaths"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_predicate, CFSTR("predicate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_predicateForPreviousState, CFSTR("predicateForPreviousState"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_timeBasedPredicateEvaluationIntervals, CFSTR("timeBasedPredicateEvaluationIntervals"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_circularLocationRegions, CFSTR("circularLocationRegions"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_evaluateOnEveryKeyPathUpdate, CFSTR("evaluateOnEveryKeyPathUpdate"));
  if (self->_minimumDurationInPreviousState > 2.22507386e-308)
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("duration"));

}

- (_CDContextualPredicate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _CDContextualPredicate *v21;
  NSObject *v22;
  void *v24;
  _CDContextualPredicate *v25;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("keyPaths"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("predicate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (!+[_CDPredicateValidator validatePredicate:allowedKeys:error:](_CDPredicateValidator, "validatePredicate:allowedKeys:error:", v12, 0, 0))
      {
        objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          -[_CDContextualPredicate initWithCoder:].cold.2();
        goto LABEL_15;
      }
      objc_msgSend(v12, "allowEvaluation");
    }
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("predicateForPreviousState"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
LABEL_8:
      v14 = (void *)MEMORY[0x1E0C99E60];
      v15 = objc_opt_class();
      objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("timeBasedPredicateEvaluationIntervals"));
      v25 = self;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0C99E60];
      v18 = objc_opt_class();
      objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("circularLocationRegions"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_alloc_init(_CDContextualPredicate);
      -[_CDContextualPredicate setKeyPaths:](v21, "setKeyPaths:", v8);
      -[_CDContextualPredicate setPredicate:](v21, "setPredicate:", v12);
      -[_CDContextualPredicate setPredicateForPreviousState:](v21, "setPredicateForPreviousState:", v13);
      -[_CDContextualPredicate setTimeBasedPredicateEvaluationIntervals:](v21, "setTimeBasedPredicateEvaluationIntervals:", v16);
      -[_CDContextualPredicate setCircularLocationRegions:](v21, "setCircularLocationRegions:", v20);
      -[_CDContextualPredicate setEvaluateOnEveryKeyPathUpdate:](v21, "setEvaluateOnEveryKeyPathUpdate:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("evaluateOnEveryKeyPathUpdate")));
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("duration"));
      -[_CDContextualPredicate setMinimumDurationInPreviousState:](v21, "setMinimumDurationInPreviousState:");

      self = v25;
LABEL_16:

      goto LABEL_17;
    }
    if (+[_CDPredicateValidator validatePredicate:allowedKeys:error:](_CDPredicateValidator, "validatePredicate:allowedKeys:error:", v13, 0, 0))
    {
      -[NSObject allowEvaluation](v13, "allowEvaluation");
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      -[_CDContextualPredicate initWithCoder:].cold.1();

LABEL_15:
    v21 = 0;
    goto LABEL_16;
  }
  v21 = 0;
LABEL_17:

  return v21;
}

- (void)setTimeBasedPredicateEvaluationIntervals:(id)a3
{
  objc_storeStrong((id *)&self->_timeBasedPredicateEvaluationIntervals, a3);
}

- (void)setPredicateForPreviousState:(id)a3
{
  objc_storeStrong((id *)&self->_predicateForPreviousState, a3);
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (void)setMinimumDurationInPreviousState:(double)a3
{
  self->_minimumDurationInPreviousState = a3;
}

- (void)setKeyPaths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setEvaluateOnEveryKeyPathUpdate:(BOOL)a3
{
  self->_evaluateOnEveryKeyPathUpdate = a3;
}

- (void)setCircularLocationRegions:(id)a3
{
  objc_storeStrong((id *)&self->_circularLocationRegions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circularLocationRegions, 0);
  objc_storeStrong((id *)&self->_timeBasedPredicateEvaluationIntervals, 0);
  objc_storeStrong((id *)&self->_predicateForPreviousState, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_keyPaths, 0);
}

+ (id)predicateForChangeAtKeyPath:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForChangeAtKeyPath:", v4);

  return v5;
}

- (id)initForChangeAtKeyPath:(id)a3
{
  id v4;
  _CDContextualPredicate *v5;
  uint64_t v6;
  NSSet *keyPaths;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CDContextualPredicate;
  v5 = -[_CDContextualPredicate init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    keyPaths = v5->_keyPaths;
    v5->_keyPaths = (NSSet *)v6;

  }
  return v5;
}

+ (id)predicateForChangeAtKeyPaths:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForChangeAtKeyPaths:", v4);

  return v5;
}

- (id)initForChangeAtKeyPaths:(id)a3
{
  id v4;
  _CDContextualPredicate *v5;
  uint64_t v6;
  NSSet *keyPaths;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CDContextualPredicate;
  v5 = -[_CDContextualPredicate init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    keyPaths = v5->_keyPaths;
    v5->_keyPaths = (NSSet *)v6;

  }
  return v5;
}

+ (id)predicateForKeyPath:(id)a3 equalToValue:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForChangeAtKeyPath:equalToValue:", v7, v6);

  return v8;
}

- (id)initForChangeAtKeyPath:(id)a3 equalToValue:(id)a4
{
  id v6;
  id v7;
  _CDContextualPredicate *v8;
  uint64_t v9;
  NSSet *keyPaths;
  uint64_t v11;
  NSPredicate *predicate;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_CDContextualPredicate;
  v8 = -[_CDContextualPredicate init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    keyPaths = v8->_keyPaths;
    v8->_keyPaths = (NSSet *)v9;

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self.%@.value == %@"), v6, v7);
    v11 = objc_claimAutoreleasedReturnValue();
    predicate = v8->_predicate;
    v8->_predicate = (NSPredicate *)v11;

  }
  return v8;
}

+ (id)predicateForKeyPath:(id)a3 withPredicate:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setKeyPaths:", v9);
  objc_msgSend(v8, "setPredicate:", v6);

  return v8;
}

+ (id)contextualPredicateForKeyPaths:(id)a3 withPredicate:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "setKeyPaths:", v7);

  objc_msgSend(v8, "setPredicate:", v6);
  return v8;
}

+ (id)predicateForKeyPath:(id)a3 withFormat:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a3;
  objc_msgSend(v5, "predicateWithFormat:arguments:", a4, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextualPredicate predicateForKeyPath:withPredicate:](_CDContextualPredicate, "predicateForKeyPath:withPredicate:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)predicateForChangeAtKeyPath:(id)a3 withMinimumDurationInPreviousState:(double)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setKeyPaths:", v8);
  objc_msgSend(v7, "setMinimumDurationInPreviousState:", a4);
  return v7;
}

+ (id)predicateForKeyPath:(id)a3 equalToValue:(id)a4 withMinimumDurationInPreviousState:(double)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setKeyPaths:", v11);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self.%@.value == %@"), v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setPredicate:", v12);
  objc_msgSend(v10, "setMinimumDurationInPreviousState:", a5);
  return v10;
}

+ (id)predicateForKeyPath:(id)a3 withPredicate:(id)a4 withPredicateForPreviousState:(id)a5 withMinimumDurationInPreviousState:(double)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setKeyPaths:", v14);
  objc_msgSend(v13, "setPredicate:", v11);

  objc_msgSend(v13, "setPredicateForPreviousState:", v10);
  objc_msgSend(v13, "setMinimumDurationInPreviousState:", a6);
  return v13;
}

+ (id)notPredicateWithSubpredicate:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  id v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "predicate");
  v5 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v5;
  if (v5)
    objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v5);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "copy");

  v31 = (void *)v8;
  v32 = (void *)v6;
  objc_msgSend(a1, "contextualPredicateForKeyPaths:withPredicate:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "circularLocationRegions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCircularLocationRegions:", v10);

  v34 = v4;
  objc_msgSend(v4, "timeBasedPredicateEvaluationIntervals");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v36;
    do
    {
      v18 = 0;
      v19 = v12;
      do
      {
        if (*(_QWORD *)v36 != v17)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v18);
        v21 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v20, "startDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v21, "initWithStartDate:endDate:", v19, v22);

        objc_msgSend(v23, "duration");
        if (v24 > 0.0)
          objc_msgSend(v13, "addObject:", v23);
        objc_msgSend(v20, "endDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        ++v18;
        v19 = v12;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v16);
  }

  v25 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v25, "initWithStartDate:endDate:", v12, v26);

  objc_msgSend(v27, "duration");
  if (v28 > 0.0)
    objc_msgSend(v13, "addObject:", v27);
  v29 = (void *)objc_msgSend(v13, "copy");

  objc_msgSend(v9, "setTimeBasedPredicateEvaluationIntervals:", v29);
  return v9;
}

+ (id)andPredicateWithSubpredicates:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  double v33;
  id v34;
  id v35;
  void *v36;
  void *v38;
  void *v39;
  id v40;
  id v42;
  id obj;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[5];
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __56___CDContextualPredicate_andPredicateWithSubpredicates___block_invoke;
  v49[3] = &unk_1E26D4CB8;
  v49[4] = &v50;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v49);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v3;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
  if (!v8)
    goto LABEL_19;
  v9 = *(_QWORD *)v46;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v46 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
      objc_msgSend(v11, "predicate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v11, "predicate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addObject:", v13);

      }
      objc_msgSend(v11, "predicateForPreviousState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v11, "predicateForPreviousState");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v15);
      }
      else
      {
        if (!*((_BYTE *)v51 + 24))
          goto LABEL_13;
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v15);
      }

LABEL_13:
      objc_msgSend(v11, "keyPaths");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "unionSet:", v16);

      objc_msgSend(v11, "timeBasedPredicateEvaluationIntervals");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "array");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
        objc_msgSend(v6, "addObjectsFromArray:", v18);
      objc_msgSend(v11, "circularLocationRegions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19 == 0;

      if (!v20)
      {
        objc_msgSend(v11, "circularLocationRegions");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "allObjects");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObjectsFromArray:", v22);

      }
    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
  }
  while (v8);
LABEL_19:

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v44);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v4);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v5, objc_claimAutoreleasedReturnValue());
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v5, 0);
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contextualPredicateForKeyPaths:withPredicate:", v23, v39);
  v42 = (id)objc_claimAutoreleasedReturnValue();

  v40 = (id)objc_msgSend(v6, "copy");
  if (objc_msgSend(v40, "count"))
  {
    v24 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v24, "initWithStartDate:endDate:", v25, v26);

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v28 = v40;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v55;
      do
      {
        v31 = 0;
        v32 = v27;
        do
        {
          if (*(_QWORD *)v55 != v30)
            objc_enumerationMutation(v28);
          objc_msgSend(v32, "intersectionWithDateInterval:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v31));
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          ++v31;
          v32 = v27;
        }
        while (v29 != v31);
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      }
      while (v29);
    }

    if (v27 && (objc_msgSend(v27, "duration"), v33 > 0.0))
      v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithObject:", v27);
    else
      v34 = objc_alloc_init(MEMORY[0x1E0C99E40]);
    v35 = v34;

  }
  else
  {
    v35 = objc_alloc_init(MEMORY[0x1E0C99E40]);
  }

  objc_msgSend(v42, "setTimeBasedPredicateEvaluationIntervals:", v35);
  v36 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v42, "setCircularLocationRegions:", v36);

  objc_msgSend(v42, "setPredicateForPreviousState:", v38);
  _Block_object_dispose(&v50, 8);

  return v42;
}

+ (id)orPredicateWithSubpredicates:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  id obj;
  id v50;
  id v51;
  void *v52;
  uint64_t j;
  void *v54;
  void *v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[5];
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  char v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v50 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v65 = 0;
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __55___CDContextualPredicate_orPredicateWithSubpredicates___block_invoke;
  v61[3] = &unk_1E26D4CB8;
  v61[4] = &v62;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v61);
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v58 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend(v8, "predicate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v8, "predicate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "addObject:", v10);

        }
        objc_msgSend(v8, "predicateForPreviousState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v8, "predicateForPreviousState");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "addObject:", v12);
        }
        else
        {
          if (!*((_BYTE *)v63 + 24))
            goto LABEL_13;
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "addObject:", v12);
        }

LABEL_13:
        objc_msgSend(v8, "keyPaths");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "unionSet:", v13);

        objc_msgSend(v8, "timeBasedPredicateEvaluationIntervals");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "array");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          objc_msgSend(v51, "addObjectsFromArray:", v15);
        objc_msgSend(v8, "circularLocationRegions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16 == 0;

        if (!v17)
        {
          objc_msgSend(v8, "circularLocationRegions");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "allObjects");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addObjectsFromArray:", v19);

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v52, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v52);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = 0;
  }
  if (objc_msgSend(v54, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v54);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v43 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v55);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contextualPredicateForKeyPaths:withPredicate:", v20, v45);
  v44 = (id)objc_claimAutoreleasedReturnValue();

  v42 = (id)objc_msgSend(v51, "copy");
  v21 = (void *)objc_msgSend(v42, "copy");
  do
  {
    v56 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v46 = v21;
    v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
    if (v48)
    {
      v47 = *(_QWORD *)v71;
      do
      {
        for (j = 0; j != v48; ++j)
        {
          if (*(_QWORD *)v71 != v47)
            objc_enumerationMutation(v46);
          v22 = *(id *)(*((_QWORD *)&v70 + 1) + 8 * j);
          v66 = 0u;
          v67 = 0u;
          v68 = 0u;
          v69 = 0u;
          v23 = (void *)objc_msgSend(v56, "copy");
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
          if (v24)
          {
            v25 = *(_QWORD *)v67;
            do
            {
              for (k = 0; k != v24; ++k)
              {
                if (*(_QWORD *)v67 != v25)
                  objc_enumerationMutation(v23);
                v27 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * k);
                if (objc_msgSend(v22, "intersectsDateInterval:", v27))
                {
                  objc_msgSend(v22, "startDate");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "startDate");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "earlierDate:", v29);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v22, "endDate");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "endDate");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "laterDate:", v32);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();

                  v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v30, v33);
                  objc_msgSend(v56, "removeObject:", v27);

                  v22 = (id)v34;
                }
              }
              v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
            }
            while (v24);
          }

          objc_msgSend(v22, "duration");
          if (v35 > 0.0)
            objc_msgSend(v56, "addObject:", v22);

        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
      }
      while (v48);
    }

    v36 = objc_msgSend(v56, "count");
    v37 = objc_msgSend(v46, "count");
    objc_msgSend(v56, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  while (v36 != v37);
  objc_msgSend(v21, "sortedArrayUsingSelector:", sel_compare_);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v38);

  objc_msgSend(v44, "setTimeBasedPredicateEvaluationIntervals:", v39);
  v40 = (void *)objc_msgSend(v50, "copy");
  objc_msgSend(v44, "setCircularLocationRegions:", v40);

  objc_msgSend(v44, "setPredicateForPreviousState:", v43);
  _Block_object_dispose(&v62, 8);

  return v44;
}

- (BOOL)evaluateWithObject:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = -[NSPredicate evaluateWithObject:](self->_predicate, "evaluateWithObject:", v4);

  return (char)self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)-[NSSet copy](self->_keyPaths, "copy");
  objc_msgSend(v4, "setKeyPaths:", v5);

  objc_msgSend(v4, "setPredicate:", self->_predicate);
  objc_msgSend(v4, "setPredicateForPreviousState:", self->_predicateForPreviousState);
  objc_msgSend(v4, "setTimeBasedPredicateEvaluationIntervals:", self->_timeBasedPredicateEvaluationIntervals);
  objc_msgSend(v4, "setCircularLocationRegions:", self->_circularLocationRegions);
  objc_msgSend(v4, "setEvaluateOnEveryKeyPathUpdate:", self->_evaluateOnEveryKeyPathUpdate);
  objc_msgSend(v4, "setMinimumDurationInPreviousState:", self->_minimumDurationInPreviousState);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  _CDContextualPredicate *v5;
  _CDContextualPredicate *v6;
  NSSet *keyPaths;
  void *v8;
  NSPredicate *predicate;
  NSPredicate *v10;
  uint64_t v11;
  int v12;
  char v13;
  NSPredicate *predicateForPreviousState;
  NSPredicate *v15;
  uint64_t v16;
  void *v17;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v5 = (_CDContextualPredicate *)a3;
  if (self == v5)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      keyPaths = self->_keyPaths;
      -[_CDContextualPredicate keyPaths](v6, "keyPaths");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSSet isEqual:](keyPaths, "isEqual:", v8))
      {
        v13 = 0;
LABEL_22:

        goto LABEL_23;
      }
      predicate = self->_predicate;
      v10 = predicate;
      if (!predicate)
      {
        -[_CDContextualPredicate predicate](v6, "predicate");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v22 = 0;
          v12 = 0;
          goto LABEL_14;
        }
        v22 = (void *)v11;
        v10 = self->_predicate;
      }
      -[_CDContextualPredicate predicate](v6, "predicate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[NSPredicate isEqual:](v10, "isEqual:", v3) & 1) == 0)
      {

        v13 = 0;
        goto LABEL_20;
      }
      v12 = 1;
LABEL_14:
      predicateForPreviousState = self->_predicateForPreviousState;
      v15 = predicateForPreviousState;
      if (!predicateForPreviousState)
      {
        -[_CDContextualPredicate predicateForPreviousState](v6, "predicateForPreviousState");
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          v19 = 0;
          v13 = 1;
          goto LABEL_26;
        }
        v20 = v16;
        v15 = self->_predicateForPreviousState;
      }
      -[_CDContextualPredicate predicateForPreviousState](v6, "predicateForPreviousState", v20, v22);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[NSPredicate isEqual:](v15, "isEqual:", v17);

      if (predicateForPreviousState)
      {
        if (!v12)
          goto LABEL_20;
        goto LABEL_19;
      }
      v19 = v21;
LABEL_26:

      if ((v12 & 1) == 0)
      {
LABEL_20:
        if (!predicate)

        goto LABEL_22;
      }
LABEL_19:

      goto LABEL_20;
    }
    v13 = 0;
  }
LABEL_23:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSSet hash](self->_keyPaths, "hash");
  v4 = -[NSPredicate hash](self->_predicate, "hash") ^ v3;
  return v4 ^ -[NSPredicate hash](self->_predicateForPreviousState, "hash");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSPredicate *predicateForPreviousState;
  NSPredicate *predicate;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  predicate = self->_predicate;
  predicateForPreviousState = self->_predicateForPreviousState;
  -[NSSet description](self->_keyPaths, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E26D6BC0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ / %@ | Keypaths: %@:"), v5, predicate, predicateForPreviousState, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)evaluateOnEveryKeyPathUpdate
{
  return self->_evaluateOnEveryKeyPathUpdate;
}

- (NSOrderedSet)timeBasedPredicateEvaluationIntervals
{
  return self->_timeBasedPredicateEvaluationIntervals;
}

- (NSSet)circularLocationRegions
{
  return self->_circularLocationRegions;
}

- (void)evaluateWithObject:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18DD73000, v0, v1, "Invalid predicate: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)evaluateWithState:(void *)a1 previousValue:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "compoundPredicateType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18DD73000, a2, v4, "Unexpected NSCompoundPredicateType %@", v5);

  OUTLINED_FUNCTION_3();
}

- (void)evaluateWithState:(void *)a1 previousValue:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "compoundPredicateType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18DD73000, a2, v4, "Unexpected NSCompoundPredicateType after already checking (%@)", v5);

  OUTLINED_FUNCTION_3();
}

- (void)evaluateWithState:previousValue:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  v3 = 2112;
  v4 = v0;
  _os_log_fault_impl(&dword_18DD73000, v1, OS_LOG_TYPE_FAULT, "Invalid compound predicate combination snuck through: %@ / %@.", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18DD73000, v0, v1, "Client provided invalid _CDContextualPredicate previousPredicate %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18DD73000, v0, v1, "Client provided invalid _CDContextualPredicate predicate %@", v2);
  OUTLINED_FUNCTION_1();
}

@end
