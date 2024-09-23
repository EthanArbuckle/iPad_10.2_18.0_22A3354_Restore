@implementation BKSHIDEventDiscreteDispatchingRule

- (BKSHIDEventDispatchingTarget)target
{
  return self->_target;
}

- (BKSHIDEventDiscreteDispatchingPredicate)predicate
{
  return self->_predicate;
}

- (BKSHIDEventDiscreteDispatchingRule)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDEventDiscreteDispatchingRule *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSHIDEventDiscreteDispatchingRule *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on BKSHIDEventDiscreteDispatchingRule"));
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
    v16 = CFSTR("BKSHIDEventDiscreteDispatchingRule.m");
    v17 = 1024;
    v18 = 31;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDEventDiscreteDispatchingRule *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithPredicate:(id)a3 target:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  BKSHIDEventDiscreteDispatchingRule *v10;
  uint64_t v11;
  BKSHIDEventDiscreteDispatchingPredicate *predicate;
  uint64_t v13;
  BKSHIDEventDispatchingTarget *target;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  BKSHIDEventDiscreteDispatchingRule *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_opt_class();
  if (v9 != objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSHIDEventDiscreteDispatchingRule cannot be subclassed"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v32 = v22;
      v33 = 2114;
      v34 = v24;
      v35 = 2048;
      v36 = self;
      v37 = 2114;
      v38 = CFSTR("BKSHIDEventDiscreteDispatchingRule.m");
      v39 = 1024;
      v40 = 36;
      v41 = 2114;
      v42 = v21;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A10A46CLL);
  }
  v29.receiver = self;
  v29.super_class = (Class)BKSHIDEventDiscreteDispatchingRule;
  v10 = -[BKSHIDEventDiscreteDispatchingRule init](&v29, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    predicate = v10->_predicate;
    v10->_predicate = (BKSHIDEventDiscreteDispatchingPredicate *)v11;

    v13 = objc_msgSend(v8, "copy");
    target = v10->_target;
    v10->_target = (BKSHIDEventDispatchingTarget *)v13;

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v7, "descriptors", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v15);
          v10->_predicateEventTypeMask |= 1 << objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v19++), "hidEventType");
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v17);
    }

  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  BKSHIDEventDiscreteDispatchingPredicate *predicate;
  id v5;

  predicate = self->_predicate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", predicate, CFSTR("predicate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_target, CFSTR("target"));

}

- (BKSHIDEventDiscreteDispatchingRule)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  BKSHIDEventDiscreteDispatchingRule *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predicate"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v8 = (void *)v12;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("target"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      self = (BKSHIDEventDiscreteDispatchingRule *)-[BKSHIDEventDiscreteDispatchingRule _initWithPredicate:target:](self, "_initWithPredicate:target:", v8, v13);

      v11 = self;
      goto LABEL_6;
    }
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB28A8];
    v22 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventDiscreteDispatchingRule: invalid predicate : %@"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 4866, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v19);

    v8 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0CB28A8];
    v20 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventDiscreteDispatchingRule: subclasses are not allowed : %@"), objc_opt_class(), v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 4866, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v10);

  }
  v11 = 0;
LABEL_6:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[BKSHIDEventDiscreteDispatchingPredicate hash](self->_predicate, "hash");
  return -[BKSHIDEventDispatchingTarget hash](self->_target, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  BKSHIDEventDiscreteDispatchingRule *v4;
  uint64_t v5;
  char v6;

  v4 = (BKSHIDEventDiscreteDispatchingRule *)a3;
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

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  id v6;

  v6 = a3;
  v4 = (id)objc_msgSend(v6, "appendObject:withName:", self->_predicate, 0);
  objc_msgSend(v6, "appendRightArrow");
  v5 = (id)objc_msgSend(v6, "appendObject:withName:skipIfNil:", self->_target, 0, 0);

}

- (unint64_t)predicateEventTypeMask
{
  return self->_predicateEventTypeMask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

+ (id)ruleForDispatchingDiscreteEventsMatchingPredicate:(id)a3 toTarget:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v14;
  objc_class *v15;
  void *v16;
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
  void *v30;
  objc_class *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v7;
  if (!v9)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("predicate"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v40 = v18;
      v41 = 2114;
      v42 = v20;
      v43 = 2048;
      v44 = a1;
      v45 = 2114;
      v46 = CFSTR("BKSHIDEventDiscreteDispatchingRule.m");
      v47 = 1024;
      v48 = 51;
      v49 = 2114;
      v50 = v17;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A10AAA0);
  }
  v10 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1E0CB3940];
    v22 = (objc_class *)objc_msgSend(v10, "classForCoder");
    if (!v22)
      v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("predicate"), v23, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v40 = v27;
      v41 = 2114;
      v42 = v29;
      v43 = 2048;
      v44 = a1;
      v45 = 2114;
      v46 = CFSTR("BKSHIDEventDiscreteDispatchingRule.m");
      v47 = 1024;
      v48 = 51;
      v49 = 2114;
      v50 = v26;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A10ABDCLL);
  }

  v11 = v8;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v30 = (void *)MEMORY[0x1E0CB3940];
      v31 = (objc_class *)objc_msgSend(v11, "classForCoder");
      if (!v31)
        v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("target"), v32, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v40 = v36;
        v41 = 2114;
        v42 = v38;
        v43 = 2048;
        v44 = a1;
        v45 = 2114;
        v46 = CFSTR("BKSHIDEventDiscreteDispatchingRule.m");
        v47 = 1024;
        v48 = 52;
        v49 = 2114;
        v50 = v35;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A10AD18);
    }
  }

  v12 = -[BKSHIDEventDiscreteDispatchingRule _initWithPredicate:target:]([BKSHIDEventDiscreteDispatchingRule alloc], "_initWithPredicate:target:", v10, v11);
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
