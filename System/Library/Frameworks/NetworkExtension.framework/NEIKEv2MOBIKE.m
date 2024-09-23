@implementation NEIKEv2MOBIKE

- (void)dealloc
{
  const char *v3;
  objc_super v4;

  if (self && objc_getProperty(self, a2, 32, 1))
    -[NEIKEv2MOBIKE mobikeStopWaitTimer](self, v3);
  v4.receiver = self;
  v4.super_class = (Class)NEIKEv2MOBIKE;
  -[NEIKEv2MOBIKE dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobikeServer, 0);
  objc_storeStrong((id *)&self->_mobikeTransportInterface, 0);
  objc_storeStrong((id *)&self->_mobikeInterface, 0);
  objc_storeStrong((id *)&self->_mobikeQueue, 0);
  objc_storeStrong((id *)&self->_mobikeWaitTimer, 0);
  objc_destroyWeak((id *)&self->_tunnelProvider);
  objc_storeStrong((id *)&self->_overrideServerPortString, 0);
}

- (void)mobikeStopWaitTimer
{
  const char *v3;
  NSObject *Property;
  SEL v5;

  if (a1)
  {
    if (objc_getProperty(a1, a2, 32, 1))
    {
      Property = objc_getProperty(a1, v3, 32, 1);
      dispatch_source_cancel(Property);
      objc_setProperty_atomic(a1, v5, 0, 32);
    }
  }
}

- (id)initWithQueue:(void *)a3 tunnelProvider:
{
  id v6;
  id v7;
  void *v8;
  id *v9;
  NSObject *v11;
  const char *v12;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (!a1)
    goto LABEL_6;
  if (!v6)
  {
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      a1 = 0;
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136315138;
    v15 = "-[NEIKEv2MOBIKE initWithQueue:tunnelProvider:]";
    v12 = "%s called with null queue";
LABEL_12:
    _os_log_fault_impl(&dword_19BD16000, v11, OS_LOG_TYPE_FAULT, v12, buf, 0xCu);
    goto LABEL_10;
  }
  if (!v7)
  {
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      goto LABEL_10;
    *(_DWORD *)buf = 136315138;
    v15 = "-[NEIKEv2MOBIKE initWithQueue:tunnelProvider:]";
    v12 = "%s called with null tunnelProvider";
    goto LABEL_12;
  }
  v13.receiver = a1;
  v13.super_class = (Class)NEIKEv2MOBIKE;
  v9 = (id *)objc_msgSendSuper2(&v13, sel_init);
  a1 = v9;
  if (v9)
  {
    objc_storeStrong(v9 + 5, a2);
    objc_storeWeak(a1 + 3, v8);
  }
LABEL_6:

  return a1;
}

- (void)mobikeStartWaitTimer
{
  const char *v3;
  char v4;
  NSObject *Property;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  SEL v9;
  _QWORD v10[5];
  _QWORD v11[5];

  if (a1 && !objc_getProperty(a1, a2, 32, 1))
  {
    v4 = a1[10];
    Property = objc_getProperty(a1, v3, 40, 1);
    if ((v4 & 1) != 0)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __37__NEIKEv2MOBIKE_mobikeStartWaitTimer__block_invoke_2;
      v10[3] = &unk_1E3CC41F0;
      v10[4] = a1;
      v6 = v10;
      v7 = 10;
    }
    else
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __37__NEIKEv2MOBIKE_mobikeStartWaitTimer__block_invoke;
      v11[3] = &unk_1E3CC41F0;
      v11[4] = a1;
      v6 = v11;
      v7 = 2;
    }
    NECreateTimerSource(Property, v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(a1, v9, v8, 32);

  }
}

