@implementation BKSHIDEventDeliveryManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8653 != -1)
    dispatch_once(&sharedInstance_onceToken_8653, &__block_literal_global_89);
  return (id)sharedInstance___sharedInstance;
}

void __49__BKSHIDEventDeliveryManager__lock_implicitFlush__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 216);
  *(_QWORD *)(v2 + 216) = 0;
  v4 = v3;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
  objc_msgSend(v4, "invalidate");

}

void __71__BKSHIDEventDeliveryManager_bufferEventsMatchingPredicate_withReason___block_invoke(uint64_t a1, void *a2)
{
  const os_unfair_lock *v3;
  id v4;

  v3 = (const os_unfair_lock *)(*(_QWORD *)(a1 + 32) + 20);
  v4 = a2;
  os_unfair_lock_assert_not_owner(v3);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_lock_implicitFlush");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
}

void __79__BKSHIDEventDeliveryManager_deferEventsMatchingPredicate_toTarget_withReason___block_invoke(uint64_t a1, void *a2)
{
  const os_unfair_lock *v3;
  id v4;

  v3 = (const os_unfair_lock *)(*(_QWORD *)(a1 + 32) + 20);
  v4 = a2;
  os_unfair_lock_assert_not_owner(v3);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_lock_implicitFlush");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
}

- (id)bufferEventsMatchingPredicate:(id)a3 withReason:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  objc_class *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  void *v49;
  objc_class *v50;
  void *v51;
  void *v52;
  void *v53;
  objc_class *v54;
  void *v55;
  _QWORD v56[5];
  id v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  BKSHIDEventDeliveryManager *v63;
  __int16 v64;
  const __CFString *v65;
  __int16 v66;
  int v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v7;
  if (!v9)
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("predicate"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v59 = v26;
      v60 = 2114;
      v61 = v28;
      v62 = 2048;
      v63 = self;
      v64 = 2114;
      v65 = CFSTR("BKSHIDEventDeliveryManager.m");
      v66 = 1024;
      v67 = 271;
      v68 = 2114;
      v69 = v25;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0FB3A0);
  }
  v10 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v29 = (void *)MEMORY[0x1E0CB3940];
    v30 = (objc_class *)objc_msgSend(v10, "classForCoder");
    if (!v30)
      v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("predicate"), v31, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v59 = v35;
      v60 = 2114;
      v61 = v37;
      v62 = 2048;
      v63 = self;
      v64 = 2114;
      v65 = CFSTR("BKSHIDEventDeliveryManager.m");
      v66 = 1024;
      v67 = 271;
      v68 = 2114;
      v69 = v34;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0FB4DCLL);
  }

  v11 = v8;
  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = (objc_class *)objc_opt_class();
  if (!v11)
  {
    NSStringFromClass(v13);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("reason"), v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v59 = v40;
      v60 = 2114;
      v61 = v42;
      v62 = 2048;
      v63 = self;
      v64 = 2114;
      v65 = CFSTR("BKSHIDEventDeliveryManager.m");
      v66 = 1024;
      v67 = 272;
      v68 = 2114;
      v69 = v39;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v39), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0FB5E4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v43 = (void *)MEMORY[0x1E0CB3940];
    v44 = (objc_class *)objc_msgSend(v11, "classForCoder");
    if (!v44)
      v44 = (objc_class *)objc_opt_class();
    NSStringFromClass(v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (objc_class *)objc_opt_class();
    NSStringFromClass(v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("reason"), v45, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (objc_class *)objc_opt_class();
      NSStringFromClass(v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v59 = v49;
      v60 = 2114;
      v61 = v51;
      v62 = 2048;
      v63 = self;
      v64 = 2114;
      v65 = CFSTR("BKSHIDEventDeliveryManager.m");
      v66 = 1024;
      v67 = 272;
      v68 = 2114;
      v69 = v48;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v48), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0FB71CLL);
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = self->_lock_bufferingSeed + 1;
  self->_lock_bufferingSeed = v15;
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%li-buffer: %@"), v15, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_lock_bufferingPredicates, "objectForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wow! we've got duplicate buffering keys!!! new=%@ existing=%@ : predicate=%@"), v16, self->_lock_bufferingPredicates, v10);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (objc_class *)objc_opt_class();
      NSStringFromClass(v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v59 = v53;
      v60 = 2114;
      v61 = v55;
      v62 = 2048;
      v63 = self;
      v64 = 2114;
      v65 = CFSTR("BKSHIDEventDeliveryManager.m");
      v66 = 1024;
      v67 = 278;
      v68 = 2114;
      v69 = v52;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v52), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0FB810);
  }
  -[NSMutableDictionary setObject:forKey:](self->_lock_bufferingPredicates, "setObject:forKey:", v10, v16);
  -[BKSHIDEventDeliveryManager _lock_implicitFlush](self, "_lock_implicitFlush");
  v18 = objc_alloc(MEMORY[0x1E0D01868]);
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __71__BKSHIDEventDeliveryManager_bufferEventsMatchingPredicate_withReason___block_invoke;
  v56[3] = &unk_1E1EA1378;
  v56[4] = self;
  v57 = v16;
  v19 = v16;
  v20 = (void *)objc_msgSend(v18, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("com.apple.backboard.hid.delivery.buffering"), v19, v56);
  -[NSHashTable addObject:](self->_lock_assertions, "addObject:", v20);
  os_unfair_lock_unlock(&self->_lock);
  os_unfair_lock_assert_not_owner(&self->_lock);

  return v20;
}

