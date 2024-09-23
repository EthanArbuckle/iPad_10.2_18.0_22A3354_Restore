@implementation BKSHIDEventDiscreteDispatchingRoot

- (id)decodePayload:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  const char *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  NSObject *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    BKLogEventDelivery();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
LABEL_3:
      v6 = 0;
      goto LABEL_4;
    }
    objc_msgSend(v3, "error");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v16;
    v17 = "WTAF sticky error %{public}@";
LABEL_29:
    _os_log_error_impl(&dword_18A0F0000, v5, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);

    goto LABEL_3;
  }
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v11, CFSTR("payload"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    BKLogEventDelivery();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    objc_msgSend(v3, "error");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v16;
    v17 = "payload is missing %{public}@";
    goto LABEL_29;
  }
  v13 = objc_opt_class();
  v14 = v12;
  if (v13)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
  }
  else
  {
    v15 = 0;
  }
  v18 = v15;

  if (!v18)
  {
    BKLogEventDelivery();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    *(_DWORD *)buf = 138543362;
    v32 = (id)objc_opt_class();
    v16 = v32;
    v17 = "payload is wrong class (got %{public}@)";
    goto LABEL_29;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v18;
  v19 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          BKLogEventDelivery();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v24 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543362;
            v32 = v24;
            v25 = v24;
            _os_log_error_impl(&dword_18A0F0000, v23, OS_LOG_TYPE_ERROR, "payload contains wrong class (got %{public}@)", buf, 0xCu);

          }
          goto LABEL_3;
        }
      }
      v20 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v20)
        continue;
      break;
    }
  }
  v6 = v5;
LABEL_4:

  return v6;
}

- (BKSHIDEventDiscreteDispatchingRoot)initWithReason:(id)a3 seed:(unsigned int)a4 rules:(id)a5
{
  uint64_t v6;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  BKSHIDEventDiscreteDispatchingRoot *v19;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  objc_class *v38;
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
  objc_super v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  BKSHIDEventDiscreteDispatchingRoot *v64;
  __int16 v65;
  const __CFString *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v6 = *(_QWORD *)&a4;
  v71 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v10)
  {
    v37 = (void *)MEMORY[0x1E0CB3940];
    objc_opt_class();
    v38 = (objc_class *)objc_opt_class();
    NSStringFromClass(v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("rules"), v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (objc_class *)objc_opt_class();
      NSStringFromClass(v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v60 = v41;
      v61 = 2114;
      v62 = v43;
      v63 = 2048;
      v64 = self;
      v65 = 2114;
      v66 = CFSTR("BKSHIDEventDeliveryRuleChangeTransaction.m");
      v67 = 1024;
      v68 = 162;
      v69 = 2114;
      v70 = v40;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A112670);
  }
  v11 = v10;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v44 = (void *)MEMORY[0x1E0CB3940];
    v45 = (objc_class *)objc_msgSend(v11, "classForCoder");
    if (!v45)
      v45 = (objc_class *)objc_opt_class();
    NSStringFromClass(v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v47 = (objc_class *)objc_opt_class();
    NSStringFromClass(v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("rules"), v46, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (objc_class *)objc_opt_class();
      NSStringFromClass(v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v60 = v50;
      v61 = 2114;
      v62 = v52;
      v63 = 2048;
      v64 = self;
      v65 = 2114;
      v66 = CFSTR("BKSHIDEventDeliveryRuleChangeTransaction.m");
      v67 = 1024;
      v68 = 162;
      v69 = 2114;
      v70 = v49;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v49), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A1127B0);
  }

  objc_opt_class();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v55;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v55 != v15)
          objc_enumerationMutation(v12);
        v17 = *(id *)(*((_QWORD *)&v54 + 1) + 8 * v16);
        if (!v17)
        {
          v21 = (void *)MEMORY[0x1E0CB3940];
          v22 = (objc_class *)objc_opt_class();
          NSStringFromClass(v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("obj"), v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (objc_class *)objc_opt_class();
            NSStringFromClass(v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v60 = v25;
            v61 = 2114;
            v62 = v27;
            v63 = 2048;
            v64 = self;
            v65 = 2114;
            v66 = CFSTR("BKSHIDEventDeliveryRuleChangeTransaction.m");
            v67 = 1024;
            v68 = 165;
            v69 = 2114;
            v70 = v24;
            _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18A112414);
        }
        v18 = v17;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v28 = (void *)MEMORY[0x1E0CB3940];
          v29 = (objc_class *)objc_msgSend(v18, "classForCoder");
          if (!v29)
            v29 = (objc_class *)objc_opt_class();
          NSStringFromClass(v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (objc_class *)objc_opt_class();
          NSStringFromClass(v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("obj"), v30, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (objc_class *)objc_opt_class();
            NSStringFromClass(v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v60 = v34;
            v61 = 2114;
            v62 = v36;
            v63 = 2048;
            v64 = self;
            v65 = 2114;
            v66 = CFSTR("BKSHIDEventDeliveryRuleChangeTransaction.m");
            v67 = 1024;
            v68 = 165;
            v69 = 2114;
            v70 = v33;
            _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18A112554);
        }

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    }
    while (v14);
  }

  v53.receiver = self;
  v53.super_class = (Class)BKSHIDEventDiscreteDispatchingRoot;
  v19 = -[BKSHIDEventDeliveryRuleWrapper initWithReason:seed:payload:](&v53, sel_initWithReason_seed_payload_, v9, v6, v12);

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