uint64_t __37__NEIKEv2MOBIKE_mobikeStartWaitTimer__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3;
  _DWORD *WeakRetained;
  void *v5;
  _QWORD v7[5];

  v3 = *(_QWORD *)(a1 + 32);
  if (v3 && (*(_BYTE *)(v3 + 10) & 1) == 0)
  {
    *(_BYTE *)(v3 + 10) = 1;
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 24));
    v5 = WeakRetained;
    if (WeakRetained)
    {
      WeakRetained[21] &= ~1u;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __31__NEIKEv2MOBIKE_mobikeReassert__block_invoke;
      v7[3] = &unk_1E3CC45C8;
      v7[4] = v3;
      objc_msgSend(WeakRetained, "setTunnelNetworkSettings:completionHandler:", 0, v7);
    }

    v3 = *(_QWORD *)(a1 + 32);
  }
  -[NEIKEv2MOBIKE mobikeStopWaitTimer]((void *)v3, a2);
  return -[NEIKEv2MOBIKE mobikeStartWaitTimer](*(_QWORD *)(a1 + 32));
}

void __37__NEIKEv2MOBIKE_mobikeStartWaitTimer__block_invoke_2(uint64_t a1, const char *a2)
{
  -[NEIKEv2MOBIKE mobikeStopWaitTimer](*(void **)(a1 + 32), a2);
  -[NEIKEv2MOBIKE mobikeDisconnect](*(_QWORD *)(a1 + 32));
}

- (void)mobikeDisconnect
{
  id WeakRetained;
  id v2;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    if (WeakRetained)
    {
      v2 = WeakRetained;
      -[NEIKEv2PacketTunnelProvider handleInterfaceDown](WeakRetained);
      WeakRetained = v2;
    }

  }
}

void __31__NEIKEv2MOBIKE_mobikeReassert__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 24));
    if (WeakRetained)
    {
      v5 = WeakRetained;
      objc_msgSend(WeakRetained, "setReasserting:", 1);

    }
  }

}

- (void)startMOBIKE:(uint64_t)a1
{
  id v3;
  const char *v4;
  void *v5;
  uint64_t v6;
  SEL v7;
  uint64_t v8;
  __CFString *Property;
  __CFString *v10;
  __CFString *v11;
  NSObject *v12;
  const char *v13;
  id WeakRetained;
  id v15;
  SEL v16;
  SEL v17;
  void *v18;
  SEL v19;
  void *v20;
  SEL v21;
  id v22;
  _QWORD v23[5];
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v5 = v3;
  if (a1)
  {
    if (v3)
    {
      *(_BYTE *)(a1 + 8) = 1;
      *(_BYTE *)(a1 + 9) = 0;
      if (*(_QWORD *)(a1 + 72)
        || (v6 = objc_msgSend(objc_getProperty((id)a1, v4, 48, 1), "interfaceIndex"),
            v6 != objc_msgSend(objc_getProperty((id)a1, v7, 56, 1), "interfaceIndex"))
        || objc_getProperty((id)a1, v4, 16, 1))
      {
        v8 = 1;
        Property = (__CFString *)objc_getProperty((id)a1, v4, 16, 1);
        v10 = CFSTR("0");
        if (Property)
          v10 = Property;
        v11 = v10;
        objc_msgSend(MEMORY[0x1E0CCEC80], "endpointWithHostname:port:", v5, v11);
        v12 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = 0;
        v12 = 0;
      }
      ++*(_QWORD *)(a1 + 72);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      if (WeakRetained)
      {
        v15 = objc_getProperty((id)a1, v13, 48, 1);
        objc_setProperty_atomic((id)a1, v16, v15, 56);
        objc_getProperty(WeakRetained, v17, 240, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(objc_getProperty((id)a1, v19, 48, 1), "interfaceName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_getProperty((id)a1, v21, 40, 1);
        v23[1] = 3221225472;
        v23[2] = __29__NEIKEv2MOBIKE_startMOBIKE___block_invoke;
        v23[3] = &unk_1E3CC16B8;
        v23[4] = a1;
        v23[0] = MEMORY[0x1E0C809B0];
        objc_msgSend(v18, "sendMOBIKEWithRetries:retryInterval:interfaceName:invalidateTransport:resetEndpoint:callbackQueue:callback:", 1, 0, v20, v8, v12, v22, v23);

      }
    }
    else
    {
      ne_log_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "-[NEIKEv2MOBIKE startMOBIKE:]";
        _os_log_fault_impl(&dword_19BD16000, v12, OS_LOG_TYPE_FAULT, "%s called with null serverAddress", buf, 0xCu);
      }
    }

  }
}

void __29__NEIKEv2MOBIKE_startMOBIKE___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  const char *v8;
  id v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id Property;
  NSObject *v17;
  NSObject *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v9 = a4;
  v10 = *(_QWORD *)(a1 + 32);
  if (!v10)
    goto LABEL_18;
  v11 = *(_BYTE *)(v10 + 11);
  *(_BYTE *)(v10 + 8) = 0;
  v12 = *(_QWORD *)(a1 + 32);
  if (!v12)
    goto LABEL_18;
  *(_BYTE *)(v12 + 11) = 0;
  v13 = *(_QWORD *)(a1 + 32);
  if (!v13)
    goto LABEL_18;
  if ((*(_BYTE *)(v13 + 9) & 1) != 0)
  {
    *(_QWORD *)(v13 + 72) = 0;
  }
  else
  {
    if (*(_QWORD *)(v13 + 64) != 1)
    {
      *(_QWORD *)(v13 + 72) = 0;
      goto LABEL_18;
    }
    if (a3)
    {
      *(_QWORD *)(v13 + 72) = 0;
      v14 = *(_QWORD *)(a1 + 32);
      if (v14)
        *(_BYTE *)(v14 + 10) = 0;
      goto LABEL_18;
    }
    if ((v11 & 1) != 0 || *(_QWORD *)(v13 + 72) >= 4uLL)
    {
      ne_log_obj();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v19) = 0;
        _os_log_error_impl(&dword_19BD16000, v17, OS_LOG_TYPE_ERROR, "mobike failed after max retries", (uint8_t *)&v19, 2u);
      }

      -[NEIKEv2MOBIKE mobikeDisconnect](*(_QWORD *)(a1 + 32));
      goto LABEL_18;
    }
    ne_log_obj();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = 138412290;
      v20 = v9;
      _os_log_impl(&dword_19BD16000, v18, OS_LOG_TYPE_INFO, "mobike failed with error %@", (uint8_t *)&v19, 0xCu);
    }

  }
  v15 = *(void **)(a1 + 32);
  if (v15)
  {
    Property = objc_getProperty(v15, v8, 80, 1);
    -[NEIKEv2MOBIKE startMOBIKE:](v15, Property);
  }