- (id)deferEventsMatchingPredicate:(id)a3 toTarget:(id)a4 withReason:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  objc_class *v18;
  unsigned int lock_deferringSeed;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  objc_class *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_class *v48;
  void *v49;
  void *v50;
  objc_class *v51;
  void *v52;
  objc_class *v53;
  void *v54;
  void *v55;
  void *v56;
  objc_class *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  objc_class *v62;
  void *v63;
  void *v64;
  objc_class *v65;
  void *v66;
  objc_class *v67;
  void *v68;
  void *v69;
  void *v70;
  objc_class *v71;
  void *v72;
  void *v73;
  void *v74;
  objc_class *v75;
  void *v76;
  _QWORD v77[5];
  id v78;
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  BKSHIDEventDeliveryManager *v84;
  __int16 v85;
  const __CFString *v86;
  __int16 v87;
  int v88;
  __int16 v89;
  void *v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v9;
  if (!v12)
  {
    v27 = (void *)MEMORY[0x1E0CB3940];
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("predicate"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v80 = v31;
      v81 = 2114;
      v82 = v33;
      v83 = 2048;
      v84 = self;
      v85 = 2114;
      v86 = CFSTR("BKSHIDEventDeliveryManager.m");
      v87 = 1024;
      v88 = 188;
      v89 = 2114;
      v90 = v30;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0FBB7CLL);
  }
  v13 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v34 = (void *)MEMORY[0x1E0CB3940];
    v35 = (objc_class *)objc_msgSend(v13, "classForCoder");
    if (!v35)
      v35 = (objc_class *)objc_opt_class();
    NSStringFromClass(v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("predicate"), v36, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v80 = v40;
      v81 = 2114;
      v82 = v42;
      v83 = 2048;
      v84 = self;
      v85 = 2114;
      v86 = CFSTR("BKSHIDEventDeliveryManager.m");
      v87 = 1024;
      v88 = 188;
      v89 = 2114;
      v90 = v39;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v39), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0FBCB8);
  }

  v14 = v10;
  if (!v14)
  {
    v43 = (void *)MEMORY[0x1E0CB3940];
    v44 = (objc_class *)objc_opt_class();
    NSStringFromClass(v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("target"), v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (objc_class *)objc_opt_class();
      NSStringFromClass(v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v80 = v47;
      v81 = 2114;
      v82 = v49;
      v83 = 2048;
      v84 = self;
      v85 = 2114;
      v86 = CFSTR("BKSHIDEventDeliveryManager.m");
      v87 = 1024;
      v88 = 189;
      v89 = 2114;
      v90 = v46;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v46), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0FBDD0);
  }
  v15 = v14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v50 = (void *)MEMORY[0x1E0CB3940];
    v51 = (objc_class *)objc_msgSend(v15, "classForCoder");
    if (!v51)
      v51 = (objc_class *)objc_opt_class();
    NSStringFromClass(v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (objc_class *)objc_opt_class();
    NSStringFromClass(v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("target"), v52, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (objc_class *)objc_opt_class();
      NSStringFromClass(v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v80 = v56;
      v81 = 2114;
      v82 = v58;
      v83 = 2048;
      v84 = self;
      v85 = 2114;
      v86 = CFSTR("BKSHIDEventDeliveryManager.m");
      v87 = 1024;
      v88 = 189;
      v89 = 2114;
      v90 = v55;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v55), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0FBF0CLL);
  }

  v16 = v11;
  v17 = (void *)MEMORY[0x1E0CB3940];
  v18 = (objc_class *)objc_opt_class();
  if (!v16)
  {
    NSStringFromClass(v18);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("reason"), v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = (objc_class *)objc_opt_class();
      NSStringFromClass(v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v80 = v61;
      v81 = 2114;
      v82 = v63;
      v83 = 2048;
      v84 = self;
      v85 = 2114;
      v86 = CFSTR("BKSHIDEventDeliveryManager.m");
      v87 = 1024;
      v88 = 190;
      v89 = 2114;
      v90 = v60;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v60), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0FC014);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v64 = (void *)MEMORY[0x1E0CB3940];
    v65 = (objc_class *)objc_msgSend(v16, "classForCoder");
    if (!v65)
      v65 = (objc_class *)objc_opt_class();
    NSStringFromClass(v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (objc_class *)objc_opt_class();
    NSStringFromClass(v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("reason"), v66, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = (objc_class *)objc_opt_class();
      NSStringFromClass(v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v80 = v70;
      v81 = 2114;
      v82 = v72;
      v83 = 2048;
      v84 = self;
      v85 = 2114;
      v86 = CFSTR("BKSHIDEventDeliveryManager.m");
      v87 = 1024;
      v88 = 190;
      v89 = 2114;
      v90 = v69;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v69), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0FC14CLL);
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  lock_deferringSeed = self->_lock_deferringSeed;
  if (lock_deferringSeed + 1 > 1)
    v20 = lock_deferringSeed + 1;
  else
    v20 = 1;
  self->_lock_deferringSeed = v20;
  +[BKSHIDEventDeferringRule ruleForDeferringEventsMatchingPredicate:toTarget:withReason:seed:pid:](BKSHIDEventDeferringRule, "ruleForDeferringEventsMatchingPredicate:toTarget:withReason:seed:pid:", v13, v15, v16, v20, getpid());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray containsObject:](self->_lock_deferringRules, "containsObject:", v21))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wow! we've got duplicate deferring rules!!! new=%@ existing=%@"), v21, self->_lock_deferringRules);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = (objc_class *)objc_opt_class();
      NSStringFromClass(v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v80 = v74;
      v81 = 2114;
      v82 = v76;
      v83 = 2048;
      v84 = self;
      v85 = 2114;
      v86 = CFSTR("BKSHIDEventDeliveryManager.m");
      v87 = 1024;
      v88 = 201;
      v89 = 2114;
      v90 = v73;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v73), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0FC23CLL);
  }
  -[NSMutableArray addObject:](self->_lock_deferringRules, "addObject:", v21);
  -[BKSHIDEventDeliveryManager _lock_implicitFlush](self, "_lock_implicitFlush");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%X-defer: %@"), self->_lock_deferringSeed, v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_alloc(MEMORY[0x1E0D01868]);
  v77[0] = MEMORY[0x1E0C809B0];
  v77[1] = 3221225472;
  v77[2] = __79__BKSHIDEventDeliveryManager_deferEventsMatchingPredicate_toTarget_withReason___block_invoke;
  v77[3] = &unk_1E1EA1378;
  v77[4] = self;
  v78 = v21;
  v24 = v21;
  v25 = (void *)objc_msgSend(v23, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("com.apple.backboard.hid.delivery.delivery"), v22, v77);
  -[NSHashTable addObject:](self->_lock_assertions, "addObject:", v25);
  os_unfair_lock_unlock(&self->_lock);

  return v25;
}

void __67__BKSHIDEventDeliveryManager__lock_transactionAssertionWithReason___block_invoke(uint64_t a1, void *a2)
{
  const os_unfair_lock *v3;
  id v4;

  v3 = (const os_unfair_lock *)(*(_QWORD *)(a1 + 32) + 20);
  v4 = a2;
  os_unfair_lock_assert_not_owner(v3);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_lock_flushIfNeeded");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
}

- (void)_lock_flushIfNeeded
{
  __CFBoolean *v3;
  BKSHIDEventDeliveryRuleChangeTransaction *v4;
  NSObject *v5;
  NSMutableSet *lock_discreteDispatchingRoots;
  NSSet *v7;
  NSSet *lock_lastSentDiscreteDispatchingRoots;
  void *v9;
  NSSet *v10;
  NSSet *lock_lastSentKeyCommandsDispatchingRoots;
  void *v12;
  NSArray *v13;
  NSArray *lock_lastSentDeferringRules;
  NSDictionary *v15;
  NSDictionary *lock_lastSentKeyCommandsRegistrations;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  int v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = (__CFBoolean *)*MEMORY[0x1E0C9AE40];
  if (self->_lock_needsFlush != (__CFBoolean *)*MEMORY[0x1E0C9AE40]
    && !-[BSMutableIntegerMap count](self->_lock_preventFlushingReasons, "count"))
  {
    self->_lock_needsFlush = v3;
    v4 = objc_alloc_init(BKSHIDEventDeliveryRuleChangeTransaction);
    if ((BSEqualObjects() & 1) == 0)
    {
      BKLogEventDelivery();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        lock_discreteDispatchingRoots = self->_lock_discreteDispatchingRoots;
        v32 = 138543362;
        v33 = lock_discreteDispatchingRoots;
        _os_log_impl(&dword_18A0F0000, v5, OS_LOG_TYPE_DEFAULT, "flushing discrete rule change: %{public}@", (uint8_t *)&v32, 0xCu);
      }

      v7 = (NSSet *)-[NSMutableSet copy](self->_lock_discreteDispatchingRoots, "copy");
      lock_lastSentDiscreteDispatchingRoots = self->_lock_lastSentDiscreteDispatchingRoots;
      self->_lock_lastSentDiscreteDispatchingRoots = v7;

      -[NSMutableSet allObjects](self->_lock_discreteDispatchingRoots, "allObjects");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKSHIDEventDeliveryRuleChangeTransaction setDiscreteDispatchingRules:](v4, "setDiscreteDispatchingRules:", v9);

    }
    if ((BSEqualObjects() & 1) == 0)
    {
      v10 = (NSSet *)-[NSMutableSet copy](self->_lock_keyCommandsDispatchingRoots, "copy");
      lock_lastSentKeyCommandsDispatchingRoots = self->_lock_lastSentKeyCommandsDispatchingRoots;
      self->_lock_lastSentKeyCommandsDispatchingRoots = v10;

      -[NSMutableSet allObjects](self->_lock_keyCommandsDispatchingRoots, "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKSHIDEventDeliveryRuleChangeTransaction setKeyCommandDispatchingRules:](v4, "setKeyCommandDispatchingRules:", v12);

    }
    if ((BSEqualObjects() & 1) == 0)
    {
      v13 = (NSArray *)-[NSMutableArray copy](self->_lock_deferringRules, "copy");
      lock_lastSentDeferringRules = self->_lock_lastSentDeferringRules;
      self->_lock_lastSentDeferringRules = v13;

      -[BKSHIDEventDeliveryRuleChangeTransaction setDeferringRules:](v4, "setDeferringRules:", self->_lock_deferringRules);
    }
    if ((BSEqualObjects() & 1) == 0)
    {
      v15 = (NSDictionary *)-[NSMutableDictionary copy](self->_lock_keyCommandsRegistrations, "copy");
      lock_lastSentKeyCommandsRegistrations = self->_lock_lastSentKeyCommandsRegistrations;
      self->_lock_lastSentKeyCommandsRegistrations = v15;

      v17 = (void *)MEMORY[0x1E0C99E60];
      -[NSDictionary allValues](self->_lock_lastSentKeyCommandsRegistrations, "allValues");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setWithArray:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if ((-[NSSet isEqual:](self->_lock_lastSentSetOfKeyCommandsRegistrations, "isEqual:", v19) & 1) == 0)
      {
        objc_storeStrong((id *)&self->_lock_lastSentSetOfKeyCommandsRegistrations, v19);
        objc_msgSend(v19, "allObjects");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[BKSHIDEventDeliveryRuleChangeTransaction setKeyCommandsRegistrations:](v4, "setKeyCommandsRegistrations:", v20);

      }
    }
    v21 = (void *)MEMORY[0x1E0C99E60];
    -[NSMutableDictionary allValues](self->_lock_bufferingPredicates, "allValues");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if ((BSEqualObjects() & 1) == 0)
    {
      objc_storeStrong((id *)&self->_lock_lastSentBufferingPredicates, v23);
      objc_msgSend(v23, "allObjects");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKSHIDEventDeliveryRuleChangeTransaction setBufferingPredicates:](v4, "setBufferingPredicates:", v24);

    }
    v25 = (void *)MEMORY[0x1E0C99E60];
    -[NSMutableDictionary allValues](self->_lock_activeUIResponderPredicates, "allValues");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setWithArray:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if ((BSEqualObjects() & 1) == 0)
    {
      objc_storeStrong((id *)&self->_lock_lastSentActiveUIResponderPredicates, v23);
      objc_msgSend(v23, "allObjects");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKSHIDEventDeliveryRuleChangeTransaction setActiveUIResponders:](v4, "setActiveUIResponders:", v28);

    }
    v29 = -[BKSHIDEventDeliveryRuleChangeTransaction contentsMask](v4, "contentsMask");
    BKLogEventDelivery();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v29)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v32 = 138543362;
        v33 = v4;
        _os_log_impl(&dword_18A0F0000, v31, OS_LOG_TYPE_DEFAULT, "flushing changes: %{public}@", (uint8_t *)&v32, 0xCu);
      }

      -[BSServiceConnection remoteTarget](self->_serviceConnection, "remoteTarget");
      v31 = objc_claimAutoreleasedReturnValue();
      -[NSObject submitRuleChanges:](v31, "submitRuleChanges:", v4);
    }
    else if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v32) = 0;
      _os_log_debug_impl(&dword_18A0F0000, v31, OS_LOG_TYPE_DEBUG, "no-op flush", (uint8_t *)&v32, 2u);
    }

  }
}

