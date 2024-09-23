@implementation EAPBoringSSLSession

- (EAPBoringSSLSession)init
{
  EAPBoringSSLSession *v2;
  uint64_t v3;
  NSConditionLock *statusUpdateLock;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EAPBoringSSLSession;
  v2 = -[EAPBoringSSLSession init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD14D0]), "initWithCondition:", 1);
    statusUpdateLock = v2->_statusUpdateLock;
    v2->_statusUpdateLock = (NSConditionLock *)v3;

    EAPLogGetLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_206440000, v5, v6, "EAPBoringSSLSession initialized", v8, 2u);
    }

  }
  return v2;
}

- (void)dealloc
{
  __SecTrust *serverSecTrust;
  NSObject *v4;
  os_log_type_t v5;
  objc_super v6;
  uint8_t buf[16];

  serverSecTrust = self->_serverSecTrust;
  if (serverSecTrust)
    CFRelease(serverSecTrust);
  EAPLogGetLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v4, v5))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_206440000, v4, v5, "EAPBoringSSLSession deallocated", buf, 2u);
  }

  v6.receiver = self;
  v6.super_class = (Class)EAPBoringSSLSession;
  -[EAPBoringSSLSession dealloc](&v6, sel_dealloc);
}

- (id)customProtocolDefinition
{
  nw_protocol_definition_t definition;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__EAPBoringSSLSession_customProtocolDefinition__block_invoke;
  v4[3] = &unk_24BF0CBA8;
  objc_copyWeak(&v5, &location);
  definition = nw_framer_create_definition("EAPBoringSSLSessionInterceptor", 0, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return definition;
}

uint64_t __47__EAPBoringSSLSession_customProtocolDefinition__block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  NSObject *v4;
  os_log_type_t v5;
  id WeakRetained;
  void *v7;
  nw_protocol_options_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *, size_t, int);
  void *v16;
  NSObject *v17;
  void *v18;
  uint8_t buf[16];

  v3 = a2;
  EAPLogGetLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v4, v5))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_206440000, v4, v5, "start handler for custom protocol called", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setCustomFramer:", v3);
    v8 = nw_framer_copy_options(v3);
    objc_msgSend(v7, "setCustomProtocol:", v8);

    nw_framer_set_input_handler(v3, &__block_literal_global);
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __47__EAPBoringSSLSession_customProtocolDefinition__block_invoke_2;
    v16 = &unk_24BF0CB80;
    v17 = v3;
    v18 = v7;
    nw_framer_set_output_handler(v17, &v13);
    objc_msgSend(v7, "setState:", 1, v13, v14, v15, v16);
    EAPLogGetLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v9, v10))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_206440000, v9, v10, "custom protocol reported ready status", buf, 2u);
    }

    v11 = 1;
  }
  else
  {
    v11 = 2;
  }

  return v11;
}

uint64_t __47__EAPBoringSSLSession_customProtocolDefinition__block_invoke_3()
{
  return 0;
}

void __47__EAPBoringSSLSession_customProtocolDefinition__block_invoke_2(uint64_t a1, void *a2, void *a3, size_t a4, int a5)
{
  NSObject *v9;
  os_log_type_t v10;
  const char *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  void *v16;
  os_log_type_t v17;
  NSObject *v18;
  const char *v19;
  int v20;
  id v21;
  id v22;
  int8x16_t v23;
  _QWORD parse[4];
  int8x16_t v25;
  uint64_t *v26;
  _BYTE *v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  uint8_t v33[4];
  const char *v34;
  __int16 v35;
  int v36;
  _BYTE buf[24];
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v21 = a2;
  v22 = a3;
  EAPLogGetLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = "false";
    if (a5)
      v11 = "true";
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = a4;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_206440000, v9, v10, "output handler received message_length: [%zu], is_complete:[%s]", buf, 0x16u);
  }

  if (a4)
  {
    v12 = objc_msgSend(*(id *)(a1 + 40), "state", v21, v22);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v38 = 0;
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = -9803;
    v13 = MEMORY[0x24BDAC760];
    while (*(_QWORD *)(*(_QWORD *)&buf[8] + 24) < a4)
    {
      parse[0] = v13;
      parse[1] = 3221225472;
      parse[2] = __47__EAPBoringSSLSession_customProtocolDefinition__block_invoke_7;
      parse[3] = &unk_24BF0CB58;
      v28 = v12 == 1;
      v26 = &v29;
      v23 = *(int8x16_t *)(a1 + 32);
      v14 = (id)v23.i64[0];
      v25 = vextq_s8(v23, v23, 8uLL);
      v27 = buf;
      nw_framer_parse_output(v14, a4, a4, 0, parse);

      if (v12 != 1)
        goto LABEL_18;
    }
    if (v12 == 1)
    {
      if (*((_DWORD *)v30 + 6))
        v15 = *((_DWORD *)v30 + 6);
      else
        v15 = -9803;
      *((_DWORD *)v30 + 6) = v15;
      objc_msgSend(*(id *)(a1 + 40), "updateHandshakeStatus:");
      EAPLogGetLogHandle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = _SC_syslog_os_log_mapping();
      v18 = v16;
      if (os_log_type_enabled(v18, v17))
      {
        v19 = EAPSecurityErrorString(*((_DWORD *)v30 + 6));
        v20 = *((_DWORD *)v30 + 6);
        *(_DWORD *)v33 = 136315394;
        v34 = v19;
        v35 = 1024;
        v36 = v20;
        _os_log_impl(&dword_206440000, v18, v17, "[output_handler]: updated handshake status to [%s]:[%d]", v33, 0x12u);
      }

    }
LABEL_18:
    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    nw_framer_mark_failed_with_error(*(nw_framer_t *)(a1 + 32), 5);
  }

}

