@implementation CRKRemoteEndpoint

- (CRKRemoteEndpoint)init
{
  return -[CRKRemoteEndpoint initWithIPAddress:port:](self, "initWithIPAddress:port:", CFSTR("0.0.0.0"), 0);
}

- (CRKRemoteEndpoint)initWithIPAddress:(id)a3 port:(unsigned __int16)a4
{
  id v6;
  CRKRemoteEndpoint *v7;
  uint64_t v8;
  NSString *IPAddress;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKRemoteEndpoint;
  v7 = -[CRKRemoteEndpoint init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    IPAddress = v7->_IPAddress;
    v7->_IPAddress = (NSString *)v8;

    v7->_port = a4;
  }

  return v7;
}

- (NSString)stringValue
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CRKRemoteEndpoint IPAddress](self, "IPAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%d"), v4, -[CRKRemoteEndpoint port](self, "port"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CRKRemoteEndpoint IPAddress](self, "IPAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { IPAddress = %@, port = %d }>"), v4, self, v5, -[CRKRemoteEndpoint port](self, "port"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[CRKRemoteEndpoint IPAddress](self, "IPAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ -[CRKRemoteEndpoint port](self, "port");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  CRKRemoteEndpoint *v4;
  void *v5;
  void *v6;
  id v7;
  CRKRemoteEndpoint *v8;
  CRKRemoteEndpoint *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  CRKRemoteEndpoint *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  BOOL v21;
  id v23;
  CRKRemoteEndpoint *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = (CRKRemoteEndpoint *)a3;
  if (v4 == self)
  {
    v21 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(CFSTR("IPAddress, port"), "componentsSeparatedByString:", CFSTR(","));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "mutableCopy");

      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __crk_tokenized_properties_block_invoke_6;
      v29[3] = &unk_24D9C7230;
      v7 = v6;
      v30 = v7;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v29);

      v8 = self;
      v9 = v4;
      v10 = v7;
      if (-[CRKRemoteEndpoint isMemberOfClass:](v9, "isMemberOfClass:", objc_opt_class()))
      {
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v12)
        {
          v13 = v12;
          v23 = v10;
          v24 = v4;
          v14 = *(_QWORD *)v26;
          while (2)
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v26 != v14)
                objc_enumerationMutation(v11);
              v16 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * i);
              v17 = v9;
              -[CRKRemoteEndpoint valueForKey:](v8, "valueForKey:", v16);
              v18 = objc_claimAutoreleasedReturnValue();
              -[CRKRemoteEndpoint valueForKey:](v17, "valueForKey:", v16);
              v19 = objc_claimAutoreleasedReturnValue();

              if (v18 | v19)
              {
                v20 = objc_msgSend((id)v18, "isEqual:", v19);

                if (!v20)
                {
                  v21 = 0;
                  goto LABEL_18;
                }
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
            if (v13)
              continue;
            break;
          }
          v21 = 1;
LABEL_18:
          v10 = v23;
          v4 = v24;
        }
        else
        {
          v21 = 1;
        }

      }
      else
      {
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }
  }

  return v21;
}

- (NSString)IPAddress
{
  return self->_IPAddress;
}

- (unsigned)port
{
  return self->_port;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_IPAddress, 0);
}

@end
