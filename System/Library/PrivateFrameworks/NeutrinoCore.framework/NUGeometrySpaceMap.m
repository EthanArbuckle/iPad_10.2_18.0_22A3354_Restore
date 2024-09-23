@implementation NUGeometrySpaceMap

- (NUGeometrySpaceMap)init
{
  NUGeometrySpaceMap *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v6;
  NSMutableDictionary *spaces;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NUGeometrySpaceMap;
  v2 = -[NUGeometrySpaceMap init](&v9, sel_init);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("NUGeometrySpaceMap", v3);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v4;

  v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  spaces = v2->_spaces;
  v2->_spaces = v6;

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NUGeometrySpaceMap *v5;
  NSObject *queue;
  NUGeometrySpaceMap *v7;
  NUGeometrySpaceMap *v8;
  _QWORD block[4];
  NUGeometrySpaceMap *v11;
  NUGeometrySpaceMap *v12;
  _NSZone *v13;

  v5 = -[NUGeometrySpaceMap init](+[NUGeometrySpaceMap allocWithZone:](NUGeometrySpaceMap, "allocWithZone:"), "init");
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__NUGeometrySpaceMap_copyWithZone___block_invoke;
  block[3] = &unk_1E5063C48;
  v7 = v5;
  v11 = v7;
  v12 = self;
  v13 = a3;
  dispatch_sync(queue, block);
  v8 = v7;

  return v8;
}

- (unint64_t)count
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__NUGeometrySpaceMap_count__block_invoke;
  v5[3] = &unk_1E5063FE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)applyTransform:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __37__NUGeometrySpaceMap_applyTransform___block_invoke;
    v6[3] = &unk_1E5061750;
    v7 = v4;
    -[NUGeometrySpaceMap enumerateSpacesUsingBlock:](self, "enumerateSpacesUsingBlock:", v6);

  }
}

- (void)addTagNode:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "geometryNode");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "spaceMapKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__NUGeometrySpaceMap_addTagNode___block_invoke;
  block[3] = &unk_1E5062E88;
  block[4] = self;
  v11 = v5;
  v12 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_sync(queue, block);

}

- (id)taggedSpacesForKey:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__7823;
  v16 = __Block_byref_object_dispose__7824;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__NUGeometrySpaceMap_taggedSpacesForKey___block_invoke;
  block[3] = &unk_1E5063868;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)spacesForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v16;
  void *v17;
  void *specific;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_7719();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "key != nil");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v17;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_7719();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v24 = (void *)MEMORY[0x1E0CB3978];
        v25 = v23;
        objc_msgSend(v24, "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v23;
        v39 = 2114;
        v40 = v27;
        _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v22;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUGeometrySpaceMap spacesForKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometrySpaceMap.m", 238, CFSTR("Invalid parameter not satisfying: %s"), v28, v29, v30, v31, (uint64_t)"key != nil");
  }
  v5 = v4;
  -[NUGeometrySpaceMap taggedSpacesForKey:](self, "taggedSpacesForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "space");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v11);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)spaceForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_7719();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "key != nil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_7719();
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
        v27 = v17;
        v28 = 2114;
        v29 = v21;
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
      v27 = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUGeometrySpaceMap spaceForKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometrySpaceMap.m", 255, CFSTR("Invalid parameter not satisfying: %s"), v22, v23, v24, v25, (uint64_t)"key != nil");
  }
  v5 = v4;
  -[NUGeometrySpaceMap taggedSpacesForKey:](self, "taggedSpacesForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "space");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setSpace:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _NUTaggedSpace *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *specific;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _NUTaggedSpace *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    NUAssertLogger_7719();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "space != nil");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_7719();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v26 = (void *)MEMORY[0x1E0CB3978];
        v27 = v25;
        objc_msgSend(v26, "callStackSymbols");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v25;
        v46 = 2114;
        v47 = v29;
        _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUGeometrySpaceMap setSpace:forKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometrySpaceMap.m", 267, CFSTR("Invalid parameter not satisfying: %s"), v30, v31, v32, v33, (uint64_t)"space != nil");
  }
  v8 = v7;
  if (!v7)
  {
    NUAssertLogger_7719();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "key != nil");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v19;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_7719();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v22)
      {
        v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v35 = (void *)MEMORY[0x1E0CB3978];
        v36 = v34;
        objc_msgSend(v35, "callStackSymbols");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v34;
        v46 = 2114;
        v47 = v38;
        _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v24;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUGeometrySpaceMap setSpace:forKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometrySpaceMap.m", 268, CFSTR("Invalid parameter not satisfying: %s"), v39, v40, v41, v42, (uint64_t)"key != nil");
  }
  v9 = -[_NUTaggedSpace initWithSpace:]([_NUTaggedSpace alloc], "initWithSpace:", v6);
  v43 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUGeometrySpaceMap setSpaces:forKey:](self, "setSpaces:forKey:", v10, v8);

}

