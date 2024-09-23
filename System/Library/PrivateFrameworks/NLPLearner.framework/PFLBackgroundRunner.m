@implementation PFLBackgroundRunner

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_2);
}

void __33__PFLBackgroundRunner_initialize__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.NLP", "PFLBackgroundRunner");
  v1 = (void *)sLog_6;
  sLog_6 = (uint64_t)v0;

}

- (PFLBackgroundRunner)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFLBackgroundRunner;
  return -[PFLBackgroundRunner init](&v3, sel_init);
}

- (void)cleanup
{
  void *v3;
  id v4;

  -[PFLBackgroundRunner assertion](self, "assertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PFLBackgroundRunner assertion](self, "assertion");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

  }
}

- (BOOL)prepareForActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
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
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("QuickTypePFLBackgroundTask"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    v33 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v33);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v33;
    -[PFLBackgroundRunner setTask:](self, "setTask:", v7);

    -[PFLBackgroundRunner task](self, "task");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BE80B88], "attributeWithDomain:name:", CFSTR("com.apple.NLPLearner"), CFSTR("AccessGPU"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_alloc(MEMORY[0x24BE80B10]);
      objc_msgSend(MEMORY[0x24BE80D38], "targetWithPid:", getpid());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v11, "initWithExplanation:target:attributes:", CFSTR("PFL training"), v12, v13);

      v32 = 0;
      v15 = objc_msgSend(v14, "acquireWithError:", &v32);
      v16 = v32;

      v17 = sLog_6;
      if ((v15 & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)sLog_6, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v14;
          _os_log_impl(&dword_22630F000, v17, OS_LOG_TYPE_INFO, "acquired assertion for background task runner %@", buf, 0xCu);
        }
        -[PFLBackgroundRunner setAssertion:](self, "setAssertion:", v14);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)sLog_6, OS_LOG_TYPE_ERROR))
          -[PFLBackgroundRunner prepareForActivity:].cold.3((uint64_t)v16, v17, v25, v26, v27, v28, v29, v30);
        objc_msgSend(v14, "invalidate");
      }

    }
    else
    {
      if (os_log_type_enabled((os_log_t)sLog_6, OS_LOG_TYPE_ERROR))
        -[PFLBackgroundRunner prepareForActivity:].cold.2();
      v15 = 0;
      v16 = v8;
    }

  }
  else
  {
    v18 = sLog_6;
    if (os_log_type_enabled((os_log_t)sLog_6, OS_LOG_TYPE_ERROR))
      -[PFLBackgroundRunner prepareForActivity:].cold.1((uint64_t)v4, v18, v19, v20, v21, v22, v23, v24);
    v15 = 0;
  }

  return v15;
}

- (unsigned)start
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  unsigned __int8 v13;
  uint8_t v15[16];
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  __int128 *p_buf;
  id v20;
  __int128 buf;
  uint64_t v22;
  char v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[PFLBackgroundRunner task](self, "task");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = sLog_6;
  if (os_log_type_enabled((os_log_t)sLog_6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_22630F000, v5, OS_LOG_TYPE_DEFAULT, "starting PFLBackgroundRunner with task url %@", (uint8_t *)&buf, 0xCu);
  }
  v20 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2D148]), "initWithResumptionURL:error:", v4, &v20);
  v7 = v20;
  v8 = v7;
  if (!v6 || v7)
  {
    if (os_log_type_enabled((os_log_t)sLog_6, OS_LOG_TYPE_ERROR))
      -[PFLBackgroundRunner start].cold.1();
    v13 = 1;
  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v22 = 0x2020000000;
    v23 = 1;
    v9 = dispatch_group_create();
    dispatch_group_enter(v9);
    objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __28__PFLBackgroundRunner_start__block_invoke;
    v16[3] = &unk_24EDB9430;
    p_buf = &buf;
    v11 = v9;
    v17 = v11;
    v18 = v6;
    objc_msgSend(v18, "downloadAttachmentsWithConfiguration:completion:", v10, v16);

    dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    -[PFLBackgroundRunner cleanup](self, "cleanup");
    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      v12 = sLog_6;
      v13 = 0;
      if (os_log_type_enabled((os_log_t)sLog_6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_22630F000, v12, OS_LOG_TYPE_DEFAULT, "finished posting results", v15, 2u);
        v13 = 0;
      }
    }
    else
    {
      v13 = 1;
    }

    _Block_object_dispose(&buf, 8);
  }

  return v13;
}

