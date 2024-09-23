@implementation CDPDLocalSecretFollowUpProviderImpl

- (CDPDLocalSecretFollowUpProviderImpl)initWithAltDSID:(id)a3
{
  id v5;
  CDPDLocalSecretFollowUpProviderImpl *v6;
  CDPDLocalSecretFollowUpProviderImpl *v7;

  v5 = a3;
  v6 = -[CDPDLocalSecretFollowUpProviderImpl init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_altDSID, a3);

  return v7;
}

- (CDPDLocalSecretFollowUpProviderImpl)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDPDLocalSecretFollowUpProviderImpl;
  return -[CDPDLocalSecretFollowUpProviderImpl init](&v3, sel_init);
}

- (void)postRepairFollowUp
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE1A428], "contextForStateRepair");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAltDSID:", self->_altDSID);
  +[CDPDFollowUpController sharedInstance](CDPDFollowUpController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postFollowUpItemForContext:error:", v4, 0);

}

- (void)postLocalSecretChangeFollowUp
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1A428], "contextForOfflinePasscodeChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAltDSID:", self->_altDSID);
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "altDSID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 141558274;
    v8 = 1752392040;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEFAULT, "\"postLocalSecretChangeFollowUp: altDSID:%{mask.hash}@\", (uint8_t *)&v7, 0x16u);

  }
  +[CDPDFollowUpController sharedInstance](CDPDFollowUpController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postFollowUpItemForContext:error:", v3, 0);

}

- (void)deleteLocalSecretChangeFollowUp
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1A428], "contextForOfflinePasscodeChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAltDSID:", self->_altDSID);
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "altDSID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 141558274;
    v8 = 1752392040;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEFAULT, "\"deleteLocalSecretChangeFollowUp: altDSID:%{mask.hash}@\", (uint8_t *)&v7, 0x16u);

  }
  +[CDPDFollowUpController sharedInstance](CDPDFollowUpController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clearFollowUpWithContext:error:", v3, 0);

}

- (void)postConfirmExistingSecretFollowUp
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1A428], "contextForConfirmExistingSecret");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAltDSID:", self->_altDSID);
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "altDSID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 141558274;
    v8 = 1752392040;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEFAULT, "\"postConfirmExistingSecretFollowUp: altDSID:%{mask.hash}@\", (uint8_t *)&v7, 0x16u);

  }
  +[CDPDFollowUpController sharedInstance](CDPDFollowUpController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postFollowUpItemForContext:error:", v3, 0);

}

- (void)deleteConfirmExistingSecretFollowUp
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1A428], "contextForConfirmExistingSecret");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAltDSID:", self->_altDSID);
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "altDSID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 141558274;
    v8 = 1752392040;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEFAULT, "\"deleteConfirmExistingSecretFollowUp: altDSID:%{mask.hash}@\", (uint8_t *)&v7, 0x16u);

  }
  +[CDPDFollowUpController sharedInstance](CDPDFollowUpController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clearFollowUpWithContext:error:", v3, 0);

}

- (void)deleteCreatePasscodeFollowUp
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BE1A428];
  v4 = objc_alloc_init(MEMORY[0x24BE1A3F8]);
  objc_msgSend(v3, "contextForWalrusCreatePasscodeWithCDPContext:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAltDSID:", self->_altDSID);
  +[CDPDFollowUpController sharedInstance](CDPDFollowUpController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearFollowUpWithContext:error:", v6, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
