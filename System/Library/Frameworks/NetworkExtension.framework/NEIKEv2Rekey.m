@implementation NEIKEv2Rekey

- (void)dealloc
{
  objc_super v3;

  -[NEIKEv2Rekey invalidateTimers](self, a2);
  v3.receiver = self;
  v3.super_class = (Class)NEIKEv2Rekey;
  -[NEIKEv2Rekey dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_childRekeyHandler, 0);
  objc_storeStrong(&self->_ikeRekeyHandler, 0);
  objc_storeStrong((id *)&self->_childLifetimeDispatchTimer, 0);
  objc_storeStrong((id *)&self->_ikeLifetimeDispatchTimer, 0);
  objc_storeStrong((id *)&self->_sessionDescription, 0);
  objc_storeStrong((id *)&self->_childLifetime, 0);
  objc_storeStrong((id *)&self->_ikeLifetime, 0);
}

- (void)invalidateTimers
{
  const char *v3;
  SEL v4;
  const char *v5;
  SEL v6;
  const char *v7;
  NSObject *Property;
  SEL v9;
  const char *v10;
  NSObject *v11;
  SEL v12;

  if (a1)
  {
    if (objc_getProperty(a1, a2, 16, 1))
    {
      objc_msgSend(objc_getProperty(a1, v3, 16, 1), "invalidate");
      objc_setProperty_atomic(a1, v4, 0, 16);
    }
    if (objc_getProperty(a1, v3, 24, 1))
    {
      objc_msgSend(objc_getProperty(a1, v5, 24, 1), "invalidate");
      objc_setProperty_atomic(a1, v6, 0, 24);
    }
    if (objc_getProperty(a1, v5, 40, 1))
    {
      Property = objc_getProperty(a1, v7, 40, 1);
      dispatch_source_cancel(Property);
      objc_setProperty_atomic(a1, v9, 0, 40);
    }
    if (objc_getProperty(a1, v7, 48, 1))
    {
      v11 = objc_getProperty(a1, v10, 48, 1);
      dispatch_source_cancel(v11);
      objc_setProperty_atomic(a1, v12, 0, 48);
    }
  }
}

- (void)startIKETimer:(void *)a3 timeoutHandler:
{
  id v5;
  const char *v6;
  void *v7;
  int v8;
  uint64_t v9;
  double v10;
  const char *v11;
  const char *v12;
  id v13;
  SEL v14;
  __CFString *v15;
  void *v16;
  SEL v17;
  NSObject *v18;
  void *v19;
  SEL v20;
  id v21;
  id v22;
  const char *v23;
  NSObject *Property;
  SEL v25;
  NSObject *v26;
  dispatch_source_t v27;
  SEL v28;
  SEL v29;
  const char *v30;
  NSObject *v31;
  dispatch_time_t v32;
  SEL v33;
  id v34;
  NSObject *v35;
  SEL v36;
  NSObject *v37;
  NSObject *v38;
  _QWORD handler[4];
  id v40;
  _QWORD v41[4];
  id v42;
  uint8_t buf[4];
  _DWORD *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  double v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v7 = v5;
  if (a1)
  {
    if (a2)
      a1[2] = a2;
    if (v5)
      objc_setProperty_atomic_copy(a1, v6, v5, 56);
    v8 = a1[2];
    v9 = 45 * v8;
    if (v8 <= 2)
      v10 = (double)v8 * 5.0;
    else
      v10 = 15.0;
    if (objc_opt_class())
    {
      if (objc_getProperty(a1, v11, 16, 1))
      {
        objc_msgSend(objc_getProperty(a1, v12, 16, 1), "cancel");
      }
      else
      {
        if (objc_getProperty(a1, v12, 32, 1))
        {
          v13 = objc_alloc(MEMORY[0x1E0CB3940]);
          v15 = (__CFString *)objc_msgSend(v13, "initWithFormat:", CFSTR("com.apple.networkextension[%@ IKE Lifetime]"), objc_getProperty(a1, v14, 32, 1));
        }
        else
        {
          v15 = CFSTR("com.apple.networkextension[NEIKEv2PacketTunnelProvider IKE Lifetime]");
        }
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0F80]), "initWithIdentifier:", v15);
        objc_setProperty_atomic(a1, v17, v16, 16);

      }
      ne_log_obj();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = (void *)NEGetSystemWakeTime();
        *(_DWORD *)buf = 138413058;
        v44 = a1;
        v45 = 2048;
        v46 = v9;
        v47 = 2048;
        v48 = v10;
        v49 = 2112;
        v50 = v19;
        _os_log_impl(&dword_19BD16000, v18, OS_LOG_TYPE_INFO, "%@: Setting Rekey IKE timer for %llu seconds, leeway %f seconds, last wake date %@", buf, 0x2Au);

      }
      objc_initWeak((id *)buf, a1);
      v21 = objc_getProperty(a1, v20, 16, 1);
      v22 = MEMORY[0x1E0C80D38];
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __45__NEIKEv2Rekey_startIKETimer_timeoutHandler___block_invoke;
      v41[3] = &unk_1E3CC1798;
      objc_copyWeak(&v42, (id *)buf);
      objc_msgSend(v21, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], v41, (double)(unint64_t)v9, v10);

      objc_destroyWeak(&v42);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (objc_getProperty(a1, v11, 40, 1))
      {
        Property = objc_getProperty(a1, v23, 40, 1);
        dispatch_source_cancel(Property);
        objc_setProperty_atomic(a1, v25, 0, 40);
      }
      ne_log_obj();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v44 = a1;
        v45 = 2048;
        v46 = v9;
        v47 = 2048;
        v48 = v10;
        _os_log_impl(&dword_19BD16000, v26, OS_LOG_TYPE_INFO, "%@: Setting Rekey IKE timer for %llu seconds, leeway %f seconds", buf, 0x20u);
      }

      v27 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
      objc_setProperty_atomic(a1, v28, v27, 40);

      if (objc_getProperty(a1, v29, 40, 1))
      {
        v31 = objc_getProperty(a1, v30, 40, 1);
        v32 = dispatch_time(0x8000000000000000, 1000000000 * v9);
        dispatch_source_set_timer(v31, v32, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v10 * 1000000000.0));

        objc_initWeak((id *)buf, a1);
        v34 = objc_getProperty(a1, v33, 40, 1);
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __45__NEIKEv2Rekey_startIKETimer_timeoutHandler___block_invoke_5;
        handler[3] = &unk_1E3CC39A8;
        v35 = v34;
        objc_copyWeak(&v40, (id *)buf);
        dispatch_source_set_event_handler(v35, handler);

        v37 = objc_getProperty(a1, v36, 40, 1);
        dispatch_activate(v37);
        objc_destroyWeak(&v40);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        ne_log_obj();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_19BD16000, v38, OS_LOG_TYPE_FAULT, "dispatch_source_create failed", buf, 2u);
        }

      }
    }
  }

}

