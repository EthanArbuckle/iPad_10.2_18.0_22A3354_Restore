@implementation BKSMousePointerEventGlobalRoute

- (BKSMousePointerEventGlobalRoute)init
{
  void *v2;
  void *v3;
  BKSMousePointerEventGlobalRoute *result;
  int v5;
  void *v6;
  __int16 v7;
  const __CFString *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot directly allocate BKSMousePointerEventGlobalRoute"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[BKSMousePointerEventGlobalRoute init]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138544130;
    v6 = v3;
    v7 = 2114;
    v8 = CFSTR("BKSMousePointerEventGlobalRoute.m");
    v9 = 1024;
    v10 = 31;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v5, 0x26u);

  }
  objc_msgSend(objc_retainAutorelease(v2), "UTF8String");
  result = (BKSMousePointerEventGlobalRoute *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BKSMousePointerEventGlobalRoute)initWithCoder:(id)a3
{
  id v3;
  BKSMousePointerEventGlobalRoute *v4;
  uint64_t v5;
  BKSMousePointerGlobalContextOptions *options;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKSMousePointerEventGlobalRoute;
  v3 = a3;
  v4 = -[BKSMousePointerEventGlobalRoute init](&v8, sel_init);
  v4->_contextID = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("contextID"), v8.receiver, v8.super_class);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("options"));
  v5 = objc_claimAutoreleasedReturnValue();

  options = v4->_options;
  v4->_options = (BKSMousePointerGlobalContextOptions *)v5;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  BKSMousePointerGlobalContextOptions *options;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", self->_contextID, CFSTR("contextID"));
  options = self->_options;
  if (options)
    objc_msgSend(v5, "encodeObject:forKey:", options, CFSTR("options"));

}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[BKSMousePointerGlobalContextOptions hash](self->_options, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_contextID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  v6 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v5 ^ (v5 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v5 ^ (v5 >> 30))) >> 27));
  return v6 ^ (v6 >> 31);
}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v4[2] == self->_contextID)
    v5 = BSEqualObjects();
  else
    v5 = 0;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[BKSMousePointerEventGlobalRoute _initWithCopyOf:]((id *)[BKSMousePointerEventGlobalRoute alloc], self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[BKSMousePointerEventGlobalRoute _initWithCopyOf:]((id *)[BKSMutableMousePointerEventGlobalRoute alloc], self);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  id v6;

  v6 = a3;
  v4 = (id)objc_msgSend(v6, "appendUInt64:withName:format:", self->_contextID, CFSTR("contextID"), 1);
  v5 = (id)objc_msgSend(v6, "appendObject:withName:", self->_options, CFSTR("options"));

}

- (unsigned)contextID
{
  return self->_contextID;
}

- (BKSMousePointerGlobalContextOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

- (id)_initWithCopyOf:(id *)a1
{
  id v3;
  id *v4;

  v3 = a2;
  if (a1)
  {
    v4 = (id *)-[BKSMousePointerEventGlobalRoute _init](a1);
    a1 = v4;
    if (v4)
    {
      *((_DWORD *)v4 + 2) = *((_DWORD *)v3 + 2);
      objc_storeStrong(v4 + 2, *((id *)v3 + 2));
    }
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
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSMousePointerEventGlobalRoute cannot be subclassed"));
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
          v16 = CFSTR("BKSMousePointerEventGlobalRoute.m");
          v17 = 1024;
          v18 = 42;
          v19 = 2114;
          v20 = v4;
          _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18A1302B8);
      }
    }
    v8.receiver = v1;
    v8.super_class = (Class)BKSMousePointerEventGlobalRoute;
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
  v4 = -[BKSMousePointerEventGlobalRoute _init]([BKSMutableMousePointerEventGlobalRoute alloc]);
  v3[2](v3, v4);

  v5 = (void *)objc_msgSend(v4, "copy");
  return v5;
}

+ (id)new
{
  void *v2;
  void *v3;
  id result;
  int v5;
  void *v6;
  __int16 v7;
  const __CFString *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot directly allocate BKSMousePointerEventGlobalRoute"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BKSMousePointerEventGlobalRoute new]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138544130;
    v6 = v3;
    v7 = 2114;
    v8 = CFSTR("BKSMousePointerEventGlobalRoute.m");
    v9 = 1024;
    v10 = 36;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v5, 0x26u);

  }
  objc_msgSend(objc_retainAutorelease(v2), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
