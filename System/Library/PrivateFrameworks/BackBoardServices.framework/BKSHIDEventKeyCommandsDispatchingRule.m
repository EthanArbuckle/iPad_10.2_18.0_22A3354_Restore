@implementation BKSHIDEventKeyCommandsDispatchingRule

- (BOOL)isEqual:(id)a3
{
  BKSHIDEventKeyCommandsDispatchingRule *v4;
  uint64_t v5;
  char v6;

  v4 = (BKSHIDEventKeyCommandsDispatchingRule *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class() && BSEqualObjects())
      v6 = BSEqualObjects();
    else
      v6 = 0;
  }

  return v6;
}

- (BKSHIDEventKeyCommandsDispatchingRule)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDEventKeyCommandsDispatchingRule *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSHIDEventKeyCommandsDispatchingRule *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on BKSHIDEventKeyCommandsDispatchingRule"));
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
    v16 = CFSTR("BKSHIDEventKeyCommandsDispatchingRule.m");
    v17 = 1024;
    v18 = 27;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDEventKeyCommandsDispatchingRule *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithPredicate:(id)a3 targets:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  BKSHIDEventKeyCommandsDispatchingRule *v10;
  uint64_t v11;
  BKSHIDEventKeyCommandsDispatchingPredicate *predicate;
  uint64_t v13;
  NSArray *targets;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  BKSHIDEventKeyCommandsDispatchingRule *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_opt_class();
  if (v9 != objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSHIDEventKeyCommandsDispatchingRule cannot be subclassed"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v22 = v17;
      v23 = 2114;
      v24 = v19;
      v25 = 2048;
      v26 = self;
      v27 = 2114;
      v28 = CFSTR("BKSHIDEventKeyCommandsDispatchingRule.m");
      v29 = 1024;
      v30 = 32;
      v31 = 2114;
      v32 = v16;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A11CD58);
  }
  v20.receiver = self;
  v20.super_class = (Class)BKSHIDEventKeyCommandsDispatchingRule;
  v10 = -[BKSHIDEventKeyCommandsDispatchingRule init](&v20, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    predicate = v10->_predicate;
    v10->_predicate = (BKSHIDEventKeyCommandsDispatchingPredicate *)v11;

    v13 = objc_msgSend(v8, "copy");
    targets = v10->_targets;
    v10->_targets = (NSArray *)v13;

  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  BKSHIDEventKeyCommandsDispatchingPredicate *predicate;
  id v5;

  predicate = self->_predicate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", predicate, CFSTR("predicate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_targets, CFSTR("targets"));

}

- (BKSHIDEventKeyCommandsDispatchingRule)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void **v18;
  uint64_t *v19;
  void *v20;
  void *v21;
  BKSHIDEventKeyCommandsDispatchingRule *v22;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predicate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("targets"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (!objc_msgSend(v9, "bs_containsObjectPassingTest:", &__block_literal_global_21))
      {
        self = (BKSHIDEventKeyCommandsDispatchingRule *)-[BKSHIDEventKeyCommandsDispatchingRule _initWithPredicate:targets:](self, "_initWithPredicate:targets:", v8, v9);
        v22 = self;
        goto LABEL_10;
      }
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0CB28A8];
      v28 = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventKeyCommandsDispatchingRule: targets contains non-BKSHIDEventDispatchingTarget elements : %@"), v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v16;
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = (void **)v29;
      v19 = &v28;
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0CB28A8];
      v26 = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventKeyCommandsDispatchingRule: invalid predicate or set of targets : predicate=%@ targets=%@"), v8, v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v16;
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = &v27;
      v19 = &v26;
    }
    objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 4866, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v21);

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0CB28A8];
    v24 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventKeyCommandsDispatchingRule: subclasses are not allowed : %@"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 4866, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v10);

  }
  v22 = 0;
LABEL_10:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[BKSHIDEventKeyCommandsDispatchingPredicate hash](self->_predicate, "hash");
  return -[NSArray hash](self->_targets, "hash") ^ v3;
}

