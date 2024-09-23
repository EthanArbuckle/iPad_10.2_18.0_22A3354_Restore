@implementation NPKQuickPaymentSessionLocalAuthenticationCoordinator

- (NPKQuickPaymentSessionLocalAuthenticationCoordinator)initWithCallbackQueue:(id)a3
{
  id v5;
  NPKQuickPaymentSessionLocalAuthenticationCoordinator *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *localAuthenticationQueue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NPKQuickPaymentSessionLocalAuthenticationCoordinator;
  v6 = -[NPKQuickPaymentSessionLocalAuthenticationCoordinator init](&v11, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.nanopassbook.lacoordinator", v7);
    localAuthenticationQueue = v6->_localAuthenticationQueue;
    v6->_localAuthenticationQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_callbackQueue, a3);
  }

  return v6;
}

- (void)beginLocalAuthenticationWithCompletion:(id)a3
{
  -[NPKQuickPaymentSessionLocalAuthenticationCoordinator beginLocalAuthenticationWithPolicy:completion:](self, "beginLocalAuthenticationWithPolicy:completion:", 1004, a3);
}

- (void)beginLocalAuthenticationWithPolicy:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *localAuthenticationQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  localAuthenticationQueue = self->_localAuthenticationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __102__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithPolicy_completion___block_invoke;
  block[3] = &unk_24CFE9268;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(localAuthenticationQueue, block);

}

void __102__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithPolicy_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  _BOOL4 v33;
  NSObject *v34;
  _BOOL4 v35;
  NSObject *v36;
  id WeakRetained;
  NSObject *v38;
  _BOOL4 v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  id v47;
  id v48;
  _QWORD block[4];
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[2];
  uint8_t buf[4];
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)MEMORY[0x2199B6780](*(_QWORD *)(a1 + 40));
      *(_DWORD *)buf = 138412290;
      v62 = v5;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: begin local authentication with completion:%@", buf, 0xCu);

    }
  }
  v6 = (void *)MEMORY[0x24BE6E9C8];
  v7 = *MEMORY[0x24BE6F178];
  v60[0] = *MEMORY[0x24BE6F158];
  v60[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = *MEMORY[0x24BE6F018];
  v59 = *MEMORY[0x24BE6F0A0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subjects:sendEvent:", v8, v9);

  v10 = *(_QWORD **)(a1 + 32);
  if (v10[4])
  {
    pk_Payment_log();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      pk_Payment_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: existing completion handler", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDA908], -9, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_invokeCompletionHandlerForInvalidationWithError:", v14);

    v10 = *(_QWORD **)(a1 + 32);
  }
  if (v10[5])
  {
    pk_Payment_log();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      pk_Payment_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: already-completed context", buf, 2u);
      }

    }
    if (*(_QWORD *)(a1 + 40))
    {
      v18 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
      v19 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
      v20 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
      v21 = *(_QWORD *)(a1 + 32);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = 0;

      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(void **)(v23 + 48);
      *(_QWORD *)(v23 + 48) = 0;

      v25 = *(_QWORD *)(a1 + 32);
      v26 = *(void **)(v25 + 56);
      *(_QWORD *)(v25 + 56) = 0;

      v53[0] = MEMORY[0x24BDAC760];
      v53[1] = 3221225472;
      v53[2] = __102__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithPolicy_completion___block_invoke_35;
      v53[3] = &unk_24CFEB998;
      v27 = *(void **)(a1 + 32);
      v28 = *(id *)(a1 + 40);
      v54 = v18;
      v55 = v19;
      v56 = v20;
      v57 = v28;
      v29 = v20;
      v30 = v19;
      v31 = v18;
      objc_msgSend(v27, "_performDelegateCallback:", v53);

LABEL_18:
LABEL_19:

    }
  }
  else
  {
    objc_msgSend(v10, "setCompletionHandler:", *(_QWORD *)(a1 + 40));
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
    {
      kdebug_trace();
      v31 = objc_alloc_init(MEMORY[0x24BDDA938]);
      pk_Payment_log();
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);

      if (v35)
      {
        pk_Payment_log();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_213518000, v36, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: created new context", buf, 2u);
        }

      }
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));

      pk_Payment_log();
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);

      if (WeakRetained)
      {
        if (v39)
        {
          pk_Payment_log();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_213518000, v40, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: evaluating asynchronously", buf, 2u);
          }

        }
        -[NSObject setUiDelegate:](v31, "setUiDelegate:", *(_QWORD *)(a1 + 32));
        dispatch_get_global_queue(0, 0);
        v41 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __102__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithPolicy_completion___block_invoke_38;
        block[3] = &unk_24CFE83A8;
        v42 = v31;
        v43 = *(_QWORD *)(a1 + 48);
        v44 = *(_QWORD *)(a1 + 32);
        v50 = v42;
        v51 = v44;
        v52 = v43;
        dispatch_async(v41, block);

        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), v31);
        v30 = v50;
      }
      else
      {
        if (v39)
        {
          pk_Payment_log();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_213518000, v45, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: evaluating synchronously", buf, 2u);
          }

        }
        -[NSObject setUiDelegate:](v31, "setUiDelegate:", *(_QWORD *)(a1 + 32));
        v46 = *(_QWORD *)(a1 + 48);
        v48 = 0;
        v47 = (id)-[NSObject evaluatePolicy:options:error:](v31, "evaluatePolicy:options:error:", v46, 0, &v48);
        v30 = v48;
        objc_msgSend(*(id *)(a1 + 32), "_handleLocalAuthenticationPolicyEvaluatedWithContext:error:", v31, v30);
      }
      goto LABEL_18;
    }
    pk_Payment_log();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

    if (v33)
    {
      pk_Payment_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v31, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: in-progress context", buf, 2u);
      }
      goto LABEL_19;
    }
  }
}

