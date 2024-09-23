@implementation CPLTransportUpdateScopeTask

- (BOOL)checkScopeIsValidInTransaction:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CPLEngineSyncTask session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldDefer");

  if (v6)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v13 = 138412290;
        *(_QWORD *)&v13[4] = objc_opt_class();
        v8 = *(id *)&v13[4];
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Session for %@ has been deferred", v13, 0xCu);

      }
    }
    +[CPLErrors sessionHasBeenDeferredError](CPLErrors, "sessionHasBeenDeferredError", *(_OWORD *)v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setError:", v9);

    v10 = 0;
  }
  else
  {
    objc_msgSend(v4, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11 == 0;

  }
  return v10;
}

- (void)launch
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CPLTransportUpdateScopeTask;
  -[CPLEngineSyncTask launch](&v14, sel_launch);
  -[CPLEngineScopedTask store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scopes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineScopedTask scope](self, "scope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__CPLTransportUpdateScopeTask_launch__block_invoke;
  v10[3] = &unk_1E60DBED0;
  v10[4] = self;
  v11 = v4;
  v12 = v5;
  v13 = v3;
  v6 = v3;
  v7 = v5;
  v8 = v4;
  v9 = (id)objc_msgSend(v6, "performReadTransactionWithBlock:", v10);

}

- (void)cancel
{
  void *v3;
  id v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPLTransportUpdateScopeTask;
  -[CPLEngineSyncTask cancel](&v6, sel_cancel);
  -[CPLEngineScopedTask store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__CPLTransportUpdateScopeTask_cancel__block_invoke;
  v5[3] = &unk_1E60DD838;
  v5[4] = self;
  v4 = (id)objc_msgSend(v3, "performReadTransactionWithBlock:", v5);

}

- (id)taskIdentifier
{
  return CFSTR("engine.sync.transportupdate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTask, 0);
  objc_storeStrong((id *)&self->_deleteTask, 0);
}

uint64_t __37__CPLTransportUpdateScopeTask_cancel__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "cancel");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "cancel");
}

void __37__CPLTransportUpdateScopeTask_launch__block_invoke(id *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  void *v25;
  _QWORD *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[5];
  _QWORD v38[4];
  id v39;
  id v40;
  uint64_t v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  _QWORD v47[5];
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  uint8_t buf[4];
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1[4], "checkScopeIsValidInTransaction:", a2))
  {
    if (objc_msgSend(a1[4], "isCancelled"))
    {
      v3 = a1[4];
      +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
      v36 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "taskDidFinishWithError:");

      return;
    }
    v4 = objc_msgSend(a1[5], "transportUpdateTaskForScope:", a1[6]);
    objc_msgSend(a1[5], "flagsForScope:", a1[6]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "valueForFlag:", 32))
    {
      if (objc_msgSend(a1[6], "scopeType") != 1)
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(a1[6], "scopeIdentifier");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v53 = v7;
            _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEFAULT, "Deleting transport scope for %@", buf, 0xCu);

          }
        }
        objc_msgSend(a1[4], "engineLibrary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "transport");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1[4], "transportScope");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __37__CPLTransportUpdateScopeTask_launch__block_invoke_9;
        v47[3] = &unk_1E60D7670;
        v47[4] = a1[4];
        v11 = a1[6];
        v48 = a1[7];
        v49 = a1[5];
        v50 = a1[6];
        v51 = v4;
        objc_msgSend(v9, "deleteTransportScope:scope:completionHandler:", v10, v11, v47);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = a1[4];
        v14 = (void *)v13[13];
        v13[13] = v12;

        v15 = a1[4];
        v16 = v15[13];
        objc_msgSend(v9, "createGroupForTransportScopeDelete");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "launchTransportTask:withTransportGroup:", v16, v17);

        v18 = v48;
LABEL_18:

LABEL_25:
        return;
      }
    }
    else if ((objc_msgSend(v5, "valueForFlag:", 20) & 1) == 0)
    {
      objc_msgSend(a1[4], "engineLibrary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "transport");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[4], "transportScope");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "scope");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "scopeChangeForScope:", a1[6]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __37__CPLTransportUpdateScopeTask_launch__block_invoke_5;
      v42[3] = &unk_1E60D7670;
      v42[4] = a1[4];
      v43 = a1[7];
      v44 = a1[5];
      v45 = a1[6];
      v46 = v4;
      objc_msgSend(v9, "updateTransportScope:scope:scopeChange:completionHandler:", v20, v21, v22, v42);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = a1[4];
      v25 = (void *)v24[14];
      v24[14] = v23;

      v26 = a1[4];
      v27 = v26[14];
      if (v27)
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(a1[6], "scopeIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v53 = v29;
            _os_log_impl(&dword_1B03C2000, v28, OS_LOG_TYPE_DEFAULT, "Dispatching update transport for %@", buf, 0xCu);

          }
          v26 = a1[4];
          v27 = v26[14];
        }
        objc_msgSend(v9, "createGroupForTransportScopeUpdate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "launchTransportTask:withTransportGroup:", v27, v30);

        v18 = v43;
        goto LABEL_18;
      }

    }
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a1[6], "scopeIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v53 = v32;
        _os_log_impl(&dword_1B03C2000, v31, OS_LOG_TYPE_DEFAULT, "Ignoring transport update for %@", buf, 0xCu);

      }
    }
    v33 = MEMORY[0x1E0C809B0];
    v34 = a1[7];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __37__CPLTransportUpdateScopeTask_launch__block_invoke_13;
    v38[3] = &unk_1E60D7648;
    v39 = a1[5];
    v40 = a1[6];
    v41 = v4;
    v37[0] = v33;
    v37[1] = 3221225472;
    v37[2] = __37__CPLTransportUpdateScopeTask_launch__block_invoke_3_15;
    v37[3] = &unk_1E60DD838;
    v37[4] = a1[4];
    v35 = (id)objc_msgSend(v34, "performWriteTransactionWithBlock:completionHandler:", v38, v37);

    v9 = v39;
    goto LABEL_25;
  }
}

