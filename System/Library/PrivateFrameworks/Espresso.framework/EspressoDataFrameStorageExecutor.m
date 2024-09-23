@implementation EspressoDataFrameStorageExecutor

- (void)executeDataFrameStorage:(id)a3 withNetwork:(id)a4 block:(id)a5 blockPrepareForIndex:(id)a6
{
  uint64_t v8;
  void *var0;
  void (**v10)(id, _QWORD, float);
  void (**v11)(id, unint64_t);
  unint64_t i;
  void *v13;
  void *v14;
  id v15;
  char *v16;
  Espresso *v17;
  const char *v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  Espresso *v22;
  const char *v23;
  std::chrono::steady_clock::time_point v24;
  int v25;
  std::chrono::steady_clock::time_point v26;
  std::chrono::steady_clock::time_point v27;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep rep;
  Espresso *v29;
  const char *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  uint64_t v38;

  v8 = *(_QWORD *)&a4.var1;
  var0 = a4.var0;
  v38 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v10 = (void (**)(id, _QWORD, float))a5;
  v11 = (void (**)(id, unint64_t))a6;
  for (i = 0; i < objc_msgSend(v35, "numberOfDataFrames"); ++i)
  {
    objc_msgSend(v35, "dataFrameAtIndex:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_opt_new();
    if (v11)
      v11[2](v11, i);
    objc_msgSend(v13, "getFunctionName");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = (char *)objc_msgSend(v15, "UTF8String");

    if (v16)
      espresso_network_set_function_name(var0, v8, v16);
    v17 = (Espresso *)objc_msgSend(v14, "bindInputsFromFrame:toNetwork:", v13, var0, v8);
    if ((_DWORD)v17)
    {
      Espresso::espresso_os_log_subsystem(v17, v18);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v20 = v19;
        v21 = "Error binding inputs";
        goto LABEL_21;
      }
      goto LABEL_12;
    }
    v22 = (Espresso *)objc_msgSend(v14, "bindOutputsFromFrame:toNetwork:executionStatus:", v13, var0, v8, 1);
    if ((_DWORD)v22)
    {
      Espresso::espresso_os_log_subsystem(v22, v23);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v20 = v19;
        v21 = "Error binding static outputs";
LABEL_21:
        _os_log_error_impl(&dword_190DAF000, v20, OS_LOG_TYPE_ERROR, v21, buf, 2u);
      }
LABEL_12:

      v10[2](v10, 0, 0.0);
      goto LABEL_13;
    }
    v24.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    v25 = espresso_plan_execute_sync(var0);
    v26.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    if (v25)
    {
      Espresso::espresso_os_log_subsystem((Espresso *)v26.__d_.__rep_, (const char *)v27.__d_.__rep_);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        espresso_plan_get_error_info((uint64_t)var0);
        *(_DWORD *)buf = 136315138;
        v37 = v34;
        _os_log_error_impl(&dword_190DAF000, v33, OS_LOG_TYPE_ERROR, "Execution error: %s", buf, 0xCu);
      }

      v10[2](v10, 0, 0.0);
      break;
    }
    rep = v26.__d_.__rep_;
    v29 = (Espresso *)objc_msgSend(v14, "bindOutputsFromFrame:toNetwork:executionStatus:", v13, var0, v8, 2);
    if ((_DWORD)v29)
    {
      Espresso::espresso_os_log_subsystem(v29, v30);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_190DAF000, v31, OS_LOG_TYPE_ERROR, "Error binding dynamic outputs", buf, 2u);
      }

      v10[2](v10, 0, 0.0);
    }
    else
    {
      objc_msgSend(v14, "outputMatchingBuffers");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, float))v10)[2](v10, v32, (float)((rep - v24.__d_.__rep_) / 1000));

      objc_msgSend(v14, "freeTemporaryResources");
    }
LABEL_13:

  }
}