- (id)_lock_transactionAssertionWithReason:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  BSMutableIntegerMap *lock_preventFlushingReasons;
  int64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  _QWORD v32[6];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  BKSHIDEventDeliveryManager *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  if (!v5)
  {
    NSStringFromClass(v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("reason"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v34 = v16;
      v35 = 2114;
      v36 = v18;
      v37 = 2048;
      v38 = self;
      v39 = 2114;
      v40 = CFSTR("BKSHIDEventDeliveryManager.m");
      v41 = 1024;
      v42 = 508;
      v43 = 2114;
      v44 = v15;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0FCA48);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    v20 = (objc_class *)objc_msgSend(v5, "classForCoder");
    if (!v20)
      v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("reason"), v21, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v34 = v25;
      v35 = 2114;
      v36 = v27;
      v37 = 2048;
      v38 = self;
      v39 = 2114;
      v40 = CFSTR("BKSHIDEventDeliveryManager.m");
      v41 = 1024;
      v42 = 508;
      v43 = 2114;
      v44 = v24;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0FCB80);
  }

  os_unfair_lock_assert_owner(&self->_lock);
  lock_preventFlushingReasons = self->_lock_preventFlushingReasons;
  v9 = self->_lock_preventFlushingSeed + 1;
  self->_lock_preventFlushingSeed = v9;
  -[BSMutableIntegerMap objectForKey:](lock_preventFlushingReasons, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wow! we've wrapped all the way back around!!! token=%li reason=%@ reasons=%@"), v9, v5, self->_lock_preventFlushingReasons);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v34 = v29;
      v35 = 2114;
      v36 = v31;
      v37 = 2048;
      v38 = self;
      v39 = 2114;
      v40 = CFSTR("BKSHIDEventDeliveryManager.m");
      v41 = 1024;
      v42 = 512;
      v43 = 2114;
      v44 = v28;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0FCC74);
  }
  -[BSMutableIntegerMap setObject:forKey:](self->_lock_preventFlushingReasons, "setObject:forKey:", v5, v9);
  v11 = objc_alloc(MEMORY[0x1E0D01868]);
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __67__BKSHIDEventDeliveryManager__lock_transactionAssertionWithReason___block_invoke;
  v32[3] = &unk_1E1EA13C0;
  v32[4] = self;
  v32[5] = v9;
  v12 = (void *)objc_msgSend(v11, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("com.apple.backboard.hid.delivery.transaction"), v5, v32);
  -[NSHashTable addObject:](self->_lock_assertions, "addObject:", v12);

  return v12;
}

