@implementation _EFBackgroundProcessingAssertion

- (_DWORD)initWithProtectedFiles:(_DWORD *)a1
{
  id v4;
  id v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)_EFBackgroundProcessingAssertion;
    v5 = objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 5, a2);
      a1[8] = 0;
    }
  }

  return a1;
}

- (os_unfair_lock_s)isActive
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;

  v1 = a1;
  if (a1)
  {
    v2 = a1 + 8;
    os_unfair_lock_lock(a1 + 8);
    -[os_unfair_lock_s _checkIfExpired](v1, "_checkIfExpired");
    v1 = (os_unfair_lock_s *)(*(_QWORD *)&v1[4]._os_unfair_lock_opaque != 0);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (uint64_t)incrementAssertionForDuration:(_QWORD *)a3 outResetCount:(double)a4 error:
{
  void *v8;
  uint64_t v9;
  double v10;
  int v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  double v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  objc_msgSend((id)a1, "_checkIfExpired");
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v9 + 1;
  if (v9 && (objc_msgSend(v8, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 8)), v10 <= 10.0))
  {
    v12 = 0;
  }
  else
  {
    v21 = 0;
    v11 = objc_msgSend((id)a1, "_takeAssertionForDuration:error:", &v21, a4);
    v12 = v21;
    _ef_log_EFProtectedFile();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v11)
    {
      v16 = v13;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v19 = *(id *)(a1 + 40);
        objc_msgSend(v12, "ef_publicDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v23 = a4;
        v24 = 2114;
        v25 = v19;
        v26 = 2114;
        v27 = v20;
        _os_log_error_impl(&dword_1B106E000, v16, OS_LOG_TYPE_ERROR, "Failed to take assertion of duration %f on files %{public}@ due to error: %{public}@", buf, 0x20u);

      }
      v17 = 0;
      --*(_QWORD *)(a1 + 16);
      goto LABEL_13;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      v23 = a4;
      v24 = 2114;
      v25 = v15;
      _os_log_impl(&dword_1B106E000, v14, OS_LOG_TYPE_DEFAULT, "Took assertion of duration %f on files %{public}@", buf, 0x16u);
    }

    objc_storeStrong((id *)(a1 + 8), v8);
  }
  v17 = 1;
LABEL_13:
  *a2 = *(_QWORD *)(a1 + 24);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
  if (a3)
    *a3 = objc_retainAutorelease(v12);

  return v17;
}

- (void)decrementAssertionWithResetCount:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    if (*(_QWORD *)(a1 + 24) == a2)
    {
      v5 = *(_QWORD *)(a1 + 16);
      if (!v5)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel_decrementAssertionWithResetCount_, a1, CFSTR("EFProtectedFile.m"), 312, CFSTR("Decrementing assertion when count is already 0"));

        v5 = *(_QWORD *)(a1 + 16);
      }
      v6 = v5 - 1;
      *(_QWORD *)(a1 + 16) = v6;
      if (!v6)
      {
        v16 = 0;
        v7 = objc_msgSend((id)a1, "_releaseAssertionWithError:", &v16);
        v8 = v16;
        _ef_log_EFProtectedFile();
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v7)
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v11 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138543362;
            v18 = v11;
            _os_log_impl(&dword_1B106E000, v10, OS_LOG_TYPE_DEFAULT, "Released assertion on files %{public}@", buf, 0xCu);
          }
        }
        else
        {
          v12 = v9;
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v13 = *(id *)(a1 + 40);
            objc_msgSend(v8, "ef_publicDescription");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[_EFBackgroundProcessingAssertion decrementAssertionWithResetCount:].cold.1(v13, v14, buf, v12);
          }

        }
      }
    }
    os_unfair_lock_unlock(v4);
  }
}

- (BOOL)_takeAssertionForDuration:(double)a3 error:(id *)a4
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68___EFBackgroundProcessingAssertion__takeAssertionForDuration_error___block_invoke;
  v5[3] = &__block_descriptor_48_e8_i12__0i8l;
  v5[4] = 0;
  v5[5] = (unint64_t)(a3 * 1000000000.0);
  return -[_EFBackgroundProcessingAssertion _iterateFilesPerformingAction:error:](self, "_iterateFilesPerformingAction:error:", v5, a4);
}

- (void)_checkIfExpired
{
  unint64_t v3;

  if (-[NSDate ef_isEarlierThanNow](self->_currentExpiry, "ef_isEarlierThanNow"))
  {
    v3 = self->_resetCount + 1;
    self->_count = 0;
    self->_resetCount = v3;
  }
}

- (BOOL)_releaseAssertionWithError:(id *)a3
{
  return -[_EFBackgroundProcessingAssertion _iterateFilesPerformingAction:error:](self, "_iterateFilesPerformingAction:error:", &__block_literal_global_116, a3);
}

- (BOOL)_iterateFilesPerformingAction:(id)a3 error:(id *)a4
{
  unsigned int (**v5)(id, uint64_t);
  NSArray *protectedFiles;
  NSArray *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (unsigned int (**)(id, uint64_t))a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  if (self)
    protectedFiles = self->_protectedFiles;
  else
    protectedFiles = 0;
  v7 = protectedFiles;
  v8 = 0;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v9)
  {
    v12 = 1;
    goto LABEL_18;
  }
  v10 = *(_QWORD *)v22;
  v11 = *MEMORY[0x1E0CB2FE0];
  v12 = 1;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v22 != v10)
        objc_enumerationMutation(v7);
      v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
      v20 = 0;
      v15 = -[_EFProtectedFile fileDescriptorWithError:](v14, &v20);
      v16 = v20;
      if ((_DWORD)v15)
      {
        if (v5[2](v5, v15) != -1)
          goto LABEL_14;
        v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", v11, *__error(), 0);

        v16 = (id)v17;
      }
      if (v8)
      {
        v12 = 0;
      }
      else
      {
        v16 = v16;
        v12 = 0;
        v8 = v16;
      }
LABEL_14:

    }
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  }
  while (v9);
LABEL_18:

  if (a4)
    *a4 = objc_retainAutorelease(v8);

  return v12 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectedFiles, 0);
  objc_storeStrong((id *)&self->_currentExpiry, 0);
}

- (void)decrementAssertionWithResetCount:(uint8_t *)buf .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1B106E000, log, OS_LOG_TYPE_ERROR, "Failed to release assertion on files %{public}@ due to error: %{public}@", buf, 0x16u);

}

@end
