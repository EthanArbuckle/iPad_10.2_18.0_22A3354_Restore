@implementation BKSHIDUISensorCharacteristics

- (BKSHIDUISensorCharacteristics)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDUISensorCharacteristics *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSHIDUISensorCharacteristics *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot directly allocate BKSHIDUISensorCharacteristics"));
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
    v16 = CFSTR("BKSHIDUISensorCharacteristics.m");
    v17 = 1024;
    v18 = 29;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDUISensorCharacteristics *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_init
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BKSHIDUISensorCharacteristics *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    v5 = objc_opt_class();
    if (v5 != objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSHIDUISensorCharacteristics cannot be subclassed"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v13 = v8;
        v14 = 2114;
        v15 = v10;
        v16 = 2048;
        v17 = self;
        v18 = 2114;
        v19 = CFSTR("BKSHIDUISensorCharacteristics.m");
        v20 = 1024;
        v21 = 40;
        v22 = 2114;
        v23 = v7;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A148128);
    }
  }
  self->_suggestedSystemApertureGracePeriodForScreenOff = 0x7FFFFFFFFFFFFFFFLL;
  v11.receiver = self;
  v11.super_class = (Class)BKSHIDUISensorCharacteristics;
  return -[BKSHIDUISensorCharacteristics init](&v11, sel_init);
}

- (BKSHIDUISensorCharacteristics)initWithCoder:(id)a3
{
  id v3;
  BKSHIDUISensorCharacteristics *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKSHIDUISensorCharacteristics;
  v3 = a3;
  v4 = -[BKSHIDUISensorCharacteristics init](&v7, sel_init);
  v4->_hasDiscreteProximitySensor = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("hasDiscreteProximitySensor"), v7.receiver, v7.super_class);
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("suggestedSystemApertureGracePeriodForScreenOff"));

  v4->_suggestedSystemApertureGracePeriodForScreenOff = v5;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 hasDiscreteProximitySensor;
  id v5;

  hasDiscreteProximitySensor = self->_hasDiscreteProximitySensor;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", hasDiscreteProximitySensor, CFSTR("hasDiscreteProximitySensor"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_suggestedSystemApertureGracePeriodForScreenOff, CFSTR("suggestedSystemApertureGracePeriodForScreenOff"));

}

- (unint64_t)hash
{
  void *v2;

  if (self->_suggestedSystemApertureGracePeriodForScreenOff)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "hash");

  }
  return BSHashPurifyNS();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD *v8;
  BOOL v9;

  v4 = a3;
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
  v8 = v7;

  v9 = v8
    && *((unsigned __int8 *)v8 + 16) == self->_hasDiscreteProximitySensor
    && v8[1] == self->_suggestedSystemApertureGracePeriodForScreenOff;

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[BKSHIDUISensorCharacteristics _init](+[BKSHIDUISensorCharacteristics allocWithZone:](BKSHIDUISensorCharacteristics, "allocWithZone:", a3), "_init");
  *((_BYTE *)result + 16) = self->_hasDiscreteProximitySensor;
  *((_QWORD *)result + 1) = self->_suggestedSystemApertureGracePeriodForScreenOff;
  return result;
}

- (id)mutableCopy
{
  BKSMutableHIDUISensorCharacteristics *v3;

  v3 = objc_alloc_init(BKSMutableHIDUISensorCharacteristics);
  -[BKSMutableHIDUISensorCharacteristics setHasDiscreteProximitySensor:](v3, "setHasDiscreteProximitySensor:", self->_hasDiscreteProximitySensor);
  -[BKSMutableHIDUISensorCharacteristics setSuggestedSystemApertureGracePeriodForScreenOff:](v3, "setSuggestedSystemApertureGracePeriodForScreenOff:", self->_suggestedSystemApertureGracePeriodForScreenOff);
  return v3;
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
  BKSHIDUISensorCharacteristics *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__BKSHIDUISensorCharacteristics_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E1EA1BF8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", self, v6);

}

- (BOOL)hasDiscreteProximitySensor
{
  return self->_hasDiscreteProximitySensor;
}

- (int64_t)suggestedSystemApertureGracePeriodForScreenOff
{
  return self->_suggestedSystemApertureGracePeriodForScreenOff;
}

id __62__BKSHIDUISensorCharacteristics_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("hasDiscreteProximitySensor"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("suggestedSystemApertureGracePeriodForScreenOff"));
}

+ (BKSHIDUISensorCharacteristics)new
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDUISensorCharacteristics *result;
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

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot directly allocate BKSHIDUISensorCharacteristics"));
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
    v16 = CFSTR("BKSHIDUISensorCharacteristics.m");
    v17 = 1024;
    v18 = 34;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDUISensorCharacteristics *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)protobufSchema
{
  return (id)objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", a1, &__block_literal_global_10251);
}

void __47__BKSHIDUISensorCharacteristics_protobufSchema__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "addField:", "_hasDiscreteProximitySensor");
  objc_msgSend(v2, "addField:", "_suggestedSystemApertureGracePeriodForScreenOff");

}

@end
