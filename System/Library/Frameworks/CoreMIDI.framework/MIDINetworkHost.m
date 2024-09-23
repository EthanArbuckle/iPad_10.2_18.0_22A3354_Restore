@implementation MIDINetworkHost

- (MIDINetworkHost)init
{
  MIDINetworkHost *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIDINetworkHost;
  v2 = -[MIDINetworkHost init](&v5, sel_init);
  if (v2)
  {
    v3 = operator new();
    *(_QWORD *)(v3 + 32) = 0;
    *(_OWORD *)v3 = 0u;
    *(_OWORD *)(v3 + 16) = 0u;
    v2->_imp = (void *)v3;
  }
  return v2;
}

- (void)dealloc
{
  id *imp;
  objc_super v4;

  imp = (id *)self->_imp;
  if (imp)
  {

    MEMORY[0x1D826BA98](imp, 0x1080C400F7E8713);
  }
  v4.receiver = self;
  v4.super_class = (Class)MIDINetworkHost;
  -[MIDINetworkHost dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  _QWORD *imp;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<MIDINetworkHost %p \"%@\" "), self, *(_QWORD *)self->_imp);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  imp = self->_imp;
  v5 = imp[1];
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@:%d>"), v3, v5, imp[2]);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = imp[3];
    if (v7)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ netservice '%@'/'%@'>"), v3, v7, imp[4]);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ no address>"), v3);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v6;

  return v8;
}

- (NSString)name
{
  return (NSString *)*(id *)self->_imp;
}

- (NSString)address
{
  return (NSString *)*((id *)self->_imp + 1);
}

- (NSUInteger)port
{
  return *((_QWORD *)self->_imp + 2);
}

- (NSString)netServiceName
{
  return (NSString *)*((id *)self->_imp + 3);
}

- (NSString)netServiceDomain
{
  return (NSString *)*((id *)self->_imp + 4);
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)self->_imp, a3);
}

- (BOOL)hasSameAddressAs:(MIDINetworkHost *)other
{
  MIDINetworkHost *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = other;
  -[MIDINetworkHost address](self, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[MIDINetworkHost netServiceName](self, "netServiceName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[MIDINetworkHost netServiceName](v4, "netServiceName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_13;
      -[MIDINetworkHost netServiceDomain](self, "netServiceDomain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[MIDINetworkHost netServiceDomain](v4, "netServiceDomain");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[MIDINetworkHost netServiceName](self, "netServiceName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[MIDINetworkHost netServiceName](v4, "netServiceName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "isEqualToString:", v13))
          {
            -[MIDINetworkHost netServiceDomain](self, "netServiceDomain");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[MIDINetworkHost netServiceDomain](v4, "netServiceDomain");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v14, "isEqualToString:", v15);

          }
          else
          {
            v10 = 0;
          }

        }
        else
        {
          v10 = 0;
        }
        goto LABEL_19;
      }
      v10 = 0;
    }
    else
    {
      -[MIDINetworkHost address](v4, "address");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        goto LABEL_13;
      -[MIDINetworkHost netServiceName](v4, "netServiceName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0;
      v10 = v8 == 0;
    }
LABEL_20:

    goto LABEL_21;
  }
  v6 = -[MIDINetworkHost port](v4, "port");
  if (v6 == -[MIDINetworkHost port](self, "port"))
  {
    -[MIDINetworkHost address](v4, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[MIDINetworkHost address](self, "address");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIDINetworkHost address](v4, "address");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);
LABEL_19:

      goto LABEL_20;
    }
LABEL_13:
    v10 = 0;
LABEL_21:

    goto LABEL_22;
  }
  v10 = 0;
LABEL_22:

  return v10;
}

- (id)addressAsText
{
  _QWORD *imp;
  uint64_t v3;

  imp = self->_imp;
  v3 = imp[1];
  if (v3)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%u"), v3, imp[2]);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t%@\t%@"), imp[3], imp[4]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)displayName
{
  id *imp;
  uint64_t v4;
  id v5;
  id v6;
  id v7;

  imp = (id *)self->_imp;
  if (*imp && (v4 = objc_msgSend(*imp, "length"), imp = (id *)self->_imp, v4))
  {
    v5 = *imp;
  }
  else
  {
    v6 = imp[3];
    if (v6)
    {
      v5 = v6;
    }
    else
    {
      v7 = imp[1];
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%u"), v7, imp[2]);
        v5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }
    }
  }
  return v5;
}

+ (MIDINetworkHost)hostWithName:(NSString *)name address:(NSString *)address port:(NSUInteger)port
{
  NSString *v7;
  NSString *v8;
  MIDINetworkHost *v9;
  void **imp;
  void *v11;
  NSString *v12;
  void *v13;
  NSString *v14;

  v7 = name;
  v8 = address;
  v9 = objc_alloc_init(MIDINetworkHost);
  imp = (void **)v9->_imp;
  v11 = *imp;
  *imp = v7;
  v12 = v7;

  v13 = imp[1];
  imp[1] = v8;
  v14 = v8;

  imp[2] = (void *)port;
  return v9;
}

+ (MIDINetworkHost)hostWithName:(NSString *)name netServiceName:(NSString *)netServiceName netServiceDomain:(NSString *)netServiceDomain
{
  NSString *v7;
  NSString *v8;
  NSString *v9;
  MIDINetworkHost *v10;
  void **imp;
  void *v12;
  NSString *v13;
  void *v14;
  NSString *v15;
  void *v16;

  v7 = name;
  v8 = netServiceName;
  v9 = netServiceDomain;
  v10 = objc_alloc_init(MIDINetworkHost);
  imp = (void **)v10->_imp;
  v12 = *imp;
  *imp = v7;
  v13 = v7;

  v14 = imp[3];
  imp[3] = v8;
  v15 = v8;

  v16 = imp[4];
  imp[4] = v9;

  return v10;
}

+ (MIDINetworkHost)hostWithName:(NSString *)name netService:(NSNetService *)netService
{
  NSString *v5;
  NSNetService *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = name;
  v6 = netService;
  -[NSNetService name](v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNetService domain](v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MIDINetworkHost hostWithName:netServiceName:netServiceDomain:](MIDINetworkHost, "hostWithName:netServiceName:netServiceDomain:", v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MIDINetworkHost *)v9;
}

+ (id)fromAddressAsText:(id)a3 withName:(id)a4
{
  id v5;
  id v6;
  id v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  void *v12;
  void *v13;
  char *v14;
  char *v15;
  unsigned int v17;

  v5 = a3;
  v6 = a4;
  v7 = objc_retainAutorelease(v5);
  v8 = (char *)objc_msgSend(v7, "UTF8String");
  v9 = v8;
  if (v8)
  {
    if (*v8 == 9)
    {
      v10 = v8 + 1;
      v11 = strchr(v8 + 1, 9);
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v10, v11 - v10, 4);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11 + 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[MIDINetworkHost hostWithName:netServiceName:netServiceDomain:](MIDINetworkHost, "hostWithName:netServiceName:netServiceDomain:", v6, v12, v13);
      v14 = (char *)objc_claimAutoreleasedReturnValue();

LABEL_7:
      goto LABEL_8;
    }
    v17 = 0;
    v15 = strrchr(v8, 58);
    v14 = v15;
    if (v15)
    {
      sscanf(v15 + 1, "%u", &v17);
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v9, v14 - v9, 4);
      +[MIDINetworkHost hostWithName:address:port:](MIDINetworkHost, "hostWithName:address:port:", v6, v12, v17);
      v14 = (char *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_8:

  return v14;
}

@end