- (NSString)debugDescription
{
  return (NSString *)-[BKSHIDEventKeyCommandsDispatchingRule descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BKSHIDEventKeyCommandsDispatchingRule succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_targets, CFSTR("targets"), 0);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BKSHIDEventKeyCommandsDispatchingRule descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  BKSHIDEventKeyCommandsDispatchingRule *v11;

  -[BKSHIDEventKeyCommandsDispatchingRule succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__BKSHIDEventKeyCommandsDispatchingRule_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E1EA1BF8;
  v5 = v4;
  v10 = v5;
  v11 = self;
  v6 = (id)objc_msgSend(v5, "modifyBody:", v9);
  v7 = v5;

  return v7;
}

- (BKSHIDEventKeyCommandsDispatchingPredicate)predicate
{
  return self->_predicate;
}

- (NSArray)targets
{
  return self->_targets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targets, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

id __79__BKSHIDEventKeyCommandsDispatchingRule_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("predicate"));
}

BOOL __55__BKSHIDEventKeyCommandsDispatchingRule_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

+ (id)ruleForDispatchingKeyCommandsMatchingPredicate:(id)a3 toTargets:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  objc_class *v39;
  void *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  void *v44;
  objc_class *v45;
  void *v46;
  void *v47;
  void *v48;
  objc_class *v49;
  void *v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  const __CFString *v58;
  __int16 v59;
  int v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v7;
  if (!v9)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("predicate"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v52 = v19;
      v53 = 2114;
      v54 = v21;
      v55 = 2048;
      v56 = a1;
      v57 = 2114;
      v58 = CFSTR("BKSHIDEventKeyCommandsDispatchingRule.m");
      v59 = 1024;
      v60 = 43;
      v61 = 2114;
      v62 = v18;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A11D540);
  }
  v10 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    v23 = (objc_class *)objc_msgSend(v10, "classForCoder");
    if (!v23)
      v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("predicate"), v24, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v52 = v28;
      v53 = 2114;
      v54 = v30;
      v55 = 2048;
      v56 = a1;
      v57 = 2114;
      v58 = CFSTR("BKSHIDEventKeyCommandsDispatchingRule.m");
      v59 = 1024;
      v60 = 43;
      v61 = 2114;
      v62 = v27;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A11D67CLL);
  }

  v11 = v8;
  if (!v11)
  {
    v31 = (void *)MEMORY[0x1E0CB3940];
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("targets"), v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v52 = v35;
      v53 = 2114;
      v54 = v37;
      v55 = 2048;
      v56 = a1;
      v57 = 2114;
      v58 = CFSTR("BKSHIDEventKeyCommandsDispatchingRule.m");
      v59 = 1024;
      v60 = 44;
      v61 = 2114;
      v62 = v34;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A11D794);
  }
  v12 = v11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v38 = (void *)MEMORY[0x1E0CB3940];
    v39 = (objc_class *)objc_msgSend(v12, "classForCoder");
    if (!v39)
      v39 = (objc_class *)objc_opt_class();
    NSStringFromClass(v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (objc_class *)objc_opt_class();
    NSStringFromClass(v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("targets"), v40, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (objc_class *)objc_opt_class();
      NSStringFromClass(v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v52 = v44;
      v53 = 2114;
      v54 = v46;
      v55 = 2048;
      v56 = a1;
      v57 = 2114;
      v58 = CFSTR("BKSHIDEventKeyCommandsDispatchingRule.m");
      v59 = 1024;
      v60 = 44;
      v61 = 2114;
      v62 = v43;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v43), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A11D8D0);
  }

  if (objc_msgSend(v12, "bs_containsObjectPassingTest:", &__block_literal_global_3189))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("targets contains non-BKSHIDEventDispatchingTarget elements : %@"), v12);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (objc_class *)objc_opt_class();
      NSStringFromClass(v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v52 = v48;
      v53 = 2114;
      v54 = v50;
      v55 = 2048;
      v56 = a1;
      v57 = 2114;
      v58 = CFSTR("BKSHIDEventKeyCommandsDispatchingRule.m");
      v59 = 1024;
      v60 = 47;
      v61 = 2114;
      v62 = v47;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v47), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A11D9C0);
  }
  v13 = -[BKSHIDEventKeyCommandsDispatchingRule _initWithPredicate:targets:]([BKSHIDEventKeyCommandsDispatchingRule alloc], "_initWithPredicate:targets:", v10, v12);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

BOOL __98__BKSHIDEventKeyCommandsDispatchingRule_ruleForDispatchingKeyCommandsMatchingPredicate_toTargets___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

@end
