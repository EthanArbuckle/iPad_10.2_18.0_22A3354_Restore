@implementation FBMainDisplayLayoutPublisher

- (void)flush
{
  -[FBSDisplayLayoutPublisher flush](self->_publisher, "flush");
}

- (id)addElement:(id)a3
{
  return (id)-[FBSDisplayLayoutPublisher addElement:](self->_publisher, "addElement:", a3);
}

- (id)transitionAssertionWithReason:(id)a3
{
  return (id)-[FBSDisplayLayoutPublisher transitionAssertionWithReason:](self->_publisher, "transitionAssertionWithReason:", a3);
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  -[FBSDisplayLayoutPublisher setInterfaceOrientation:](self->_publisher, "setInterfaceOrientation:", a3);
}

- (void)publisher:(id)a3 didUpdateLayout:(id)a4 withTransition:(id)a5
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, a4, a5);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("FBDisplayLayoutDidUpdateNotification"), &unk_1E4A2DA88);

}

+ (id)sharedInstance
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__FBMainDisplayLayoutPublisher_sharedInstance__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a2;
  v3[5] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, v3);
  return (id)sharedInstance___sharedInstance;
}

- (FBMainDisplayLayoutPublisher)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBMainDisplayLayoutPublisher *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBMainDisplayLayoutPublisher *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init is not allowed on FBMainDisplayLayoutPublisher"));
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
    v16 = CFSTR("FBMainDisplayLayoutPublisher.m");
    v17 = 1024;
    v18 = 42;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBMainDisplayLayoutPublisher *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithPublisher:(id)a3
{
  id v6;
  void *v7;
  FBMainDisplayLayoutPublisher *v8;
  id *p_isa;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id result;
  void *v35;
  objc_super v36;
  uint64_t v37;
  uint64_t v38;
  Class (*v39)(uint64_t);
  void *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v36.receiver = self;
    v36.super_class = (Class)FBMainDisplayLayoutPublisher;
    v8 = -[FBMainDisplayLayoutPublisher init](&v36, sel_init);
    p_isa = (id *)&v8->super.isa;
    if (!v8)
    {
LABEL_16:

      return p_isa;
    }
    objc_storeStrong((id *)&v8->_publisher, a3);
    objc_msgSend(p_isa[1], "transitionAssertionWithReason:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBDisplayManager sharedInstance](FBDisplayManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:", p_isa);
    v12 = p_isa[1];
    objc_msgSend(v11, "mainConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDisplayConfiguration:", v13);

    v42 = 0;
    v43 = &v42;
    v44 = 0x2050000000;
    v14 = (void *)getBLSBacklightClass_softClass;
    v45 = getBLSBacklightClass_softClass;
    if (!getBLSBacklightClass_softClass)
    {
      v37 = MEMORY[0x1E0C809B0];
      v38 = 3221225472;
      v39 = __getBLSBacklightClass_block_invoke;
      v40 = &unk_1E4A11EE8;
      v41 = &v42;
      __getBLSBacklightClass_block_invoke((uint64_t)&v37);
      v14 = (void *)v43[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v42, 8);
    objc_msgSend(v15, "sharedBacklight");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v42 = 0;
      v43 = &v42;
      v44 = 0x2050000000;
      v17 = (void *)getBLSRuntimeClass_softClass;
      v45 = getBLSRuntimeClass_softClass;
      if (!getBLSRuntimeClass_softClass)
      {
        v37 = MEMORY[0x1E0C809B0];
        v38 = 3221225472;
        v39 = __getBLSRuntimeClass_block_invoke;
        v40 = &unk_1E4A11EE8;
        v41 = &v42;
        __getBLSRuntimeClass_block_invoke((uint64_t)&v37);
        v17 = (void *)v43[3];
      }
      v18 = objc_retainAutorelease(v17);
      _Block_object_dispose(&v42, 8);
      if (objc_msgSend(v18, "isHostProcess"))
      {
        objc_msgSend(v16, "addObserver:", p_isa);
        objc_msgSend(p_isa, "_updateWithBacklightState:", objc_msgSend(v16, "backlightState"));
LABEL_15:
        objc_msgSend(p_isa[1], "addObserver:", p_isa);
        objc_msgSend(p_isa[1], "activate");
        objc_msgSend(v10, "invalidate");

        goto LABEL_16;
      }
      FBLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[FBMainDisplayLayoutPublisher _initWithPublisher:].cold.3(v19, v27, v28, v29, v30, v31, v32, v33);
    }
    else
    {
      FBLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[FBMainDisplayLayoutPublisher _initWithPublisher:].cold.2(v19, v20, v21, v22, v23, v24, v25, v26);
    }

    objc_msgSend(p_isa[1], "setBacklightLevel:", 100);
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("publisher"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBMainDisplayLayoutPublisher _initWithPublisher:].cold.1(a2);
  objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)dealloc
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  FBMainDisplayLayoutPublisher *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FBMainDisplayLayoutPublisher is a singleton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138544642;
    v9 = v5;
    v10 = 2114;
    v11 = v7;
    v12 = 2048;
    v13 = self;
    v14 = 2114;
    v15 = CFSTR("FBMainDisplayLayoutPublisher.m");
    v16 = 1024;
    v17 = 84;
    v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

