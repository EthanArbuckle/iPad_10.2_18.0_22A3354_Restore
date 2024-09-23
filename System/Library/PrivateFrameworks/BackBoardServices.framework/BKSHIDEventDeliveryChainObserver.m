@implementation BKSHIDEventDeliveryChainObserver

- (BKSHIDEventDeliveryChainObserver)init
{
  BKSHIDEventDeliveryChainObserver *v2;
  uint64_t v3;
  BKSHIDEventDisplay *display;
  uint64_t v5;
  BKSHIDEventDeferringEnvironment *deferringEnvironment;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKSHIDEventDeliveryChainObserver;
  v2 = -[BKSHIDEventDeliveryChainObserver init](&v8, sel_init);
  if (v2)
  {
    +[BKSHIDEventDisplay nullDisplay](BKSHIDEventDisplay, "nullDisplay");
    v3 = objc_claimAutoreleasedReturnValue();
    display = v2->_display;
    v2->_display = (BKSHIDEventDisplay *)v3;

    +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment](BKSHIDEventDeferringEnvironment, "keyboardFocusEnvironment");
    v5 = objc_claimAutoreleasedReturnValue();
    deferringEnvironment = v2->_deferringEnvironment;
    v2->_deferringEnvironment = (BKSHIDEventDeferringEnvironment *)v5;

  }
  return v2;
}

- (BKSHIDEventDeliveryChainObserver)initWithDisplay:(id)a3 environment:(id)a4
{
  id v8;
  id v9;
  BKSHIDEventDeliveryChainObserver *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  objc_super v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  BKSHIDEventDeliveryChainObserver *v54;
  __int16 v55;
  const __CFString *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v48.receiver = self;
  v48.super_class = (Class)BKSHIDEventDeliveryChainObserver;
  v10 = -[BKSHIDEventDeliveryChainObserver init](&v48, sel_init);
  if (v10)
  {
    v11 = v8;
    if (!v11)
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_opt_class();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("display"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v50 = v20;
        v51 = 2114;
        v52 = v22;
        v53 = 2048;
        v54 = v10;
        v55 = 2114;
        v56 = CFSTR("BKSHIDEventDeliveryChainObserver.m");
        v57 = 1024;
        v58 = 31;
        v59 = 2114;
        v60 = v19;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A109208);
    }
    v12 = v11;
    objc_opt_class();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v23 = (void *)MEMORY[0x1E0CB3940];
      v24 = (objc_class *)objc_msgSend(v12, "classForCoder");
      if (!v24)
        v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("display"), v25, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v50 = v29;
        v51 = 2114;
        v52 = v31;
        v53 = 2048;
        v54 = v10;
        v55 = 2114;
        v56 = CFSTR("BKSHIDEventDeliveryChainObserver.m");
        v57 = 1024;
        v58 = 31;
        v59 = 2114;
        v60 = v28;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A109348);
    }

    v13 = v9;
    if (!v13)
    {
      v32 = (void *)MEMORY[0x1E0CB3940];
      objc_opt_class();
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("deferringEnvironment"), v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v50 = v36;
        v51 = 2114;
        v52 = v38;
        v53 = 2048;
        v54 = v10;
        v55 = 2114;
        v56 = CFSTR("BKSHIDEventDeliveryChainObserver.m");
        v57 = 1024;
        v58 = 32;
        v59 = 2114;
        v60 = v35;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A109464);
    }
    v14 = v13;
    objc_opt_class();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v39 = (void *)MEMORY[0x1E0CB3940];
      v40 = (objc_class *)objc_msgSend(v14, "classForCoder");
      if (!v40)
        v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v42 = (objc_class *)objc_opt_class();
      NSStringFromClass(v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("deferringEnvironment"), v41, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (objc_class *)objc_opt_class();
        NSStringFromClass(v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v50 = v45;
        v51 = 2114;
        v52 = v47;
        v53 = 2048;
        v54 = v10;
        v55 = 2114;
        v56 = CFSTR("BKSHIDEventDeliveryChainObserver.m");
        v57 = 1024;
        v58 = 32;
        v59 = 2114;
        v60 = v44;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v44), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A1095A4);
    }

    objc_storeStrong((id *)&v10->_display, a3);
    objc_storeStrong((id *)&v10->_deferringEnvironment, a4);
  }

  return v10;
}

- (id)addChainObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[BKSHIDEventObserver sharedInstance](BKSHIDEventObserver, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObservingClient:forChainObserver:", v4, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BKSHIDEventDisplay)display
{
  return self->_display;
}

- (BKSHIDEventDeferringEnvironment)deferringEnvironment
{
  return self->_deferringEnvironment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferringEnvironment, 0);
  objc_storeStrong((id *)&self->_display, 0);
}

@end
