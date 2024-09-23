@implementation ARCoachingHeuristicCollection

- (ARCoachingHeuristicCollection)init
{
  ARCoachingHeuristicCollection *v2;
  NSMutableArray *v3;
  NSMutableArray *heuristics;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARCoachingHeuristicCollection;
  v2 = -[ARCoachingHeuristicCollection init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    heuristics = v2->_heuristics;
    v2->_heuristics = v3;

  }
  return v2;
}

- (int64_t)requirements
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_heuristics;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "requirements", (_QWORD)v9);
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)updateWithFrame:(id)a3 cache:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  __int128 v25;
  uint64_t v26;
  ARCoachingHeuristicCollection *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  ARCoachingHeuristicCollection *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  const __CFString *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v27 = self;
  v8 = self->_heuristics;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v30;
    LODWORD(v13) = 1;
    *(_QWORD *)&v10 = 138544130;
    v25 = v10;
    v26 = *(_QWORD *)v30;
    do
    {
      v14 = 0;
      v28 = v11;
      do
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v14);
        v16 = objc_msgSend(v15, "satisfied", v25);
        objc_msgSend(v15, "updateWithFrame:cache:", v6, v7);
        v17 = objc_msgSend(v15, "satisfied");
        if (v16 != v17)
        {
          _ARLogCoaching_3();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v19 = (objc_class *)objc_opt_class();
            NSStringFromClass(v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (objc_class *)objc_opt_class();
            NSStringFromClass(v21);
            v22 = objc_claimAutoreleasedReturnValue();
            v23 = (void *)v22;
            *(_DWORD *)buf = v25;
            v24 = CFSTR("unsatisfied");
            if (v17)
              v24 = CFSTR("satisfied");
            v34 = v20;
            v35 = 2048;
            v36 = v27;
            v12 = v26;
            v37 = 2112;
            v38 = v22;
            v39 = 2112;
            v40 = v24;
            _os_log_impl(&dword_1DCC73000, v18, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Coaching heuristic %@ became %@", buf, 0x2Au);

            v11 = v28;
          }

        }
        v13 = v13 & v17;
        ++v14;
      }
      while (v11 != v14);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    }
    while (v11);
  }
  else
  {
    v13 = 1;
  }

  -[ARCoachingHeuristic setSatisfied:](v27, "setSatisfied:", v13);
}

- (void)addHeuristic:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  ARCoachingHeuristicCollection *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableArray addObject:](self->_heuristics, "addObject:", v4);
  _ARLogCoaching_3();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v7;
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1DCC73000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Added coaching heuristic %@", (uint8_t *)&v10, 0x20u);

  }
}

- (void)clear
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  ARCoachingHeuristicCollection *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[ARCoachingHeuristic setSatisfied:](self, "setSatisfied:", 0);
  -[NSMutableArray removeAllObjects](self->_heuristics, "removeAllObjects");
  _ARLogCoaching_3();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v5;
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_1DCC73000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Cleared coaching heuristics", (uint8_t *)&v6, 0x16u);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heuristics, 0);
}

@end
