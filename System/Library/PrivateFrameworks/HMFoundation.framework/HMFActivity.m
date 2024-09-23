@implementation HMFActivity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalAssertions, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_associatedObjects, 0);
  objc_storeStrong((id *)&self->_threadContexts, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_internal, 0);
}

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  HMFActivity *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSMutableSet *obj;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->_valid)
    __HMFActivityInvalidate(self);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = self->_threadContexts;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1A1AC355C]();
        v9 = self;
        HMFGetOSLogHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier(v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v7, "count");
          objc_msgSend(v7, "thread");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v21 = v11;
          v22 = 2048;
          v23 = v12;
          v24 = 2112;
          v25 = v13;
          _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Thread left active (%tu): %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v8);
      }
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v4);
  }

  v15.receiver = self;
  v15.super_class = (Class)HMFActivity;
  -[HMFActivity dealloc](&v15, sel_dealloc);
}

- (HMFActivity)initWithName:(id)a3 parent:(id)a4 options:(unint64_t)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  HMFActivity *v12;

  v8 = (void *)MEMORY[0x1E0CB3A28];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMFActivity initWithIdentifier:name:parent:options:](self, "initWithIdentifier:name:parent:options:", v11, v10, v9, a5);

  return v12;
}

- (void)end
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  __HMFActivityEnd(self);
  os_unfair_lock_unlock(p_lock);
}

- (HMFActivity)initWithName:(id)a3
{
  return -[HMFActivity initWithName:parent:options:](self, "initWithName:parent:options:", a3, 0, 0);
}

- (unint64_t)hash
{
  return os_activity_get_identifier((os_activity_t)self->_internal, 0);
}

void __30__HMFActivity_markWithReason___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1A1AC355C]();
  v4 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (!v6)
      goto LABEL_7;
    HMFGetLogIdentifier(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v24 = v7;
    v25 = 2112;
    v26 = v8;
    v9 = "%{public}@Marked with reason: %@";
    v10 = v5;
    v11 = 22;
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    HMFGetLogIdentifier(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v7;
    v9 = "%{public}@Marked";
    v10 = v5;
    v11 = 12;
  }
  _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_INFO, v9, buf, v11);

LABEL_7:
  objc_autoreleasePoolPop(v3);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = *(_QWORD **)(a1 + 40);
  if (v12)
    v12 = (_QWORD *)v12[11];
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "mark", (_QWORD)v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

}

- (void)markWithReason:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  HMFActivity *v6;
  NSObject *v7;
  _BOOL4 v8;
  HMFActivity *v9;
  NSObject *v10;
  id *v11;
  void *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  void *v15;
  NSObject *internal;
  _QWORD block[4];
  id v18;
  HMFActivity *v19;
  os_signpost_id_t v20;
  uint8_t buf[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMFActivity start]((os_unfair_lock_s *)self);
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_valid)
  {
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = os_signpost_enabled(v7);
    if (v8)
    {
      v9 = v6;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();

      v11 = v9;
      v20 = 0;
      *(_OWORD *)buf = 0uLL;
      objc_msgSend(v11[7], "getUUIDBytes:", buf);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", buf, 16, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "getBytes:range:", &v20, objc_msgSend(v12, "length") - 8, 8);

      v13 = v20;
      if (os_signpost_enabled(v10))
      {
        if (v13 + 1 >= 2)
          v14 = v13;
        else
          v14 = 0xEEEEB0B5B2B2EEEELL;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v4;
        _os_signpost_emit_with_name_impl(&dword_19B546000, v10, OS_SIGNPOST_EVENT, v14, "HMFActivity", "Reason = %@", buf, 0xCu);
      }

    }
    v15 = (void *)MEMORY[0x1A1AC355C]();
    internal = v6->_internal;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30__HMFActivity_markWithReason___block_invoke;
    block[3] = &unk_1E3B37CA8;
    v18 = v4;
    v19 = v6;
    os_activity_apply(internal, block);

    objc_autoreleasePoolPop(v15);
  }
  os_unfair_lock_unlock(p_lock);

}

