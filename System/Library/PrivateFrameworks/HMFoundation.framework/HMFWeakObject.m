@implementation HMFWeakObject

- (HMFWeakObject)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMFWeakObject)initWithWeakObject:(id)a3
{
  id v4;
  HMFWeakObject *v5;
  HMFWeakObject *v6;
  HMFWeakObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)HMFWeakObject;
    v5 = -[HMFWeakObject init](&v12, sel_init);
    v6 = v5;
    if (v5)
    {
      objc_storeWeak(&v5->_object, v4);
      v6->_objectHash = objc_msgSend(v4, "hash");
    }
    self = v6;
    v7 = self;
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC355C]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_log_impl(&dword_19B546000, v9, OS_LOG_TYPE_ERROR, "%{public}@A valid object is required", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return self->_objectHash;
}

- (BOOL)isEqual:(id)a3
{
  HMFWeakObject *v4;
  HMFWeakObject *v5;
  HMFWeakObject *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v4 = (HMFWeakObject *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMFWeakObject object](self, "object");
      v7 = objc_claimAutoreleasedReturnValue();
      -[HMFWeakObject object](v6, "object");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 | v8)
        v9 = objc_msgSend((id)v7, "isEqual:", v8);
      else
        v9 = 0;

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (id)object
{
  return objc_loadWeakRetained(&self->_object);
}

- (unint64_t)objectHash
{
  return self->_objectHash;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_object);
}

@end
