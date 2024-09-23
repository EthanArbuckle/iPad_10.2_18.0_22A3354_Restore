@implementation DMCPersonaHelper

+ (id)createEnterprisePersonaWithDevicePasscode:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createEnterprisePersonaWithPasscodeData:passcodeDataType:error:", v6, 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)createEnterprisePersonaWithPasscodeData:(id)a3 passcodeDataType:(unint64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v36 = *MEMORY[0x1E0DC5F18];
  v37[0] = &unk_1E4D41690;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__5;
  v32 = __Block_byref_object_dispose__5;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__5;
  v26 = __Block_byref_object_dispose__5;
  v27 = 0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __83__DMCPersonaHelper_createEnterprisePersonaWithPasscodeData_passcodeDataType_error___block_invoke;
  v18[3] = &unk_1E4D37D98;
  v11 = v9;
  v19 = v11;
  v20 = &v28;
  v21 = &v22;
  objc_msgSend(v10, "createUserPersona:passcodeData:passcodeDataType:completionHandler:", v8, v7, a4, v18);

  if ((objc_msgSend(v11, "tryLockWhenCondition:", 1) & 1) == 0)
  {
    v12 = *DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4951000, v12, OS_LOG_TYPE_INFO, "Waiting for persona to be created...", buf, 2u);
    }
    objc_msgSend(v11, "lockWhenCondition:", 1);
  }
  objc_msgSend(v11, "unlock");
  v13 = (void *)v29[5];
  if (v13)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v13);
  }
  else
  {
    v14 = *DMCLogObjects();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = v23[5];
      *(_DWORD *)buf = 138543362;
      v35 = v15;
      _os_log_impl(&dword_1A4951000, v14, OS_LOG_TYPE_INFO, "Persona created with identifier %{public}@.", buf, 0xCu);
    }
  }
  v16 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v16;
}

void __83__DMCPersonaHelper_createEnterprisePersonaWithPasscodeData_passcodeDataType_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "lock");
  if (v6)
  {
    v7 = *DMCLogObjects();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = 138543362;
      v13 = v6;
      _os_log_impl(&dword_1A4951000, v7, OS_LOG_TYPE_ERROR, "Failed to create persona: %{public}@", (uint8_t *)&v12, 0xCu);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5F20]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  objc_msgSend(*(id *)(a1 + 32), "unlockWithCondition:", 1);

}

+ (BOOL)removePersona:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  __CFString *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  __CFString *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t buf[4];
  __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v33 = *MEMORY[0x1E0DC5F20];
  v34[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__5;
  v27 = __Block_byref_object_dispose__5;
  v28 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __40__DMCPersonaHelper_removePersona_error___block_invoke;
  v19[3] = &unk_1E4D37DC0;
  v9 = v7;
  v20 = v9;
  v10 = (__CFString *)v5;
  v21 = v10;
  v22 = &v23;
  objc_msgSend(v8, "deleteUserPersonaWithProfileInfo:passcodeData:completionHandler:", v6, 0, v19);

  if ((objc_msgSend(v9, "tryLockWhenCondition:", 1) & 1) == 0)
  {
    v11 = *DMCLogObjects();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4951000, v11, OS_LOG_TYPE_INFO, "Waiting for persona to be removed...", buf, 2u);
    }
    objc_msgSend(v9, "lockWhenCondition:", 1);
  }
  objc_msgSend(v9, "unlock");
  v12 = v24[5];
  if (v12)
  {
    v13 = (void *)objc_opt_new();
    v14 = v24[5];
    v15 = &stru_1E4D38200;
    if (v10)
      v15 = v10;
    v31 = CFSTR("persona ID");
    v32 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logErrorEventForTopic:reason:error:details:", CFSTR("Persona"), CFSTR("Persona Removal Failed"), v14, v16);

    if (a4)
      *a4 = objc_retainAutorelease((id)v24[5]);
  }
  else
  {
    v17 = *DMCLogObjects();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v10;
      _os_log_impl(&dword_1A4951000, v17, OS_LOG_TYPE_INFO, "Persona with identifier %{public}@ removed.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v23, 8);
  return v12 == 0;
}

void __40__DMCPersonaHelper_removePersona_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "lock");
  if (v4)
  {
    v5 = *DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = 138543618;
      v8 = v6;
      v9 = 2114;
      v10 = v4;
      _os_log_impl(&dword_1A4951000, v5, OS_LOG_TYPE_ERROR, "Failed to remove persona with identifier %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  objc_msgSend(*(id *)(a1 + 32), "unlockWithCondition:", 1);

}

+ (void)removePersonaAndAccountsWithPersonaID:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[DMCPersonaHelper removePersona:error:](DMCPersonaHelper, "removePersona:error:", v3, 0);
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dmc_removeMAIDRelatedAccountsWithPersonaID:asynchronous:", v3, 0);

}

+ (id)performBlockUnderPersonalPersona:(id)a3
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[16];

  v3 = (void (**)(_QWORD))a3;
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPersona");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isPersonalPersona") & 1) != 0
    || (objc_msgSend(v5, "isSystemPersona") & 1) != 0
    || objc_msgSend(v5, "isDefaultPersona"))
  {
    v3[2](v3);
    v6 = 0;
  }
  else
  {
    v8 = *DMCLogObjects();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4951000, v8, OS_LOG_TYPE_DEFAULT, "DMCPersonaHelper: We are not under personal/system/default persona, will to switch to personal persona", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v9;
    if (v9
      && (objc_msgSend(v9, "userPersonaUniqueString"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "length"),
          v18,
          v19))
    {
      objc_msgSend(v17, "userPersonaUniqueString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[DMCPersonaHelper performBlockUnderPersona:block:](DMCPersonaHelper, "performBlockUnderPersona:block:", v20, v3);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      DMCErrorArray(CFSTR("PERSONA_ATTRIBUTE_FETCH_ERROR"), v10, v11, v12, v13, v14, v15, v16, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "DMCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("DMCPersonaErrorDomain"), 55001, v20, CFSTR("DMCFatalError"));
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v21;

  }
  return v6;
}

