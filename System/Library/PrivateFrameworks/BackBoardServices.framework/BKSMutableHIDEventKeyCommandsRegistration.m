@implementation BKSMutableHIDEventKeyCommandsRegistration

- (BKSMutableHIDEventKeyCommandsRegistration)init
{
  uint64_t v4;
  void *v5;
  void *v6;
  BKSMutableHIDEventKeyCommandsRegistration *v7;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  BKSMutableHIDEventKeyCommandsRegistration *v18;
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
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSMutableHIDEventKeyCommandsRegistration cannot be subclassed"));
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
      v20 = CFSTR("BKSHIDEventKeyCommandsRegistration.m");
      v21 = 1024;
      v22 = 167;
      v23 = 2114;
      v24 = v9;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A12BEA0);
  }
  +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment](BKSHIDEventDeferringEnvironment, "keyboardFocusEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BKSHIDEventKeyCommandsRegistration _initWithEnvironment:token:keyCommands:](self, "_initWithEnvironment:token:keyCommands:", v5, 0, v6);

  return v7;
}

- (void)setDeferringEnvironment:(id)a3
{
  BKSHIDEventDeferringEnvironment *v5;
  BKSHIDEventDeferringEnvironment *environment;
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
  BKSMutableHIDEventKeyCommandsRegistration *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  if (!v23)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("environment"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v25 = v11;
      v26 = 2114;
      v27 = v13;
      v28 = 2048;
      v29 = self;
      v30 = 2114;
      v31 = CFSTR("BKSHIDEventKeyCommandsRegistration.m");
      v32 = 1024;
      v33 = 173;
      v34 = 2114;
      v35 = v10;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A12C068);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (objc_class *)objc_msgSend(v23, "classForCoder");
    if (!v15)
      v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("environment"), v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v25 = v20;
      v26 = 2114;
      v27 = v22;
      v28 = 2048;
      v29 = self;
      v30 = 2114;
      v31 = CFSTR("BKSHIDEventKeyCommandsRegistration.m");
      v32 = 1024;
      v33 = 173;
      v34 = 2114;
      v35 = v19;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A12C1A4);
  }

  v5 = (BKSHIDEventDeferringEnvironment *)objc_msgSend(v23, "copy");
  environment = self->super._environment;
  self->super._environment = v5;

}

- (void)setDeferringToken:(id)a3
{
  BKSHIDEventDeferringToken *v5;
  BKSHIDEventDeferringToken *token;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  BKSMutableHIDEventKeyCommandsRegistration *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = (objc_class *)objc_msgSend(v16, "classForCoder");
      if (!v8)
        v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("token"), v9, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v18 = v13;
        v19 = 2114;
        v20 = v15;
        v21 = 2048;
        v22 = self;
        v23 = 2114;
        v24 = CFSTR("BKSHIDEventKeyCommandsRegistration.m");
        v25 = 1024;
        v26 = 179;
        v27 = 2114;
        v28 = v12;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A12C390);
    }
  }

  v5 = (BKSHIDEventDeferringToken *)objc_msgSend(v16, "copy");
  token = self->super._token;
  self->super._token = v5;

}

- (void)setKeyCommands:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSSet *v14;
  NSSet *keyCommands;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  BKSMutableHIDEventKeyCommandsRegistration *v58;
  __int16 v59;
  const __CFString *v60;
  __int16 v61;
  int v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    v32 = (void *)MEMORY[0x1E0CB3940];
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("keyCommands"), v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v54 = v36;
      v55 = 2114;
      v56 = v38;
      v57 = 2048;
      v58 = self;
      v59 = 2114;
      v60 = CFSTR("BKSHIDEventKeyCommandsRegistration.m");
      v61 = 1024;
      v62 = 185;
      v63 = 2114;
      v64 = v35;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A12C868);
  }
  v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v39 = (void *)MEMORY[0x1E0CB3940];
    v40 = (objc_class *)objc_msgSend(v6, "classForCoder");
    if (!v40)
      v40 = (objc_class *)objc_opt_class();
    NSStringFromClass(v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (objc_class *)objc_opt_class();
    NSStringFromClass(v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("keyCommands"), v41, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (objc_class *)objc_opt_class();
      NSStringFromClass(v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v54 = v45;
      v55 = 2114;
      v56 = v47;
      v57 = 2048;
      v58 = self;
      v59 = 2114;
      v60 = CFSTR("BKSHIDEventKeyCommandsRegistration.m");
      v61 = 1024;
      v62 = 185;
      v63 = 2114;
      v64 = v44;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v44), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A12C9A4);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v49;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v49 != v10)
          objc_enumerationMutation(v7);
        v12 = *(id *)(*((_QWORD *)&v48 + 1) + 8 * v11);
        if (!v12)
        {
          v16 = (void *)MEMORY[0x1E0CB3940];
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("keyCommand"), v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (objc_class *)objc_opt_class();
            NSStringFromClass(v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v54 = v20;
            v55 = 2114;
            v56 = v22;
            v57 = 2048;
            v58 = self;
            v59 = 2114;
            v60 = CFSTR("BKSHIDEventKeyCommandsRegistration.m");
            v61 = 1024;
            v62 = 187;
            v63 = 2114;
            v64 = v19;
            _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18A12C614);
        }
        v13 = v12;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v23 = (void *)MEMORY[0x1E0CB3940];
          v24 = (objc_class *)objc_msgSend(v13, "classForCoder");
          if (!v24)
            v24 = (objc_class *)objc_opt_class();
          NSStringFromClass(v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (objc_class *)objc_opt_class();
          NSStringFromClass(v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("keyCommand"), v25, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = (objc_class *)objc_opt_class();
            NSStringFromClass(v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v54 = v29;
            v55 = 2114;
            v56 = v31;
            v57 = 2048;
            v58 = self;
            v59 = 2114;
            v60 = CFSTR("BKSHIDEventKeyCommandsRegistration.m");
            v61 = 1024;
            v62 = 187;
            v63 = 2114;
            v64 = v28;
            _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18A12C750);
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v9);
  }

  v14 = (NSSet *)objc_msgSend(v7, "copy");
  keyCommands = self->super._keyCommands;
  self->super._keyCommands = v14;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[BKSHIDEventKeyCommandsRegistration _initWithEnvironment:token:keyCommands:](+[BKSHIDEventKeyCommandsRegistration allocWithZone:](BKSHIDEventKeyCommandsRegistration, "allocWithZone:", a3), "_initWithEnvironment:token:keyCommands:", self->super._environment, self->super._token, self->super._keyCommands);
}

+ (id)new
{
  return objc_alloc_init(BKSMutableHIDEventKeyCommandsRegistration);
}

@end
