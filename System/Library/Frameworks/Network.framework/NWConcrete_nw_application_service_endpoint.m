@implementation NWConcrete_nw_application_service_endpoint

- (void)dealloc
{
  char *alias;
  char *application_service;
  char *device_name;
  char *device_model;
  char *contact_id;
  objc_super v8;

  alias = self->alias;
  if (alias)
  {
    free(alias);
    self->alias = 0;
  }
  application_service = self->application_service;
  if (application_service)
  {
    free(application_service);
    self->application_service = 0;
  }
  device_name = self->device_name;
  if (device_name)
  {
    free(device_name);
    self->device_name = 0;
  }
  device_model = self->device_model;
  if (device_model)
  {
    free(device_model);
    self->device_model = 0;
  }
  contact_id = self->contact_id;
  if (contact_id)
  {
    free(contact_id);
    self->contact_id = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)NWConcrete_nw_application_service_endpoint;
  -[NWConcrete_nw_endpoint dealloc](&v8, sel_dealloc);
}

- (unsigned)type
{
  return 6;
}

- (id)copyDictionary
{
  id v3;
  void *v4;
  char *alias;
  char *application_service;
  char *device_name;
  char *device_model;
  char *contact_id;
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NWConcrete_nw_application_service_endpoint;
  v3 = -[NWConcrete_nw_endpoint copyDictionary](&v12, sel_copyDictionary);
  v4 = v3;
  if (v3)
  {
    alias = self->alias;
    if (alias)
      xpc_dictionary_set_string(v3, "application_service_alias", alias);
    application_service = self->application_service;
    if (application_service)
      xpc_dictionary_set_string(v4, "application_service_name", application_service);
    if (!uuid_is_null(self->service_identifier))
      xpc_dictionary_set_uuid(v4, "service_identifier", self->service_identifier);
    device_name = self->device_name;
    if (device_name)
      xpc_dictionary_set_string(v4, "device_name", device_name);
    device_model = self->device_model;
    if (device_model)
      xpc_dictionary_set_string(v4, "device_model", device_model);
    xpc_dictionary_set_int64(v4, "device_color", self->device_color);
    xpc_dictionary_set_int64(v4, "route", self->route);
    contact_id = self->contact_id;
    if (contact_id)
      xpc_dictionary_set_string(v4, "contact_id", contact_id);
    v10 = v4;
  }

  return v4;
}

- (char)createDescription:(BOOL)a3
{
  _BOOL4 v3;
  char *v5;
  unsigned __int8 *service_identifier;
  const char *device_id;
  const char *v8;
  size_t v9;
  char *application_service;
  int is_null;
  int v12;
  const char *v13;
  const char *v14;
  char *v15;
  const char *v16;
  char *v17;
  char *v19;
  char v20[44];
  char v21[42];
  char v22[42];
  char v23[42];
  char v24[41];
  char __str[39];
  uint64_t v26;
  char v27;
  char out[40];
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v5 = (char *)nw_endpoint_copy_interface(self);
  v19 = 0;
  memset(out, 0, 37);
  service_identifier = self->service_identifier;
  uuid_unparse(self->service_identifier, out);
  v27 = 0;
  v26 = 0;
  device_id = (const char *)nw_endpoint_get_device_id(self);
  v8 = device_id;
  if (device_id && v3)
  {
    v9 = strlen(device_id);
    __nwlog_salted_hash(v8, v9, (char *)&v26);
    v8 = (const char *)&v26;
LABEL_5:
    snprintf(__str, 0x27uLL, " id:%s", v8);
    goto LABEL_6;
  }
  if (device_id)
    goto LABEL_5;
  __str[0] = 0;
LABEL_6:
  if (self->device_name)
    snprintf(v24, 0x29uLL, " name:%s", self->device_name);
  else
    v24[0] = 0;
  if (self->device_model)
    snprintf(v23, 0x2AuLL, " model:%s", self->device_model);
  else
    v23[0] = 0;
  if (self->device_color)
    snprintf(v22, 0x2AuLL, " color:%x", self->device_color);
  else
    v22[0] = 0;
  if (self->route)
    snprintf(v21, 0x2AuLL, " route:%d", self->route);
  else
    v21[0] = 0;
  if (self->contact_id)
    snprintf(v20, 0x2CuLL, " contact:%s", self->contact_id);
  else
    v20[0] = 0;
  application_service = self->application_service;
  is_null = uuid_is_null(self->service_identifier);
  v12 = uuid_is_null(service_identifier);
  v13 = v5 + 104;
  v14 = ",";
  if (is_null)
    v14 = "";
  v15 = out;
  if (v12)
    v15 = "";
  v16 = "@";
  if (!v5)
  {
    v16 = "";
    v13 = "";
  }
  asprintf(&v19, "%s%s%s%s%s%s%s%s%s%s%s", application_service, v14, v15, v16, v13, __str, v24, v23, v22, v21, v20);
  v17 = v19;

  return v17;
}

- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  id v7;
  BOOL v8;
  char *alias;
  const char *v11;
  BOOL v12;
  char *application_service;
  const char *v14;
  BOOL v15;
  char *device_name;
  const char *v17;
  BOOL v18;
  char *device_model;
  const char *v20;
  char *contact_id;
  const char *v22;
  objc_super v23;

  v4 = a4;
  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NWConcrete_nw_application_service_endpoint;
  if (!-[NWConcrete_nw_endpoint isEqualToEndpoint:matchFlags:](&v23, sel_isEqualToEndpoint_matchFlags_, v6, v4))
  {
    v8 = 0;
    goto LABEL_6;
  }
  v7 = v6;
  if (uuid_compare(self->service_identifier, (const unsigned __int8 *)v7 + 248))
    goto LABEL_3;
  alias = self->alias;
  v11 = (const char *)*((_QWORD *)v7 + 29);
  if (alias != v11)
  {
    v12 = !alias || v11 == 0;
    if (v12 || strcmp(alias, v11))
      goto LABEL_3;
  }
  application_service = self->application_service;
  v14 = (const char *)*((_QWORD *)v7 + 30);
  if (application_service != v14)
  {
    v15 = !application_service || v14 == 0;
    if (v15 || strcmp(application_service, v14))
      goto LABEL_3;
  }
  device_name = self->device_name;
  v17 = (const char *)*((_QWORD *)v7 + 33);
  if (device_name != v17)
  {
    v18 = !device_name || v17 == 0;
    if (v18 || strcmp(device_name, v17))
      goto LABEL_3;
  }
  device_model = self->device_model;
  v20 = (const char *)*((_QWORD *)v7 + 34);
  if (device_model != v20)
  {
    v8 = 0;
    if (!device_model || !v20)
      goto LABEL_4;
    if (strcmp(device_model, v20))
      goto LABEL_3;
  }
  contact_id = self->contact_id;
  v22 = (const char *)*((_QWORD *)v7 + 36);
  if (contact_id != v22)
  {
    v8 = 0;
    if (!contact_id || !v22)
      goto LABEL_4;
    if (strcmp(contact_id, v22))
      goto LABEL_3;
  }
  if (self->device_color == *((_DWORD *)v7 + 70))
    v8 = self->route == *((_DWORD *)v7 + 71);
  else
LABEL_3:
    v8 = 0;
LABEL_4:

LABEL_6:
  return v8;
}

- (id)copyEndpoint
{
  _BOOL8 v3;
  int device_color;
  int advertised_route;

  v3 = -[NWConcrete_nw_application_service_endpoint initWithApplicationService:alias:serviceUUID:deviceName:deviceModel:contactID:]([NWConcrete_nw_application_service_endpoint alloc], self->application_service, self->alias, self->service_identifier, self->device_name, self->device_model, self->contact_id);
  device_color = nw_endpoint_get_device_color(self);
  nw_endpoint_set_device_color((void *)v3, device_color);
  advertised_route = nw_endpoint_get_advertised_route(self);
  nw_endpoint_set_advertised_route((void *)v3, advertised_route);
  return (id)v3;
}

