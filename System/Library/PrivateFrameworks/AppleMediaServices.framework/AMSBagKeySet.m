@implementation AMSBagKeySet

uint64_t __60__AMSBagKeySet_registerBagKeySet_forProfile_profileVersion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValues, 0);
}

+ (id)defaultValueForKey:(id)a3 profile:(id)a4 profileVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "defaultValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v11);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(a1, "defaultValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v11);

  }
  objc_msgSend(v13, "objectForKeyedSubscript:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();

  return v15;
}

+ (NSMutableDictionary)defaultValues
{
  if (_MergedGlobals_84 != -1)
    dispatch_once(&_MergedGlobals_84, &__block_literal_global_16);
  return (NSMutableDictionary *)(id)qword_1ECEACFC8;
}

+ (void)registerBagKeySet:(id)a3 forProfile:(id)a4 profileVersion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v16 = a3;
  v8 = a5;
  v9 = a4;
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "defaultValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(a1, "defaultValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v10);

  }
  objc_msgSend(v16, "defaultValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __60__AMSBagKeySet_registerBagKeySet_forProfile_profileVersion___block_invoke;
  v17[3] = &unk_1E253E880;
  v18 = v12;
  v15 = v12;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v17);

  os_unfair_recursive_lock_unlock();
}

- (NSMutableDictionary)defaultValues
{
  return self->_defaultValues;
}

void __29__AMSBagKeySet_defaultValues__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)qword_1ECEACFC8;
  qword_1ECEACFC8 = (uint64_t)v0;

}

- (AMSBagKeySet)init
{
  AMSBagKeySet *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *defaultValues;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSBagKeySet;
  v2 = -[AMSBagKeySet init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    defaultValues = v2->_defaultValues;
    v2->_defaultValues = v3;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[AMSBagKeySet init](+[AMSBagKeySet allocWithZone:](AMSBagKeySet, "allocWithZone:", a3), "init");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[AMSBagKeySet init](+[AMSMutableBagKeySet allocWithZone:](AMSMutableBagKeySet, "allocWithZone:", a3), "init");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setDefaultValues:(id)a3
{
  objc_storeStrong((id *)&self->_defaultValues, a3);
}

@end
