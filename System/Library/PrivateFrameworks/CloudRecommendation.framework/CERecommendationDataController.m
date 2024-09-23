@implementation CERecommendationDataController

- (CERecommendationDataController)initWithAccount:(id)a3
{
  id v5;
  CERecommendationDataController *v6;
  CERecommendationDataController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CERecommendationDataController;
  v6 = -[CERecommendationDataController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (void)fetchRecommendationsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  BOOL v10;
  id v12;
  NSObject *v13;
  void *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  os_signpost_id_t v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  os_signpost_id_t v30;
  uint64_t v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACAccount aa_altDSID](self->_account, "aa_altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ACAccount aa_isAccountClass:](self->_account, "aa_isAccountClass:", *MEMORY[0x24BE047F0]);
  v7 = -[ACAccount aa_isManagedAppleID](self->_account, "aa_isManagedAppleID");
  _CELogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
    v10 = v6 == 0;
  else
    v10 = 1;
  if (!v10 && v7 == 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CERecommendationDataController fetchRecommendationsWithCompletion:].cold.2();

    _CESignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_opt_new();
    v15 = _CESignpostCreateWithObject(v13, v14);
    v17 = v16;

    _CESignpostLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2380DF000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v15, "RecommendationsRequest", ", buf, 2u);
    }

    _CESignpostLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[CERecommendationDataController fetchRecommendationsWithCompletion:].cold.1();

    v12 = objc_alloc_init((Class)getINDaemonConnectionClass());
    v21 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke;
    v28[3] = &unk_2509E0740;
    v30 = v15;
    v31 = v17;
    v22 = v4;
    v29 = v22;
    objc_msgSend(v12, "daemonWithErrorHandler:", v28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v21;
    v24[1] = 3221225472;
    v24[2] = __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke_1;
    v24[3] = &unk_2509E0768;
    v26 = v15;
    v27 = v17;
    v25 = v22;
    objc_msgSend(v23, "fetchRecommendationsForAltDSID:completion:", v5, v24);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v33 = v5;
      v34 = 1024;
      v35 = v6;
      v36 = 1024;
      v37 = v7;
      _os_log_error_impl(&dword_2380DF000, v9, OS_LOG_TYPE_ERROR, "Invalid account. altDSID: %@ isPrimary: %d isManaged: %d.", buf, 0x18u);
    }

    CECreateError(12);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v12);
  }

}

void __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a2;
  _CELogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke_cold_2();

  _CESignpostGetNanoseconds(a1[5], a1[6]);
  _CESignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_2380DF000, v6, OS_SIGNPOST_INTERVAL_END, v7, "RecommendationsRequest", ", v9, 2u);
  }

  _CESignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke_cold_1();

  (*(void (**)(void))(a1[4] + 16))();
}

void __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke_1(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  void (*v11)(void);
  NSObject *v12;
  uint8_t v13[16];

  v5 = a2;
  v6 = a3;
  _CESignpostGetNanoseconds(a1[5], a1[6]);
  _CESignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_2380DF000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RecommendationsRequest", ", v13, 2u);
  }

  _CESignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke_cold_1();

  if (v5)
  {
    v11 = *(void (**)(void))(a1[4] + 16);
  }
  else
  {
    _CELogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke_1_cold_1();

    v11 = *(void (**)(void))(a1[4] + 16);
  }
  v11();

}

