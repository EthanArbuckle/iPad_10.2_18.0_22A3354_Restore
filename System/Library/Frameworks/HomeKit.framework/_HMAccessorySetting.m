@implementation _HMAccessorySetting

- (_HMAccessorySetting)initWithType:(int64_t)a3 properties:(unint64_t)a4 name:(id)a5 constraints:(id)a6
{
  id v10;
  id v11;
  _HMAccessorySetting *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSUUID *identifier;
  uint64_t v17;
  NSString *name;
  uint64_t v19;
  _HMAccessorySetting *v20;
  NSMutableOrderedSet *constraints;
  objc_super v23;

  v10 = a5;
  v11 = a6;
  if (v10)
  {
    v23.receiver = self;
    v23.super_class = (Class)_HMAccessorySetting;
    v12 = -[_HMAccessorySetting init](&v23, sel_init);
    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0D28638];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "hmf_cachedInstanceForNSUUID:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      identifier = v12->_identifier;
      v12->_identifier = (NSUUID *)v15;

      v12->_type = a3;
      v12->_properties = a4;
      objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v10);
      v17 = objc_claimAutoreleasedReturnValue();
      name = v12->_name;
      v12->_name = (NSString *)v17;

      if (v11)
        objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v11);
      else
        objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
      v19 = objc_claimAutoreleasedReturnValue();
      constraints = v12->_constraints;
      v12->_constraints = (NSMutableOrderedSet *)v19;

    }
    self = v12;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)_unconfigureContext
{
  void *v3;
  void *v4;
  _HMContext *context;

  -[_HMAccessorySetting context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deregisterReceiver:", self);

  context = self->_context;
  self->_context = 0;

}

- (void)unconfigure
{
  _HMContext *context;
  void *v4;
  _HMAccessorySetting *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  context = self->_context;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (context)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring accessorySetting", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[_HMAccessorySetting _unconfigureContext](v5, "_unconfigureContext");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_HMAccessorySetting identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _HMAccessorySetting *v4;
  _HMAccessorySetting *v5;
  _HMAccessorySetting *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (_HMAccessorySetting *)a3;
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
      -[_HMAccessorySetting identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMAccessorySetting identifier](v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMAccessorySetting name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)descriptionWithPointer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), self);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1E3AB7688;
  }
  -[_HMAccessorySetting identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMAccessorySetting name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMAccessorySetting value](self, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@, Identifier = %@, Name = %@, Value = %@>"), v6, v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  return v12;
}

- (NSString)debugDescription
{
  return (NSString *)-[_HMAccessorySetting descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (NSString)description
{
  return (NSString *)-[_HMAccessorySetting descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (void)configureWithAccessorySettings:(id)a3 context:(id)a4
{
  -[_HMAccessorySetting configureWithAccessorySettings:context:shouldHandleUpdatedValue:](self, "configureWithAccessorySettings:context:shouldHandleUpdatedValue:", a3, a4, 1);
}

- (void)configureWithAccessorySettings:(id)a3 context:(id)a4 shouldHandleUpdatedValue:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  _HMAccessorySetting *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v5 = a5;
  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v13;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Configuring with context: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  -[_HMAccessorySetting setAccessorySettings:](v11, "setAccessorySettings:", v8);
  -[_HMAccessorySetting setContext:](v11, "setContext:", v9);
  if (v5)
    -[_HMAccessorySetting _registerUpdatedValueHandlers](v11, "_registerUpdatedValueHandlers");

}

- (void)_registerUpdatedValueHandlers
{
  void *v3;
  _HMAccessorySetting *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Registering message for updated value", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[_HMAccessorySetting context](v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerForMessage:receiver:selector:", CFSTR("HMAS.uv"), v4, sel__handleUpdatedValue_);

}

- (NSArray)constraints
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableOrderedSet array](self->_constraints, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (void)setConstraints:(id)a3
{
  NSMutableOrderedSet *v4;
  NSMutableOrderedSet *constraints;

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", a3);
  v4 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  constraints = self->_constraints;
  self->_constraints = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)constraintWithType:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableOrderedSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_constraints;
  v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", (_QWORD)v13) == a3)
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (void)addConstraint:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock_with_options();
    if ((-[NSMutableOrderedSet containsObject:](self->_constraints, "containsObject:", v5) & 1) != 0)
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      -[NSMutableOrderedSet addObject:](self->_constraints, "addObject:", v5);
      os_unfair_lock_unlock(&self->_lock);
      -[_HMAccessorySetting notifyDelegateOfAddedConstraint:](self, "notifyDelegateOfAddedConstraint:", v5);
    }
    v4 = v5;
  }

}