uint64_t __102__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithPolicy_completion___block_invoke_35(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __102__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithPolicy_completion___block_invoke_38(int8x16_t *a1)
{
  uint64_t v1;
  int8x16_t v2;
  _QWORD v3[4];
  int8x16_t v4;

  v1 = a1[3].i64[0];
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __102__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithPolicy_completion___block_invoke_2;
  v3[3] = &unk_24CFEB9C0;
  v2 = a1[2];
  v4 = vextq_s8(v2, v2, 8uLL);
  objc_msgSend((id)v2.i64[0], "evaluatePolicy:options:reply:", v1, 0, v3);

}

void __102__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithPolicy_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __102__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithPolicy_completion___block_invoke_3;
  block[3] = &unk_24CFE8288;
  block[4] = v5;
  v10 = v6;
  v11 = v4;
  v8 = v4;
  dispatch_async(v7, block);

}

uint64_t __102__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithPolicy_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleLocalAuthenticationPolicyEvaluatedWithContext:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)beginLocalAuthenticationWithAccessControl:(__SecAccessControl *)a3 operation:(int64_t)a4 completion:(id)a5
{
  id v8;
  NSObject *localAuthenticationQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  __SecAccessControl *v13;
  int64_t v14;

  v8 = a5;
  localAuthenticationQueue = self->_localAuthenticationQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __119__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithAccessControl_operation_completion___block_invoke;
  v11[3] = &unk_24CFEBA10;
  v11[4] = self;
  v12 = v8;
  v13 = a3;
  v14 = a4;
  v10 = v8;
  dispatch_async(localAuthenticationQueue, v11);

}

