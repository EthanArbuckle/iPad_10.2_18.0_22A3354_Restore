@implementation FBKQuestionDependencyNode

- (FBKQuestionDependencyNode)initWithQuestion:(id)a3
{
  id v4;
  FBKQuestionDependencyNode *v5;
  void *v6;
  uint64_t v7;
  NSString *tat;
  void *v9;
  void *v10;
  NSSet *v11;
  NSSet *dependencyTats;
  void *v13;
  uint64_t v14;
  NSPredicate *visibilityPredicateTemplate;
  uint64_t v16;
  NSHashTable *dependencyChildren;
  void *v18;
  uint64_t v19;
  NSNumber *questionID;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FBKQuestionDependencyNode;
  v5 = -[FBKQuestionDependencyNode init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "role");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    tat = v5->_tat;
    v5->_tat = (NSString *)v7;

    objc_msgSend(v4, "conditions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKQuestionDependencyNode dependentTatsForConditions:](v5, "dependentTatsForConditions:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v11 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    dependencyTats = v5->_dependencyTats;
    v5->_dependencyTats = v11;

    objc_msgSend(v4, "conditions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKQuestionDependencyNode predicateForConditions:](v5, "predicateForConditions:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    visibilityPredicateTemplate = v5->_visibilityPredicateTemplate;
    v5->_visibilityPredicateTemplate = (NSPredicate *)v14;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v16 = objc_claimAutoreleasedReturnValue();
    dependencyChildren = v5->_dependencyChildren;
    v5->_dependencyChildren = (NSHashTable *)v16;

    objc_msgSend(v4, "ID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    questionID = v5->_questionID;
    v5->_questionID = (NSNumber *)v19;

  }
  return v5;
}

- (void)registerDependentChild:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FBKQuestionDependencyNode dependencyChildren](self, "dependencyChildren");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (NSSet)dependentChildren
{
  void *v2;
  void *v3;

  -[FBKQuestionDependencyNode dependencyChildren](self, "dependencyChildren");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (BOOL)isVisibleInFormResponse:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  FBKQuestionDependencyNode *v26;
  id obj;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v28 = a3;
  -[FBKQuestionDependencyNode graph](self, "graph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (-[FBKQuestionDependencyNode dependencyTats](self, "dependencyTats"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6))
  {
    v7 = objc_alloc(MEMORY[0x24BDBCED8]);
    -[FBKQuestionDependencyNode dependencyTats](self, "dependencyTats");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v26 = self;
    -[FBKQuestionDependencyNode dependencyTats](self, "dependencyTats");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v4, "tatToQuestionMap");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16
            || (objc_msgSend(v28, "answerForQuestion:", v16), (v17 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
            || (v18 = v17,
                objc_msgSend(v17, "value"),
                v19 = (void *)objc_claimAutoreleasedReturnValue(),
                v18,
                !v19))
          {
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v20 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v14, "substringFromIndex:", 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("tat_%@"), v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v19, v22);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v11);
    }

    -[FBKQuestionDependencyNode visibilityPredicateTemplate](v26, "visibilityPredicateTemplate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "evaluateWithObject:substitutionVariables:", 0, v9);

  }
  else
  {
    v24 = 1;
  }

  return v24;
}

- (id)dependentTatsForConditions:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t i;
  void *v13;
  void *v14;

  v4 = a3;
  if (!v4)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "hasPrefix:", CFSTR(":")))
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
LABEL_10:
    v9 = 0;
    goto LABEL_18;
  }
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v6 = v4;
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKQuestionDependencyNode dependentTatsForConditions:](self, "dependentTatsForConditions:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v5, "unionSet:", v8);

  }
  else if ((unint64_t)objc_msgSend(v6, "count") >= 3)
  {
    v10 = objc_msgSend(v6, "count");
    if (v10)
    {
      v11 = v10;
      for (i = 0; i < v11; i += 2)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBKQuestionDependencyNode dependentTatsForConditions:](self, "dependentTatsForConditions:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          objc_msgSend(v5, "unionSet:", v14);

      }
    }
  }
  v9 = (void *)objc_msgSend(v5, "copy");

