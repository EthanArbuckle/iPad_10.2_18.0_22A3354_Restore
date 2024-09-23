@implementation NUGroupPattern

- (NUGroupPattern)init
{
  return -[NUGroupPattern initWithGroup:](self, "initWithGroup:", MEMORY[0x1E0C9AA60]);
}

- (NUGroupPattern)initWithGroup:(id)a3
{
  id v4;
  void *v5;
  NUGroupPattern *v6;
  uint64_t v7;
  NSArray *group;
  NSObject *v10;
  void *v11;
  void *specific;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_4244();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "group != nil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4244();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v18 = (void *)MEMORY[0x1E0CB3978];
        v19 = v17;
        objc_msgSend(v18, "callStackSymbols");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v17;
        v29 = 2114;
        v30 = v21;
        _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUGroupPattern initWithGroup:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 445, CFSTR("Invalid parameter not satisfying: %s"), v22, v23, v24, v25, (uint64_t)"group != nil");
  }
  v5 = v4;
  v26.receiver = self;
  v26.super_class = (Class)NUGroupPattern;
  v6 = -[NUGroupPattern init](&v26, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    group = v6->_group;
    v6->_group = (NSArray *)v7;

  }
  return v6;
}

- (id)tokens
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_group;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "tokens", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionSet:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)isFixedOrder
{
  void *v3;
  char v4;

  if (!-[NSArray count](self->_group, "count"))
    return 1;
  if (-[NSArray count](self->_group, "count") != 1)
    return 0;
  -[NSArray objectAtIndexedSubscript:](self->_group, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFixedOrder");

  return v4;
}

- (id)shortestMatch
{
  void *v3;
  void *v4;

  if (-[NSArray count](self->_group, "count"))
  {
    if (-[NSArray count](self->_group, "count") == 1)
    {
      -[NSArray objectAtIndexedSubscript:](self->_group, "objectAtIndexedSubscript:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "shortestMatch");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v4;
}

- (id)optimizedPattern
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NUGroupPattern *v10;
  NUGroupPattern *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_group, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_group;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "optimizedPattern", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isEmpty") & 1) == 0)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == 1)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v10 = (NUGroupPattern *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = -[NUGroupPattern initWithGroup:]([NUGroupPattern alloc], "initWithGroup:", v3);
    }
  }
  else
  {
    v10 = objc_alloc_init(NUEmptyPattern);
  }
  v11 = v10;

  return v11;
}

- (id)stringRepresentation
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_group, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_group;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "stringRepresentation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("(%@)"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqualToPattern:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[NUGroupPattern isEqualToGroupPattern:](self, "isEqualToGroupPattern:", v4);

  return v5;
}

- (BOOL)isEqualToGroupPattern:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NUGroupPattern group](self, "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "group");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToArray:", v6);
  return (char)v4;
}

- (BOOL)match:(id)a3 location:(unint64_t *)a4 count:(unint64_t *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t *v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  unint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v12 = a5;
  v7 = a3;
  v8 = (void *)-[NSArray mutableCopy](self->_group, "mutableCopy");
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v9 = MEMORY[0x1E0C809B0];
  while (1)
  {
    v10 = objc_msgSend(v8, "count", v12);
    if (!v10)
      break;
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0x7FFFFFFFFFFFFFFFLL;
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __39__NUGroupPattern_match_location_count___block_invoke;
    v13[3] = &unk_1E5061258;
    v14 = v7;
    v15 = &v18;
    v16 = &v22;
    v17 = a4;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);
    if (v19[3] == 0x7FFFFFFFFFFFFFFFLL)
    {

      _Block_object_dispose(&v18, 8);
      break;
    }
    objc_msgSend(v8, "removeObjectAtIndex:");

    _Block_object_dispose(&v18, 8);
  }
  *v12 = v23[3];
  _Block_object_dispose(&v22, 8);

  return v10 == 0;
}

- (NSArray)group
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
}

uint64_t __39__NUGroupPattern_match_location_count___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  uint64_t v8;

  v8 = 0;
  result = objc_msgSend(a2, "match:location:count:", a1[4], a1[7], &v8);
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
    if (v8)
    {
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += v8;
      *a4 = 1;
    }
  }
  return result;
}

@end