- (void)fetchRecommendationsWithInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  BOOL v13;
  id v15;
  NSObject *v16;
  void *v17;
  os_signpost_id_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  void *v26;
  NSObject *v27;
  _QWORD v28[4];
  NSObject *v29;
  os_signpost_id_t v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  os_signpost_id_t v34;
  uint64_t v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[ACAccount aa_altDSID](self->_account, "aa_altDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ACAccount aa_isAccountClass:](self->_account, "aa_isAccountClass:", *MEMORY[0x24BE047F0]);
  v10 = -[ACAccount aa_isManagedAppleID](self->_account, "aa_isManagedAppleID");
  _CELogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
    v13 = v9 == 0;
  else
    v13 = 1;
  if (!v13 && v10 == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[CERecommendationDataController fetchRecommendationsWithCompletion:].cold.2();

    _CESignpostLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_opt_new();
    v18 = _CESignpostCreateWithObject(v16, v17);
    v20 = v19;

    _CESignpostLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2380DF000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v18, "RecommendationsRequest", ", buf, 2u);
    }

    _CESignpostLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[CERecommendationDataController fetchRecommendationsWithCompletion:].cold.1();

    v15 = objc_alloc_init((Class)getINDaemonConnectionClass());
    v24 = MEMORY[0x24BDAC760];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __74__CERecommendationDataController_fetchRecommendationsWithInfo_completion___block_invoke;
    v32[3] = &unk_2509E0740;
    v34 = v18;
    v35 = v20;
    v25 = v7;
    v33 = v25;
    objc_msgSend(v15, "synchronousDaemonWithErrorHandler:", v32);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v28[0] = v24;
      v28[1] = 3221225472;
      v28[2] = __74__CERecommendationDataController_fetchRecommendationsWithInfo_completion___block_invoke_5;
      v28[3] = &unk_2509E0768;
      v30 = v18;
      v31 = v20;
      v29 = v25;
      objc_msgSend(v26, "fetchRecommendationsForAltDSID:recommendationInfo:completion:", v8, v6, v28);
      v27 = v29;
    }
    else
    {
      _CELogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[CERecommendationDataController fetchRecommendationsWithInfo:completion:].cold.1();
    }

  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v37 = v8;
      v38 = 1024;
      v39 = v9;
      v40 = 1024;
      v41 = v10;
      _os_log_error_impl(&dword_2380DF000, v12, OS_LOG_TYPE_ERROR, "Invalid account. altDSID: %@ isPrimary: %d isManaged: %d.", buf, 0x18u);
    }

    CECreateError(12);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v15);
  }

}

void __74__CERecommendationDataController_fetchRecommendationsWithInfo_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a2;
  _CELogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke_cold_2();

  _CESignpostGetNanoseconds(a1[5], a1[6]);
  _CESignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_2380DF000, v6, OS_SIGNPOST_INTERVAL_END, v7, "RecommendationsRequest", ", v9, 2u);
  }

  _CESignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke_cold_1();

  (*(void (**)(void))(a1[4] + 16))();
}

void __74__CERecommendationDataController_fetchRecommendationsWithInfo_completion___block_invoke_5(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  void (*v11)(void);
  NSObject *v12;
  uint8_t v13[16];

  v5 = a2;
  v6 = a3;
  _CESignpostGetNanoseconds(a1[5], a1[6]);
  _CESignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_2380DF000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RecommendationsRequest", ", v13, 2u);
  }

  _CESignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke_cold_1();

  if (v5)
  {
    v11 = *(void (**)(void))(a1[4] + 16);
  }
  else
  {
    _CELogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke_1_cold_1();

    v11 = *(void (**)(void))(a1[4] + 16);
  }
  v11();

}

- (void)fetchRecommendationsRulesetWithCompletion:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  BOOL v10;
  id v12;
  NSObject *v13;
  void *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  os_signpost_id_t v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  os_signpost_id_t v30;
  uint64_t v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACAccount aa_altDSID](self->_account, "aa_altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ACAccount aa_isAccountClass:](self->_account, "aa_isAccountClass:", *MEMORY[0x24BE047F0]);
  v7 = -[ACAccount aa_isManagedAppleID](self->_account, "aa_isManagedAppleID");
  _CELogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
    v10 = v6 == 0;
  else
    v10 = 1;
  if (!v10 && v7 == 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CERecommendationDataController fetchRecommendationsRulesetWithCompletion:].cold.2();

    _CESignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_opt_new();
    v15 = _CESignpostCreateWithObject(v13, v14);
    v17 = v16;

    _CESignpostLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2380DF000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v15, "RecommendationsRulesetRequest", ", buf, 2u);
    }

    _CESignpostLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[CERecommendationDataController fetchRecommendationsRulesetWithCompletion:].cold.1();

    v12 = objc_alloc_init((Class)getINDaemonConnectionClass());
    v21 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke;
    v28[3] = &unk_2509E0740;
    v30 = v15;
    v31 = v17;
    v22 = v4;
    v29 = v22;
    objc_msgSend(v12, "daemonWithErrorHandler:", v28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v21;
    v24[1] = 3221225472;
    v24[2] = __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke_6;
    v24[3] = &unk_2509E0790;
    v26 = v15;
    v27 = v17;
    v25 = v22;
    objc_msgSend(v23, "fetchRecommendationsRulesetForAltDSID:completion:", v5, v24);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v33 = v5;
      v34 = 1024;
      v35 = v6;
      v36 = 1024;
      v37 = v7;
      _os_log_error_impl(&dword_2380DF000, v9, OS_LOG_TYPE_ERROR, "Invalid account. altDSID: %@ isPrimary: %d isManaged: %d.", buf, 0x18u);
    }

    CECreateError(12);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v12);
  }

}