+ (HMFActivity)_currentActivity
{
  id v2;
  void *identifier;
  uint64_t v4;
  void *v5;

  v2 = (id)__manager;
  identifier = (void *)os_activity_get_identifier(MEMORY[0x1E0C80FC8], 0);
  if (identifier)
  {
    v4 = os_unfair_lock_lock_with_options();
    v5 = (void *)MEMORY[0x1A1AC355C](v4);
    NSMapGet(*((NSMapTable **)v2 + 2), identifier);
    identifier = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v5);
    os_unfair_lock_unlock((os_unfair_lock_t)v2 + 2);
    if ((objc_msgSend(identifier, "isValid") & 1) == 0)
    {

      identifier = 0;
    }
  }

  return (HMFActivity *)identifier;
}

- (HMFActivity)initWithIdentifier:(id)a3 name:(id)a4 parent:(id)a5 options:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  HMFActivity *v14;
  HMFActivity *v15;
  uint64_t v16;
  NSMutableSet *threadContexts;
  uint64_t v18;
  NSString *name;
  id v20;
  unint64_t options;
  void *v22;
  int v23;
  NSObject *v24;
  os_activity_flag_t v25;
  os_activity_t v26;
  OS_os_activity *internal;
  id v28;
  HMFActivity *v29;
  const void *identifier;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  HMFActivity *v36;
  void *v37;
  uint64_t v38;
  NSMutableDictionary *associatedObjects;
  NSMutableDictionary *v40;
  id v42;
  id v43;
  _QWORD v44[4];
  HMFActivity *v45;
  _QWORD block[4];
  HMFActivity *v47;
  objc_super v48;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v48.receiver = self;
  v48.super_class = (Class)HMFActivity;
  v14 = -[HMFActivity init](&v48, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_24;
  objc_storeStrong((id *)&v14->_identifier, a3);
  v15->_valid = 1;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v16 = objc_claimAutoreleasedReturnValue();
  threadContexts = v15->_threadContexts;
  v15->_threadContexts = (NSMutableSet *)v16;

  v18 = objc_msgSend(v12, "copy");
  name = v15->_name;
  v15->_name = (NSString *)v18;

  v15->_options = a6;
  if (!v13)
  {
    +[HMFActivity _currentActivity](HMFActivity, "_currentActivity");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_storeWeak((id *)&v15->_parent, v13);
  v20 = MEMORY[0x1E0C80FC8];
  options = v15->_options;
  v42 = v12;
  v43 = v11;
  if ((options & 8) != 0)
  {
    v23 = 2;
    v22 = (void *)MEMORY[0x1E0C80FE0];
    goto LABEL_9;
  }
  if (v13)
  {
    v22 = (void *)*((_QWORD *)v13 + 1);
    if (v22)
    {
      v23 = 0;
LABEL_9:
      v24 = v22;

      options = v15->_options;
      goto LABEL_11;
    }
  }
  v23 = 2;
  v24 = MEMORY[0x1E0C80FC8];
LABEL_11:
  if ((options & 4) != 0)
    v25 = OS_ACTIVITY_FLAG_DETACHED;
  else
    v25 = v23;
  v26 = _os_activity_create(&dword_19B546000, "HMFActivity", v24, v25);
  internal = v15->_internal;
  v15->_internal = (OS_os_activity *)v26;

  v28 = (id)__manager;
  v29 = v15;
  identifier = (const void *)os_activity_get_identifier((os_activity_t)v15->_internal, 0);
  v31 = os_unfair_lock_lock_with_options();
  v32 = (void *)MEMORY[0x1A1AC355C](v31);
  NSMapInsert(*((NSMapTable **)v28 + 2), identifier, v29);
  objc_autoreleasePoolPop(v32);
  os_unfair_lock_unlock((os_unfair_lock_t)v28 + 2);

  v33 = (void *)MEMORY[0x1A1AC355C]();
  v34 = v15->_internal;
  v35 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HMFActivity_initWithIdentifier_name_parent_options___block_invoke;
  block[3] = &unk_1E3B37AF8;
  v36 = v29;
  v47 = v36;
  os_activity_apply(v34, block);

  objc_autoreleasePoolPop(v33);
  if (v13)
  {
    os_unfair_lock_lock_with_options();
    v37 = (void *)objc_msgSend(*((id *)v13 + 5), "copy");
    os_unfair_lock_unlock((os_unfair_lock_t)v13 + 8);
    if (v37)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v37);
      v38 = objc_claimAutoreleasedReturnValue();
      associatedObjects = v36->_associatedObjects;
      v36->_associatedObjects = (NSMutableDictionary *)v38;

      v44[0] = v35;
      v44[1] = 3221225472;
      v44[2] = __54__HMFActivity_initWithIdentifier_name_parent_options___block_invoke_2;
      v44[3] = &unk_1E3B386A0;
      v45 = v36;
      objc_msgSend(v37, "enumerateKeysAndObjectsUsingBlock:", v44);
      if (!-[NSMutableDictionary count](v36->_associatedObjects, "count"))
      {
        v40 = v36->_associatedObjects;
        v36->_associatedObjects = 0;

      }
      v12 = v42;
      goto LABEL_21;
    }
  }
  else
  {
    v37 = 0;
  }
  v12 = v42;
