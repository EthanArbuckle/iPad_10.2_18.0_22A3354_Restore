@implementation WKWebExtensionSQLiteStore

uint64_t __35___WKWebExtensionSQLiteStore_close__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "close");
}

void __66___WKWebExtensionSQLiteStore_deleteDatabaseWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_deleteDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66___WKWebExtensionSQLiteStore_deleteDatabaseWithCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E34AAE68;
  v3 = *(id *)(a1 + 40);
  v6 = v2;
  v7 = v3;
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __66___WKWebExtensionSQLiteStore_deleteDatabaseWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __67___WKWebExtensionSQLiteStore_createSavepointWithCompletionHandler___block_invoke(id *a1)
{
  id *v2;
  char v3;
  __CFString *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  __CFString *v12;
  id *v13;
  id *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD block[4];
  __CFString *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  __CFString *v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  WTF::WeakObjCPtrArc<_WKWebExtensionSQLiteStore>::get(&v26, a1 + 6);
  v2 = (id *)v26;
  if (v26)
  {
    WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v26);
    v25 = 0;
    v3 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "_openDatabaseIfNecessaryReturningErrorMessage:", &v25);
    v4 = (__CFString *)v25;

    if ((v3 & 1) != 0)
    {
      WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v2[3];
      v7 = (void *)MEMORY[0x1E0CB3940];
      WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v5);
      objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "_savepointNameFromUUID:", a1[4]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("SAVEPOINT %@"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(v6, 0, v9);

      if (v10 != 101)
      {
        v11 = (id)qword_1ECE710C8;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v2);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v2[1];
          WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v15);
          objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2[3], "lastErrorMessage");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138478339;
          v28 = v16;
          v29 = 2114;
          v30 = v17;
          v31 = 1024;
          v32 = v10;
          _os_log_error_impl(&dword_196BCC000, v11, OS_LOG_TYPE_ERROR, "Failed to create storage savepoint for extension %{private}@. %{public}@ (%d)", buf, 0x1Cu);

        }
        v4 = CFSTR("Failed to create savepoint.");
      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67___WKWebExtensionSQLiteStore_createSavepointWithCompletionHandler___block_invoke_36;
      block[3] = &unk_1E34AAE90;
      v21 = a1[5];
      v12 = v4;
      v19 = v12;
      v20 = a1[4];
      dispatch_async(MEMORY[0x1E0C80D38], block);

      v13 = &v21;
      v14 = (id *)&v19;
    }
    else
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __67___WKWebExtensionSQLiteStore_createSavepointWithCompletionHandler___block_invoke_2;
      v22[3] = &unk_1E34AAE68;
      v13 = &v24;
      v24 = a1[5];
      v14 = (id *)&v23;
      v12 = v4;
      v23 = v12;
      dispatch_async(MEMORY[0x1E0C80D38], v22);
    }

    if (v26)
      CFRelease(v26);
  }
}

uint64_t __67___WKWebExtensionSQLiteStore_createSavepointWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __67___WKWebExtensionSQLiteStore_createSavepointWithCompletionHandler___block_invoke_36(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 48);
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
    v3 = 0;
  else
    v3 = *(_QWORD *)(a1 + 40);
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 32));
}

