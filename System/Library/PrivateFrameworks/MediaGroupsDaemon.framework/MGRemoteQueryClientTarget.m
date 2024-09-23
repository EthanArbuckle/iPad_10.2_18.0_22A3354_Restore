@implementation MGRemoteQueryClientTarget

+ (MGRemoteQueryClientTarget)targetWithEndpoint:(id)a3 txtRecord:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (nw_endpoint_get_type(v6) == nw_endpoint_type_bonjour_service)
    v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithEndpoint:txtRecord:", v6, v7);
  else
    v8 = 0;

  return (MGRemoteQueryClientTarget *)v8;
}

- (id)_initWithEndpoint:(id)a3 txtRecord:(id)a4
{
  id v7;
  id v8;
  MGRemoteQueryClientTarget *v9;
  MGRemoteQueryClientTarget *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MGRemoteQueryClientTarget;
  v9 = -[MGRemoteQueryClientTarget init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_endpoint, a3);
    v10->_protocolVersion = 0;
    if (!-[MGRemoteQueryClientTarget _parseTXTRecord:](v10, "_parseTXTRecord:", v8))
    {

      v10 = 0;
    }
  }

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MGRemoteQueryClientTarget protocolVersion](self, "protocolVersion");
  -[MGRemoteQueryClientTarget endpoint](self, "endpoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, _protocolVersion=%lu, _endpoint=%@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[MGRemoteQueryClientTarget endpoint](self, "endpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  MGRemoteQueryClientTarget *v4;
  MGRemoteQueryClientTarget *v5;
  MGRemoteQueryClientTarget *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  nw_endpoint_type_t type;
  NSObject *v16;
  char v17;

  v4 = (MGRemoteQueryClientTarget *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  if (self == v4)
  {
    v17 = 1;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = (void *)MEMORY[0x24BDD17C8];
    -[MGRemoteQueryClientTarget endpoint](self, "endpoint");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithUTF8String:", nw_endpoint_get_bonjour_service_name(v8));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDD17C8];
    -[MGRemoteQueryClientTarget endpoint](v6, "endpoint");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithUTF8String:", nw_endpoint_get_bonjour_service_name(v11));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[MGRemoteQueryClientTarget protocolVersion](self, "protocolVersion");
    if (v13 == -[MGRemoteQueryClientTarget protocolVersion](v6, "protocolVersion"))
    {
      -[MGRemoteQueryClientTarget endpoint](self, "endpoint");
      v14 = objc_claimAutoreleasedReturnValue();
      type = nw_endpoint_get_type(v14);
      -[MGRemoteQueryClientTarget endpoint](v6, "endpoint");
      v16 = objc_claimAutoreleasedReturnValue();
      if (type == nw_endpoint_get_type(v16))
        v17 = objc_msgSend(v9, "isEqualToString:", v12);
      else
        v17 = 0;

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
LABEL_7:
    v17 = 0;
  }
LABEL_13:

  return v17;
}

- (BOOL)_parseTXTRecord:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t protocolVersion;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  _QWORD access_value[5];
  _QWORD v18[6];
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint8_t buf[4];
  MGRemoteQueryClientTarget *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 1;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v5 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __45__MGRemoteQueryClientTarget__parseTXTRecord___block_invoke;
  v19[3] = &unk_24E0AAB10;
  v19[4] = &v24;
  v19[5] = &v28;
  -[MGRemoteQueryClientTarget _parseTXTRecord:forVersion:result:](self, "_parseTXTRecord:forVersion:result:", v4, 0x24E0ABEA0, v19);
  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __45__MGRemoteQueryClientTarget__parseTXTRecord___block_invoke_2;
  v18[3] = &unk_24E0AAB10;
  v18[4] = &v20;
  v18[5] = &v28;
  -[MGRemoteQueryClientTarget _parseTXTRecord:forVersion:result:](self, "_parseTXTRecord:forVersion:result:", v4, 0x24E0ABE80, v18);
  if (!*((_BYTE *)v29 + 24))
    goto LABEL_11;
  v6 = v21[3];
  if (v6 <= 1)
    v6 = 1;
  if (v6 <= (v25[3] != 0))
  {
    self->_protocolVersion = 1;
    MGLogForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[MGRemoteQueryClientTarget endpoint](self, "endpoint");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      protocolVersion = self->_protocolVersion;
      v13 = v21[3];
      v14 = v25[3];
      *(_DWORD *)buf = 134219522;
      v33 = self;
      v34 = 2112;
      v35 = v11;
      v36 = 2048;
      v37 = protocolVersion;
      v38 = 2048;
      v39 = v13;
      v40 = 2048;
      v41 = v14;
      v42 = 2048;
      v43 = 1;
      v44 = 2048;
      v45 = 1;
      _os_log_impl(&dword_21CBD2000, v7, OS_LOG_TYPE_DEFAULT, "%p target %@ compatible version using %lu, peer(%lu->%lu) me(%lu->%lu)", buf, 0x48u);

    }
  }
  else
  {
    *((_BYTE *)v29 + 24) = 0;
    MGLogForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[MGRemoteQueryClientTarget endpoint](self, "endpoint");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v21[3];
      v10 = v25[3];
      *(_DWORD *)buf = 134219266;
      v33 = self;
      v34 = 2112;
      v35 = v8;
      v36 = 2048;
      v37 = v9;
      v38 = 2048;
      v39 = v10;
      v40 = 2048;
      v41 = 1;
      v42 = 2048;
      v43 = 1;
      _os_log_error_impl(&dword_21CBD2000, v7, OS_LOG_TYPE_ERROR, "%p target %@ incompatible version, peer(%lu->%lu) me(%lu->%lu)", buf, 0x3Eu);

    }
  }

  if (*((_BYTE *)v29 + 24))
  {
    access_value[0] = v5;
    access_value[1] = 3221225472;
    access_value[2] = __45__MGRemoteQueryClientTarget__parseTXTRecord___block_invoke_2;
    access_value[3] = &unk_24E0AAB38;
    access_value[4] = self;
    nw_txt_record_access_key(v4, (const char *)objc_msgSend(CFSTR("h"), "UTF8String"), access_value);
    v15 = *((_BYTE *)v29 + 24) != 0;
  }
  else
  {
LABEL_11:
    v15 = 0;
  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v15;
}