void __28__PFLBackgroundRunner_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  _BOOL4 v22;
  uint64_t v23;
  NSObject *v24;
  id *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v4 = sLog_6;
    if (os_log_type_enabled((os_log_t)sLog_6, OS_LOG_TYPE_ERROR))
      __28__PFLBackgroundRunner_start__block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    v11 = (void *)sLog_6;
    if (os_log_type_enabled((os_log_t)sLog_6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(void **)(a1 + 40);
      v13 = v11;
      objc_msgSend(v12, "recipe");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "matchingRecordSet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v40 = v12;
      v41 = 2112;
      v42 = v14;
      v43 = 2112;
      v44 = v15;
      _os_log_impl(&dword_22630F000, v13, OS_LOG_TYPE_DEFAULT, "training with session:%@ recipe:%@ recordSet:%@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "recipe");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "matchingRecordSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    v38 = 0;
    trainMLPModelForDES(v16, v17, &v38, &v37);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v38;
    v20 = v37;

    v21 = sLog_6;
    v22 = os_log_type_enabled((os_log_t)sLog_6, OS_LOG_TYPE_DEFAULT);
    if (v20 || !v18)
    {
      if (v22)
      {
        v27 = *(void **)(a1 + 40);
        v28 = v21;
        objc_msgSend(v27, "recipe");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "matchingRecordSet");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v40 = v29;
        v41 = 2112;
        v42 = v30;
        v43 = 2112;
        v44 = v20;
        _os_log_impl(&dword_22630F000, v28, OS_LOG_TYPE_DEFAULT, "quicktype training failed for recipe:%@ recordSet:%@ err:%@", buf, 0x20u);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      v31 = *(NSObject **)(a1 + 32);
      v23 = a1 + 32;
      dispatch_group_enter(v31);
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __28__PFLBackgroundRunner_start__block_invoke_51;
      v35[3] = &unk_24EDB9408;
      v25 = &v36;
      v32 = *(void **)(v23 + 8);
      v36 = *(id *)v23;
      objc_msgSend(v32, "completeWithError:completionHandler:", v20, v35);
    }
    else
    {
      if (v22)
      {
        *(_DWORD *)buf = 138412290;
        v40 = v18;
        _os_log_impl(&dword_22630F000, v21, OS_LOG_TYPE_DEFAULT, "training succeeded with json result %@", buf, 0xCu);
      }
      v24 = *(NSObject **)(a1 + 32);
      v23 = a1 + 32;
      dispatch_group_enter(v24);
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __28__PFLBackgroundRunner_start__block_invoke_52;
      v33[3] = &unk_24EDB9408;
      v25 = &v34;
      v26 = *(void **)(v23 + 8);
      v34 = *(id *)v23;
      objc_msgSend(v26, "completeWithJSONResult:binaryResult:completionHandler:", v18, v19, v33);
    }
    dispatch_group_leave(*(dispatch_group_t *)v23);

  }
}

void __28__PFLBackgroundRunner_start__block_invoke_51(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __28__PFLBackgroundRunner_start__block_invoke_52(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)stop
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = sLog_6;
  if (os_log_type_enabled((os_log_t)sLog_6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22630F000, v3, OS_LOG_TYPE_DEFAULT, "stopping background task runner", v4, 2u);
  }
  -[PFLBackgroundRunner cleanup](self, "cleanup");
}

- (_DASActivity)activity
{
  return self->_activity;
}

- (QuickTypePFLBackgroundTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (RBSAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_assertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

- (void)prepareForActivity:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_22630F000, a2, a3, "missing serialized task from activity %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)prepareForActivity:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_22630F000, v0, v1, "unable to de-serialize task from data %@ err:%@");
  OUTLINED_FUNCTION_1();
}

- (void)prepareForActivity:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_22630F000, a2, a3, "failed to acquire AccessGPU RBSAssertion, unable to run PFL training, err:%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)start
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_22630F000, v0, v1, "unable to reconstruct session from url:%@ err:%@");
  OUTLINED_FUNCTION_1();
}

void __28__PFLBackgroundRunner_start__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_22630F000, a2, a3, "session attachements failed downloaded with err:%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