- (void)notifyDelegateOfAddedConstraint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _HMAccessorySetting *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_HMAccessorySetting context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __55___HMAccessorySetting_notifyDelegateOfAddedConstraint___block_invoke;
    v12[3] = &unk_1E3AB5ED8;
    v12[4] = self;
    v13 = v4;
    dispatch_async(v7, v12);

  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v11;
      v16 = 2080;
      v17 = "-[_HMAccessorySetting notifyDelegateOfAddedConstraint:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)addConstraint:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _HMAccessorySetting *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _HMAccessorySetting *v22;
  NSObject *v23;
  void *v24;
  id v25;
  _QWORD block[4];
  id v27;
  _HMAccessorySetting *v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_HMAccessorySetting context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMAccessorySetting addConstraint:completionHandler:]", CFSTR("completionHandler"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v24;
      v34 = 2112;
      v35 = (const char *)v20;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v20, 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v25);
  }
  v9 = (void *)v8;
  if (v8)
  {
    -[_HMAccessorySetting accessorySettings](self, "accessorySettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v9, "queue");
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55___HMAccessorySetting_addConstraint_completionHandler___block_invoke;
      block[3] = &unk_1E3AB52E0;
      v27 = v6;
      v28 = self;
      v31 = v7;
      v29 = v10;
      v30 = v9;
      dispatch_async(v11, block);

      v12 = v27;
    }
    else
    {
      v17 = (void *)MEMORY[0x1A1AC1AAC]();
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v33 = v19;
        _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@VERIFY_ACCESSORYSETTINGS - nil", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 2, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v7 + 2))(v7, v12);
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v16;
      v34 = 2080;
      v35 = "-[_HMAccessorySetting addConstraint:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }

}

- (void)removeConstraint:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock_with_options();
    if (-[NSMutableOrderedSet containsObject:](self->_constraints, "containsObject:", v5))
    {
      -[NSMutableOrderedSet removeObject:](self->_constraints, "removeObject:", v5);
      os_unfair_lock_unlock(&self->_lock);
      -[_HMAccessorySetting notifyDelegateOfRemovedConstraint:](self, "notifyDelegateOfRemovedConstraint:", v5);
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    v4 = v5;
  }

}