+ (id)performBlockUnderPersona:(id)a3 block:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (!v6)
  {
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  if (!objc_msgSend(v5, "length"))
  {
    v11 = DMCLogObjects()[1];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4951000, v11, OS_LOG_TYPE_INFO, "performBlockUnderPersona: No persona provided, will just run the block", buf, 2u);
    }
    v6[2](v6);
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentPersona");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v9 = (void *)objc_msgSend(v8, "copyCurrentPersonaContextWithError:", &v17);
  v10 = v17;
  if (!v10)
  {
    objc_msgSend(v8, "createPersonaContextForBackgroundProcessingWithPersonaUniqueString:", v5);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v10 = (id)v13;
      v14 = DMCLogObjects()[1];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v19 = v5;
        v20 = 2114;
        v21 = v10;
        _os_log_impl(&dword_1A4951000, v14, OS_LOG_TYPE_ERROR, "Failed to adopt persona:%{public}@ with error: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      v6[2](v6);
      objc_msgSend(v8, "restorePersonaWithSavedPersonaContext:", v9);
      if (objc_claimAutoreleasedReturnValue())
      {
        v15 = DMCLogObjects()[1];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4951000, v15, OS_LOG_TYPE_ERROR, "Cannot restore persona context", buf, 2u);
        }
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("PersonaRestorationFailedException"), CFSTR("The persona restoration failed"), 0);
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_exception_throw(v16);
      }
      v10 = 0;
    }
  }

LABEL_9:
  return v10;
}

+ (id)currentPersonaID
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPersona");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "userPersonaUniqueString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)isCurrentPersonaEnterprise
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPersona");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnterprisePersona");

  return v4;
}

+ (id)currentPersonaTypeString
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPersona");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userPersonaNickName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)enterprisePersonaIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)enterprisePersonaDisplayName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)setPersonaIdentifierForApps:(id)a3 personaID:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__DMCPersonaHelper_setPersonaIdentifierForApps_personaID_completionHandler___block_invoke;
  v15[3] = &unk_1E4D37E10;
  v16 = v7;
  v17 = v10;
  v18 = v8;
  v19 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  v14 = v7;
  objc_msgSend(v13, "fetchBundleIdentifierForPersonaWithIDString:completionHandler:", v12, v15);

}

void __76__DMCPersonaHelper_setPersonaIdentifierForApps_personaID_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  if (a2)
    v3 = a2;
  else
    v3 = MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v4, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__DMCPersonaHelper_setPersonaIdentifierForApps_personaID_completionHandler___block_invoke_2;
  v8[3] = &unk_1E4D37DE8;
  v7 = *(_QWORD *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v5, "setBundlesIdentifiers:forUniquePersonaWithIDString:completionHandler:", v6, v7, v8);

}

void __76__DMCPersonaHelper_setPersonaIdentifierForApps_personaID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = *DMCLogObjects();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_1A4951000, v4, OS_LOG_TYPE_ERROR, "Failed to set bundle identifiers for persona with error: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (BOOL)personaWithUniqueIdentifierExists:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  BOOL v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1A4951000, v4, OS_LOG_TYPE_INFO, "fetchPersonaWithPersonaUniqueString: will fetch persona with persona ID: %@", (uint8_t *)&v8, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaUniqueString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

+ (void)trackDirtyPersona:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    MDMDirtyPersonaFilePath();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

    if ((v6 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithContentsOfFile:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v3);
    }
    else
    {
      v8[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "writeToFile:atomically:", v4, 1);
    DMCSetSkipBackupAttributeToItemAtPath(v4, 1);

  }
}

+ (void)untrackDirtyPersona:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  MDMDirtyPersonaFilePath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithContentsOfFile:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObject:", v3);
      if (objc_msgSend(v7, "count"))
      {
        objc_msgSend(v7, "writeToFile:atomically:", v4, 1);
        DMCSetSkipBackupAttributeToItemAtPath(v4, 1);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 0;
        objc_msgSend(v8, "removeItemAtPath:error:", v4, &v11);
        v9 = v11;

        if (v9)
        {
          v10 = *DMCLogObjects();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v13 = v9;
            _os_log_impl(&dword_1A4951000, v10, OS_LOG_TYPE_ERROR, "Failed to remove dirty persona file, error: %{public}@", buf, 0xCu);
          }
        }

      }
    }
  }

}

+ (void)untrackAllDirtyPersonas
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  MDMDirtyPersonaFilePath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v2);

  if (v5)
  {
    v9 = 0;
    objc_msgSend(v3, "removeItemAtPath:error:", v2, &v9);
    v6 = v9;
    if (v6)
    {
      v7 = v6;
      v8 = *DMCLogObjects();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v11 = v7;
        _os_log_impl(&dword_1A4951000, v8, OS_LOG_TYPE_ERROR, "Failed to remove dirty persona file, error: %{public}@", buf, 0xCu);
      }

    }
  }

}

+ (id)fetchDirtyPersonaIDs
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D20];
  MDMDirtyPersonaFilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
