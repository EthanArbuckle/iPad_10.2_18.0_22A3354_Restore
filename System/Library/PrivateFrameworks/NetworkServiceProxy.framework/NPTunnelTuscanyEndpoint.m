@implementation NPTunnelTuscanyEndpoint

+ (unsigned)endpointType
{
  return 2000;
}

- (NPTunnelTuscanyEndpoint)initWithHosts:(id)a3
{
  id v5;
  void *v6;
  NPTunnelTuscanyEndpoint *v7;
  id *p_isa;
  NPTunnelTuscanyEndpoint *v9;
  objc_super v11;

  v5 = a3;
  +[NPTunnelTuscanyEndpoint encodeHosts:](NPTunnelTuscanyEndpoint, "encodeHosts:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v11.receiver = self;
    v11.super_class = (Class)NPTunnelTuscanyEndpoint;
    v7 = -[NWEndpoint initWithEncodedData:](&v11, sel_initWithEncodedData_, v6);
    p_isa = (id *)&v7->super.super.isa;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_hosts, a3);
      objc_storeStrong(p_isa + 3, v6);
    }
    self = p_isa;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NPTunnelTuscanyEndpoint)initWithEncodedData:(id)a3
{
  id v4;
  NPTunnelTuscanyEndpoint *v5;
  id v6;
  unsigned __int8 *v7;
  uint64_t v8;
  NSArray *v9;
  unsigned __int8 *v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  int v15;
  void *v18;
  uint64_t v19;
  NSArray *hosts;
  NSArray *v21;
  NPTunnelTuscanyEndpoint *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NPTunnelTuscanyEndpoint;
  v5 = -[NWEndpoint initWithEncodedData:](&v24, sel_initWithEncodedData_, v4);
  if (!v5)
    goto LABEL_29;
  if (!objc_msgSend(v4, "length"))
  {
    v9 = 0;
LABEL_31:

    v22 = 0;
    goto LABEL_32;
  }
  v6 = objc_retainAutorelease(v4);
  v7 = (unsigned __int8 *)objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  v9 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v8 >= 1)
  {
    v10 = &v7[v8];
    do
    {
      v11 = v10 - v7;
      v12 = *v7;
      if (*v7)
        v13 = v11 >= 0x10;
      else
        v13 = 0;
      if (!v13 || v11 < v12)
        break;
      v15 = v7[1];
      if (v15 == 30)
      {
        if (v12 < 0x1C || v11 < 0x1C)
          break;
      }
      else if (v15 != 2 || v12 < 0x10)
      {
        break;
      }
      objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithAddress:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
        -[NSArray addObject:](v9, "addObject:", v18);
      v19 = *v7;

      v7 += v19;
    }
    while (v7 < v10);
  }
  if (!-[NSArray count](v9, "count"))
    goto LABEL_31;
  hosts = v5->_hosts;
  v5->_hosts = v9;
  v21 = v9;

  objc_storeStrong((id *)&v5->_hostsData, v6);
LABEL_29:
  v22 = v5;
LABEL_32:

  return v22;
}

- (id)encodedData
{
  return self->_hostsData;
}

+ (id)encodeHosts:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "addressData", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendData:", v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "length"))
    v12 = v4;
  else
    v12 = 0;

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("( "));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NPTunnelTuscanyEndpoint hosts](self, "hosts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("%@ "), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR(")"));
  return v3;
}

+ (BOOL)supportsResolverCallback
{
  return 1;
}

- (void)resolveEndpointWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, uint64_t);
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, uint64_t))a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    nplog_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      -[NPTunnelTuscanyEndpoint hosts](self, "hosts");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_debug_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_DEBUG, "Tuscany endpoint resolve custom endpoint %@", (uint8_t *)&v10, 0xCu);

    }
  }
  -[NPTunnelTuscanyEndpoint hosts](self, "hosts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v8, 1);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPTunnelTuscanyEndpoint)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  NPTunnelTuscanyEndpoint *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EncodedData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[NPTunnelTuscanyEndpoint initWithEncodedData:](self, "initWithEncodedData:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_hostsData, CFSTR("EncodedData"));
}

- (id)copyHostsWithPort:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NPTunnelTuscanyEndpoint *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v19 = self;
  -[NPTunnelTuscanyEndpoint hosts](self, "hosts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        v11 = *(id *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = (void *)MEMORY[0x1E0CCEC58];
          objc_msgSend(v11, "hostname");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "endpointWithHostname:port:", v13, v4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v8)
          {
            v15 = objc_alloc(MEMORY[0x1E0C99DE8]);
            -[NPTunnelTuscanyEndpoint hosts](v19, "hosts");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = (void *)objc_msgSend(v15, "initWithCapacity:", objc_msgSend(v16, "count"));

          }
          objc_msgSend(v8, "addObject:", v14);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v8);
  return v17;
}

- (NSArray)hosts
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)hostsData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostsData, 0);
  objc_storeStrong((id *)&self->_hosts, 0);
}

@end