- (void)notifyDelegateOfRemovedConstraint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _HMAccessorySetting *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_HMAccessorySetting context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57___HMAccessorySetting_notifyDelegateOfRemovedConstraint___block_invoke;
    v12[3] = &unk_1E3AB5ED8;
    v12[4] = self;
    v13 = v4;
    dispatch_async(v7, v12);

  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v11;
      v16 = 2080;
      v17 = "-[_HMAccessorySetting notifyDelegateOfRemovedConstraint:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)removeConstraint:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _HMAccessorySetting *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _HMAccessorySetting *v22;
  NSObject *v23;
  void *v24;
  id v25;
  _QWORD block[4];
  id v27;
  _HMAccessorySetting *v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_HMAccessorySetting context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMAccessorySetting removeConstraint:completionHandler:]", CFSTR("completionHandler"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v24;
      v34 = 2112;
      v35 = (const char *)v20;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v20, 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v25);
  }
  v9 = (void *)v8;
  if (v8)
  {
    -[_HMAccessorySetting accessorySettings](self, "accessorySettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v9, "queue");
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58___HMAccessorySetting_removeConstraint_completionHandler___block_invoke;
      block[3] = &unk_1E3AB52E0;
      v27 = v6;
      v28 = self;
      v31 = v7;
      v29 = v10;
      v30 = v9;
      dispatch_async(v11, block);

      v12 = v27;
    }
    else
    {
      v17 = (void *)MEMORY[0x1A1AC1AAC]();
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v33 = v19;
        _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@VERIFY_ACCESSORYSETTINGS - nil", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 2, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v7 + 2))(v7, v12);
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v16;
      v34 = 2080;
      v35 = "-[_HMAccessorySetting removeConstraint:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }

}

- (BOOL)isReflected
{
  _HMAccessorySetting *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_reflected;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setReflected:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_reflected = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)replaceConstraints:(id)a3 withConstraints:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _HMAccessorySetting *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _HMAccessorySetting *v27;
  NSObject *v28;
  void *v29;
  id v30;
  _QWORD block[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  const char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_HMAccessorySetting context](self, "context");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMAccessorySetting replaceConstraints:withConstraints:completionHandler:]", CFSTR("completionHandler"));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1A1AC1AAC]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v29;
      v41 = 2112;
      v42 = (const char *)v25;
      _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v26);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v25, 0);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v30);
  }
  v12 = (void *)v11;
  if (v11)
  {
    v13 = (void *)objc_msgSend(v8, "copy");
    v14 = (void *)objc_msgSend(v9, "copy");
    -[_HMAccessorySetting accessorySettings](self, "accessorySettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v12, "queue");
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __76___HMAccessorySetting_replaceConstraints_withConstraints_completionHandler___block_invoke;
      block[3] = &unk_1E3AB5330;
      block[4] = self;
      v32 = v13;
      v33 = v14;
      v34 = v8;
      v35 = v9;
      v38 = v10;
      v36 = v15;
      v37 = v12;
      dispatch_async(v16, block);

    }
    else
    {
      v21 = (void *)MEMORY[0x1A1AC1AAC]();
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v23;
        _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@VERIFY_ACCESSORYSETTINGS - nil", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 2, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v10 + 2))(v10, v24);

    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v20;
      v41 = 2080;
      v42 = "-[_HMAccessorySetting replaceConstraints:withConstraints:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v13);
  }

}

