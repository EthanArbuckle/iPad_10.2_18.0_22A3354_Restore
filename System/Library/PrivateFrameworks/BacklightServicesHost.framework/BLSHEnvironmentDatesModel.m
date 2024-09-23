@implementation BLSHEnvironmentDatesModel

- (BLSHEnvironmentDatesModel)initWithEnvironment:(id)a3
{
  id v4;
  BLSHEnvironmentDatesModel *v5;
  BLSHEnvironmentDatesModel *v6;
  uint64_t v7;
  NSMutableArray *specifiers;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BLSHEnvironmentDatesModel;
  v5 = -[BLSHEnvironmentDatesModel init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_environment, v4);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    specifiers = v6->_specifiers;
    v6->_specifiers = (NSMutableArray *)v7;

  }
  return v6;
}

- (NSDateInterval)dateInterval
{
  os_unfair_lock_s *p_lock;
  NSDateInterval *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_dateInterval;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)specifiers
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableArray copy](self->_specifiers, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (int64_t)count
{
  os_unfair_lock_s *p_lock;
  int64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[NSMutableArray count](self->_specifiers, "count");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)specifierForDate:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableArray *specifiers;
  id v7;
  uint64_t v8;
  NSMutableArray *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  specifiers = self->_specifiers;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __46__BLSHEnvironmentDatesModel_specifierForDate___block_invoke;
  v17[3] = &unk_24D1BDBA0;
  v7 = v4;
  v18 = v7;
  v8 = -[NSMutableArray indexOfObjectWithOptions:passingTest:](specifiers, "indexOfObjectWithOptions:passingTest:", 2, v17);
  v9 = self->_specifiers;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray firstObject](v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10
      && (objc_msgSend(v10, "date"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v12, "timeIntervalSinceDate:", v7),
          v14 = v13,
          v12,
          v14 < 1.0))
    {
      v15 = v11;
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    -[NSMutableArray objectAtIndex:](v9, "objectAtIndex:");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(p_lock);

  return v15;
}

BOOL __46__BLSHEnvironmentDatesModel_specifierForDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "compare:", *(_QWORD *)(a1 + 32)) != 1;

  return v4;
}

- (id)missingIntervalForDateInterval:(id)a3
{
  id v4;
  NSDateInterval *v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  BLSHEnvironmentDatesModel *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_dateInterval;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  os_unfair_lock_unlock(&self->_lock);
  if (!v5)
    goto LABEL_18;
  if (!objc_msgSend(v4, "isEqual:", v5))
  {
    -[NSDateInterval endDate](v5, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToDate:", v12);

    if ((v13 & 1) != 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v4, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[NSDateInterval containsDate:](v5, "containsDate:", v17);

    if (v18)
    {
      objc_msgSend(v4, "endDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateInterval endDate](v5, "endDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "compare:", v19) != 1)
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v20, v19);
        bls_flipbook_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(WeakRetained, "identifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "bls_shortLoggingString");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDateInterval bls_shortLoggingString](v5, "bls_shortLoggingString");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "bls_shortLoggingString");
          *(_DWORD *)buf = 134219010;
          v39 = self;
          v40 = 2114;
          v41 = v37;
          v42 = 2114;
          v43 = v36;
          v44 = 2114;
          v45 = v34;
          v46 = 2114;
          v47 = objc_claimAutoreleasedReturnValue();
          v35 = (void *)v47;
          _os_log_debug_impl(&dword_2145AC000, v28, OS_LOG_TYPE_DEBUG, "%p:%{public}@ truncating interval:%{public}@ due to current interval:%{public}@ - to new interval:%{public}@", buf, 0x34u);

        }
LABEL_8:
        objc_msgSend(v8, "startDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[BLSHEnvironmentDatesModel specifierForDate:](self, "specifierForDate:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = 0;
        if (v8)
          goto LABEL_20;
        goto LABEL_19;
      }
      bls_flipbook_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(WeakRetained, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "bls_shortLoggingString");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDateInterval bls_shortLoggingString](v5, "bls_shortLoggingString");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v39 = self;
        v40 = 2114;
        v41 = v31;
        v42 = 2114;
        v43 = v32;
        v44 = 2114;
        v45 = v33;
        v46 = 1024;
        LODWORD(v47) = -[BLSHEnvironmentDatesModel count](self, "count");
        _os_log_fault_impl(&dword_2145AC000, v21, OS_LOG_TYPE_FAULT, "%p:%{public}@ interval:%{public}@ ends before or same as current interval:%{public}@ - will invalidate %d old dates", buf, 0x30u);

      }
      -[BLSHEnvironmentDatesModel clearAllSpecifiers](self, "clearAllSpecifiers");

    }
    else
    {
      bls_flipbook_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(WeakRetained, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "bls_shortLoggingString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDateInterval bls_shortLoggingString](v5, "bls_shortLoggingString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v39 = self;
        v40 = 2114;
        v41 = v23;
        v42 = 2114;
        v43 = v24;
        v44 = 2114;
        v45 = v25;
        v46 = 1024;
        LODWORD(v47) = -[BLSHEnvironmentDatesModel count](self, "count");
        _os_log_impl(&dword_2145AC000, v22, OS_LOG_TYPE_INFO, "%p:%{public}@ new interval:%{public}@ does not intersect current interval:%{public}@ - will invalidate %d old dates", buf, 0x30u);

      }
      -[BLSHEnvironmentDatesModel clearAllSpecifiers](self, "clearAllSpecifiers");
    }