void __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a2;
  _CELogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke_cold_2();

  _CESignpostGetNanoseconds(a1[5], a1[6]);
  _CESignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_2380DF000, v6, OS_SIGNPOST_INTERVAL_END, v7, "RecommendationsRulesetRequest", ", v9, 2u);
  }

  _CESignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke_cold_1();

  (*(void (**)(void))(a1[4] + 16))();
}

void __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke_6(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  void (*v11)(void);
  NSObject *v12;
  uint8_t v13[16];

  v5 = a2;
  v6 = a3;
  _CESignpostGetNanoseconds(a1[5], a1[6]);
  _CESignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_2380DF000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RecommendationsRulesetRequest", ", v13, 2u);
  }

  _CESignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke_cold_1();

  if (v5)
  {
    v11 = *(void (**)(void))(a1[4] + 16);
  }
  else
  {
    _CELogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke_6_cold_1();

    v11 = *(void (**)(void))(a1[4] + 16);
  }
  v11();

}

- (void)fetchRecommendationsRulesetWithInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  BOOL v13;
  id v15;
  NSObject *v16;
  void *v17;
  os_signpost_id_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  void *v26;
  NSObject *v27;
  _QWORD v28[4];
  NSObject *v29;
  os_signpost_id_t v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  os_signpost_id_t v34;
  uint64_t v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[ACAccount aa_altDSID](self->_account, "aa_altDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ACAccount aa_isAccountClass:](self->_account, "aa_isAccountClass:", *MEMORY[0x24BE047F0]);
  v10 = -[ACAccount aa_isManagedAppleID](self->_account, "aa_isManagedAppleID");
  _CELogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
    v13 = v9 == 0;
  else
    v13 = 1;
  if (!v13 && v10 == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[CERecommendationDataController fetchRecommendationsRulesetWithCompletion:].cold.2();

    _CESignpostLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_opt_new();
    v18 = _CESignpostCreateWithObject(v16, v17);
    v20 = v19;

    _CESignpostLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2380DF000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v18, "RecommendationsRulesetRequest", ", buf, 2u);
    }

    _CESignpostLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[CERecommendationDataController fetchRecommendationsRulesetWithCompletion:].cold.1();

    v15 = objc_alloc_init((Class)getINDaemonConnectionClass());
    v24 = MEMORY[0x24BDAC760];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __81__CERecommendationDataController_fetchRecommendationsRulesetWithInfo_completion___block_invoke;
    v32[3] = &unk_2509E0740;
    v34 = v18;
    v35 = v20;
    v25 = v7;
    v33 = v25;
    objc_msgSend(v15, "synchronousDaemonWithErrorHandler:", v32);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v28[0] = v24;
      v28[1] = 3221225472;
      v28[2] = __81__CERecommendationDataController_fetchRecommendationsRulesetWithInfo_completion___block_invoke_10;
      v28[3] = &unk_2509E0790;
      v30 = v18;
      v31 = v20;
      v29 = v25;
      objc_msgSend(v26, "fetchRecommendationsRulesetForAltDSID:recommendationInfo:completion:", v8, v6, v28);
      v27 = v29;
    }
    else
    {
      _CELogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[CERecommendationDataController fetchRecommendationsRulesetWithInfo:completion:].cold.1();
    }

  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v37 = v8;
      v38 = 1024;
      v39 = v9;
      v40 = 1024;
      v41 = v10;
      _os_log_error_impl(&dword_2380DF000, v12, OS_LOG_TYPE_ERROR, "Invalid account. altDSID: %@ isPrimary: %d isManaged: %d.", buf, 0x18u);
    }

    CECreateError(12);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v15);
  }

}

void __81__CERecommendationDataController_fetchRecommendationsRulesetWithInfo_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a2;
  _CELogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke_cold_2();

  _CESignpostGetNanoseconds(a1[5], a1[6]);
  _CESignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_2380DF000, v6, OS_SIGNPOST_INTERVAL_END, v7, "RecommendationsRulesetRequest", ", v9, 2u);
  }

  _CESignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke_cold_1();

  (*(void (**)(void))(a1[4] + 16))();
}

