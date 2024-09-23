@implementation BSServiceConnectionEndpointInjector

- (void)setTarget:(id)a3
{
  RBSTarget *v5;
  RBSTarget *target;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BSServiceConnectionEndpointInjector *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("target"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v13 = v9;
      v14 = 2114;
      v15 = v11;
      v16 = 2048;
      v17 = self;
      v18 = 2114;
      v19 = CFSTR("BSServiceConnectionEndpointInjector.m");
      v20 = 1024;
      v21 = 139;
      v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7A52B4);
  }
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = (RBSTarget *)objc_msgSend(a3, "copy");
  target = self->_target;
  self->_target = v5;

}

- (void)setInheritingEnvironment:(id)a3
{
  NSString *v5;
  NSString *inheritingEnvironment;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BSServiceConnectionEndpointInjector *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("inheritingEnvironment"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v13 = v9;
      v14 = 2114;
      v15 = v11;
      v16 = 2048;
      v17 = self;
      v18 = 2114;
      v19 = CFSTR("BSServiceConnectionEndpointInjector.m");
      v20 = 1024;
      v21 = 163;
      v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7B3C00);
  }
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = (NSString *)objc_msgSend(a3, "copy");
  inheritingEnvironment = self->_inheritingEnvironment;
  self->_inheritingEnvironment = v5;

}

- (void)setAdditionalAttributes:(id)a3
{
  NSArray *v5;
  NSArray *additionalAttributes;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BSServiceConnectionEndpointInjector *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("attributes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v13 = v9;
      v14 = 2114;
      v15 = v11;
      v16 = 2048;
      v17 = self;
      v18 = 2114;
      v19 = CFSTR("BSServiceConnectionEndpointInjector.m");
      v20 = 1024;
      v21 = 169;
      v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7B3DA8);
  }
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = (NSArray *)objc_msgSend(a3, "copy");
  additionalAttributes = self->_additionalAttributes;
  self->_additionalAttributes = v5;

}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  RBSAssertion *assertion;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[RBSAssertion invalidate](self->_assertion, "invalidate");
    assertion = self->_assertion;
    self->_assertion = 0;

  }
  os_unfair_lock_unlock(p_lock);
}

