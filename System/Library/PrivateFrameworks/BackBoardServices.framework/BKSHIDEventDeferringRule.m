@implementation BKSHIDEventDeferringRule

- (BKSHIDEventDeferringTarget)target
{
  return self->_target;
}

- (BKSHIDEventDeferringPredicate)predicate
{
  return self->_predicate;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (BOOL)isEqual:(id)a3
{
  BKSHIDEventDeferringRule *v4;
  uint64_t v5;
  char v6;

  v4 = (BKSHIDEventDeferringRule *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects())
    {
      v6 = BSEqualObjects();
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  BKSHIDEventDeferringPredicate *predicate;
  id v5;

  predicate = self->_predicate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", predicate, CFSTR("predicate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_target, CFSTR("target"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reason, CFSTR("reason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identity, CFSTR("ident"));

}

- (BKSHIDEventDeferringRule)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  BKSHIDEventDeferringRule *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
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
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("target"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reason"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ident"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v8 && v9 && v10 && v12)
    {
      self = (BKSHIDEventDeferringRule *)-[BKSHIDEventDeferringRule _initWithPredicate:target:reason:identity:](self, "_initWithPredicate:target:reason:identity:", v8, v9, v10, v12);
      v11 = self;
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0CB28A8];
      v22 = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventDeferringRule: invalid predicate, target or reason : predicate=%@ target=%@ reason=%@"), v8, v9, v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 4866, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v18);

      v11 = 0;
    }

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0CB28A8];
    v20 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventDeferringRule: subclasses are not allowed : %@"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 4866, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v10);
    v11 = 0;
  }

  return v11;
}

