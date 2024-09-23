@implementation CalPersonaUtils

+ (BOOL)performBlockAsPersonaWithIdentifier:(id)a3 block:(id)a4
{
  id v5;
  void (**v6)(id, NSObject *);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  BOOL v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  NSObject *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, NSObject *))a4;
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentPersona");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0;
  v9 = (void *)objc_msgSend(v8, "copyCurrentPersonaContextWithError:", &v35);
  v10 = v35;
  if (v9)
  {
    objc_msgSend(v8, "generateAndRestorePersonaContextWithPersonaUniqueString:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentPersona");
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = v11 == 0;
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v11)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[CalPersonaUtils performBlockAsPersonaWithIdentifier:block:].cold.3();
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "isEnterprisePersona"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v5;
      v38 = 2114;
      v39 = v17;
      v40 = 2112;
      v41 = v13;
      _os_log_impl(&dword_18FC12000, v16, OS_LOG_TYPE_INFO, "Generated and restored persona context with persona identifier = %{public}@, is current persona enterprise persona = %{public}@, current persona = %@", buf, 0x20u);

    }
    -[NSObject userPersonaUniqueString](v13, "userPersonaUniqueString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v5, "isEqualToString:", v18);

    if ((v19 & 1) == 0)
    {
      +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        +[CalPersonaUtils performBlockAsPersonaWithIdentifier:block:].cold.2((uint64_t)v5, v13, v20);

      v14 = 0;
    }
    v6[2](v6, v13);
    objc_msgSend(v8, "restorePersonaWithSavedPersonaContext:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "currentPersona");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "numberWithBool:", objc_msgSend(v31, "isEnterprisePersona"));
        v29 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "currentPersona");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v37 = v5;
        v38 = 2112;
        v39 = v10;
        v40 = 2114;
        v41 = v29;
        v42 = 2112;
        v43 = v24;
        _os_log_error_impl(&dword_18FC12000, v21, OS_LOG_TYPE_ERROR, "Error restoring saved persona context from persona identifier = %{public}@: %@. is current persona enterprise persona = %{public}@, current persona = %@", buf, 0x2Au);

      }
    }
    else
    {
      +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v25 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "currentPersona");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "numberWithBool:", objc_msgSend(v32, "isEnterprisePersona"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "currentPersona");
        v27 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v37 = v5;
        v38 = 2114;
        v39 = v30;
        v40 = 2112;
        v41 = v27;
        _os_log_impl(&dword_18FC12000, v21, OS_LOG_TYPE_INFO, "Restored persona context from persona identifier = %{public}@, is current persona enterprise persona = %{public}@, current persona = %@", buf, 0x20u);

      }
    }

  }
  else
  {
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[CalPersonaUtils performBlockAsPersonaWithIdentifier:block:].cold.1();
    v14 = 0;
  }

  return v14;
}

+ (void)performBlockAsPersonaWithIdentifier:block:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_18FC12000, v0, (uint64_t)v0, "Could not get saved persona context. error = %@, current persona = %@", v1);
}

+ (void)performBlockAsPersonaWithIdentifier:(NSObject *)a3 block:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "userPersonaUniqueString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_0_4(&dword_18FC12000, a3, v6, "Current pesona identifier is %{public}@ after trying to switch to persona %{public}@", (uint8_t *)&v7);

}

+ (void)performBlockAsPersonaWithIdentifier:block:.cold.3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_18FC12000, v0, (uint64_t)v0, "Error generating and restoring persona context with persona identifier = %{public}@: %@", v1);
}

@end