LABEL_21:
  v11 = v43;
  if ((v15->_options & 0x10) == 0)
  {
    -[HMFActivity start]((os_unfair_lock_s *)v36);
    __HMFActivityBegin(v36);
  }

LABEL_24:
  return v15;
}

+ (id)logCategory
{
  if (qword_1ED013070 != -1)
    dispatch_once(&qword_1ED013070, &__block_literal_global_47);
  return (id)qword_1ED013078;
}

- (NSString)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFActivity name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFActivity identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ (%@)"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)start
{
  void *v2;
  void *v3;
  os_unfair_lock_s *v4;
  NSObject *v5;
  _BOOL4 v6;
  os_unfair_lock_s *v7;
  NSObject *v8;
  id *v9;
  void *v10;
  os_signpost_id_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMFMemoryAssertion *v27;
  os_unfair_lock_s *v28;
  NSObject *v29;
  void *v30;
  HMFPowerAssertion *v31;
  void *v32;
  os_unfair_lock_s *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *context;
  os_unfair_lock_s *lock;
  _QWORD block[5];
  os_signpost_id_t v42;
  _BYTE buf[22];
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (a1 && (-[os_unfair_lock_s hasStarted](a1, "hasStarted") & 1) == 0)
  {
    NSStringFromSelector(sel_hasStarted);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[os_unfair_lock_s willChangeValueForKey:](a1, "willChangeValueForKey:", v2);

    lock = a1 + 8;
    os_unfair_lock_lock_with_options();
    *(_QWORD *)&a1[24]._os_unfair_lock_opaque = mach_continuous_time();
    -[os_unfair_lock_s parent](a1, "parent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = a1;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = os_signpost_enabled(v5);
    if (v6)
    {
      v7 = v4;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();

      v9 = v7;
      v42 = 0;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v9[7], "getUUIDBytes:", buf);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", buf, 16, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "getBytes:range:", &v42, objc_msgSend(v10, "length") - 8, 8);

      if (v42 + 1 >= 2)
        v11 = v42;
      else
        v11 = 0xEEEEB0B5B2B2EEEELL;

      if (os_signpost_enabled(v8))
      {
        objc_msgSend(v9, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUIDString");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "UUIDString");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v15;
        v44 = 2112;
        v45 = v16;
        _os_signpost_emit_with_name_impl(&dword_19B546000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v11, "HMFActivity", "Identifier = %@, Parent = %@, Name = %@", buf, 0x20u);

      }
    }
    v17 = (void *)MEMORY[0x1A1AC355C]();
    v18 = *(NSObject **)&v4[2]._os_unfair_lock_opaque;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __20__HMFActivity_start__block_invoke;
    block[3] = &unk_1E3B37AF8;
    block[4] = v4;
    os_activity_apply(v18, block);
    objc_autoreleasePoolPop(v17);
    v19 = -[os_unfair_lock_s options](v4, "options");
    if ((v19 & 4) != 0
      || (-[os_unfair_lock_s shortDescription](v4, "shortDescription"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "markWithFormat:", CFSTR("Started child activity: %@"), v20),
          v20,
          v19))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0CB3940];
      -[os_unfair_lock_s name](v4, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[os_unfair_lock_s identifier](v4, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "UUIDString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("%@.%@"), v23, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if ((v19 & 1) != 0)
      {
        v27 = -[HMFMemoryAssertion initWithName:]([HMFMemoryAssertion alloc], "initWithName:", v26);
        if (v27)
        {
          objc_msgSend(v21, "addObject:", v27);
        }
        else
        {
          context = (void *)MEMORY[0x1A1AC355C]();
          v28 = v4;
          HMFGetOSLogHandle();
          v29 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier(v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v30;
            _os_log_impl(&dword_19B546000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to create memory assertion", buf, 0xCu);

          }
          objc_autoreleasePoolPop(context);
        }

      }
      if ((v19 & 2) != 0)
      {
        v31 = -[HMFPowerAssertion initWithName:]([HMFPowerAssertion alloc], "initWithName:", v26);
        if (v31)
        {
          objc_msgSend(v21, "addObject:", v31);
        }
        else
        {
          v32 = (void *)MEMORY[0x1A1AC355C]();
          v33 = v4;
          HMFGetOSLogHandle();
          v34 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier(v33);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v35;
            _os_log_impl(&dword_19B546000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to create power assertion", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v32);
        }

      }
      if ((objc_msgSend(v21, "hmf_isEmpty") & 1) == 0)
      {
        v36 = objc_msgSend(v21, "copy");
        v37 = *(void **)&v4[22]._os_unfair_lock_opaque;
        *(_QWORD *)&v4[22]._os_unfair_lock_opaque = v36;

      }
    }

    os_unfair_lock_unlock(lock);
    NSStringFromSelector(sel_hasStarted);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[os_unfair_lock_s didChangeValueForKey:](v4, "didChangeValueForKey:", v38);

  }
}

- (BOOL)hasStarted
{
  HMFActivity *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v2)
    LOBYTE(v2) = v2->_startMachTime != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (HMFActivity)parent
{
  return (HMFActivity *)objc_loadWeakRetained((id *)&self->_parent);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)markWithFormat:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v7);

  -[HMFActivity markWithReason:](self, "markWithReason:", v6);
}

- (BOOL)isValid
{
  HMFActivity *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_valid;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

void __54__HMFActivity_initWithIdentifier_name_parent_options___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) & 4) != 0)
    v2 = voucher_copy_without_importance();
  else
    v2 = voucher_copy();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

}