LABEL_18:
  return v9;
}

- (id)predicateForConditions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char isKindOfClass;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  FBKQuestionDependencyNode *v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 1);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v8 = (void *)v9;
    goto LABEL_19;
  }
  v6 = objc_msgSend(v4, "count");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == 1)
  {
    -[FBKQuestionDependencyNode predicateForConditions:](self, "predicateForConditions:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_17;
  }
  objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_17:
    -[FBKQuestionDependencyNode _predicateFromLeafArray:](self, "_predicateFromLeafArray:", v5);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  v12 = objc_msgSend(v5, "count");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKQuestionDependencyNode predicateForConditions:](self, "predicateForConditions:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 >= 3)
  {
    v14 = 2;
    v15 = 0x24BDBC000uLL;
    v25 = self;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v14 - 1, v25);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[FBKQuestionDependencyNode predicateForConditions:](self, "predicateForConditions:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "isEqualToString:", CFSTR(":or")))
          v19 = 2;
        else
          v19 = 1;
        v20 = v12;
        v21 = objc_alloc(MEMORY[0x24BDD14C0]);
        v26[0] = v8;
        v26[1] = v18;
        objc_msgSend(*(id *)(v15 + 3632), "arrayWithObjects:count:", v26, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "initWithType:subpredicates:", v19, v22);

        v15 = 0x24BDBC000;
        v8 = (void *)v23;
        v12 = v20;
        self = v25;
      }

      v14 += 2;
    }
    while (v14 < v12);
  }
LABEL_19:

  return v8;
}

- (id)_substitutionFromToken:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "hasPrefix:", CFSTR(":")))
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v3, "substringFromIndex:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("$tat_%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_predicateFromLeafArray:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  objc_class *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;

  v4 = a3;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
  v7 = objc_claimAutoreleasedReturnValue();

  -[FBKQuestionDependencyNode _substitutionFromToken:](self, "_substitutionFromToken:", v5);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[FBKQuestionDependencyNode _substitutionFromToken:](self, "_substitutionFromToken:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("%@");
  if (v8)
    v12 = v8;
  else
    v12 = CFSTR("%@");
  if (v9)
    v11 = (__CFString *)v9;
  v13 = v11;
  v14 = (objc_class *)MEMORY[0x24BDBCEB8];
  v15 = v12;
  v16 = (void *)objc_msgSend([v14 alloc], "initWithCapacity:", 2);
  v17 = v16;
  if (v8)
  {
    if (v10)
      goto LABEL_8;
  }
  else
  {
    objc_msgSend(v16, "addObject:", v5);
    if (v10)
      goto LABEL_8;
  }
  objc_msgSend(v17, "addObject:", v7);
LABEL_8:
  v25 = (void *)v7;
  objc_msgSend(v6, "substringFromIndex:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "uppercaseString");
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)v5;
  if (-[__CFString isEqualToString:](v19, "isEqualToString:", CFSTR("IS")))
  {

    v19 = CFSTR("==");
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@ %@ %@)"), v15, v19, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x24BDD1758];
  v22 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v21, "predicateWithFormat:argumentArray:", v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (FBKQuestionDependencyGraph)graph
{
  return (FBKQuestionDependencyGraph *)objc_loadWeakRetained((id *)&self->_graph);
}

- (void)setGraph:(id)a3
{
  objc_storeWeak((id *)&self->_graph, a3);
}

- (NSNumber)questionID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)tat
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)dependencyTats
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDependencyTats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSHashTable)dependencyChildren
{
  return (NSHashTable *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDependencyChildren:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSPredicate)visibilityPredicateTemplate
{
  return (NSPredicate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setVisibilityPredicateTemplate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityPredicateTemplate, 0);
  objc_storeStrong((id *)&self->_dependencyChildren, 0);
  objc_storeStrong((id *)&self->_dependencyTats, 0);
  objc_storeStrong((id *)&self->_tat, 0);
  objc_storeStrong((id *)&self->_questionID, 0);
  objc_destroyWeak((id *)&self->_graph);
}

@end
