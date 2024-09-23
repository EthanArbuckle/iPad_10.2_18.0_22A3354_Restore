@implementation MCMApplicationTerminationAssertion

- (MCMApplicationTerminationAssertion)initWithBundleIdentifier:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  MCMApplicationTerminationAssertion *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  RBSTerminationAssertion *v22;
  int v23;
  NSObject *termAssertion;
  NSObject *v25;
  NSObject *v26;
  MCMApplicationTerminationAssertion *v27;
  id v29;
  objc_super v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE buf[24];
  void *v36;
  uint64_t *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)MCMApplicationTerminationAssertion;
  v8 = -[MCMApplicationTerminationAssertion init](&v30, sel_init);
  if (!v8)
    goto LABEL_31;
  if (!RunningBoardServicesLibraryCore_frameworkLibrary)
  {
    *(_OWORD *)buf = xmmword_1E8CB60E8;
    *(_QWORD *)&buf[16] = 0;
    RunningBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!RunningBoardServicesLibraryCore_frameworkLibrary)
    goto LABEL_31;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2050000000;
  v9 = (void *)getRBSProcessPredicateClass_softClass;
  v34 = getRBSProcessPredicateClass_softClass;
  if (!getRBSProcessPredicateClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getRBSProcessPredicateClass_block_invoke;
    v36 = &unk_1E8CB6108;
    v37 = &v31;
    __getRBSProcessPredicateClass_block_invoke((uint64_t)buf);
    v9 = (void *)v32[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v31, 8);
  objc_msgSend(v10, "predicateMatchingBundleIdentifier:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    container_log_handle_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v6;
      _os_log_error_impl(&dword_1CF807000, v25, OS_LOG_TYPE_ERROR, "Failed to generate predicate for termination assertion for [%@]", buf, 0xCu);
    }

    goto LABEL_30;
  }
  v31 = 0;
  v32 = &v31;
  v33 = 0x2050000000;
  v12 = (void *)getRBSTerminateContextClass_softClass;
  v34 = getRBSTerminateContextClass_softClass;
  if (!getRBSTerminateContextClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getRBSTerminateContextClass_block_invoke;
    v36 = &unk_1E8CB6108;
    v37 = &v31;
    __getRBSTerminateContextClass_block_invoke((uint64_t)buf);
    v12 = (void *)v32[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v31, 8);
  v14 = (void *)objc_msgSend([v13 alloc], "initWithExplanation:", v7);
  v15 = v14;
  if (!v14)
  {
    container_log_handle_for_category();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v6;
      _os_log_error_impl(&dword_1CF807000, v26, OS_LOG_TYPE_ERROR, "Failed to generate context for termination assertion for [%@]", buf, 0xCu);
    }

    goto LABEL_30;
  }
  objc_msgSend(v14, "setExceptionCode:", 3735933956);
  v31 = 0;
  v32 = &v31;
  v33 = 0x2050000000;
  v16 = (void *)getRBSTerminationAssertionClass_softClass;
  v34 = getRBSTerminationAssertionClass_softClass;
  if (!getRBSTerminationAssertionClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getRBSTerminationAssertionClass_block_invoke;
    v36 = &unk_1E8CB6108;
    v37 = &v31;
    __getRBSTerminationAssertionClass_block_invoke((uint64_t)buf);
    v16 = (void *)v32[3];
  }
  v17 = objc_retainAutorelease(v16);
  _Block_object_dispose(&v31, 8);
  v18 = (void *)objc_msgSend([v17 alloc], "initWithPredicate:context:", v11, v15);
  v19 = v18;
  if (v18)
  {
    v29 = 0;
    v20 = objc_msgSend(v18, "acquireWithError:", &v29);
    v21 = v29;
    if ((v20 & 1) != 0)
    {
      v22 = v19;
      v23 = 0;
      termAssertion = v8->_termAssertion;
      v8->_termAssertion = v22;
    }
    else
    {
      container_log_handle_for_category();
      termAssertion = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(termAssertion, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v21;
        _os_log_error_impl(&dword_1CF807000, termAssertion, OS_LOG_TYPE_ERROR, "Failed to acquire termination assertion for [%@]: %@", buf, 0x16u);
      }
      v23 = 1;
    }

  }
  else
  {
    container_log_handle_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v6;
      _os_log_error_impl(&dword_1CF807000, v21, OS_LOG_TYPE_ERROR, "Failed to init termination assertion for [%@]", buf, 0xCu);
    }
    v23 = 1;
  }

  if (!v23)
  {
LABEL_31:
    v27 = v8;
    goto LABEL_32;
  }
LABEL_30:
  v27 = 0;
LABEL_32:

  return v27;
}

- (void)invalidate
{
  void *v3;
  void *v4;

  if (!RunningBoardServicesLibraryCore_frameworkLibrary)
    RunningBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (RunningBoardServicesLibraryCore_frameworkLibrary)
  {
    -[MCMApplicationTerminationAssertion termAssertion](self, "termAssertion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "invalidate");
      -[MCMApplicationTerminationAssertion setTermAssertion:](self, "setTermAssertion:", 0);
    }

  }
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[MCMApplicationTerminationAssertion termAssertion](self, "termAssertion");
  if (objc_claimAutoreleasedReturnValue())
    __assert_rtn("-[MCMApplicationTerminationAssertion dealloc]", "MCMApplicationTerminationAssertion.m", 95, "nil == self.termAssertion");
  v3.receiver = self;
  v3.super_class = (Class)MCMApplicationTerminationAssertion;
  -[MCMApplicationTerminationAssertion dealloc](&v3, sel_dealloc);
}

- (RBSTerminationAssertion)termAssertion
{
  return self->_termAssertion;
}

- (void)setTermAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_termAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termAssertion, 0);
}

@end
