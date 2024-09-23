@implementation CDPDBackupIDMSErrorProvider

- (BOOL)supportsErrorPresentation
{
  return 1;
}

- (id)cooldownErrorWithUnderlyingError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("ACCOUNT_RECOVERY_SOFT_LIMIT_REACHED_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDD0FC8]);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("ACCOUNT_RECOVERY_SOFT_LIMIT_REACHED_MESSAGE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSecretType:", self->super._prevailingSecret);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDD0FD8]);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_ERROR_DEFAULT_BUTTON"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BDD0FF0]);

  if (v4)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BDD1398]);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_ERROR_DEFAULT_BUTTON"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDD0FE8]);

  _CDPStateError();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)globalHardLimitError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("ACCOUNT_RECOVERY_HARD_LIMIT_REACHED_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDD0FC8]);

  v6 = (void *)MEMORY[0x24BE1A458];
  v7 = CFSTR("ACCOUNT_RECOVERY_HARD_LIMIT_REACHED_MESSAGE_GLOBAL");
  if ((objc_msgSend(CFSTR("ACCOUNT_RECOVERY_HARD_LIMIT_REACHED_MESSAGE_GLOBAL"), "containsString:", CFSTR("REBRAND")) & 1) != 0
    || !_os_feature_enabled_impl())
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(CFSTR("ACCOUNT_RECOVERY_HARD_LIMIT_REACHED_MESSAGE_GLOBAL"), "stringByAppendingString:", CFSTR("_REBRAND"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = 1;
  }
  objc_msgSend(v6, "builderForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSecretType:", self->super._prevailingSecret);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDD0FD8]);

  if (v8)
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("START_ACCOUNT_RECOVERY_BUTTON"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDD0FF0]);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("START_ACCOUNT_RECOVERY_BUTTON"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_CANCEL_BUTTON"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BDD0FE8]);

  _CDPStateError();
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)globalHardLimitErrorWithRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("ACCOUNT_RECOVERY_HARD_LIMIT_REACHED_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDD0FC8]);

  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = (void *)MEMORY[0x24BE1A458];
  v9 = CFSTR("ACCOUNT_RECOVERY_HARD_LIMIT_REACHED_MESSAGE_SINGLE");
  if ((objc_msgSend(CFSTR("ACCOUNT_RECOVERY_HARD_LIMIT_REACHED_MESSAGE_SINGLE"), "containsString:", CFSTR("REBRAND")) & 1) != 0
    || !_os_feature_enabled_impl())
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(CFSTR("ACCOUNT_RECOVERY_HARD_LIMIT_REACHED_MESSAGE_SINGLE"), "stringByAppendingString:", CFSTR("_REBRAND"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = 1;
  }
  objc_msgSend(v8, "builderForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSecretType:", objc_msgSend(v3, "localSecretType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%@"), 0, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDD0FD8]);

  if (v10)
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("START_ACCOUNT_RECOVERY_BUTTON"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BDD0FF0]);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("START_ACCOUNT_RECOVERY_BUTTON"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v19;
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_CANCEL_BUTTON"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BDD0FE8]);

  _CDPStateError();
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)hardLimitErrorForRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_MULTIPLE_INCORRECT_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDD0FC8]);

  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("ACCOUNT_RECOVERY_HARD_LIMIT_REACHED_MESSAGE_MULTI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSecretType:", self->super._prevailingSecret);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%@"), 0, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDD0FD8]);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_ERROR_DEFAULT_BUTTON"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BDD0FF0]);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_ERROR_DEFAULT_BUTTON"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, *MEMORY[0x24BDD0FE8]);

  _CDPStateError();
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)recordNotFoundErrorWithUnderlyingError:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7 = *MEMORY[0x24BDD1398];
  _CDPStateError();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPStateError();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)handleHardLimitError:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  CDPStateUIProviderInternal *uiProvider;
  CDPContext *context;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  uiProvider = self->super._uiProvider;
  context = self->super._context;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__CDPDBackupIDMSErrorProvider_handleHardLimitError_completion___block_invoke;
  v12[3] = &unk_24C81C900;
  v13 = v6;
  v14 = v7;
  v10 = v6;
  v11 = v7;
  -[CDPStateUIProviderInternal cdpContext:showError:withCompletion:](uiProvider, "cdpContext:showError:withCompletion:", context, v10, v12);

}

void __63__CDPDBackupIDMSErrorProvider_handleHardLimitError_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    v5 = *MEMORY[0x24BDD1398];
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = *MEMORY[0x24BDD1398];
    v8[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _CDPStateError();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

}

- (void)handleSoftLimitError:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  CDPStateUIProviderInternal *uiProvider;
  CDPContext *context;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  uiProvider = self->super._uiProvider;
  context = self->super._context;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__CDPDBackupIDMSErrorProvider_handleSoftLimitError_completion___block_invoke;
  v12[3] = &unk_24C81C900;
  v13 = v6;
  v14 = v7;
  v10 = v6;
  v11 = v7;
  -[CDPStateUIProviderInternal cdpContext:showError:withCompletion:](uiProvider, "cdpContext:showError:withCompletion:", context, v10, v12);

}

void __63__CDPDBackupIDMSErrorProvider_handleSoftLimitError_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v5 = *MEMORY[0x24BDD1398];
  v6[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPStateError();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

}

@end