- (BKSHIDEventDeferringRule)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDEventDeferringRule *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSHIDEventDeferringRule *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on BKSHIDEventDeferringRule"));
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
    v16 = CFSTR("BKSHIDEventDeferringRule.m");
    v17 = 1024;
    v18 = 110;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDEventDeferringRule *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithPredicate:(id)a3 target:(id)a4 reason:(id)a5 identity:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  objc_class *v21;
  uint64_t v22;
  BKSHIDEventDeferringRule *v23;
  uint64_t v24;
  BKSHIDEventDeferringPredicate *predicate;
  uint64_t v26;
  BKSHIDEventDeferringTarget *target;
  uint64_t v28;
  NSString *reason;
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
  objc_class *v48;
  void *v49;
  void *v50;
  void *v51;
  objc_class *v52;
  void *v53;
  void *v54;
  objc_class *v55;
  void *v56;
  objc_class *v57;
  void *v58;
  void *v59;
  void *v60;
  objc_class *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  objc_class *v66;
  void *v67;
  void *v68;
  objc_class *v69;
  void *v70;
  objc_class *v71;
  void *v72;
  void *v73;
  void *v74;
  objc_class *v75;
  void *v76;
  void *v77;
  void *v78;
  objc_class *v79;
  void *v80;
  objc_super v81;
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  BKSHIDEventDeferringRule *v87;
  __int16 v88;
  const __CFString *v89;
  __int16 v90;
  int v91;
  __int16 v92;
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v11;
  if (!v15)
  {
    v31 = (void *)MEMORY[0x1E0CB3940];
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("predicate"), v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v83 = v35;
      v84 = 2114;
      v85 = v37;
      v86 = 2048;
      v87 = self;
      v88 = 2114;
      v89 = CFSTR("BKSHIDEventDeferringRule.m");
      v90 = 1024;
      v91 = 115;
      v92 = 2114;
      v93 = v34;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A129178);
  }
  v16 = v15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v38 = (void *)MEMORY[0x1E0CB3940];
    v39 = (objc_class *)objc_msgSend(v16, "classForCoder");
    if (!v39)
      v39 = (objc_class *)objc_opt_class();
    NSStringFromClass(v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (objc_class *)objc_opt_class();
    NSStringFromClass(v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("predicate"), v40, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (objc_class *)objc_opt_class();
      NSStringFromClass(v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v83 = v44;
      v84 = 2114;
      v85 = v46;
      v86 = 2048;
      v87 = self;
      v88 = 2114;
      v89 = CFSTR("BKSHIDEventDeferringRule.m");
      v90 = 1024;
      v91 = 115;
      v92 = 2114;
      v93 = v43;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v43), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A1292B4);
  }

  v17 = v12;
  if (!v17)
  {
    v47 = (void *)MEMORY[0x1E0CB3940];
    v48 = (objc_class *)objc_opt_class();
    NSStringFromClass(v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("target"), v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (objc_class *)objc_opt_class();
      NSStringFromClass(v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v83 = v51;
      v84 = 2114;
      v85 = v53;
      v86 = 2048;
      v87 = self;
      v88 = 2114;
      v89 = CFSTR("BKSHIDEventDeferringRule.m");
      v90 = 1024;
      v91 = 116;
      v92 = 2114;
      v93 = v50;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v50), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A1293CCLL);
  }
  v18 = v17;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v54 = (void *)MEMORY[0x1E0CB3940];
    v55 = (objc_class *)objc_msgSend(v18, "classForCoder");
    if (!v55)
      v55 = (objc_class *)objc_opt_class();
    NSStringFromClass(v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (objc_class *)objc_opt_class();
    NSStringFromClass(v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("target"), v56, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = (objc_class *)objc_opt_class();
      NSStringFromClass(v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v83 = v60;
      v84 = 2114;
      v85 = v62;
      v86 = 2048;
      v87 = self;
      v88 = 2114;
      v89 = CFSTR("BKSHIDEventDeferringRule.m");
      v90 = 1024;
      v91 = 116;
      v92 = 2114;
      v93 = v59;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v59), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A129508);
  }

  v19 = v13;
  v20 = (void *)MEMORY[0x1E0CB3940];
  v21 = (objc_class *)objc_opt_class();
  if (!v19)
  {
    NSStringFromClass(v21);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("reason"), v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = (objc_class *)objc_opt_class();
      NSStringFromClass(v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v83 = v65;
      v84 = 2114;
      v85 = v67;
      v86 = 2048;
      v87 = self;
      v88 = 2114;
      v89 = CFSTR("BKSHIDEventDeferringRule.m");
      v90 = 1024;
      v91 = 117;
      v92 = 2114;
      v93 = v64;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v64), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A129610);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v68 = (void *)MEMORY[0x1E0CB3940];
    v69 = (objc_class *)objc_msgSend(v19, "classForCoder");
    if (!v69)
      v69 = (objc_class *)objc_opt_class();
    NSStringFromClass(v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = (objc_class *)objc_opt_class();
    NSStringFromClass(v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("reason"), v70, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = (objc_class *)objc_opt_class();
      NSStringFromClass(v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v83 = v74;
      v84 = 2114;
      v85 = v76;
      v86 = 2048;
      v87 = self;
      v88 = 2114;
      v89 = CFSTR("BKSHIDEventDeferringRule.m");
      v90 = 1024;
      v91 = 117;
      v92 = 2114;
      v93 = v73;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v73), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A129748);
  }

  v22 = objc_opt_class();
  if (v22 != objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSHIDEventDeferringRule cannot be subclassed"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = (objc_class *)objc_opt_class();
      NSStringFromClass(v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v83 = v78;
      v84 = 2114;
      v85 = v80;
      v86 = 2048;
      v87 = self;
      v88 = 2114;
      v89 = CFSTR("BKSHIDEventDeferringRule.m");
      v90 = 1024;
      v91 = 118;
      v92 = 2114;
      v93 = v77;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v77), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A129830);
  }
  v81.receiver = self;
  v81.super_class = (Class)BKSHIDEventDeferringRule;
  v23 = -[BKSHIDEventDeferringRule init](&v81, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v16, "copy");
    predicate = v23->_predicate;
    v23->_predicate = (BKSHIDEventDeferringPredicate *)v24;

    v26 = objc_msgSend(v18, "copy");
    target = v23->_target;
    v23->_target = (BKSHIDEventDeferringTarget *)v26;

    v28 = objc_msgSend(v19, "copy");
    reason = v23->_reason;
    v23->_reason = (NSString *)v28;

    objc_storeStrong((id *)&v23->_identity, a6);
  }

  return v23;
}