void __20__HMFActivity_start__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC355C]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_19B546000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Started", (uint8_t *)&v6, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
}

uint64_t __53__HMFActivity_activityWithName_parent_options_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (HMFActivity)activityWithName:(id)a3 block:(id)a4
{
  return (HMFActivity *)objc_msgSend(a1, "activityWithName:parent:options:block:", a3, 0, 0, a4);
}

+ (NSString)currentClientMetricIdentifier
{
  void *v2;
  void *v3;

  +[HMFActivity _currentActivity](HMFActivity, "_currentActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientMetricIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)clientMetricIdentifier
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__HMFActivity_ClientMetricIdentifier__clientMetricIdentifier__block_invoke;
  v4[3] = &unk_1E3B38FD0;
  v4[4] = self;
  v4[5] = &v5;
  -[HMFActivity synchronizeWithActivityLock:](self, "synchronizeWithActivityLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (void)setClientMetricIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__HMFActivity_ClientMetricIdentifier__setClientMetricIdentifier___block_invoke;
  v6[3] = &unk_1E3B37CA8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HMFActivity synchronizeWithActivityLock:](self, "synchronizeWithActivityLock:", v6);

}

- (void)synchronizeWithActivityLock:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  os_unfair_lock_lock_with_options();
  v4[2]();
  os_unfair_lock_unlock(&self->_lock);

}

void __65__HMFActivity_ClientMetricIdentifier__setClientMetricIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_associatedObjectForKey:", CFSTR("HMFClientMetricIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x1A1AC355C]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138543874;
      v9 = v6;
      v10 = 2112;
      v11 = v2;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_19B546000, v5, OS_LOG_TYPE_ERROR, "%{public}@Using existing clientMetricIdentifier: %@ and dropping: %@", (uint8_t *)&v8, 0x20u);

    }
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_setAssociatedObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("HMFClientMetricIdentifier"));
  }

}

