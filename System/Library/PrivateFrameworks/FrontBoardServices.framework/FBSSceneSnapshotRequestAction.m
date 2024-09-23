@implementation FBSSceneSnapshotRequestAction

- (id)_initWithType:(unint64_t)a3 context:(id)a4 responder:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  FBSSceneSnapshotRequestAction *v14;
  id result;
  void *v16;
  objc_super v17;

  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = v10;
    v12 = objc_alloc_init((Class)off_1E38E9E40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forSetting:", v13, 1);

    objc_msgSend(v12, "setObject:forSetting:", v9, 2);
    objc_msgSend(v12, "setDescriptionProvider:", self);
    v17.receiver = self;
    v17.super_class = (Class)FBSSceneSnapshotRequestAction;
    v14 = -[FBSSceneSnapshotRequestAction initWithInfo:responder:](&v17, sel_initWithInfo_responder_, v12, v11);

    return v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("responder"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneSnapshotRequestAction _initWithType:context:responder:].cold.1(a2, (uint64_t)self, (uint64_t)v16);
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (unint64_t)type
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[FBSSceneSnapshotRequestAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (FBSSceneSnapshotContext)context
{
  void *v2;
  void *v3;

  -[FBSSceneSnapshotRequestAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBSSceneSnapshotContext *)v3;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("context");
  if (a3 != 2)
    v3 = 0;
  if (a3 == 1)
    return CFSTR("requestType");
  else
    return (id)v3;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;

  if (a5 != 1)
    return 0;
  v7 = objc_msgSend(a4, "unsignedIntegerValue", a3, v5, v6);
  v8 = CFSTR("invalidateSnapshot");
  if (v7 != 2)
    v8 = 0;
  if (v7 == 1)
    return CFSTR("performSnapshot");
  else
    return (id)v8;
}

- (void)_initWithType:(const char *)a1 context:(uint64_t)a2 responder:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("FBSSceneSnapshotRequestAction.m");
  v16 = 1024;
  v17 = 19;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
