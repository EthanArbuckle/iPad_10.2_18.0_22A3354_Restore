@implementation AAGrandSlamSigner

- (AAGrandSlamSigner)initWithAccountStore:(id)a3 grandSlamAccount:(id)a4 appTokenID:(id)a5
{
  id v9;
  id v10;
  id v11;
  AAGrandSlamSigner *v12;
  AAGrandSlamSigner *v13;
  uint64_t v14;
  NSString *appTokenID;
  NSString *headerFieldKey;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)AAGrandSlamSigner;
  v12 = -[AAGrandSlamSigner init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountStore, a3);
    objc_storeStrong((id *)&v13->_grandSlamAccount, a4);
    v14 = objc_msgSend(v11, "copy");
    appTokenID = v13->_appTokenID;
    v13->_appTokenID = (NSString *)v14;

    headerFieldKey = v13->_headerFieldKey;
    v13->_headerFieldKey = (NSString *)CFSTR("X-Apple-GS-Token");

  }
  return v13;
}

- (AAGrandSlamSigner)initWithAppleAccount:(id)a3 grandSlamAccount:(id)a4 accountStore:(id)a5 appTokenID:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  AAGrandSlamSigner *v16;

  v9 = a3;
  v10 = a6;
  v11 = a4;
  objc_msgSend(v11, "accountStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v9, "accountStore");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  v16 = -[AAGrandSlamSigner initWithAccountStore:grandSlamAccount:appTokenID:](self, "initWithAccountStore:grandSlamAccount:appTokenID:", v15, v11, v10);
  return v16;
}

- (BOOL)signURLRequest:(id)a3
{
  return -[AAGrandSlamSigner signURLRequest:isUserInitiated:](self, "signURLRequest:isUserInitiated:", a3, 0);
}

- (BOOL)signURLRequest:(id)a3 isUserInitiated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  ACAccount *grandSlamAccount;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_semaphore_t v11;
  void *v12;
  void *v13;
  void *v14;
  ACAccountStore *accountStore;
  ACAccount *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  _QWORD v26[5];
  NSObject *v27;
  uint8_t *v28;
  uint8_t buf[16];
  uint8_t v30[8];
  uint8_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  NSString *appTokenID;
  _QWORD v37[2];
  _QWORD v38[3];

  v4 = a4;
  v38[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  grandSlamAccount = self->_grandSlamAccount;
  if (grandSlamAccount)
  {
    -[ACAccount aida_alternateDSID](grandSlamAccount, "aida_alternateDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v24 = 0;
      goto LABEL_16;
    }
    -[ACAccountStore credentialForAccount:serviceID:](self->_accountStore, "credentialForAccount:serviceID:", self->_grandSlamAccount, self->_appTokenID);
    v9 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v30 = 0;
    v31 = v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__6;
    v34 = __Block_byref_object_dispose__6;
    -[NSObject token](v9, "token");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    if (*((_QWORD *)v31 + 5))
      goto LABEL_7;
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "Could not get GS auth on first try. Will need to prompt for password", buf, 2u);
    }

    v11 = dispatch_semaphore_create(0);
    v37[0] = *MEMORY[0x1E0C8F330];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v12;
    v37[1] = *MEMORY[0x1E0C8F318];
    appTokenID = self->_appTokenID;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &appTokenID, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    accountStore = self->_accountStore;
    v16 = self->_grandSlamAccount;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __52__AAGrandSlamSigner_signURLRequest_isUserInitiated___block_invoke;
    v26[3] = &unk_1E416EAA0;
    v26[4] = self;
    v28 = v30;
    v17 = v11;
    v27 = v17;
    -[ACAccountStore renewCredentialsForAccount:options:completion:](accountStore, "renewCredentialsForAccount:options:completion:", v16, v14, v26);
    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);

    if (*((_QWORD *)v31 + 5))
    {
LABEL_7:
      -[ACAccount aida_dsid](self->_grandSlamAccount, "aida_dsid");
      v18 = objc_claimAutoreleasedReturnValue();
      if (self->_useAltDSID)
      {
        -[ACAccount aida_alternateDSID](self->_grandSlamAccount, "aida_alternateDSID");
        v19 = objc_claimAutoreleasedReturnValue();

        v18 = v19;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v18, *((_QWORD *)v31 + 5));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dataUsingEncoding:", 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "base64EncodedStringWithOptions:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "setValue:forHTTPHeaderField:", v22, self->_headerFieldKey);
      -[ACAccount aida_dsid](self->_grandSlamAccount, "aida_dsid");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "aa_addDeviceProvisioningInfoHeadersWithDSID:", v23);

      v24 = 1;
    }
    else
    {
      _AALogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19EACA000, v18, OS_LOG_TYPE_DEFAULT, "Error: still no GS token even after calling renewCredentialsForAccount.", buf, 2u);
      }
      v24 = 0;
    }

    _Block_object_dispose(v30, 8);
  }
  else
  {
    _AALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "GrandSlam signing failed because no GS account was provided.", v30, 2u);
    }
    v24 = 0;
  }

LABEL_16:
  return v24;
}

void __52__AAGrandSlamSigner_signURLRequest_isUserInitiated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134218242;
      v11 = a2;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "No way to sign request with GS token because renewal of GS credential failed: %ld, %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "credentialForAccount:serviceID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject token](v6, "token");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (ACAccount)grandSlamAccount
{
  return self->_grandSlamAccount;
}

- (BOOL)useAltDSID
{
  return self->_useAltDSID;
}

- (void)setUseAltDSID:(BOOL)a3
{
  self->_useAltDSID = a3;
}

- (NSString)headerFieldKey
{
  return self->_headerFieldKey;
}

- (void)setHeaderFieldKey:(id)a3
{
  objc_storeStrong((id *)&self->_headerFieldKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerFieldKey, 0);
  objc_storeStrong((id *)&self->_appTokenID, 0);
  objc_storeStrong((id *)&self->_grandSlamAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
