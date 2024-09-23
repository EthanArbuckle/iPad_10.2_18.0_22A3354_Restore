@implementation BKSHIDEventKeyCommandDispatchingRoot

- (id)decodePayload:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BKSHIDEventKeyCommandDispatchingRoot)initWithReason:(id)a3 seed:(unsigned int)a4 rule:(id)a5
{
  uint64_t v6;
  id v9;
  id v10;
  void *v11;
  BKSHIDEventKeyCommandDispatchingRoot *v12;
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
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  BKSHIDEventKeyCommandDispatchingRoot *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v6 = *(_QWORD *)&a4;
  v43 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v10)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_opt_class();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("rule"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v32 = v18;
      v33 = 2114;
      v34 = v20;
      v35 = 2048;
      v36 = self;
      v37 = 2114;
      v38 = CFSTR("BKSHIDEventDeliveryRuleChangeTransaction.m");
      v39 = 1024;
      v40 = 191;
      v41 = 2114;
      v42 = v17;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A112A0CLL);
  }
  v11 = v10;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1E0CB3940];
    v22 = (objc_class *)objc_msgSend(v11, "classForCoder");
    if (!v22)
      v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("rule"), v23, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v32 = v27;
      v33 = 2114;
      v34 = v29;
      v35 = 2048;
      v36 = self;
      v37 = 2114;
      v38 = CFSTR("BKSHIDEventDeliveryRuleChangeTransaction.m");
      v39 = 1024;
      v40 = 191;
      v41 = 2114;
      v42 = v26;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A112B4CLL);
  }

  v30.receiver = self;
  v30.super_class = (Class)BKSHIDEventKeyCommandDispatchingRoot;
  v12 = -[BKSHIDEventDeliveryRuleWrapper initWithReason:seed:payload:](&v30, sel_initWithReason_seed_payload_, v9, v6, v11);

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