void __81__CERecommendationDataController_fetchRecommendationsRulesetWithInfo_completion___block_invoke_10(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  void (*v11)(void);
  NSObject *v12;
  uint8_t v13[16];

  v5 = a2;
  v6 = a3;
  _CESignpostGetNanoseconds(a1[5], a1[6]);
  _CESignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_2380DF000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RecommendationsRulesetRequest", ", v13, 2u);
  }

  _CESignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke_cold_1();

  if (v5)
  {
    v11 = *(void (**)(void))(a1[4] + 16);
  }
  else
  {
    _CELogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke_6_cold_1();

    v11 = *(void (**)(void))(a1[4] + 16);
  }
  v11();

}

- (void)fetchCompletedRecommendations:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  BOOL v13;
  id v15;
  NSObject *v16;
  void *v17;
  os_signpost_id_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  os_signpost_id_t v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  os_signpost_id_t v33;
  uint64_t v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[ACAccount aa_altDSID](self->_account, "aa_altDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ACAccount aa_isAccountClass:](self->_account, "aa_isAccountClass:", *MEMORY[0x24BE047F0]);
  v10 = -[ACAccount aa_isManagedAppleID](self->_account, "aa_isManagedAppleID");
  _CELogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
    v13 = v9 == 0;
  else
    v13 = 1;
  if (!v13 && v10 == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[CERecommendationDataController fetchCompletedRecommendations:completion:].cold.2();

    _CESignpostLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_opt_new();
    v18 = _CESignpostCreateWithObject(v16, v17);
    v20 = v19;

    _CESignpostLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2380DF000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v18, "CompletedRecommendationsRequest", ", buf, 2u);
    }

    _CESignpostLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[CERecommendationDataController fetchCompletedRecommendations:completion:].cold.1();

    v15 = objc_alloc_init((Class)getINDaemonConnectionClass());
    v24 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke;
    v31[3] = &unk_2509E0740;
    v33 = v18;
    v34 = v20;
    v25 = v7;
    v32 = v25;
    objc_msgSend(v15, "daemonWithErrorHandler:", v31);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v24;
    v27[1] = 3221225472;
    v27[2] = __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke_11;
    v27[3] = &unk_2509E0768;
    v29 = v18;
    v30 = v20;
    v28 = v25;
    objc_msgSend(v26, "fetchCompletedAndDismissedRecommendationsForAltDSID:configuration:completion:", v8, v6, v27);

  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v36 = v8;
      v37 = 1024;
      v38 = v9;
      v39 = 1024;
      v40 = v10;
      _os_log_error_impl(&dword_2380DF000, v12, OS_LOG_TYPE_ERROR, "Invalid account. altDSID: %@ isPrimary: %d isManaged: %d.", buf, 0x18u);
    }

    CECreateError(12);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v15);
  }

}

void __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a2;
  _CELogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke_cold_2();

  _CESignpostGetNanoseconds(a1[5], a1[6]);
  _CESignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_2380DF000, v6, OS_SIGNPOST_INTERVAL_END, v7, "CompletedRecommendationsRequest", ", v9, 2u);
  }

  _CESignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke_cold_1();

  (*(void (**)(void))(a1[4] + 16))();
}

void __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke_11(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  void (*v11)(void);
  NSObject *v12;
  uint8_t v13[16];

  v5 = a2;
  v6 = a3;
  _CESignpostGetNanoseconds(a1[5], a1[6]);
  _CESignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_2380DF000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CompletedRecommendationsRequest", ", v13, 2u);
  }

  _CESignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke_cold_1();

  if (v5)
  {
    v11 = *(void (**)(void))(a1[4] + 16);
  }
  else
  {
    _CELogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke_11_cold_1();

    v11 = *(void (**)(void))(a1[4] + 16);
  }
  v11();

}