- (unint64_t)getHash
{
  const void *device_id;
  char *alias;
  CC_LONG v5;
  char *application_service;
  CC_LONG v7;
  char *device_name;
  CC_LONG v9;
  char *device_model;
  CC_LONG v11;
  char *contact_id;
  CC_LONG v13;
  NWConcrete_nw_application_service_endpoint *v14;
  CC_LONG *v15;
  const void *v16;
  CC_LONG v17;
  int8x16_t v18;
  int8x16_t v20;
  int8x16_t v21;
  int advertised_route;
  int data;
  CC_SHA256_CTX c;
  unsigned __int8 md[16];
  int8x16_t v26;
  uuid_t uu;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  memset(uu, 0, sizeof(uu));
  uuid_clear(uu);
  nw_endpoint_get_agent_identifier(self, uu);
  CC_SHA256_Update(&c, uu, 0x10u);
  device_id = (const void *)nw_endpoint_get_device_id(self);
  CC_SHA256_Update(&c, device_id, 8u);
  CC_SHA256_Update(&c, self->service_identifier, 0x10u);
  alias = self->alias;
  if (alias)
  {
    v5 = strlen(self->alias);
    CC_SHA256_Update(&c, alias, v5);
  }
  application_service = self->application_service;
  if (application_service)
  {
    v7 = strlen(self->application_service);
    CC_SHA256_Update(&c, application_service, v7);
  }
  device_name = self->device_name;
  if (device_name)
  {
    v9 = strlen(self->device_name);
    CC_SHA256_Update(&c, device_name, v9);
  }
  device_model = self->device_model;
  if (device_model)
  {
    v11 = strlen(self->device_model);
    CC_SHA256_Update(&c, device_model, v11);
  }
  contact_id = self->contact_id;
  if (contact_id)
  {
    v13 = strlen(self->contact_id);
    CC_SHA256_Update(&c, contact_id, v13);
  }
  v14 = self;
  v15 = v14->super.txt_record;

  if (v15)
  {
    v16 = (const void *)*((_QWORD *)v15 + 1);
    v17 = v15[4];
  }
  else
  {
    v16 = 0;
    v17 = 0;
  }
  CC_SHA256_Update(&c, v16, v17);
  data = nw_endpoint_get_device_color(v14);
  CC_SHA256_Update(&c, &data, 4u);
  advertised_route = nw_endpoint_get_advertised_route(v14);
  CC_SHA256_Update(&c, &advertised_route, 4u);
  CC_SHA256_Final(md, &c);
  v20 = *(int8x16_t *)md;
  v21 = v26;

  v18 = veorq_s8(v20, v21);
  return (unint64_t)veor_s8(*(int8x8_t *)v18.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v18, v18, 8uLL));
}

