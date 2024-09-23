@implementation IDSKeyTransparencyManager

- (IDSKeyTransparencyManager)init
{
  IDSKeyTransparencyManager *v2;
  void *v3;
  IDSKTVerificationInfoProvider *v4;
  void *v5;
  IDSKTVerificationInfoProvider *v6;
  void *v7;
  IDSKTVerificationInfoProvider *v8;
  void *v9;
  IDSKTVerificationInfoProvider *v10;
  void *v11;
  IDSKTVerificationInfoProvider *v12;
  void *v13;
  IDSKTVerificationInfoProvider *v14;
  uint64_t v15;
  NSDictionary *applicationToVerificationInfoProviders;
  objc_super v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)IDSKeyTransparencyManager;
  v2 = -[IDSKeyTransparencyManager init](&v18, sel_init);
  if (v2)
  {
    sub_190760054();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v3;
    v4 = [IDSKTVerificationInfoProvider alloc];
    sub_190760054();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[IDSKTVerificationInfoProvider initWithApplicationIdentifier:](v4, "initWithApplicationIdentifier:", v5);
    v20[0] = v6;
    sub_1907600F0();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v7;
    v8 = [IDSKTVerificationInfoProvider alloc];
    sub_1907600F0();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[IDSKTVerificationInfoProvider initWithApplicationIdentifier:](v8, "initWithApplicationIdentifier:", v9);
    v20[1] = v10;
    sub_19076018C();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v11;
    v12 = [IDSKTVerificationInfoProvider alloc];
    sub_19076018C();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[IDSKTVerificationInfoProvider initWithApplicationIdentifier:](v12, "initWithApplicationIdentifier:", v13);
    v20[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
    v15 = objc_claimAutoreleasedReturnValue();
    applicationToVerificationInfoProviders = v2->_applicationToVerificationInfoProviders;
    v2->_applicationToVerificationInfoProviders = (NSDictionary *)v15;

  }
  return v2;
}

- (id)verificationInfoProviderForApplication:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_applicationToVerificationInfoProviders, "objectForKeyedSubscript:", a3);
}

- (id)verificationInfoProviderIdForApplication:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_verificationInfoProviderForApplication_);
}

- (void)getKeyTransparencyOptInEligiblityForApplication:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint64_t *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void *v32;
  id v33;
  id v34;
  __int128 buf;
  void (*v36)(uint64_t, void *);
  void *v37;
  id v38;
  uint64_t *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "KeyTransparency");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v5;
        _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Fetching KT eligibility with completion {application: %@}", (uint8_t *)&buf, 0xCu);
      }

      v9 = MEMORY[0x1E0C809B0];
      v29 = MEMORY[0x1E0C809B0];
      v30 = 3221225472;
      v31 = sub_190760474;
      v32 = &unk_1E2C630A8;
      v33 = v5;
      v10 = v6;
      v34 = v10;
      v11 = &v29;
      v12 = v10;
      *(_QWORD *)&buf = v9;
      *((_QWORD *)&buf + 1) = 3221225472;
      v36 = sub_1907614A4;
      v37 = &unk_1E2C62DA8;
      v38 = v12;
      v39 = v11;
      +[IDSXPCDaemonController performDaemonControllerTask:](IDSXPCDaemonController, "performDaemonControllerTask:", &buf, v29, v30, v31, v32);

      v13 = v33;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1907F0FAC(v8, v22, v23, v24, v25, v26, v27, v28);

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IDSKeyTransparencyManagerErrorDomain"), 200, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, v13);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "KeyTransparency");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1907F0F3C(v14, v15, v16, v17, v18, v19, v20, v21);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IDSKeyTransparencyManagerErrorDomain"), 200, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x10](0, 0, 0, v13);
  }

}

- (void)sendOptInUpdateForApplications:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "KeyTransparency");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v5;
        _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Updating IDS Server with KT Opt in Info {optInInfo: %@}", buf, 0xCu);
      }

      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = sub_190760668;
      v25[3] = &unk_1E2C61F88;
      v27 = v6;
      v26 = v5;
      +[IDSXPCDaemonController performDaemonControllerTask:](IDSXPCDaemonController, "performDaemonControllerTask:", v25);

      v9 = v27;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1907F108C(v8, v18, v19, v20, v21, v22, v23, v24);

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IDSKeyTransparencyManagerErrorDomain"), 200, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v9);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "KeyTransparency");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907F101C(v10, v11, v12, v13, v14, v15, v16, v17);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IDSKeyTransparencyManagerErrorDomain"), 200, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x10](0, 0, v9);
  }

}