- (int64_t)weightedDeferringRuleCompare:(id)a3
{
  id v4;
  BKSHIDEventDeferringRule *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  unint64_t v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  unint64_t v16;
  BOOL v17;
  uint64_t v18;
  int64_t v19;
  void *v20;
  unsigned int v21;
  void *v22;
  unsigned int v23;

  v4 = a3;
  v5 = self;
  -[BKSHIDEventDeferringRule predicate](v5, "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  objc_opt_self();
  objc_msgSend(v8, "display");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 != 0;

  objc_msgSend(v8, "token");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (v11 != 0) | (unint64_t)(2 * v10);
  objc_msgSend(v7, "display");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 != 0;

  objc_msgSend(v7, "token");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (v15 != 0) | (unint64_t)(2 * v14);
  v17 = v12 > v16;
  if (v12 == v16)
    v18 = 0;
  else
    v18 = -1;
  if (v17)
    v19 = 1;
  else
    v19 = v18;
  if (!v19)
  {
    if (objc_msgSend(v8, "isEqual:", v7))
    {
      -[BKSHIDEventDeferringRule identity](v5, "identity");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "seed");

      objc_msgSend(v4, "identity");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "seed");

      if (v21 <= v23)
        v19 = v21 < v23;
      else
        v19 = -1;
    }
    else
    {
      v19 = 0;
    }
  }

  return v19;
}

- (int64_t)mostRecentFirstCompare:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;

  v4 = a3;
  -[BKSHIDEventDeferringRule identity](self, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "seed");

  objc_msgSend(v4, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "seed");
  if (v6 > v8)
    return -1;
  else
    return v6 != v8;
}

- (unint64_t)hash
{
  return -[_BKSHIDEventDeferringRuleIdentity hash](self->_identity, "hash");
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  _BKSHIDEventDeferringRuleIdentity *identity;
  id v5;
  id v6;
  id v7;
  id v8;

  identity = self->_identity;
  v8 = a3;
  v5 = (id)objc_msgSend(v8, "appendObject:withName:", identity, 0);
  v6 = (id)objc_msgSend(v8, "appendObject:withName:", self->_predicate, 0);
  objc_msgSend(v8, "appendRightArrow");
  v7 = (id)objc_msgSend(v8, "appendObject:withName:", self->_target, 0);
  objc_msgSend(v8, "appendString:withName:", self->_reason, CFSTR("reason"));

}

- (_BKSHIDEventDeferringRuleIdentity)identity
{
  return self->_identity;
}

+ (id)ruleForDeferringEventsMatchingPredicate:(id)a3 toTarget:(id)a4 withReason:(id)a5 seed:(unsigned int)a6 pid:(int)a7
{
  uint64_t v7;
  uint64_t v8;
  id v11;
  id v12;
  id v13;
  _BKSHIDEventDeferringRuleIdentity *v14;
  id v15;

  v7 = *(_QWORD *)&a7;
  v8 = *(_QWORD *)&a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[_BKSHIDEventDeferringRuleIdentity initWithSeed:pid:]([_BKSHIDEventDeferringRuleIdentity alloc], "initWithSeed:pid:", v8, v7);
  v15 = -[BKSHIDEventDeferringRule _initWithPredicate:target:reason:identity:]([BKSHIDEventDeferringRule alloc], "_initWithPredicate:target:reason:identity:", v13, v12, v11, v14);

  return v15;
}

@end