uint64_t __47__EAPBoringSSLSession_customProtocolDefinition__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  NSObject *v7;
  os_log_type_t v8;
  int v9;
  NSObject *v10;
  os_log_type_t v11;
  int v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  if (!*(_BYTE *)(a1 + 64))
    return a3;
  result = 0;
  if (a2 && a3)
  {
    EAPLogGetLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)buf = 134217984;
      v15 = a3;
      _os_log_impl(&dword_206440000, v7, v8, "writing %zu bytes to MemIO Write Buffer", buf, 0xCu);
    }

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = ((uint64_t (*)(uint64_t, uint64_t, uint64_t *))objc_msgSend(*(id *)(a1 + 32), "write"))(objc_msgSend(*(id *)(a1 + 32), "memIO"), a2, &v13);
    v9 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    EAPLogGetLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v11 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v10, v11))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_206440000, v10, v11, "failed to write to MemIO write buffer, reporting EPROTO", buf, 2u);
      }

      nw_framer_mark_failed_with_error(*(nw_framer_t *)(a1 + 40), 100);
      return 0;
    }
    else
    {
      v12 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v10, (os_log_type_t)v12))
      {
        *(_DWORD *)buf = 134217984;
        v15 = v13;
        _os_log_impl(&dword_206440000, v10, (os_log_type_t)v12, "completed writing %zu bytes to MemIO Buffer", buf, 0xCu);
      }

      result = v13;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += v13;
    }
  }
  return result;
}

- (BOOL)setClientIdentity:(__SecIdentity *)a3 certificates:(id)a4
{
  const __CFArray *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  os_log_type_t v11;
  const char *v12;
  uint8_t *v13;
  NSObject *v14;
  BOOL v15;
  __int16 v17;
  __int16 v18;

  v6 = (const __CFArray *)a4;
  -[EAPBoringSSLSession tlsProtocol](self, "tlsProtocol");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;

  if (!v8)
  {
    EAPLogGetLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v10, v11))
    {
      v18 = 0;
      v12 = "nw_tls_copy_sec_protocol_options() returned nil";
      v13 = (uint8_t *)&v18;
LABEL_14:
      _os_log_impl(&dword_206440000, v10, v11, v12, v13, 2u);
    }
LABEL_15:

    v15 = 0;
    goto LABEL_16;
  }
  if (a3)
  {
    if (v6 && -[__CFArray count](v6, "count"))
      v9 = sec_identity_create_with_certificates(a3, v6);
    else
      v9 = sec_identity_create(a3);
    v14 = v9;
    if (v9)
    {
      sec_protocol_options_set_local_identity(v8, v9);

      goto LABEL_11;
    }
    EAPLogGetLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v10, v11))
    {
      v17 = 0;
      v12 = "sec_identity_create()/sec_identity_create_with_certificates() returned nil";
      v13 = (uint8_t *)&v17;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
LABEL_11:
  v15 = 1;
LABEL_16:

  return v15;
}