- (id)_associatedObjectForKey:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  -[NSMutableDictionary objectForKey:](self->_associatedObjects, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_setAssociatedObject:(id)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *associatedObjects;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  associatedObjects = self->_associatedObjects;
  if (!associatedObjects)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = self->_associatedObjects;
    self->_associatedObjects = v8;

    associatedObjects = self->_associatedObjects;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](associatedObjects, "setObject:forKeyedSubscript:", v10, v6);

}

void __61__HMFActivity_ClientMetricIdentifier__clientMetricIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_associatedObjectForKey:", CFSTR("HMFClientMetricIdentifier"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)begin
{
  -[HMFActivity start]((os_unfair_lock_s *)self);
  os_unfair_lock_lock_with_options();
  __HMFActivityBegin(self);
  os_unfair_lock_unlock(&self->_lock);
}

- (id)blockWithQualityOfService:(int64_t)a3 block:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  if (!v5)
    _HMFPreconditionFailure(CFSTR("block"));
  v6 = v5;
  -[HMFActivity start]((os_unfair_lock_s *)self);
  v7 = (void *)dispatch_block_create_with_voucher_and_qos_class();

  return v7;
}

+ (HMFActivity)activityWithName:(id)a3 parent:(id)a4 options:(unint64_t)a5 block:(id)a6
{
  id v9;
  id v10;
  void *v11;
  HMFActivity *v12;
  NSObject *internal;
  id v14;
  HMFActivity *result;
  id v16;
  _QWORD block[4];
  id v18;

  v16 = a3;
  v9 = a4;
  v10 = a6;
  v11 = (void *)MEMORY[0x1A1AC355C]();
  v12 = -[HMFActivity initWithName:parent:options:]([HMFActivity alloc], "initWithName:parent:options:", v16, v9, a5);
  internal = v12->_internal;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__HMFActivity_activityWithName_parent_options_block___block_invoke;
  block[3] = &unk_1E3B38630;
  v14 = v10;
  v18 = v14;
  os_activity_apply(internal, block);
  -[HMFActivity invalidate](v12, "invalidate");

  objc_autoreleasePoolPop(v11);
  return result;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  HMFActivity *v4;
  const void *identifier;
  uint64_t v6;
  void *v7;
  id v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_valid)
  {
    self->_valid = 0;
    __HMFActivityInvalidate(self);
  }
  os_unfair_lock_unlock(p_lock);
  v8 = (id)__manager;
  v4 = self;
  identifier = (const void *)os_activity_get_identifier((os_activity_t)v4->_internal, 0);
  v6 = os_unfair_lock_lock_with_options();
  v7 = (void *)MEMORY[0x1A1AC355C](v6);
  NSMapRemove(*((NSMapTable **)v8 + 2), identifier);
  objc_autoreleasePoolPop(v7);
  os_unfair_lock_unlock((os_unfair_lock_t)v8 + 2);

}

+ (void)initialize
{
  __HMFActivityManager *v2;
  void *v3;

  v2 = objc_alloc_init(__HMFActivityManager);
  v3 = (void *)__manager;
  __manager = (uint64_t)v2;

}

void __26__HMFActivity_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("Activity"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED013078;
  qword_1ED013078 = v0;

}

+ (HMFActivity)activityWithName:(id)a3 parent:(id)a4 block:(id)a5
{
  return (HMFActivity *)objc_msgSend(a1, "activityWithName:parent:options:block:", a3, a4, 0, a5);
}

+ (id)bundleIdentifier
{
  if (qword_1ED013068 != -1)
    dispatch_once(&qword_1ED013068, &__block_literal_global_19);
  return (id)_MergedGlobals_7;
}

void __31__HMFActivity_bundleIdentifier__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1A1AC355C]();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_7;
  _MergedGlobals_7 = v2;

  objc_autoreleasePoolPop(v0);
}

+ (void)markCurrentActivity
{
  id v2;

  objc_msgSend(a1, "currentActivityForMarking");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mark");

}

+ (void)markCurrentActivityWithReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "currentActivityForMarking");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markWithReason:", v4);

}

+ (void)markCurrentActivityWithFormat:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "currentActivityForMarking");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v4, &v7);

  objc_msgSend(v5, "markWithReason:", v6);
}