- (void)setSpaces:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  NSObject *v10;
  void *v11;
  void *specific;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  _QWORD block[5];
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    NUAssertLogger_7719();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "spaces != nil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_7719();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v25 = (void *)MEMORY[0x1E0CB3978];
        v26 = v24;
        objc_msgSend(v25, "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v24;
        v48 = 2114;
        v49 = v28;
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
      v47 = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUGeometrySpaceMap setSpaces:forKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometrySpaceMap.m", 276, CFSTR("Invalid parameter not satisfying: %s"), v29, v30, v31, v32, (uint64_t)"spaces != nil");
  }
  if (!v7)
  {
    NUAssertLogger_7719();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "key != nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_7719();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v21)
      {
        v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v34 = (void *)MEMORY[0x1E0CB3978];
        v35 = v33;
        objc_msgSend(v34, "callStackSymbols");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v33;
        v48 = 2114;
        v49 = v37;
        _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUGeometrySpaceMap setSpaces:forKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometrySpaceMap.m", 277, CFSTR("Invalid parameter not satisfying: %s"), v38, v39, v40, v41, (uint64_t)"key != nil");
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__NUGeometrySpaceMap_setSpaces_forKey___block_invoke;
  block[3] = &unk_1E5062E88;
  block[4] = self;
  v44 = v6;
  v45 = v7;
  v9 = v7;
  v42 = v6;
  dispatch_sync(queue, block);

}

- (void)setSpacesFromMap:(id)a3 andPruneAgainstTagNode:(id)a4 withPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  _NUTaggedSpace *v23;
  void *v24;
  _NUTaggedSpace *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  _NUTaggedSpace *v32;
  void *v33;
  _NUTaggedSpace *v34;
  NSObject *v35;
  void *v36;
  void *specific;
  NSObject *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  NUGeometrySpaceMap *v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint8_t v64[128];
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "geometryNode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    NUAssertLogger_7719();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot find the node for the given tag '%@' in the map"), v10);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v66 = v36;
      _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_7719();
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v39)
      {
        v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v43 = (void *)MEMORY[0x1E0CB3978];
        v44 = v42;
        objc_msgSend(v43, "callStackSymbols");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v66 = v42;
        v67 = 2114;
        v68 = v46;
        _os_log_error_impl(&dword_1A6553000, v38, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v39)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v66 = v41;
      _os_log_error_impl(&dword_1A6553000, v38, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUGeometrySpaceMap setSpacesFromMap:andPruneAgainstTagNode:withPath:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometrySpaceMap.m", 292, CFSTR("Cannot find the node for the given tag '%@' in the map"), v47, v48, v49, v50, (uint64_t)v10);
  }
  v12 = v11;
  objc_msgSend(v11, "spaceMapKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "taggedSpacesForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v51 = v12;
    v52 = self;
    v53 = v8;
    v54 = v10;
    v15 = (void *)objc_opt_new();
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v16 = v14;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v60 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          objc_msgSend(v21, "tagNodes");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "containsObject:", v9))
          {
            v23 = [_NUTaggedSpace alloc];
            objc_msgSend(v21, "space");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = -[_NUTaggedSpace initWithSpace:](v23, "initWithSpace:", v24);

            objc_msgSend(v15, "addObject:", v25);
          }

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
      }
      while (v18);
    }

    if (!objc_msgSend(v15, "count"))
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v26 = v16;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v56;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v56 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
            v32 = [_NUTaggedSpace alloc];
            objc_msgSend(v31, "space");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = -[_NUTaggedSpace initWithSpace:](v32, "initWithSpace:", v33);

            objc_msgSend(v15, "addObject:", v34);
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
        }
        while (v28);
      }

    }
    v10 = v54;
    -[NUGeometrySpaceMap setSpaces:forKey:](v52, "setSpaces:forKey:", v15, v54);

    v8 = v53;
    v12 = v51;
  }

}

