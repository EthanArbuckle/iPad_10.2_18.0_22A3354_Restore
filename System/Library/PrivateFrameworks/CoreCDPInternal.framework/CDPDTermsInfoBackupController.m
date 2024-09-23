@implementation CDPDTermsInfoBackupController

- (void)saveTermsAcceptance:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Saving terms acceptance: %@\", (uint8_t *)&v10, 0xCu);
  }

  -[CDPDTermsInfoBackupController _buildSecureBackupTermsInfo:](self, "_buildSecureBackupTermsInfo:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE17B80], "saveTermsAcceptance:reply:", v9, v7);

}

- (id)_buildSecureBackupTermsInfo:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x24BE17B88];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE04C20]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVersion:", v6);

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE04C38]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIcloudVersion:", v7);

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE04B58]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCountryCode:", v8);

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE04BA0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMetadata:", v9);

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE04AF8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAltDSID:", v10);
  return v5;
}

- (void)fetchTermsAcceptanceForAccount:(id)a3 completion:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD aBlock[4];
  id v16;

  v5 = a4;
  v6 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__CDPDTermsInfoBackupController_fetchTermsAcceptanceForAccount_completion___block_invoke;
  aBlock[3] = &unk_24C81BE08;
  v16 = v5;
  v7 = v5;
  v8 = a3;
  v9 = _Block_copy(aBlock);
  v10 = (void *)MEMORY[0x24BE17B80];
  objc_msgSend(v8, "aa_altDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __75__CDPDTermsInfoBackupController_fetchTermsAcceptanceForAccount_completion___block_invoke_18;
  v13[3] = &unk_24C81BE08;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v10, "getAcceptedTermsForAltDSID:reply:", v11, v13);

}

void __75__CDPDTermsInfoBackupController_fetchTermsAcceptanceForAccount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void (*v16)(uint64_t, _QWORD, id);
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (v5)
  {
    v6 = (objc_class *)MEMORY[0x24BDBCED8];
    v7 = a3;
    v8 = objc_alloc_init(v6);
    objc_msgSend(v5, "version");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE04C20]);

    objc_msgSend(v5, "icloudVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE04C38]);

    objc_msgSend(v5, "countryCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE04B58]);

    objc_msgSend(v5, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE04BA0]);

    objc_msgSend(v5, "altDSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE04AF8]);

    _CDPLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v8;
      _os_log_impl(&dword_20DB2C000, v14, OS_LOG_TYPE_DEFAULT, "\"Fetched accepted terms with result: %@\", (uint8_t *)&v17, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void (**)(uint64_t, _QWORD, id))(v15 + 16);
    v8 = a3;
    v16(v15, 0, v8);
  }

}

void __75__CDPDTermsInfoBackupController_fetchTermsAcceptanceForAccount_completion___block_invoke_18(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void (*v6)(void);

  v4 = a3;
  if (v4)
  {
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __75__CDPDTermsInfoBackupController_fetchTermsAcceptanceForAccount_completion___block_invoke_18_cold_1((uint64_t)v4, v5);

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

void __75__CDPDTermsInfoBackupController_fetchTermsAcceptanceForAccount_completion___block_invoke_18_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_ERROR, "\"Error fetching terms acceptance %@\", (uint8_t *)&v2, 0xCu);
}

@end