LABEL_18:
    v9 = 0;
    v16 = 1;
LABEL_19:
    v10 = v4;
    v8 = v10;
    if (!v10)
      goto LABEL_21;
LABEL_20:
    +[BLSHEnvironmentDateInterval intervalWithPresentationInterval:previousPresentationDate:shouldReset:environment:](BLSHEnvironmentDateInterval, "intervalWithPresentationInterval:previousPresentationDate:shouldReset:environment:", v8, v9, v16, WeakRetained);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  bls_flipbook_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(WeakRetained, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bls_shortLoggingString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v39 = self;
    v40 = 2114;
    v41 = v29;
    v42 = 2114;
    v43 = v30;
    _os_log_debug_impl(&dword_2145AC000, v7, OS_LOG_TYPE_DEBUG, "%p:%{public}@ already have all specifiers in interval:%{public}@, will skip", buf, 0x20u);

  }
  v8 = 0;
  v9 = 0;
  v10 = 0;
LABEL_21:
  v26 = v10;

  return v26;
}

- (void)registerSpecifiers:(id)a3 forDateInterval:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  NSDateInterval *v9;
  NSDateInterval *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  NSDateInterval *v17;
  NSObject *v18;
  NSDateInterval *dateInterval;
  NSDateInterval *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  BLSHEnvironmentDatesModel *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v9 = self->_dateInterval;
  v10 = v9;
  if (!v9)
    goto LABEL_8;
  -[NSDateInterval endDate](v9, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToDate:", v12);

  if ((v13 & 1) == 0)
  {
    bls_flipbook_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(WeakRetained, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bls_shortLoggingString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateInterval bls_shortLoggingString](v10, "bls_shortLoggingString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[NSMutableArray count](self->_specifiers, "count");
      v25 = 134219010;
      v26 = self;
      v27 = 2114;
      v28 = v21;
      v29 = 2114;
      v30 = v22;
      v31 = 2114;
      v32 = v23;
      v33 = 1024;
      v34 = v24;
      _os_log_fault_impl(&dword_2145AC000, v18, OS_LOG_TYPE_FAULT, "%p:%{public}@ new interval:%{public}@ does not follow current interval:%{public}@ - will invalidate %d old specifiers", (uint8_t *)&v25, 0x30u);

    }
    -[NSMutableArray removeAllObjects](self->_specifiers, "removeAllObjects");
    goto LABEL_8;
  }
  v14 = objc_alloc(MEMORY[0x24BDD1508]);
  -[NSDateInterval startDate](v10, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (NSDateInterval *)objc_msgSend(v14, "initWithStartDate:endDate:", v15, v16);

  if (!v17)
LABEL_8:
    v17 = (NSDateInterval *)v6;
  dateInterval = self->_dateInterval;
  self->_dateInterval = v17;
  v20 = v17;

  -[NSMutableArray addObjectsFromArray:](self->_specifiers, "addObjectsFromArray:", v7);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)clearAllSpecifiers
{
  void *v5;
  int v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 8), "count");
  objc_msgSend(*(id *)(a1 + 16), "bls_shortLoggingString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 134218754;
  v9 = a1;
  v10 = 2114;
  v11 = v5;
  v12 = 1024;
  v13 = v6;
  v14 = 2114;
  v15 = v7;
  _os_log_debug_impl(&dword_2145AC000, a3, OS_LOG_TYPE_DEBUG, "%p:%{public}@ will clear %d specifiers from interval:%{public}@", (uint8_t *)&v8, 0x26u);

}