- (BOOL)configureSecProtocol:(EAPBoringSSLSessionParameters_s *)a3
{
  void *v5;
  NSObject *v6;
  BOOL v7;
  __SecIdentity *var0;
  CFIndex Count;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD verify_block[4];
  id v18;
  id buf[2];

  if (a3)
  {
    -[EAPBoringSSLSession tlsProtocol](self, "tlsProtocol");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;

    if (v6)
    {
      sec_protocol_options_set_tls_early_data_enabled();
      sec_protocol_options_set_min_tls_protocol_version(v6, (tls_protocol_version_t)a3->var2);
      sec_protocol_options_set_max_tls_protocol_version(v6, (tls_protocol_version_t)a3->var3);
      v7 = 0;
      if (-[EAPBoringSSLSession eapType](self, "eapType") != 13)
      {
LABEL_17:

        return v7;
      }
      sec_protocol_options_set_eap_method();
      var0 = a3->var0;
      if (!a3->var0)
      {
LABEL_16:
        objc_initWeak(buf, self);
        verify_block[0] = MEMORY[0x24BDAC760];
        verify_block[1] = 3221225472;
        verify_block[2] = __44__EAPBoringSSLSession_configureSecProtocol___block_invoke;
        verify_block[3] = &unk_24BF0CBD0;
        objc_copyWeak(&v18, buf);
        -[EAPBoringSSLSession queue](self, "queue");
        v15 = objc_claimAutoreleasedReturnValue();
        sec_protocol_options_set_verify_block(v6, verify_block, v15);

        objc_destroyWeak(&v18);
        objc_destroyWeak(buf);
        v7 = 1;
        goto LABEL_17;
      }
      if (a3->var1 && (Count = CFArrayGetCount(a3->var1), var0 = a3->var0, Count >= 1))
        v10 = sec_identity_create_with_certificates(var0, a3->var1);
      else
        v10 = sec_identity_create(var0);
      v14 = v10;
      if (v10)
      {
        sec_protocol_options_set_local_identity(v6, v10);

        goto LABEL_16;
      }
      EAPLogGetLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v11, (os_log_type_t)v12))
      {
        LOWORD(buf[0]) = 0;
        v13 = "sec_identity_create()/sec_identity_create_with_certificates() returned nil";
        goto LABEL_11;
      }
    }
    else
    {
      EAPLogGetLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      LOBYTE(v12) = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v11, (os_log_type_t)v12))
      {
        LOWORD(buf[0]) = 0;
        v13 = "nw_tls_copy_sec_protocol_options() returned nil";
LABEL_11:
        _os_log_impl(&dword_206440000, v11, (os_log_type_t)v12, v13, (uint8_t *)buf, 2u);
      }
    }

    v7 = 0;
    goto LABEL_17;
  }
  return 0;
}

void __44__EAPBoringSSLSession_configureSecProtocol___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  NSObject *v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  os_log_type_t v9;
  id WeakRetained;
  void *v11;
  os_log_type_t v12;
  NSObject *v13;
  const char *v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  EAPLogGetLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v8, v9))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_206440000, v8, v9, "verify_block called", (uint8_t *)&v15, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setServerSecTrust:", sec_trust_copy_ref(v6));
    objc_msgSend(WeakRetained, "setSecTrustCompletionHandler:", v7);
    objc_msgSend(WeakRetained, "updateHandshakeStatus:", 4294957455);
    EAPLogGetLogHandle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = _SC_syslog_os_log_mapping();
    v13 = v11;
    if (os_log_type_enabled(v13, v12))
    {
      v14 = EAPSecurityErrorString(-9841);
      v15 = 136315394;
      v16 = v14;
      v17 = 1024;
      v18 = -9841;
      _os_log_impl(&dword_206440000, v13, v12, "[verify_block]: updated handshake status to [%s]:[%d]", (uint8_t *)&v15, 0x12u);
    }

  }
  else
  {
    v7[2](v7, 0);
  }

}

