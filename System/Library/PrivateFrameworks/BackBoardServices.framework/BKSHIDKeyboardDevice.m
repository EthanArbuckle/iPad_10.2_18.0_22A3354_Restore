@implementation BKSHIDKeyboardDevice

- (BKSHIDKeyboardDevice)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDKeyboardDevice *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSHIDKeyboardDevice *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot -init"));
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
    v16 = CFSTR("BKSHIDKeyboardDevice.m");
    v17 = 1024;
    v18 = 31;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDKeyboardDevice *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  BKSHIDKeyboardDevice *v8;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v4, "appendProem:block:", self, &__block_literal_global_5646);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__BKSHIDKeyboardDevice_appendDescriptionToStream___block_invoke_2;
  v6[3] = &unk_1E1EA1BF8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendBodySectionWithName:block:", 0, v6);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)appendDescriptionToStream:(id)a3 fromProxy:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  BKSHIDKeyboardDevice *v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__BKSHIDKeyboardDevice_appendDescriptionToStream_fromProxy___block_invoke;
  v15[3] = &unk_1E1EA1BF8;
  v16 = v7;
  v9 = v6;
  v17 = v9;
  v11 = v7;
  objc_msgSend(v9, "appendProem:block:", self, v15);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __60__BKSHIDKeyboardDevice_appendDescriptionToStream_fromProxy___block_invoke_2;
  v12[3] = &unk_1E1EA1BF8;
  v13 = v9;
  v14 = self;
  v10 = v9;
  objc_msgSend(v10, "appendBodySectionWithName:block:", 0, v12);
  os_unfair_lock_unlock(&self->_lock);

}

- (id)_initWithProperties:(id)a3
{
  id v6;
  BKSHIDKeyboardDevice *v7;
  uint64_t v8;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  BKSHIDKeyboardDevice *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BKSHIDKeyboardDevice;
  v7 = -[BKSHIDKeyboardDevice init](&v14, sel_init);
  if (v7)
  {
    v8 = objc_opt_class();
    if (v8 != objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSHIDKeyboardDevice cannot be subclassed"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v16 = v11;
        v17 = 2114;
        v18 = v13;
        v19 = 2048;
        v20 = v7;
        v21 = 2114;
        v22 = CFSTR("BKSHIDKeyboardDevice.m");
        v23 = 1024;
        v24 = 75;
        v25 = 2114;
        v26 = v10;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A12D2B0);
    }
    objc_storeStrong((id *)&v7->_lock_properties, a3);
  }

  return v7;
}

- (void)_replaceProperties:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  BKSHIDKeyboardDeviceProperties *v6;
  BKSHIDKeyboardDeviceProperties *lock_properties;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (BKSHIDKeyboardDeviceProperties *)objc_msgSend(v5, "copy");

  lock_properties = self->_lock_properties;
  self->_lock_properties = v6;

  os_unfair_lock_unlock(p_lock);
}

- (id)_properties
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[BKSHIDKeyboardDeviceProperties copy](self->_lock_properties, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)senderID
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[BKSHIDKeyboardDeviceProperties senderID](self->_lock_properties, "senderID");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)transport
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BKSHIDKeyboardDeviceProperties transport](self->_lock_properties, "transport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (NSString)language
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BKSHIDKeyboardDeviceProperties language](self->_lock_properties, "language");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (NSString)layout
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BKSHIDKeyboardDeviceProperties layout](self->_lock_properties, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (NSString)exclusivityIdentifier
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BKSHIDKeyboardDeviceProperties exclusivityIdentifier](self->_lock_properties, "exclusivityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (unsigned)countryCode
{
  BKSHIDKeyboardDevice *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[BKSHIDKeyboardDeviceProperties countryCode](v2->_lock_properties, "countryCode");
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (unsigned)standardType
{
  BKSHIDKeyboardDevice *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = -[BKSHIDKeyboardDeviceProperties standardType](v2->_lock_properties, "standardType");
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (int64_t)subinterfaceID
{
  os_unfair_lock_s *p_lock;
  int64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[BKSHIDKeyboardDeviceProperties subinterfaceID](self->_lock_properties, "subinterfaceID");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)capsLockKeyHasLanguageSwitchLabel
{
  BKSHIDKeyboardDevice *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[BKSHIDKeyboardDeviceProperties capsLockKeyHasLanguageSwitchLabel](v2->_lock_properties, "capsLockKeyHasLanguageSwitchLabel");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)globeKeyLabelHasGlobeSymbol
{
  BKSHIDKeyboardDevice *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[BKSHIDKeyboardDeviceProperties globeKeyLabelHasGlobeSymbol](v2->_lock_properties, "globeKeyLabelHasGlobeSymbol");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_properties, 0);
}

id __60__BKSHIDKeyboardDevice_appendDescriptionToStream_fromProxy___block_invoke(id result)
{
  uint64_t v1;

  v1 = *((_QWORD *)result + 4);
  if (v1)
    return (id)objc_msgSend(*((id *)result + 5), "appendPointer:withName:", v1, CFSTR("proxy"));
  return result;
}

id __60__BKSHIDKeyboardDevice_appendDescriptionToStream_fromProxy___block_invoke_2(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), 0);
}

id __50__BKSHIDKeyboardDevice_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), 0);
}

+ (BKSHIDKeyboardDevice)new
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDKeyboardDevice *result;
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

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot +new"));
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
    v16 = CFSTR("BKSHIDKeyboardDevice.m");
    v17 = 1024;
    v18 = 36;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDKeyboardDevice *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

@end