- (void)_lock_implicitFlush
{
  BSInvalidatable *v3;
  BSInvalidatable *lock_implicitPreventFlushingAssertion;
  _QWORD block[5];

  os_unfair_lock_assert_owner(&self->_lock);
  self->_lock_needsFlush = (__CFBoolean *)*MEMORY[0x1E0C9AE50];
  if (!self->_lock_implicitPreventFlushingAssertion
    && !-[BSMutableIntegerMap count](self->_lock_preventFlushingReasons, "count"))
  {
    -[BKSHIDEventDeliveryManager _lock_transactionAssertionWithReason:](self, "_lock_transactionAssertionWithReason:", CFSTR("BKSHIDEventDeliveryManager-implicitFlush"));
    v3 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    lock_implicitPreventFlushingAssertion = self->_lock_implicitPreventFlushingAssertion;
    self->_lock_implicitPreventFlushingAssertion = v3;

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__BKSHIDEventDeliveryManager__lock_implicitFlush__block_invoke;
    block[3] = &unk_1E1EA15A8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (id)transactionAssertionWithReason:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  BKSHIDEventDeliveryManager *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  if (!v5)
  {
    NSStringFromClass(v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("reason"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v26 = v13;
      v27 = 2114;
      v28 = v15;
      v29 = 2048;
      v30 = self;
      v31 = 2114;
      v32 = CFSTR("BKSHIDEventDeliveryManager.m");
      v33 = 1024;
      v34 = 258;
      v35 = 2114;
      v36 = v12;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0FD184);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = (objc_class *)objc_msgSend(v5, "classForCoder");
    if (!v17)
      v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("reason"), v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v26 = v22;
      v27 = 2114;
      v28 = v24;
      v29 = 2048;
      v30 = self;
      v31 = 2114;
      v32 = CFSTR("BKSHIDEventDeliveryManager.m");
      v33 = 1024;
      v34 = 258;
      v35 = 2114;
      v36 = v21;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0FD2BCLL);
  }

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  -[BKSHIDEventDeliveryManager _lock_transactionAssertionWithReason:](self, "_lock_transactionAssertionWithReason:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  os_unfair_lock_assert_not_owner(p_lock);

  return v9;
}

void __49__BKSHIDEventDeliveryManager__lock_implicitFlush__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 184);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__BKSHIDEventDeliveryManager__lock_implicitFlush__block_invoke_2;
  block[3] = &unk_1E1EA15A8;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __44__BKSHIDEventDeliveryManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[BKSHIDEventDeliveryManager _initWithRemoteConnection]([BKSHIDEventDeliveryManager alloc], "_initWithRemoteConnection");
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

- (BKSHIDEventDeliveryManager)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDEventDeliveryManager *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSHIDEventDeliveryManager *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on BKSHIDEventDeliveryManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
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
    v16 = CFSTR("BKSHIDEventDeliveryManager.m");
    v17 = 1024;
    v18 = 99;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDEventDeliveryManager *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initForTestingWithService:(id)a3
{
  id v4;
  BKSHIDEventDeliveryManager *v5;
  BKSHIDEventDeliveryManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKSHIDEventDeliveryManager;
  v5 = -[BKSHIDEventDeliveryManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[BKSHIDEventDeliveryManager _coreSetUpWithServiceConnection:](v5, "_coreSetUpWithServiceConnection:", v4);
    v6->_forTesting = 1;
  }

  return v6;
}

- (id)_initWithRemoteConnection
{
  BKSHIDEventDeliveryManager *v2;
  void *v3;
  BKSHIDEventDeliveryManager *v4;
  _QWORD v6[4];
  BKSHIDEventDeliveryManager *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKSHIDEventDeliveryManager;
  v2 = -[BKSHIDEventDeliveryManager init](&v8, sel_init);
  if (v2)
  {
    +[BKSHIDServiceConnection clientConnectionForServiceWithName:](BKSHIDServiceConnection, "clientConnectionForServiceWithName:", CFSTR("BKHIDEventDeliveryManager"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__BKSHIDEventDeliveryManager__initWithRemoteConnection__block_invoke;
    v6[3] = &unk_1E1EA1868;
    v4 = v2;
    v7 = v4;
    objc_msgSend(v3, "configureConnection:", v6);
    -[BKSHIDEventDeliveryManager _coreSetUpWithServiceConnection:](v4, "_coreSetUpWithServiceConnection:", v3);
    objc_msgSend(v3, "activate");

  }
  return v2;
}

- (void)_coreSetUpWithServiceConnection:(id)a3
{
  id v5;
  void *v6;
  BSServiceConnection *serviceConnection;
  NSHashTable *v8;
  NSHashTable *lock_assertions;
  NSMutableSet *v10;
  NSMutableSet *lock_discreteDispatchingRoots;
  NSSet *v12;
  NSSet *lock_lastSentDiscreteDispatchingRoots;
  NSMutableSet *v14;
  NSMutableSet *lock_keyCommandsDispatchingRoots;
  NSSet *v16;
  NSSet *lock_lastSentKeyCommandsDispatchingRoots;
  NSMutableArray *v18;
  NSMutableArray *lock_deferringRules;
  NSMutableDictionary *v20;
  NSMutableDictionary *lock_keyCommandsRegistrations;
  NSObject *v22;
  OS_dispatch_queue *v23;
  OS_dispatch_queue *implicitFlushQueue;
  BSMutableIntegerMap *v25;
  BSMutableIntegerMap *lock_preventFlushingReasons;
  NSMutableDictionary *v27;
  NSMutableDictionary *lock_bufferingPredicates;
  NSSet *v29;
  NSSet *lock_lastSentBufferingPredicates;
  NSSet *v31;
  NSSet *lock_lastSentActiveUIResponderPredicates;
  NSArray *v33;
  NSArray *lock_lastSentDeferringRules;
  NSDictionary *v35;
  NSDictionary *lock_lastSentKeyCommandsRegistrations;
  NSSet *v37;
  NSSet *lock_lastSentSetOfKeyCommandsRegistrations;
  void *v39;
  objc_class *v40;
  void *v41;
  void *v42;
  void *v43;
  objc_class *v44;
  void *v45;
  void *v46;
  objc_class *v47;
  void *v48;
  objc_class *v49;
  void *v50;
  void *v51;
  void *v52;
  objc_class *v53;
  void *v54;
  id v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  BKSHIDEventDeliveryManager *v61;
  __int16 v62;
  const __CFString *v63;
  __int16 v64;
  int v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    v39 = (void *)MEMORY[0x1E0CB3940];
    objc_opt_class();
    v40 = (objc_class *)objc_opt_class();
    NSStringFromClass(v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("serviceConnection"), v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (objc_class *)objc_opt_class();
      NSStringFromClass(v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v57 = v43;
      v58 = 2114;
      v59 = v45;
      v60 = 2048;
      v61 = self;
      v62 = 2114;
      v63 = CFSTR("BKSHIDEventDeliveryManager.m");
      v64 = 1024;
      v65 = 146;
      v66 = 2114;
      v67 = v42;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v42), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A13F534);
  }
  v6 = v5;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v46 = (void *)MEMORY[0x1E0CB3940];
    v47 = (objc_class *)objc_msgSend(v6, "classForCoder");
    if (!v47)
      v47 = (objc_class *)objc_opt_class();
    NSStringFromClass(v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v49 = (objc_class *)objc_opt_class();
    NSStringFromClass(v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("serviceConnection"), v48, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (objc_class *)objc_opt_class();
      NSStringFromClass(v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v57 = v52;
      v58 = 2114;
      v59 = v54;
      v60 = 2048;
      v61 = self;
      v62 = 2114;
      v63 = CFSTR("BKSHIDEventDeliveryManager.m");
      v64 = 1024;
      v65 = 146;
      v66 = 2114;
      v67 = v51;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v51), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A13F674);
  }

  serviceConnection = self->_serviceConnection;
  self->_serviceConnection = (BSServiceConnection *)v6;
  v55 = v6;

  self->_lock._os_unfair_lock_opaque = 0;
  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v8 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  lock_assertions = self->_lock_assertions;
  self->_lock_assertions = v8;

  v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  lock_discreteDispatchingRoots = self->_lock_discreteDispatchingRoots;
  self->_lock_discreteDispatchingRoots = v10;

  v12 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
  lock_lastSentDiscreteDispatchingRoots = self->_lock_lastSentDiscreteDispatchingRoots;
  self->_lock_lastSentDiscreteDispatchingRoots = v12;

  v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  lock_keyCommandsDispatchingRoots = self->_lock_keyCommandsDispatchingRoots;
  self->_lock_keyCommandsDispatchingRoots = v14;

  v16 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
  lock_lastSentKeyCommandsDispatchingRoots = self->_lock_lastSentKeyCommandsDispatchingRoots;
  self->_lock_lastSentKeyCommandsDispatchingRoots = v16;

  v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  lock_deferringRules = self->_lock_deferringRules;
  self->_lock_deferringRules = v18;

  v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  lock_keyCommandsRegistrations = self->_lock_keyCommandsRegistrations;
  self->_lock_keyCommandsRegistrations = v20;

  dispatch_get_global_queue(25, 0);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.backboard.hid.delivery-manager.implicit", 0, v22);
  implicitFlushQueue = self->_implicitFlushQueue;
  self->_implicitFlushQueue = v23;

  v25 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D017B8]);
  lock_preventFlushingReasons = self->_lock_preventFlushingReasons;
  self->_lock_preventFlushingReasons = v25;

  v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  lock_bufferingPredicates = self->_lock_bufferingPredicates;
  self->_lock_bufferingPredicates = v27;

  v29 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
  lock_lastSentBufferingPredicates = self->_lock_lastSentBufferingPredicates;
  self->_lock_lastSentBufferingPredicates = v29;

  v31 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
  lock_lastSentActiveUIResponderPredicates = self->_lock_lastSentActiveUIResponderPredicates;
  self->_lock_lastSentActiveUIResponderPredicates = v31;

  v33 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
  lock_lastSentDeferringRules = self->_lock_lastSentDeferringRules;
  self->_lock_lastSentDeferringRules = v33;

  v35 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
  lock_lastSentKeyCommandsRegistrations = self->_lock_lastSentKeyCommandsRegistrations;
  self->_lock_lastSentKeyCommandsRegistrations = v35;

  v37 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
  lock_lastSentSetOfKeyCommandsRegistrations = self->_lock_lastSentSetOfKeyCommandsRegistrations;
  self->_lock_lastSentSetOfKeyCommandsRegistrations = v37;

}

- (void)dealloc
{
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
  BKSHIDEventDeliveryManager *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!self->_forTesting)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-dealloc is not allowed"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v10 = v5;
      v11 = 2114;
      v12 = v7;
      v13 = 2048;
      v14 = self;
      v15 = 2114;
      v16 = CFSTR("BKSHIDEventDeliveryManager.m");
      v17 = 1024;
      v18 = 172;
      v19 = 2114;
      v20 = v4;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A13F7E0);
  }
  v8.receiver = self;
  v8.super_class = (Class)BKSHIDEventDeliveryManager;
  -[BKSHIDEventDeliveryManager dealloc](&v8, sel_dealloc);
}

