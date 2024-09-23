@implementation TKExtensionClientTokenObject

- (id)operation:(int64_t)a3 data:(id)a4 algorithms:(id)a5 parameters:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  __SecAccessControl *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  TKExtensionClientTokenObject *v26;
  id v27;
  id v28;
  id v29;
  int64_t v30;
  os_activity_scope_state_s state;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = _os_activity_create(&dword_1B9768000, "ExtClientObject: operation", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v15, &state);
  -[TKClientTokenObject session](self, "session");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[TKClientTokenObject accessControlRef](self, "accessControlRef");
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __75__TKExtensionClientTokenObject_operation_data_algorithms_parameters_error___block_invoke;
  v24[3] = &unk_1E708A690;
  v18 = v16;
  v25 = v18;
  v26 = self;
  v30 = a3;
  v19 = v12;
  v27 = v19;
  v20 = v13;
  v28 = v20;
  v21 = v14;
  v29 = v21;
  objc_msgSend(v18, "withError:accessControl:invoke:", a7, v17, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  os_activity_scope_leave(&state);
  return v22;
}

id __75__TKExtensionClientTokenObject_operation_data_algorithms_parameters_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v5 = a2;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__6;
  v26 = __Block_byref_object_dispose__6;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__6;
  v20 = __Block_byref_object_dispose__6;
  v21 = 0;
  objc_msgSend(*(id *)(a1 + 32), "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 72);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__TKExtensionClientTokenObject_operation_data_algorithms_parameters_error___block_invoke_2;
  v15[3] = &unk_1E708A668;
  v15[4] = &v22;
  v15[5] = &v16;
  objc_msgSend(v5, "session:objectID:operation:data:algorithms:parameters:reply:", v6, v7, v10, v8, v9, v11, v15);

  v12 = (void *)v23[5];
  if (a3 && !v12)
  {
    *a3 = objc_retainAutorelease((id)v17[5]);
    v12 = (void *)v23[5];
  }
  v13 = v12;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __75__TKExtensionClientTokenObject_operation_data_algorithms_parameters_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (BOOL)deleteWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  __SecAccessControl *v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t, void *, _QWORD *);
  void *v14;
  id v15;
  TKExtensionClientTokenObject *v16;
  os_activity_scope_state_s state;

  v5 = _os_activity_create(&dword_1B9768000, "ExtClientObject: delete", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  -[TKClientTokenObject session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TKClientTokenObject accessControlRef](self, "accessControlRef");
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __48__TKExtensionClientTokenObject_deleteWithError___block_invoke;
  v14 = &unk_1E708A6B8;
  v8 = v6;
  v15 = v8;
  v16 = self;
  objc_msgSend(v8, "withError:accessControl:invoke:", a3, v7, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v9, "BOOLValue", v11, v12, v13, v14);

  os_activity_scope_leave(&state);
  return (char)a3;
}

id __48__TKExtensionClientTokenObject_deleteWithError___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v5 = a2;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  objc_msgSend(*(id *)(a1 + 32), "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__TKExtensionClientTokenObject_deleteWithError___block_invoke_2;
  v11[3] = &unk_1E708A160;
  v11[4] = &v18;
  v11[5] = &v12;
  objc_msgSend(v5, "session:deleteObjectWithObjectID:reply:", v6, v7, v11);

  v8 = (void *)v19[5];
  if (a3 && !v8)
  {
    *a3 = objc_retainAutorelease((id)v13[5]);
    v8 = (void *)v19[5];
  }
  v9 = v8;
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __48__TKExtensionClientTokenObject_deleteWithError___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  if (a2)
    v6 = (void *)MEMORY[0x1E0C9AAB0];
  else
    v6 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v6);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

@end
