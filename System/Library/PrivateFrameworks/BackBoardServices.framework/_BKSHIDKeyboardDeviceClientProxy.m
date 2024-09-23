@implementation _BKSHIDKeyboardDeviceClientProxy

- (_BKSHIDKeyboardDeviceClientProxy)initWithDevice:(id)a3 lifetimeAssertion:(id)a4
{
  id v8;
  id v9;
  _BKSHIDKeyboardDeviceClientProxy *v10;
  id v11;
  void *v12;
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
  void *v31;
  objc_class *v32;
  void *v33;
  objc_super v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  _BKSHIDKeyboardDeviceClientProxy *v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v34.receiver = self;
  v34.super_class = (Class)_BKSHIDKeyboardDeviceClientProxy;
  v10 = -[_BKSHIDKeyboardDeviceClientProxy init](&v34, sel_init);
  if (v10)
  {
    v11 = v8;
    if (!v11)
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_opt_class();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("device"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v36 = v18;
        v37 = 2114;
        v38 = v20;
        v39 = 2048;
        v40 = v10;
        v41 = 2114;
        v42 = CFSTR("BKSHIDKeyboardService.m");
        v43 = 1024;
        v44 = 51;
        v45 = 2114;
        v46 = v17;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A10360CLL);
    }
    v12 = v11;
    objc_opt_class();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v21 = (void *)MEMORY[0x1E0CB3940];
      v22 = (objc_class *)objc_msgSend(v12, "classForCoder");
      if (!v22)
        v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("device"), v23, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v36 = v27;
        v37 = 2114;
        v38 = v29;
        v39 = 2048;
        v40 = v10;
        v41 = 2114;
        v42 = CFSTR("BKSHIDKeyboardService.m");
        v43 = 1024;
        v44 = 51;
        v45 = 2114;
        v46 = v26;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A10374CLL);
    }

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("assertion != ((void *)0)"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v36 = v31;
        v37 = 2114;
        v38 = v33;
        v39 = 2048;
        v40 = v10;
        v41 = 2114;
        v42 = CFSTR("BKSHIDKeyboardService.m");
        v43 = 1024;
        v44 = 52;
        v45 = 2114;
        v46 = v30;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A103844);
    }
    objc_storeStrong((id *)&v10->_device, a3);
    objc_storeStrong((id *)&v10->_lifetimeAssertion, a4);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_lifetimeAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_BKSHIDKeyboardDeviceClientProxy;
  -[_BKSHIDKeyboardDeviceClientProxy dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD *v8;
  char v9;

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

  if (v8)
    v9 = -[BKSHIDKeyboardDevice isEqual:](self->_device, "isEqual:", v8[1]);
  else
    v9 = 0;

  return v9;
}

- (unint64_t)hash
{
  return -[BKSHIDKeyboardDevice hash](self->_device, "hash");
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D01750];
  objc_msgSend(MEMORY[0x1E0D01758], "debugStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForRootObject:withStyle:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  -[BKSHIDKeyboardDevice appendDescriptionToStream:fromProxy:](self->_device, "appendDescriptionToStream:fromProxy:", a3, self);
}

- (id)_properties
{
  return -[BKSHIDKeyboardDevice _properties](self->_device, "_properties");
}

- (unint64_t)senderID
{
  return -[BKSHIDKeyboardDevice senderID](self->_device, "senderID");
}

- (NSString)transport
{
  return -[BKSHIDKeyboardDevice transport](self->_device, "transport");
}

- (NSString)language
{
  return -[BKSHIDKeyboardDevice language](self->_device, "language");
}

- (NSString)layout
{
  return -[BKSHIDKeyboardDevice layout](self->_device, "layout");
}

- (NSString)exclusivityIdentifier
{
  return -[BKSHIDKeyboardDevice exclusivityIdentifier](self->_device, "exclusivityIdentifier");
}

- (unsigned)countryCode
{
  return -[BKSHIDKeyboardDevice countryCode](self->_device, "countryCode");
}

- (unsigned)standardType
{
  return -[BKSHIDKeyboardDevice standardType](self->_device, "standardType");
}

- (int64_t)subinterfaceID
{
  return -[BKSHIDKeyboardDevice subinterfaceID](self->_device, "subinterfaceID");
}

- (BOOL)capsLockKeyHasLanguageSwitchLabel
{
  return -[BKSHIDKeyboardDevice capsLockKeyHasLanguageSwitchLabel](self->_device, "capsLockKeyHasLanguageSwitchLabel");
}

- (BOOL)globeKeyLabelHasGlobeSymbol
{
  return -[BKSHIDKeyboardDevice globeKeyLabelHasGlobeSymbol](self->_device, "globeKeyLabelHasGlobeSymbol");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lifetimeAssertion, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
