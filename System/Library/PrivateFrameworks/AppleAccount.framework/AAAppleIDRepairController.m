@implementation AAAppleIDRepairController

- (AAAppleIDRepairController)init
{
  AAAppleIDRepairController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AAAppleIDRepairController;
  v2 = -[AAAppleIDRepairController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "aa_primaryAppleAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAAppleIDRepairController setPrimaryAccount:](v2, "setPrimaryAccount:", v4);

  }
  return v2;
}

- (BOOL)offline_primaryAppleIDNeedsRepair
{
  void *v3;
  unint64_t v4;

  -[AAAppleIDRepairController primaryAccount](self, "primaryAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v4 = -[AAAppleIDRepairController _fetchRepairState](self, "_fetchRepairState");
  return (v4 & 0xFFFFFFFFFFFFFFFDLL) == 0 || v4 == 3;
}

- (void)primaryAppleIDRepairNeedsRepairCompletion:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  unint64_t v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__AAAppleIDRepairController_primaryAppleIDRepairNeedsRepairCompletion___block_invoke;
  v9[3] = &unk_1E41701E0;
  v5 = v4;
  v10 = v5;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AED7A0](v9);
  -[AAAppleIDRepairController primaryAccount](self, "primaryAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = -[AAAppleIDRepairController _fetchRepairState](self, "_fetchRepairState");
    if (v8)
      v6[2](v6, v8);
    else
      -[AAAppleIDRepairController _forceFetchUpdatedUserInformationWithCompletion:](self, "_forceFetchUpdatedUserInformationWithCompletion:", v6);
  }
  else
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
  }

}

uint64_t __71__AAAppleIDRepairController_primaryAppleIDRepairNeedsRepairCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  uint64_t result;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_19EACA000, v4, OS_LOG_TYPE_DEFAULT, "Final repair state %@", (uint8_t *)&v7, 0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, (a2 & 0xFFFFFFFFFFFFFFFELL) == 2);
  return result;
}

- (unint64_t)_fetchRepairState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAAppleIDRepairController primaryAccount](self, "primaryAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authKitAccountWithAltDSID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "repairStateForAccount:", v6);

  return v8;
}

- (void)_forceFetchUpdatedUserInformationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[AAAppleIDRepairController primaryAccount](self, "primaryAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aa_altDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__AAAppleIDRepairController__forceFetchUpdatedUserInformationWithCompletion___block_invoke;
  v9[3] = &unk_1E4170208;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v5, "getUserInformationForAltDSID:completion:", v7, v9);

}

void __77__AAAppleIDRepairController__forceFetchUpdatedUserInformationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __77__AAAppleIDRepairController__forceFetchUpdatedUserInformationWithCompletion___block_invoke_cold_1((uint64_t)v6, v8);

    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "repairState"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "User information returned state: %@", (uint8_t *)&v10, 0xCu);

    }
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v5, "repairState"));
  }

}

- (ACAccount)primaryAccount
{
  return (ACAccount *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPrimaryAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->primaryAccount, 0);
}

void __77__AAAppleIDRepairController__forceFetchUpdatedUserInformationWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19EACA000, a2, OS_LOG_TYPE_ERROR, "Error fetching user information: %@", (uint8_t *)&v2, 0xCu);
}

@end
