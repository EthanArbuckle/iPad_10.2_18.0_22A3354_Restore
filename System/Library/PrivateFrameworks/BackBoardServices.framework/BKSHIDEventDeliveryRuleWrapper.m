@implementation BKSHIDEventDeliveryRuleWrapper

- (id)decodePayload:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id result;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  BKSHIDEventDeliveryRuleWrapper *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("You must have a subclass"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544642;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    v15 = 2048;
    v16 = self;
    v17 = 2114;
    v18 = CFSTR("BKSHIDEventDeliveryRuleChangeTransaction.m");
    v19 = 1024;
    v20 = 39;
    v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BKSHIDEventDeliveryRuleWrapper)initWithReason:(id)a3 seed:(unsigned int)a4 payload:(id)a5
{
  id v9;
  id v10;
  BKSHIDEventDeliveryRuleWrapper *v11;
  id v12;
  void *v13;
  objc_class *v14;
  uint64_t v15;
  NSString *reason;
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
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  BKSHIDEventDeliveryRuleWrapper *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)BKSHIDEventDeliveryRuleWrapper;
  v11 = -[BKSHIDEventDeliveryRuleWrapper init](&v32, sel_init);
  if (v11)
  {
    v12 = v9;
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_opt_class();
    v14 = (objc_class *)objc_opt_class();
    if (!v12)
    {
      NSStringFromClass(v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("reason"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v34 = v20;
        v35 = 2114;
        v36 = v22;
        v37 = 2048;
        v38 = v11;
        v39 = 2114;
        v40 = CFSTR("BKSHIDEventDeliveryRuleChangeTransaction.m");
        v41 = 1024;
        v42 = 46;
        v43 = 2114;
        v44 = v19;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A111844);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v23 = (void *)MEMORY[0x1E0CB3940];
      v24 = (objc_class *)objc_msgSend(v12, "classForCoder");
      if (!v24)
        v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("reason"), v25, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v34 = v29;
        v35 = 2114;
        v36 = v31;
        v37 = 2048;
        v38 = v11;
        v39 = 2114;
        v40 = CFSTR("BKSHIDEventDeliveryRuleChangeTransaction.m");
        v41 = 1024;
        v42 = 46;
        v43 = 2114;
        v44 = v28;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A111980);
    }

    v15 = objc_msgSend(v12, "copy");
    reason = v11->_reason;
    v11->_reason = (NSString *)v15;

    objc_storeStrong(&v11->_payload, a5);
    v11->_seed = a4;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  BKSHIDEventDeliveryRuleWrapper *v4;
  uint64_t v5;
  BKSHIDEventDeliveryRuleWrapper *v6;
  BKSHIDEventDeliveryRuleWrapper *v7;
  char v8;
  BKSHIDEventDeliveryRuleWrapper *v9;

  v4 = (BKSHIDEventDeliveryRuleWrapper *)a3;
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

    if (v9 && self->_seed == v9->_seed && -[NSString isEqual:](self->_reason, "isEqual:", v9->_reason))
      v8 = objc_msgSend(self->_payload, "isEqual:", v9->_payload);
    else
      v8 = 0;

  }
  return v8;
}

- (unint64_t)hash
{
  return BSHashPurify32();
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  BKSHIDEventDeliveryRuleWrapper *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__BKSHIDEventDeliveryRuleWrapper_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E1EA1BF8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

- (BKSHIDEventDeliveryRuleWrapper)initWithCoder:(id)a3
{
  id v4;
  BKSHIDEventDeliveryRuleWrapper *v5;
  BKSHIDEventDeliveryRuleWrapper *v6;
  uint64_t v7;
  id payload;
  uint64_t v9;
  NSString *reason;
  BKSHIDEventDeliveryRuleWrapper *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  void *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[BKSHIDEventDeliveryRuleWrapper init](self, "init");
  v6 = v5;
  if (!v5)
    goto LABEL_5;
  -[BKSHIDEventDeliveryRuleWrapper decodePayload:](v5, "decodePayload:", v4);
  v7 = objc_claimAutoreleasedReturnValue();
  payload = v6->_payload;
  v6->_payload = (id)v7;

  if (!v6->_payload)
  {
    BKLogEventDelivery();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4864, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v15);

      v11 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v4, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v13;
    v14 = "payload is nil: %{public}@";
LABEL_12:
    _os_log_error_impl(&dword_18A0F0000, v12, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v17, 0xCu);

    goto LABEL_9;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reason"));
  v9 = objc_claimAutoreleasedReturnValue();
  reason = v6->_reason;
  v6->_reason = (NSString *)v9;

  if (!v6->_reason)
  {
    BKLogEventDelivery();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    objc_msgSend(v4, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v13;
    v14 = "reason is nil: %{public}@";
    goto LABEL_12;
  }
  v6->_seed = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("seed"));
LABEL_5:
  v11 = v6;
LABEL_10:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *reason;
  id v5;

  reason = self->_reason;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", reason, CFSTR("reason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_payload, CFSTR("payload"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_seed, CFSTR("seed"));

}

- (NSString)reason
{
  return self->_reason;
}

- (id)payload
{
  return self->_payload;
}

- (unsigned)seed
{
  return self->_seed;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_payload, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

id __63__BKSHIDEventDeliveryRuleWrapper_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("reason"));
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", *(unsigned int *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("seed"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