LABEL_18:

}

- (void)initiateMOBIKE:(uint64_t)a3 pathStatus:(void *)a4 serverAddress:(char)a5 earlyDisconnect:
{
  id v9;
  NSObject *v10;
  const char *v11;
  id v12;
  void *v13;
  SEL v14;
  const char *v15;
  SEL v16;
  const char *v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  if (a1)
  {
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 134218498;
      v20 = a3;
      v21 = 2048;
      v22 = a2;
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_19BD16000, v10, OS_LOG_TYPE_DEFAULT, "initiate mobike - path status %ld ifIndex %lu server address %@", (uint8_t *)&v19, 0x20u);
    }

    v12 = v9;
    if (a2
      && (v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCEC88]), "initWithInterfaceIndex:", a2), a2 = v13, v12)
      && a3 == 1
      && v13)
    {
      objc_setProperty_atomic((id)a1, v11, v13, 48);
      objc_setProperty_atomic((id)a1, v14, v12, 80);
      *(_BYTE *)(a1 + 9) = 1;
      *(_QWORD *)(a1 + 64) = 1;
      -[NEIKEv2MOBIKE mobikeStopWaitTimer]((void *)a1, v15);

      if ((*(_BYTE *)(a1 + 11) & 1) == 0)
        *(_BYTE *)(a1 + 11) = a5;
      if ((*(_BYTE *)(a1 + 8) & 1) != 0)
      {
        ne_log_obj();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_19BD16000, v18, OS_LOG_TYPE_INFO, "mobike in progress", (uint8_t *)&v19, 2u);
        }

      }
      else
      {
        -[NEIKEv2MOBIKE startMOBIKE:](a1, v12);
      }
    }
    else
    {
      objc_setProperty_atomic((id)a1, v11, 0, 48);
      objc_setProperty_atomic((id)a1, v16, 0, 80);
      *(_BYTE *)(a1 + 9) = 0;
      *(_QWORD *)(a1 + 64) = 2;
      -[NEIKEv2MOBIKE mobikeStartWaitTimer]((_BYTE *)a1, v17);

    }
  }

}

@end
