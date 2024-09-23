@implementation CertUIConnectionDelegate

- (void)setForwardingDelegate:(id)a3
{
  id *p_forwardingDelegate;
  id v5;
  char v6;
  id WeakRetained;
  char v8;
  id v9;

  p_forwardingDelegate = &self->_forwardingDelegate;
  v9 = a3;
  v5 = objc_storeWeak(p_forwardingDelegate, v9);
  v6 = objc_opt_respondsToSelector();

  *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFE | v6 & 1;
  WeakRetained = objc_loadWeakRetained(p_forwardingDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = 2;
  else
    v8 = 0;
  *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFD | v8;

}

- (BOOL)respondsToSelector:(SEL)a3
{
  id WeakRetained;
  char v5;

  if (sel_connection_canAuthenticateAgainstProtectionSpace_ == a3
    || sel_connection_didReceiveAuthenticationChallenge_ == a3)
  {
    v5 = 1;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(&self->_forwardingDelegate);
    v5 = objc_opt_respondsToSelector();

  }
  return v5 & 1;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return objc_loadWeakRetained(&self->_forwardingDelegate);
}

+ (id)defaultServiceForProtocol:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)defaultServiceForProtocol__sServiceDict;
    if (!defaultServiceForProtocol__sServiceDict)
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("CertUIServiceTypeHTTPS"), CFSTR("https"), CFSTR("kCertUIServiceTypeIMAP"), CFSTR("imap"), CFSTR("kCertUIServiceTypePOP3"), CFSTR("pop"), CFSTR("kCertUIServiceTypeSMTP"), CFSTR("smtp"), CFSTR("kCertUIServiceTypeSSH"), CFSTR("ssh"), CFSTR("kCertUIServiceTypeLDAP"), CFSTR("ldap"), CFSTR("kCertUIServiceTypeLDAPS"), CFSTR("ldaps"), 0);
      v6 = (void *)defaultServiceForProtocol__sServiceDict;
      defaultServiceForProtocol__sServiceDict = v5;

      v4 = (void *)defaultServiceForProtocol__sServiceDict;
    }
    objc_msgSend(v4, "objectForKey:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)connection:(id)a3 canAuthenticateAgainstProtectionSpace:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id WeakRetained;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void *)_CertUILogObjects;
  if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = v11;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_20AA96000, v10, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v17, 0x16u);

  }
  objc_msgSend(v8, "authenticationMethod");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)*MEMORY[0x24BDD12F8];

  if (v12 == v13)
  {
    v14 = 1;
  }
  else if ((*(_BYTE *)&self->_delegateRespondsTo & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained(&self->_forwardingDelegate);
    v14 = objc_msgSend(WeakRetained, "connection:canAuthenticateAgainstProtectionSpace:", v7, v8);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_continueConnectionWithResponse:(int)a3 challenge:(id)a4 service:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = (void *)_CertUILogObjects;
  if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412546;
    v24 = v12;
    v25 = 1024;
    v26 = a3;
    _os_log_impl(&dword_20AA96000, v11, OS_LOG_TYPE_INFO, "%@ %d", (uint8_t *)&v23, 0x12u);

  }
  if (a3 == 1)
  {
    v21 = objc_alloc(MEMORY[0x24BDD1818]);
    objc_msgSend(v8, "protectionSpace");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v21, "initWithTrust:", objc_msgSend(v22, "serverTrust"));

    objc_msgSend(v8, "sender");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "useCredential:forAuthenticationChallenge:", v13, v8);
  }
  else
  {
    if (a3 != 2)
    {
      objc_msgSend(v8, "sender");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "cancelAuthenticationChallenge:", v8);
      goto LABEL_9;
    }
    objc_msgSend(v8, "protectionSpace");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CertUITrustManager defaultTrustManager](CertUITrustManager, "defaultTrustManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "serverTrust");
    objc_msgSend(v13, "host");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allowTrust:forHost:service:", v15, v16, v9);

    v17 = objc_alloc(MEMORY[0x24BDD1818]);
    objc_msgSend(v8, "protectionSpace");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithTrust:", objc_msgSend(v18, "serverTrust"));

    objc_msgSend(v8, "sender");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "useCredential:forAuthenticationChallenge:", v19, v8);

  }