void __119__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithAccessControl_operation_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  _QWORD *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  _BOOL4 v28;
  id v29;
  NSObject *v30;
  _BOOL4 v31;
  NSObject *v32;
  NSObject *v33;
  _BOOL4 v34;
  NSObject *v35;
  NSObject *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  id v51;
  uint8_t buf[16];

  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: begin local authentication with access control", buf, 2u);
    }

  }
  v5 = *(_QWORD **)(a1 + 32);
  if (v5[4])
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      pk_Payment_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: existing completion handler", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDA908], -9, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_invokeCompletionHandlerForInvalidationWithError:", v9);

    v5 = *(_QWORD **)(a1 + 32);
  }
  if (!v5[5])
  {
    objc_msgSend(v5, "setCompletionHandler:", *(_QWORD *)(a1 + 40));
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
    {
      pk_Payment_log();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);

      if (!v28)
        return;
      pk_Payment_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v26, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: in-progress context", buf, 2u);
      }
    }
    else
    {
      kdebug_trace();
      v29 = objc_alloc_init(MEMORY[0x24BDDA938]);
      pk_Payment_log();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);

      if (v31)
      {
        pk_Payment_log();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_213518000, v32, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: created new context", buf, 2u);
        }

      }
      pk_Payment_log();
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);

      if (v34)
      {
        pk_Payment_log();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_213518000, v35, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: evaluating asynchronously", buf, 2u);
        }

      }
      objc_msgSend(v29, "setUiDelegate:", *(_QWORD *)(a1 + 32));
      dispatch_get_global_queue(0, 0);
      v36 = objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x24BDAC760];
      v42[1] = 3221225472;
      v42[2] = __119__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithAccessControl_operation_completion___block_invoke_41;
      v42[3] = &unk_24CFEB9E8;
      v37 = v29;
      v38 = *(_QWORD *)(a1 + 56);
      v45 = *(_QWORD *)(a1 + 48);
      v46 = v38;
      v39 = *(_QWORD *)(a1 + 32);
      v43 = v37;
      v44 = v39;
      dispatch_async(v36, v42);

      v40 = *(_QWORD *)(a1 + 32);
      v41 = *(void **)(v40 + 64);
      *(_QWORD *)(v40 + 64) = v37;
      v26 = v37;

    }
    goto LABEL_31;
  }
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: already-completed context", buf, 2u);
    }

  }
  if (*(_QWORD *)(a1 + 40))
  {
    v13 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
    v14 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
    v15 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = 0;

    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(v18 + 48);
    *(_QWORD *)(v18 + 48) = 0;

    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(void **)(v20 + 56);
    *(_QWORD *)(v20 + 56) = 0;

    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = __119__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithAccessControl_operation_completion___block_invoke_40;
    v47[3] = &unk_24CFEB998;
    v22 = *(void **)(a1 + 32);
    v23 = *(id *)(a1 + 40);
    v48 = v13;
    v49 = v14;
    v50 = v15;
    v51 = v23;
    v24 = v15;
    v25 = v14;
    v26 = v13;
    objc_msgSend(v22, "_performDelegateCallback:", v47);

LABEL_31:
  }
}

uint64_t __119__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithAccessControl_operation_completion___block_invoke_40(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __119__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithAccessControl_operation_completion___block_invoke_41(int8x16_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  int8x16_t v3;
  _QWORD v4[4];
  int8x16_t v5;

  v1 = a1[3].i64[0];
  v2 = a1[3].i64[1];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __119__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithAccessControl_operation_completion___block_invoke_2;
  v4[3] = &unk_24CFEB9C0;
  v3 = a1[2];
  v5 = vextq_s8(v3, v3, 8uLL);
  objc_msgSend((id)v3.i64[0], "evaluateAccessControl:operation:options:reply:", v1, v2, 0, v4);

}

void __119__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithAccessControl_operation_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __119__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithAccessControl_operation_completion___block_invoke_3;
  block[3] = &unk_24CFE8288;
  block[4] = v5;
  v10 = v6;
  v11 = v4;
  v8 = v4;
  dispatch_async(v7, block);

}

uint64_t __119__NPKQuickPaymentSessionLocalAuthenticationCoordinator_beginLocalAuthenticationWithAccessControl_operation_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleLocalAuthenticationPolicyEvaluatedWithContext:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)invalidateLocalAuthenticationContexts
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSObject *localAuthenticationQueue;
  _QWORD block[5];
  uint8_t buf[16];

  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: requested invalidate context", buf, 2u);
    }

  }
  localAuthenticationQueue = self->_localAuthenticationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __93__NPKQuickPaymentSessionLocalAuthenticationCoordinator_invalidateLocalAuthenticationContexts__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(localAuthenticationQueue, block);
}

