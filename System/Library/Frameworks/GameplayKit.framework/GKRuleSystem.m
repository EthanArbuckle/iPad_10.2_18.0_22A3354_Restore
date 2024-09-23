@implementation GKRuleSystem

- (GKRuleSystem)init
{
  GKRuleSystem *v2;
  uint64_t v3;
  NSMutableDictionary *state;
  uint64_t v5;
  NSMutableArray *rules;
  uint64_t v7;
  NSMutableArray *agenda;
  uint64_t v9;
  NSMutableArray *toBeExecuted;
  uint64_t v11;
  NSMutableArray *executed;
  uint64_t v13;
  NSMapTable *gradeByFact;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)GKRuleSystem;
  v2 = -[GKRuleSystem init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    state = v2->_state;
    v2->_state = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    rules = v2->_rules;
    v2->_rules = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    agenda = v2->_agenda;
    v2->_agenda = (NSMutableArray *)v7;

    v9 = objc_opt_new();
    toBeExecuted = v2->_toBeExecuted;
    v2->_toBeExecuted = (NSMutableArray *)v9;

    v11 = objc_opt_new();
    executed = v2->_executed;
    v2->_executed = (NSMutableArray *)v11;

    v13 = objc_opt_new();
    gradeByFact = v2->_gradeByFact;
    v2->_gradeByFact = (NSMapTable *)v13;

  }
  return v2;
}

- (void)evaluate
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_agenda;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 == v6)
        {
          v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          if (!objc_msgSend(v8, "evaluatePredicateWithSystem:", self))
            continue;
        }
        else
        {
          objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          if (!objc_msgSend(v8, "evaluatePredicateWithSystem:", self, (_QWORD)v10))
            continue;
        }
        -[NSMutableArray addObject:](self->_toBeExecuted, "addObject:", v8, (_QWORD)v10);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeObjectsInArray:](self->_agenda, "removeObjectsInArray:", self->_toBeExecuted);
  while (-[NSMutableArray count](self->_toBeExecuted, "count"))
  {
    -[NSMutableArray firstObject](self->_toBeExecuted, "firstObject", (_QWORD)v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_toBeExecuted, "removeObjectAtIndex:", 0);
    -[NSMutableArray addObject:](self->_executed, "addObject:", v9);
    objc_msgSend(v9, "performActionWithSystem:", self);

  }
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

  v18 = *MEMORY[0x24BDAC8D0];
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

- (void)addRule:(GKRule *)rule
{
  NSMutableArray *rules;
  GKRule *v5;

  rules = self->_rules;
  v5 = rule;
  -[NSMutableArray addObject:](rules, "addObject:", v5);
  -[GKRuleSystem _addRuleToAgenda:](self, "_addRuleToAgenda:", v5);

}

- (void)addRulesFromArray:(NSArray *)rules
{
  NSArray *v4;
  NSArray *v5;
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

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = rules;
  -[NSMutableArray addObjectsFromArray:](self->_rules, "addObjectsFromArray:", v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        -[GKRuleSystem _addRuleToAgenda:](self, "_addRuleToAgenda:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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

- (NSArray)facts
{
  void *v2;
  void *v3;

  -[NSMapTable keyEnumerator](self->_gradeByFact, "keyEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (float)gradeForFact:(id)fact
{
  void *v3;
  float v4;
  float v5;

  -[NSMapTable objectForKey:](self->_gradeByFact, "objectForKey:", fact);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (float)minimumGradeForFacts:(NSArray *)facts
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  uint64_t v9;
  void *v10;
  float v11;
  float v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = facts;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = 1.0;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        -[NSMapTable objectForKey:](self->_gradeByFact, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "floatValue");
        v12 = v11;

        v8 = fminf(v12, v8);
        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 1.0;
  }

  return v8;
}

- (float)maximumGradeForFacts:(NSArray *)facts
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  uint64_t v9;
  void *v10;
  float v11;
  float v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = facts;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = 0.0;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        -[NSMapTable objectForKey:](self->_gradeByFact, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "floatValue");
        v12 = v11;

        v8 = fmaxf(v12, v8);
        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (void)assertFact:(id)fact
{
  double v3;

  LODWORD(v3) = 1.0;
  -[GKRuleSystem assertFact:grade:](self, "assertFact:grade:", fact, v3);
}

- (void)assertFact:(id)fact grade:(float)grade
{
  void *v6;
  float v7;
  float v8;
  NSMapTable *gradeByFact;
  void *v10;
  id v11;

  v11 = fact;
  -[NSMapTable objectForKey:](self->_gradeByFact, "objectForKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  if (fminf(v8 + grade, 1.0) != v8)
  {
    gradeByFact = self->_gradeByFact;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](gradeByFact, "setObject:forKey:", v10, v11);

    -[GKRuleSystem evaluate](self, "evaluate");
  }

}

- (void)retractFact:(id)fact
{
  double v3;

  LODWORD(v3) = 1.0;
  -[GKRuleSystem retractFact:grade:](self, "retractFact:grade:", fact, v3);
}

- (void)retractFact:(id)fact grade:(float)grade
{
  void *v6;
  float v7;
  float v8;
  double v9;
  void *v10;
  NSMapTable *gradeByFact;
  void *v12;
  id v13;

  v13 = fact;
  -[NSMapTable objectForKey:](self->_gradeByFact, "objectForKey:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  v10 = v13;
  if (v8 == 0.0)
    goto LABEL_2;
  *(float *)&v9 = v8 - grade;
  if ((float)(v8 - grade) < 0.0)
  {
    -[NSMapTable removeObjectForKey:](self->_gradeByFact, "removeObjectForKey:", v13, v9);
LABEL_8:
    -[GKRuleSystem evaluate](self, "evaluate");

    return;
  }
  v10 = v13;
  if (*(float *)&v9 != v8)
  {
    gradeByFact = self->_gradeByFact;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](gradeByFact, "setObject:forKey:", v12, v13);

    goto LABEL_8;
  }
LABEL_2:

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

  v13 = *MEMORY[0x24BDAC8D0];
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
        -[GKRuleSystem _addRuleToAgenda:](self, "_addRuleToAgenda:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (NSMutableDictionary)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradeByFact, 0);
  objc_storeStrong((id *)&self->_executed, 0);
  objc_storeStrong((id *)&self->_toBeExecuted, 0);
  objc_storeStrong((id *)&self->_agenda, 0);
  objc_storeStrong((id *)&self->_rules, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end