+ (id)injectorWithConfigurator:(id)a3
{
  BSServiceConnectionEndpointInjector *v4;
  void *v5;
  void *v6;
  id v7;
  BSServiceConnectionEndpointInjector *v8;
  void *v9;
  NSString *domain;
  NSString *service;
  NSString *instance;
  void *v13;
  id v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id RBSHereditaryGrantClass;
  void *v24;
  id v25;
  objc_class *v26;
  uint64_t v27;
  RBSAssertion *assertion;
  RBSAssertion *v29;
  char v30;
  id v31;
  NSArray *additionalAttributes;
  NSObject *v33;
  RBSAssertion *v34;
  NSArray *v35;
  void *v37;
  id v38;
  objc_class *v39;
  void *v40;
  RBSTarget *target;
  BSServiceConnectionEndpointInjector *v42;
  void *v43;
  id v44;
  objc_class *v45;
  void *v46;
  void *v47;
  id v48;
  objc_class *v49;
  void *v50;
  void *v51;
  id v52;
  objc_class *v53;
  void *v54;
  void *v55;
  id v56;
  objc_class *v57;
  void *v58;
  void *v59;
  id v60;
  objc_class *v61;
  void *v62;
  objc_super v63;
  id v64;
  id *v65;
  uint64_t v66;
  uint64_t v67;
  _BYTE buf[24];
  BSServiceConnectionEndpointInjector *v69;
  _BYTE v70[10];
  __int16 v71;
  int v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = [BSServiceConnectionEndpointInjector alloc];
  +[BSServiceManager sharedInstanceCreatingIfNecessary:]((uint64_t)BSServiceManager, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v7 = v5;
    NSClassFromString(CFSTR("BSServiceManager"));
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithManager_configurator_);
        v44 = (id)objc_claimAutoreleasedReturnValue();
        v45 = (objc_class *)objc_opt_class();
        NSStringFromClass(v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        *(_QWORD *)&buf[4] = v44;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v46;
        *(_WORD *)&buf[22] = 2048;
        v69 = v4;
        *(_WORD *)v70 = 2114;
        *(_QWORD *)&v70[2] = CFSTR("BSServiceConnectionEndpointInjector.m");
        v71 = 1024;
        v72 = 59;
        v73 = 2114;
        v74 = v43;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v43), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7B5694);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSServiceManagerClass]"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithManager_configurator_);
        v48 = (id)objc_claimAutoreleasedReturnValue();
        v49 = (objc_class *)objc_opt_class();
        NSStringFromClass(v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        *(_QWORD *)&buf[4] = v48;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v50;
        *(_WORD *)&buf[22] = 2048;
        v69 = v4;
        *(_WORD *)v70 = 2114;
        *(_QWORD *)&v70[2] = CFSTR("BSServiceConnectionEndpointInjector.m");
        v71 = 1024;
        v72 = 59;
        v73 = 2114;
        v74 = v47;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v47), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7B5794);
    }

    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("block"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithManager_configurator_);
        v52 = (id)objc_claimAutoreleasedReturnValue();
        v53 = (objc_class *)objc_opt_class();
        NSStringFromClass(v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        *(_QWORD *)&buf[4] = v52;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v54;
        *(_WORD *)&buf[22] = 2048;
        v69 = v4;
        *(_WORD *)v70 = 2114;
        *(_QWORD *)&v70[2] = CFSTR("BSServiceConnectionEndpointInjector.m");
        v71 = 1024;
        v72 = 60;
        v73 = 2114;
        v74 = v51;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v51), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7B5894);
    }
    v63.receiver = v4;
    v63.super_class = (Class)BSServiceConnectionEndpointInjector;
    v8 = objc_msgSendSuper2(&v63, sel_init);
    v4 = v8;
    if (v8)
    {
      v8->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v8->_manager, v6);
      os_unfair_lock_lock(&v4->_lock);
      (*((void (**)(id, BSServiceConnectionEndpointInjector *))a3 + 2))(a3, v4);
      if (!v4->_target)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must configure a target"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithManager_configurator_);
          v56 = (id)objc_claimAutoreleasedReturnValue();
          v57 = (objc_class *)objc_opt_class();
          NSStringFromClass(v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          *(_QWORD *)&buf[4] = v56;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v58;
          *(_WORD *)&buf[22] = 2048;
          v69 = v4;
          *(_WORD *)v70 = 2114;
          *(_QWORD *)&v70[2] = CFSTR("BSServiceConnectionEndpointInjector.m");
          v71 = 1024;
          v72 = 70;
          v73 = 2114;
          v74 = v55;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v55), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7B5988);
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      domain = v4->_domain;
      if (domain && (service = v4->_service) != 0)
      {
        instance = v4->_instance;
        if (instance)
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("injecting \"%@\"-\"%@\"-\"%@\"), domain, v4->_service, instance);
        else
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("injecting \"%@\"-\"%@\"), v4->_domain, service);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[BSServiceConnectionEndpoint _endpointForManager:domain:service:instance:]((uint64_t)BSServiceConnectionEndpoint, v7, v4->_domain, v4->_service, v4->_instance);
        v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no endpoint found for domain=\"%@\" service=\"%@\" instance=\"%@\"), v4->_domain, v4->_service, v4->_instance);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel__initWithManager_configurator_);
            v60 = (id)objc_claimAutoreleasedReturnValue();
            v61 = (objc_class *)objc_opt_class();
            NSStringFromClass(v61);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            *(_QWORD *)&buf[4] = v60;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v62;
            *(_WORD *)&buf[22] = 2048;
            v69 = v4;
            *(_WORD *)v70 = 2114;
            *(_QWORD *)&v70[2] = CFSTR("BSServiceConnectionEndpointInjector.m");
            v71 = 1024;
            v72 = 82;
            v73 = 2114;
            v74 = v59;
            _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          objc_msgSend(objc_retainAutorelease(v59), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19A7B5A88);
        }
        v64 = 0;
        v65 = &v64;
        v66 = 0x2050000000;
        v18 = (id)_MergedGlobals_1;
        v67 = _MergedGlobals_1;
        if (!_MergedGlobals_1)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __getRBSEndowmentGrantClass_block_invoke;
          v69 = (BSServiceConnectionEndpointInjector *)&unk_1E390CE38;
          *(_QWORD *)v70 = &v64;
          __getRBSEndowmentGrantClass_block_invoke((uint64_t)buf);
          v18 = v65[3];
        }
        v19 = objc_retainAutorelease(v18);
        _Block_object_dispose(&v64, 8);
        BSServiceEndpointGrantNamespace();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[BSServiceConnectionEndpoint _endowmentRepresentation](v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "grantWithNamespace:endowment:", v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v22);

        if (v4->_inheritingEnvironment)
        {
          objc_msgSend(v17, "stringByAppendingFormat:", CFSTR(" + inherited from %i<%@> to %@"), getpid(), v4->_inheritingEnvironment, v4->_target);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          RBSHereditaryGrantClass = getRBSHereditaryGrantClass();
          BSServiceEndpointGrantNamespace();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(RBSHereditaryGrantClass, "grantWithNamespace:sourceEnvironment:attributes:", v16, v4->_inheritingEnvironment, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v24);

        }
        else
        {
          objc_msgSend(v17, "stringByAppendingFormat:", CFSTR(" to %@"), v4->_target);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v17;
        }
      }
      else
      {
        if (!v4->_inheritingEnvironment)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unsupported configuration : domain=\"%@\" service=\"%@\" inheritingEnvironment=\"%@\"), domain, v4->_service, 0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel__initWithManager_configurator_);
            v38 = (id)objc_claimAutoreleasedReturnValue();
            v39 = (objc_class *)objc_opt_class();
            NSStringFromClass(v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            *(_QWORD *)&buf[4] = v38;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v40;
            *(_WORD *)&buf[22] = 2048;
            v69 = v4;
            *(_WORD *)v70 = 2114;
            *(_QWORD *)&v70[2] = CFSTR("BSServiceConnectionEndpointInjector.m");
            v71 = 1024;
            v72 = 105;
            v73 = 2114;
            v74 = v37;
            _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          objc_msgSend(objc_retainAutorelease(v37), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19A7B552CLL);
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("injecting inherited from \"%@\" to %@"), v4->_inheritingEnvironment, v4->_target);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = getRBSHereditaryGrantClass();
        BSServiceEndpointGrantNamespace();
        v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "grantWithNamespace:sourceEnvironment:attributes:", v15, v4->_inheritingEnvironment, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v16);
      }

      if (-[NSArray count](v4->_additionalAttributes, "count"))
        objc_msgSend(v9, "addObjectsFromArray:", v4->_additionalAttributes);
      v64 = 0;
      v65 = &v64;
      v66 = 0x2050000000;
      v25 = (id)qword_1ECD9C590;
      v67 = qword_1ECD9C590;
      if (!qword_1ECD9C590)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getRBSAssertionClass_block_invoke;
        v69 = (BSServiceConnectionEndpointInjector *)&unk_1E390CE38;
        *(_QWORD *)v70 = &v64;
        __getRBSAssertionClass_block_invoke((uint64_t)buf);
        v25 = v65[3];
      }
      v26 = (objc_class *)objc_retainAutorelease(v25);
      _Block_object_dispose(&v64, 8);
      v27 = objc_msgSend([v26 alloc], "initWithExplanation:target:attributes:", v13, v4->_target, v9);
      assertion = v4->_assertion;
      v4->_assertion = (RBSAssertion *)v27;

      v29 = v4->_assertion;
      v64 = 0;
      v30 = -[RBSAssertion acquireWithError:](v29, "acquireWithError:", &v64);
      v31 = v64;
      if ((v30 & 1) != 0)
      {
        additionalAttributes = v4->_additionalAttributes;
        v4->_additionalAttributes = 0;

        os_unfair_lock_unlock(&v4->_lock);
      }
      else
      {
        BSServiceInjectionLog();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          target = v4->_target;
          objc_msgSend(v31, "succinctDescription");
          v42 = (BSServiceConnectionEndpointInjector *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v13;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = target;
          *(_WORD *)&buf[22] = 2114;
          v69 = v42;
          _os_log_error_impl(&dword_19A799000, v33, OS_LOG_TYPE_ERROR, "%@ -> failed to acquire on %@ : %{public}@", buf, 0x20u);

        }
        v4->_invalidated = 1;
        v34 = v4->_assertion;
        v4->_assertion = 0;

        v35 = v4->_additionalAttributes;
        v4->_additionalAttributes = 0;

        os_unfair_lock_unlock(&v4->_lock);
        v4 = 0;
      }

    }
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_inheritingEnvironment, 0);
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_additionalAttributes, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