void __93__NPKQuickPaymentSessionLocalAuthenticationCoordinator_invalidateLocalAuthenticationContexts__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(v5 + 40);
      v7 = *(_QWORD *)(v5 + 64);
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: invalidating context completed:%@ inProgress:%@", (uint8_t *)&v12, 0x16u);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "invalidate");
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "invalidate");
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 64);
  *(_QWORD *)(v10 + 64) = 0;

}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  NSObject *localAuthenticationQueue;
  _QWORD block[4];
  id v17;
  NPKQuickPaymentSessionLocalAuthenticationCoordinator *v18;
  int64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", &unk_24D056620);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  pk_Payment_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    pk_Payment_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKQuickPaymentSessionLocalAuthenticationCoordinator _nameForLocalAuthenticationEvent:](self, "_nameForLocalAuthenticationEvent:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        if (objc_msgSend(v8, "BOOLValue"))
          v13 = CFSTR("activated");
        else
          v13 = CFSTR("deactivated");
      }
      else
      {
        v13 = CFSTR("received");
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v21 = v12;
      v22 = 2112;
      v23 = v13;
      v24 = 2112;
      v25 = v14;
      v26 = 2112;
      v27 = v7;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: LocalAuthentication UI ***** %@ %@ ***** - event: %@ params: %@", buf, 0x2Au);

    }
  }
  if (a3)
  {
    localAuthenticationQueue = self->_localAuthenticationQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__NPKQuickPaymentSessionLocalAuthenticationCoordinator_event_params_reply___block_invoke;
    block[3] = &unk_24CFE83A8;
    v17 = v8;
    v18 = self;
    v19 = a3;
    dispatch_async(localAuthenticationQueue, block);

  }
}

uint64_t __75__NPKQuickPaymentSessionLocalAuthenticationCoordinator_event_params_reply___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "BOOLValue");
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  if (v2)
    return objc_msgSend(v3, "_activateLocalAuthenticationEvent:", v4);
  else
    return objc_msgSend(v3, "_deactivateLocalAuthenticationEvent:", v4);
}

- (void)_handleLocalAuthenticationPolicyEvaluatedWithContext:(id)a3 error:(id)a4
{
  LAContext *v6;
  NSError *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSData *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  id completionHandler;
  NSError *v20;
  NSData *v21;
  LAContext *v22;
  NSError *completedError;
  NSObject *v24;
  LAContext *completedContext;
  LAContext *v26;
  NSData *completedCredential;
  NSData *v28;
  NSError *v29;
  LAContext *inProgressContext;
  _QWORD v31[4];
  LAContext *v32;
  NSData *v33;
  NSError *v34;
  NSError *v35;
  uint8_t buf[4];
  NSError *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[2];
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[3];

  v43[2] = *MEMORY[0x24BDAC8D0];
  v6 = (LAContext *)a3;
  v7 = (NSError *)a4;
  kdebug_trace();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_localAuthenticationQueue);
  if (v7)
  {
    v8 = (void *)MEMORY[0x24BE6E9C8];
    v9 = *MEMORY[0x24BE6F178];
    v40[0] = *MEMORY[0x24BE6F158];
    v40[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = *MEMORY[0x24BE6F018];
    v39 = *MEMORY[0x24BE6F028];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subjects:sendEvent:", v10, v11);
    v12 = 0;
  }
  else
  {
    -[LAContext externalizedContext](v6, "externalizedContext");
    v12 = (NSData *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BE6E9C8];
    v14 = *MEMORY[0x24BE6F178];
    v43[0] = *MEMORY[0x24BE6F158];
    v43[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = *MEMORY[0x24BE6F018];
    v42 = *MEMORY[0x24BE6F040];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "subjects:sendEvent:", v10, v11);
  }

  v15 = (void *)MEMORY[0x2199B6780](self->_completionHandler);
  pk_Payment_log();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    if (v17)
    {
      pk_Payment_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v7;
        _os_log_impl(&dword_213518000, v18, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: have completion handler for evaluate policy with error:%@", buf, 0xCu);
      }

    }
    completionHandler = self->_completionHandler;
    self->_completionHandler = 0;

    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __115__NPKQuickPaymentSessionLocalAuthenticationCoordinator__handleLocalAuthenticationPolicyEvaluatedWithContext_error___block_invoke;
    v31[3] = &unk_24CFEB998;
    v32 = v6;
    v33 = v12;
    v34 = v7;
    v35 = v15;
    v20 = v7;
    v21 = v12;
    v22 = v6;
    -[NPKQuickPaymentSessionLocalAuthenticationCoordinator _performDelegateCallback:](self, "_performDelegateCallback:", v31);

    completedError = v35;
  }
  else
  {
    if (v17)
    {
      pk_Payment_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v7;
        _os_log_impl(&dword_213518000, v24, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: no completion handler for evaluate policy with error:%@", buf, 0xCu);
      }

    }
    completedContext = self->_completedContext;
    self->_completedContext = v6;
    v26 = v6;

    completedCredential = self->_completedCredential;
    self->_completedCredential = v12;
    v28 = v12;

    completedError = self->_completedError;
    self->_completedError = v7;
    v29 = v7;
  }

  inProgressContext = self->_inProgressContext;
  self->_inProgressContext = 0;

}

