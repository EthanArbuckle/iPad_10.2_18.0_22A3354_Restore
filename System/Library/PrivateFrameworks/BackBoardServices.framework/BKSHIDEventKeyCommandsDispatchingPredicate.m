@implementation BKSHIDEventKeyCommandsDispatchingPredicate

- (BKSHIDEventKeyCommandsDispatchingPredicate)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDEventKeyCommandsDispatchingPredicate *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSHIDEventKeyCommandsDispatchingPredicate *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on BKSHIDEventKeyCommandsDispatchingPredicate"));
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
    v16 = CFSTR("BKSHIDEventKeyCommandsDispatchingPredicate.m");
    v17 = 1024;
    v18 = 26;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDEventKeyCommandsDispatchingPredicate *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithSenderDescriptors:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  BKSHIDEventKeyCommandsDispatchingPredicate *v8;
  uint64_t v9;
  NSSet *senderDescriptors;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  BKSHIDEventKeyCommandsDispatchingPredicate *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_opt_class();
  if (v6 != objc_opt_class())
  {
    v7 = objc_opt_class();
    if (v7 != objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSHIDEventKeyCommandsDispatchingPredicate cannot be subclassed"));
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
        v24 = CFSTR("BKSHIDEventKeyCommandsDispatchingPredicate.m");
        v25 = 1024;
        v26 = 31;
        v27 = 2114;
        v28 = v12;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A1316ECLL);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)BKSHIDEventKeyCommandsDispatchingPredicate;
  v8 = -[BKSHIDEventKeyCommandsDispatchingPredicate init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v5, "copy");
    senderDescriptors = v8->_senderDescriptors;
    v8->_senderDescriptors = (NSSet *)v9;

  }
  return v8;
}

- (NSSet)displays
{
  return (NSSet *)-[NSSet bs_map:](self->_senderDescriptors, "bs_map:", &__block_literal_global_6688);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[BKSHIDEventKeyCommandsDispatchingPredicate _initWithSenderDescriptors:](+[BKSMutableHIDEventKeyCommandsDispatchingPredicate allocWithZone:](BKSMutableHIDEventKeyCommandsDispatchingPredicate, "allocWithZone:", a3), "_initWithSenderDescriptors:", self->_senderDescriptors);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_senderDescriptors, CFSTR("senders"));
}

- (BKSHIDEventKeyCommandsDispatchingPredicate)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void **v18;
  uint64_t *v19;
  BKSHIDEventKeyCommandsDispatchingPredicate *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
    v6 = objc_opt_class();
    if (v6 != objc_opt_class())
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = *MEMORY[0x1E0CB28A8];
      v24 = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventKeyCommandsDispatchingPredicate: subclasses are not allowed : %@"), objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 4866, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v11);

LABEL_11:
      v20 = 0;
      goto LABEL_12;
    }
  }
  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("senders"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB28A8];
      v26 = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventKeyCommandsDispatchingPredicate: displays not of class NSSet : %@"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v10;
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = &v27;
      v19 = &v26;
      goto LABEL_10;
    }
  }
  if (objc_msgSend(v9, "bs_containsObjectPassingTest:", &__block_literal_global_14))
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB28A8];
    v28 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventKeyCommandsDispatchingPredicate: senders contains non-BKSHIDEventSenderDescriptor elements : %@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v10;
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = (void **)v29;
    v19 = &v28;
LABEL_10:
    objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 4866, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v22);

    goto LABEL_11;
  }
  self = (BKSHIDEventKeyCommandsDispatchingPredicate *)-[BKSHIDEventKeyCommandsDispatchingPredicate _initWithSenderDescriptors:](self, "_initWithSenderDescriptors:", v9);
  v20 = self;
LABEL_12:

  return v20;
}

- (unint64_t)hash
{
  return -[NSSet hash](self->_senderDescriptors, "hash") ^ 0x1E833;
}

- (BOOL)isEqual:(id)a3
{
  BKSHIDEventKeyCommandsDispatchingPredicate *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v4 = (BKSHIDEventKeyCommandsDispatchingPredicate *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class() || (v6 = objc_opt_class(), v6 == objc_opt_class()))
      v7 = BSEqualObjects();
    else
      v7 = 0;
  }

  return v7;
}

- (NSString)debugDescription
{
  return (NSString *)-[BKSHIDEventKeyCommandsDispatchingPredicate descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BKSHIDEventKeyCommandsDispatchingPredicate succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BKSHIDEventKeyCommandsDispatchingPredicate descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[BKSHIDEventKeyCommandsDispatchingPredicate succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSet allObjects](self->_senderDescriptors, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v6, CFSTR("senders"), v4, 0);

  return v5;
}

- (NSSet)senderDescriptors
{
  return self->_senderDescriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderDescriptors, 0);
}

BOOL __60__BKSHIDEventKeyCommandsDispatchingPredicate_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

id __54__BKSHIDEventKeyCommandsDispatchingPredicate_displays__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a2, "associatedDisplay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    +[BKSHIDEventDisplay nullDisplay](BKSHIDEventDisplay, "nullDisplay");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
