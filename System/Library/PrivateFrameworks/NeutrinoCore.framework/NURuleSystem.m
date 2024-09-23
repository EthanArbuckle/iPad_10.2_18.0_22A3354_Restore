@implementation NURuleSystem

- (NURuleSystem)init
{
  NURuleSystem *v2;
  uint64_t v3;
  NSMutableDictionary *state;
  uint64_t v5;
  NSMutableDictionary *constants;
  uint64_t v7;
  NSMutableArray *rules;
  uint64_t v9;
  NSMutableArray *agenda;
  uint64_t v11;
  NSMutableArray *executed;
  uint64_t v13;
  NSMapTable *gradeByFact;
  uint64_t v15;
  NSMutableString *runLog;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)NURuleSystem;
  v2 = -[NURuleSystem init](&v18, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    state = v2->_state;
    v2->_state = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    constants = v2->_constants;
    v2->_constants = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    rules = v2->_rules;
    v2->_rules = (NSMutableArray *)v7;

    v9 = objc_opt_new();
    agenda = v2->_agenda;
    v2->_agenda = (NSMutableArray *)v9;

    v11 = objc_opt_new();
    executed = v2->_executed;
    v2->_executed = (NSMutableArray *)v11;

    v13 = objc_opt_new();
    gradeByFact = v2->_gradeByFact;
    v2->_gradeByFact = (NSMapTable *)v13;

    v15 = objc_opt_new();
    runLog = v2->_runLog;
    v2->_runLog = (NSMutableString *)v15;

  }
  return v2;
}