- (BOOL)setup:(EAPBoringSSLSessionParameters_s *)a3 clientContext:(void *)a4
{
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  nw_protocol_options_t options;
  void *v11;
  dispatch_queue_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *host;
  NSObject *v17;
  nw_connection_t v18;
  void *v19;
  BOOL v20;
  os_log_type_t v21;
  os_log_type_t v22;
  const char *v23;
  uint8_t *v24;
  os_log_type_t v26;
  NSObject *v27;
  os_log_type_t v28;
  const char *v29;
  uint8_t *v30;
  __int16 v31;
  __int16 v32;
  uint8_t v33[16];
  uint8_t v34[2];
  __int16 v35;
  __int16 v36;
  uint8_t buf[16];

  if (a3)
  {
    v7 = nw_parameters_create();
    v8 = v7;
    if (!v7)
    {
      EAPLogGetLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      v21 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v9, v21))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_206440000, v9, v21, "nw_parameters_create() returned nil", buf, 2u);
      }
      v20 = 0;
      goto LABEL_23;
    }
    v9 = nw_parameters_copy_default_protocol_stack(v7);
    if (v9)
    {
      nw_parameters_set_custom_protocols_only();
      options = nw_tls_create_options();
      -[EAPBoringSSLSession setTlsProtocol:](self, "setTlsProtocol:", options);

      -[EAPBoringSSLSession tlsProtocol](self, "tlsProtocol");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[EAPBoringSSLSession setEapType:](self, "setEapType:", a3->var6);
        -[EAPBoringSSLSession setRead:](self, "setRead:", a3->var4);
        -[EAPBoringSSLSession setWrite:](self, "setWrite:", a3->var5);
        v12 = dispatch_queue_create("EAPBoringSSLSession", 0);
        -[EAPBoringSSLSession setQueue:](self, "setQueue:", v12);

        -[EAPBoringSSLSession setClientContext:](self, "setClientContext:", a4);
        -[EAPBoringSSLSession setMemIO:](self, "setMemIO:", a3->var7);
        if (-[EAPBoringSSLSession configureSecProtocol:](self, "configureSecProtocol:", a3))
        {
          -[EAPBoringSSLSession customProtocolDefinition](self, "customProtocolDefinition");
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = nw_framer_create_options(v13);

          if (!v14)
          {
            EAPLogGetLogHandle();
            v17 = objc_claimAutoreleasedReturnValue();
            v26 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v17, v26))
            {
              *(_WORD *)v33 = 0;
              _os_log_impl(&dword_206440000, v17, v26, "nw_framer_create_options() returned nil", v33, 2u);
            }
            goto LABEL_33;
          }
          -[EAPBoringSSLSession tlsProtocol](self, "tlsProtocol");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          nw_protocol_stack_append_application_protocol();

          nw_protocol_stack_append_application_protocol();
          host = nw_endpoint_create_host("0.0.0.0", "0");
          v17 = host;
          if (host)
          {
            v18 = nw_connection_create(host, v8);
            -[EAPBoringSSLSession setConnection:](self, "setConnection:", v18);

            -[EAPBoringSSLSession connection](self, "connection");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              v20 = 1;
LABEL_34:

              goto LABEL_22;
            }
            EAPLogGetLogHandle();
            v27 = objc_claimAutoreleasedReturnValue();
            v28 = _SC_syslog_os_log_mapping();
            if (!os_log_type_enabled(v27, v28))
              goto LABEL_32;
            v31 = 0;
            v29 = "nw_connection_create() returned nil";
            v30 = (uint8_t *)&v31;
          }
          else
          {
            EAPLogGetLogHandle();
            v27 = objc_claimAutoreleasedReturnValue();
            v28 = _SC_syslog_os_log_mapping();
            if (!os_log_type_enabled(v27, v28))
            {
LABEL_32:

LABEL_33:
              v20 = 0;
              goto LABEL_34;
            }
            v32 = 0;
            v29 = "nw_endpoint_create_host() returned nil";
            v30 = (uint8_t *)&v32;
          }
          _os_log_impl(&dword_206440000, v27, v28, v29, v30, 2u);
          goto LABEL_32;
        }
        EAPLogGetLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        v22 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v14, v22))
        {
          *(_WORD *)v34 = 0;
          v23 = "failed to set the security protocol options";
          v24 = v34;
          goto LABEL_20;
        }
LABEL_21:
        v20 = 0;
LABEL_22:

LABEL_23:
        return v20;
      }
      EAPLogGetLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      v22 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v14, v22))
        goto LABEL_21;
      v35 = 0;
      v23 = "nw_tls_create_options() returned nil";
      v24 = (uint8_t *)&v35;
    }
    else
    {
      EAPLogGetLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      v22 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v14, v22))
        goto LABEL_21;
      v36 = 0;
      v23 = "nw_parameters_copy_default_protocol_stack() returned nil";
      v24 = (uint8_t *)&v36;
    }
LABEL_20:
    _os_log_impl(&dword_206440000, v14, v22, v23, v24, 2u);
    goto LABEL_21;
  }
  return 0;
}

- (int)handshake
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  uint8_t v10[16];

  if (-[EAPBoringSSLSession handshakeStatus](self, "handshakeStatus") == -9841
    && (-[EAPBoringSSLSession secTrustCompletionHandler](self, "secTrustCompletionHandler"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[EAPBoringSSLSession secTrustCompletionHandler](self, "secTrustCompletionHandler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 1);

    EAPLogGetLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_206440000, v5, v6, "delivered trust evaluation result=success to TLS protocol", v10, 2u);
    }

  }
  else
  {
    -[EAPBoringSSLSession deliverInput](self, "deliverInput");
  }
  -[EAPBoringSSLSession statusUpdateLock](self, "statusUpdateLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lockWhenCondition:", 0);

  LODWORD(v7) = -[EAPBoringSSLSession handshakeStatus](self, "handshakeStatus");
  -[EAPBoringSSLSession statusUpdateLock](self, "statusUpdateLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlockWithCondition:", 1);

  return (int)v7;
}