- (id)registerKeyCommands:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  BKSHIDEventDeliveryManager *v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("registration"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v38 = v19;
      v39 = 2114;
      v40 = v21;
      v41 = 2048;
      v42 = self;
      v43 = 2114;
      v44 = CFSTR("BKSHIDEventDeliveryManager.m");
      v45 = 1024;
      v46 = 226;
      v47 = 2114;
      v48 = v18;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A13FA94);
  }
  v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    v23 = (objc_class *)objc_msgSend(v6, "classForCoder");
    if (!v23)
      v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("registration"), v24, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v38 = v28;
      v39 = 2114;
      v40 = v30;
      v41 = 2048;
      v42 = self;
      v43 = 2114;
      v44 = CFSTR("BKSHIDEventDeliveryManager.m");
      v45 = 1024;
      v46 = 226;
      v47 = 2114;
      v48 = v27;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A13FBD0);
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = self->_lock_keyCommandsRegistrationSeed + 1;
  self->_lock_keyCommandsRegistrationSeed = v8;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%li-keycmds"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_lock_keyCommandsRegistrations, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wow! we've got duplicate registration keys!!! new=%@ existing=%@ : registration=%@"), v9, self->_lock_keyCommandsRegistrations, v6);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v38 = v32;
      v39 = 2114;
      v40 = v34;
      v41 = 2048;
      v42 = self;
      v43 = 2114;
      v44 = CFSTR("BKSHIDEventDeliveryManager.m");
      v45 = 1024;
      v46 = 232;
      v47 = 2114;
      v48 = v31;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A13FCC4);
  }
  -[NSMutableDictionary setObject:forKey:](self->_lock_keyCommandsRegistrations, "setObject:forKey:", v6, v9);
  -[BKSHIDEventDeliveryManager _lock_implicitFlush](self, "_lock_implicitFlush");
  v11 = objc_alloc(MEMORY[0x1E0D01868]);
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __50__BKSHIDEventDeliveryManager_registerKeyCommands___block_invoke;
  v35[3] = &unk_1E1EA1378;
  v35[4] = self;
  v36 = v9;
  v12 = v9;
  v13 = (void *)objc_msgSend(v11, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("com.apple.backboard.hid.delivery.delivery"), v12, v35);
  -[NSHashTable addObject:](self->_lock_assertions, "addObject:", v13);
  os_unfair_lock_unlock(&self->_lock);

  return v13;
}

- (id)requestActiveUIResponderForDeferringPredicate:(id)a3 withReason:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  objc_class *v45;
  void *v46;
  objc_class *v47;
  void *v48;
  void *v49;
  void *v50;
  objc_class *v51;
  void *v52;
  void *v53;
  void *v54;
  objc_class *v55;
  void *v56;
  void *v57;
  void *v58;
  objc_class *v59;
  void *v60;
  _QWORD v61[5];
  id v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  BKSHIDEventDeliveryManager *v68;
  __int16 v69;
  const __CFString *v70;
  __int16 v71;
  int v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v7;
  if (!v9)
  {
    v23 = (void *)MEMORY[0x1E0CB3940];
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("predicate"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v64 = v27;
      v65 = 2114;
      v66 = v29;
      v67 = 2048;
      v68 = self;
      v69 = 2114;
      v70 = CFSTR("BKSHIDEventDeliveryManager.m");
      v71 = 1024;
      v72 = 318;
      v73 = 2114;
      v74 = v26;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A13FFD0);
  }
  v10 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = (void *)MEMORY[0x1E0CB3940];
    v31 = (objc_class *)objc_msgSend(v10, "classForCoder");
    if (!v31)
      v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("predicate"), v32, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v64 = v36;
      v65 = 2114;
      v66 = v38;
      v67 = 2048;
      v68 = self;
      v69 = 2114;
      v70 = CFSTR("BKSHIDEventDeliveryManager.m");
      v71 = 1024;
      v72 = 318;
      v73 = 2114;
      v74 = v35;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14010CLL);
  }

  v11 = v8;
  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = (objc_class *)objc_opt_class();
  if (!v11)
  {
    NSStringFromClass(v13);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("reason"), v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (objc_class *)objc_opt_class();
      NSStringFromClass(v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v64 = v41;
      v65 = 2114;
      v66 = v43;
      v67 = 2048;
      v68 = self;
      v69 = 2114;
      v70 = CFSTR("BKSHIDEventDeliveryManager.m");
      v71 = 1024;
      v72 = 319;
      v73 = 2114;
      v74 = v40;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A140214);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v44 = (void *)MEMORY[0x1E0CB3940];
    v45 = (objc_class *)objc_msgSend(v11, "classForCoder");
    if (!v45)
      v45 = (objc_class *)objc_opt_class();
    NSStringFromClass(v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (objc_class *)objc_opt_class();
    NSStringFromClass(v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("reason"), v46, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (objc_class *)objc_opt_class();
      NSStringFromClass(v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v64 = v50;
      v65 = 2114;
      v66 = v52;
      v67 = 2048;
      v68 = self;
      v69 = 2114;
      v70 = CFSTR("BKSHIDEventDeliveryManager.m");
      v71 = 1024;
      v72 = 319;
      v73 = 2114;
      v74 = v49;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v49), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14034CLL);
  }

  objc_msgSend(v10, "token");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("predicate must have a valid token"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (objc_class *)objc_opt_class();
      NSStringFromClass(v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v64 = v54;
      v65 = 2114;
      v66 = v56;
      v67 = 2048;
      v68 = self;
      v69 = 2114;
      v70 = CFSTR("BKSHIDEventDeliveryManager.m");
      v71 = 1024;
      v72 = 320;
      v73 = 2114;
      v74 = v53;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v53), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A140434);
  }
  os_unfair_lock_lock(&self->_lock);
  v15 = (void *)MEMORY[0x1E0CB3940];
  v16 = self->_lock_bufferingSeed + 1;
  self->_lock_bufferingSeed = v16;
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%li-activeUIResponder: %@"), v16, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_lock_bufferingPredicates, "objectForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wow! we've got duplicate activeUIResponder keys!!! new=%@ existing=%@ : predicate=%@"), v17, self->_lock_activeUIResponderPredicates, v10);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (objc_class *)objc_opt_class();
      NSStringFromClass(v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v64 = v58;
      v65 = 2114;
      v66 = v60;
      v67 = 2048;
      v68 = self;
      v69 = 2114;
      v70 = CFSTR("BKSHIDEventDeliveryManager.m");
      v71 = 1024;
      v72 = 325;
      v73 = 2114;
      v74 = v57;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v57), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A140528);
  }
  -[NSMutableDictionary setObject:forKey:](self->_lock_activeUIResponderPredicates, "setObject:forKey:", v10, v17);
  -[BKSHIDEventDeliveryManager _lock_implicitFlush](self, "_lock_implicitFlush");
  v19 = objc_alloc(MEMORY[0x1E0D01868]);
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __87__BKSHIDEventDeliveryManager_requestActiveUIResponderForDeferringPredicate_withReason___block_invoke;
  v61[3] = &unk_1E1EA1378;
  v61[4] = self;
  v62 = v17;
  v20 = v17;
  v21 = (void *)objc_msgSend(v19, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("com.apple.backboard.hid.delivery.activeUIResponder"), v20, v61);
  -[NSHashTable addObject:](self->_lock_assertions, "addObject:", v21);
  os_unfair_lock_unlock(&self->_lock);
  os_unfair_lock_assert_not_owner(&self->_lock);

  return v21;
}

- (void)selectDeferringPredicate:(id)a3 withReason:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  void *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  void *v46;
  objc_class *v47;
  void *v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  BKSHIDEventDeliveryManager *v55;
  __int16 v56;
  const __CFString *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v7;
  if (!v9)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("predicate"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v51 = v19;
      v52 = 2114;
      v53 = v21;
      v54 = 2048;
      v55 = self;
      v56 = 2114;
      v57 = CFSTR("BKSHIDEventDeliveryManager.m");
      v58 = 1024;
      v59 = 351;
      v60 = 2114;
      v61 = v18;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A140754);
  }
  v49 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    v23 = (objc_class *)objc_msgSend(v49, "classForCoder");
    if (!v23)
      v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("predicate"), v24, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v51 = v28;
      v52 = 2114;
      v53 = v30;
      v54 = 2048;
      v55 = self;
      v56 = 2114;
      v57 = CFSTR("BKSHIDEventDeliveryManager.m");
      v58 = 1024;
      v59 = 351;
      v60 = 2114;
      v61 = v27;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A140890);
  }

  v10 = v8;
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = (objc_class *)objc_opt_class();
  if (!v10)
  {
    NSStringFromClass(v12);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("reason"), v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v51 = v33;
      v52 = 2114;
      v53 = v35;
      v54 = 2048;
      v55 = self;
      v56 = 2114;
      v57 = CFSTR("BKSHIDEventDeliveryManager.m");
      v58 = 1024;
      v59 = 352;
      v60 = 2114;
      v61 = v32;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A140998);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v36 = (void *)MEMORY[0x1E0CB3940];
    v37 = (objc_class *)objc_msgSend(v10, "classForCoder");
    if (!v37)
      v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (objc_class *)objc_opt_class();
    NSStringFromClass(v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("reason"), v38, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (objc_class *)objc_opt_class();
      NSStringFromClass(v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v51 = v42;
      v52 = 2114;
      v53 = v44;
      v54 = 2048;
      v55 = self;
      v56 = 2114;
      v57 = CFSTR("BKSHIDEventDeliveryManager.m");
      v58 = 1024;
      v59 = 352;
      v60 = 2114;
      v61 = v41;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v41), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A140AD0);
  }

  objc_msgSend(v49, "token");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("predicate must have a valid token"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (objc_class *)objc_opt_class();
      NSStringFromClass(v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v51 = v46;
      v52 = 2114;
      v53 = v48;
      v54 = 2048;
      v55 = self;
      v56 = 2114;
      v57 = CFSTR("BKSHIDEventDeliveryManager.m");
      v58 = 1024;
      v59 = 353;
      v60 = 2114;
      v61 = v45;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v45), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A140BB8);
  }
  -[BSServiceConnection remoteTarget](self->_serviceConnection, "remoteTarget");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "selectDeferringTargetForPredicate:", v49);

}

