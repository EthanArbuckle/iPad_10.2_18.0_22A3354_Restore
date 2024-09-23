@implementation BKEventGraphDescriptionAccumulator

- (BKEventGraphDescriptionAccumulator)init
{
  BKEventGraphDescriptionAccumulator *v2;
  _BKGraphStructureNode *v3;
  _BKGraphStructureNode *topLevel;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKEventGraphDescriptionAccumulator;
  v2 = -[BKEventGraphDescriptionAccumulator init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_BKGraphStructureNode);
    topLevel = v2->_topLevel;
    v2->_topLevel = v3;

    objc_storeStrong((id *)&v2->_current, v2->_topLevel);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_current, 0);
  objc_storeStrong((id *)&self->_topLevel, 0);
}

- (_BKGraphStructureNode)_nodeWithSupernode:(void *)a1 format:(const __CFString *)a2 args:(va_list)a3
{
  _QWORD *v6;
  __CFString *v7;
  _BKGraphStructureNode *v8;
  _BKGraphStructureNode *v9;
  void *v10;
  const char *v11;

  v6 = a1;
  v7 = (__CFString *)CFStringCreateWithFormatAndArguments(0, 0, a2, a3);
  v8 = objc_alloc_init(_BKGraphStructureNode);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_supernode, a1);
  if (v6)
    v10 = (void *)v6[2];
  else
    v10 = 0;
  objc_msgSend(v10, "addObject:", v9);
  if (v9)
    objc_setProperty_nonatomic_copy(v9, v11, v7, 24);
  CFRelease(v7);

  return v9;
}

- (void)appendNode:(uint64_t)a3
{
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;

  if (a1)
  {
    v11 = *(_QWORD *)(a1 + 16);
    if (!v11 || (v12 = *(id *)(v11 + 8)) == 0)
      v12 = *(id *)(a1 + 8);
    -[BKEventGraphDescriptionAccumulator _nodeWithSupernode:format:args:](v12, a2, &a9);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v13;

  }
}

- (void)appendSubnode:(uint64_t)a3
{
  id v11;
  uint64_t v12;
  void *v13;

  if (a1)
  {
    v11 = *(id *)(a1 + 16);
    -[BKEventGraphDescriptionAccumulator _nodeWithSupernode:format:args:](v11, a2, &a9);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v12;

  }
}

- (id)pushSection
{
  if (a1)
    a1 = (id *)a1[2];
  return a1;
}

- (void)popSection:(uint64_t)a1
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
  {
    v23 = v4;
    v5 = v4;
    if (!v5)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_opt_class();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("node"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_popSection_);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v25 = v11;
        v26 = 2114;
        v27 = v13;
        v28 = 2048;
        v29 = a1;
        v30 = 2114;
        v31 = CFSTR("BKEventGraphTranscript.m");
        v32 = 1024;
        v33 = 97;
        v34 = 2114;
        v35 = v10;
        _os_log_error_impl(&dword_1C8914000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1C892E51CLL);
    }
    v6 = v5;
    objc_opt_class();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      v15 = (objc_class *)objc_msgSend(v6, "classForCoder");
      if (!v15)
        v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("node"), v16, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_popSection_);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v25 = v20;
        v26 = 2114;
        v27 = v22;
        v28 = 2048;
        v29 = a1;
        v30 = 2114;
        v31 = CFSTR("BKEventGraphTranscript.m");
        v32 = 1024;
        v33 = 97;
        v34 = 2114;
        v35 = v19;
        _os_log_error_impl(&dword_1C8914000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1C892E65CLL);
    }

    objc_storeStrong((id *)(a1 + 16), a2);
    v4 = v23;
  }

}

- (void)_recursiveAppendNode:(void *)a3 toDescription:
{
  id *v5;
  id *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  id *v22;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (v5)
    {
      v13 = v5[3];
      if (v13)
        -[BKGraphDescription appendNode:](v6, v13, v7, v8, v9, v10, v11, v12, v18);
      v14 = v5[2];
    }
    else
    {
      v13 = 0;
      v14 = 0;
    }
    v15 = v14;
    v16 = objc_msgSend(v15, "count");
    if (v16 >= 1)
    {
      v17 = v16;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __73__BKEventGraphDescriptionAccumulator__recursiveAppendNode_toDescription___block_invoke;
      v19[3] = &unk_1E81F7BE8;
      v20 = v15;
      v21 = a1;
      v22 = v6;
      -[BKGraphDescription appendSubnodesWithCount:block:]((uint64_t)v22, v17, v19);

    }
  }

}

void __73__BKEventGraphDescriptionAccumulator__recursiveAppendNode_toDescription___block_invoke(uint64_t a1)
{
  id v2;
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
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
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
        -[BKEventGraphDescriptionAccumulator _recursiveAppendNode:toDescription:](*(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), *(_QWORD *)(a1 + 48));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

@end
