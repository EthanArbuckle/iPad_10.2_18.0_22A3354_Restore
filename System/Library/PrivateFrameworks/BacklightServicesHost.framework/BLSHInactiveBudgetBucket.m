@implementation BLSHInactiveBudgetBucket

- (_QWORD)initWithStartDate:(_QWORD *)a1
{
  id v4;
  id v5;
  BLSHInactiveBudgetBucketEntryCount *v6;
  void *v7;
  BLSHInactiveBudgetBucketEntryCount *v8;
  void *v9;
  BLSHInactiveBudgetBucketEntryCount *v10;
  void *v11;
  objc_super v13;

  v4 = a2;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)BLSHInactiveBudgetBucket;
    v5 = objc_msgSendSuper2(&v13, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 2, a2);
      v6 = objc_alloc_init(BLSHInactiveBudgetBucketEntryCount);
      v7 = (void *)a1[4];
      a1[4] = v6;

      v8 = objc_alloc_init(BLSHInactiveBudgetBucketEntryCount);
      v9 = (void *)a1[5];
      a1[5] = v8;

      v10 = objc_alloc_init(BLSHInactiveBudgetBucketEntryCount);
      v11 = (void *)a1[6];
      a1[6] = v10;

      -[BLSHInactiveBudgetBucket recomputeMinuteBoundary]((uint64_t)a1);
    }
  }

  return a1;
}

- (void)recomputeMinuteBoundary
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  id v9;

  if (a1)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v9, "setSecond:", 0);
    objc_msgSend(MEMORY[0x24BDBCE48], "autoupdatingCurrentCalendar");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "nextDateAfterDate:matchingComponents:options:", *(_QWORD *)(a1 + 16), v9, 5120);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 16));
    v5 = v4;
    objc_msgSend(MEMORY[0x24BE0B8F0], "secondsFidelityThreshold");
    if (v5 < v6)
    {
      v7 = v3;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v7;

  }
}

- (BLSHInactiveBudgetBucket)initWithFutureSpecifier:(id)a3
{
  id v4;
  void *v5;
  BLSHInactiveBudgetBucket *v6;

  v4 = a3;
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (BLSHInactiveBudgetBucket *)-[BLSHInactiveBudgetBucket initWithStartDate:](self, v5);

  if (v6)
    -[BLSHInactiveBudgetBucketEntryCount countSpecifier:hasSecondsBudget:isCoalesceAllowed:](v6->_entryCount, "countSpecifier:hasSecondsBudget:isCoalesceAllowed:", v4, 1, 1);

  return v6;
}

