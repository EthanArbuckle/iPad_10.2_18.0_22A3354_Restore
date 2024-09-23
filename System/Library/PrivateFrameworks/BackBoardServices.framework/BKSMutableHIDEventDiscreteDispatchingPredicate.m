@implementation BKSMutableHIDEventDiscreteDispatchingPredicate

- (BKSMutableHIDEventDiscreteDispatchingPredicate)init
{
  uint64_t v4;
  void *v5;
  void *v6;
  BKSMutableHIDEventDiscreteDispatchingPredicate *v7;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  BKSMutableHIDEventDiscreteDispatchingPredicate *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSMutableHIDEventDiscreteDispatchingPredicate cannot be subclassed"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138544642;
      v14 = v10;
      v15 = 2114;
      v16 = v12;
      v17 = 2048;
      v18 = self;
      v19 = 2114;
      v20 = CFSTR("BKSHIDEventDiscreteDispatchingPredicate.m");
      v21 = 1024;
      v22 = 216;
      v23 = 2114;
      v24 = v9;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A138800);
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BKSHIDEventDiscreteDispatchingPredicate _initWithSourceDescriptors:descriptors:](self, "_initWithSourceDescriptors:descriptors:", v5, v6);

  return v7;
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
  BKSMutableHIDEventDiscreteDispatchingPredicate *v25;
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
        v27 = CFSTR("BKSHIDEventDiscreteDispatchingPredicate.m");
        v28 = 1024;
        v29 = 222;
        v30 = 2114;
        v31 = v11;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A138A14);
    }

    if (objc_msgSend(v19, "bs_containsObjectPassingTest:", &__block_literal_global_127))
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
        v27 = CFSTR("BKSHIDEventDiscreteDispatchingPredicate.m");
        v28 = 1024;
        v29 = 226;
        v30 = 2114;
        v31 = v15;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A138B08);
    }
  }
  objc_msgSend(v19, "bs_map:", &__block_literal_global_132);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKSMutableHIDEventDiscreteDispatchingPredicate setSenderDescriptors:](self, "setSenderDescriptors:", v5);

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
  uint64_t v12;
  NSSet *v13;
  NSSet *senderDescriptors;
  NSSet *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  BKSMutableHIDEventDiscreteDispatchingPredicate *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      v21 = (objc_class *)objc_msgSend(v5, "classForCoder");
      if (!v21)
        v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("senderDescriptors"), v22, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v35 = v26;
        v36 = 2114;
        v37 = v28;
        v38 = 2048;
        v39 = self;
        v40 = 2114;
        v41 = CFSTR("BKSHIDEventDiscreteDispatchingPredicate.m");
        v42 = 1024;
        v43 = 238;
        v44 = 2114;
        v45 = v25;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A138ECCLL);
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v30 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("set contains non-BKSHIDEventSenderDescriptor elements : %@"), v7);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(a2);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = (objc_class *)objc_opt_class();
              NSStringFromClass(v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544642;
              v35 = v17;
              v36 = 2114;
              v37 = v19;
              v38 = 2048;
              v39 = self;
              v40 = 2114;
              v41 = CFSTR("BKSHIDEventDiscreteDispatchingPredicate.m");
              v42 = 1024;
              v43 = 242;
              v44 = 2114;
              v45 = v16;
              _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

            }
            objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x18A138D90);
          }
          objc_msgSend(v6, "addObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v9);
    }

    v13 = (NSSet *)objc_msgSend(v6, "copy");
    senderDescriptors = self->super._senderDescriptors;
    self->super._senderDescriptors = v13;

  }
  else
  {
    v15 = self->super._senderDescriptors;
    self->super._senderDescriptors = 0;

  }
}