- (void)fetchCompletedRecommendations:(id)a3 recommendationInfo:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  BOOL v14;
  id v16;
  NSObject *v17;
  void *v18;
  os_signpost_id_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  void *v27;
  NSObject *v28;
  _QWORD v29[4];
  NSObject *v30;
  os_signpost_id_t v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  os_signpost_id_t v35;
  uint64_t v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  -[ACAccount aa_altDSID](self->_account, "aa_altDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ACAccount aa_isAccountClass:](self->_account, "aa_isAccountClass:", *MEMORY[0x24BE047F0]);
  v11 = -[ACAccount aa_isManagedAppleID](self->_account, "aa_isManagedAppleID");
  _CELogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
    v14 = v10 == 0;
  else
    v14 = 1;
  if (!v14 && v11 == 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[CERecommendationDataController fetchCompletedRecommendations:completion:].cold.2();

    _CESignpostLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_opt_new();
    v19 = _CESignpostCreateWithObject(v17, v18);
    v21 = v20;

    _CESignpostLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2380DF000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v19, "CompletedRecommendationsRequest", ", buf, 2u);
    }

    _CESignpostLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[CERecommendationDataController fetchCompletedRecommendations:completion:].cold.1();

    v16 = objc_alloc_init((Class)getINDaemonConnectionClass());
    v25 = MEMORY[0x24BDAC760];
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __94__CERecommendationDataController_fetchCompletedRecommendations_recommendationInfo_completion___block_invoke;
    v33[3] = &unk_2509E0740;
    v35 = v19;
    v36 = v21;
    v26 = v8;
    v34 = v26;
    objc_msgSend(v16, "synchronousDaemonWithErrorHandler:", v33);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v29[0] = v25;
      v29[1] = 3221225472;
      v29[2] = __94__CERecommendationDataController_fetchCompletedRecommendations_recommendationInfo_completion___block_invoke_14;
      v29[3] = &unk_2509E0768;
      v31 = v19;
      v32 = v21;
      v30 = v26;
      objc_msgSend(v27, "fetchCompletedAndDismissedRecommendationsForAltDSID:recommendationInfo:completion:", v9, v7, v29);
      v28 = v30;
    }
    else
    {
      _CELogSystem();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[CERecommendationDataController fetchCompletedRecommendations:recommendationInfo:completion:].cold.1();
    }

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v38 = v9;
      v39 = 1024;
      v40 = v10;
      v41 = 1024;
      v42 = v11;
      _os_log_error_impl(&dword_2380DF000, v13, OS_LOG_TYPE_ERROR, "Invalid account. altDSID: %@ isPrimary: %d isManaged: %d.", buf, 0x18u);
    }

    CECreateError(12);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v8 + 2))(v8, 0, v16);
  }

}

void __94__CERecommendationDataController_fetchCompletedRecommendations_recommendationInfo_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a2;
  _CELogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke_cold_2();

  _CESignpostGetNanoseconds(a1[5], a1[6]);
  _CESignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_2380DF000, v6, OS_SIGNPOST_INTERVAL_END, v7, "CompletedRecommendationsRequest", ", v9, 2u);
  }

  _CESignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke_cold_1();

  (*(void (**)(void))(a1[4] + 16))();
}

void __94__CERecommendationDataController_fetchCompletedRecommendations_recommendationInfo_completion___block_invoke_14(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  void (*v11)(void);
  NSObject *v12;
  uint8_t v13[16];

  v5 = a2;
  v6 = a3;
  _CESignpostGetNanoseconds(a1[5], a1[6]);
  _CESignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_2380DF000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CompletedRecommendationsRequest", ", v13, 2u);
  }

  _CESignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke_cold_1();

  if (v5)
  {
    v11 = *(void (**)(void))(a1[4] + 16);
  }
  else
  {
    _CELogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke_11_cold_1();

    v11 = *(void (**)(void))(a1[4] + 16);
  }
  v11();

}