- (NURuleSystem)initWithCoder:(id)a3
{
  id v4;
  NURuleSystem *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  Class v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NURuleSystem init](self, "init");
  if (NUIsAppleInternal_onceToken != -1)
    dispatch_once(&NUIsAppleInternal_onceToken, &__block_literal_global_14);
  if (NUIsAppleInternal_isAppleInternal)
  {
    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0C99E60];
      v7 = objc_opt_class();
      v8 = objc_opt_class();
      v9 = objc_opt_class();
      v10 = objc_opt_class();
      v11 = objc_opt_class();
      v12 = objc_opt_class();
      objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("constants"));
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
        -[NSMutableDictionary setDictionary:](v5->_constants, "setDictionary:", v14);
      v43 = (void *)v14;
      v15 = (void *)MEMORY[0x1E0C99E20];
      v16 = objc_opt_class();
      v17 = objc_opt_class();
      v18 = objc_opt_class();
      v19 = objc_opt_class();
      v20 = objc_opt_class();
      objc_msgSend(v15, "setWithObjects:", v16, v17, v18, v19, v20, objc_opt_class(), 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = NSClassFromString(CFSTR("PIReframeSubject"));
      if (v22)
        objc_msgSend(v21, "addObject:", v22);
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("state"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
        -[NSMutableDictionary setDictionary:](v5->_state, "setDictionary:", v23);
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("rules"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
        -[NSMutableArray setArray:](v5->_rules, "setArray:", v24);
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("agenda"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
        -[NSMutableArray setArray:](v5->_agenda, "setArray:", v25);
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("executed"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
        -[NSMutableArray setArray:](v5->_executed, "setArray:", v26);
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("facts"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v27)
      {
        v38 = v26;
        v39 = v25;
        v40 = v24;
        v41 = v23;
        v42 = v21;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        objc_msgSend(v27, "allKeys");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v45;
          do
          {
            for (i = 0; i != v31; ++i)
            {
              if (*(_QWORD *)v45 != v32)
                objc_enumerationMutation(v29);
              v34 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
              objc_msgSend(v28, "objectForKeyedSubscript:", v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMapTable setObject:forKey:](v5->_gradeByFact, "setObject:forKey:", v35, v34);

            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
          }
          while (v31);
        }

        v23 = v41;
        v21 = v42;
        v25 = v39;
        v24 = v40;
        v26 = v38;
      }
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("runlog"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
        -[NSMutableString setString:](v5->_runLog, "setString:", v36);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C78], CFSTR("Decoding NURuleSystem is not supported"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *constants;
  void *v5;
  id v6;

  constants = self->_constants;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", constants, CFSTR("constants"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_rules, CFSTR("rules"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_agenda, CFSTR("agenda"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_executed, CFSTR("executed"));
  -[NSMapTable dictionaryRepresentation](self->_gradeByFact, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("facts"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_runLog, CFSTR("runlog"));
}

- (void)evaluate
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_agenda;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    while (2)
    {
      v6 = *(_QWORD *)v11;
LABEL_4:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        if ((objc_msgSend(v8, "evaluatePredicateWithSystem:", self) & 1) != 0)
          break;
        if (v5 == ++v7)
        {
          v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          if (v5)
            goto LABEL_4;
          goto LABEL_16;
        }
      }
      v9 = v8;

      if (v9)
      {
        -[NSMutableArray removeObject:](self->_agenda, "removeObject:", v9);
        -[NSMutableArray addObject:](self->_executed, "addObject:", v9);
        if (self->_enableLogging)
          -[NSMutableString appendFormat:](self->_runLog, "appendFormat:", CFSTR("predicate fired for rule #%d, performing action\n"), -[NSMutableArray indexOfObject:](self->_rules, "indexOfObject:", v9));
        objc_msgSend(v9, "performActionWithSystem:", self);
      }

      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v3 = self->_agenda;
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_16:

}

- (void)resetAndEvaluateWithInitialState:(id)a3
{
  id v4;

  v4 = a3;
  -[NURuleSystem reset](self, "reset");
  -[NSMutableDictionary setDictionary:](self->_state, "setDictionary:", v4);

  -[NURuleSystem evaluate](self, "evaluate");
}

- (void)setStateObject:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  NSMutableString *runLog;
  uint64_t v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (self->_enableLogging)
  {
    -[NSMutableDictionary valueForKey:](self->_state, "valueForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    runLog = self->_runLog;
    if (v7)
      -[NSMutableString appendFormat:](runLog, "appendFormat:", CFSTR("replacing state for key '%@' of value '%@' to new value '%@'\n"), v6, v7, v10);
    else
      -[NSMutableString appendFormat:](runLog, "appendFormat:", CFSTR("setting state for key '%@' to value '%@'\n"), v6, v10, v9);

  }
  -[NSMutableDictionary setObject:forKey:](self->_state, "setObject:forKey:", v10, v6);

}

- (NSDictionary)constants
{
  return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", self->_constants);
}

- (void)setConstants:(id)a3
{
  -[NSMutableDictionary setDictionary:](self->_constants, "setDictionary:", a3);
}

- (NSArray)rules
{
  return (NSArray *)self->_rules;
}

- (NSArray)agenda
{
  return (NSArray *)self->_agenda;
}

- (NSArray)executed
{
  return (NSArray *)self->_executed;
}

- (void)_addRuleToAgenda:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_agenda;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      v10 = 0;
      v11 = v8 + v7;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "salience", (_QWORD)v13);
        if (v12 < objc_msgSend(v4, "salience"))
        {
          v11 = v8 + v10;
          goto LABEL_12;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_12:

  -[NSMutableArray insertObject:atIndex:](self->_agenda, "insertObject:atIndex:", v4, v11);
}

- (void)addRule:(id)a3
{
  NSMutableArray *rules;
  id v5;

  rules = self->_rules;
  v5 = a3;
  -[NSMutableArray addObject:](rules, "addObject:", v5);
  -[NURuleSystem _addRuleToAgenda:](self, "_addRuleToAgenda:", v5);

}

- (void)addRulesFromArray:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableArray addObjectsFromArray:](self->_rules, "addObjectsFromArray:", v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[NURuleSystem _addRuleToAgenda:](self, "_addRuleToAgenda:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)removeAllRules
{
  -[NSMutableArray removeAllObjects](self->_rules, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_agenda, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_executed, "removeAllObjects");
}

- (NSDictionary)facts
{
  return -[NSMapTable dictionaryRepresentation](self->_gradeByFact, "dictionaryRepresentation");
}

- (double)gradeForFact:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[NSMapTable objectForKey:](self->_gradeByFact, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (double)minimumGradeForFacts:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = 1.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        -[NSMapTable objectForKey:](self->_gradeByFact, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "doubleValue");
        v12 = v11;

        if (v12 < v8)
          v8 = v12;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 1.0;
  }

  return v8;
}

- (double)maximumGradeForFacts:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        -[NSMapTable objectForKey:](self->_gradeByFact, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "doubleValue");
        v12 = v11;

        if (v12 > v8)
          v8 = v12;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (void)assertFact:(id)a3
{
  -[NURuleSystem assertFact:grade:](self, "assertFact:grade:", a3, 1.0);
}

- (void)assertFact:(id)a3 grade:(double)a4
{
  void *v6;
  double v7;
  double v8;
  double v9;
  NSMapTable *gradeByFact;
  void *v11;
  id v12;

  v12 = a3;
  -[NSMapTable objectForKey:](self->_gradeByFact, "objectForKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  if (v8 + a4 <= 1.0)
    v9 = v8 + a4;
  else
    v9 = 1.0;
  if (self->_enableLogging)
    -[NSMutableString appendFormat:](self->_runLog, "appendFormat:", CFSTR("asserted '%@' by +%.2f to %.2f\n"), v12, *(_QWORD *)&a4, *(_QWORD *)&v9);
  if (v9 != v8)
  {
    gradeByFact = self->_gradeByFact;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](gradeByFact, "setObject:forKey:", v11, v12);

    -[NURuleSystem evaluate](self, "evaluate");
  }

}

- (void)retractFact:(id)a3
{
  -[NURuleSystem retractFact:grade:](self, "retractFact:grade:", a3, 1.0);
}

- (void)retractFact:(id)a3 grade:(double)a4
{
  void *v6;
  double v7;
  double v8;
  double v9;
  NSMapTable *gradeByFact;
  void *v11;
  id v12;

  v12 = a3;
  -[NSMapTable objectForKey:](self->_gradeByFact, "objectForKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  if (v8 != 0.0)
  {
    v9 = fmax(v8 - a4, 0.0);
    if (self->_enableLogging)
      -[NSMutableString appendFormat:](self->_runLog, "appendFormat:", CFSTR("retracted '%@' by -%.2f to %.2f\n"), v12, *(_QWORD *)&a4, *(_QWORD *)&v9);
    if (v9 != v8)
    {
      gradeByFact = self->_gradeByFact;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](gradeByFact, "setObject:forKey:", v11, v12);

      -[NURuleSystem evaluate](self, "evaluate");
    }
  }

}

- (void)reset
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray removeAllObjects](self->_agenda, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_executed, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_gradeByFact, "removeAllObjects");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = self->_rules;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[NURuleSystem _addRuleToAgenda:](self, "_addRuleToAgenda:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableString deleteCharactersInRange:](self->_runLog, "deleteCharactersInRange:", 0, -[NSMutableString length](self->_runLog, "length"));
}

- (NSString)runLog
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", self->_runLog);
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  uint64_t v36;
  void *v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t n;
  NSMutableArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t ii;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@, %p>\n"), v5, self);

  objc_msgSend(v3, "appendString:", CFSTR(".constants {\n"));
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  -[NSMutableDictionary allKeys](self->_constants, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_22856);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v70 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_constants, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@ = %@,\n"), v12, v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
    }
    while (v9);
  }

  objc_msgSend(v3, "appendString:", CFSTR("}\n"));
  objc_msgSend(v3, "appendString:", CFSTR(".state {\n"));
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  -[NSMutableDictionary allKeys](self->_state, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sortedArrayUsingComparator:", &__block_literal_global_22856);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v66;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v66 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_state, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@ = %@,\n"), v20, v21);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
    }
    while (v17);
  }

  objc_msgSend(v3, "appendString:", CFSTR("}\n"));
  objc_msgSend(v3, "appendString:", CFSTR(".rules {\n"));
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v22 = self->_rules;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v61, v76, 16);
  if (v23)
  {
    v24 = v23;
    v25 = 0;
    v26 = *(_QWORD *)v62;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v62 != v26)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * k), "debugDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%d: %@,\n"), v25 + k, v28);

      }
      v25 = (v25 + k);
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v61, v76, 16);
    }
    while (v24);
  }

  objc_msgSend(v3, "appendString:", CFSTR("}\n"));
  objc_msgSend(v3, "appendString:", CFSTR(".facts {\n"));
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  -[NSMapTable keyEnumerator](self->_gradeByFact, "keyEnumerator");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "allObjects");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sortedArrayUsingComparator:", &__block_literal_global_22856);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v57, v75, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v58;
    do
    {
      for (m = 0; m != v33; ++m)
      {
        if (*(_QWORD *)v58 != v34)
          objc_enumerationMutation(v31);
        v36 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * m);
        -[NSMapTable objectForKey:](self->_gradeByFact, "objectForKey:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@ = %@,\n"), v36, v37);

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v57, v75, 16);
    }
    while (v33);
  }

  objc_msgSend(v3, "appendString:", CFSTR("}\n"));
  objc_msgSend(v3, "appendString:", CFSTR(".agenda { "));
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v38 = self->_agenda;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v53, v74, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v54;
    do
    {
      for (n = 0; n != v40; ++n)
      {
        if (*(_QWORD *)v54 != v41)
          objc_enumerationMutation(v38);
        objc_msgSend(v3, "appendFormat:", CFSTR("%d, "), -[NSMutableArray indexOfObject:](self->_rules, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * n)));
      }
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v53, v74, 16);
    }
    while (v40);
  }

  objc_msgSend(v3, "appendString:", CFSTR("}\n"));
  objc_msgSend(v3, "appendString:", CFSTR(".executed { "));
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v43 = self->_executed;
  v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v49, v73, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v50;
    do
    {
      for (ii = 0; ii != v45; ++ii)
      {
        if (*(_QWORD *)v50 != v46)
          objc_enumerationMutation(v43);
        objc_msgSend(v3, "appendFormat:", CFSTR("%d, "), -[NSMutableArray indexOfObject:](self->_rules, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * ii)));
      }
      v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v49, v73, 16);
    }
    while (v45);
  }

  objc_msgSend(v3, "appendString:", CFSTR("}\n"));
  objc_msgSend(v3, "appendString:", CFSTR(".runlog {\n"));
  objc_msgSend(v3, "appendString:", self->_runLog);
  objc_msgSend(v3, "appendString:", CFSTR("}\n"));
  return v3;
}