LABEL_9:

}

- (void)connection:(id)a3 didReceiveAuthenticationChallenge:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *WeakRetained;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  id v23;
  void *v24;
  CertUIPrompt *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void *)_CertUILogObjects;
  if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v34 = v11;
    v35 = 2112;
    v36 = v8;
    _os_log_impl(&dword_20AA96000, v10, OS_LOG_TYPE_INFO, "%@ %@", buf, 0x16u);

  }
  objc_msgSend(v8, "protectionSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "authenticationMethod");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)*MEMORY[0x24BDD12F8];

  if (v13 == v14)
  {
    objc_msgSend(v8, "protectionSpace");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_opt_class();
    objc_msgSend(WeakRetained, "protocol");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "defaultServiceForProtocol:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    +[CertUITrustManager defaultTrustManager](CertUITrustManager, "defaultTrustManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(WeakRetained, "serverTrust");
    objc_msgSend(WeakRetained, "host");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v19, "actionForTrust:forHost:andService:", v20, v21, v18);

    if (v22 == 2)
    {
      v25 = objc_alloc_init(CertUIPrompt);
      objc_msgSend(v8, "protectionSpace");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[CertUIPrompt setTrust:](v25, "setTrust:", objc_msgSend(v27, "serverTrust"));

      objc_msgSend(v8, "protectionSpace");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "host");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[CertUIPrompt setHost:](v25, "setHost:", v29);

      -[CertUIPrompt setService:](v25, "setService:", v18);
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __73__CertUIConnectionDelegate_connection_didReceiveAuthenticationChallenge___block_invoke;
      v30[3] = &unk_24C35DC38;
      v30[4] = self;
      v31 = v8;
      v32 = v18;
      -[CertUIPrompt showPromptWithResponseBlock:](v25, "showPromptWithResponseBlock:", v30);

    }
    else if (v22 == 1)
    {
      v23 = objc_alloc(MEMORY[0x24BDD1818]);
      objc_msgSend(v8, "protectionSpace");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (CertUIPrompt *)objc_msgSend(v23, "initWithTrust:", objc_msgSend(v24, "serverTrust"));

      objc_msgSend(v8, "sender");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "useCredential:forAuthenticationChallenge:", v25, v8);

    }
    else
    {
      objc_msgSend(v8, "sender");
      v25 = (CertUIPrompt *)objc_claimAutoreleasedReturnValue();
      -[CertUIPrompt cancelAuthenticationChallenge:](v25, "cancelAuthenticationChallenge:", v8);
    }

  }
  else if ((*(_BYTE *)&self->_delegateRespondsTo & 2) != 0)
  {
    WeakRetained = objc_loadWeakRetained(&self->_forwardingDelegate);
    objc_msgSend(WeakRetained, "connection:didReceiveAuthenticationChallenge:", v7, v8);
  }
  else
  {
    objc_msgSend(v8, "sender");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "continueWithoutCredentialForAuthenticationChallenge:", v8);
  }

}

uint64_t __73__CertUIConnectionDelegate_connection_didReceiveAuthenticationChallenge___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_continueConnectionWithResponse:challenge:service:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)forwardingDelegate
{
  return objc_loadWeakRetained(&self->_forwardingDelegate);
}

- (NSString)connectionDisplayName
{
  return self->_connectionDisplayName;
}

- (void)setConnectionDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionDisplayName, 0);
  objc_destroyWeak(&self->_forwardingDelegate);
  objc_storeStrong((id *)&self->_trustManager, 0);
}

@end
