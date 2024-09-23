@implementation IXGizmoInstallingAppInstallCoordinator

+ (BOOL)modifiesLocalLaunchServicesDatabase
{
  return 0;
}

+ (unint64_t)intent
{
  return 7;
}

- (id)validInstallTypes
{
  return &unk_1E4DD8748;
}

- (BOOL)setTargetGizmoPairingID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  BOOL v14;
  _QWORD v16[4];
  id v17;
  IXGizmoInstallingAppInstallCoordinator *v18;
  uint64_t *v19;
  uint64_t *v20;
  _QWORD v21[4];
  id v22;
  IXGizmoInstallingAppInstallCoordinator *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v6 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__1;
  v29 = __Block_byref_object_dispose__1;
  v30 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __72__IXGizmoInstallingAppInstallCoordinator_setTargetGizmoPairingID_error___block_invoke;
  v21[3] = &unk_1E4DC4480;
  v9 = v6;
  v22 = v9;
  v23 = self;
  v24 = &v25;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __72__IXGizmoInstallingAppInstallCoordinator_setTargetGizmoPairingID_error___block_invoke_6;
  v16[3] = &unk_1E4DC44A8;
  v12 = v9;
  v17 = v12;
  v18 = self;
  v19 = &v25;
  v20 = &v31;
  objc_msgSend(v10, "_remote_IXSCoordinatedAppInstall:setTargetGizmoPairingID:completion:", v11, v12, v16);

  v13 = *((unsigned __int8 *)v32 + 24);
  if (a4 && !*((_BYTE *)v32 + 24))
  {
    *a4 = objc_retainAutorelease((id)v26[5]);
    v13 = *((unsigned __int8 *)v32 + 24);
  }
  v14 = v13 != 0;

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v14;
}

void __72__IXGizmoInstallingAppInstallCoordinator_setTargetGizmoPairingID_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v9 = 136315906;
    v10 = "-[IXGizmoInstallingAppInstallCoordinator setTargetGizmoPairingID:error:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set target gizmo pairing ID to %@ on %@ : %@", (uint8_t *)&v9, 0x2Au);
  }

  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __72__IXGizmoInstallingAppInstallCoordinator_setTargetGizmoPairingID_error___block_invoke_6(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v7 = a1[5];
      v8 = 136315906;
      v9 = "-[IXGizmoInstallingAppInstallCoordinator setTargetGizmoPairingID:error:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set target gizmo pairing ID to %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }

}

- (id)targetGizmoPairingIDWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[7];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1;
  v24 = __Block_byref_object_dispose__1;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__IXGizmoInstallingAppInstallCoordinator_targetGizmoPairingIDWithError___block_invoke;
  v13[3] = &unk_1E4DC4430;
  v13[4] = self;
  v13[5] = &v14;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __72__IXGizmoInstallingAppInstallCoordinator_targetGizmoPairingIDWithError___block_invoke_7;
  v12[3] = &unk_1E4DC4B40;
  v12[4] = self;
  v12[5] = &v14;
  v12[6] = &v20;
  objc_msgSend(v7, "_remote_IXSCoordinatedAppInstall:targetGizmoPairingIDWithCompletion:", v8, v12);

  v9 = (void *)v21[5];
  if (a3 && !v9)
  {
    *a3 = objc_retainAutorelease((id)v15[5]);
    v9 = (void *)v21[5];
  }
  v10 = v9;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __72__IXGizmoInstallingAppInstallCoordinator_targetGizmoPairingIDWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXGizmoInstallingAppInstallCoordinator targetGizmoPairingIDWithError:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get target gizmo pairing ID from %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __72__IXGizmoInstallingAppInstallCoordinator_targetGizmoPairingIDWithError___block_invoke_7(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = a1[4];
      v12 = 136315650;
      v13 = "-[IXGizmoInstallingAppInstallCoordinator targetGizmoPairingIDWithError:]_block_invoke";
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1A4BF6000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get target gizmo pairing ID from %@ : %@", (uint8_t *)&v12, 0x20u);
    }

    v10 = (id *)(*(_QWORD *)(a1[5] + 8) + 40);
    v11 = a3;
  }
  else
  {
    v10 = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
    v11 = a2;
  }
  objc_storeStrong(v10, v11);

}

@end