uint64_t __115__NPKQuickPaymentSessionLocalAuthenticationCoordinator__handleLocalAuthenticationPolicyEvaluatedWithContext_error___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)_activateLocalAuthenticationEvent:(int64_t)a3
{
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_localAuthenticationQueue);
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = a3;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Activating local authentication event %ld", (uint8_t *)&v12, 0xCu);
    }

  }
  -[NPKQuickPaymentSessionLocalAuthenticationCoordinator pendingLocalAuthenticationEvents](self, "pendingLocalAuthenticationEvents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKQuickPaymentSessionLocalAuthenticationCoordinator setPendingLocalAuthenticationEvents:](self, "setPendingLocalAuthenticationEvents:", v9);

  }
  -[NPKQuickPaymentSessionLocalAuthenticationCoordinator pendingLocalAuthenticationEvents](self, "pendingLocalAuthenticationEvents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  -[NPKQuickPaymentSessionLocalAuthenticationCoordinator _presentNextLocalAuthenticationEvent](self, "_presentNextLocalAuthenticationEvent");
}

- (void)_deactivateLocalAuthenticationEvent:(int64_t)a3
{
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[6];
  uint8_t buf[4];
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_localAuthenticationQueue);
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v14 = a3;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: Deactivating local authentication with event %ld", buf, 0xCu);
    }

  }
  -[NPKQuickPaymentSessionLocalAuthenticationCoordinator activeLocalAuthenticationEvent](self, "activeLocalAuthenticationEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "integerValue") == a3)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __92__NPKQuickPaymentSessionLocalAuthenticationCoordinator__deactivateLocalAuthenticationEvent___block_invoke;
    v12[3] = &unk_24CFE8238;
    v12[4] = self;
    v12[5] = a3;
    -[NPKQuickPaymentSessionLocalAuthenticationCoordinator _performDelegateCallback:](self, "_performDelegateCallback:", v12);
    -[NPKQuickPaymentSessionLocalAuthenticationCoordinator setActiveLocalAuthenticationEvent:](self, "setActiveLocalAuthenticationEvent:", 0);
  }
  -[NPKQuickPaymentSessionLocalAuthenticationCoordinator pendingLocalAuthenticationEvents](self, "pendingLocalAuthenticationEvents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v11);

  -[NPKQuickPaymentSessionLocalAuthenticationCoordinator _presentNextLocalAuthenticationEvent](self, "_presentNextLocalAuthenticationEvent");
}

void __92__NPKQuickPaymentSessionLocalAuthenticationCoordinator__deactivateLocalAuthenticationEvent___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "credentialDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localAuthenticationCoordinator:cancelRequestForCredentialOfType:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "_credentialTypeForEvent:", *(_QWORD *)(a1 + 40)));

}

