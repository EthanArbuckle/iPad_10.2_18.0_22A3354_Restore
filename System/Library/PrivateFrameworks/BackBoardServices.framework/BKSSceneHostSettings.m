@implementation BKSSceneHostSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BKSSceneHostSettings)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BKSSceneHostSettings *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ident"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("touchBehavior"));

  v7 = -[BKSSceneHostSettings initWithIdentifier:touchBehavior:](self, "initWithIdentifier:touchBehavior:", v5, v6);
  return v7;
}

- (BKSSceneHostSettings)initWithIdentifier:(id)a3 touchBehavior:(int64_t)a4
{
  id v7;
  void *v8;
  objc_class *v9;
  BKSSceneHostSettings *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *identifier;
  void *v15;
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
  void *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  objc_super v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  BKSSceneHostSettings *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  if (!v7)
  {
    NSStringFromClass(v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("identifier"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v39 = v17;
      v40 = 2114;
      v41 = v19;
      v42 = 2048;
      v43 = self;
      v44 = 2114;
      v45 = CFSTR("BKSSceneHostSettings.m");
      v46 = 1024;
      v47 = 58;
      v48 = 2114;
      v49 = v16;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0F25ECLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    v21 = (objc_class *)objc_msgSend(v7, "classForCoder");
    if (!v21)
      v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("identifier"), v22, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v39 = v26;
      v40 = 2114;
      v41 = v28;
      v42 = 2048;
      v43 = self;
      v44 = 2114;
      v45 = CFSTR("BKSSceneHostSettings.m");
      v46 = 1024;
      v47 = 58;
      v48 = 2114;
      v49 = v25;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0F2724);
  }

  if ((unint64_t)(a4 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("behavior == BKSSceneHostTouchBehaviorInactive || behavior == BKSSceneHostTouchBehaviorForeground"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v39 = v30;
      v40 = 2114;
      v41 = v32;
      v42 = 2048;
      v43 = self;
      v44 = 2114;
      v45 = CFSTR("BKSSceneHostSettings.m");
      v46 = 1024;
      v47 = 59;
      v48 = 2114;
      v49 = v29;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0F2818);
  }
  v37.receiver = self;
  v37.super_class = (Class)BKSSceneHostSettings;
  v10 = -[BKSSceneHostSettings init](&v37, sel_init);
  if (v10)
  {
    v11 = objc_opt_class();
    if (v11 != objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSSceneHostSettings cannot be subclassed"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v39 = v34;
        v40 = 2114;
        v41 = v36;
        v42 = 2048;
        v43 = v10;
        v44 = 2114;
        v45 = CFSTR("BKSSceneHostSettings.m");
        v46 = 1024;
        v47 = 63;
        v48 = 2114;
        v49 = v33;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A0F2900);
    }
    v12 = objc_msgSend(v7, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v12;

    v10->_touchBehavior = a4;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("ident"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_touchBehavior, CFSTR("touchBehavior"));

}

- (int64_t)touchBehavior
{
  return self->_touchBehavior;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isEqual:(id)a3
{
  BKSSceneHostSettings *v4;
  uint64_t v5;
  BKSSceneHostSettings *v6;
  BKSSceneHostSettings *v7;
  BOOL v8;
  BKSSceneHostSettings *v9;

  v4 = (BKSSceneHostSettings *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v9 = v7;

    v8 = v9 && BSEqualObjects() && self->_touchBehavior == v9->_touchBehavior;
  }

  return v8;
}

- (BKSSceneHostSettings)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSSceneHostSettings *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSSceneHostSettings *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not permitted"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("BKSSceneHostSettings.m");
    v17 = 1024;
    v18 = 53;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSSceneHostSettings *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  BKSSceneHostSettings *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__BKSSceneHostSettings_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E1EA1BF8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

void __53__BKSSceneHostSettings_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("identifier"));
  v2 = *(void **)(a1 + 32);
  NSStringFromBKSSceneHostTouchBehavior(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("touchBehavior"));

}

+ (BKSSceneHostSettings)new
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSSceneHostSettings *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("+new is not permitted"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = a1;
    v15 = 2114;
    v16 = CFSTR("BKSSceneHostSettings.m");
    v17 = 1024;
    v18 = 48;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSSceneHostSettings *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

@end