- (HMFActivity)init
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

- (HMFActivity)initWithName:(id)a3 parent:(id)a4
{
  return -[HMFActivity initWithName:parent:options:](self, "initWithName:parent:options:", a3, a4, 0);
}

- (HMFActivity)initWithIdentifier:(id)a3 name:(id)a4 parent:(id)a5 assertions:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMFActivity *v14;
  HMFActivity *v15;
  uint64_t v16;
  NSArray *internalAssertions;
  HMFActivity *v18;
  _QWORD v20[4];
  HMFActivity *v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!objc_msgSend(v13, "count"))
    _HMFPreconditionFailure(CFSTR("assertions.count"));
  v14 = -[HMFActivity initWithIdentifier:name:parent:options:](self, "initWithIdentifier:name:parent:options:", v10, v11, v12, 0);
  if (v14->_internalAssertions)
    _HMFPreconditionFailure(CFSTR("nil == self->_internalAssertions"));
  v15 = v14;
  v16 = objc_msgSend(v13, "copy");
  internalAssertions = v15->_internalAssertions;
  v15->_internalAssertions = (NSArray *)v16;

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __57__HMFActivity_initWithIdentifier_name_parent_assertions___block_invoke;
  v20[3] = &unk_1E3B38678;
  v18 = v15;
  v21 = v18;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v20);

  return v18;
}

void __57__HMFActivity_initWithIdentifier_name_parent_assertions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "acquire:", 0) & 1) == 0)
  {
    v4 = (void *)MEMORY[0x1A1AC355C]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unable to acquire the assertion : %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __54__HMFActivity_initWithIdentifier_name_parent_options___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a3, "objectForChildActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKey:", v5, v6);

}

- (NSArray)attributeDescriptions
{
  HMFAttributeDescription *v3;
  void *v4;
  void *v5;
  void *v6;
  HMFAttributeDescription *v7;
  HMFAttributeDescription *v8;
  unint64_t v9;
  char v10;
  void *v11;
  void *v12;
  __CFString *v13;
  HMFAttributeDescription *v14;
  HMFAttributeDescription *v15;
  void *v16;
  HMFAttributeDescription *v17;
  void *v18;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v3 = [HMFAttributeDescription alloc];
  -[HMFActivity parent](self, "parent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMFAttributeDescription initWithName:value:](v3, "initWithName:value:", CFSTR("Parent"), v6);
  v8 = [HMFAttributeDescription alloc];
  v9 = -[HMFActivity assertions](self, "assertions", v7);
  if (v9)
  {
    v10 = v9;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((v10 & 1) != 0)
      objc_msgSend(v11, "addObject:", CFSTR("Memory"));
    if ((v10 & 2) != 0)
      objc_msgSend(v12, "addObject:", CFSTR("Power"));
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = CFSTR("Unknown");
    }

  }
  else
  {
    v13 = CFSTR("None");
  }
  v14 = -[HMFAttributeDescription initWithName:value:](v8, "initWithName:value:", CFSTR("Assertions"), v13);
  v20[1] = v14;
  v15 = [HMFAttributeDescription alloc];
  HMFBooleanToString(-[HMFActivity isValid](self, "isValid"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HMFAttributeDescription initWithName:value:](v15, "initWithName:value:", CFSTR("Valid"), v16);
  v20[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v18;
}

- (unint64_t)assertions
{
  return self->_options & 3;
}

- (void)mark
{
  -[HMFActivity markWithReason:](self, "markWithReason:", 0);
}

- (id)blockWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure(CFSTR("block"));
  v5 = v4;
  -[HMFActivity start]((os_unfair_lock_s *)self);
  v6 = (void *)dispatch_block_create_with_voucher();

  return v6;
}

- (void)performBlock:(id)a3
{
  id v4;
  void (**v5)(void);

  if (a3)
  {
    v4 = a3;
    -[HMFActivity start]((os_unfair_lock_s *)self);
    -[HMFActivity blockWithBlock:](self, "blockWithBlock:", v4);
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();

    v5[2]();
  }
}

- (id)logIdentifier
{
  void *v2;
  NSString *name;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  name = self->_name;
  -[NSUUID UUIDString](self->_identifier, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (%@)"), name, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
