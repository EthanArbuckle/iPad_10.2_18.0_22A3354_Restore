@implementation HMDNetworkActivityWrapper

- (HMDNetworkActivityWrapper)initWithLabel:(unint64_t)a3
{
  HMDNetworkActivityWrapper *v3;
  uint64_t v4;
  OS_nw_activity *activity;
  NSMutableSet *v6;
  NSMutableSet *mutableChildren;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMDNetworkActivityWrapper;
  v3 = -[HMDNetworkActivityWrapper init](&v9, sel_init);
  if (v3)
  {
    v4 = nw_activity_create();
    activity = v3->_activity;
    v3->_activity = (OS_nw_activity *)v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    mutableChildren = v3->_mutableChildren;
    v3->_mutableChildren = v6;

    v3->_completed = 0;
  }
  return v3;
}

- (BOOL)isActivated
{
  void *v2;
  char is_activated;

  -[HMDNetworkActivityWrapper activity](self, "activity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  is_activated = nw_activity_is_activated();

  return is_activated;
}

- (unint64_t)label
{
  void *v2;
  unint64_t label;

  -[HMDNetworkActivityWrapper activity](self, "activity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  label = nw_activity_get_label();

  return label;
}

- (NSSet)children
{
  void *v2;
  void *v3;

  -[HMDNetworkActivityWrapper mutableChildren](self, "mutableChildren");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSSet *)v3;
}

- (void)activate
{
  id v2;

  -[HMDNetworkActivityWrapper activity](self, "activity");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  nw_activity_activate();

}

- (void)setParent:(id)a3
{
  HMDNetworkActivityWrapper **p_parent;
  id v5;
  void *v6;
  void *v7;
  id v8;

  p_parent = &self->_parent;
  v5 = a3;
  objc_storeWeak((id *)p_parent, v5);
  -[HMDNetworkActivityWrapper activity](self, "activity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  nw_activity_set_parent_activity();

  objc_msgSend(v5, "mutableChildren");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObject:", self);
}

- (void)completeWithSuccess:(BOOL)a3
{
  id v3;

  if (!self->_completed)
  {
    self->_completed = 1;
    -[HMDNetworkActivityWrapper activity](self, "activity");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    nw_activity_complete_with_reason();

  }
}

- (void)submitMetrics:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDNetworkActivityWrapper *v9;
  NSObject *v10;
  void *v11;
  xpc_object_t v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (self->_completed)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Attempted to submit metrics after completion", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v12 = xpc_dictionary_create(0, 0, 0);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __52__HMDNetworkActivityWrapper_submitMetrics_withName___block_invoke;
    v15[3] = &unk_24E796DA0;
    v16 = v12;
    v13 = v12;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v15);
    -[HMDNetworkActivityWrapper activity](self, "activity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    nw_activity_submit_metrics();

  }
}

- (id)childActivityWithLabel:(unint64_t)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  HMDNetworkActivityWrapper *v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HMDNetworkActivityWrapper mutableChildren](self, "mutableChildren", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "label") == a3)
        {
          v15 = v12;

          return v15;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }

  if (!v4)
    return 0;
  v13 = -[HMDNetworkActivityWrapper initWithLabel:]([HMDNetworkActivityWrapper alloc], "initWithLabel:", a3);
  -[HMDNetworkActivityWrapper setParent:](v13, "setParent:", self);
  return v13;
}

- (OS_nw_activity)activity
{
  return self->_activity;
}

- (HMDNetworkActivityWrapper)parent
{
  return (HMDNetworkActivityWrapper *)objc_loadWeakRetained((id *)&self->_parent);
}

- (NSMutableSet)mutableChildren
{
  return self->_mutableChildren;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableChildren, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_activity, 0);
}

void __52__HMDNetworkActivityWrapper_submitMetrics_withName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  const char *v12;
  double v13;
  id v14;

  v14 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;
  v8 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v7)
  {
    v11 = *(void **)(a1 + 32);
    v12 = (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    objc_msgSend(v7, "doubleValue");
    xpc_dictionary_set_double(v11, v12, v13);
  }
  else if (v10)
  {
    xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 32), (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
  }

}

@end