- (void)sendRecommendationStatus:(id)a3 configuration:(id)a4 recommendationIdentifiers:(id)a5 storageRecovered:(id)a6 context:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  const __CFString *v17;
  uint64_t v18;
  int v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  BOOL v23;
  NSObject *v24;
  void *v25;
  os_signpost_id_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  __CFString *v37;
  const __CFString *v38;
  void *v39;
  id *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  _QWORD v49[4];
  _QWORD v50[3];
  _QWORD v51[4];
  _QWORD v52[3];
  _QWORD v53[4];
  id v54;
  os_signpost_id_t v55;
  uint64_t v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  int v60;
  __int16 v61;
  int v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v46 = a6;
  v17 = (const __CFString *)a7;
  v48 = a8;
  -[ACAccount aa_altDSID](self->_account, "aa_altDSID");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = -[ACAccount aa_isAccountClass:](self->_account, "aa_isAccountClass:", *MEMORY[0x24BE047F0]);
  v20 = -[ACAccount aa_isManagedAppleID](self->_account, "aa_isManagedAppleID");
  _CELogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  v47 = (void *)v18;
  if (v18 && (v19 ? (v23 = v20 == 0) : (v23 = 0), v23))
  {
    v45 = v16;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[CERecommendationDataController sendRecommendationStatus:configuration:recommendationIdentifiers:storageRecovered:context:completion:].cold.2();

    _CESignpostLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_opt_new();
    v26 = _CESignpostCreateWithObject(v24, v25);
    v28 = v27;

    _CESignpostLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2380DF000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v26, "RecommendationStatusRequest", ", buf, 2u);
    }
    v43 = v15;

    _CESignpostLogSystem();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      -[CERecommendationDataController sendRecommendationStatus:configuration:recommendationIdentifiers:storageRecovered:context:completion:].cold.1();

    v32 = objc_alloc_init((Class)getINDaemonConnectionClass());
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __135__CERecommendationDataController_sendRecommendationStatus_configuration_recommendationIdentifiers_storageRecovered_context_completion___block_invoke;
    v53[3] = &unk_2509E0740;
    v55 = v26;
    v56 = v28;
    v33 = v28;
    v34 = v48;
    v54 = v34;
    objc_msgSend(v32, "daemonWithErrorHandler:", v53);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v45, CFSTR("recommendations"));
    v37 = (__CFString *)v17;
    if (v17)
      v38 = v17;
    else
      v38 = CFSTR("main");
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v38, CFSTR("context"), v43);
    v39 = v46;
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v46, CFSTR("storageRecovered"));
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v14, CFSTR("action"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v51[0] = MEMORY[0x24BDAC760];
      v51[1] = 3221225472;
      v51[2] = __135__CERecommendationDataController_sendRecommendationStatus_configuration_recommendationIdentifiers_storageRecovered_context_completion___block_invoke_27;
      v51[3] = &unk_2509E0740;
      v52[1] = v26;
      v52[2] = v33;
      v40 = (id *)v52;
      v52[0] = v34;
      v41 = v47;
      v15 = v44;
      objc_msgSend(v35, "sendStatusForRecommendationsWithAltDSID:configuration:params:completion:", v47, v44, v36, v51);
    }
    else
    {
      v49[0] = MEMORY[0x24BDAC760];
      v49[1] = 3221225472;
      v49[2] = __135__CERecommendationDataController_sendRecommendationStatus_configuration_recommendationIdentifiers_storageRecovered_context_completion___block_invoke_28;
      v49[3] = &unk_2509E0740;
      v50[1] = v26;
      v50[2] = v33;
      v40 = (id *)v50;
      v50[0] = v34;
      v41 = v47;
      v15 = v44;
      objc_msgSend(v35, "sendStatusForRecommendationsWithAltDSID:configuration:status:recommendationIdentifiers:storageRecovered:completion:", v47, v44, v14, v45, v46, v49);
    }

    v16 = v45;
    v42 = v48;
  }
  else
  {
    v37 = (__CFString *)v17;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v58 = v47;
      v59 = 1024;
      v60 = v19;
      v61 = 1024;
      v62 = v20;
      _os_log_error_impl(&dword_2380DF000, v22, OS_LOG_TYPE_ERROR, "Invalid account. altDSID: %@ isPrimary: %d isManaged: %d.", buf, 0x18u);
    }

    CECreateError(12);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v42 = v48;
    (*((void (**)(id, id))v48 + 2))(v48, v32);
    v39 = v46;
    v41 = v47;
  }

}

void __135__CERecommendationDataController_sendRecommendationStatus_configuration_recommendationIdentifiers_storageRecovered_context_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a2;
  _CELogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __135__CERecommendationDataController_sendRecommendationStatus_configuration_recommendationIdentifiers_storageRecovered_context_completion___block_invoke_cold_2();

  _CESignpostGetNanoseconds(a1[5], a1[6]);
  _CESignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_2380DF000, v6, OS_SIGNPOST_INTERVAL_END, v7, "RecommendationStatusRequest", ", v9, 2u);
  }

  _CESignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __135__CERecommendationDataController_sendRecommendationStatus_configuration_recommendationIdentifiers_storageRecovered_context_completion___block_invoke_cold_1();

  (*(void (**)(void))(a1[4] + 16))();
}

