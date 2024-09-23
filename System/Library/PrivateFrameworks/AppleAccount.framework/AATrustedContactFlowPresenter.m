@implementation AATrustedContactFlowPresenter

- (void)presentModel:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  objc_class *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[AAFlowPresenter setPresentationCompletion:](self, "setPresentationCompletion:", a4);
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v21;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("modelType"));

  }
  _AALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("modelType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v23 = v13;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "modelType: %@", buf, 0xCu);

  }
  if (!v7)
  {
    _AALogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[AATrustedContactFlowPresenter presentModel:completion:].cold.1((uint64_t)v8, v14, v15, v16, v17, v18, v19, v20);

  }
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("modelData"));
  -[AAFlowPresenter launchProcessWithUserInfo:](self, "launchProcessWithUserInfo:", v9);

}

- (void)presentInvitationUIWithCustodianshipInfo:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  AAOBCustodianInvitationModel *v10;
  id v11;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint8_t v24[16];
  uint8_t buf[16];

  v6 = a3;
  -[AAFlowPresenter setPresentationCompletion:](self, "setPresentationCompletion:", a4);
  _AALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v7, OS_LOG_TYPE_DEFAULT, "Presenting invitation UI with info.", buf, 2u);
  }

  _AALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "Will create model for invitation.", v24, 2u);
    }

    v10 = -[AAOBCustodianInvitationModel initWithCustodianshipInfo:]([AAOBCustodianInvitationModel alloc], "initWithCustodianshipInfo:", v6);
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v23 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v23;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("modelType"));

    if (!v12)
    {
      _AALogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[AATrustedContactFlowPresenter presentModel:completion:].cold.1((uint64_t)v13, v16, v17, v18, v19, v20, v21, v22);

    }
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("modelData"));
    -[AAFlowPresenter launchProcessWithUserInfo:](self, "launchProcessWithUserInfo:", v11);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AATrustedContactFlowPresenter presentInvitationUIWithCustodianshipInfo:completion:].cold.1(v9);

    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -3);
    v10 = (AAOBCustodianInvitationModel *)objc_claimAutoreleasedReturnValue();
    -[AAFlowPresenter flowFinishedWithError:completion:](self, "flowFinishedWithError:completion:", v10, 0);
  }

}

- (void)dealloc
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_19EACA000, a2, OS_LOG_TYPE_DEBUG, "%@ deallocated.", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)presentModel:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, a2, a3, "Context data is nil: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)presentInvitationUIWithCustodianshipInfo:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19EACA000, log, OS_LOG_TYPE_ERROR, "No contact detected. Will not display UI", v1, 2u);
}

@end
