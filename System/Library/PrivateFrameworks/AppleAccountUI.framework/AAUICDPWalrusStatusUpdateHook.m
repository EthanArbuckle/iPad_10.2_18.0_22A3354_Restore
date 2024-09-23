@implementation AAUICDPWalrusStatusUpdateHook

- (AAUICDPWalrusStatusUpdateHook)initWithAppleAccount:(id)a3
{
  id v5;
  AAUICDPWalrusStatusUpdateHook *v6;
  AAUICDPWalrusStatusUpdateHook *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUICDPWalrusStatusUpdateHook;
  v6 = -[AAUICDPWalrusStatusUpdateHook init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (id)changeControllerForAction:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("walrus:enable")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("walrus:disable")))
    {
      v8 = 0;
      goto LABEL_9;
    }
    v5 = 2;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "altDSIDForAccount:", self->_account);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D157E0], "controllerWithTargetWalrusStatus:altDSID:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D157E0], "controllerWithTargetWalrusStatus:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:

  return v8;
}

- (id)additionalPayloadForAction:(id)a3 error:(id)a4
{
  void *v5;
  void **v6;
  const __CFString **v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a4)
    return 0;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("walrus:enable")))
  {
    v10 = CFSTR("walrusClientState");
    v11[0] = &unk_1EA31E830;
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = (void **)v11;
    v7 = &v10;
  }
  else
  {
    v8 = CFSTR("walrusClientState");
    v9 = &unk_1EA31E848;
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = &v9;
    v7 = &v8;
  }
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v6, v7, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)postCompletionProcessingForAction:(id)a3 error:(id)a4
{
  int v6;
  NSObject *v7;
  id v8;
  ACAccount *account;
  uint64_t v10;
  void *v11;
  uint8_t v12[8];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a3, "isEqualToString:", CFSTR("walrus:disable"));
  if (!a4 && v6)
  {
    _AAUILogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1DB4ED000, v7, OS_LOG_TYPE_DEFAULT, "Dismissing Walrus CFUs", v12, 2u);
    }

    v8 = objc_alloc_init(MEMORY[0x1E0CFAC68]);
    account = self->_account;
    v10 = *MEMORY[0x1E0CFAB30];
    v13[0] = *MEMORY[0x1E0CFAB38];
    v13[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissFollowUpsForAccount:identifiers:completion:", account, v11, &__block_literal_global_17);

  }
}

void __73__AAUICDPWalrusStatusUpdateHook_postCompletionProcessingForAction_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;

  v4 = a3;
  if (v4)
  {
    _AAUILogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __73__AAUICDPWalrusStatusUpdateHook_postCompletionProcessingForAction_error___block_invoke_cold_2((uint64_t)v4, v5);

  }
  if (a2)
  {
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __73__AAUICDPWalrusStatusUpdateHook_postCompletionProcessingForAction_error___block_invoke_cold_1(v6);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

void __73__AAUICDPWalrusStatusUpdateHook_postCompletionProcessingForAction_error___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_DEBUG, "Successfully dismissed Walrus CFUs", v1, 2u);
}

void __73__AAUICDPWalrusStatusUpdateHook_postCompletionProcessingForAction_error___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DB4ED000, a2, OS_LOG_TYPE_ERROR, "Error occurred in dismissing Walrus CFUs: %@", (uint8_t *)&v2, 0xCu);
}

@end
