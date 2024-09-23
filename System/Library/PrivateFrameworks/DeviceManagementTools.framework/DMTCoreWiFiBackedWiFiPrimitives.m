@implementation DMTCoreWiFiBackedWiFiPrimitives

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[DMTCoreWiFiBackedWiFiPrimitives wiFiInterface](self, "wiFiInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)DMTCoreWiFiBackedWiFiPrimitives;
  -[DMTCoreWiFiBackedWiFiPrimitives dealloc](&v4, sel_dealloc);
}

- (DMTCoreWiFiBackedWiFiPrimitives)init
{
  DMTCoreWiFiBackedWiFiPrimitives *v2;
  uint64_t v3;
  CWFInterface *wiFiInterface;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMTCoreWiFiBackedWiFiPrimitives;
  v2 = -[DMTCoreWiFiBackedWiFiPrimitives init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE29F18]), "initWithServiceType:", 2);
    wiFiInterface = v2->_wiFiInterface;
    v2->_wiFiInterface = (CWFInterface *)v3;

    -[CWFInterface activate](v2->_wiFiInterface, "activate");
    -[CWFInterface setInvalidationHandler:](v2->_wiFiInterface, "setInvalidationHandler:", &__block_literal_global_0);
  }
  return v2;
}

void __39__DMTCoreWiFiBackedWiFiPrimitives_init__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  _DMTLogGeneral();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __39__DMTCoreWiFiBackedWiFiPrimitives_init__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (BOOL)wifiInterfacesAvailable
{
  void *v2;
  BOOL v3;

  -[DMTCoreWiFiBackedWiFiPrimitives wiFiInterface](self, "wiFiInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSString)wifiNetworkName
{
  void *v2;
  void *v3;

  -[DMTCoreWiFiBackedWiFiPrimitives wiFiInterface](self, "wiFiInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "networkName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)joinWiFiNetworkWithCredential:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v8 = a3;
  v9 = (void (**)(id, _QWORD, void *))a5;
  if (!-[DMTCoreWiFiBackedWiFiPrimitives isCancelled](self, "isCancelled"))
  {
    -[DMTCoreWiFiBackedWiFiPrimitives joinNetworkTimeout](self, "joinNetworkTimeout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      if (-[DMTCoreWiFiBackedWiFiPrimitives wifiInterfacesAvailable](self, "wifiInterfacesAvailable"))
      {
        -[DMTCoreWiFiBackedWiFiPrimitives setJoinNetworkCompletion:](self, "setJoinNetworkCompletion:", v9);
        -[DMTCoreWiFiBackedWiFiPrimitives scanForNetworksWithCredentials:](self, "scanForNetworksWithCredentials:", v8);
        objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_networkJoinTimeOutDidFire_, 0, 0, a4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[DMTCoreWiFiBackedWiFiPrimitives setJoinNetworkTimeout:](self, "setJoinNetworkTimeout:", v11);

      }
      else
      {
        _DMTLogGeneral();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[DMTCoreWiFiBackedWiFiPrimitives joinWiFiNetworkWithCredential:timeout:completion:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

        DMTErrorWithCodeAndUserInfo(50, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, 0, v20);

      }
    }
  }

}

- (void)disassociateWiFiNetworkWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[DMTCoreWiFiBackedWiFiPrimitives wifiNetworkName](self, "wifiNetworkName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _DMTLogGeneral();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_21FD69000, v6, OS_LOG_TYPE_INFO, "Disassociating from network…", v9, 2u);
    }

    -[DMTCoreWiFiBackedWiFiPrimitives wiFiInterface](self, "wiFiInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "disassociateWithReason:", 0);

    v4[2](v4, 1, 0);
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FD69000, v6, OS_LOG_TYPE_INFO, "Network is not currently associated, disassociation not necessary", buf, 2u);
    }

  }
}

- (void)cancelJoiningWiFi
{
  _BOOL4 v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = -[DMTCoreWiFiBackedWiFiPrimitives isCancelled](self, "isCancelled");
  _DMTLogGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v7;
      _os_log_impl(&dword_21FD69000, v5, OS_LOG_TYPE_INFO, "%{public}@ called again while already cancelled", (uint8_t *)&v10, 0xCu);

    }
  }
  else
  {
    if (v6)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_21FD69000, v5, OS_LOG_TYPE_INFO, "Cancelling Wi-Fi join", (uint8_t *)&v10, 2u);
    }

    -[DMTCoreWiFiBackedWiFiPrimitives setCancelled:](self, "setCancelled:", 1);
    -[DMTCoreWiFiBackedWiFiPrimitives joinNetworkTimeout](self, "joinNetworkTimeout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[DMTCoreWiFiBackedWiFiPrimitives joinNetworkTimeout](self, "joinNetworkTimeout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "invalidate");

      -[DMTCoreWiFiBackedWiFiPrimitives setJoinNetworkTimeout:](self, "setJoinNetworkTimeout:", 0);
    }
  }
}