- (id)deliveryGraphDescription
{
  void *v2;
  void *v3;

  -[BSServiceConnection remoteTarget](self->_serviceConnection, "remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deliveryGraphDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)connectionDescriptionForDeferringRuleWithSeed:(unsigned int)a3 pid:(int)a4
{
  _BKSHIDEventDeferringRuleIdentity *v5;
  void *v6;

  v5 = -[_BKSHIDEventDeferringRuleIdentity initWithSeed:pid:]([_BKSHIDEventDeferringRuleIdentity alloc], "initWithSeed:pid:", *(_QWORD *)&a3, *(_QWORD *)&a4);
  -[BKSHIDEventDeliveryManager connectionDescriptionForDeferringRuleIdentity:](self, "connectionDescriptionForDeferringRuleIdentity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)connectionDescriptionForDeferringRuleIdentity:(id)a3
{
  BSServiceConnection *serviceConnection;
  id v4;
  void *v5;
  void *v6;

  serviceConnection = self->_serviceConnection;
  v4 = a3;
  -[BSServiceConnection remoteTarget](serviceConnection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connectionDescriptionForDeferringRuleIdentity:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dispatchDiscreteEventsForReason:(id)a3 withRules:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  BKSHIDEventDiscreteDispatchingRoot *v22;
  NSObject *v23;
  id v24;
  void *v25;
  BKSHIDEventDiscreteDispatchingRoot *v26;
  void *v27;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  BKSHIDEventDiscreteDispatchingRoot *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  BKSHIDEventDiscreteDispatchingRoot *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  void *v46;
  BKSHIDEventDiscreteDispatchingRoot *v47;
  objc_class *v48;
  void *v49;
  void *v50;
  objc_class *v51;
  void *v52;
  objc_class *v53;
  void *v54;
  void *v55;
  BKSHIDEventDiscreteDispatchingRoot *v56;
  objc_class *v57;
  void *v58;
  void *v59;
  objc_class *v60;
  void *v61;
  void *v62;
  BKSHIDEventDiscreteDispatchingRoot *v63;
  objc_class *v64;
  void *v65;
  void *v66;
  objc_class *v67;
  void *v68;
  objc_class *v69;
  void *v70;
  void *v71;
  BKSHIDEventDiscreteDispatchingRoot *v72;
  objc_class *v73;
  void *v74;
  _QWORD v75[5];
  BKSHIDEventDiscreteDispatchingRoot *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t v81[128];
  uint8_t buf[4];
  BKSHIDEventDiscreteDispatchingRoot *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  BKSHIDEventDeliveryManager *v87;
  __int16 v88;
  const __CFString *v89;
  __int16 v90;
  int v91;
  __int16 v92;
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v7;
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = (objc_class *)objc_opt_class();
  if (!v9)
  {
    NSStringFromClass(v11);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("reason"), v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v47 = (BKSHIDEventDiscreteDispatchingRoot *)objc_claimAutoreleasedReturnValue();
      v48 = (objc_class *)objc_opt_class();
      NSStringFromClass(v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v83 = v47;
      v84 = 2114;
      v85 = v49;
      v86 = 2048;
      v87 = self;
      v88 = 2114;
      v89 = CFSTR("BKSHIDEventDeliveryManager.m");
      v90 = 1024;
      v91 = 380;
      v92 = 2114;
      v93 = v46;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v46), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A141314);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v50 = (void *)MEMORY[0x1E0CB3940];
    v51 = (objc_class *)objc_msgSend(v9, "classForCoder");
    if (!v51)
      v51 = (objc_class *)objc_opt_class();
    NSStringFromClass(v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (objc_class *)objc_opt_class();
    NSStringFromClass(v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("reason"), v52, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v56 = (BKSHIDEventDiscreteDispatchingRoot *)objc_claimAutoreleasedReturnValue();
      v57 = (objc_class *)objc_opt_class();
      NSStringFromClass(v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v83 = v56;
      v84 = 2114;
      v85 = v58;
      v86 = 2048;
      v87 = self;
      v88 = 2114;
      v89 = CFSTR("BKSHIDEventDeliveryManager.m");
      v90 = 1024;
      v91 = 380;
      v92 = 2114;
      v93 = v55;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v55), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14144CLL);
  }

  v12 = v8;
  if (!v12)
  {
    v59 = (void *)MEMORY[0x1E0CB3940];
    v60 = (objc_class *)objc_opt_class();
    NSStringFromClass(v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("ruleSet"), v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v63 = (BKSHIDEventDiscreteDispatchingRoot *)objc_claimAutoreleasedReturnValue();
      v64 = (objc_class *)objc_opt_class();
      NSStringFromClass(v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v83 = v63;
      v84 = 2114;
      v85 = v65;
      v86 = 2048;
      v87 = self;
      v88 = 2114;
      v89 = CFSTR("BKSHIDEventDeliveryManager.m");
      v90 = 1024;
      v91 = 381;
      v92 = 2114;
      v93 = v62;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v62), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A141560);
  }
  v13 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v66 = (void *)MEMORY[0x1E0CB3940];
    v67 = (objc_class *)objc_msgSend(v13, "classForCoder");
    if (!v67)
      v67 = (objc_class *)objc_opt_class();
    NSStringFromClass(v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = (objc_class *)objc_opt_class();
    NSStringFromClass(v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("ruleSet"), v68, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v72 = (BKSHIDEventDiscreteDispatchingRoot *)objc_claimAutoreleasedReturnValue();
      v73 = (objc_class *)objc_opt_class();
      NSStringFromClass(v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v83 = v72;
      v84 = 2114;
      v85 = v74;
      v86 = 2048;
      v87 = self;
      v88 = 2114;
      v89 = CFSTR("BKSHIDEventDeliveryManager.m");
      v90 = 1024;
      v91 = 381;
      v92 = 2114;
      v93 = v71;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v71), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A141698);
  }

  v14 = (void *)objc_msgSend(v13, "copy");
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v78;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v78 != v18)
          objc_enumerationMutation(v15);
        v20 = *(id *)(*((_QWORD *)&v77 + 1) + 8 * v19);
        if (!v20)
        {
          v29 = (void *)MEMORY[0x1E0CB3940];
          v30 = (objc_class *)objc_opt_class();
          NSStringFromClass(v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("rule"), v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v33 = (BKSHIDEventDiscreteDispatchingRoot *)objc_claimAutoreleasedReturnValue();
            v34 = (objc_class *)objc_opt_class();
            NSStringFromClass(v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v83 = v33;
            v84 = 2114;
            v85 = v35;
            v86 = 2048;
            v87 = self;
            v88 = 2114;
            v89 = CFSTR("BKSHIDEventDeliveryManager.m");
            v90 = 1024;
            v91 = 384;
            v92 = 2114;
            v93 = v32;
            _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18A1410D0);
        }
        v21 = v20;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v36 = (void *)MEMORY[0x1E0CB3940];
          v37 = (objc_class *)objc_msgSend(v21, "classForCoder");
          if (!v37)
            v37 = (objc_class *)objc_opt_class();
          NSStringFromClass(v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (objc_class *)objc_opt_class();
          NSStringFromClass(v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("rule"), v38, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v42 = (BKSHIDEventDiscreteDispatchingRoot *)objc_claimAutoreleasedReturnValue();
            v43 = (objc_class *)objc_opt_class();
            NSStringFromClass(v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v83 = v42;
            v84 = 2114;
            v85 = v44;
            v86 = 2048;
            v87 = self;
            v88 = 2114;
            v89 = CFSTR("BKSHIDEventDeliveryManager.m");
            v90 = 1024;
            v91 = 384;
            v92 = 2114;
            v93 = v41;
            _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          objc_msgSend(objc_retainAutorelease(v41), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18A14120CLL);
        }

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
    }
    while (v17);
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  ++self->_lock_discreteDispatchingSeed;
  v22 = -[BKSHIDEventDiscreteDispatchingRoot initWithReason:seed:rules:]([BKSHIDEventDiscreteDispatchingRoot alloc], "initWithReason:seed:rules:", v9, self->_lock_discreteDispatchingSeed, v15);
  BKLogEventDelivery();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v83 = v22;
    _os_log_impl(&dword_18A0F0000, v23, OS_LOG_TYPE_DEFAULT, "adding root: %{public}@", buf, 0xCu);
  }

  -[NSMutableSet addObject:](self->_lock_discreteDispatchingRoots, "addObject:", v22);
  -[BKSHIDEventDeliveryManager _lock_implicitFlush](self, "_lock_implicitFlush");
  v24 = objc_alloc(MEMORY[0x1E0D01868]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%u"), v9, -[BKSHIDEventDeliveryRuleWrapper seed](v22, "seed"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = __72__BKSHIDEventDeliveryManager_dispatchDiscreteEventsForReason_withRules___block_invoke;
  v75[3] = &unk_1E1EA1378;
  v75[4] = self;
  v76 = v22;
  v26 = v22;
  v27 = (void *)objc_msgSend(v24, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("com.apple.backboard.hid.delivery.delivery"), v25, v75);

  -[NSHashTable addObject:](self->_lock_assertions, "addObject:", v27);
  os_unfair_lock_unlock(&self->_lock);

  return v27;
}

- (id)dispatchKeyCommandsForReason:(id)a3 withRule:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  BKSHIDEventKeyCommandDispatchingRoot *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  BKSHIDEventKeyCommandDispatchingRoot *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  objc_class *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  void *v49;
  objc_class *v50;
  void *v51;
  _QWORD v52[5];
  BKSHIDEventKeyCommandDispatchingRoot *v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  BKSHIDEventDeliveryManager *v59;
  __int16 v60;
  const __CFString *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v7;
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = (objc_class *)objc_opt_class();
  if (!v9)
  {
    NSStringFromClass(v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("reason"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v55 = v24;
      v56 = 2114;
      v57 = v26;
      v58 = 2048;
      v59 = self;
      v60 = 2114;
      v61 = CFSTR("BKSHIDEventDeliveryManager.m");
      v62 = 1024;
      v63 = 419;
      v64 = 2114;
      v65 = v23;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14198CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v27 = (void *)MEMORY[0x1E0CB3940];
    v28 = (objc_class *)objc_msgSend(v9, "classForCoder");
    if (!v28)
      v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("reason"), v29, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v55 = v33;
      v56 = 2114;
      v57 = v35;
      v58 = 2048;
      v59 = self;
      v60 = 2114;
      v61 = CFSTR("BKSHIDEventDeliveryManager.m");
      v62 = 1024;
      v63 = 419;
      v64 = 2114;
      v65 = v32;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A141AC4);
  }

  v12 = v8;
  if (!v12)
  {
    v36 = (void *)MEMORY[0x1E0CB3940];
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("rule"), v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v55 = v40;
      v56 = 2114;
      v57 = v42;
      v58 = 2048;
      v59 = self;
      v60 = 2114;
      v61 = CFSTR("BKSHIDEventDeliveryManager.m");
      v62 = 1024;
      v63 = 420;
      v64 = 2114;
      v65 = v39;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v39), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A141BD8);
  }
  v13 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v43 = (void *)MEMORY[0x1E0CB3940];
    v44 = (objc_class *)objc_msgSend(v13, "classForCoder");
    if (!v44)
      v44 = (objc_class *)objc_opt_class();
    NSStringFromClass(v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (objc_class *)objc_opt_class();
    NSStringFromClass(v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("rule"), v45, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (objc_class *)objc_opt_class();
      NSStringFromClass(v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v55 = v49;
      v56 = 2114;
      v57 = v51;
      v58 = 2048;
      v59 = self;
      v60 = 2114;
      v61 = CFSTR("BKSHIDEventDeliveryManager.m");
      v62 = 1024;
      v63 = 420;
      v64 = 2114;
      v65 = v48;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v48), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A141D10);
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  ++self->_lock_keyCommandsDispatchingSeed;
  v14 = -[BKSHIDEventKeyCommandDispatchingRoot initWithReason:seed:rule:]([BKSHIDEventKeyCommandDispatchingRoot alloc], "initWithReason:seed:rule:", v9, self->_lock_keyCommandsDispatchingSeed, v13);
  v15 = (void *)MEMORY[0x1E0CB3940];
  v16 = self->_lock_keyCommandsDispatchingSeed + 1;
  self->_lock_keyCommandsDispatchingSeed = v16;
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%li-dispatchKeycmds: %@"), v16, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](self->_lock_keyCommandsDispatchingRoots, "addObject:", v14);
  -[BKSHIDEventDeliveryManager _lock_implicitFlush](self, "_lock_implicitFlush");
  v18 = objc_alloc(MEMORY[0x1E0D01868]);
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __68__BKSHIDEventDeliveryManager_dispatchKeyCommandsForReason_withRule___block_invoke;
  v52[3] = &unk_1E1EA1378;
  v52[4] = self;
  v53 = v14;
  v19 = v14;
  v20 = (void *)objc_msgSend(v18, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("com.apple.backboard.hid.delivery.delivery"), v17, v52);
  -[NSHashTable addObject:](self->_lock_assertions, "addObject:", v20);
  os_unfair_lock_unlock(&self->_lock);

  return v20;
}

- (int64_t)authenticateMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  mach_port_t v7;
  id v8;
  int64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  NSObject *v14;
  id v16;
  unsigned int v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    BKLogEventDelivery();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

      v9 = 1;
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    v11 = "authenticateMessage: message is nil";
    v12 = v10;
    v13 = 2;
LABEL_15:
    _os_log_error_impl(&dword_18A0F0000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    goto LABEL_8;
  }
  if (objc_msgSend(v3, "originIdentifier") != 0xC181BADB23D8497BLL)
  {
    BKLogEventDelivery();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_DWORD *)buf = 138543362;
    v19 = v4;
    v11 = "authenticateMessage: message did not originate in backboardd: %{public}@";
    v12 = v10;
    v13 = 12;
    goto LABEL_15;
  }
  v17 = 0;
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0D01838], "encodeObject:error:", v4, &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v16;
  if (v5)
  {
    v7 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    v8 = objc_retainAutorelease(v5);
    _BKSHIDVerifyEventAuthenticationMessage(v7, objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), (int *)&v17);
    v9 = v17;
  }
  else
  {
    BKLogEventDelivery();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v19 = v4;
      v20 = 2114;
      v21 = v6;
      _os_log_error_impl(&dword_18A0F0000, v14, OS_LOG_TYPE_ERROR, "authenticateMessage: failed to encode %{public}@: %{public}@", buf, 0x16u);
    }

    v9 = 0;
  }

LABEL_13:
  return v9;
}

