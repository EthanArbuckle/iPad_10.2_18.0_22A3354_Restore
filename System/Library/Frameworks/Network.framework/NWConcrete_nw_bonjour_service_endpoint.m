@implementation NWConcrete_nw_bonjour_service_endpoint

- (void)dealloc
{
  char *service_name;
  char *service_type;
  char *service_domain;
  char *service_composite;
  objc_super v7;

  service_name = self->service_name;
  if (service_name)
  {
    free(service_name);
    self->service_name = 0;
  }
  service_type = self->service_type;
  if (service_type)
  {
    free(service_type);
    self->service_type = 0;
  }
  service_domain = self->service_domain;
  if (service_domain)
  {
    free(service_domain);
    self->service_domain = 0;
  }
  service_composite = self->service_composite;
  if (service_composite)
  {
    free(service_composite);
    self->service_composite = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)NWConcrete_nw_bonjour_service_endpoint;
  -[NWConcrete_nw_endpoint dealloc](&v7, sel_dealloc);
}

- (unsigned)type
{
  return 3;
}

- (id)copyDictionary
{
  id v3;
  void *v4;
  char *service_name;
  char *service_type;
  char *service_domain;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NWConcrete_nw_bonjour_service_endpoint;
  v3 = -[NWConcrete_nw_endpoint copyDictionary](&v10, sel_copyDictionary);
  v4 = v3;
  if (v3)
  {
    service_name = self->service_name;
    if (service_name)
      xpc_dictionary_set_string(v3, "bonjour_name", service_name);
    service_type = self->service_type;
    if (service_type)
      xpc_dictionary_set_string(v4, "bonjour_type", service_type);
    service_domain = self->service_domain;
    if (service_domain)
      xpc_dictionary_set_string(v4, "bonjour_domain", service_domain);
    v8 = v4;
  }

  return v4;
}

- (const)domainForPolicy
{
  return self->service_composite;
}

- (char)createDescription:(BOOL)a3
{
  char *service_composite;
  size_t v5;
  NWConcrete_nw_bonjour_service_endpoint *v6;
  char *v7;
  const char *v8;
  const char *v9;
  char *v10;
  char *v12;
  char v13;
  char __str[17];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  service_composite = self->service_composite;
  if (a3)
  {
    v13 = 0;
    v12 = 0;
    v5 = strlen(service_composite);
    __nwlog_salted_hash(service_composite, v5, (char *)&v12);
    service_composite = __str;
    snprintf(__str, 0x11uLL, "%s%s", "Bonjour#", (const char *)&v12);
  }
  v6 = self;
  v7 = v6->super.interface;

  v8 = v7 + 104;
  v9 = "@";
  if (!v7)
  {
    v9 = "";
    v8 = "";
  }
  v12 = 0;
  asprintf(&v12, "%s%s%s", service_composite, v9, v8);
  v10 = v12;

  return v10;
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
  v9.super_class = (Class)NWConcrete_nw_bonjour_service_endpoint;
  v7 = -[NWConcrete_nw_endpoint isEqualToEndpoint:matchFlags:](&v9, sel_isEqualToEndpoint_matchFlags_, v6, v4)
    && strcmp(self->service_composite, v6[32]) == 0;

  return v7;
}

- (id)copyEndpoint
{
  return nw_endpoint_create_bonjour_service(self->service_name, self->service_type, self->service_domain);
}

- (unint64_t)getHash
{
  char *service_composite;
  CC_LONG v4;
  int8x16_t v5;
  CC_SHA256_CTX v7;
  unsigned __int8 md[16];
  int8x16_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  memset(&v7, 0, sizeof(v7));
  CC_SHA256_Init(&v7);
  service_composite = self->service_composite;
  v4 = strlen(service_composite);
  CC_SHA256_Update(&v7, service_composite, v4);
  CC_SHA256_Final(md, &v7);
  v5 = veorq_s8(*(int8x16_t *)md, v9);
  return (unint64_t)veor_s8(*(int8x8_t *)v5.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL));
}

@end