- (int)deliverInput
{
  NSObject *v3;
  nw_protocol_definition_t v4;
  uint64_t singleton;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  int v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  NSObject *v19;
  os_log_type_t v20;
  NSObject *v21;
  NSObject *v22;
  os_log_type_t v23;
  nw_protocol_definition_t v25;
  _QWORD async_block[4];
  id v27;
  id v28;
  id v29[2];
  BOOL v30;
  uint64_t v31;
  id location[4];

  location[3] = *(id *)MEMORY[0x24BDAC8D0];
  if (-[EAPBoringSSLSession state](self, "state") != 1)
    return 0;
  -[EAPBoringSSLSession customProtocol](self, "customProtocol");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = nw_protocol_options_copy_definition(v3);

  v25 = v4;
  if (v4 && (singleton = nw_protocol_metadata_create_singleton()) != 0)
  {
    v6 = (void *)singleton;
    v7 = malloc_type_calloc(1uLL, 0x4800uLL, 0x86B4A2C9uLL);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v31 = 18432;
      while (1)
      {
        v10 = ((uint64_t (*)($866BB3734758C83BFC474B4A3B7B1691 *, void *, uint64_t *))-[EAPBoringSSLSession read](self, "read"))(-[EAPBoringSSLSession memIO](self, "memIO"), v8, &v31);
        if (v10)
          break;
        v11 = v31;
        if (!(v31 | v9))
        {
          v10 = 0;
          goto LABEL_26;
        }
        v12 = v31 == 0;
        if (v31)
        {
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v8, v31);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = 0;
        }
        objc_initWeak(location, self);
        -[EAPBoringSSLSession customFramer](self, "customFramer");
        v14 = objc_claimAutoreleasedReturnValue();
        async_block[0] = MEMORY[0x24BDAC760];
        async_block[1] = 3221225472;
        async_block[2] = __35__EAPBoringSSLSession_deliverInput__block_invoke;
        async_block[3] = &unk_24BF0CBF8;
        objc_copyWeak(v29, location);
        v30 = v12;
        v27 = v6;
        v15 = v13;
        v28 = v15;
        v29[1] = (id)v31;
        nw_framer_async(v14, async_block);

        v16 = v31;
        v31 = 18432;

        objc_destroyWeak(v29);
        objc_destroyWeak(location);

        v9 += v16;
        if (!v11)
          goto LABEL_21;
      }
      EAPLogGetLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v19, v20))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_206440000, v19, v20, "failed to read from the MemIO read buffer", (uint8_t *)location, 2u);
      }

      -[EAPBoringSSLSession customFramer](self, "customFramer");
      v21 = objc_claimAutoreleasedReturnValue();
      nw_framer_mark_failed_with_error(v21, 100);

LABEL_21:
      if (v9)
      {
        EAPLogGetLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v22, v23))
        {
          LODWORD(location[0]) = 134217984;
          *(id *)((char *)location + 4) = (id)v9;
          _os_log_impl(&dword_206440000, v22, v23, "delivered total %zu bytes to TLS protocol", (uint8_t *)location, 0xCu);
        }

      }
LABEL_26:
      free(v8);
    }
    else
    {
      v10 = -108;
    }
  }
  else
  {
    EAPLogGetLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v17, v18))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_206440000, v17, v18, "nw_protocol_metadata_create_singleton() returned nil metadata", (uint8_t *)location, 2u);
    }

    v6 = 0;
    v10 = -50;
  }

  return v10;
}

void __35__EAPBoringSSLSession_deliverInput__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  os_log_type_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(unsigned __int8 *)(a1 + 64);
    objc_msgSend(WeakRetained, "customFramer");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      nw_framer_deliver_input_no_copy(v5, 0, *(nw_framer_message_t *)(a1 + 32), 1);

      EAPLogGetLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v7, v8))
      {
        LOWORD(v15) = 0;
        v9 = "nw_framer_deliver_input_no_copy() delivered EOD";
        v10 = v7;
        v11 = v8;
        v12 = 2;
LABEL_7:
        _os_log_impl(&dword_206440000, v10, v11, v9, (uint8_t *)&v15, v12);
      }
    }
    else
    {
      nw_framer_deliver_input(v5, (const uint8_t *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes"), objc_msgSend(*(id *)(a1 + 40), "length"), *(nw_framer_message_t *)(a1 + 32), 0);

      EAPLogGetLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      v13 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v7, (os_log_type_t)v13))
      {
        v14 = *(_QWORD *)(a1 + 56);
        v15 = 134217984;
        v16 = v14;
        v9 = "nw_framer_deliver_input() delivered %zu bytes";
        v10 = v7;
        v11 = v13;
        v12 = 12;
        goto LABEL_7;
      }
    }

  }
}

- (unsigned)getEAPMethodInUse
{
  void *v2;
  id v3;
  unsigned __int8 eap_method;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t v8[16];

  -[EAPBoringSSLSession tlsProtocol](self, "tlsProtocol");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;

  if (v3)
  {
    eap_method = sec_protocol_options_get_eap_method();
  }
  else
  {
    EAPLogGetLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_206440000, v5, v6, "nw_tls_copy_sec_protocol_options() returned nil", v8, 2u);
    }

    eap_method = 0;
  }

  return eap_method;
}

- (void)setSecProtocolMetadata
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  nw_protocol_metadata_t v6;
  NSObject *definition;

  -[EAPBoringSSLSession secProtocolMetadata](self, "secProtocolMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[EAPBoringSSLSession tlsProtocol](self, "tlsProtocol");
    v4 = objc_claimAutoreleasedReturnValue();
    definition = nw_protocol_options_copy_definition(v4);

    if (definition)
    {
      -[EAPBoringSSLSession connection](self, "connection");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = nw_connection_copy_protocol_metadata(v5, definition);
      -[EAPBoringSSLSession setSecProtocolMetadata:](self, "setSecProtocolMetadata:", v6);

    }
  }
}

