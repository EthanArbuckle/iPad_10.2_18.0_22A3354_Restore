@implementation BKSHIDEventDescriptor

- (unint64_t)hash
{
  return self->_hidEventType;
}

+ (id)descriptorForHIDEvent:(__IOHIDEvent *)a3
{
  uint64_t Type;
  __objc2_class *v4;
  uint64_t IntegerValue;
  void *v6;

  Type = IOHIDEventGetType();
  if ((int)Type <= 28)
  {
    if ((_DWORD)Type == 1)
    {
      v4 = BKSHIDEventVendorDefinedDescriptor;
      IntegerValue = IOHIDEventGetIntegerValue();
      goto LABEL_10;
    }
    if ((_DWORD)Type == 3)
    {
      v4 = BKSHIDEventKeyboardDescriptor;
      IntegerValue = IOHIDEventGetIntegerValue();
LABEL_10:
      -[__objc2_class descriptorWithPage:usage:](v4, "descriptorWithPage:usage:", IntegerValue, IOHIDEventGetIntegerValue());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    goto LABEL_8;
  }
  if ((_DWORD)Type == 29)
  {
    +[BKSHIDEventBiometricDescriptor descriptorWithBiometricEventType:](BKSHIDEventBiometricDescriptor, "descriptorWithBiometricEventType:", IOHIDEventGetIntegerValue());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  if ((_DWORD)Type != 39)
  {
LABEL_8:
    +[BKSHIDEventDescriptor descriptorWithEventType:](BKSHIDEventDescriptor, "descriptorWithEventType:", Type);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  +[BKSHIDEventGenericGestureDescriptor descriptorWithGenericGestureType:](BKSHIDEventGenericGestureDescriptor, "descriptorWithGenericGestureType:", IOHIDEventGetIntegerValue());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (BKSHIDEventDescriptor)initWithEventType:(unsigned int)a3
{
  BKSHIDEventDescriptor *v4;
  __objc2_class *v5;
  BKSHIDEventDescriptor *v6;
  BKSHIDEventDescriptor *v7;
  BKSHIDEventDescriptor *v9;
  objc_super v10;

  v4 = self;
  if ((int)a3 > 28)
  {
    if (a3 == 29)
    {
      v5 = BKSHIDEventBiometricDescriptor;
      goto LABEL_10;
    }
    if (a3 == 39)
    {
      v5 = BKSHIDEventGenericGestureDescriptor;
      goto LABEL_10;
    }
  }
  else
  {
    if (a3 == 1)
    {
      v5 = BKSHIDEventVendorDefinedDescriptor;
      goto LABEL_10;
    }
    if (a3 == 3)
    {
      v5 = BKSHIDEventKeyboardDescriptor;
LABEL_10:
      v6 = (BKSHIDEventDescriptor *)objc_alloc_init(v5);
      goto LABEL_11;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)BKSHIDEventDescriptor;
  v9 = -[BKSHIDEventDescriptor init](&v10, sel_init);
  if (v9)
    v9->_hidEventType = a3;
  v6 = v9;
  v4 = v6;
LABEL_11:
  v7 = v6;

  return v7;
}

+ (id)descriptorWithEventType:(unsigned int)a3
{
  return -[BKSHIDEventDescriptor initWithEventType:]([BKSHIDEventDescriptor alloc], "initWithEventType:", *(_QWORD *)&a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char isKindOfClass;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
    v6 = objc_msgSend(v4, "hidEventType") == self->_hidEventType;

  return v6;
}

- (BOOL)describes:(id)a3
{
  unsigned int hidEventType;

  hidEventType = self->_hidEventType;
  return !hidEventType || hidEventType == objc_msgSend(a3, "hidEventType");
}

- (unsigned)hidEventType
{
  return self->_hidEventType;
}

- (id)descriptorByAddingSenderIDToMatchCriteria:(unint64_t)a3
{
  return -[BKSHIDEventSenderSpecificDescriptor initWithDescriptor:senderID:]([BKSHIDEventSenderSpecificDescriptor alloc], "initWithDescriptor:senderID:", self, a3);
}

- (BKSHIDEventDescriptor)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDEventDescriptor *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSHIDEventDescriptor *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is unavailable"));
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
    v16 = CFSTR("BKSHIDEventDescriptor.m");
    v17 = 1024;
    v18 = 69;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDEventDescriptor *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithEventType:(unsigned int)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKSHIDEventDescriptor;
  result = -[BKSHIDEventDescriptor init](&v5, sel_init);
  if (result)
    *((_DWORD *)result + 2) = a3;
  return result;
}

- (NSString)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  BKSHIDEventDescriptor *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __36__BKSHIDEventDescriptor_description__block_invoke;
  v10 = &unk_1E1EA1BF8;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", 0, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BKSHIDEventDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[BKSHIDEventDescriptor descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;

  -[BKSHIDEventDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKSHIDEventDescriptor appendDescriptionToFormatter:](self, "appendDescriptionToFormatter:", v4);
  return v4;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "appendString:withName:", IOHIDEventTypeGetName(), 0);

}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  uint64_t hidEventType;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  hidEventType = self->_hidEventType;
  v5 = a3;
  objc_msgSend(v3, "numberWithUnsignedInt:", hidEventType);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("_type"));

}

- (BKSHIDEventDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedIntValue");
  return -[BKSHIDEventDescriptor initWithEventType:](self, "initWithEventType:", v6);
}

- (BOOL)requiresFuzzyMatching
{
  return self->_hidEventType == 0;
}

- (BOOL)matchesHIDEvent:(__IOHIDEvent *)a3
{
  unsigned int hidEventType;

  hidEventType = self->_hidEventType;
  return !hidEventType || hidEventType == IOHIDEventGetType();
}

uint64_t __36__BKSHIDEventDescriptor_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
