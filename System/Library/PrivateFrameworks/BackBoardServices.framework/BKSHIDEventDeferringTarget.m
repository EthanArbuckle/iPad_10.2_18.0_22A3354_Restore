@implementation BKSHIDEventDeferringTarget

- (unint64_t)hash
{
  uint64_t pid;

  pid = self->_pid;
  return pid ^ 0x1ABE5 ^ -[BKSHIDEventDeferringToken hash](self->_token, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

id __59__BKSHIDEventDeferringTarget_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:skipIfNil:", v3, CFSTR("token"), 1);

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", (int)objc_msgSend(*(id *)(a1 + 40), "pid"), CFSTR("pid"));
}

- (int)pid
{
  return self->_pid;
}

- (BKSHIDEventDeferringToken)token
{
  return self->_token;
}

- (BOOL)isEqual:(id)a3
{
  BKSHIDEventDeferringTarget *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v4 = (BKSHIDEventDeferringTarget *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if ((v5 == objc_opt_class() || (v6 = objc_opt_class(), v6 == objc_opt_class())) && self->_pid == v4->_pid)
      v7 = BSEqualObjects();
    else
      v7 = 0;
  }

  return v7;
}

- (id)_initWithPID:(int)a3 token:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  BKSHIDEventDeferringTarget *v11;
  BKSHIDEventDeferringTarget *v12;
  uint64_t v13;
  BKSHIDEventDeferringToken *token;
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
  objc_super v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  BKSHIDEventDeferringTarget *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid pid"));
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
      v41 = CFSTR("BKSHIDEventDeferringTarget.m");
      v42 = 1024;
      v43 = 31;
      v44 = 2114;
      v45 = v16;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0F40D4);
  }
  v8 = v7;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      v21 = (objc_class *)objc_msgSend(v8, "classForCoder");
      if (!v21)
        v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("token"), v22, v24);
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
        v41 = CFSTR("BKSHIDEventDeferringTarget.m");
        v42 = 1024;
        v43 = 32;
        v44 = 2114;
        v45 = v25;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A0F4210);
    }
  }

  v9 = objc_opt_class();
  if (v9 != objc_opt_class())
  {
    v10 = objc_opt_class();
    if (v10 != objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSHIDEventDeferringTarget cannot be subclassed"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v35 = v30;
        v36 = 2114;
        v37 = v32;
        v38 = 2048;
        v39 = self;
        v40 = 2114;
        v41 = CFSTR("BKSHIDEventDeferringTarget.m");
        v42 = 1024;
        v43 = 33;
        v44 = 2114;
        v45 = v29;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A0F42FCLL);
    }
  }
  v33.receiver = self;
  v33.super_class = (Class)BKSHIDEventDeferringTarget;
  v11 = -[BKSHIDEventDeferringTarget init](&v33, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_pid = a3;
    v13 = objc_msgSend(v8, "copy");
    token = v12->_token;
    v12->_token = (BKSHIDEventDeferringToken *)v13;

  }
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t pid;
  id v5;

  pid = self->_pid;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", pid, CFSTR("pid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_token, CFSTR("token"));

}

- (BKSHIDEventDeferringTarget)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BKSHIDEventDeferringTarget *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
    v6 = objc_opt_class();
    if (v6 != objc_opt_class())
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = *MEMORY[0x1E0CB28A8];
      v21 = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventDeferringTarget: subclasses are not allowed : %@"), objc_opt_class(), v21);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 4866, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v11);

LABEL_7:
      v14 = 0;
      goto LABEL_8;
    }
  }
  v12 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("pid"));
  if ((int)v12 < 1)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB28A8];
    v23 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventDeferringTarget: invalid pid : %i"), v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 4866, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v19);

    goto LABEL_7;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("token"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  self = (BKSHIDEventDeferringTarget *)-[BKSHIDEventDeferringTarget _initWithPID:token:](self, "_initWithPID:token:", v12, v13);

  v14 = self;
LABEL_8:

  return v14;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  BKSHIDEventDeferringTarget *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__BKSHIDEventDeferringTarget_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E1EA1BF8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (BKSHIDEventDeferringTarget)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDEventDeferringTarget *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSHIDEventDeferringTarget *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on BKSHIDEventDeferringTarget"));
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
    v16 = CFSTR("BKSHIDEventDeferringTarget.m");
    v17 = 1024;
    v18 = 26;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDEventDeferringTarget *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[BKSHIDEventDeferringTarget _initWithPID:token:](+[BKSMutableHIDEventDeferringTarget allocWithZone:](BKSMutableHIDEventDeferringTarget, "allocWithZone:", a3), "_initWithPID:token:", self->_pid, self->_token);
}

- (id)initForProtobufDecoding
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKSHIDEventDeferringTarget;
  return -[BKSHIDEventDeferringTarget init](&v3, sel_init);
}

+ (id)protobufSchema
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__BKSHIDEventDeferringTarget_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_1154 != -1)
    dispatch_once(&protobufSchema_onceToken_1154, block);
  return (id)protobufSchema_schema_1155;
}

void __44__BKSHIDEventDeferringTarget_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", *(_QWORD *)(a1 + 32), &__block_literal_global_1157);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)protobufSchema_schema_1155;
  protobufSchema_schema_1155 = v1;

}

void __44__BKSHIDEventDeferringTarget_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "addField:", "_pid");
  objc_msgSend(v2, "addField:", "_token");

}

@end