- (BLSHInactiveBudgetBucket)initWithInvalidation:(id)a3
{
  id v4;
  void *v5;
  BLSHInactiveBudgetBucket *v6;

  v4 = a3;
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (BLSHInactiveBudgetBucket *)-[BLSHInactiveBudgetBucket initWithStartDate:](self, v5);

  if (v6)
  {
    -[BLSHInactiveBudgetBucketEntryCount countSpecifier:hasSecondsBudget:isCoalesceAllowed:](v6->_entryCount, "countSpecifier:hasSecondsBudget:isCoalesceAllowed:", v4, 1, 0);
    -[BLSHInactiveBudgetBucketEntryCount countSpecifier:hasSecondsBudget:isCoalesceAllowed:](v6->_renderedEntryCount, "countSpecifier:hasSecondsBudget:isCoalesceAllowed:", v4, 1, 0);
    -[BLSHInactiveBudgetBucketEntryCount countSpecifier:hasSecondsBudget:isCoalesceAllowed:](v6->_invalidatedEntryCount, "countSpecifier:hasSecondsBudget:isCoalesceAllowed:", v4, 1, 0);
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate bls_shortLoggingString](self->_startDate, "bls_shortLoggingString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("start"));

  v5 = (id)objc_msgSend(v3, "appendInt:withName:", -[BLSHInactiveBudgetBucketEntryCount count](self->_entryCount, "count"), CFSTR("count"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BLSHInactiveBudgetBucketEntryCount isSecondsFidelity](self->_entryCount, "isSecondsFidelity"), CFSTR("isSecondsFidelity"), 1);
  v7 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_containsInvalidation, CFSTR("containsInvalidation"), 1);
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t);
  void *v14;
  id v15;
  BLSHInactiveBudgetBucket *v16;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate bls_shortLoggingString](self->_startDate, "bls_shortLoggingString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("start"));

  v5 = (id)objc_msgSend(v3, "appendInt:withName:", -[BLSHInactiveBudgetBucketEntryCount count](self->_entryCount, "count"), CFSTR("count"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BLSHInactiveBudgetBucketEntryCount isSecondsFidelity](self->_entryCount, "isSecondsFidelity"), CFSTR("isSecondsFidelity"), 1);
  v7 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_containsInvalidation, CFSTR("containsInvalidation"), 1);
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __44__BLSHInactiveBudgetBucket_debugDescription__block_invoke;
  v14 = &unk_24D1BBE80;
  v15 = v3;
  v16 = self;
  v8 = v3;
  objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", 0, CFSTR("        "), &v11);
  objc_msgSend(v8, "build", v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __44__BLSHInactiveBudgetBucket_debugDescription__block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("futureEntries"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("renderedEntries"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("invalidationEntries"));
}

- (id)shortLoggingString
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  const char *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NSDate bls_shortLoggingString](self->_startDate, "bls_shortLoggingString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BLSHInactiveBudgetBucketEntryCount count](self->_entryCount, "count");
  v6 = -[BLSHInactiveBudgetBucketEntryCount isSecondsFidelity](self->_entryCount, "isSecondsFidelity");
  v7 = "";
  v8 = " seconds";
  if (!v6)
    v8 = "";
  if (self->_containsInvalidation)
    v7 = " invalidation(s)";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p; %@ (%ld)%s%s>"), self, v4, v5, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)compare:(id)a3
{
  return -[NSDate compare:](self->_startDate, "compare:", *((_QWORD *)a3 + 2));
}

- (BOOL)isSecondsFidelity
{
  return -[BLSHInactiveBudgetBucketEntryCount isSecondsFidelity](self->_entryCount, "isSecondsFidelity");
}

- (double)addSpecifier:(char)a3 allowBeforeStart:(void *)a4 withCountBlock:
{
  id v7;
  uint64_t (**v8)(_QWORD);
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  int v18;
  NSObject *v20;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a4;
  if (!a1)
  {
    v16 = 0.0;
    goto LABEL_19;
  }
  objc_msgSend(v7, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0B8F0], "secondsFidelityThreshold");
  v11 = v10;
  objc_msgSend(v9, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 16));
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalFromLastEntryToDate:", v9);
  v15 = v14;
  if (v13 >= 0.0)
  {
    if (v13 >= v11)
    {
      v16 = v14;
      goto LABEL_18;
    }
LABEL_7:
    v17 = objc_msgSend(*(id *)(a1 + 32), "count");
    v18 = v8[2](v8);
    if (v18)
      v16 = 0.0;
    else
      v16 = NAN;
    if (v13 < 0.0 && v18 != 0)
    {
      bls_budget_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v22 = *(void **)(a1 + 16);
        objc_msgSend(v22, "timeIntervalSinceDate:", v9);
        v24 = v23;
        v25 = objc_msgSend(*(id *)(a1 + 32), "count");
        v26 = 134220034;
        v27 = a1;
        v28 = 2114;
        v29 = v7;
        v30 = 2114;
        v31 = v22;
        v32 = 2114;
        v33 = v9;
        v34 = 2048;
        v35 = v24;
        v36 = 2048;
        v37 = v13;
        v38 = 2048;
        v39 = v15;
        v40 = 1024;
        v41 = v17;
        v42 = 1024;
        v43 = v25;
        _os_log_debug_impl(&dword_2145AC000, v20, OS_LOG_TYPE_DEBUG, "%p added addSpecifier:%{public}@ start date will change:%{public}@->%{public}@ (%.3lfs) (intervalSinceStart:%lf; intervalAfterEnd:%lf) (count:%d->%d)",
          (uint8_t *)&v26,
          0x54u);
      }

      objc_storeStrong((id *)(a1 + 16), v9);
      -[BLSHInactiveBudgetBucket recomputeMinuteBoundary](a1);
      v16 = 0.0;
    }
    goto LABEL_18;
  }
  if (v14 > -v11 && (a3 & 1) != 0)
    goto LABEL_7;
  v16 = v13;