- (void)setDescriptors:(id)a3
{
  NSSet *v5;
  NSSet *descriptors;
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
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  BKSMutableHIDEventDiscreteDispatchingPredicate *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  if (!v27)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("descriptors"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v29 = v11;
      v30 = 2114;
      v31 = v13;
      v32 = 2048;
      v33 = self;
      v34 = 2114;
      v35 = CFSTR("BKSHIDEventDiscreteDispatchingPredicate.m");
      v36 = 1024;
      v37 = 255;
      v38 = 2114;
      v39 = v10;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A1390A8);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (objc_class *)objc_msgSend(v27, "classForCoder");
    if (!v15)
      v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("descriptors"), v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v29 = v20;
      v30 = 2114;
      v31 = v22;
      v32 = 2048;
      v33 = self;
      v34 = 2114;
      v35 = CFSTR("BKSHIDEventDiscreteDispatchingPredicate.m");
      v36 = 1024;
      v37 = 255;
      v38 = 2114;
      v39 = v19;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A1391E4);
  }

  if (objc_msgSend(v27, "bs_containsObjectPassingTest:", &__block_literal_global_138))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("descriptors contains non-BKSHIDEventDescriptor elements : %@"), v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v29 = v24;
      v30 = 2114;
      v31 = v26;
      v32 = 2048;
      v33 = self;
      v34 = 2114;
      v35 = CFSTR("BKSHIDEventDiscreteDispatchingPredicate.m");
      v36 = 1024;
      v37 = 259;
      v38 = 2114;
      v39 = v23;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A1392D8);
  }
  v5 = (NSSet *)objc_msgSend(v27, "copy");
  descriptors = self->super._descriptors;
  self->super._descriptors = v5;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[BKSHIDEventDiscreteDispatchingPredicate _initWithSourceDescriptors:descriptors:](+[BKSHIDEventDiscreteDispatchingPredicate allocWithZone:](BKSHIDEventDiscreteDispatchingPredicate, "allocWithZone:", a3), "_initWithSourceDescriptors:descriptors:", self->super._senderDescriptors, self->super._descriptors);
}

BOOL __65__BKSMutableHIDEventDiscreteDispatchingPredicate_setDescriptors___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

id __62__BKSMutableHIDEventDiscreteDispatchingPredicate_setDisplays___block_invoke_130(uint64_t a1, void *a2)
{
  id v2;
  BKSMutableHIDEventSenderDescriptor *v3;
  void *v4;

  v2 = a2;
  v3 = objc_alloc_init(BKSMutableHIDEventSenderDescriptor);
  -[BKSMutableHIDEventSenderDescriptor setAssociatedDisplay:](v3, "setAssociatedDisplay:", v2);

  v4 = (void *)-[BKSMutableHIDEventSenderDescriptor copy](v3, "copy");
  return v4;
}

BOOL __62__BKSMutableHIDEventDiscreteDispatchingPredicate_setDisplays___block_invoke(uint64_t a1, void *a2)
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
  return objc_alloc_init(BKSMutableHIDEventDiscreteDispatchingPredicate);
}

+ (id)defaultSystemPredicate
{
  if (defaultSystemPredicate_onceToken != -1)
    dispatch_once(&defaultSystemPredicate_onceToken, &__block_literal_global_142);
  return (id)objc_msgSend((id)defaultSystemPredicate___defaultSystemPredicate, "mutableCopy");
}

+ (id)defaultFocusPredicate
{
  if (defaultFocusPredicate_onceToken != -1)
    dispatch_once(&defaultFocusPredicate_onceToken, &__block_literal_global_145);
  return (id)objc_msgSend((id)defaultFocusPredicate___defaultFocusPredicate, "mutableCopy");
}

