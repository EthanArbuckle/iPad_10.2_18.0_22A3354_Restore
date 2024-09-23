@implementation AAAcceptedTermsController

- (void)saveTermsAcceptance:(id)a3 forAccount:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  unint64_t Nanoseconds;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD v22[6];
  uint8_t buf[4];
  os_signpost_id_t v24;
  __int16 v25;
  double v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _AASignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = _AASignpostCreate(v8);
  v11 = v10;

  _AASignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "RecordTerms", " enableTelemetry=YES ", buf, 2u);
  }

  _AASignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v24 = v9;
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RecordTerms  enableTelemetry=YES ", buf, 0xCu);
  }

  if (-[AAAcceptedTermsController _shouldRecordTermsForBuddyWithTermsInfo:](self, "_shouldRecordTermsForBuddyWithTermsInfo:", v6))
  {
    -[AAAcceptedTermsController _recordTermsForBuddyWithTermsInfo:](self, "_recordTermsForBuddyWithTermsInfo:", v6);
  }
  objc_msgSend(v7, "_aa_setLastAgreedTermsInfo:", v6);
  objc_msgSend(v7, "aa_setNeedsToVerifyTerms:", 0);
  v15 = objc_msgSend(v7, "aa_isAccountClass:", CFSTR("primary"));

  if (v15)
  {
    _AALogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = (os_signpost_id_t)v6;
      _os_log_impl(&dword_19EACA000, v16, OS_LOG_TYPE_DEFAULT, "Saving terms acceptance: %@", buf, 0xCu);
    }

    v17 = objc_alloc_init((Class)getCDPTermsInfoBackupControllerClass());
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __60__AAAcceptedTermsController_saveTermsAcceptance_forAccount___block_invoke;
    v22[3] = &__block_descriptor_48_e17_v16__0__NSError_8l;
    v22[4] = v9;
    v22[5] = v11;
    -[NSObject saveTermsAcceptance:completion:](v17, "saveTermsAcceptance:completion:", v6, v22);
  }
  else
  {
    Nanoseconds = _AASignpostGetNanoseconds(v9, v11);
    _AASignpostLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_DWORD *)buf = 67240192;
      LODWORD(v24) = 0;
      _os_signpost_emit_with_name_impl(&dword_19EACA000, v20, OS_SIGNPOST_INTERVAL_END, v9, "RecordTerms", " Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 8u);
    }

    _AASignpostLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v24 = v9;
      v25 = 2048;
      v26 = (double)Nanoseconds / 1000000000.0;
      v27 = 1026;
      v28 = 0;
      _os_log_impl(&dword_19EACA000, v21, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecordTerms  Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 0x1Cu);
    }

    _AALogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v17, OS_LOG_TYPE_DEFAULT, "Account is not primary, skip terms save.", buf, 2u);
    }
  }

}

void __60__AAAcceptedTermsController_saveTermsAcceptance_forAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t Nanoseconds;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  double v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  Nanoseconds = _AASignpostGetNanoseconds(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  _AASignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v12 = 67240192;
    LODWORD(v13) = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v6, OS_SIGNPOST_INTERVAL_END, v7, "RecordTerms", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v12, 8u);
  }

  _AASignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(void **)(a1 + 32);
    v10 = objc_msgSend(v3, "code");
    v12 = 134218496;
    v13 = v9;
    v14 = 2048;
    v15 = (double)Nanoseconds / 1000000000.0;
    v16 = 1026;
    v17 = v10;
    _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecordTerms  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v12, 0x1Cu);
  }

  _AALogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v3;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "Save terms acceptance completed with error: %@", (uint8_t *)&v12, 0xCu);
  }

}

- (BOOL)_shouldRecordTermsForBuddyWithTermsInfo:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "objectForKey:", CFSTR("proxiedcontext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (void)fetchTermsAcceptanceForAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  AAAcceptedTermsController *v27;
  id v28;
  os_signpost_id_t v29;
  uint64_t v30;
  uint8_t buf[4];
  os_signpost_id_t v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "aa_isAccountClass:", CFSTR("primary")) & 1) != 0)
  {
    _AASignpostLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = _AASignpostCreate(v8);
    v11 = v10;

    _AASignpostLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19EACA000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "FetchTerms", " enableTelemetry=YES ", buf, 2u);
    }

    _AASignpostLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v32 = v9;
      _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchTerms  enableTelemetry=YES ", buf, 0xCu);
    }

    v15 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __71__AAAcceptedTermsController_fetchTermsAcceptanceForAccount_completion___block_invoke;
    v25[3] = &unk_1E416FD00;
    v16 = v6;
    v26 = v16;
    v27 = self;
    v29 = v9;
    v30 = v11;
    v28 = v7;
    v17 = (void *)MEMORY[0x1A1AED7A0](v25);
    v18 = objc_alloc_init((Class)getCDPTermsInfoBackupControllerClass());
    v23[0] = v15;
    v23[1] = 3221225472;
    v23[2] = __71__AAAcceptedTermsController_fetchTermsAcceptanceForAccount_completion___block_invoke_32;
    v23[3] = &unk_1E416FD28;
    v24 = v17;
    v19 = v17;
    objc_msgSend(v18, "fetchTermsAcceptanceForAccount:completion:", v16, v23);

    v20 = v26;
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0CB2D50];
    v34[0] = CFSTR("Terms acceptance not available for non-primary AppleAccount");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "aa_errorWithCode:userInfo:", -15, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v22);

  }
}