- (void)updateConstraints:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _HMAccessorySetting *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _HMAccessorySetting *v23;
  NSObject *v24;
  void *v25;
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_HMAccessorySetting context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMAccessorySetting updateConstraints:completionHandler:]", CFSTR("completionHandler"));
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1A1AC1AAC]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v25;
      v34 = 2112;
      v35 = (const char *)v21;
      _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v21, 0);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v26);
  }
  v9 = (void *)v8;
  if (v8)
  {
    v10 = (void *)objc_msgSend(v6, "copy");
    -[_HMAccessorySetting accessorySettings](self, "accessorySettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v9, "queue");
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __59___HMAccessorySetting_updateConstraints_completionHandler___block_invoke;
      block[3] = &unk_1E3AB52E0;
      block[4] = self;
      v28 = v10;
      v31 = v7;
      v29 = v11;
      v30 = v9;
      dispatch_async(v12, block);

    }
    else
    {
      v17 = (void *)MEMORY[0x1A1AC1AAC]();
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v33 = v19;
        _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@VERIFY_ACCESSORYSETTINGS - nil", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 2, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v7 + 2))(v7, v20);

    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v16;
      v34 = 2080;
      v35 = "-[_HMAccessorySetting updateConstraints:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }

}

- (NSCopying)value
{
  os_unfair_lock_s *p_lock;
  NSCopying *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_value;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setValue:(id)a3
{
  NSCopying *v4;
  NSCopying *value;

  v4 = (NSCopying *)a3;
  os_unfair_lock_lock_with_options();
  value = self->_value;
  self->_value = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_handleUpdatedValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _HMAccessorySetting *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  _HMAccessorySetting *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  _HMAccessorySetting *v35;
  NSObject *v36;
  void *v37;
  char *v38;
  void *v39;
  void *v40;
  _HMAccessorySetting *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  _HMAccessorySetting *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  char *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  const char *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_HMAccessorySetting context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "pendingRequests");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "retrieveCompletionBlockForIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
LABEL_3:
      objc_msgSend(v4, "respondWithPayload:", 0);
LABEL_4:

      goto LABEL_8;
    }
    objc_msgSend(v4, "dataForKey:", CFSTR("value"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v34 = (void *)MEMORY[0x1A1AC1AAC]();
      v35 = self;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v38 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v56 = v37;
        v57 = 2112;
        v58 = v38;
        _os_log_impl(&dword_19B1B0000, v36, OS_LOG_TYPE_ERROR, "%{public}@Missing updated serialized value from message payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v34);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v39);

      goto LABEL_4;
    }
    v15 = (void *)MEMORY[0x1E0CB3710];
    +[_HMAccessorySetting supportedValueClasses](_HMAccessorySetting, "supportedValueClasses");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    objc_msgSend(v15, "unarchivedObjectOfClasses:fromData:error:", v16, v14, &v54);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v50 = (char *)v54;

    if (!v17)
    {
      v40 = (void *)MEMORY[0x1A1AC1AAC]();
      v41 = self;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v56 = v43;
        v57 = 2112;
        v58 = v50;
        _os_log_impl(&dword_19B1B0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive supported value from value data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v17);
      v33 = 1;
LABEL_31:

      if (v33)
        goto LABEL_4;
      goto LABEL_3;
    }
    objc_msgSend(v4, "stringForKey:", CFSTR("keyPath"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[_HMAccessorySetting delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "keyPathForSetting:", self);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v18, "isEqualToString:", v20);

      if (v21)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v17, "isEqual:", v22);

        if (v23)
        {

          v17 = 0;
        }
        v24 = (void *)MEMORY[0x1A1AC1AAC]();
        v25 = self;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v56 = v27;
          v57 = 2112;
          v58 = (const char *)v17;
          _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_INFO, "%{public}@Updating value to: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v24);
        -[_HMAccessorySetting value](v25, "value");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = HMFEqualObjects();

        if ((v29 & 1) == 0)
        {
          objc_initWeak((id *)buf, v25);
          -[_HMAccessorySetting delegate](v25, "delegate");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HMAccessorySetting accessorySettings](v25, "accessorySettings");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "_settingWillUpdateValue:", v25);
          v49 = v30;
          v51[0] = MEMORY[0x1E0C809B0];
          v51[1] = 3221225472;
          v51[2] = __43___HMAccessorySetting__handleUpdatedValue___block_invoke;
          v51[3] = &unk_1E3AB6240;
          objc_copyWeak(&v53, (id *)buf);
          v17 = v17;
          v52 = v17;
          objc_msgSend(v31, "_updateSettingsWithBlock:", v51);
          objc_msgSend(v30, "keyPathForSetting:", v25);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "_notifyDelegateDidUpdateKeyPath:", v32);

          objc_destroyWeak(&v53);
          objc_destroyWeak((id *)buf);
        }
        v33 = 0;
        goto LABEL_30;
      }
    }
    else
    {
      v44 = (void *)MEMORY[0x1A1AC1AAC]();
      v45 = self;
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v56 = v47;
        _os_log_impl(&dword_19B1B0000, v46, OS_LOG_TYPE_INFO, "%{public}@Accessory settings update value message missing key path", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v44);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v48);

    }
    v33 = 1;
LABEL_30:

    goto LABEL_31;
  }
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v56 = v13;
    v57 = 2080;
    v58 = "-[_HMAccessorySetting _handleUpdatedValue:]";
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
LABEL_8:

}