- (id)debugQuickLookObject
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t n;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t ii;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  NSMutableDictionary *obj;
  NSMutableDictionary *obja;
  NSMutableArray *objb;
  id objc;
  NSMutableArray *objd;
  NSMutableArray *obje;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendString:", CFSTR("<html>"));
  objc_msgSend(v3, "appendString:", CFSTR("<body>"));
  objc_msgSend(v3, "appendString:", CFSTR("<style>"));
  objc_msgSend(v3, "appendString:", CFSTR("body { background-color: white; } "));
  objc_msgSend(v3, "appendString:", CFSTR("h1 { color: black; margin-left: 2px; } "));
  objc_msgSend(v3, "appendString:", CFSTR("h2 { color: black; margin-left: 1px; } "));
  objc_msgSend(v3, "appendString:", CFSTR("table { color: black; margin-left: 0px; border: 0px solid white; } "));
  objc_msgSend(v3, "appendString:", CFSTR("td { color: black; } "));
  objc_msgSend(v3, "appendString:", CFSTR("p, pre { color: black; } "));
  objc_msgSend(v3, "appendString:", CFSTR("</style>"));
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<h1>%@</h1>"), v5);

  objc_msgSend(v3, "appendString:", CFSTR("<h2>Constants</h2>"));
  objc_msgSend(v3, "appendString:", CFSTR("<table>"));
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = self->_constants;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v79 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i);
        objc_msgSend(v3, "appendString:", CFSTR("<tr>"));
        -[NSMutableDictionary objectForKeyedSubscript:](self->_constants, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("<td>%d.</td><td>%@</td><td>%@</td>"), v8 + i, v11, v12);

        objc_msgSend(v3, "appendString:", CFSTR("</tr>"));
      }
      v8 = (v8 + i);
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "appendString:", CFSTR("</table><br />"));
  objc_msgSend(v3, "appendString:", CFSTR("<h2>State</h2>"));
  objc_msgSend(v3, "appendString:", CFSTR("<table>"));
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  obja = self->_state;
  v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v75;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v75 != v16)
          objc_enumerationMutation(obja);
        v18 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * j);
        objc_msgSend(v3, "appendString:", CFSTR("<tr>"));
        -[NSMutableDictionary objectForKeyedSubscript:](self->_state, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("<td>%d.</td><td>%@</td><td>%@</td>"), v15 + j, v18, v19);

        objc_msgSend(v3, "appendString:", CFSTR("</tr>"));
      }
      v15 = (v15 + j);
      v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
    }
    while (v14);
  }

  objc_msgSend(v3, "appendString:", CFSTR("</table><br />"));
  objc_msgSend(v3, "appendString:", CFSTR("<h2>Rules</h2>"));
  objc_msgSend(v3, "appendString:", CFSTR("<table>"));
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  objb = self->_rules;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v70, v85, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v23 = *(_QWORD *)v71;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v71 != v23)
          objc_enumerationMutation(objb);
        v25 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * k);
        objc_msgSend(v3, "appendString:", CFSTR("<tr>"));
        objc_msgSend(v25, "debugDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("<td>%d.</td><td>%@</td>"), v22 + k, v26);

        objc_msgSend(v3, "appendString:", CFSTR("</tr>"));
      }
      v22 = (v22 + k);
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v70, v85, 16);
    }
    while (v21);
  }

  objc_msgSend(v3, "appendString:", CFSTR("</table><br />"));
  objc_msgSend(v3, "appendString:", CFSTR("<h2>Facts</h2>"));
  objc_msgSend(v3, "appendString:", CFSTR("<table>"));
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  -[NSMapTable keyEnumerator](self->_gradeByFact, "keyEnumerator");
  objc = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
  if (v27)
  {
    v28 = v27;
    v29 = 0;
    v30 = *(_QWORD *)v67;
    do
    {
      for (m = 0; m != v28; ++m)
      {
        if (*(_QWORD *)v67 != v30)
          objc_enumerationMutation(objc);
        v32 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * m);
        objc_msgSend(v3, "appendString:", CFSTR("<tr>"));
        -[NSMapTable objectForKey:](self->_gradeByFact, "objectForKey:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("<td>%d.</td><td>%@</td><td>%@</td>"), v29 + m, v32, v33);

        objc_msgSend(v3, "appendString:", CFSTR("</tr>"));
      }
      v29 = (v29 + m);
      v28 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
    }
    while (v28);
  }

  objc_msgSend(v3, "appendString:", CFSTR("</table><br />"));
  objc_msgSend(v3, "appendString:", CFSTR("<h2>Agenda</h2>"));
  objc_msgSend(v3, "appendString:", CFSTR("<table>"));
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  objd = self->_agenda;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](objd, "countByEnumeratingWithState:objects:count:", &v62, v83, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v63;
    do
    {
      for (n = 0; n != v35; ++n)
      {
        if (*(_QWORD *)v63 != v36)
          objc_enumerationMutation(objd);
        v38 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * n);
        v39 = -[NSMutableArray indexOfObject:](self->_rules, "indexOfObject:", v38);
        objc_msgSend(v3, "appendString:", CFSTR("<tr>"));
        objc_msgSend(v38, "debugDescription");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("<td>%d.</td><td>%@</td>"), v39, v40);

        objc_msgSend(v3, "appendString:", CFSTR("</tr>"));
      }
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](objd, "countByEnumeratingWithState:objects:count:", &v62, v83, 16);
    }
    while (v35);
  }

  objc_msgSend(v3, "appendString:", CFSTR("</table><br />"));
  objc_msgSend(v3, "appendString:", CFSTR("<h2>Executed</h2>"));
  objc_msgSend(v3, "appendString:", CFSTR("<table>"));
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  obje = self->_executed;
  v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obje, "countByEnumeratingWithState:objects:count:", &v58, v82, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v59;
    do
    {
      for (ii = 0; ii != v42; ++ii)
      {
        if (*(_QWORD *)v59 != v43)
          objc_enumerationMutation(obje);
        v45 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * ii);
        v46 = -[NSMutableArray indexOfObject:](self->_rules, "indexOfObject:", v45);
        objc_msgSend(v3, "appendString:", CFSTR("<tr>"));
        objc_msgSend(v45, "debugDescription");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("<td>%d.</td><td>%@</td>"), v46, v47);

        objc_msgSend(v3, "appendString:", CFSTR("</tr>"));
      }
      v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obje, "countByEnumeratingWithState:objects:count:", &v58, v82, 16);
    }
    while (v42);
  }

  objc_msgSend(v3, "appendString:", CFSTR("</table><br />"));
  objc_msgSend(v3, "appendString:", CFSTR("<h2>Run Log</h2>"));
  objc_msgSend(v3, "appendString:", CFSTR("<pre>"));
  objc_msgSend(v3, "appendString:", self->_runLog);
  objc_msgSend(v3, "appendString:", CFSTR("</pre>"));
  objc_msgSend(v3, "appendString:", CFSTR("</body>"));
  objc_msgSend(v3, "appendString:", CFSTR("</html>"));
  v48 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend(v48, "initWithData:options:documentAttributes:error:", v49, &unk_1E50A3570, 0, 0);

  return v50;
}

- (NSDictionary)state
{
  return &self->_state->super;
}

- (BOOL)enableLogging
{
  return self->_enableLogging;
}

- (void)setEnableLogging:(BOOL)a3
{
  self->_enableLogging = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runLog, 0);
  objc_storeStrong((id *)&self->_gradeByFact, 0);
  objc_storeStrong((id *)&self->_executed, 0);
  objc_storeStrong((id *)&self->_agenda, 0);
  objc_storeStrong((id *)&self->_rules, 0);
  objc_storeStrong((id *)&self->_constants, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

uint64_t __32__NURuleSystem_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