- (void)networkJoinTimeOutDidFire:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  uint8_t v9[16];

  _DMTLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21FD69000, v4, OS_LOG_TYPE_INFO, "Network join timeout has fired.", v9, 2u);
  }

  -[DMTCoreWiFiBackedWiFiPrimitives joinNetworkTimeout](self, "joinNetworkTimeout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[DMTCoreWiFiBackedWiFiPrimitives setJoinNetworkTimeout:](self, "setJoinNetworkTimeout:", 0);
  -[DMTCoreWiFiBackedWiFiPrimitives joinNetworkCompletion](self, "joinNetworkCompletion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DMTCoreWiFiBackedWiFiPrimitives joinNetworkCompletion](self, "joinNetworkCompletion");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    DMTErrorWithCodeAndUserInfo(54, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v8);

    -[DMTCoreWiFiBackedWiFiPrimitives setJoinNetworkCompletion:](self, "setJoinNetworkCompletion:", 0);
  }
}

- (void)scanForNetworksWithCredentials:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "networkName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSSID:", v6);

  objc_msgSend(v5, "setNumberOfScans:", 2);
  objc_msgSend(v5, "setMergeScanResults:", 1);
  objc_initWeak(&location, self);
  -[DMTCoreWiFiBackedWiFiPrimitives wiFiInterface](self, "wiFiInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66__DMTCoreWiFiBackedWiFiPrimitives_scanForNetworksWithCredentials___block_invoke;
  v9[3] = &unk_24E5A0180;
  objc_copyWeak(&v11, &location);
  v8 = v4;
  v10 = v8;
  objc_msgSend(v7, "performScanWithParameters:reply:", v5, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __66__DMTCoreWiFiBackedWiFiPrimitives_scanForNetworksWithCredentials___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66__DMTCoreWiFiBackedWiFiPrimitives_scanForNetworksWithCredentials___block_invoke_2;
  v9[3] = &unk_24E5A0158;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v10 = v6;
  v11 = *(id *)(a1 + 32);
  v12 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

  objc_destroyWeak(&v13);
}

void __66__DMTCoreWiFiBackedWiFiPrimitives_scanForNetworksWithCredentials___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "foundNetworks:forCredential:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)foundNetworks:(id)a3 forCredential:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  int v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[DMTCoreWiFiBackedWiFiPrimitives isCancelled](self, "isCancelled"))
  {
    _DMTLogGeneral();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      v12 = "Found networks after being cancelled, bailing out.";
LABEL_11:
      _os_log_impl(&dword_21FD69000, v11, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v24, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  -[DMTCoreWiFiBackedWiFiPrimitives joinNetworkTimeout](self, "joinNetworkTimeout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    _DMTLogGeneral();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      v12 = "Found networks after timeout has occurred, bailing out.";
      goto LABEL_11;
    }
LABEL_12:

    goto LABEL_13;
  }
  if (v10)
  {
    _DMTLogGeneral();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[DMTCoreWiFiBackedWiFiPrimitives foundNetworks:forCredential:error:].cold.2((uint64_t)v10, v14);

    -[DMTCoreWiFiBackedWiFiPrimitives joinNetworkCompletion](self, "joinNetworkCompletion");
    v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v26 = *MEMORY[0x24BDD1398];
    v27[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    DMTErrorWithCodeAndUserInfo(55, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v15)[2](v15, 0, v17);

    -[DMTCoreWiFiBackedWiFiPrimitives setJoinNetworkCompletion:](self, "setJoinNetworkCompletion:", 0);
  }
  else
  {
    v18 = objc_msgSend(v8, "count");
    _DMTLogGeneral();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[DMTCoreWiFiBackedWiFiPrimitives foundNetworks:forCredential:error:].cold.1((uint64_t)v8, v20);

      objc_msgSend(v8, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMTCoreWiFiBackedWiFiPrimitives joinNetworkWithCredential:scanRecord:](self, "joinNetworkWithCredential:scanRecord:", v9, v21);
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v9, "networkName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138477827;
        v25 = v22;
        _os_log_impl(&dword_21FD69000, v20, OS_LOG_TYPE_INFO, "No network matching %{private}@ were found", (uint8_t *)&v24, 0xCu);

      }
      DMTErrorWithCodeAndUserInfo(53, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMTCoreWiFiBackedWiFiPrimitives joinNetworkCompletion](self, "joinNetworkCompletion");
      v23 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v23)[2](v23, 0, v21);

      -[DMTCoreWiFiBackedWiFiPrimitives setJoinNetworkCompletion:](self, "setJoinNetworkCompletion:", 0);
    }

  }
