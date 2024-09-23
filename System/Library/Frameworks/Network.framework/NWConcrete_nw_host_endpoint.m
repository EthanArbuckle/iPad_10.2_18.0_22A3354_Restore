@implementation NWConcrete_nw_host_endpoint

- (char)createDescription:(BOOL)a3
{
  _BOOL4 v3;
  char *hostname;
  char *v6;
  const char *v7;
  NWConcrete_nw_host_endpoint *v8;
  unsigned int alternate_port;
  const char *v10;
  unsigned int v11;
  const char *v12;
  unsigned int v13;
  const char *v14;
  char *v15;
  char *v17;
  char v18;
  char __str[18];
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  hostname = self->hostname;
  v6 = (char *)nw_endpoint_copy_interface(self);
  if (v3)
  {
    v18 = 0;
    v17 = 0;
    v7 = __nwlog_salted_hostname_hash(self->hostname, (char *)&v17);
    hostname = __str;
    snprintf(__str, 0x12uLL, "%s%s", "Hostname#", v7);
  }
  v17 = 0;
  v8 = self;
  alternate_port = v8->super.alternate_port;

  v10 = v6 + 104;
  v11 = bswap32(v8->port) >> 16;
  v12 = "/";
  if (!alternate_port)
    v12 = "";
  v13 = __rev16(alternate_port);
  v14 = "@";
  if (!v6)
  {
    v14 = "";
    v10 = "";
  }
  asprintf(&v17, "%s:%u%s%.0d%s%s", hostname, v11, v12, v13, v14, v10);
  v15 = v17;

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->ech_config, 0);
}

- (unsigned)type
{
  return 2;
}

- (unint64_t)getHash
{
  char *hostname;
  CC_LONG v4;
  int8x16_t v5;
  CC_SHA256_CTX v7;
  unsigned __int8 md[16];
  int8x16_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  memset(&v7, 0, sizeof(v7));
  CC_SHA256_Init(&v7);
  CC_SHA256_Update(&v7, &self->port, 2u);
  hostname = self->hostname;
  v4 = strlen(hostname);
  CC_SHA256_Update(&v7, hostname, v4);
  CC_SHA256_Final(md, &v7);
  v5 = veorq_s8(*(int8x16_t *)md, v9);
  return (unint64_t)veor_s8(*(int8x8_t *)v5.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL));
}

- (void)dealloc
{
  char *hostname;
  objc_super v4;

  hostname = self->hostname;
  if (hostname)
  {
    free(hostname);
    self->hostname = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NWConcrete_nw_host_endpoint;
  -[NWConcrete_nw_endpoint dealloc](&v4, sel_dealloc);
}

- (const)domainForPolicy
{
  return self->hostname;
}

- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4
{
  uint64_t v4;
  const char **v6;
  BOOL v7;
  objc_super v9;

  v4 = a4;
  v6 = (const char **)a3;
  v9.receiver = self;
  v9.super_class = (Class)NWConcrete_nw_host_endpoint;
  v7 = -[NWConcrete_nw_endpoint isEqualToEndpoint:matchFlags:](&v9, sel_isEqualToEndpoint_matchFlags_, v6, v4)
    && !strcmp(self->hostname, v6[29])
    && self->port == *((unsigned __int16 *)v6 + 120);

  return v7;
}

- (void)setPriority:(unsigned __int16)a3
{
  self->priority = a3;
}

- (const)hostname
{
  return self->hostname;
}

- (unsigned)port
{
  return self->port;
}

- (id)copyEndpoint
{
  id *v3;

  v3 = (id *)(id)nw_endpoint_create_host_with_numeric_port(self->hostname, bswap32(self->port) >> 16);
  objc_storeStrong(v3 + 31, self->ech_config);

  return v3;
}

- (id)copyDictionary
{
  id v3;
  void *v4;
  char *hostname;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NWConcrete_nw_host_endpoint;
  v3 = -[NWConcrete_nw_endpoint copyDictionary](&v8, sel_copyDictionary);
  v4 = v3;
  if (v3)
  {
    hostname = self->hostname;
    if (hostname)
      xpc_dictionary_set_string(v3, "hostname", hostname);
    xpc_dictionary_set_uint64(v4, "port", self->port);
    v6 = v4;
  }

  return v4;
}

- (unsigned)priority
{
  return self->priority;
}

- (unsigned)weight
{
  return self->weight;
}

- (void)setWeight:(unsigned __int16)a3
{
  self->weight = a3;
}

- (id)echConfig
{
  return self->ech_config;
}

- (void)setEchConfig:(id)a3
{
  objc_storeStrong((id *)&self->ech_config, a3);
}

@end
