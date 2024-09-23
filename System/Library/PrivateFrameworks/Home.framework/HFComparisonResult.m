@implementation HFComparisonResult

- (HFComparisonResult)initWithObjectA:(id)a3 objectB:(id)a4
{
  id v6;
  id v7;
  HFComparisonResult *v8;
  HFComparisonResult *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  __CFString **v17;
  void *v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HFComparisonResult;
  v8 = -[HFComparisonResult init](&v20, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_objectA, v6);
    objc_storeWeak(&v9->_objectB, v7);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFComparisonResult setMutableDifferences:](v9, "setMutableDifferences:", v10);

    objc_opt_class();
    v11 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    objc_opt_class();
    v14 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    if (v13 && v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_12;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_12;
    }
    else if ((v13 != 0) != (v16 != 0))
    {
LABEL_12:
      v17 = HFComparisonResultClassesKey;
      goto LABEL_16;
    }
    if ((v11 == 0) != (v14 != 0))
    {
LABEL_17:

      goto LABEL_18;
    }
    v17 = HFComparisonResultCompareToNilKey;
LABEL_16:
    +[HFDifference difference:priority:](HFDifference, "difference:priority:", *v17, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFComparisonResult add:](v9, "add:", v18);

    goto LABEL_17;
  }
LABEL_18:

  return v9;
}

+ (HFComparisonResult)resultWithDifference:(id)a3 priority:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithObjectA:objectB:", 0, 0);
  +[HFDifference difference:priority:](HFDifference, "difference:priority:", v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "add:", v7);
  return (HFComparisonResult *)v6;
}

- (id)filteredIgnoringKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = (void *)-[HFComparisonResult copy](self, "copy");
  objc_msgSend(v5, "mutableDifferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__HFComparisonResult_filteredIgnoringKeys___block_invoke;
  v11[3] = &unk_1EA73C758;
  v12 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_filter:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v5, "setMutableDifferences:", v9);

  return v5;
}

uint64_t __43__HFComparisonResult_filteredIgnoringKeys___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (void)add:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *realDifferences;

  if (a3)
  {
    v4 = a3;
    -[HFComparisonResult mutableDifferences](self, "mutableDifferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, v6);

    realDifferences = self->_realDifferences;
    self->_realDifferences = 0;

  }
}

- (id)newDifferenceWithKey:(id)a3 priority:(unint64_t)a4 block:(id)a5
{
  void *v6;

  +[HFDifference difference:priority:withBlock:](HFDifference, "difference:priority:withBlock:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFComparisonResult add:](self, "add:", v6);
  return v6;
}

- (void)addAll:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__HFComparisonResult_addAll___block_invoke;
  v3[3] = &unk_1EA73C780;
  v3[4] = self;
  objc_msgSend(a3, "na_each:", v3);
}

uint64_t __29__HFComparisonResult_addAll___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "add:", a2);
}

- (NSArray)realDifferences
{
  NSArray *realDifferences;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  realDifferences = self->_realDifferences;
  if (!realDifferences)
  {
    -[HFComparisonResult differences](self, "differences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_filter:", &__block_literal_global_189);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_realDifferences;
    self->_realDifferences = v6;

    realDifferences = self->_realDifferences;
  }
  return realDifferences;
}

BOOL __37__HFComparisonResult_realDifferences__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "priority") != 0;
}

- (BOOL)containsCriticalDifference
{
  void *v2;
  char v3;

  -[HFComparisonResult realDifferences](self, "realDifferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_5_14);

  return v3;
}

BOOL __48__HFComparisonResult_containsCriticalDifference__block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)objc_msgSend(a2, "priority") > 3;
}

- (id)highestPriorityDifference
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__23;
  v10 = __Block_byref_object_dispose__23;
  v11 = 0;
  -[HFComparisonResult differences](self, "differences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__HFComparisonResult_highestPriorityDifference__block_invoke;
  v5[3] = &unk_1EA73C808;
  v5[4] = &v6;
  objc_msgSend(v2, "na_each:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__HFComparisonResult_highestPriorityDifference__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  unint64_t v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "priority"))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (!*(_QWORD *)(v5 + 40))
    {
LABEL_5:
      objc_storeStrong((id *)(v5 + 40), a3);
      goto LABEL_6;
    }
    v6 = objc_msgSend(v7, "priority");
    if (v6 > objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "priority"))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      goto LABEL_5;
    }
  }
LABEL_6:

}

- (BOOL)hasNoDifferencesHigherThanPriority:(unint64_t)a3
{
  void *v4;
  void *v5;
  BOOL v6;

  -[HFComparisonResult highestPriorityDifference](self, "highestPriorityDifference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "priority") <= a3;
  else
    v6 = 1;

  return v6;
}

- (id)descriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D519B8]), "initWithObject:", self);
  -[HFComparisonResult objectA](self, "objectA");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v4, CFSTR("objectA"), 1);

  -[HFComparisonResult objectB](self, "objectB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v6, CFSTR("objectB"), 1);

  -[HFComparisonResult realDifferences](self, "realDifferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v8, CFSTR("differences"), 0);

  return v3;
}

- (id)description
{
  void *v2;
  void *v3;

  -[HFComparisonResult descriptionBuilder](self, "descriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[HFComparisonResult objectA](self, "objectA");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObjectA:", v5);

  -[HFComparisonResult objectB](self, "objectB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObjectB:", v6);

  v7 = (void *)-[NSMutableDictionary copy](self->_mutableDifferences, "copy");
  objc_msgSend(v4, "setMutableDifferences:", v7);

  return v4;
}

- (id)objectA
{
  return objc_loadWeakRetained(&self->_objectA);
}

- (void)setObjectA:(id)a3
{
  objc_storeWeak(&self->_objectA, a3);
}

- (id)objectB
{
  return objc_loadWeakRetained(&self->_objectB);
}

- (void)setObjectB:(id)a3
{
  objc_storeWeak(&self->_objectB, a3);
}

- (NSMutableDictionary)mutableDifferences
{
  return self->_mutableDifferences;
}

- (void)setMutableDifferences:(id)a3
{
  objc_storeStrong((id *)&self->_mutableDifferences, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableDifferences, 0);
  objc_destroyWeak(&self->_objectB);
  objc_destroyWeak(&self->_objectA);
  objc_storeStrong((id *)&self->_realDifferences, 0);
}

@end
