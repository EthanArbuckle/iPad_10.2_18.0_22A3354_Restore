@implementation BKHIDEventBuffer

- (NSSet)bufferingPIDs
{
  return self->_bufferingPIDs;
}

- (void)setBufferingPIDs:(id)a3
{
  objc_storeStrong((id *)&self->_bufferingPIDs, a3);
}

- (void)invalidate
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *buffer;
  BKSHIDEventDispatchingTarget *dispatchTarget;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = self->_buffer;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "invalidate", (_QWORD)v10);
        }
        while (v5 != v7);
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

    buffer = self->_buffer;
    self->_buffer = 0;

    dispatchTarget = self->_dispatchTarget;
    self->_dispatchTarget = 0;

  }
}

- (BOOL)hasEvents
{
  return -[NSMutableArray count](self->_buffer, "count") != 0;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

id __49__BKHIDEventBuffer_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("dispatchTarget"));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "count"))
    v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("bufferingPIDs"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "count"), CFSTR("eventCount"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 17), CFSTR("allBufferingClientsTerminated"), 1);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  BKHIDEventBuffer *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__BKHIDEventBuffer_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E81F7CF8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", self, v6);

}

- (void)dealloc
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKHIDEventBuffer *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_invalidated"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v10 = v5;
      v11 = 2114;
      v12 = v7;
      v13 = 2048;
      v14 = self;
      v15 = 2114;
      v16 = CFSTR("BKHIDEventBuffer.m");
      v17 = 1024;
      v18 = 76;
      v19 = 2114;
      v20 = v4;
      _os_log_error_impl(&dword_1C8914000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1C891DCB4);
  }
  v8.receiver = self;
  v8.super_class = (Class)BKHIDEventBuffer;
  -[BKHIDEventBuffer dealloc](&v8, sel_dealloc);
}

- (BKHIDEventBuffer)initWithDispatchTarget:(id)a3
{
  id v5;
  BKHIDEventBuffer *v6;
  BKHIDEventBuffer *v7;
  uint64_t v8;
  NSMutableArray *buffer;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKHIDEventBuffer;
  v6 = -[BKHIDEventBuffer init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchTarget, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 256);
    buffer = v7->_buffer;
    v7->_buffer = (NSMutableArray *)v8;

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferingPIDs, 0);
  objc_storeStrong((id *)&self->_dispatchTarget, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

- (void)appendEvent:(__IOHIDEvent *)a3 sender:(id)a4 sequence:(id)a5 additionalContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  BKBufferedEventEntry *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  objc_class *v33;
  void *v34;
  uint8_t buf[4];
  NSObject *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  BKHIDEventBuffer *v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("event != nil"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v36 = v20;
      v37 = 2114;
      v38 = v22;
      v39 = 2048;
      v40 = self;
      v41 = 2114;
      v42 = CFSTR("BKHIDEventBuffer.m");
      v43 = 1024;
      v44 = 82;
      v45 = 2114;
      v46 = v19;
      _os_log_error_impl(&dword_1C8914000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1C8934CB8);
  }
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("sender != nil"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v36 = v24;
      v37 = 2114;
      v38 = v26;
      v39 = 2048;
      v40 = self;
      v41 = 2114;
      v42 = CFSTR("BKHIDEventBuffer.m");
      v43 = 1024;
      v44 = 83;
      v45 = 2114;
      v46 = v23;
      _os_log_error_impl(&dword_1C8914000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1C8934DB0);
  }
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("sequence != nil"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v36 = v28;
      v37 = 2114;
      v38 = v30;
      v39 = 2048;
      v40 = self;
      v41 = 2114;
      v42 = CFSTR("BKHIDEventBuffer.m");
      v43 = 1024;
      v44 = 84;
      v45 = 2114;
      v46 = v27;
      _os_log_error_impl(&dword_1C8914000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1C8934EA8);
  }
  v14 = v13;
  objc_msgSend(v11, "senderDescriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[sender senderDescriptor] != nil"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v36 = v32;
      v37 = 2114;
      v38 = v34;
      v39 = 2048;
      v40 = self;
      v41 = 2114;
      v42 = CFSTR("BKHIDEventBuffer.m");
      v43 = 1024;
      v44 = 85;
      v45 = 2114;
      v46 = v31;
      _os_log_error_impl(&dword_1C8914000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1C8934FA0);
  }
  if ((unint64_t)-[NSMutableArray count](self->_buffer, "count") > 0x100)
  {
    BKLogEventDelivery();
    v16 = (BKBufferedEventEntry *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    BKSHIDEventGetConciseDescription();
    v17 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v36 = v17;
    _os_log_error_impl(&dword_1C8914000, &v16->super, OS_LOG_TYPE_ERROR, "BUFFER: is full -- dropping event (%{public}@)", buf, 0xCu);
  }
  else
  {
    v16 = objc_alloc_init(BKBufferedEventEntry);
    -[BKBufferedEventEntry setEvent:](v16, "setEvent:", a3);
    -[BKBufferedEventEntry setSender:](v16, "setSender:", v11);
    -[BKBufferedEventEntry setSequence:](v16, "setSequence:", v12);
    if (v14)
      -[BKBufferedEventEntry setAdditionalContext:](v16, "setAdditionalContext:", v14);
    -[NSMutableArray addObject:](self->_buffer, "addObject:", v16);
    BKLogEventDelivery();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      BKSHIDEventGetConciseDescription();
      v18 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v18;
      _os_log_debug_impl(&dword_1C8914000, v17, OS_LOG_TYPE_DEBUG, "BUFFER: appending (%{public}@)", buf, 0xCu);

    }
  }

LABEL_12:
}

- (id)drainAllEvents
{
  NSObject *v3;
  int v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  NSMutableArray *buffer;
  NSSet *bufferingPIDs;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  BKLogEventDelivery();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[NSMutableArray count](self->_buffer, "count");
    v10[0] = 67109120;
    v10[1] = v4;
    _os_log_impl(&dword_1C8914000, v3, OS_LOG_TYPE_DEFAULT, "Draining buffer with %d events", (uint8_t *)v10, 8u);
  }

  v5 = self->_buffer;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 256);
  v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  buffer = self->_buffer;
  self->_buffer = v6;

  bufferingPIDs = self->_bufferingPIDs;
  self->_bufferingPIDs = 0;

  return v5;
}

- (id)_test_peekAllEvents
{
  return self->_buffer;
}

- (id)_test_peekAllIOHIDEvents
{
  return (id)-[NSMutableArray bs_map:](self->_buffer, "bs_map:", &__block_literal_global_2949);
}

- (BKSHIDEventDispatchingTarget)dispatchTarget
{
  return self->_dispatchTarget;
}

- (BOOL)allBufferingClientsTerminated
{
  return self->_allBufferingClientsTerminated;
}

- (void)setAllBufferingClientsTerminated:(BOOL)a3
{
  self->_allBufferingClientsTerminated = a3;
}

uint64_t __44__BKHIDEventBuffer__test_peekAllIOHIDEvents__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "event");
}

@end