void __71__AAAcceptedTermsController_fetchTermsAcceptanceForAccount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  unint64_t Nanoseconds;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  double v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  __int16 v24;
  double v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "aa_lastAgreedTermsInfo");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5 || !v7)
  {
    Nanoseconds = _AASignpostGetNanoseconds(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    _AASignpostLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = *(_QWORD *)(a1 + 56);
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      v22 = 67240192;
      LODWORD(v23) = objc_msgSend(v6, "code");
      _os_signpost_emit_with_name_impl(&dword_19EACA000, v17, OS_SIGNPOST_INTERVAL_END, v18, "FetchTerms", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v22, 8u);
    }

    _AASignpostLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (double)Nanoseconds / 1000000000.0;
      v20 = *(void **)(a1 + 56);
      v21 = objc_msgSend(v6, "code");
      v22 = 134218496;
      v23 = v20;
      v24 = 2048;
      v25 = v19;
      v26 = 1026;
      v27 = v21;
      _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchTerms  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v22, 0x1Cu);
    }
  }
  else
  {
    _AALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412290;
      v23 = v8;
      _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "Terms info is missing in SecureBackup. Providing ACAccount result: %@", (uint8_t *)&v22, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_repairTermsBackup:forAccount:", v8, *(_QWORD *)(a1 + 32));
    v10 = _AASignpostGetNanoseconds(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    _AASignpostLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = *(_QWORD *)(a1 + 56);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      v22 = 67240192;
      LODWORD(v23) = 0;
      _os_signpost_emit_with_name_impl(&dword_19EACA000, v12, OS_SIGNPOST_INTERVAL_END, v13, "FetchTerms", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v22, 8u);
    }

    _AASignpostLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 134218496;
      v23 = *(void **)(a1 + 56);
      v24 = 2048;
      v25 = (double)v10 / 1000000000.0;
      v26 = 1026;
      v27 = 0;
      _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchTerms  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v22, 0x1Cu);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __71__AAAcceptedTermsController_fetchTermsAcceptanceForAccount_completion___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_19EACA000, v7, OS_LOG_TYPE_DEFAULT, "Fetched terms from SecureBackup with error %@ and result: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_recordTermsForBuddyWithTermsInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[8];
  uint64_t v17;
  Class (*v18)(uint64_t);
  void *v19;
  uint64_t *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SLAVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ioswarrantyVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = objc_msgSend(v4, "unsignedIntValue");
      _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "Found device terms version %u in termsInfo. Updating local license agreement status.", buf, 8u);
    }

    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v7 = (void *)getBYLicenseAgreementClass_softClass;
    v15 = getBYLicenseAgreementClass_softClass;
    if (!getBYLicenseAgreementClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __getBYLicenseAgreementClass_block_invoke;
      v19 = &unk_1E416F0A0;
      v20 = &v12;
      __getBYLicenseAgreementClass_block_invoke((uint64_t)buf);
      v7 = (void *)v13[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v12, 8);
    objc_msgSend(v8, "recordUserAcceptedAgreementVersion:", objc_msgSend(v4, "unsignedIntValue", v12));
  }
  if (v5)
  {
    _AALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "Found device warranty agreement in termsInfo. Updating local warranty agreement status.", buf, 2u);
    }

    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v10 = (void *)getBYWarrantyClass_softClass;
    v15 = getBYWarrantyClass_softClass;
    if (!getBYWarrantyClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __getBYWarrantyClass_block_invoke;
      v19 = &unk_1E416F0A0;
      v20 = &v12;
      __getBYWarrantyClass_block_invoke((uint64_t)buf);
      v10 = (void *)v13[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v12, 8);
    objc_msgSend(v11, "acknowledge", v12);
  }

}

- (void)_repairTermsBackup:(id)a3 forAccount:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C8F2B8];
  v7 = a4;
  objc_msgSend(v6, "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "aa_altDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "aa_appleAccountWithAltDSID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _AALogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "Account exists on disk. Proceeding with repair.", buf, 2u);
    }

    v11 = objc_alloc_init((Class)getCDPTermsInfoBackupControllerClass());
    -[NSObject saveTermsAcceptance:completion:](v11, "saveTermsAcceptance:completion:", v5, &__block_literal_global_17);
  }
  else if (v12)
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "Account does not exist on disk yet. Skipping repair.", v13, 2u);
  }

}

void __59__AAAcceptedTermsController__repairTermsBackup_forAccount___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  _AALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __59__AAAcceptedTermsController__repairTermsBackup_forAccount___block_invoke_cold_1((uint64_t)v2, v4);
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19EACA000, v4, OS_LOG_TYPE_DEFAULT, "Successfully fixed terms info in secure backup.", v5, 2u);
  }

}

void __59__AAAcceptedTermsController__repairTermsBackup_forAccount___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19EACA000, a2, OS_LOG_TYPE_ERROR, "Fixing terms info failed with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
