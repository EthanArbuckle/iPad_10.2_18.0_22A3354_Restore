@implementation CATransaction(BaseBoardUI)

+ (void)bs_performAfterCommit:()BaseBoardUI
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("block"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v24 = v9;
      v25 = 2114;
      v26 = v11;
      v27 = 2048;
      v28 = a1;
      v29 = 2114;
      v30 = CFSTR("CATransaction+BaseBoardUI.m");
      v31 = 1024;
      v32 = 29;
      v33 = 2114;
      v34 = v8;
      _os_log_error_impl(&dword_1A0234000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A0236FB8);
  }
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0CD28B0], "activate");
  v6 = (void *)MEMORY[0x1E0CD28B0];
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __52__CATransaction_BaseBoardUI__bs_performAfterCommit___block_invoke;
  v21 = &unk_1E4348CE8;
  v7 = v5;
  v22 = v7;
  if ((objc_msgSend(v6, "addCommitHandler:forPhase:", &v18, 2) & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = objc_msgSend(MEMORY[0x1E0CD28B0], "currentPhase");
    objc_msgSend(v12, "stringWithFormat:", CFSTR("failed to register commit handler for phase = kCATransactionPhasePostCommit (current is %i)"), v13, v18, v19, v20, v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v24 = v15;
      v25 = 2114;
      v26 = v17;
      v27 = 2048;
      v28 = a1;
      v29 = 2114;
      v30 = CFSTR("CATransaction+BaseBoardUI.m");
      v31 = 1024;
      v32 = 35;
      v33 = 2114;
      v34 = v14;
      _os_log_error_impl(&dword_1A0234000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A02370BCLL);
  }

}

+ (void)bs_performAfterSynchronizedCommit:()BaseBoardUI
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("block"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v24 = v9;
      v25 = 2114;
      v26 = v11;
      v27 = 2048;
      v28 = a1;
      v29 = 2114;
      v30 = CFSTR("CATransaction+BaseBoardUI.m");
      v31 = 1024;
      v32 = 19;
      v33 = 2114;
      v34 = v8;
      _os_log_error_impl(&dword_1A0234000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A0237314);
  }
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0CD28B0], "activate");
  v6 = (void *)MEMORY[0x1E0CD28B0];
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __64__CATransaction_BaseBoardUI__bs_performAfterSynchronizedCommit___block_invoke;
  v21 = &unk_1E4348CE8;
  v7 = v5;
  v22 = v7;
  if ((objc_msgSend(v6, "addCommitHandler:forPhase:", &v18, 5) & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = objc_msgSend(MEMORY[0x1E0CD28B0], "currentPhase");
    objc_msgSend(v12, "stringWithFormat:", CFSTR("failed to register commit handler for phase = kCATransactionPhasePostSynchronize (current is %i)"), v13, v18, v19, v20, v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v24 = v15;
      v25 = 2114;
      v26 = v17;
      v27 = 2048;
      v28 = a1;
      v29 = 2114;
      v30 = CFSTR("CATransaction+BaseBoardUI.m");
      v31 = 1024;
      v32 = 25;
      v33 = 2114;
      v34 = v14;
      _os_log_error_impl(&dword_1A0234000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A0237418);
  }

}

@end