- (void)_syncServiceFlushState
{
  dispatch_sync((dispatch_queue_t)self->_implicitFlushQueue, &__block_literal_global_137);
}

- (void)_reconnectAfterServerInterruption
{
  os_unfair_lock_s *p_lock;
  NSSet *v4;
  NSSet *lock_lastSentDiscreteDispatchingRoots;
  NSSet *v6;
  NSSet *lock_lastSentKeyCommandsDispatchingRoots;
  NSArray *v8;
  NSArray *lock_lastSentDeferringRules;
  NSSet *v10;
  NSSet *lock_lastSentBufferingPredicates;
  NSSet *v12;
  NSSet *lock_lastSentActiveUIResponderPredicates;
  NSDictionary *v14;
  NSDictionary *lock_lastSentKeyCommandsRegistrations;
  NSSet *v16;
  NSSet *lock_lastSentSetOfKeyCommandsRegistrations;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BSServiceConnection activate](self->_serviceConnection, "activate");
  v4 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
  lock_lastSentDiscreteDispatchingRoots = self->_lock_lastSentDiscreteDispatchingRoots;
  self->_lock_lastSentDiscreteDispatchingRoots = v4;

  v6 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
  lock_lastSentKeyCommandsDispatchingRoots = self->_lock_lastSentKeyCommandsDispatchingRoots;
  self->_lock_lastSentKeyCommandsDispatchingRoots = v6;

  v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
  lock_lastSentDeferringRules = self->_lock_lastSentDeferringRules;
  self->_lock_lastSentDeferringRules = v8;

  v10 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
  lock_lastSentBufferingPredicates = self->_lock_lastSentBufferingPredicates;
  self->_lock_lastSentBufferingPredicates = v10;

  v12 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
  lock_lastSentActiveUIResponderPredicates = self->_lock_lastSentActiveUIResponderPredicates;
  self->_lock_lastSentActiveUIResponderPredicates = v12;

  v14 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
  lock_lastSentKeyCommandsRegistrations = self->_lock_lastSentKeyCommandsRegistrations;
  self->_lock_lastSentKeyCommandsRegistrations = v14;

  v16 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
  lock_lastSentSetOfKeyCommandsRegistrations = self->_lock_lastSentSetOfKeyCommandsRegistrations;
  self->_lock_lastSentSetOfKeyCommandsRegistrations = v16;

  -[BKSHIDEventDeliveryManager _lock_implicitFlush](self, "_lock_implicitFlush");
  os_unfair_lock_unlock(p_lock);
}