- (void)sendOptInUpdateForApplicationsOptInState:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  NSObject *v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "KeyTransparency");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v5;
        _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Updating IDS Server with KT Opt in Info {optInInfo: %@}", buf, 0xCu);
      }

      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = sub_1907609F0;
      v26[3] = &unk_1E2C61F88;
      v28 = v6;
      v27 = v5;
      +[IDSXPCDaemonController performDaemonControllerTask:](IDSXPCDaemonController, "performDaemonControllerTask:", v26);

      v9 = v28;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1907F116C(v8, v17, v18, v19, v20, v21, v22, v23);

      v24 = objc_alloc(MEMORY[0x1E0D34DA8]);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IDSKeyTransparencyManagerErrorDomain"), 200, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v24, "initWithSuccess:serverProvidedSMT:error:", 0, 0, v9);
      (*((void (**)(id, void *))v6 + 2))(v6, v25);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "KeyTransparency");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907F10FC(v9, v10, v11, v12, v13, v14, v15, v16);
  }

}

- (void)sendOptInUpdateRequest:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  NSObject *v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "KeyTransparency");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v5;
        _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Updating IDS Server with KT Opt In/Out Request {optInOutRequest: %@}", buf, 0xCu);
      }

      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = sub_190760CF0;
      v26[3] = &unk_1E2C61F88;
      v28 = v6;
      v27 = v5;
      +[IDSXPCDaemonController performDaemonControllerTask:](IDSXPCDaemonController, "performDaemonControllerTask:", v26);

      v9 = v28;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1907F124C(v8, v17, v18, v19, v20, v21, v22, v23);

      v24 = objc_alloc(MEMORY[0x1E0D34DA8]);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IDSKeyTransparencyManagerErrorDomain"), 200, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v24, "initWithSuccess:optedInOutURIs:serverSMTByURI:error:", 0, 0, 0, v9);
      (*((void (**)(id, void *))v6 + 2))(v6, v25);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "KeyTransparency");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907F11DC(v9, v10, v11, v12, v13, v14, v15, v16);
  }

}

- (void)fetchKTRegistrationStatusWithCompletion:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_190760EC4;
  v5[3] = &unk_1E2C61F38;
  v6 = v3;
  v4 = v3;
  +[IDSXPCDaemonController performDaemonControllerTask:](IDSXPCDaemonController, "performDaemonControllerTask:", v5);

}

- (void)registrationDataNeedsUpdate
{
  +[IDSXPCDaemonController performDaemonControllerTask:](IDSXPCDaemonController, "performDaemonControllerTask:", &unk_1E2C5FB70);
}

- (void)peerVerificationFinishedWithResults:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[16];

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D34D40], "KeyTransparency");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906E0000, v4, OS_LOG_TYPE_DEFAULT, "Received peerVerificationFinishedWithResults notification from Transparency", buf, 2u);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_190761144;
  v6[3] = &unk_1E2C616B0;
  v7 = v3;
  v5 = v3;
  +[IDSXPCDaemonController performDaemonControllerTask:](IDSXPCDaemonController, "performDaemonControllerTask:", v6);

}

- (void)cacheClearRequest:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D34D40], "KeyTransparency");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1906E0000, v4, OS_LOG_TYPE_DEFAULT, "Transparency requested to clear IDS query cache. { Request: %@ }", buf, 0xCu);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1907612E8;
  v6[3] = &unk_1E2C616B0;
  v7 = v3;
  v5 = v3;
  +[IDSXPCDaemonController performDaemonControllerTask:](IDSXPCDaemonController, "performDaemonControllerTask:", v6);

}

- (NSDictionary)applicationToVerificationInfoProviders
{
  return self->_applicationToVerificationInfoProviders;
}

- (void)setApplicationToVerificationInfoProviders:(id)a3
{
  objc_storeStrong((id *)&self->_applicationToVerificationInfoProviders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationToVerificationInfoProviders, 0);
}

@end