void __135__CERecommendationDataController_sendRecommendationStatus_configuration_recommendationIdentifiers_storageRecovered_context_completion___block_invoke_27(_QWORD *a1, void *a2)
{
  os_signpost_id_t *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  uint8_t v11[16];

  v4 = a1[5];
  v5 = a1[6];
  v3 = a1 + 5;
  v6 = a2;
  _CESignpostGetNanoseconds(v4, v5);
  _CESignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *v3;
  if (*v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_2380DF000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RecommendationStatusRequest", ", v11, 2u);
  }

  _CESignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __135__CERecommendationDataController_sendRecommendationStatus_configuration_recommendationIdentifiers_storageRecovered_context_completion___block_invoke_cold_1();

  (*(void (**)(void))(a1[4] + 16))();
}

void __135__CERecommendationDataController_sendRecommendationStatus_configuration_recommendationIdentifiers_storageRecovered_context_completion___block_invoke_28(_QWORD *a1, void *a2)
{
  os_signpost_id_t *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  uint8_t v11[16];

  v4 = a1[5];
  v5 = a1[6];
  v3 = a1 + 5;
  v6 = a2;
  _CESignpostGetNanoseconds(v4, v5);
  _CESignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *v3;
  if (*v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_2380DF000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RecommendationStatusRequest", ", v11, 2u);
  }

  _CESignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __135__CERecommendationDataController_sendRecommendationStatus_configuration_recommendationIdentifiers_storageRecovered_context_completion___block_invoke_cold_1();

  (*(void (**)(void))(a1[4] + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)fetchRecommendationsWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_2380DF000, v0, v1, "SIGNPOST BEGIN [id: %hu]: RecommendationsRequest ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)fetchRecommendationsWithCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_2380DF000, v0, v1, "Reaching out to daemon to fetch recommendations", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2380DF000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) RecommendationsRequest ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_2380DF000, v0, v1, "XPC Error while reaching out to daemon to fetch recommendations", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke_1_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_2380DF000, v0, v1, "Failed to fetch Recommendations with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)fetchRecommendationsWithInfo:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_2380DF000, v0, v1, "Method [INDaemon fetchRecommendationsForAltDSID:details:completion:] not implemented yet.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)fetchRecommendationsRulesetWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_2380DF000, v0, v1, "SIGNPOST BEGIN [id: %hu]: RecommendationsRulesetRequest ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)fetchRecommendationsRulesetWithCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_2380DF000, v0, v1, "Reaching out to daemon to fetch recommendations ruleset", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2380DF000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) RecommendationsRulesetRequest ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_2380DF000, v0, v1, "XPC Error while reaching out to daemon to fetch recommendations ruleset", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke_6_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_2380DF000, v0, v1, "Failed to fetch Recommendations rules with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)fetchRecommendationsRulesetWithInfo:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_2380DF000, v0, v1, "Method [INDaemon fetchRecommendationsRulesetForAltDSID:details:completion:] not implemented yet.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)fetchCompletedRecommendations:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_2380DF000, v0, v1, "SIGNPOST BEGIN [id: %hu]: CompletedRecommendationsRequest ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)fetchCompletedRecommendations:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_2380DF000, v0, v1, "Reaching out to daemon to fetch completed & dismissed recommendations", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2380DF000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) CompletedRecommendationsRequest ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_2380DF000, v0, v1, "XPC Error while reaching out to daemon to fetch completed recommendations", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke_11_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_2380DF000, v0, v1, "Failed to fetch completed and dismissed recommendations with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)fetchCompletedRecommendations:recommendationInfo:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_2380DF000, v0, v1, "Method [INDaemon fetchCompletedAndDismissedRecommendationsForAltDSID:details:completion:] not implemented yet.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)sendRecommendationStatus:configuration:recommendationIdentifiers:storageRecovered:context:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_2380DF000, v0, v1, "SIGNPOST BEGIN [id: %hu]: RecommendationStatusRequest ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)sendRecommendationStatus:configuration:recommendationIdentifiers:storageRecovered:context:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_2380DF000, v0, v1, "Reaching out to daemon to fetch send recommendations status", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __135__CERecommendationDataController_sendRecommendationStatus_configuration_recommendationIdentifiers_storageRecovered_context_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2380DF000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) RecommendationStatusRequest ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __135__CERecommendationDataController_sendRecommendationStatus_configuration_recommendationIdentifiers_storageRecovered_context_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_2380DF000, v0, v1, "XPC Error while reaching out to daemon to send recommendations status %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

@end