- (void)dealloc
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSServiceConnectionEndpointInjector *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must invalidate before dealloc"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v5 = (id)objc_claimAutoreleasedReturnValue();
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
      v16 = CFSTR("BSServiceConnectionEndpointInjector.m");
      v17 = 1024;
      v18 = 133;
      v19 = 2114;
      v20 = v4;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7B9EECLL);
  }
  v8.receiver = self;
  v8.super_class = (Class)BSServiceConnectionEndpointInjector;
  -[BSServiceConnectionEndpointInjector dealloc](&v8, sel_dealloc);
}

- (BSServiceConnectionEndpointInjector)init
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  BSServiceConnectionEndpointInjector *result;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSServiceConnectionEndpointInjector *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init is not allowed on BSServiceConnectionEndpointInjector"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
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
    v16 = CFSTR("BSServiceConnectionEndpointInjector.m");
    v17 = 1024;
    v18 = 54;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BSServiceConnectionEndpointInjector *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)setDomain:(id)a3
{
  NSString *v5;
  NSString *domain;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BSServiceConnectionEndpointInjector *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("domain"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v13 = v9;
      v14 = 2114;
      v15 = v11;
      v16 = 2048;
      v17 = self;
      v18 = 2114;
      v19 = CFSTR("BSServiceConnectionEndpointInjector.m");
      v20 = 1024;
      v21 = 145;
      v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BD474);
  }
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = (NSString *)objc_msgSend(a3, "copy");
  domain = self->_domain;
  self->_domain = v5;

}