- (void)enumerateSpacesUsingBlock:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__NUGeometrySpaceMap_enumerateSpacesUsingBlock___block_invoke;
  block[3] = &unk_1E50640F0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)mergeWithSpaceMap:(id)a3
{
  id v4;
  NSObject *queue;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  _QWORD block[4];
  id v24;
  NUGeometrySpaceMap *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_7719();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "otherSpaceMap != nil");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_7719();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v13;
        v28 = 2114;
        v29 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUGeometrySpaceMap mergeWithSpaceMap:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometrySpaceMap.m", 373, CFSTR("Invalid parameter not satisfying: %s"), v18, v19, v20, v21, (uint64_t)"otherSpaceMap != nil");
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__NUGeometrySpaceMap_mergeWithSpaceMap___block_invoke;
  block[3] = &unk_1E5063FB8;
  v24 = v4;
  v25 = self;
  v22 = v4;
  dispatch_sync(queue, block);

}

- (id)transformWithSourceSpace:(id)a3 destinationSpace:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NUCompoundTransform *v19;
  void *v20;
  void *v21;
  NUCompoundTransform *v22;
  void *v23;
  void *v24;
  NSObject *v26;
  void *v27;
  void *specific;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    NUAssertLogger_7719();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "srcSpaceName != nil");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v75 = v27;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_7719();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v30)
      {
        v47 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v48 = (void *)MEMORY[0x1E0CB3978];
        v49 = v47;
        objc_msgSend(v48, "callStackSymbols");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "componentsJoinedByString:", CFSTR("\n"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v75 = v47;
        v76 = 2114;
        v77 = v51;
        _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v30)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v75 = v32;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUGeometrySpaceMap transformWithSourceSpace:destinationSpace:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometrySpaceMap.m", 418, CFSTR("Invalid parameter not satisfying: %s"), v52, v53, v54, v55, (uint64_t)"srcSpaceName != nil");
  }
  v10 = v9;
  if (!v9)
  {
    NUAssertLogger_7719();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "dstSpaceName != nil");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v75 = v34;
      _os_log_error_impl(&dword_1A6553000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_7719();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (v35)
    {
      if (v37)
      {
        v56 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v57 = (void *)MEMORY[0x1E0CB3978];
        v58 = v56;
        objc_msgSend(v57, "callStackSymbols");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "componentsJoinedByString:", CFSTR("\n"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v75 = v56;
        v76 = 2114;
        v77 = v60;
        _os_log_error_impl(&dword_1A6553000, v36, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v37)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v75 = v39;
      _os_log_error_impl(&dword_1A6553000, v36, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUGeometrySpaceMap transformWithSourceSpace:destinationSpace:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometrySpaceMap.m", 419, CFSTR("Invalid parameter not satisfying: %s"), v61, v62, v63, v64, (uint64_t)"dstSpaceName != nil");
  }
  if (!a5)
  {
    NUAssertLogger_7719();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v75 = v41;
      _os_log_error_impl(&dword_1A6553000, v40, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_7719();
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
    if (v42)
    {
      if (v44)
      {
        v65 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v66 = (void *)MEMORY[0x1E0CB3978];
        v67 = v65;
        objc_msgSend(v66, "callStackSymbols");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "componentsJoinedByString:", CFSTR("\n"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v75 = v65;
        v76 = 2114;
        v77 = v69;
        _os_log_error_impl(&dword_1A6553000, v43, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v44)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v75 = v46;
      _os_log_error_impl(&dword_1A6553000, v43, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUGeometrySpaceMap transformWithSourceSpace:destinationSpace:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometrySpaceMap.m", 420, CFSTR("Invalid parameter not satisfying: %s"), v70, v71, v72, v73, (uint64_t)"error != NULL");
  }
  -[NUGeometrySpaceMap taggedSpacesForKey:](self, "taggedSpacesForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if (objc_msgSend(v11, "count") == 1)
    {
      -[NUGeometrySpaceMap taggedSpacesForKey:](self, "taggedSpacesForKey:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        if (objc_msgSend(v13, "count") == 1)
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "space");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "space");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = [NUCompoundTransform alloc];
          objc_msgSend(v16, "transformStack");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "transformStack");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[NUCompoundTransform initWithSrcTransforms:dstTransforms:](v19, "initWithSrcTransforms:dstTransforms:", v20, v21);

LABEL_15:
          goto LABEL_16;
        }
        +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 2, CFSTR("Ill-posed space map / incorrect number of entries for the destination space"), v14);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("No such space"), v10);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v22 = 0;
      *a5 = v24;
      goto LABEL_15;
    }
    +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 2, CFSTR("Ill-posed space map / incorrect number of entries for the source space"), v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("No such space"), v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = 0;
  *a5 = v23;
LABEL_16:

  return v22;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSMutableDictionary *spaces;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[NSMutableDictionary count](self->_spaces, "count");
  if (-[NSMutableDictionary count](self->_spaces, "count"))
    spaces = self->_spaces;
  else
    spaces = (NSMutableDictionary *)CFSTR("{}");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p spaces (%lu)  :: %@>"), v4, self, v5, spaces);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spaces, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __40__NUGeometrySpaceMap_mergeWithSpaceMap___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__NUGeometrySpaceMap_mergeWithSpaceMap___block_invoke_2;
  v3[3] = &unk_1E5061750;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateSpacesUsingBlock:", v3);
}

void __40__NUGeometrySpaceMap_mergeWithSpaceMap___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v5, 1);
    goto LABEL_6;
  }
  if ((objc_msgSend(v6, "isEqualToArray:", v5) & 1) == 0)
  {
    if (!+[NUGeometrySpaceMap _canReduceSpaces:withSpaces:](NUGeometrySpaceMap, "_canReduceSpaces:withSpaces:", v7, v5))
    {
      v9 = (void *)objc_msgSend(v7, "mutableCopy");
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v5, 1);
      objc_msgSend(v9, "addObjectsFromArray:", v10);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", v9, v11);

      goto LABEL_8;
    }
    +[NUGeometrySpaceMap _reduceSpaces:withSpaces:](NUGeometrySpaceMap, "_reduceSpaces:withSpaces:", v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v9 = (void *)v8;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", v8, v11);
LABEL_8:

  }
}

uint64_t __48__NUGeometrySpaceMap_enumerateSpacesUsingBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "enumerateKeysAndObjectsUsingBlock:", *(_QWORD *)(a1 + 40));
}