LABEL_18:

LABEL_19:
  return v16;
}

- (double)addFutureSpecifier:(id)a3 hasSecondsBudget:(BOOL)a4 allowBeforeStart:(BOOL)a5
{
  id v8;
  id v9;
  double v10;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  v8 = a3;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __81__BLSHInactiveBudgetBucket_addFutureSpecifier_hasSecondsBudget_allowBeforeStart___block_invoke;
  v12[3] = &unk_24D1BD4F0;
  v14 = a4;
  v12[4] = self;
  v13 = v8;
  v9 = v8;
  v10 = -[BLSHInactiveBudgetBucket addSpecifier:allowBeforeStart:withCountBlock:]((uint64_t)self, v9, a5, v12);

  return v10;
}

uint64_t __81__BLSHInactiveBudgetBucket_addFutureSpecifier_hasSecondsBudget_allowBeforeStart___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  _BOOL4 v7;
  uint64_t v8;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  v7 = v6 >= 0.0;
  if (v6 >= 1.0)
    v7 = 0;
  if (v2)
    v8 = 1;
  else
    v8 = v7;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "countSpecifier:hasSecondsBudget:isCoalesceAllowed:", *(_QWORD *)(a1 + 40), v8, 1);
}

- (double)applyRenderedSpecifier:(id)a3 allowBeforeStart:(BOOL)a4
{
  id v6;
  id v7;
  double v8;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__BLSHInactiveBudgetBucket_applyRenderedSpecifier_allowBeforeStart___block_invoke;
  v10[3] = &unk_24D1BD518;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  v8 = -[BLSHInactiveBudgetBucket addSpecifier:allowBeforeStart:withCountBlock:]((uint64_t)self, v7, a4, v10);

  return v8;
}

uint64_t __68__BLSHInactiveBudgetBucket_applyRenderedSpecifier_allowBeforeStart___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "countSpecifier:hasSecondsBudget:isCoalesceAllowed:", *(_QWORD *)(a1 + 40), 1, 1);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  return 1;
}

- (double)addInvalidation:(id)a3 hasSecondsBudget:(BOOL)a4 allowBeforeStart:(BOOL)a5
{
  id v8;
  id v9;
  double v10;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  v8 = a3;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __78__BLSHInactiveBudgetBucket_addInvalidation_hasSecondsBudget_allowBeforeStart___block_invoke;
  v12[3] = &unk_24D1BD4F0;
  v12[4] = self;
  v13 = v8;
  v14 = a4;
  v9 = v8;
  v10 = -[BLSHInactiveBudgetBucket addSpecifier:allowBeforeStart:withCountBlock:]((uint64_t)self, v9, a5, v12);

  return v10;
}

