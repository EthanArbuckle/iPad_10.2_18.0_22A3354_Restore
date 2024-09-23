@implementation BKSMousePointerGlobalContextOptions

- (BKSMousePointerGlobalContextOptions)init
{
  void *v2;
  void *v3;
  BKSMousePointerGlobalContextOptions *result;
  int v5;
  void *v6;
  __int16 v7;
  const __CFString *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot directly allocate BKSMousePointerGlobalContextOptions"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[BKSMousePointerGlobalContextOptions init]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138544130;
    v6 = v3;
    v7 = 2114;
    v8 = CFSTR("BKSMousePointerGlobalContextOptions.m");
    v9 = 1024;
    v10 = 30;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v5, 0x26u);

  }
  objc_msgSend(objc_retainAutorelease(v2), "UTF8String");
  result = (BKSMousePointerGlobalContextOptions *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BKSMousePointerGlobalContextOptions)initWithCoder:(id)a3
{
  id v3;
  BKSMousePointerGlobalContextOptions *v4;
  char v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKSMousePointerGlobalContextOptions;
  v3 = a3;
  v4 = -[BKSMousePointerGlobalContextOptions init](&v7, sel_init);
  v5 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("pinOnButtonDown"), v7.receiver, v7.super_class);

  v4->_pinOnButtonDown = v5;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->_pinOnButtonDown, CFSTR("pinOnButtonDown"));
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = 0x476D1CE4E5B90000;
  if (!self->_pinOnButtonDown)
    v2 = 0;
  return (0x94D049BB133111EBLL * (v2 ^ (v2 >> 27))) ^ ((0x94D049BB133111EBLL * (v2 ^ (v2 >> 27))) >> 31);
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;

  v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4[8] == self->_pinOnButtonDown;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[BKSMousePointerGlobalContextOptions _initWithCopyOf:]([BKSMousePointerGlobalContextOptions alloc], self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[BKSMousePointerGlobalContextOptions _initWithCopyOf:]([BKSMutableMousePointerGlobalContextOptions alloc], self);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend(a3, "appendBool:withName:", self->_pinOnButtonDown, CFSTR("pinOnButtonDown"));
}

- (BOOL)pinOnButtonDown
{
  return self->_pinOnButtonDown;
}

- (void)_initWithCopyOf:(void *)a1
{
  _BYTE *v3;
  id v4;

  v3 = a2;
  if (a1)
  {
    v4 = -[BKSMousePointerGlobalContextOptions _init](a1);
    a1 = v4;
    if (v4)
      *((_BYTE *)v4 + 8) = v3[8];
  }

  return a1;
}

- (id)_init
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = objc_opt_class();
    if (v2 != objc_opt_class())
    {
      v3 = objc_opt_class();
      if (v3 != objc_opt_class())
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSMousePointerGlobalContextOptions cannot be subclassed"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__init);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = (objc_class *)objc_opt_class();
          NSStringFromClass(v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v10 = v5;
          v11 = 2114;
          v12 = v7;
          v13 = 2048;
          v14 = v1;
          v15 = 2114;
          v16 = CFSTR("BKSMousePointerGlobalContextOptions.m");
          v17 = 1024;
          v18 = 41;
          v19 = 2114;
          v20 = v4;
          _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18A14A6E0);
      }
    }
    v8.receiver = v1;
    v8.super_class = (Class)BKSMousePointerGlobalContextOptions;
    return objc_msgSendSuper2(&v8, sel_init);
  }
  return result;
}

+ (id)build:(id)a3
{
  void (**v3)(id, id);
  id v4;
  void *v5;

  v3 = (void (**)(id, id))a3;
  v4 = -[BKSMousePointerGlobalContextOptions _init]([BKSMutableMousePointerGlobalContextOptions alloc]);
  v3[2](v3, v4);

  v5 = (void *)objc_msgSend(v4, "copy");
  return v5;
}

+ (BKSMousePointerGlobalContextOptions)new
{
  void *v2;
  void *v3;
  BKSMousePointerGlobalContextOptions *result;
  int v5;
  void *v6;
  __int16 v7;
  const __CFString *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot directly allocate BKSMousePointerGlobalContextOptions"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BKSMousePointerGlobalContextOptions new]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138544130;
    v6 = v3;
    v7 = 2114;
    v8 = CFSTR("BKSMousePointerGlobalContextOptions.m");
    v9 = 1024;
    v10 = 35;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v5, 0x26u);

  }
  objc_msgSend(objc_retainAutorelease(v2), "UTF8String");
  result = (BKSMousePointerGlobalContextOptions *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
