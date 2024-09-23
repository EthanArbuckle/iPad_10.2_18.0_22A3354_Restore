@implementation BSZeroingWeakReference

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_object);
}

- (id)object
{
  return objc_loadWeakRetained(&self->_object);
}

+ (BSZeroingWeakReference)referenceWithObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObject:", v4);

  return (BSZeroingWeakReference *)v5;
}

- (BSZeroingWeakReference)initWithObject:(id)a3
{
  id v4;
  BSZeroingWeakReference *v5;
  BSZeroingWeakReference *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BSZeroingWeakReference;
  v5 = -[BSZeroingWeakReference init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak(&v5->_object, v4);
    v6->_objectClass = (Class)objc_opt_class();
    v6->_objectAddress = (unint64_t)v4;
  }

  return v6;
}

- (BSZeroingWeakReference)init
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  BSZeroingWeakReference *result;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSZeroingWeakReference *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BSZeroingWeakReference does not support -init"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
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
    v16 = CFSTR("BSZeroingWeakReference.m");
    v17 = 1024;
    v18 = 38;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  result = (BSZeroingWeakReference *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  qword_1EDF5BAE8 = (uint64_t)result;
  __break(0);
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[BSZeroingWeakReference object](self, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromClass(self->_objectClass);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p>"), v5, self->_objectAddress);
  else
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p (deallocated)>"), v5, self->_objectAddress);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  return self->_objectAddress;
}

- (BOOL)isEqual:(id)a3
{
  BSZeroingWeakReference *v4;
  BOOL v5;
  void *v7;
  void *v8;

  v4 = (BSZeroingWeakReference *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && v4->_objectAddress == self->_objectAddress
      && v4->_objectClass == self->_objectClass)
    {
      -[BSZeroingWeakReference object](self, "object");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSZeroingWeakReference object](v4, "object");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v7 == v8;

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

@end
