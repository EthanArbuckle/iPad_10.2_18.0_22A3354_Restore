@implementation BLSFrameSpecifierModel

- (BLSFrameSpecifierModel)init
{
  BLSFrameSpecifierModel *v2;
  BLSFrameSpecifierModel *v3;
  uint64_t v4;
  NSMutableArray *specifiers;
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BLSFrameSpecifierModel;
  v2 = -[BLSFrameSpecifierModel init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    specifiers = v3->_specifiers;
    v3->_specifiers = (NSMutableArray *)v4;

    objc_initWeak(&location, v3);
    objc_copyWeak(&v7, &location);
    v3->_stateHandler = os_state_add_handler();
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v3;
}

_DWORD *__30__BLSFrameSpecifierModel_init__block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  void *v2;
  _DWORD *v3;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (-[BLSFrameSpecifierModel hasSpecifiers](WeakRetained))
  {
    -[os_unfair_lock_s debugDescription](WeakRetained, "debugDescription");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = BLSStateDataWithTitleDescriptionAndHints(CFSTR("BLSFrameSpecifierModel"), v2);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (os_unfair_lock_s)hasSpecifiers
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;

  v1 = a1;
  if (a1)
  {
    v2 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    v1 = (os_unfair_lock_s *)(objc_msgSend(*(id *)&v1[2]._os_unfair_lock_opaque, "count") != 0);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_stateHandler)
    os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)BLSFrameSpecifierModel;
  -[BLSFrameSpecifierModel dealloc](&v3, sel_dealloc);
}

- (id)description
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[NSMutableArray count](self->_specifiers, "count"), CFSTR("count"));
  -[NSMutableArray firstObject](self->_specifiers, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", v6, CFSTR("first"));

  -[NSMutableArray lastObject](self->_specifiers, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v4, "appendObject:withName:", v8, CFSTR("last"));

  objc_msgSend(v4, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (id)debugDescription
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v4 = -[NSMutableArray count](self->_specifiers, "count");
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "appendProem:block:", self, &__block_literal_global_14);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("specifiers (%u)"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__BLSFrameSpecifierModel_debugDescription__block_invoke_2;
  v10[3] = &unk_1E621AF58;
  v11 = v5;
  v12 = v4;
  v10[4] = self;
  v7 = v5;
  objc_msgSend(v7, "appendBodySectionWithName:openDelimiter:closeDelimiter:block:", v6, CFSTR(" {"), CFSTR("} "), v10);

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __42__BLSFrameSpecifierModel_debugDescription__block_invoke_2(_QWORD *a1)
{
  unint64_t v2;
  unint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  const __CFString *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = a1[6];
  if (v2 <= 0x5A)
    v3 = a1[6];
  else
    v3 = 85;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *(id *)(a1[4] + 8);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        if (v7 + i < v3 || v7 + i >= v2 - 6)
        {
          v11 = *(const __CFString **)(*((_QWORD *)&v13 + 1) + 8 * i);
          v10 = (void *)a1[5];
        }
        else
        {
          if (v7 - v3 + i)
            continue;
          v10 = (void *)a1[5];
          v11 = CFSTR("...");
        }
        v12 = (id)objc_msgSend(v10, "appendObject:withName:", v11, 0);
      }
      v7 += v6;
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

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

- (unint64_t)specifierCount
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[NSMutableArray count](self->_specifiers, "count");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)addSpecifiers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    os_unfair_lock_lock(&self->_lock);
    objc_msgSend(v4, "firstObject");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject presentationInterval](v5, "presentationInterval");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[BLSFrameSpecifierModel withLock_purgeAllSpecifiersOnOrAfterDate:]((uint64_t)self, v7);
    -[NSMutableArray lastObject](self->_specifiers, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v5 && v8)
    {
      objc_msgSend(v8, "correctedSpecifierWithNextSpecifier:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[NSMutableArray removeLastObject](self->_specifiers, "removeLastObject");
        -[NSMutableArray addObject:](self->_specifiers, "addObject:", v10);
      }

    }
    -[NSMutableArray addObjectsFromArray:](self->_specifiers, "addObjectsFromArray:", v4);
    os_unfair_lock_unlock(&self->_lock);

  }
  else
  {
    bls_environment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[BLSFrameSpecifierModel addSpecifiers:].cold.1((uint64_t)self, (uint64_t)v4, v5);
  }

}

- (void)withLock_purgeAllSpecifiersOnOrAfterDate:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (v3)
    {
      v5 = *(void **)(a1 + 8);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __67__BLSFrameSpecifierModel_withLock_purgeAllSpecifiersOnOrAfterDate___block_invoke;
      v14[3] = &unk_1E621AF80;
      v15 = v3;
      v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", v14);
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(*(id *)(a1 + 8), "removeObjectsInRange:", v6, objc_msgSend(*(id *)(a1 + 8), "count") - v6);

    }
    else
    {
      bls_environment_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[BLSFrameSpecifierModel withLock_purgeAllSpecifiersOnOrAfterDate:].cold.1(a1, v7, v8, v9, v10, v11, v12, v13);

    }
  }

}