- (id)_lock_stateDescription
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_lock_needsFlush == (__CFBoolean *)*MEMORY[0x1E0C9AE40])
    return CFSTR("flushed");
  if (self->_lock_implicitPreventFlushingAssertion)
    return CFSTR("pending");
  if (-[BSMutableIntegerMap count](self->_lock_preventFlushingReasons, "count"))
    return CFSTR("locked");
  if (self->_lock_needsFlush == (__CFBoolean *)*MEMORY[0x1E0C9AE50])
    return CFSTR("dirty");
  return CFSTR("initial");
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
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  BKSHIDEventDeliveryManager *v15;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__BKSHIDEventDeliveryManager_appendDescriptionToFormatter___block_invoke;
  v13[3] = &unk_1E1EA1BF8;
  v12 = v4;
  v14 = v12;
  v15 = self;
  objc_msgSend(v12, "appendProem:block:", self, v13);
  v5 = (id)objc_msgSend(v12, "appendObject:withName:skipIfNil:", self->_lock_preventFlushingReasons, CFSTR("preventFlushingReasons"), 1);
  if (-[NSMutableSet count](self->_lock_discreteDispatchingRoots, "count"))
    v6 = (id)objc_msgSend(v12, "appendObject:withName:", self->_lock_discreteDispatchingRoots, CFSTR("discreteDispatchingRoots"));
  if (-[NSMutableSet count](self->_lock_keyCommandsDispatchingRoots, "count"))
    v7 = (id)objc_msgSend(v12, "appendObject:withName:", self->_lock_keyCommandsDispatchingRoots, CFSTR("keyCommandsDispatchingRoots"));
  if (-[NSMutableArray count](self->_lock_deferringRules, "count"))
    v8 = (id)objc_msgSend(v12, "appendObject:withName:", self->_lock_deferringRules, CFSTR("deferringRules"));
  if (-[NSMutableDictionary count](self->_lock_keyCommandsRegistrations, "count"))
    v9 = (id)objc_msgSend(v12, "appendObject:withName:", self->_lock_keyCommandsRegistrations, CFSTR("keyCommandsRegistrations"));
  if (-[NSMutableDictionary count](self->_lock_bufferingPredicates, "count"))
    v10 = (id)objc_msgSend(v12, "appendObject:withName:", self->_lock_bufferingPredicates, CFSTR("bufferingPredicates"));
  if (-[NSMutableDictionary count](self->_lock_activeUIResponderPredicates, "count"))
    v11 = (id)objc_msgSend(v12, "appendObject:withName:", self->_lock_activeUIResponderPredicates, CFSTR("activeUIResponderPredicates"));
  os_unfair_lock_unlock(&self->_lock);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_implicitPreventFlushingAssertion, 0);
  objc_storeStrong((id *)&self->_lock_preventFlushingReasons, 0);
  objc_storeStrong((id *)&self->_implicitFlushQueue, 0);
  objc_storeStrong((id *)&self->_lock_lastSentSetOfKeyCommandsRegistrations, 0);
  objc_storeStrong((id *)&self->_lock_lastSentKeyCommandsRegistrations, 0);
  objc_storeStrong((id *)&self->_lock_keyCommandsRegistrations, 0);
  objc_storeStrong((id *)&self->_lock_lastSentActiveUIResponderPredicates, 0);
  objc_storeStrong((id *)&self->_lock_activeUIResponderPredicates, 0);
  objc_storeStrong((id *)&self->_lock_lastSentBufferingPredicates, 0);
  objc_storeStrong((id *)&self->_lock_bufferingPredicates, 0);
  objc_storeStrong((id *)&self->_lock_lastSentDeferringRules, 0);
  objc_storeStrong((id *)&self->_lock_deferringRules, 0);
  objc_storeStrong((id *)&self->_lock_lastSentKeyCommandsDispatchingRoots, 0);
  objc_storeStrong((id *)&self->_lock_keyCommandsDispatchingRoots, 0);
  objc_storeStrong((id *)&self->_lock_lastSentDiscreteDispatchingRoots, 0);
  objc_storeStrong((id *)&self->_lock_discreteDispatchingRoots, 0);
  objc_storeStrong((id *)&self->_lock_assertions, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

void __59__BKSHIDEventDeliveryManager_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_lock_stateDescription");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendString:withName:", v2, CFSTR("state"));

}

void __68__BKSHIDEventDeliveryManager_dispatchKeyCommandsForReason_withRule___block_invoke(uint64_t a1, void *a2)
{
  const os_unfair_lock *v3;
  id v4;

  v3 = (const os_unfair_lock *)(*(_QWORD *)(a1 + 32) + 20);
  v4 = a2;
  os_unfair_lock_assert_not_owner(v3);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_lock_implicitFlush");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
}

void __72__BKSHIDEventDeliveryManager_dispatchDiscreteEventsForReason_withRules___block_invoke(uint64_t a1, void *a2)
{
  const os_unfair_lock *v3;
  id v4;

  v3 = (const os_unfair_lock *)(*(_QWORD *)(a1 + 32) + 20);
  v4 = a2;
  os_unfair_lock_assert_not_owner(v3);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_lock_implicitFlush");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
}

void __87__BKSHIDEventDeliveryManager_requestActiveUIResponderForDeferringPredicate_withReason___block_invoke(uint64_t a1, void *a2)
{
  const os_unfair_lock *v3;
  id v4;

  v3 = (const os_unfair_lock *)(*(_QWORD *)(a1 + 32) + 20);
  v4 = a2;
  os_unfair_lock_assert_not_owner(v3);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_lock_implicitFlush");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
}

void __50__BKSHIDEventDeliveryManager_registerKeyCommands___block_invoke(uint64_t a1, void *a2)
{
  const os_unfair_lock *v3;
  id v4;

  v3 = (const os_unfair_lock *)(*(_QWORD *)(a1 + 32) + 20);
  v4 = a2;
  os_unfair_lock_assert_not_owner(v3);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_lock_implicitFlush");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
}

void __55__BKSHIDEventDeliveryManager__initWithRemoteConnection__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0D017E0];
  v4 = a2;
  objc_msgSend(v3, "protocolForProtocol:", &unk_1EDF664A0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EDF66500);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D03430], "interfaceWithIdentifier:", CFSTR("BKHIDEventDeliveryManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setServer:", v6);
  objc_msgSend(v7, "setClient:", v5);
  objc_msgSend(v4, "setInterface:", v7);
  objc_msgSend(v4, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceQuality:", v8);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__BKSHIDEventDeliveryManager__initWithRemoteConnection__block_invoke_2;
  v9[3] = &unk_1E1EA1800;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v4, "setInterruptionHandler:", v9);
  objc_msgSend(v4, "setInvalidationHandler:", &__block_literal_global_8638);

}

uint64_t __55__BKSHIDEventDeliveryManager__initWithRemoteConnection__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reconnectAfterServerInterruption");
}

void __55__BKSHIDEventDeliveryManager__initWithRemoteConnection__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = a2;
  BKLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_18A0F0000, v3, OS_LOG_TYPE_ERROR, "delivery manager invalidated - backboardd must have unloaded, exiting…", v4, 2u);
  }

  exit(0);
}

@end