- (void)updateValue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _HMAccessorySetting *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _HMAccessorySetting *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _HMAccessorySetting *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  void *v38;
  _HMAccessorySetting *v39;
  NSObject *v40;
  void *v41;
  id v42;
  id v43;
  _QWORD block[5];
  id v45;
  char *v46;
  id v47;
  id v48;
  id v49;
  _QWORD v50[5];
  char *v51;
  id v52;
  _QWORD v53[5];
  id v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  const char *v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_HMAccessorySetting context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMAccessorySetting updateValue:completionHandler:]", CFSTR("completionHandler"));
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)MEMORY[0x1A1AC1AAC]();
    v39 = self;
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v56 = v41;
      v57 = 2112;
      v58 = (const char *)v37;
      _os_log_impl(&dword_19B1B0000, v40, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v38);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v37, 0);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v42);
  }
  v9 = (void *)v8;
  if (v8)
  {
    -[_HMAccessorySetting accessorySettings](self, "accessorySettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[_HMAccessorySetting delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "keyPathForSetting:", self);
      v12 = (char *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "settingsContainer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
      v15 = v14;

      if (v15 && objc_msgSend(v15, "supportsMessagedHomePodSettings"))
      {
        v16 = (void *)MEMORY[0x1A1AC1AAC]();
        v17 = self;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v56 = v19;
          v57 = 2112;
          v58 = v12;
          v59 = 2112;
          v60 = v6;
          _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_INFO, "%{public}@Updating through settings adapter with keypath: %@ value: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v16);
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __53___HMAccessorySetting_updateValue_completionHandler___block_invoke;
        v53[3] = &unk_1E3AB5380;
        v53[4] = v17;
        v54 = v7;
        objc_msgSend(v15, "updateSettingWithKeyPath:value:completionHandler:", v12, v6, v53);

      }
      else
      {
        objc_msgSend(v10, "settingsContainer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v25 = v24;
        else
          v25 = 0;
        v26 = v25;

        if (v26 && objc_msgSend(v26, "supportsMessagedHomepodSettings"))
        {
          v50[0] = MEMORY[0x1E0C809B0];
          v50[1] = 3221225472;
          v50[2] = __53___HMAccessorySetting_updateValue_completionHandler___block_invoke_92;
          v50[3] = &unk_1E3AB53A8;
          v50[4] = self;
          v51 = v12;
          v52 = v7;
          objc_msgSend(v26, "updateSettingWithKeyPath:value:completionHandler:", v51, v6, v50);

        }
        else
        {
          v30 = (void *)MEMORY[0x1A1AC1AAC]();
          v31 = self;
          HMFGetOSLogHandle();
          v32 = objc_claimAutoreleasedReturnValue();
          v43 = v6;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v56 = v33;
            v57 = 2112;
            v58 = v12;
            v59 = 2112;
            v60 = v43;
            _os_log_impl(&dword_19B1B0000, v32, OS_LOG_TYPE_INFO, "%{public}@Updating through sending update value message with keypath: %@ value: %@", buf, 0x20u);

            v6 = v43;
          }

          objc_autoreleasePoolPop(v30);
          v34 = (void *)objc_msgSend(v6, "copy");
          objc_msgSend(v9, "queue");
          v35 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __53___HMAccessorySetting_updateValue_completionHandler___block_invoke_93;
          block[3] = &unk_1E3AB53D0;
          block[4] = v31;
          v49 = v7;
          v45 = v34;
          v46 = v12;
          v47 = v10;
          v48 = v9;
          v36 = v34;
          dispatch_async(v35, block);

          v6 = v43;
        }

      }
    }
    else
    {
      v27 = (void *)MEMORY[0x1A1AC1AAC]();
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v56 = v29;
        _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_ERROR, "%{public}@VERIFY_ACCESSORYSETTINGS - nil", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v27);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 2, 0);
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, char *))v7 + 2))(v7, v12);
    }

  }
  else
  {
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v56 = v23;
      v57 = 2080;
      v58 = "-[_HMAccessorySetting updateValue:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[_HMAccessorySetting identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)mergeObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  _HMAccessorySetting *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  char v22;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    -[_HMAccessorySetting value](self, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = HMFEqualObjects();
    v10 = v9 ^ 1;

    if ((v9 & 1) == 0)
    {
      v11 = (void *)MEMORY[0x1A1AC1AAC]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543618;
        v25 = v14;
        v26 = 2112;
        v27 = v15;
        _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Updated value: %@", (uint8_t *)&v24, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(v6, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMAccessorySetting setValue:](v12, "setValue:", v16);

      -[_HMAccessorySetting accessorySettings](v12, "accessorySettings");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMAccessorySetting delegate](v12, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "keyPathForSetting:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_notifyDelegateDidUpdateKeyPath:", v19);

    }
    objc_msgSend(v4, "constraints");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[_HMAccessorySetting mergeConstraints:](self, "mergeConstraints:", v20);

    v22 = v21 | v10;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BOOL)mergeConstraints:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _HMAccessorySetting *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  _HMAccessorySetting *v22;
  NSObject *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[_HMAccessorySetting constraints](self, "constraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v9, "minusSet:", v8);
  if (objc_msgSend(v9, "count"))
  {
    v32 = v4;
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v13;
      v45 = 2112;
      v46 = v9;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Removing constraints: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    v16 = v15 != 0;
    if (v15)
    {
      v17 = v15;
      v18 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(v14);
          -[_HMAccessorySetting removeConstraint:](v11, "removeConstraint:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
        }
        v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v17);
    }

    v4 = v32;
  }
  else
  {
    v16 = 0;
  }
  v20 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v20, "minusSet:", v7);
  if (objc_msgSend(v20, "count"))
  {
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v24 = v4;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v25;
      v45 = 2112;
      v46 = v20;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Adding constraints: %@", buf, 0x16u);

      v4 = v24;
    }

    objc_autoreleasePoolPop(v21);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v26 = v20;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v34 != v29)
            objc_enumerationMutation(v26);
          -[_HMAccessorySetting addConstraint:](v22, "addConstraint:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v28);
      v16 = 1;
    }

  }
  return v16;
}