- (void)purgeAllButOneSpecifiersBeforeDate:(id)a3
{
  id v4;
  unint64_t v5;
  NSMutableArray *specifiers;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  BLSFrameSpecifierModel *v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  BLSFrameSpecifierModel *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    v5 = -[NSMutableArray count](self->_specifiers, "count");
    if (v5 >= 2)
    {
      specifiers = self->_specifiers;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __61__BLSFrameSpecifierModel_purgeAllButOneSpecifiersBeforeDate___block_invoke;
      v17[3] = &unk_1E621AF80;
      v18 = v4;
      v7 = -[NSMutableArray indexOfObjectPassingTest:](specifiers, "indexOfObjectPassingTest:", v17);
      if (v7)
      {
        if (v7 == 0x7FFFFFFFFFFFFFFFLL)
          v8 = v5 - 1;
        else
          v8 = v7;
        -[NSMutableArray removeObjectsInRange:](self->_specifiers, "removeObjectsInRange:", 0, v8);
      }

    }
    v9 = -[NSMutableArray count](self->_specifiers, "count");
    os_unfair_lock_unlock(&self->_lock);
    bls_environment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v20 = self;
      v21 = 2048;
      v22 = v5 - v9;
      v23 = 2114;
      v24 = self;
      _os_log_debug_impl(&dword_1B0C75000, v10, OS_LOG_TYPE_DEBUG, "<BLSFrameSpecifierModel %p> purged %lu specifiers — %{public}@", buf, 0x20u);
    }
  }
  else
  {
    bls_environment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[BLSFrameSpecifierModel purgeAllButOneSpecifiersBeforeDate:].cold.1((uint64_t)self, v10, v11, v12, v13, v14, v15, v16);
  }

}

BOOL __61__BLSFrameSpecifierModel_purgeAllButOneSpecifiersBeforeDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "presentationInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "compare:", *(_QWORD *)(a1 + 32)) != -1;

  return v5;
}

- (void)purgeAllSpecifiersOnOrAfterDate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[BLSFrameSpecifierModel withLock_purgeAllSpecifiersOnOrAfterDate:]((uint64_t)self, v5);

  os_unfair_lock_unlock(p_lock);
}

BOOL __67__BLSFrameSpecifierModel_withLock_purgeAllSpecifiersOnOrAfterDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "presentationInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "compare:", *(_QWORD *)(a1 + 32)) != -1;

  return v5;
}

- (id)specifierAtPresentationDate:(id)a3
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
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  uint8_t buf[4];
  BLSFrameSpecifierModel *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    specifiers = self->_specifiers;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __54__BLSFrameSpecifierModel_specifierAtPresentationDate___block_invoke;
    v34[3] = &unk_1E621AF80;
    v7 = v4;
    v35 = v7;
    v8 = -[NSMutableArray indexOfObjectWithOptions:passingTest:](specifiers, "indexOfObjectWithOptions:passingTest:", 1, v34);
    v9 = self->_specifiers;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray lastObject](v9, "lastObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10
        && (objc_msgSend(v10, "presentationInterval"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v12, "startDate"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = objc_msgSend(v13, "bls_compare:withEpsilon:", v7, 0.0001),
            v13,
            v12,
            v14 != 1))
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
    bls_environment_log();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);

    if (v17 && !v15 && -[NSMutableArray count](self->_specifiers, "count"))
    {
      -[NSMutableArray firstObject](self->_specifiers, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "presentationInterval");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "startDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "compare:", v7);

      objc_msgSend(v19, "endDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "compare:", v7);

      objc_msgSend(v7, "timeIntervalSinceReferenceDate");
      v25 = v24;
      objc_msgSend(v19, "startDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "timeIntervalSinceReferenceDate");
      v28 = v27;

      bls_environment_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v7, "bls_shortLoggingString");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray bls_boundedDescriptionWithTransformer:](self->_specifiers, "bls_boundedDescriptionWithTransformer:", &__block_literal_global_24);
        v32 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219778;
        v37 = self;
        v38 = 2114;
        v39 = v31;
        v40 = 2114;
        v41 = v32;
        v33 = (void *)v32;
        v42 = 2114;
        v43 = v18;
        v44 = 2048;
        v45 = v21;
        v46 = 2048;
        v47 = v23;
        v48 = 2048;
        v49 = v25;
        v50 = 2048;
        v51 = v28;
        _os_log_debug_impl(&dword_1B0C75000, v29, OS_LOG_TYPE_DEBUG, "%p:specifier:nil presentationDate:%{public}@ specifiers:%{public}@ firstSpecifier:%{public}@ startCompare:%ld, endCompare:%ld, presentationDateTimeInterval:%lf firstPresentationIntervalStartDateTimeInterval:%lf", buf, 0x52u);

      }
    }
    os_unfair_lock_unlock(p_lock);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

BOOL __54__BLSFrameSpecifierModel_specifierAtPresentationDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;

  objc_msgSend(a2, "presentationInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "bls_compare:withEpsilon:", *(_QWORD *)(a1 + 32), 0.0001) == 1)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "endDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "bls_compare:withEpsilon:", *(_QWORD *)(a1 + 32), 0.0001) == 1;

  }
  return v5;
}

id __54__BLSFrameSpecifierModel_specifierAtPresentationDate___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "presentationInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bls_loggingString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
}

- (void)addSpecifiers:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1B0C75000, log, OS_LOG_TYPE_ERROR, "<BLSFrameSpecifierModel %p> tried to add empty specifiers %{public}@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_6();
}

- (void)withLock_purgeAllSpecifiersOnOrAfterDate:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B0C75000, a2, a3, "<BLSFrameSpecifierModel %p> tried to purge specifiers on or after a nil date", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)purgeAllButOneSpecifiersBeforeDate:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B0C75000, a2, a3, "<BLSFrameSpecifierModel %p> tried to purge specifiers before a nil date", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

@end