uint64_t __45__MGRemoteQueryClientTarget__parseTXTRecord___block_invoke(uint64_t result, char a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3;
  if ((a2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 0;
  return result;
}

uint64_t __45__MGRemoteQueryClientTarget__parseTXTRecord___block_invoke_2(uint64_t result, char a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3;
  if ((a2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 0;
  return result;
}

uint64_t __45__MGRemoteQueryClientTarget__parseTXTRecord___block_invoke_2(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  BOOL v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = a3 != 4 || a5 == 0;
  v6 = !v5;
  if (!v5)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a4, a5, 4);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 24);
    *(_QWORD *)(v9 + 24) = v8;

  }
  return v6;
}

- (void)_parseTXTRecord:(id)a3 forVersion:(id)a4 result:(id)a5
{
  NSObject *v7;
  id v8;
  void (**v9)(id, _BOOL8, _QWORD);
  id v10;
  const char *v11;
  _BOOL8 v12;
  _QWORD access_value[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _BOOL8, _QWORD))a5;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = objc_retainAutorelease(v8);
  v11 = (const char *)objc_msgSend(v10, "UTF8String");
  access_value[0] = MEMORY[0x24BDAC760];
  access_value[1] = 3221225472;
  access_value[2] = __63__MGRemoteQueryClientTarget__parseTXTRecord_forVersion_result___block_invoke;
  access_value[3] = &unk_24E0AAB60;
  access_value[4] = &v14;
  v12 = nw_txt_record_access_key(v7, v11, access_value);
  v9[2](v9, v12, v15[3]);
  _Block_object_dispose(&v14, 8);

}

BOOL __63__MGRemoteQueryClientTarget__parseTXTRecord_forVersion_result___block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL8 result;

  result = 0;
  if (a3 == 4)
  {
    if (a5)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a4, a5, 4);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v6, "longLongValue"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v7, "unsignedIntegerValue");
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

      if (v8)
        return 1;
    }
  }
  return result;
}

- (OS_nw_endpoint)endpoint
{
  return self->_endpoint;
}

- (unint64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (NSString)homeHash
{
  return self->_homeHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeHash, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end