- (void)executeDataFrameStorage:(id)a3 withNetwork:(id)a4 referenceNetwork:(id)a5 block:(id)a6 blockPrepareForIndex:(id)a7
{
  void *v8;
  id v9;
  void (**v10)(id, _QWORD, float);
  void (**v11)(id, unint64_t);
  unint64_t i;
  void *v13;
  void *v14;
  Espresso *v15;
  const char *v16;
  NSObject *v17;
  Espresso *v18;
  const char *v19;
  Espresso *v20;
  const char *v21;
  Espresso *v22;
  const char *v23;
  std::chrono::steady_clock::time_point v24;
  int v25;
  std::chrono::steady_clock::time_point v26;
  std::chrono::steady_clock::time_point v27;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep rep;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *var0;
  uint64_t v36;
  uint8_t buf[4];
  uint64_t v38;
  uint64_t v39;

  var0 = a4.var0;
  v36 = *(_QWORD *)&a5.var1;
  v8 = a5.var0;
  v34 = *(_QWORD *)&a4.var1;
  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(id, _QWORD, float))a6;
  v11 = (void (**)(id, unint64_t))a7;
  for (i = 0; i < objc_msgSend(v9, "numberOfDataFrames"); ++i)
  {
    objc_msgSend(v9, "dataFrameAtIndex:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_opt_new();
    if (v11)
      v11[2](v11, i);
    v15 = (Espresso *)objc_msgSend(v14, "bindInputsFromFrame:toNetwork:", v13, v8, v36);
    if ((_DWORD)v15)
    {
      Espresso::espresso_os_log_subsystem(v15, v16);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      goto LABEL_14;
    }
    v18 = (Espresso *)objc_msgSend(v14, "bindInputsFromFrame:toNetwork:", v13, var0, v34);
    if ((_DWORD)v18)
    {
      Espresso::espresso_os_log_subsystem(v18, v19);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
LABEL_13:
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_190DAF000, v17, OS_LOG_TYPE_ERROR, "Error binding inputs", buf, 2u);
      }
LABEL_14:

      v10[2](v10, 0, 0.0);
      goto LABEL_15;
    }
    v20 = (Espresso *)objc_msgSend(v14, "bindOutputsFromFrame:toNetwork:referenceNetwork:", v13, var0, v34, v8, v36);
    if ((_DWORD)v20)
    {
      Espresso::espresso_os_log_subsystem(v20, v21);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      goto LABEL_14;
    }
    v22 = (Espresso *)espresso_plan_execute_sync(v8);
    if ((_DWORD)v22)
    {
      Espresso::espresso_os_log_subsystem(v22, v23);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        espresso_plan_get_error_info((uint64_t)v8);
        *(_DWORD *)buf = 136315138;
        v38 = v32;
        _os_log_error_impl(&dword_190DAF000, v30, OS_LOG_TYPE_ERROR, "Execution error: %s", buf, 0xCu);
      }

      v10[2](v10, 0, 0.0);
      goto LABEL_25;
    }
    v24.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    v25 = espresso_plan_execute_sync(var0);
    v26.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    if (v25)
    {
      Espresso::espresso_os_log_subsystem((Espresso *)v26.__d_.__rep_, (const char *)v27.__d_.__rep_);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        espresso_plan_get_error_info((uint64_t)var0);
        *(_DWORD *)buf = 136315138;
        v38 = v33;
        _os_log_error_impl(&dword_190DAF000, v31, OS_LOG_TYPE_ERROR, "Execution error: %s", buf, 0xCu);
      }

      v10[2](v10, 0, 0.0);
LABEL_25:

      break;
    }
    rep = v26.__d_.__rep_;
    objc_msgSend(v14, "outputMatchingBuffers");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, float))v10)[2](v10, v29, (float)((rep - v24.__d_.__rep_) / 1000));

    objc_msgSend(v14, "freeTemporaryResources");
LABEL_15:

  }
}

- (void)executeDataFrameStorage:(id)a3 withNetwork:(id)a4 block:(id)a5
{
  -[EspressoDataFrameStorageExecutor executeDataFrameStorage:withNetwork:block:blockPrepareForIndex:](self, "executeDataFrameStorage:withNetwork:block:blockPrepareForIndex:", a3, a4.var0, *(_QWORD *)&a4.var1, a5, 0);
}

@end
