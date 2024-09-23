@implementation BKSMutableMousePointerEventGlobalRoute

- (void)setContextID:(unsigned int)a3
{
  self->super._contextID = a3;
}

- (void)setOptions:(id)a3
{
  BKSMousePointerGlobalContextOptions *v5;
  BKSMousePointerGlobalContextOptions *options;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  BKSMutableMousePointerEventGlobalRoute *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = (BKSMousePointerGlobalContextOptions *)a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = (objc_class *)-[BKSMousePointerGlobalContextOptions classForCoder](v5, "classForCoder");
      if (!v8)
        v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("options"), v9, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v17 = v13;
        v18 = 2114;
        v19 = v15;
        v20 = 2048;
        v21 = self;
        v22 = 2114;
        v23 = CFSTR("BKSMousePointerEventGlobalRoute.m");
        v24 = 1024;
        v25 = 160;
        v26 = 2114;
        v27 = v12;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A12FD10);
    }
  }

  options = self->super._options;
  self->super._options = v5;

}

@end