- (void)_presentNextLocalAuthenticationEvent
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11[3];
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_localAuthenticationQueue);
  -[NPKQuickPaymentSessionLocalAuthenticationCoordinator pendingLocalAuthenticationEvents](self, "pendingLocalAuthenticationEvents");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    -[NPKQuickPaymentSessionLocalAuthenticationCoordinator activeLocalAuthenticationEvent](self, "activeLocalAuthenticationEvent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[NPKQuickPaymentSessionLocalAuthenticationCoordinator pendingLocalAuthenticationEvents](self, "pendingLocalAuthenticationEvents");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "integerValue");

      -[NPKQuickPaymentSessionLocalAuthenticationCoordinator pendingLocalAuthenticationEvents](self, "pendingLocalAuthenticationEvents");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectAtIndex:", 0);

      if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        v8 = -[NPKQuickPaymentSessionLocalAuthenticationCoordinator _credentialTypeForEvent:](self, "_credentialTypeForEvent:", v6);
        objc_initWeak(&location, self);
        v10[0] = MEMORY[0x24BDAC760];
        v10[1] = 3221225472;
        v10[2] = __92__NPKQuickPaymentSessionLocalAuthenticationCoordinator__presentNextLocalAuthenticationEvent__block_invoke;
        v10[3] = &unk_24CFEBA88;
        v10[4] = self;
        v11[1] = v8;
        objc_copyWeak(v11, &location);
        v11[2] = (id)v6;
        -[NPKQuickPaymentSessionLocalAuthenticationCoordinator _performDelegateCallback:](self, "_performDelegateCallback:", v10);
        objc_destroyWeak(v11);
        objc_destroyWeak(&location);
      }
    }
  }
  else
  {

  }
}

void __92__NPKQuickPaymentSessionLocalAuthenticationCoordinator__presentNextLocalAuthenticationEvent__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  int8x16_t v7;

  objc_msgSend(*(id *)(a1 + 32), "credentialDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __92__NPKQuickPaymentSessionLocalAuthenticationCoordinator__presentNextLocalAuthenticationEvent__block_invoke_2;
  v5[3] = &unk_24CFEBA60;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v7 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
  objc_msgSend(v2, "localAuthenticationCoordinator:requestsCredentialOfType:completion:", v3, v4, v5);

  objc_destroyWeak(&v6);
}

void __92__NPKQuickPaymentSessionLocalAuthenticationCoordinator__presentNextLocalAuthenticationEvent__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13[2];

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      objc_msgSend(v5, "dataUsingEncoding:", 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "inProgressContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 48);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __92__NPKQuickPaymentSessionLocalAuthenticationCoordinator__presentNextLocalAuthenticationEvent__block_invoke_3;
      v12[3] = &unk_24CFEBA38;
      objc_copyWeak(v13, (id *)(a1 + 32));
      v13[1] = *(id *)(a1 + 40);
      objc_msgSend(v9, "setCredential:forProcessedEvent:credentialType:reply:", v8, v10, v11, v12);

      objc_destroyWeak(v13);
    }
    else
    {
      objc_msgSend(WeakRetained, "_cancelLocalAuthentication");
    }
  }

}

void __92__NPKQuickPaymentSessionLocalAuthenticationCoordinator__presentNextLocalAuthenticationEvent__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  id v10;
  __CFString *v11;
  int v12;
  id v13;
  __int16 v14;
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "_nameForLocalAuthenticationEvent:", *(_QWORD *)(a1 + 40));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if ((a2 & 1) != 0)
      {
        v11 = CFSTR("success");
      }
      else
      {
        objc_msgSend(v5, "description");
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v12 = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: setCredential for %@ returned %@", (uint8_t *)&v12, 0x16u);
      if ((a2 & 1) == 0)

    }
  }

}