- (id)invokeIKERekeyHandler
{
  id result;
  const char *v4;
  uint64_t (**Property)(void);

  result = objc_getProperty(a1, a2, 56, 1);
  if (result)
  {
    Property = (uint64_t (**)(void))objc_getProperty(a1, v4, 56, 1);
    return (id)Property[2]();
  }
  return result;
}

void __45__NEIKEv2Rekey_startIKETimer_timeoutHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  const char *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    -[NEIKEv2Rekey startIKETimer:timeoutHandler:](WeakRetained, 0, 0);
    -[NEIKEv2Rekey invokeIKERekeyHandler](v3, v2);
    WeakRetained = v3;
  }

}

void __45__NEIKEv2Rekey_startIKETimer_timeoutHandler___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  const char *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    -[NEIKEv2Rekey startIKETimer:timeoutHandler:](WeakRetained, 0, 0);
    -[NEIKEv2Rekey invokeIKERekeyHandler](v3, v2);
    WeakRetained = v3;
  }

}

- (void)startChildTimer:(void *)a3 timeoutHandler:
{
  id v5;
  const char *v6;
  void *v7;
  int v8;
  uint64_t v9;
  double v10;
  const char *v11;
  const char *v12;
  id v13;
  SEL v14;
  __CFString *v15;
  void *v16;
  SEL v17;
  NSObject *v18;
  void *v19;
  SEL v20;
  id v21;
  id v22;
  const char *v23;
  NSObject *Property;
  SEL v25;
  NSObject *v26;
  dispatch_source_t v27;
  SEL v28;
  SEL v29;
  const char *v30;
  NSObject *v31;
  dispatch_time_t v32;
  SEL v33;
  id v34;
  NSObject *v35;
  SEL v36;
  NSObject *v37;
  NSObject *v38;
  _QWORD handler[4];
  id v40;
  _QWORD v41[4];
  id v42;
  uint8_t buf[4];
  _DWORD *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  double v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v7 = v5;
  if (a1)
  {
    if (a2)
      a1[3] = a2;
    if (v5)
      objc_setProperty_atomic_copy(a1, v6, v5, 64);
    v8 = a1[3];
    v9 = 45 * v8;
    if (v8 <= 2)
      v10 = (double)v8 * 5.0;
    else
      v10 = 15.0;
    if (objc_opt_class())
    {
      if (objc_getProperty(a1, v11, 24, 1))
      {
        objc_msgSend(objc_getProperty(a1, v12, 24, 1), "cancel");
      }
      else
      {
        if (objc_getProperty(a1, v12, 32, 1))
        {
          v13 = objc_alloc(MEMORY[0x1E0CB3940]);
          v15 = (__CFString *)objc_msgSend(v13, "initWithFormat:", CFSTR("com.apple.networkextension[%@ Child Lifetime]"), objc_getProperty(a1, v14, 32, 1));
        }
        else
        {
          v15 = CFSTR("com.apple.networkextension[NEIKEv2PacketTunnelProvider Child Lifetime]");
        }
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0F80]), "initWithIdentifier:", v15);
        objc_setProperty_atomic(a1, v17, v16, 24);

      }
      ne_log_obj();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = (void *)NEGetSystemWakeTime();
        *(_DWORD *)buf = 138413058;
        v44 = a1;
        v45 = 2048;
        v46 = v9;
        v47 = 2048;
        v48 = v10;
        v49 = 2112;
        v50 = v19;
        _os_log_impl(&dword_19BD16000, v18, OS_LOG_TYPE_INFO, "%@: Setting Rekey Child timer for %llu seconds, leeway %f seconds, last wake date %@", buf, 0x2Au);

      }
      objc_initWeak((id *)buf, a1);
      v21 = objc_getProperty(a1, v20, 24, 1);
      v22 = MEMORY[0x1E0C80D38];
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __47__NEIKEv2Rekey_startChildTimer_timeoutHandler___block_invoke;
      v41[3] = &unk_1E3CC1798;
      objc_copyWeak(&v42, (id *)buf);
      objc_msgSend(v21, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], v41, (double)(unint64_t)v9, v10);

      objc_destroyWeak(&v42);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (objc_getProperty(a1, v11, 48, 1))
      {
        Property = objc_getProperty(a1, v23, 48, 1);
        dispatch_source_cancel(Property);
        objc_setProperty_atomic(a1, v25, 0, 48);
      }
      ne_log_obj();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v44 = a1;
        v45 = 2048;
        v46 = v9;
        v47 = 2048;
        v48 = v10;
        _os_log_impl(&dword_19BD16000, v26, OS_LOG_TYPE_INFO, "%@: Setting Rekey Child timer for %llu seconds, leeway %f seconds", buf, 0x20u);
      }

      v27 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
      objc_setProperty_atomic(a1, v28, v27, 48);

      if (objc_getProperty(a1, v29, 48, 1))
      {
        v31 = objc_getProperty(a1, v30, 48, 1);
        v32 = dispatch_time(0x8000000000000000, 1000000000 * v9);
        dispatch_source_set_timer(v31, v32, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v10 * 1000000000.0));

        objc_initWeak((id *)buf, a1);
        v34 = objc_getProperty(a1, v33, 48, 1);
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __47__NEIKEv2Rekey_startChildTimer_timeoutHandler___block_invoke_11;
        handler[3] = &unk_1E3CC39A8;
        v35 = v34;
        objc_copyWeak(&v40, (id *)buf);
        dispatch_source_set_event_handler(v35, handler);

        v37 = objc_getProperty(a1, v36, 48, 1);
        dispatch_activate(v37);
        objc_destroyWeak(&v40);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        ne_log_obj();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_19BD16000, v38, OS_LOG_TYPE_FAULT, "dispatch_source_create failed", buf, 2u);
        }

      }
    }
  }

}

- (id)invokeChildRekeyHandler
{
  id result;
  const char *v4;
  uint64_t (**Property)(void);

  result = objc_getProperty(a1, a2, 64, 1);
  if (result)
  {
    Property = (uint64_t (**)(void))objc_getProperty(a1, v4, 64, 1);
    return (id)Property[2]();
  }
  return result;
}

void __47__NEIKEv2Rekey_startChildTimer_timeoutHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  const char *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    -[NEIKEv2Rekey startChildTimer:timeoutHandler:](WeakRetained, 0, 0);
    -[NEIKEv2Rekey invokeChildRekeyHandler](v3, v2);
    WeakRetained = v3;
  }

}

void __47__NEIKEv2Rekey_startChildTimer_timeoutHandler___block_invoke_11(uint64_t a1)
{
  id WeakRetained;
  const char *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    -[NEIKEv2Rekey startChildTimer:timeoutHandler:](WeakRetained, 0, 0);
    -[NEIKEv2Rekey invokeChildRekeyHandler](v3, v2);
    WeakRetained = v3;
  }

}

@end
