@implementation FPAccessControlManager

- (void)collectionForItemsAccessibleByBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  FPNotSupportedError();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a4 + 2))(v5, 0, v6);

}

- (void)bundleIdentifiersWithAccessToAnyItemCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__FPAccessControlManager_bundleIdentifiersWithAccessToAnyItemCompletionHandler___block_invoke;
  v6[3] = &unk_1E444DE88;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "fetchAccessServicer:", v6);

}

void __80__FPAccessControlManager_bundleIdentifiersWithAccessToAnyItemCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  _QWORD v6[4];
  id v7;

  if (!a2 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __80__FPAccessControlManager_bundleIdentifiersWithAccessToAnyItemCompletionHandler___block_invoke_2;
    v6[3] = &unk_1E4449A88;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifiersWithAccessToAnyItemCompletionHandler:", *(_QWORD *)(a1 + 32));

  }
}

uint64_t __80__FPAccessControlManager_bundleIdentifiersWithAccessToAnyItemCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_killBundle:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v7 = a3;
  v8 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v9 = (void *)getFBSSystemServiceClass_softClass;
  v24 = getFBSSystemServiceClass_softClass;
  v10 = MEMORY[0x1E0C809B0];
  if (!getFBSSystemServiceClass_softClass)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __getFBSSystemServiceClass_block_invoke;
    v20[3] = &unk_1E444B188;
    v20[4] = &v21;
    __getFBSSystemServiceClass_block_invoke((uint64_t)v20);
    v9 = (void *)v22[3];
  }
  v11 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v21, 8);
  objc_msgSend(v11, "sharedService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPAccessControlManager.m"), 48, CFSTR("-[FBSSystemService sharedService] returned nil"));

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Terminating %@ to revoke access to files."), v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __56__FPAccessControlManager__killBundle_completionHandler___block_invoke;
  v17[3] = &unk_1E4449CB0;
  v18 = v7;
  v19 = v8;
  v14 = v8;
  v15 = v7;
  objc_msgSend(v12, "terminateApplication:forReason:andReport:withDescription:completion:", v15, 3, 0, v13, v17);

}

void __56__FPAccessControlManager__killBundle_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void (*v6)(void);

  v4 = a3;
  if (v4)
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __56__FPAccessControlManager__killBundle_completionHandler___block_invoke_cold_1((uint64_t)v4, a1, v5);

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v6();

}

- (void)revokeAccessToAllItemsForBundle:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  FPAccessControlManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__FPAccessControlManager_revokeAccessToAllItemsForBundle_completionHandler___block_invoke;
  v11[3] = &unk_1E444DED8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "fetchAccessServicer:", v11);

}

void __76__FPAccessControlManager_revokeAccessToAllItemsForBundle_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  int8x16_t v9;
  _QWORD v10[4];
  int8x16_t v11;
  id v12;
  _QWORD v13[4];
  id v14;

  if (!a2 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v5 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __76__FPAccessControlManager_revokeAccessToAllItemsForBundle_completionHandler___block_invoke_2;
    v13[3] = &unk_1E4449A88;
    v14 = *(id *)(a1 + 48);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __76__FPAccessControlManager_revokeAccessToAllItemsForBundle_completionHandler___block_invoke_3;
    v10[3] = &unk_1E444DEB0;
    v12 = *(id *)(a1 + 48);
    v9 = *(int8x16_t *)(a1 + 32);
    v8 = (id)v9.i64[0];
    v11 = vextq_s8(v9, v9, 8uLL);
    objc_msgSend(v6, "revokeAccessToAllItemsForBundle:completionHandler:", v7, v10);

  }
}

uint64_t __76__FPAccessControlManager_revokeAccessToAllItemsForBundle_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__FPAccessControlManager_revokeAccessToAllItemsForBundle_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "_killBundle:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (BOOL)revokeAccessToAllBundles
{
  return 0;
}

- (void)revokeAccessToAllBundlesCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  FPNotSupportedError();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v4, v5);

}

void __56__FPAccessControlManager__killBundle_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a2 + 32);
  v4 = 138543618;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_1A0A34000, log, OS_LOG_TYPE_ERROR, "[ERROR] Encountered an error [%{public}@] while terminating application with bundle ID [%{public}@] using FrontBoardServices", (uint8_t *)&v4, 0x16u);
}

@end