void __37__CPLTransportUpdateScopeTask_launch__block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v3 = a2;
  if (v3)
  {
    v4 = v3;
    if (!objc_msgSend(v3, "isCPLErrorWithCode:", 1002))
    {
      objc_msgSend(*(id *)(a1 + 32), "taskDidFinishWithError:", v4);
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 104);
      *(_QWORD *)(v10 + 104) = 0;

      goto LABEL_6;
    }

  }
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __37__CPLTransportUpdateScopeTask_launch__block_invoke_2;
  v13[3] = &unk_1E60D7648;
  v6 = *(void **)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v15 = v7;
  v16 = v8;
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __37__CPLTransportUpdateScopeTask_launch__block_invoke_4;
  v12[3] = &unk_1E60DD838;
  v12[4] = *(_QWORD *)(a1 + 32);
  v9 = (id)objc_msgSend(v6, "performWriteTransactionWithBlock:completionHandler:", v13, v12);

  v4 = v14;
LABEL_6:

}

void __37__CPLTransportUpdateScopeTask_launch__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v3 = a2;
  if (v3)
  {
    v4 = v3;
    if ((objc_msgSend(v3, "isCPLErrorWithCode:", 1002) & 1) == 0
      && !objc_msgSend(v4, "isCPLErrorWithCode:", 23))
    {
      objc_msgSend(*(id *)(a1 + 32), "taskDidFinishWithError:", v4);
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 112);
      *(_QWORD *)(v10 + 112) = 0;

      goto LABEL_6;
    }

  }
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __37__CPLTransportUpdateScopeTask_launch__block_invoke_6;
  v13[3] = &unk_1E60D7648;
  v6 = *(void **)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v15 = v7;
  v16 = v8;
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __37__CPLTransportUpdateScopeTask_launch__block_invoke_8;
  v12[3] = &unk_1E60DD838;
  v12[4] = *(_QWORD *)(a1 + 32);
  v9 = (id)objc_msgSend(v6, "performWriteTransactionWithBlock:completionHandler:", v13, v12);

  v4 = v14;
LABEL_6:

}

void __37__CPLTransportUpdateScopeTask_launch__block_invoke_13(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__CPLTransportUpdateScopeTask_launch__block_invoke_2_14;
  v6[3] = &unk_1E60D7B68;
  v7 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v8 = v4;
  v9 = v5;
  objc_msgSend(a2, "do:", v6);

}

void __37__CPLTransportUpdateScopeTask_launch__block_invoke_3_15(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "error");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "taskDidFinishWithError:", v3);

}

uint64_t __37__CPLTransportUpdateScopeTask_launch__block_invoke_2_14(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setScope:hasCompletedTransportUpdate:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
}

void __37__CPLTransportUpdateScopeTask_launch__block_invoke_6(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__CPLTransportUpdateScopeTask_launch__block_invoke_7;
  v6[3] = &unk_1E60D7B68;
  v7 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v8 = v4;
  v9 = v5;
  objc_msgSend(a2, "do:", v6);

}

void __37__CPLTransportUpdateScopeTask_launch__block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "taskDidFinishWithError:", v4);

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = 0;

}

uint64_t __37__CPLTransportUpdateScopeTask_launch__block_invoke_7(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setScope:hasCompletedTransportUpdate:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "setScopeNeedsUpdateFromTransport:error:", *(_QWORD *)(a1 + 40), a2);
  return result;
}

void __37__CPLTransportUpdateScopeTask_launch__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__CPLTransportUpdateScopeTask_launch__block_invoke_3;
  v6[3] = &unk_1E60D7B68;
  v7 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v8 = v4;
  v9 = v5;
  objc_msgSend(a2, "do:", v6);

}

void __37__CPLTransportUpdateScopeTask_launch__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "taskDidFinishWithError:", v4);

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = 0;

}

uint64_t __37__CPLTransportUpdateScopeTask_launch__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  void *v5;
  uint64_t v6;

  result = objc_msgSend(*(id *)(a1 + 32), "setScope:hasCompletedTransportUpdate:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
  if ((_DWORD)result)
  {
    v5 = *(void **)(a1 + 32);
    if (+[CPLScopeChange supportsStagingScopeForScopeWithType:](CPLScopeChange, "supportsStagingScopeForScopeWithType:", objc_msgSend(*(id *)(a1 + 40), "scopeType")))
    {
      v6 = 68;
    }
    else
    {
      v6 = 4;
    }
    return objc_msgSend(v5, "setValue:forFlag:forScope:error:", 1, v6, *(_QWORD *)(a1 + 40), a2);
  }
  return result;
}

@end