void __64___WKWebExtensionSQLiteStore_commitSavepoint_completionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  char v3;
  __CFString *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  __CFString *v12;
  id *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD block[6];
  _QWORD v18[6];
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  WTF::WeakObjCPtrArc<_WKWebExtensionSQLiteStore>::get(&v20, (id *)(a1 + 48));
  v2 = (id *)v20;
  if (v20)
  {
    WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v20);
    v19 = 0;
    v3 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "_openDatabaseIfNecessaryReturningErrorMessage:", &v19);
    v4 = (__CFString *)v19;

    if ((v3 & 1) != 0)
    {
      WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v2[3];
      v7 = (void *)MEMORY[0x1E0CB3940];
      WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v5);
      objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "_savepointNameFromUUID:", *(_QWORD *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("RELEASE SAVEPOINT %@"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(v6, 0, v9);

      if (v10 != 101)
      {
        v11 = (id)qword_1ECE710C8;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v2[1];
          WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v14);
          objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2[3], "lastErrorMessage");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138478339;
          v22 = v15;
          v23 = 2114;
          v24 = v16;
          v25 = 1024;
          v26 = v10;
          _os_log_error_impl(&dword_196BCC000, v11, OS_LOG_TYPE_ERROR, "Failed to release storage savepoint for extension %{private}@. %{public}@ (%d)", buf, 0x1Cu);

        }
        v4 = CFSTR("Failed to release savepoint.");
      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64___WKWebExtensionSQLiteStore_commitSavepoint_completionHandler___block_invoke_41;
      block[3] = &unk_1E34AAE68;
      block[5] = *(id *)(a1 + 40);
      v12 = v4;
      block[4] = v12;
      v13 = (id *)block;
    }
    else
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __64___WKWebExtensionSQLiteStore_commitSavepoint_completionHandler___block_invoke_2;
      v18[3] = &unk_1E34AAE68;
      v18[5] = *(id *)(a1 + 40);
      v12 = v4;
      v18[4] = v12;
      v13 = (id *)v18;
    }
    dispatch_async(MEMORY[0x1E0C80D38], v13);

    if (v20)
      CFRelease(v20);
  }
}

uint64_t __64___WKWebExtensionSQLiteStore_commitSavepoint_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __64___WKWebExtensionSQLiteStore_commitSavepoint_completionHandler___block_invoke_41(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __68___WKWebExtensionSQLiteStore_rollbackToSavepoint_completionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  char v3;
  __CFString *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  __CFString *v12;
  id *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD block[6];
  _QWORD v18[6];
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  WTF::WeakObjCPtrArc<_WKWebExtensionSQLiteStore>::get(&v20, (id *)(a1 + 48));
  v2 = (id *)v20;
  if (v20)
  {
    WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v20);
    v19 = 0;
    v3 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "_openDatabaseIfNecessaryReturningErrorMessage:", &v19);
    v4 = (__CFString *)v19;

    if ((v3 & 1) != 0)
    {
      WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v2[3];
      v7 = (void *)MEMORY[0x1E0CB3940];
      WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v5);
      objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "_savepointNameFromUUID:", *(_QWORD *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("ROLLBACK TO SAVEPOINT %@"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(v6, 0, v9);

      if (v10 != 101)
      {
        v11 = (id)qword_1ECE710C8;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v2[1];
          WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v14);
          objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2[3], "lastErrorMessage");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138478339;
          v22 = v15;
          v23 = 2114;
          v24 = v16;
          v25 = 1024;
          v26 = v10;
          _os_log_error_impl(&dword_196BCC000, v11, OS_LOG_TYPE_ERROR, "Failed to rollback to storage savepoint for extension %{private}@. %{public}@ (%d)", buf, 0x1Cu);

        }
        v4 = CFSTR("Failed to rollback to savepoint.");
      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __68___WKWebExtensionSQLiteStore_rollbackToSavepoint_completionHandler___block_invoke_46;
      block[3] = &unk_1E34AAE68;
      block[5] = *(id *)(a1 + 40);
      v12 = v4;
      block[4] = v12;
      v13 = (id *)block;
    }
    else
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __68___WKWebExtensionSQLiteStore_rollbackToSavepoint_completionHandler___block_invoke_2;
      v18[3] = &unk_1E34AAE68;
      v18[5] = *(id *)(a1 + 40);
      v12 = v4;
      v18[4] = v12;
      v13 = (id *)v18;
    }
    dispatch_async(MEMORY[0x1E0C80D38], v13);

    if (v20)
      CFRelease(v20);
  }
}

uint64_t __68___WKWebExtensionSQLiteStore_rollbackToSavepoint_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __68___WKWebExtensionSQLiteStore_rollbackToSavepoint_completionHandler___block_invoke_46(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