void __46__FBMainDisplayLayoutPublisher_sharedInstance__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  FBMainDisplayLayoutPublisher *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  objc_msgSend(MEMORY[0x1E0D23048], "bootstrapConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D22FD8], "environmentAliases");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D23018], "defaultShellMachName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolveMachService:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domainForMachName:", v5);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (!v18)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0D230D0], "serviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "serviceForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v18, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDomainIdentifier:", v9);

    objc_msgSend(MEMORY[0x1E0D230D0], "mainDisplayInstanceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInstanceIdentifier:", v10);

    v11 = [FBMainDisplayLayoutPublisher alloc];
    objc_msgSend(MEMORY[0x1E0D230F0], "publisherWithConfiguration:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[FBMainDisplayLayoutPublisher _initWithPublisher:](v11, "_initWithPublisher:", v12);
    v14 = (void *)sharedInstance___sharedInstance;
    sharedInstance___sharedInstance = v13;

LABEL_4:
    return;
  }
  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D230D0], "serviceIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("failed to find %@ in %@"), v16, v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __46__FBMainDisplayLayoutPublisher_sharedInstance__block_invoke_cold_1(a1);
  objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (int64_t)interfaceOrientation
{
  return -[FBSDisplayLayoutPublisher interfaceOrientation](self->_publisher, "interfaceOrientation");
}

- (int64_t)backlightLevel
{
  return -[FBSDisplayLayoutPublisher backlightLevel](self->_publisher, "backlightLevel");
}

- (void)setBacklightLevel:(int64_t)a3
{
  -[FBSDisplayLayoutPublisher setBacklightLevel:](self->_publisher, "setBacklightLevel:", a3);
}

- (BOOL)isTransitioning
{
  return -[FBSDisplayLayoutPublisher isTransitioning](self->_publisher, "isTransitioning");
}

- (FBSDisplayLayout)currentLayout
{
  return (FBSDisplayLayout *)-[FBSDisplayLayoutPublisher currentLayout](self->_publisher, "currentLayout");
}

- (void)addObserver:(id)a3
{
  -[FBSDisplayLayoutPublisher addObserver:](self->_publisher, "addObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[FBSDisplayLayoutPublisher removeObserver:](self->_publisher, "removeObserver:", a3);
}

- (void)_updateWithBacklightState:(int64_t)a3
{
  if ((unint64_t)a3 <= 3)
    -[FBSDisplayLayoutPublisher setBacklightLevel:](self->_publisher, "setBacklightLevel:", qword_1A3619828[a3]);
  -[FBSDisplayLayoutPublisher setBacklightState:](self->_publisher, "setBacklightState:", a3);
}

- (id)_addElement:(id)a3 forKey:(id)a4
{
  return (id)-[FBSDisplayLayoutPublisher _addElement:forKey:](self->_publisher, "_addElement:forKey:", a3, a4);
}

- (void)displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a5;
  v8 = a4;
  objc_msgSend(a3, "mainIdentity");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
    -[FBSDisplayLayoutPublisher setDisplayConfiguration:](self->_publisher, "setDisplayConfiguration:", v10);

}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvents:(id)a5 abortedEvents:(id)a6
{
  BSInvalidatable *backlightTransition;
  BSInvalidatable *v9;

  v9 = self->_backlightTransition;
  backlightTransition = self->_backlightTransition;
  self->_backlightTransition = 0;

  if (!v9)
  {
    -[FBSDisplayLayoutPublisher transitionAssertionWithReason:](self->_publisher, "transitionAssertionWithReason:", CFSTR("BLSBacklight"));
    v9 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  }
  -[FBMainDisplayLayoutPublisher _updateWithBacklightState:](self, "_updateWithBacklightState:", a4);
  -[BSInvalidatable invalidate](v9, "invalidate");

}

- (void)backlightHost:(id)a3 willTransitionToState:(int64_t)a4 forEvent:(id)a5
{
  FBSDisplayLayoutPublisher *publisher;
  BSInvalidatable *v8;
  BSInvalidatable *backlightTransition;
  BSInvalidatable *v10;

  publisher = self->_publisher;
  v10 = self->_backlightTransition;
  -[FBSDisplayLayoutPublisher transitionAssertionWithReason:](publisher, "transitionAssertionWithReason:", CFSTR("BLSBacklight"));
  v8 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  backlightTransition = self->_backlightTransition;
  self->_backlightTransition = v8;

  -[FBMainDisplayLayoutPublisher _updateWithBacklightState:](self, "_updateWithBacklightState:", a4);
  -[BSInvalidatable invalidate](v10, "invalidate");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backlightTransition, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
}

- (void)_initWithPublisher:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)_initWithPublisher:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1A359A000, a1, a3, "[FBMainDisplayLayoutPublisher] Unable to create BLSBacklight. Main display backlight updates are unavilable.", a5, a6, a7, a8, 0);
}

- (void)_initWithPublisher:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1A359A000, a1, a3, "[FBMainDisplayLayoutPublisher] This process is not a BacklightServices host process. Main display backlight updates are unavilable.", a5, a6, a7, a8, 0);
}

void __46__FBMainDisplayLayoutPublisher_sharedInstance__block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  NSStringFromSelector(*(SEL *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