- (id)getEAPKeyMaterial
{
  void *v3;
  void *v4;
  int eap_key_material;
  void *v6;
  _BYTE v8[128];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (-[EAPBoringSSLSession getEAPMethodInUse](self, "getEAPMethodInUse") != 1)
    goto LABEL_5;
  -[EAPBoringSSLSession setSecProtocolMetadata](self, "setSecProtocolMetadata");
  -[EAPBoringSSLSession secProtocolMetadata](self, "secProtocolMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_5;
  -[EAPBoringSSLSession secProtocolMetadata](self, "secProtocolMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  eap_key_material = sec_protocol_metadata_get_eap_key_material();

  if (eap_key_material)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v8, 128);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_5:
    v6 = 0;
  }
  return v6;
}

- (unsigned)getNegotiatedTLSVersion
{
  void *v3;
  NSObject *v4;
  tls_protocol_version_t negotiated_tls_protocol_version;

  -[EAPBoringSSLSession setSecProtocolMetadata](self, "setSecProtocolMetadata");
  -[EAPBoringSSLSession secProtocolMetadata](self, "secProtocolMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[EAPBoringSSLSession secProtocolMetadata](self, "secProtocolMetadata");
  v4 = objc_claimAutoreleasedReturnValue();
  negotiated_tls_protocol_version = sec_protocol_metadata_get_negotiated_tls_protocol_version(v4);

  return negotiated_tls_protocol_version;
}

- (BOOL)getSessionResumed
{
  void *v3;
  void *v4;
  char session_resumed;

  -[EAPBoringSSLSession setSecProtocolMetadata](self, "setSecProtocolMetadata");
  -[EAPBoringSSLSession secProtocolMetadata](self, "secProtocolMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[EAPBoringSSLSession secProtocolMetadata](self, "secProtocolMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  session_resumed = sec_protocol_metadata_get_session_resumed();

  return session_resumed;
}

- (id)copyPeerCertificateChain
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  id v6;
  _QWORD handler[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  -[EAPBoringSSLSession setSecProtocolMetadata](self, "setSecProtocolMetadata");
  -[EAPBoringSSLSession secProtocolMetadata](self, "secProtocolMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[EAPBoringSSLSession secProtocolMetadata](self, "secProtocolMetadata");
  v4 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __47__EAPBoringSSLSession_copyPeerCertificateChain__block_invoke;
  handler[3] = &unk_24BF0CC20;
  handler[4] = &v9;
  v5 = sec_protocol_metadata_access_peer_certificate_chain(v4, handler);

  if (v5 && objc_msgSend((id)v10[5], "count"))
    v6 = (id)v10[5];
  else
    v6 = 0;
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __47__EAPBoringSSLSession_copyPeerCertificateChain__block_invoke(uint64_t a1, sec_certificate_t certificate)
{
  SecCertificateRef v3;

  v3 = sec_certificate_copy_ref(certificate);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);

}

- (int)state
{
  EAPBoringSSLSession *v2;
  int state;

  v2 = self;
  objc_sync_enter(v2);
  state = v2->_state;
  objc_sync_exit(v2);

  return state;
}

- (void)setState:(int)a3
{
  EAPBoringSSLSession *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_state = a3;
  objc_sync_exit(obj);

}

- (int)handshakeStatus
{
  EAPBoringSSLSession *v2;
  int handshakeStatus;

  v2 = self;
  objc_sync_enter(v2);
  handshakeStatus = v2->_handshakeStatus;
  objc_sync_exit(v2);

  return handshakeStatus;
}

- (void)setHandshakeStatus:(int)a3
{
  EAPBoringSSLSession *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_handshakeStatus = a3;
  objc_sync_exit(obj);

}

- (void)readApplicationData
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[EAPBoringSSLSession connection](self, "connection");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__EAPBoringSSLSession_readApplicationData__block_invoke;
  v4[3] = &unk_24BF0CC48;
  objc_copyWeak(&v5, &location);
  nw_connection_receive(v3, 0, 1u, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __42__EAPBoringSSLSession_readApplicationData__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  NSObject *v8;
  id WeakRetained;
  CFErrorRef v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  _BYTE *v14;
  void *v15;
  os_log_type_t v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  int v21;
  void *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v8)
  {
    v10 = nw_error_copy_cf_error(v8);
    EAPLogGetLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v11, v12))
    {
      v21 = 138412290;
      v22 = v10;
      _os_log_impl(&dword_206440000, v11, v12, "application data receive completion handler gor error : %@", (uint8_t *)&v21, 0xCu);
    }

    v13 = 4294899625;
LABEL_9:

    goto LABEL_10;
  }
  if (v7)
  {
    v10 = (CFErrorRef)objc_retainAutorelease(v7);
    v14 = (_BYTE *)-[__CFError bytes](v10, "bytes");
    if (-[__CFError length](v10, "length") == 1 && !*v14)
    {
      EAPLogGetLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v19, v20))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_206440000, v19, v20, "Received expected application data from the EAP-TLS 1.3 server", (uint8_t *)&v21, 2u);
      }

      objc_msgSend(WeakRetained, "setState:", 2);
      v13 = 0;
    }
    else
    {
      v13 = 4294957496;
    }
    goto LABEL_9;
  }
  v13 = 0;