- (BOOL)initWithApplicationService:(const char *)a3 alias:(const unsigned __int8 *)a4 serviceUUID:(const char *)a5 deviceName:(const char *)a6 deviceModel:(const char *)a7 contactID:
{
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  _BOOL8 result;
  void *v21;
  char *v22;
  NSObject *v23;
  os_log_type_t v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  char *backtrace_string;
  os_log_type_t v30;
  _BOOL4 v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  os_log_type_t v38;
  char v39;
  os_log_type_t type;
  objc_super v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v41.receiver = a1;
  v41.super_class = (Class)NWConcrete_nw_application_service_endpoint;
  v13 = (char *)objc_msgSendSuper2(&v41, sel_init);
  if (!v13)
  {
    __nwlog_obj();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v43 = "-[NWConcrete_nw_application_service_endpoint initWithApplicationService:alias:serviceUUID:deviceName:deviceModel:contactID:]";
    v22 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v39 = 0;
    if (__nwlog_fault(v22, &type, &v39))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = type;
        if (os_log_type_enabled(v23, type))
        {
          *(_DWORD *)buf = 136446210;
          v43 = "-[NWConcrete_nw_application_service_endpoint initWithApplicationService:alias:serviceUUID:deviceName:dev"
                "iceModel:contactID:]";
          _os_log_impl(&dword_182FBE000, v23, v24, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v39)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v23 = objc_claimAutoreleasedReturnValue();
        v30 = type;
        v31 = os_log_type_enabled(v23, type);
        if (backtrace_string)
        {
          if (v31)
          {
            *(_DWORD *)buf = 136446466;
            v43 = "-[NWConcrete_nw_application_service_endpoint initWithApplicationService:alias:serviceUUID:deviceName:d"
                  "eviceModel:contactID:]";
            v44 = 2082;
            v45 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v23, v30, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_51;
        }
        if (v31)
        {
          *(_DWORD *)buf = 136446210;
          v43 = "-[NWConcrete_nw_application_service_endpoint initWithApplicationService:alias:serviceUUID:deviceName:dev"
                "iceModel:contactID:]";
          _os_log_impl(&dword_182FBE000, v23, v30, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v23 = objc_claimAutoreleasedReturnValue();
        v38 = type;
        if (os_log_type_enabled(v23, type))
        {
          *(_DWORD *)buf = 136446210;
          v43 = "-[NWConcrete_nw_application_service_endpoint initWithApplicationService:alias:serviceUUID:deviceName:dev"
                "iceModel:contactID:]";
          _os_log_impl(&dword_182FBE000, v23, v38, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_51:
    if (v22)
      free(v22);
    return 0;
  }
  v14 = v13;
  if (a3)
  {
    v15 = strdup(a3);
    if (!v15)
    {
      __nwlog_obj();
      v25 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 136446210;
      v43 = "strict_strdup";
      v26 = (void *)_os_log_send_and_compose_impl();

      result = __nwlog_abort((uint64_t)v26);
      if (result)
        goto LABEL_54;
      free(v26);
    }
    *((_QWORD *)v14 + 29) = v15;
  }
  if (a2)
  {
    v16 = strdup(a2);
    if (!v16)
    {
      __nwlog_obj();
      v27 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 136446210;
      v43 = "strict_strdup";
      v28 = (void *)_os_log_send_and_compose_impl();

      result = __nwlog_abort((uint64_t)v28);
      if (result)
        goto LABEL_54;
      free(v28);
    }
    *((_QWORD *)v14 + 30) = v16;
  }
  if (!uuid_is_null(a4))
  {
    *(_OWORD *)(v14 + 248) = *(_OWORD *)a4;
    if (!a5)
      goto LABEL_16;
LABEL_13:
    if (*a5)
    {
      v17 = strdup(a5);
      if (!v17)
      {
        __nwlog_obj();
        v32 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
        *(_DWORD *)buf = 136446210;
        v43 = "strict_strdup";
        v33 = (void *)_os_log_send_and_compose_impl();

        result = __nwlog_abort((uint64_t)v33);
        if (result)
          goto LABEL_54;
        free(v33);
      }
      *((_QWORD *)v14 + 33) = v17;
    }
    goto LABEL_16;
  }
  if (a5)
    goto LABEL_13;
LABEL_16:
  if (a6 && *a6)
  {
    v18 = strdup(a6);
    if (!v18)
    {
      __nwlog_obj();
      v34 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 136446210;
      v43 = "strict_strdup";
      v35 = (void *)_os_log_send_and_compose_impl();

      result = __nwlog_abort((uint64_t)v35);
      if (result)
        goto LABEL_54;
      free(v35);
    }
    *((_QWORD *)v14 + 34) = v18;
  }
  if (!a7 || !*a7)
    return (BOOL)v14;
  v19 = strdup(a7);
  if (v19)
    goto LABEL_23;
  __nwlog_obj();
  v36 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
  *(_DWORD *)buf = 136446210;
  v43 = "strict_strdup";
  v37 = (void *)_os_log_send_and_compose_impl();

  result = __nwlog_abort((uint64_t)v37);
  if (!result)
  {
    free(v37);
LABEL_23:
    *((_QWORD *)v14 + 36) = v19;
    return (BOOL)v14;
  }
LABEL_54:
  __break(1u);
  return result;
}

@end
