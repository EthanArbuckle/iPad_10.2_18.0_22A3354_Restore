@implementation BKHIDPrimaryEventProcessor

- (void)bufferWillBeginDraining:(id)a3
{
  id v4;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  v5 = self->_allBufferedEventProcessors;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "bufferWillBeginDraining:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)bufferDidEndDraining:(id)a3
{
  id v4;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  v5 = self->_allBufferedEventProcessors;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "bufferDidEndDraining:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)bufferingDidAddNewBuffers:(id)a3
{
  id v4;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  v5 = self->_allBufferedEventProcessors;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "bufferingDidAddNewBuffers:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v8;
  id v9;
  NSArray *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  int64_t v16;
  BKHIDEventProcessor *defaultProcessor;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = self->_subProcessors[IOHIDEventGetType()];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v10;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v12)
  {

LABEL_13:
    defaultProcessor = self->_defaultProcessor;
    if (defaultProcessor)
      v16 = -[BKHIDEventProcessor processEvent:sender:dispatcher:](defaultProcessor, "processEvent:sender:dispatcher:", a3, v8, v9);
    else
      v16 = 0;
    goto LABEL_16;
  }
  v13 = v12;
  v14 = *(_QWORD *)v20;
  while (2)
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v20 != v14)
        objc_enumerationMutation(v11);
      v16 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "processEvent:sender:dispatcher:", a3, v8, v9, (_QWORD)v19);
      if (v16 == 1)
      {

        goto LABEL_16;
      }
    }
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
      continue;
    break;
  }

  if (!v16)
    goto LABEL_13;
LABEL_16:

  return v16;
}

- (BKHIDPrimaryEventProcessor)initWithSubProcessors:(id)a3[43] defaultProcessor:(id)a4
{
  id v6;
  BKHIDPrimaryEventProcessor *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  NSArray *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  NSArray *v19;
  id *p_isa;
  id obj;
  NSArray **bufferedSubProcessors;
  NSArray **subProcessors;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v30.receiver = self;
  v30.super_class = (Class)BKHIDPrimaryEventProcessor;
  v7 = -[BKHIDPrimaryEventProcessor init](&v30, sel_init);
  if (v7)
  {
    obj = a4;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    p_isa = (id *)&v7->super.isa;
    bufferedSubProcessors = v7->_bufferedSubProcessors;
    subProcessors = v7->_subProcessors;
    do
    {
      v10 = a3[v9];
      v11 = v10;
      objc_storeStrong((id *)&subProcessors[v9], v10);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v13 = v11;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v27 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v8, "addObject:", v18);
              -[NSArray addObject:](v12, "addObject:", v18);
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        }
        while (v15);
      }

      v19 = bufferedSubProcessors[v9];
      bufferedSubProcessors[v9] = v12;

      ++v9;
    }
    while (v9 != 43);
    v7 = (BKHIDPrimaryEventProcessor *)p_isa;
    objc_storeStrong(p_isa + 88, v8);
    objc_storeStrong(p_isa + 44, obj);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_storeStrong(p_isa + 89, obj);

  }
  return v7;
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 withContext:(id)a4 buffer:(id)a5 sequence:(id)a6 sender:(id)a7 dispatcher:(id)a8 resolution:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  int64_t result;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  BKHIDPrimaryEventProcessor *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Something is misconfigured --BKHIDPrimaryEventProcessor should never be messaged directly by a sequence"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138544642;
    v27 = v22;
    v28 = 2114;
    v29 = v24;
    v30 = 2048;
    v31 = self;
    v32 = 2114;
    v33 = CFSTR("BKHIDPrimaryEventProcessor.m");
    v34 = 1024;
    v35 = 91;
    v36 = 2114;
    v37 = v21;
    _os_log_error_impl(&dword_1C8914000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v26, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)postEvent:(__IOHIDEvent *)a3 withContext:(id)a4 toResolution:(id)a5 fromSequence:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  BKHIDPrimaryEventProcessor *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Something is misconfigured --BKHIDPrimaryEventProcessor should never be messaged directly by a sequence"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138544642;
    v18 = v14;
    v19 = 2114;
    v20 = v16;
    v21 = 2048;
    v22 = self;
    v23 = 2114;
    v24 = CFSTR("BKHIDPrimaryEventProcessor.m");
    v25 = 1024;
    v26 = 96;
    v27 = 2114;
    v28 = v13;
    _os_log_error_impl(&dword_1C8914000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v17, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (id)_eventProcessorsForEventType:(unsigned int)a3
{
  return (id)-[NSArray copy](self->_subProcessors[a3], "copy");
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t v4;

  objc_storeStrong((id *)&self->_defaultBufferedEventProcessor, 0);
  objc_storeStrong((id *)&self->_allBufferedEventProcessors, 0);
  for (i = 696; i != 352; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_defaultProcessor, 0);
  v4 = 344;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v4), 0);
    v4 -= 8;
  }
  while (v4);
}

@end
