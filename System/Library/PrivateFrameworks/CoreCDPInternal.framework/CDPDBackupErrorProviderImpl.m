@implementation CDPDBackupErrorProviderImpl

- (CDPDBackupErrorProviderImpl)initWithContext:(id)a3 uiProvider:(id)a4
{
  id v7;
  id v8;
  CDPDBackupErrorProviderImpl *v9;
  CDPDBackupErrorProviderImpl *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDPDBackupErrorProviderImpl;
  v9 = -[CDPDBackupErrorProviderImpl init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_uiProvider, a4);
  }

  return v10;
}

- (BOOL)supportsErrorPresentation
{
  return 0;
}

- (void)setPrevailingSecret:(unint64_t)a3
{
  self->_prevailingSecret = a3;
}

- (id)cooldownErrorWithUnderlyingError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *MEMORY[0x24BDD1398]);
  _CDPStateError();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)globalHardLimitError
{
  return (id)_CDPStateError();
}

- (id)globalHardLimitErrorWithRecord:(id)a3
{
  return (id)_CDPStateError();
}

- (id)hardLimitErrorForRecord:(id)a3
{
  return (id)_CDPStateError();
}

- (id)verficationFailedErrorwithUnderlyingError:(id)a3
{
  id v3;
  void *v4;
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
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_RECOVERY_ERROR_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDD0FC8]);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_ERROR_ICLOUD_CONNECTION_MESSAGE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDD0FD8]);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_ERROR_DEFAULT_BUTTON"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDD0FF0]);

  if (v3)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *MEMORY[0x24BDD1398]);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_ERROR_DEFAULT_BUTTON"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDD0FE8]);

  _CDPStateError();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)recordNotFoundErrorWithUnderlyingError:(id)a3
{
  return (id)_CDPStateError();
}

- (void)handleHardLimitError:(id)a3 completion:(id)a4
{
  (*((void (**)(id, id))a4 + 2))(a4, a3);
}

- (void)handleSoftLimitError:(id)a3 completion:(id)a4
{
  (*((void (**)(id, id))a4 + 2))(a4, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiProvider, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