uint64_t __78__BLSHInactiveBudgetBucket_addInvalidation_hasSecondsBudget_allowBeforeStart___block_invoke(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  NSObject *v4;

  v1 = (uint64_t *)(a1 + 32);
  v2 = (_QWORD *)(a1 + 40);
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "countSpecifier:hasSecondsBudget:isCoalesceAllowed:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), 0);
  if ((_DWORD)v3)
  {
    objc_msgSend(*(id *)(*v1 + 40), "countSpecifier:hasSecondsBudget:isCoalesceAllowed:", *v2, 1, 0);
    objc_msgSend(*(id *)(*v1 + 48), "countSpecifier:hasSecondsBudget:isCoalesceAllowed:", *v2, 1, 0);
    *(_BYTE *)(*v1 + 9) = 1;
    bls_budget_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __78__BLSHInactiveBudgetBucket_addInvalidation_hasSecondsBudget_allowBeforeStart___block_invoke_cold_1(v1, v1 + 1, v4);

  }
  return v3;
}

- (void)resetFutureSpecifiers
{
  BLSHInactiveBudgetBucketEntryCount *v3;
  BLSHInactiveBudgetBucketEntryCount *entryCount;

  v3 = (BLSHInactiveBudgetBucketEntryCount *)-[BLSHInactiveBudgetBucketEntryCount copy](self->_renderedEntryCount, "copy");
  entryCount = self->_entryCount;
  self->_entryCount = v3;

}

- (void)resetFutureAndRenderedSpecifiers
{
  BLSHInactiveBudgetBucketEntryCount *v3;
  BLSHInactiveBudgetBucketEntryCount *entryCount;
  BLSHInactiveBudgetBucketEntryCount *v5;
  BLSHInactiveBudgetBucketEntryCount *renderedEntryCount;

  v3 = (BLSHInactiveBudgetBucketEntryCount *)-[BLSHInactiveBudgetBucketEntryCount copy](self->_invalidatedEntryCount, "copy");
  entryCount = self->_entryCount;
  self->_entryCount = v3;

  v5 = (BLSHInactiveBudgetBucketEntryCount *)-[BLSHInactiveBudgetBucketEntryCount copy](self->_invalidatedEntryCount, "copy");
  renderedEntryCount = self->_renderedEntryCount;
  self->_renderedEntryCount = v5;

  self->_rendered = 0;
}

- (BOOL)validAtDate:(id)a3
{
  id v4;
  _BOOL4 v5;
  double v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = -[BLSHInactiveBudgetBucket isSecondsFidelity](self, "isSecondsFidelity");
  v6 = -60.0;
  if (v5)
    v6 = -3600.0;
  objc_msgSend(v4, "dateByAddingTimeInterval:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "isBeforeDate:", self->_startDate);
  return v8;
}

- (BOOL)hasBeenRendered
{
  return self->_rendered;
}

- (BOOL)containsInvalidation
{
  return self->_containsInvalidation;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)minuteBoundaryDate
{
  return self->_minuteBoundaryDate;
}

- (BLSHInactiveBudgetBucketEntryCount)entryCount
{
  return self->_entryCount;
}

- (BLSHInactiveBudgetBucketEntryCount)renderedEntryCount
{
  return self->_renderedEntryCount;
}

- (BLSHInactiveBudgetBucketEntryCount)invalidatedEntryCount
{
  return self->_invalidatedEntryCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidatedEntryCount, 0);
  objc_storeStrong((id *)&self->_renderedEntryCount, 0);
  objc_storeStrong((id *)&self->_entryCount, 0);
  objc_storeStrong((id *)&self->_minuteBoundaryDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

void __78__BLSHInactiveBudgetBucket_addInvalidation_hasSecondsBudget_allowBeforeStart___block_invoke_cold_1(uint64_t *a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = *a1;
  v5 = *a2;
  v6 = objc_msgSend(*(id *)(*a1 + 32), "count");
  v7 = 134218498;
  v8 = v4;
  v9 = 2114;
  v10 = v5;
  v11 = 1024;
  v12 = v6;
  _os_log_debug_impl(&dword_2145AC000, a3, OS_LOG_TYPE_DEBUG, "%p added invalidation:%{public}@ total bucket count:%d", (uint8_t *)&v7, 0x1Cu);
}

@end