void __71__BKSMutableHIDEventDiscreteDispatchingPredicate_defaultFocusPredicate__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BKSHIDEventDiscreteDispatchingPredicate *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  +[BKSHIDEventDescriptor descriptorWithEventType:](BKSHIDEventDescriptor, "descriptorWithEventType:", 11);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v0);

  +[BKSHIDEventDescriptor descriptorWithEventType:](BKSHIDEventDescriptor, "descriptorWithEventType:", 6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v1);

  +[BKSHIDEventDescriptor descriptorWithEventType:](BKSHIDEventDescriptor, "descriptorWithEventType:", 17);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v2);

  +[BKSHIDEventDescriptor descriptorWithEventType:](BKSHIDEventDescriptor, "descriptorWithEventType:", 35);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v3);

  +[BKSHIDEventDescriptor descriptorWithEventType:](BKSHIDEventDescriptor, "descriptorWithEventType:", 30);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v4);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 7, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v5);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 548);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v6);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 516);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v7);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 521);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v8);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 178);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v9);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 184);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v10);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 430);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v11);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 669);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v12);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 255, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v13);

  +[BKSHIDEventUsagePairDescriptor descriptorForHIDEventType:page:usage:](BKSHIDEventUsagePairDescriptor, "descriptorForHIDEventType:page:usage:", 1, 65280, 59);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v14);

  +[BKSHIDEventBiometricDescriptor descriptorWithBiometricEventType:](BKSHIDEventBiometricDescriptor, "descriptorWithBiometricEventType:", 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v15);

  +[BKSHIDEventBiometricDescriptor descriptorWithBiometricEventType:](BKSHIDEventBiometricDescriptor, "descriptorWithBiometricEventType:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v16);

  +[BKSHIDEventDescriptor descriptorWithEventType:](BKSHIDEventDescriptor, "descriptorWithEventType:", 39);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v17);

  v18 = [BKSHIDEventDiscreteDispatchingPredicate alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[BKSHIDEventDiscreteDispatchingPredicate _initWithSourceDescriptors:descriptors:](v18, "_initWithSourceDescriptors:descriptors:", v19, v22);
  v21 = (void *)defaultFocusPredicate___defaultFocusPredicate;
  defaultFocusPredicate___defaultFocusPredicate = v20;

}

void __72__BKSMutableHIDEventDiscreteDispatchingPredicate_defaultSystemPredicate__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  BKSHIDEventDiscreteDispatchingPredicate *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  id v76;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v76 = (id)objc_claimAutoreleasedReturnValue();
  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 11, 45);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v0);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 11, 46);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v1);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 11, 35);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v2);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 11, 33);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v3);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 65287, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v4);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 65281, 33);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v5);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 65281, 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v6);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 65281, 16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v7);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 65281, 64);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v8);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 65281, 65);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v9);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 133, 75);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v10);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 1, 134);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v11);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 1, 132);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v12);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 1, 133);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v13);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 1, 137);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v14);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 1, 141);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v15);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 1, 136);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v16);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 1, 139);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v17);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 1, 138);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v18);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 1, 140);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v19);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 1, 155);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v20);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 610);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v21);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 604);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v22);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 547);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v23);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 603);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v24);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 545);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v25);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 433);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v26);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 414);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v27);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 134);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v28);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 96);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v29);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 111);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v30);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 112);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v31);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 121);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v32);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 122);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v33);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 179);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v34);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 64);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v35);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 67);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v36);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 68);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v37);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 65);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v38);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 69);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v39);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 66);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v40);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v41);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 226);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v42);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 177);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v43);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 176);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v44);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 205);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v45);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 48);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v46);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 185);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v47);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 188);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v48);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 180);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v49);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 181);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v50);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 182);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v51);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 199);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v52);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 198);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v53);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 128);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v54);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 101);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v55);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 183);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v56);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 203);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v57);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 202);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v58);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 190);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v59);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 207);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v60);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 234);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v61);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 12, 233);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v62);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 65289, 1);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v63);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 65289, 2);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v64);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 65289, 3);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v65);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 65289, 4);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v66);

  +[BKSHIDEventKeyboardDescriptor descriptorWithPage:usage:](BKSHIDEventKeyboardDescriptor, "descriptorWithPage:usage:", 65289, 32);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v67);

  +[BKSHIDEventDescriptor descriptorWithEventType:](BKSHIDEventDescriptor, "descriptorWithEventType:", 32);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v68);

  +[BKSHIDEventBiometricDescriptor descriptorWithBiometricEventType:](BKSHIDEventBiometricDescriptor, "descriptorWithBiometricEventType:", 2);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v69);

  +[BKSHIDEventBiometricDescriptor descriptorWithBiometricEventType:](BKSHIDEventBiometricDescriptor, "descriptorWithBiometricEventType:", 1);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v70);

  +[BKSHIDEventDescriptor descriptorWithEventType:](BKSHIDEventDescriptor, "descriptorWithEventType:", 14);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v71);

  v72 = [BKSHIDEventDiscreteDispatchingPredicate alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = -[BKSHIDEventDiscreteDispatchingPredicate _initWithSourceDescriptors:descriptors:](v72, "_initWithSourceDescriptors:descriptors:", v73, v76);
  v75 = (void *)defaultSystemPredicate___defaultSystemPredicate;
  defaultSystemPredicate___defaultSystemPredicate = v74;

}

@end