- (void)_cancelLocalAuthentication
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Local authentication coordinator: Cancelling authentication", v7, 2u);
    }

  }
  -[NPKQuickPaymentSessionLocalAuthenticationCoordinator inProgressContext](self, "inProgressContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[NPKQuickPaymentSessionLocalAuthenticationCoordinator setInProgressContext:](self, "setInProgressContext:", 0);
}

- (void)_invokeCompletionHandlerForInvalidationWithError:(id)a3
{
  id v4;
  void *v5;
  id completionHandler;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  if (self->_completionHandler)
  {
    v5 = (void *)MEMORY[0x2199B6780]();
    completionHandler = self->_completionHandler;
    self->_completionHandler = 0;

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __105__NPKQuickPaymentSessionLocalAuthenticationCoordinator__invokeCompletionHandlerForInvalidationWithError___block_invoke;
    v8[3] = &unk_24CFE9188;
    v10 = v5;
    v9 = v4;
    v7 = v5;
    -[NPKQuickPaymentSessionLocalAuthenticationCoordinator _performDelegateCallback:](self, "_performDelegateCallback:", v8);

  }
}

uint64_t __105__NPKQuickPaymentSessionLocalAuthenticationCoordinator__invokeCompletionHandlerForInvalidationWithError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

- (void)_performDelegateCallback:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_callbackQueue, a3);
}

- (int64_t)_credentialTypeForEvent:(int64_t)a3
{
  int64_t v3;

  v3 = -2;
  if (a3 != 3)
    v3 = 0;
  if (a3 == 2)
    return -1;
  else
    return v3;
}

- (id)_nameForLocalAuthenticationEvent:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return 0;
  else
    return *(&off_24CFEBAA8 + a3);
}

- (NPKQuickPaymentSessionLocalAuthenticationCoordinatorCredentialDelegate)credentialDelegate
{
  return (NPKQuickPaymentSessionLocalAuthenticationCoordinatorCredentialDelegate *)objc_loadWeakRetained((id *)&self->_credentialDelegate);
}

- (void)setCredentialDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_credentialDelegate, a3);
}

- (OS_dispatch_queue)localAuthenticationQueue
{
  return self->_localAuthenticationQueue;
}

- (void)setLocalAuthenticationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_localAuthenticationQueue, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (LAContext)completedContext
{
  return self->_completedContext;
}

- (void)setCompletedContext:(id)a3
{
  objc_storeStrong((id *)&self->_completedContext, a3);
}

- (NSData)completedCredential
{
  return self->_completedCredential;
}

- (void)setCompletedCredential:(id)a3
{
  objc_storeStrong((id *)&self->_completedCredential, a3);
}

- (NSError)completedError
{
  return self->_completedError;
}

- (void)setCompletedError:(id)a3
{
  objc_storeStrong((id *)&self->_completedError, a3);
}

- (LAContext)inProgressContext
{
  return self->_inProgressContext;
}

- (void)setInProgressContext:(id)a3
{
  objc_storeStrong((id *)&self->_inProgressContext, a3);
}

- (NSMutableArray)pendingLocalAuthenticationEvents
{
  return self->_pendingLocalAuthenticationEvents;
}

- (void)setPendingLocalAuthenticationEvents:(id)a3
{
  objc_storeStrong((id *)&self->_pendingLocalAuthenticationEvents, a3);
}

- (NSNumber)activeLocalAuthenticationEvent
{
  return self->_activeLocalAuthenticationEvent;
}

- (void)setActiveLocalAuthenticationEvent:(id)a3
{
  objc_storeStrong((id *)&self->_activeLocalAuthenticationEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeLocalAuthenticationEvent, 0);
  objc_storeStrong((id *)&self->_pendingLocalAuthenticationEvents, 0);
  objc_storeStrong((id *)&self->_inProgressContext, 0);
  objc_storeStrong((id *)&self->_completedError, 0);
  objc_storeStrong((id *)&self->_completedCredential, 0);
  objc_storeStrong((id *)&self->_completedContext, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_localAuthenticationQueue, 0);
  objc_destroyWeak((id *)&self->_credentialDelegate);
}

@end