- (void)setService:(id)a3
{
  NSString *v5;
  NSString *service;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BSServiceConnectionEndpointInjector *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("service"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v13 = v9;
      v14 = 2114;
      v15 = v11;
      v16 = 2048;
      v17 = self;
      v18 = 2114;
      v19 = CFSTR("BSServiceConnectionEndpointInjector.m");
      v20 = 1024;
      v21 = 151;
      v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BD61CLL);
  }
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = (NSString *)objc_msgSend(a3, "copy");
  service = self->_service;
  self->_service = v5;

}

- (void)setInstance:(id)a3
{
  NSString *v5;
  NSString *instance;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BSServiceConnectionEndpointInjector *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("instance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v13 = v9;
      v14 = 2114;
      v15 = v11;
      v16 = 2048;
      v17 = self;
      v18 = 2114;
      v19 = CFSTR("BSServiceConnectionEndpointInjector.m");
      v20 = 1024;
      v21 = 157;
      v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BD7C4);
  }
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = (NSString *)objc_msgSend(a3, "copy");
  instance = self->_instance;
  self->_instance = v5;

}

- (NSString)description
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  const __CFString *v6;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_target, CFSTR("target"));
  objc_msgSend(v4, "appendString:withName:skipIfEmpty:", self->_domain, CFSTR("domain"), 1);
  objc_msgSend(v4, "appendString:withName:skipIfEmpty:", self->_service, CFSTR("service"), 1);
  objc_msgSend(v4, "appendString:withName:skipIfEmpty:", self->_instance, CFSTR("instance"), 1);
  objc_msgSend(v4, "appendString:withName:skipIfEmpty:", self->_inheritingEnvironment, CFSTR("inheritingEnvironment"), 1);
  if (self->_invalidated)
  {
    v6 = CFSTR("invalidated");
  }
  else
  {
    if (self->_assertion)
      goto LABEL_5;
    v6 = CFSTR("inactive");
  }
  objc_msgSend(v4, "appendString:withName:", v6, 0);
LABEL_5:
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v4, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

@end