LABEL_13:

}

- (void)joinNetworkWithCredential:(id)a3 scanRecord:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setScanResult:", v7);
  objc_msgSend(v6, "credential");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPassword:", v9);

  objc_msgSend(v8, "setRememberUponSuccessfulAssociation:", 0);
  objc_initWeak(&location, self);
  -[DMTCoreWiFiBackedWiFiPrimitives wiFiInterface](self, "wiFiInterface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__DMTCoreWiFiBackedWiFiPrimitives_joinNetworkWithCredential_scanRecord___block_invoke;
  v11[3] = &unk_24E5A01D0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v10, "associateWithParameters:reply:", v8, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __72__DMTCoreWiFiBackedWiFiPrimitives_joinNetworkWithCredential_scanRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __72__DMTCoreWiFiBackedWiFiPrimitives_joinNetworkWithCredential_scanRecord___block_invoke_2;
  v5[3] = &unk_24E5A01A8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v7);
}

void __72__DMTCoreWiFiBackedWiFiPrimitives_joinNetworkWithCredential_scanRecord___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didJoinNetworkWithError:", *(_QWORD *)(a1 + 32));

}

- (void)didJoinNetworkWithError:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[DMTCoreWiFiBackedWiFiPrimitives isCancelled](self, "isCancelled"))
  {
    _DMTLogGeneral();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v4;
      v6 = "Associate network returned after being cancelled with error: %{public}@";
LABEL_9:
      _os_log_impl(&dword_21FD69000, v5, OS_LOG_TYPE_INFO, v6, buf, 0xCu);
    }
  }
  else
  {
    -[DMTCoreWiFiBackedWiFiPrimitives joinNetworkTimeout](self, "joinNetworkTimeout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (v4)
      {
        v11 = *MEMORY[0x24BDD1398];
        v12 = v4;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        DMTErrorWithCodeAndUserInfo(55, v8);
        v5 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v5 = 0;
      }
      -[DMTCoreWiFiBackedWiFiPrimitives joinNetworkTimeout](self, "joinNetworkTimeout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "invalidate");

      -[DMTCoreWiFiBackedWiFiPrimitives joinNetworkCompletion](self, "joinNetworkCompletion");
      v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, BOOL, NSObject *))v10)[2](v10, v5 == 0, v5);

      -[DMTCoreWiFiBackedWiFiPrimitives setJoinNetworkCompletion:](self, "setJoinNetworkCompletion:", 0);
      -[DMTCoreWiFiBackedWiFiPrimitives setJoinNetworkTimeout:](self, "setJoinNetworkTimeout:", 0);
    }
    else
    {
      _DMTLogGeneral();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v14 = v4;
        v6 = "Associate network returned after the timeout occurred with error: %{public}@";
        goto LABEL_9;
      }
    }
  }

}

- (CWFInterface)wiFiInterface
{
  return self->_wiFiInterface;
}

- (id)joinNetworkCompletion
{
  return self->_joinNetworkCompletion;
}

- (void)setJoinNetworkCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSTimer)joinNetworkTimeout
{
  return self->_joinNetworkTimeout;
}

- (void)setJoinNetworkTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_joinNetworkTimeout, a3);
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joinNetworkTimeout, 0);
  objc_storeStrong(&self->_joinNetworkCompletion, 0);
  objc_storeStrong((id *)&self->_wiFiInterface, 0);
}

void __39__DMTCoreWiFiBackedWiFiPrimitives_init__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21FD69000, a1, a3, "CWFInterface invalidated!", a5, a6, a7, a8, 0);
}

- (void)joinWiFiNetworkWithCredential:(uint64_t)a3 timeout:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21FD69000, a1, a3, "This device has no WiFi interface, cannot continue.", a5, a6, a7, a8, 0);
}

- (void)foundNetworks:(uint64_t)a1 forCredential:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_21FD69000, a2, OS_LOG_TYPE_DEBUG, "Network(s) found: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)foundNetworks:(uint64_t)a1 forCredential:(NSObject *)a2 error:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21FD69000, a2, OS_LOG_TYPE_ERROR, "Error scanning for networks: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