- (NSUUID)messageTargetUUID
{
  void *v2;
  void *v3;
  void *v4;

  -[_HMAccessorySetting accessorySettings](self, "accessorySettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settingsContainerInternal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v4;
}

- (id)messageDestination
{
  void *v2;
  void *v3;

  -[_HMAccessorySetting messageTargetUUID](self, "messageTargetUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D285D8]), "initWithTarget:", v2);
  else
    v3 = 0;

  return v3;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[_HMAccessorySetting context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (_HMAccessorySetting)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _HMAccessorySetting *v10;
  void *v11;
  uint64_t v12;
  NSUUID *identifier;
  void *v14;
  uint64_t v15;
  NSCopying *value;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.type"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.properties"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "supportedConstraintClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("HM.constraint"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[_HMAccessorySetting initWithType:properties:name:constraints:](self, "initWithType:properties:name:constraints:", v5, v6, v7, v9);
  if (v10)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v10->_identifier;
    v10->_identifier = (NSUUID *)v12;

    objc_msgSend((id)objc_opt_class(), "supportedValueClasses");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("HM.value"));
    v15 = objc_claimAutoreleasedReturnValue();
    value = v10->_value;
    v10->_value = (NSCopying *)v15;

    v10->_reflected = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.pms"));
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[_HMAccessorySetting identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.identifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[_HMAccessorySetting type](self, "type"), CFSTR("HM.type"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[_HMAccessorySetting properties](self, "properties"), CFSTR("HM.properties"));
  -[_HMAccessorySetting name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HM.name"));

  -[_HMAccessorySetting constraints](self, "constraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HM.constraint"));

  -[_HMAccessorySetting value](self, "value");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HM.value"));

}

- (_HMAccessorySettingDelegate)delegate
{
  return (_HMAccessorySettingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)properties
{
  return self->_properties;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (HMAccessorySettings)accessorySettings
{
  return (HMAccessorySettings *)objc_loadWeakRetained((id *)&self->_accessorySettings);
}

- (void)setAccessorySettings:(id)a3
{
  objc_storeWeak((id *)&self->_accessorySettings, a3);
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_accessorySettings);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)_encodedConstraintsToRemove:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "identifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "UUIDString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)_encodedConstraintsToAdd:(id)a3
{
  return encodeRootObject(a3);
}

+ (id)_replaceConstraintsPayloadWithAdditions:(id)a3 removals:(id)a4 keyPath:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("remove");
  v13[1] = CFSTR("add");
  v14[0] = a4;
  v14[1] = a3;
  v13[2] = CFSTR("keyPath");
  v14[2] = a5;
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t64_51670 != -1)
    dispatch_once(&logCategory__hmf_once_t64_51670, &__block_literal_global_51671);
  return (id)logCategory__hmf_once_v65_51672;
}

+ (id)supportedValueClasses
{
  if (supportedValueClasses_onceToken_51640 != -1)
    dispatch_once(&supportedValueClasses_onceToken_51640, &__block_literal_global_100);
  return (id)supportedValueClasses_supportedValueClasses_51641;
}

+ (id)supportedConstraintClasses
{
  if (supportedConstraintClasses_onceToken != -1)
    dispatch_once(&supportedConstraintClasses_onceToken, &__block_literal_global_105);
  return (id)supportedConstraintClasses_supportedConstraintClasses;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
