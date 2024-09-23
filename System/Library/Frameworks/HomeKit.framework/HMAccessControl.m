@implementation HMAccessControl

- (HMAccessControl)initWithUser:(id)a3
{
  id v4;
  HMAccessControl *v5;
  HMAccessControl *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMAccessControl;
  v5 = -[HMAccessControl init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_user, v4);
    v6->_cachedHash = objc_msgSend(v4, "hash");
  }

  return v6;
}

- (HMAccessControl)init
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

- (unint64_t)hash
{
  objc_super v4;

  if (-[HMAccessControl cachedHash](self, "cachedHash"))
    return -[HMAccessControl cachedHash](self, "cachedHash");
  v4.receiver = self;
  v4.super_class = (Class)HMAccessControl;
  return -[HMAccessControl hash](&v4, sel_hash);
}

- (BOOL)isEqual:(id)a3
{
  HMAccessControl *v4;
  HMAccessControl *v5;
  HMAccessControl *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  v4 = (HMAccessControl *)a3;
  if (self == v4)
  {
    v10 = 1;
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
      -[HMAccessControl user](self, "user");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessControl user](v6, "user");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = 0;
      if (v7 && v8)
      {
        objc_msgSend(v7, "uniqueIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uniqueIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v11, "isEqual:", v12);

      }
    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (HMUser)user
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_user);
  os_unfair_lock_unlock(p_lock);
  return (HMUser *)WeakRetained;
}

- (void)setUser:(id)a3
{
  id obj;

  obj = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_user, obj);
  if (obj)
    self->_cachedHash = objc_msgSend(obj, "hash");
  os_unfair_lock_unlock(&self->_lock);

}

- (HMAccessControl)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMAccessControl *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.user"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HMAccessControl initWithUser:](self, "initWithUser:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMAccessControl user](self, "user");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeConditionalObject:forKey:", v5, CFSTR("HM.user"));

}

- (unint64_t)cachedHash
{
  return self->_cachedHash;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_user);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