- (void)purgeSpecifiersBefore:(id)a3
{
  id v4;
  id WeakRetained;
  unint64_t v6;
  NSMutableArray *specifiers;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  char v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  BLSHEnvironmentDatesModel *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  _WORD v26[17];

  *(_QWORD *)&v26[13] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v6 = -[NSMutableArray count](self->_specifiers, "count");
  specifiers = self->_specifiers;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0B818]), "initWithDate:fidelity:", v4, 0);
  v9 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](specifiers, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, v6, 1024, &__block_literal_global_17);

  if (v9)
  {
    if (v9 < v6)
    {
      -[NSMutableArray objectAtIndex:](self->_specifiers, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v4, "isEqualToDate:", v11);

      if ((v12 & 1) != 0)
      {
        ++v9;
        goto LABEL_6;
      }
    }
    if (v9 >= 2)
    {
LABEL_6:
      if (v9 - 1 >= v6)
        v13 = v6 - 1;
      else
        v13 = v9 - 1;
      -[NSMutableArray removeObjectsInRange:](self->_specifiers, "removeObjectsInRange:", 0, v13);
      bls_flipbook_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(WeakRetained, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[NSMutableArray count](self->_specifiers, "count");
        objc_msgSend(v4, "bls_shortLoggingString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 134219010;
        v20 = self;
        v21 = 2114;
        v22 = v15;
        v23 = 1024;
        v24 = v13;
        v25 = 1024;
        *(_DWORD *)v26 = v16;
        v26[2] = 2114;
        *(_QWORD *)&v26[3] = v17;
        _os_log_debug_impl(&dword_2145AC000, v14, OS_LOG_TYPE_DEBUG, "%p:%{public}@ did purge:%d dates (remaining:%d) before:%{public}@", (uint8_t *)&v19, 0x2Cu);

LABEL_14:
        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  bls_flipbook_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(WeakRetained, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bls_shortLoggingString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 134218754;
    v20 = self;
    v21 = 2114;
    v22 = v15;
    v23 = 1024;
    v24 = v6;
    v25 = 2114;
    *(_QWORD *)v26 = v18;
    _os_log_debug_impl(&dword_2145AC000, v14, OS_LOG_TYPE_DEBUG, "%p:%{public}@ no dates to purge (remaining:%d) before:%{public}@", (uint8_t *)&v19, 0x26u);

    goto LABEL_14;
  }
LABEL_12:

  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __51__BLSHEnvironmentDatesModel_purgeSpecifiersBefore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (BLSHBacklightSceneHostEnvironment)environment
{
  return (BLSHBacklightSceneHostEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
}

@end
