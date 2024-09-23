@implementation BKSMutableHIDEventSenderDescriptor

- (void)setAuthenticated:(BOOL)a3
{
  self->super._authenticated = a3;
}

- (void)setSenderID:(unint64_t)a3
{
  self->super._senderID = a3;
}

- (void)setHardwareType:(int64_t)a3
{
  self->super._hardwareType = a3;
}

- (BKSMutableHIDEventSenderDescriptor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKSMutableHIDEventSenderDescriptor;
  return (BKSMutableHIDEventSenderDescriptor *)-[BKSHIDEventSenderDescriptor _initWithHardwareType:associatedDisplay:authenticated:primaryPage:primaryUsage:senderID:](&v3, sel__initWithHardwareType_associatedDisplay_authenticated_primaryPage_primaryUsage_senderID_, 0, 0, 0, 0, 0, 0);
}

- (void)setPrimaryPage:(unsigned int)a3 primaryUsage:(unsigned int)a4
{
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  BKSMutableHIDEventSenderDescriptor *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a3 && a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("primaryPage != 0"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v11 = v7;
      v12 = 2114;
      v13 = v9;
      v14 = 2048;
      v15 = self;
      v16 = 2114;
      v17 = CFSTR("BKSHIDEventSenderDescriptor.m");
      v18 = 1024;
      v19 = 451;
      v20 = 2114;
      v21 = v6;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0FE40CLL);
  }
  self->super._primaryPage = a3;
  self->super._primaryUsage = a4;
}

- (void)setAssociatedDisplay:(id)a3
{
  BKSHIDEventDisplay *v5;
  BKSHIDEventDisplay *associatedDisplay;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  BKSMutableHIDEventSenderDescriptor *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = (BKSHIDEventDisplay *)a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = (objc_class *)-[BKSHIDEventDisplay classForCoder](v5, "classForCoder");
      if (!v8)
        v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("associatedDisplay"), v9, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v17 = v13;
        v18 = 2114;
        v19 = v15;
        v20 = 2048;
        v21 = self;
        v22 = 2114;
        v23 = CFSTR("BKSHIDEventSenderDescriptor.m");
        v24 = 1024;
        v25 = 443;
        v26 = 2114;
        v27 = v12;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A0FF24CLL);
    }
  }

  associatedDisplay = self->super._associatedDisplay;
  self->super._associatedDisplay = v5;

}

+ (id)new
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithHardwareType:associatedDisplay:authenticated:primaryPage:primaryUsage:senderID:", 0, 0, 0, 0, 0, 0);
}

@end
