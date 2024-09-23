@implementation NSCFSocksProxy

uint64_t __58___NSCFSocksProxy_outboundConnectionReceivedData_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (result && (*(_BYTE *)(result + 8) & 1) != 0 && !*(_QWORD *)(result + 32))
    return objc_msgSend((id)result, "cancel");
  return result;
}

void __31___NSCFSocksProxy_readOutbound__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];

  v5 = a2;
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __31___NSCFSocksProxy_readOutbound__block_invoke_2;
    v8[3] = &unk_1E14FB818;
    v8[4] = v6;
    objc_msgSend(v7, "write:handler:", v5, v8);
  }
  else if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "cleanup");
  }

}

uint64_t __31___NSCFSocksProxy_readOutbound__block_invoke_2(uint64_t a1)
{
  return -[_NSCFSocksProxy readOutbound](*(_QWORD *)(a1 + 32));
}

void __30___NSCFSocksProxy_readInbound__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];

  v5 = a2;
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 48);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __30___NSCFSocksProxy_readInbound__block_invoke_2;
    v8[3] = &unk_1E14FB818;
    v8[4] = v6;
    objc_msgSend(v7, "write:handler:", v5, v8);
  }
  else if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "cleanup");
  }

}

uint64_t __30___NSCFSocksProxy_readInbound__block_invoke_2(uint64_t a1)
{
  return -[_NSCFSocksProxy readInbound](*(_QWORD *)(a1 + 32));
}

void __32___NSCFSocksProxy_handshakeRead__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  __CFN_SocksHandshakev5 *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  _QWORD *v16;
  const char *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  const char *v25;
  NSProxyConnectionStreamTask *v26;
  id Property;
  const char *v28;
  id v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  _QWORD *v38;
  uint64_t v39;
  _QWORD v40[6];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  v5 = a2;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    v8 = v7;
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    if (!v9)
    {
      v10 = objc_retainAutorelease(v7);
      v11 = *(unsigned __int8 *)objc_msgSend(v10, "bytes");
      objc_opt_self();
      if (v11 == 5)
        v12 = objc_alloc_init(__CFN_SocksHandshakev5);
      else
        v12 = 0;
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(v13 + 32);
      *(_QWORD *)(v13 + 32) = v12;

      v16 = *(_QWORD **)(a1 + 32);
      if (!v16[4])
      {
        objc_msgSend(v16, "cleanup");

        goto LABEL_25;
      }
      objc_msgSend(objc_getProperty(v16, v15, 56, 1), "objectForKeyedSubscript:", CFSTR("NSServerConfigurationSOCKS5ServerCredentials"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      if (v19)
        objc_setProperty_atomic(v19, v17, v18, 24);

      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    }
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__6280;
    v49 = __Block_byref_object_dispose__6281;
    v50 = 0;
    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 0;
    v20 = objc_retainAutorelease(v8);
    v21 = objc_msgSend(v20, "bytes");
    v22 = objc_msgSend(v20, "length");
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __32___NSCFSocksProxy_handshakeRead__block_invoke_4;
    v40[3] = &unk_1E14F96B0;
    v40[4] = &v45;
    v40[5] = &v41;
    v23 = objc_msgSend(v9, "parse:len:completion:", v21, v22, v40);
    v24 = v46[5];
    if (v24)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "write:handler:", v24, &__block_literal_global_6282);
    if (*((_DWORD *)v42 + 6))
    {
      objc_msgSend(*(id *)(a1 + 32), "cleanup");
    }
    else if ((v23 & 1) != 0)
    {
      v26 = [NSProxyConnectionStreamTask alloc];
      Property = *(id *)(*(_QWORD *)(a1 + 32) + 32);
      if (Property)
        Property = objc_getProperty(Property, v25, 16, 1);
      v29 = Property;
      v30 = *(_QWORD **)(a1 + 32);
      v31 = v30[4];
      if (v31)
        v32 = *(unsigned __int16 *)(v31 + 10);
      else
        v32 = 0;
      v33 = v30[1];
      v34 = objc_getProperty(v30, v28, 56, 1);
      v35 = -[NSProxyConnectionStreamTask initWithHost:port:queue:configuration:](v26, "initWithHost:port:queue:configuration:", v29, v32, v33, v34);
      v36 = *(_QWORD *)(a1 + 32);
      v37 = *(void **)(v36 + 48);
      *(_QWORD *)(v36 + 48) = v35;

      v38 = *(_QWORD **)(a1 + 32);
      v39 = v38[6];
      if (v39)
        objc_storeWeak((id *)(v39 + 24), v38);
    }
    else
    {
      -[_NSCFSocksProxy handshakeRead](*(_QWORD *)(a1 + 32));
    }
    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(&v45, 8);

  }
  else if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "cleanup");
  }
LABEL_25:

}

void __32___NSCFSocksProxy_handshakeRead__block_invoke_4(uint64_t a1, void *a2, int a3)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v6 = a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;

}

@end
