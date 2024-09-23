@implementation BKSMutableHIDEventKeyCommandsDispatchingPredicate

- (BKSMutableHIDEventKeyCommandsDispatchingPredicate)init
{
  uint64_t v4;
  void *v5;
  BKSMutableHIDEventKeyCommandsDispatchingPredicate *v6;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BKSMutableHIDEventKeyCommandsDispatchingPredicate *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSMutableHIDEventKeyCommandsDispatchingPredicate cannot be subclassed"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138544642;
      v13 = v9;
      v14 = 2114;
      v15 = v11;
      v16 = 2048;
      v17 = self;
      v18 = 2114;
      v19 = CFSTR("BKSHIDEventKeyCommandsDispatchingPredicate.m");
      v20 = 1024;
      v21 = 153;
      v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v12, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A131DACLL);
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BKSHIDEventKeyCommandsDispatchingPredicate _initWithSenderDescriptors:](self, "_initWithSenderDescriptors:", v5);

  return v6;
}

- (void)setDisplays:(id)a3
{
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  BKSMutableHIDEventKeyCommandsDispatchingPredicate *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  if (v19)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = (objc_class *)objc_msgSend(v19, "classForCoder");
      if (!v7)
        v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("displays"), v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v21 = v12;
        v22 = 2114;
        v23 = v14;
        v24 = 2048;
        v25 = self;
        v26 = 2114;
        v27 = CFSTR("BKSHIDEventKeyCommandsDispatchingPredicate.m");
        v28 = 1024;
        v29 = 160;
        v30 = 2114;
        v31 = v11;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A131FC0);
    }

    if (objc_msgSend(v19, "bs_containsObjectPassingTest:", &__block_literal_global_107))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("displays contains non-BKSHIDEventDisplay elements : %@"), v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v21 = v16;
        v22 = 2114;
        v23 = v18;
        v24 = 2048;
        v25 = self;
        v26 = 2114;
        v27 = CFSTR("BKSHIDEventKeyCommandsDispatchingPredicate.m");
        v28 = 1024;
        v29 = 164;
        v30 = 2114;
        v31 = v15;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A1320B4);
    }
  }
  objc_msgSend(v19, "bs_map:", &__block_literal_global_112);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKSMutableHIDEventKeyCommandsDispatchingPredicate setSenderDescriptors:](self, "setSenderDescriptors:", v5);

}

- (void)setSenderDescriptors:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSSet *v14;
  NSSet *senderDescriptors;
  NSSet *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  BKSMutableHIDEventKeyCommandsDispatchingPredicate *v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v21 = (void *)MEMORY[0x1E0CB3940];
      v22 = (objc_class *)objc_msgSend(v5, "classForCoder");
      if (!v22)
        v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("senderDescriptors"), v23, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v36 = v27;
        v37 = 2114;
        v38 = v29;
        v39 = 2048;
        v40 = self;
        v41 = 2114;
        v42 = CFSTR("BKSHIDEventKeyCommandsDispatchingPredicate.m");
        v43 = 1024;
        v44 = 176;
        v45 = 2114;
        v46 = v26;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A132488);
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("set contains non-BKSHIDEventSenderDescriptor elements : %@"), v7);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(a2);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = (objc_class *)objc_opt_class();
              NSStringFromClass(v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544642;
              v36 = v18;
              v37 = 2114;
              v38 = v20;
              v39 = 2048;
              v40 = self;
              v41 = 2114;
              v42 = CFSTR("BKSHIDEventKeyCommandsDispatchingPredicate.m");
              v43 = 1024;
              v44 = 180;
              v45 = 2114;
              v46 = v17;
              _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

            }
            objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x18A13234CLL);
          }
          v13 = (void *)objc_msgSend(v12, "copy");
          objc_msgSend(v6, "addObject:", v13);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v9);
    }

    v14 = (NSSet *)objc_msgSend(v6, "copy");
    senderDescriptors = self->super._senderDescriptors;
    self->super._senderDescriptors = v14;

  }
  else
  {
    v16 = self->super._senderDescriptors;
    self->super._senderDescriptors = 0;

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[BKSHIDEventKeyCommandsDispatchingPredicate _initWithSenderDescriptors:](+[BKSHIDEventKeyCommandsDispatchingPredicate allocWithZone:](BKSHIDEventKeyCommandsDispatchingPredicate, "allocWithZone:", a3), "_initWithSenderDescriptors:", self->super._senderDescriptors);
}

BKSMutableHIDEventSenderDescriptor *__65__BKSMutableHIDEventKeyCommandsDispatchingPredicate_setDisplays___block_invoke_110(uint64_t a1, void *a2)
{
  id v2;
  BKSMutableHIDEventSenderDescriptor *v3;

  v2 = a2;
  v3 = objc_alloc_init(BKSMutableHIDEventSenderDescriptor);
  -[BKSMutableHIDEventSenderDescriptor setAssociatedDisplay:](v3, "setAssociatedDisplay:", v2);

  return v3;
}

BOOL __65__BKSMutableHIDEventKeyCommandsDispatchingPredicate_setDisplays___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

+ (id)new
{
  return objc_alloc_init(BKSMutableHIDEventKeyCommandsDispatchingPredicate);
}

@end