void __39__NUGeometrySpaceMap_setSpaces_forKey___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v2, "setObject:forKey:", v3, *(_QWORD *)(a1 + 48));

}

void __41__NUGeometrySpaceMap_taggedSpacesForKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __33__NUGeometrySpaceMap_addTagNode___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "addTagNode:", a1[6]);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __37__NUGeometrySpaceMap_applyTransform___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "space");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "appendTransform:", *(_QWORD *)(a1 + 32));

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

uint64_t __27__NUGeometrySpaceMap_count__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __35__NUGeometrySpaceMap_copyWithZone___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1[5] + 16), "mutableCopyWithZone:", a1[6]);
  v3 = a1[4];
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

}

+ (BOOL)_canReduceSpaces:(id)a3 withSpaces:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 == objc_msgSend(v6, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v12), "hasTransform") & 1) != 0)
          break;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
          if (v10)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v8 = v6;
      v13 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (!v13)
      {
        v17 = 1;
        goto LABEL_21;
      }
      v14 = v13;
      v15 = *(_QWORD *)v20;
LABEL_12:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "hasTransform", (_QWORD)v19) & 1) != 0)
          break;
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          v17 = 1;
          if (v14)
            goto LABEL_12;
          goto LABEL_21;
        }
      }
    }
    v17 = 0;
LABEL_21:

    goto LABEL_22;
  }
  v17 = 0;
LABEL_22:

  return v17;
}

+ (id)_reduceSpaces:(id)a3 withSpaces:(id)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  if (objc_msgSend(v5, "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mergeSpace:", v8);

      ++v7;
    }
    while (v7 < objc_msgSend(v5, "count"));
  }

  return v6;
}

@end