LABEL_10:
  objc_msgSend(WeakRetained, "updateHandshakeStatus:", v13);
  EAPLogGetLogHandle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = _SC_syslog_os_log_mapping();
  v17 = v15;
  if (os_log_type_enabled(v17, v16))
  {
    v18 = EAPSecurityErrorString(v13);
    v21 = 136315394;
    v22 = (void *)v18;
    v23 = 1024;
    v24 = v13;
    _os_log_impl(&dword_206440000, v17, v16, "[Application Data Reader]: updated handshake status to [%s]:[%d]", (uint8_t *)&v21, 0x12u);
  }

}

- (void)start
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, unsigned int);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  -[EAPBoringSSLSession connection](self, "connection");
  v3 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __28__EAPBoringSSLSession_start__block_invoke;
  v10 = &unk_24BF0CC70;
  objc_copyWeak(&v11, &location);
  nw_connection_set_state_changed_handler(v3, &v7);

  -[EAPBoringSSLSession connection](self, "connection", v7, v8, v9, v10);
  v4 = objc_claimAutoreleasedReturnValue();
  -[EAPBoringSSLSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  nw_connection_set_queue(v4, v5);

  -[EAPBoringSSLSession setState:](self, "setState:", 0);
  -[EAPBoringSSLSession connection](self, "connection");
  v6 = objc_claimAutoreleasedReturnValue();
  nw_connection_start(v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __28__EAPBoringSSLSession_start__block_invoke(uint64_t a1, unsigned int a2)
{
  id WeakRetained;
  NSObject *v4;
  os_log_type_t v5;
  const char *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  char v12;
  void *v13;
  os_log_type_t v14;
  NSObject *v15;
  const char *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  EAPLogGetLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v4, v5))
  {
    if (a2 > 5)
      v6 = "unknown";
    else
      v6 = off_24BF0CC90[a2];
    v17 = 136315138;
    v18 = v6;
    _os_log_impl(&dword_206440000, v4, v5, "connection state changed to %s", (uint8_t *)&v17, 0xCu);
  }

  v7 = a2 - 1;
  v8 = 4294957490;
  v9 = 3;
  switch(v7)
  {
    case 0u:
      if (objc_msgSend(WeakRetained, "state", 3) == 1)
      {
        v8 = 4294899625;
        goto LABEL_14;
      }
      break;
    case 2u:
      v10 = objc_msgSend(WeakRetained, "getEAPMethodInUse", 3);
      v11 = objc_msgSend(WeakRetained, "getNegotiatedTLSVersion");
      v12 = objc_msgSend(WeakRetained, "getSessionResumed");
      v8 = 0;
      v9 = 2;
      if (v10 != 1 || v11 != 772 || (v12 & 1) != 0)
        goto LABEL_13;
      objc_msgSend(WeakRetained, "readApplicationData", 2);
      break;
    case 3u:
LABEL_13:
      objc_msgSend(WeakRetained, "setState:", v9);
LABEL_14:
      objc_msgSend(WeakRetained, "updateHandshakeStatus:", v8);
      EAPLogGetLogHandle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = _SC_syslog_os_log_mapping();
      v15 = v13;
      if (os_log_type_enabled(v15, v14))
      {
        v16 = EAPSecurityErrorString(v8);
        v17 = 136315394;
        v18 = v16;
        v19 = 1024;
        v20 = v8;
        _os_log_impl(&dword_206440000, v15, v14, "[State Change Handler]: updated handshake status to [%s]:[%d]", (uint8_t *)&v17, 0x12u);
      }

      break;
    case 4u:
      objc_msgSend(WeakRetained, "setState:", 3);
      break;
    default:
      break;
  }

}

- (void)stop
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  NSObject *v5;
  os_log_type_t v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  os_log_type_t v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  os_log_type_t v20;
  NSObject *v21;
  NSObject *v22;
  os_log_type_t v23;
  int v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (-[EAPBoringSSLSession handshakeStatus](self, "handshakeStatus") == -9841
    && (-[EAPBoringSSLSession secTrustCompletionHandler](self, "secTrustCompletionHandler"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[EAPBoringSSLSession secTrustCompletionHandler](self, "secTrustCompletionHandler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0);

    EAPLogGetLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v5, v6))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_206440000, v5, v6, "delivered trust evaluation result=failure to TLS protocol", (uint8_t *)&v24, 2u);
    }

    -[EAPBoringSSLSession connection](self, "connection");
    v7 = objc_claimAutoreleasedReturnValue();
    nw_connection_set_state_changed_handler(v7, 0);

    EAPLogGetLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v8, v9))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_206440000, v8, v9, "removed network connection state change handler", (uint8_t *)&v24, 2u);
    }

    -[EAPBoringSSLSession statusUpdateLock](self, "statusUpdateLock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lockWhenCondition:", 0);

    v11 = -[EAPBoringSSLSession handshakeStatus](self, "handshakeStatus");
    -[EAPBoringSSLSession statusUpdateLock](self, "statusUpdateLock");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "unlockWithCondition:", 1);

    EAPLogGetLogHandle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = _SC_syslog_os_log_mapping();
    v15 = v13;
    if (os_log_type_enabled(v15, v14))
    {
      v16 = EAPSecurityErrorString(v11);
      v24 = 136315394;
      v25 = v16;
      v26 = 1024;
      v27 = v11;
      _os_log_impl(&dword_206440000, v15, v14, "[session stopper]: handshake status updated to [%s]:[%d]", (uint8_t *)&v24, 0x12u);
    }

  }
  else
  {
    -[EAPBoringSSLSession connection](self, "connection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[EAPBoringSSLSession setState:](self, "setState:", 3);
      -[EAPBoringSSLSession connection](self, "connection");
      v18 = objc_claimAutoreleasedReturnValue();
      nw_connection_set_state_changed_handler(v18, 0);

      EAPLogGetLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v19, v20))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_206440000, v19, v20, "removed network connection state change handler", (uint8_t *)&v24, 2u);
      }

      -[EAPBoringSSLSession connection](self, "connection");
      v21 = objc_claimAutoreleasedReturnValue();
      nw_connection_cancel(v21);

      EAPLogGetLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v22, v23))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_206440000, v22, v23, "cancelled network connection", (uint8_t *)&v24, 2u);
      }

      -[EAPBoringSSLSession setConnection:](self, "setConnection:", 0);
    }
  }
}

- (void)updateHandshakeStatus:(int)a3
{
  uint64_t v3;
  void *v5;
  id v6;

  v3 = *(_QWORD *)&a3;
  -[EAPBoringSSLSession statusUpdateLock](self, "statusUpdateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lockWhenCondition:", 1);

  -[EAPBoringSSLSession setHandshakeStatus:](self, "setHandshakeStatus:", v3);
  -[EAPBoringSSLSession statusUpdateLock](self, "statusUpdateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlockWithCondition:", 0);

}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_nw_protocol_options)tlsProtocol
{
  return self->_tlsProtocol;
}

- (void)setTlsProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_tlsProtocol, a3);
}

- (OS_nw_protocol_options)customProtocol
{
  return self->_customProtocol;
}

- (void)setCustomProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_customProtocol, a3);
}

- (OS_sec_protocol_metadata)secProtocolMetadata
{
  return self->_secProtocolMetadata;
}

- (void)setSecProtocolMetadata:(id)a3
{
  self->_secProtocolMetadata = (OS_sec_protocol_metadata *)a3;
}

- (OS_nw_framer)customFramer
{
  return self->_customFramer;
}

- (void)setCustomFramer:(id)a3
{
  objc_storeStrong((id *)&self->_customFramer, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSData)msk
{
  return self->_msk;
}

- (void)setMsk:(id)a3
{
  objc_storeStrong((id *)&self->_msk, a3);
}

- (void)read
{
  return self->_read;
}

- (void)setRead:(void *)a3
{
  self->_read = a3;
}

- (void)write
{
  return self->_write;
}

- (void)setWrite:(void *)a3
{
  self->_write = a3;
}

- (void)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(void *)a3
{
  self->_clientContext = a3;
}

- (__SecTrust)serverSecTrust
{
  return self->_serverSecTrust;
}

- (void)setServerSecTrust:(__SecTrust *)a3
{
  self->_serverSecTrust = a3;
}

- (id)secTrustCompletionHandler
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setSecTrustCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSConditionLock)statusUpdateLock
{
  return self->_statusUpdateLock;
}

- (void)setStatusUpdateLock:(id)a3
{
  objc_storeStrong((id *)&self->_statusUpdateLock, a3);
}

- (unsigned)eapType
{
  return self->_eapType;
}

- (void)setEapType:(unsigned int)a3
{
  self->_eapType = a3;
}

- ($866BB3734758C83BFC474B4A3B7B1691)memIO
{
  return self->_memIO;
}

- (void)setMemIO:(id *)a3
{
  self->_memIO = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusUpdateLock, 0);
  objc_storeStrong(&self->_secTrustCompletionHandler, 0);
  objc_storeStrong((id *)&self->_msk, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_customFramer, 0);
  objc_storeStrong((id *)&self->_customProtocol, 0);
  objc_storeStrong((id *)&self->_tlsProtocol, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
