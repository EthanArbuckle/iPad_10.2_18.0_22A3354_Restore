@implementation NWConcrete_nw_endpoint

- (id).cxx_construct
{
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 19) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->endpoint_edges, 0);
  objc_storeStrong((id *)&self->registrar, 0);
  objc_storeStrong((id *)&self->signature, 0);
  objc_storeStrong((id *)&self->txt_record, 0);

  objc_storeStrong((id *)&self->cname_array, 0);
  objc_storeStrong((id *)&self->parent_endpoint, 0);
  objc_storeStrong((id *)&self->ns_redacted_description, 0);
  objc_storeStrong((id *)&self->ns_description, 0);
  objc_storeStrong((id *)&self->public_keys, 0);
  objc_storeStrong((id *)&self->interface, 0);
  objc_storeStrong((id *)&self->context, 0);
}

- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4
{
  uint64_t v4;
  nw_txt_record_t *v6;
  unsigned int v7;
  OS_nw_interface *interface;
  nw_txt_record_t v9;
  nw_endpoint_alterative_s *tqh_first;
  unint64_t v11;
  nw_txt_record_t v12;
  OS_xpc_object *v13;
  OS_xpc_object *v14;
  OS_xpc_object *v15;
  BOOL v16;
  nw_txt_record_t *v17;
  int v18;
  int v19;
  NWConcrete_nw_endpoint *parent_endpoint;
  NSObject *v21;
  void *v22;
  _BOOL4 v23;
  NWConcrete_nw_endpoint *endpoint;
  char v25;
  NWConcrete_nw_endpoint *v26;
  NSObject *v27;
  void *v28;
  NWConcrete_nw_endpoint *v29;
  nw_txt_record_t *v30;
  const char *device_id;
  const char *v32;
  unsigned __int8 *v34;
  uint64_t v35;
  uuid_t uu2;
  unsigned __int8 uu[24];
  uint64_t v38;

  v4 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  v6 = (nw_txt_record_t *)a3;
  v7 = -[NWConcrete_nw_endpoint type](self, "type");
  if (v7 != -[nw_txt_record_t type](v6, "type"))
    goto LABEL_49;
  if ((v4 & 1) != 0)
  {
    interface = self->interface;
    if (interface)
      LODWORD(interface) = *((_DWORD *)interface + 2);
    v9 = v6[2];
    if (v9)
      LODWORD(v9) = v9[1].isa;
    if ((_DWORD)interface != (_DWORD)v9 || self->interface_type != *((_DWORD *)v6 + 6))
      goto LABEL_49;
  }
  if (!nw_txt_record_is_equal((nw_txt_record_t)self->txt_record, v6[23]))
    goto LABEL_49;
  if ((v4 & 2) != 0)
  {
    v12 = v6[24];
    v13 = self->signature;
    v14 = v12;
    v15 = v14;
    v16 = v13 == v14;
    if (v13 != v14 && v13 && v14)
      v16 = xpc_equal(v13, v14);

    if (!v16)
      goto LABEL_49;
    v17 = (nw_txt_record_t *)v6[14];
    if (v17 || self->parent_endpoint)
    {
      v18 = *((unsigned __int8 *)v6 + 231);
      v19 = *((unsigned __int8 *)self + 231);
      if (((v18 | v19) & 2) == 0)
        goto LABEL_64;
      if (((v19 ^ v18) & 2) != 0)
        goto LABEL_49;
      if ((v4 & 4) != 0)
      {
LABEL_64:
        if (!v17)
          goto LABEL_49;
        parent_endpoint = self->parent_endpoint;
        if (!parent_endpoint)
          goto LABEL_49;
        if (v17 == v6 || parent_endpoint == self)
        {
          __nwlog_obj();
          v21 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
          *(_DWORD *)uu = 136446210;
          *(_QWORD *)&uu[4] = "-[NWConcrete_nw_endpoint isEqualToEndpoint:matchFlags:]";
          LODWORD(v35) = 12;
          v34 = uu;
          v22 = (void *)_os_log_send_and_compose_impl();

          v23 = __nwlog_abort((uint64_t)v22);
          if (v23)
          {
LABEL_60:
            __break(1u);
            return v23;
          }
          free(v22);
          v17 = (nw_txt_record_t *)v6[14];
          parent_endpoint = self->parent_endpoint;
        }
        if (!-[nw_txt_record_t isEqualToEndpoint:matchFlags:](v17, "isEqualToEndpoint:matchFlags:", parent_endpoint, v4, v34, v35))goto LABEL_49;
      }
    }
  }
  if ((v4 & 8) != 0)
  {
    tqh_first = self->alternative_list.tqh_first;
    v11 = (unint64_t)v6[20];
    if (v11 | (unint64_t)tqh_first)
    {
      while (1)
      {
        v25 = 0;
        if (!v11 || !tqh_first)
          goto LABEL_50;
        if (*(OS_nw_protocol_definition **)(v11 + 24) != tqh_first->applicable_protocol)
          goto LABEL_49;
        v26 = *(NWConcrete_nw_endpoint **)(v11 + 16);
        if (v26 == (NWConcrete_nw_endpoint *)v6 || (endpoint = tqh_first->endpoint, endpoint == self))
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v27 = (id)gLogObj;
          os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
          *(_DWORD *)uu = 136446210;
          *(_QWORD *)&uu[4] = "-[NWConcrete_nw_endpoint isEqualToEndpoint:matchFlags:]";
          v28 = (void *)_os_log_send_and_compose_impl();

          v23 = __nwlog_abort((uint64_t)v28);
          if (v23)
            goto LABEL_60;
          free(v28);
          v26 = *(NWConcrete_nw_endpoint **)(v11 + 16);
          endpoint = tqh_first->endpoint;
        }
        if (v26 == (NWConcrete_nw_endpoint *)&__block_literal_global_6232)
          goto LABEL_33;
        if (endpoint == (NWConcrete_nw_endpoint *)&__block_literal_global_6232)
          break;
        if (!-[NWConcrete_nw_endpoint isEqualToEndpoint:matchFlags:](v26, "isEqualToEndpoint:matchFlags:", endpoint, v4))goto LABEL_49;
LABEL_34:
        tqh_first = tqh_first->chain.tqe_next;
        v11 = *(_QWORD *)v11;
        if (!(v11 | (unint64_t)tqh_first))
          goto LABEL_46;
      }
      endpoint = (NWConcrete_nw_endpoint *)&__block_literal_global_6232;
LABEL_33:
      if (v26 != endpoint)
        goto LABEL_49;
      goto LABEL_34;
    }
LABEL_46:
    if (*((unsigned __int16 *)v6 + 114) != self->alternate_port)
      goto LABEL_49;
  }
  if ((*((unsigned __int8 *)self + 231) ^ *((unsigned __int8 *)v6 + 231)) > 0x3F)
    goto LABEL_49;
  memset(uu, 0, 16);
  uuid_clear(uu);
  v29 = self;
  *(_OWORD *)uu = *(_OWORD *)v29->agent_identifier;

  memset(uu2, 0, sizeof(uu2));
  uuid_clear(uu2);
  v30 = v6;
  *(_OWORD *)uu2 = *(_OWORD *)((char *)v30 + 28);

  if (uuid_compare(uu, uu2))
    goto LABEL_49;
  device_id = v29->device_id;
  v32 = (const char *)v30[13];
  if (device_id != v32 && device_id && v32)
  {
    if (strcmp(device_id, v32))
      goto LABEL_49;
  }
  else if (device_id != v32)
  {
    goto LABEL_49;
  }
  if ((v4 & 0x10) == 0 || nw_nsarray_is_equal(v29->public_keys, (NSArray *)v30[6]))
  {
    v25 = 1;
    goto LABEL_50;
  }
LABEL_49:
  v25 = 0;
LABEL_50:

  LOBYTE(v23) = v25;
  return v23;
}

- (void)dealloc
{
  uint64_t v3;
  nw_hash_table *associations;
  NSObject *v5;
  void *v6;
  char *known_tracker_name;
  char *tracker_owner;
  char *device_id;
  OS_nw_protocol_instance_registrar *registrar;
  uint64_t v11;
  objc_super v12;
  _QWORD v13[5];
  _QWORD v14[5];
  int v15;
  const char *v16;
  __int16 v17;
  const char *logging_description;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  nw_endpoint_clear_alternatives(self);
  associations = self->associations;
  if (associations)
  {
    if (!*((_DWORD *)associations + 10))
      goto LABEL_5;
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    v15 = 136446466;
    v16 = "-[NWConcrete_nw_endpoint dealloc]";
    v17 = 2082;
    logging_description = nw_endpoint_get_logging_description(self);
    v6 = (void *)_os_log_send_and_compose_impl();

    if (__nwlog_abort((uint64_t)v6))
    {
      __break(1u);
      return;
    }
    free(v6);
    associations = self->associations;
    if (associations)
    {
LABEL_5:
      _nw_hash_table_release((os_unfair_lock_s *)associations, v3);
      self->associations = 0;
    }
  }
  known_tracker_name = self->known_tracker_name;
  if (known_tracker_name)
  {
    free(known_tracker_name);
    self->known_tracker_name = 0;
  }
  tracker_owner = self->tracker_owner;
  if (tracker_owner)
  {
    free(tracker_owner);
    self->tracker_owner = 0;
  }
  device_id = self->device_id;
  if (device_id)
  {
    free(device_id);
    self->device_id = 0;
  }
  registrar = self->registrar;
  self->registrar = 0;

  v11 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __33__NWConcrete_nw_endpoint_dealloc__block_invoke;
  v14[3] = &unk_1E14ACFD0;
  v14[4] = self;
  nw_endpoint_locked(self, v14);
  v13[0] = v11;
  v13[1] = 3221225472;
  v13[2] = __33__NWConcrete_nw_endpoint_dealloc__block_invoke_2;
  v13[3] = &unk_1E14ACFD0;
  v13[4] = self;
  os_unfair_lock_lock(&self->description_lock);
  __33__NWConcrete_nw_endpoint_dealloc__block_invoke_2((uint64_t)v13);
  os_unfair_lock_unlock(&self->description_lock);
  v12.receiver = self;
  v12.super_class = (Class)NWConcrete_nw_endpoint;
  -[NWConcrete_nw_endpoint dealloc](&v12, sel_dealloc);
}

- (const)domainForPolicy
{
  return 0;
}

- (NWConcrete_nw_endpoint)init
{
  NWConcrete_nw_endpoint *v2;
  NWConcrete_nw_endpoint *v3;
  OS_nw_context *context;
  OS_nw_array *cname_array;
  NWConcrete_nw_endpoint *endpoint;
  OS_nw_protocol_definition *applicable_protocol;
  NWConcrete_nw_endpoint *v8;
  void *v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  char *backtrace_string;
  os_log_type_t v15;
  _BOOL4 v16;
  os_log_type_t v17;
  char v18;
  os_log_type_t type;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)NWConcrete_nw_endpoint;
  v2 = -[NWConcrete_nw_endpoint init](&v20, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->alternative_list.tqh_first = 0;
    v2->alternative_list.tqh_last = &v2->alternative_list.tqh_first;
    *(_QWORD *)&v2->endpoint_lock._os_unfair_lock_opaque = 0;
    context = v2->context;
    v2->context = 0;

    cname_array = v3->cname_array;
    v3->cname_array = 0;

    v3->selected_key = 0;
    *((_BYTE *)v3 + 231) &= 0xC3u;
    endpoint = v3->first_alternative.endpoint;
    v3->first_alternative.endpoint = 0;

    applicable_protocol = v3->first_alternative.applicable_protocol;
    v3->first_alternative.applicable_protocol = 0;

    v8 = v3;
    goto LABEL_3;
  }
  __nwlog_obj();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v22 = "-[NWConcrete_nw_endpoint init]";
  v11 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v18 = 0;
  if (__nwlog_fault(v11, &type, &v18))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWConcrete_nw_endpoint init]";
        _os_log_impl(&dword_182FBE000, v12, v13, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v18)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      v15 = type;
      v16 = os_log_type_enabled(v12, type);
      if (backtrace_string)
      {
        if (v16)
        {
          *(_DWORD *)buf = 136446466;
          v22 = "-[NWConcrete_nw_endpoint init]";
          v23 = 2082;
          v24 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v12, v15, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }
      if (v16)
      {
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWConcrete_nw_endpoint init]";
        _os_log_impl(&dword_182FBE000, v12, v15, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      v17 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWConcrete_nw_endpoint init]";
        _os_log_impl(&dword_182FBE000, v12, v17, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }

  }
LABEL_20:
  if (v11)
    free(v11);
LABEL_3:

  return v3;
}

- (unsigned)weight
{
  return 0;
}

- (NSString)description
{
  os_unfair_lock_s *p_description_lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6403;
  v10 = __Block_byref_object_dispose__6404;
  v11 = 0;
  p_description_lock = &self->description_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__NWConcrete_nw_endpoint_description__block_invoke;
  v5[3] = &unk_1E14ACE40;
  v5[4] = self;
  v5[5] = &v6;
  os_unfair_lock_lock(&self->description_lock);
  __37__NWConcrete_nw_endpoint_description__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_description_lock);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (id)redactedDescription
{
  id v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if (nw_endpoint_get_do_not_redact(self))
  {
    -[NWConcrete_nw_endpoint description](self, "description");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x3032000000;
    v9 = __Block_byref_object_copy__6403;
    v10 = __Block_byref_object_dispose__6404;
    v11 = 0;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __45__NWConcrete_nw_endpoint_redactedDescription__block_invoke;
    v5[3] = &unk_1E14ACE40;
    v5[4] = self;
    v5[5] = &v6;
    os_unfair_lock_lock(&self->description_lock);
    __45__NWConcrete_nw_endpoint_redactedDescription__block_invoke((uint64_t)v5);
    os_unfair_lock_unlock(&self->description_lock);
    v4 = (id)v7[5];
    _Block_object_dispose(&v6, 8);

    return v4;
  }
}

- (id)copyDictionary
{
  xpc_object_t v3;
  OS_nw_interface *interface;
  void *v5;
  OS_nw_txt_record *txt_record;
  OS_xpc_object *signature;
  char *device_id;
  NSArray *public_keys;
  NSArray *v10;
  xpc_object_t empty;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  xpc_object_t v16;
  id v17;
  id v18;
  char *v19;
  NSObject *v20;
  os_log_type_t v21;
  char *backtrace_string;
  os_log_type_t v23;
  _BOOL4 v24;
  os_log_type_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  char v31;
  os_log_type_t type;
  uint8_t v33[128];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = xpc_dictionary_create(0, 0, 0);
  if (v3)
  {
    xpc_dictionary_set_uint64(v3, "type", -[NWConcrete_nw_endpoint type](self, "type"));
    if ((*((_BYTE *)self + 231) & 1) != 0)
      xpc_dictionary_set_BOOL(v3, "is_local_domain", 1);
    interface = self->interface;
    if (interface)
    {
      v5 = nw_interface_copy_dictionary(interface);
      if (v5)
        xpc_dictionary_set_value(v3, "interface", v5);

    }
    if (self->alternate_port)
      xpc_dictionary_set_uint64(v3, "alternate_port", self->alternate_port);
    if (!uuid_is_null(self->agent_identifier))
      xpc_dictionary_set_uuid(v3, "agent_identifier", self->agent_identifier);
    txt_record = self->txt_record;
    if (txt_record)
      xpc_dictionary_set_data(v3, "txt_record", *((const void **)txt_record + 1), *((_QWORD *)txt_record + 2));
    signature = self->signature;
    if (signature)
      xpc_dictionary_set_value(v3, "signature", signature);
    device_id = self->device_id;
    if (device_id)
      xpc_dictionary_set_string(v3, "device_id", device_id);
    public_keys = self->public_keys;
    if (public_keys)
    {
      v10 = public_keys;
      empty = xpc_array_create_empty();
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v12 = v10;
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v28 != v14)
              objc_enumerationMutation(v12);
            v16 = xpc_data_create((const void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "bytes"), objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "length"));
            xpc_array_append_value(empty, v16);

          }
          v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
        }
        while (v13);
      }

      xpc_dictionary_set_value(v3, "public_keys", empty);
    }
    v17 = v3;
    goto LABEL_47;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v18 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v35 = "-[NWConcrete_nw_endpoint copyDictionary]";
  v19 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v31 = 0;
  if (!__nwlog_fault(v19, &type, &v31))
    goto LABEL_45;
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v20 = (id)gLogObj;
    v21 = type;
    if (os_log_type_enabled(v20, type))
    {
      *(_DWORD *)buf = 136446210;
      v35 = "-[NWConcrete_nw_endpoint copyDictionary]";
      _os_log_impl(&dword_182FBE000, v20, v21, "%{public}s xpc_dictionary_create failed", buf, 0xCu);
    }
LABEL_44:

LABEL_45:
    if (!v19)
      goto LABEL_47;
LABEL_46:
    free(v19);
    goto LABEL_47;
  }
  if (!v31)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v20 = (id)gLogObj;
    v25 = type;
    if (os_log_type_enabled(v20, type))
    {
      *(_DWORD *)buf = 136446210;
      v35 = "-[NWConcrete_nw_endpoint copyDictionary]";
      _os_log_impl(&dword_182FBE000, v20, v25, "%{public}s xpc_dictionary_create failed, backtrace limit exceeded", buf, 0xCu);
    }
    goto LABEL_44;
  }
  backtrace_string = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v20 = (id)gLogObj;
  v23 = type;
  v24 = os_log_type_enabled(v20, type);
  if (!backtrace_string)
  {
    if (v24)
    {
      *(_DWORD *)buf = 136446210;
      v35 = "-[NWConcrete_nw_endpoint copyDictionary]";
      _os_log_impl(&dword_182FBE000, v20, v23, "%{public}s xpc_dictionary_create failed, no backtrace", buf, 0xCu);
    }
    goto LABEL_44;
  }
  if (v24)
  {
    *(_DWORD *)buf = 136446466;
    v35 = "-[NWConcrete_nw_endpoint copyDictionary]";
    v36 = 2082;
    v37 = backtrace_string;
    _os_log_impl(&dword_182FBE000, v20, v23, "%{public}s xpc_dictionary_create failed, dumping backtrace:%{public}s", buf, 0x16u);
  }

  free(backtrace_string);
  if (v19)
    goto LABEL_46;
LABEL_47:

  return v3;
}

- (unsigned)type
{
  return 0;
}

- (const)hostname
{
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v3 = (id)gLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 136446466;
    v6 = "-[NWConcrete_nw_endpoint hostname]";
    v7 = 1024;
    v8 = -[NWConcrete_nw_endpoint type](self, "type");
    _os_log_impl(&dword_182FBE000, v3, OS_LOG_TYPE_ERROR, "%{public}s endpoint type %u does not support hostname", (uint8_t *)&v5, 0x12u);
  }

  return 0;
}

- (unsigned)port
{
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v3 = (id)gLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 136446466;
    v6 = "-[NWConcrete_nw_endpoint port]";
    v7 = 1024;
    v8 = -[NWConcrete_nw_endpoint type](self, "type");
    _os_log_impl(&dword_182FBE000, v3, OS_LOG_TYPE_ERROR, "%{public}s endpoint type %u does not support port", (uint8_t *)&v5, 0x12u);
  }

  return 0;
}

- (unsigned)priority
{
  return 0;
}

- (void)setPriority:(unsigned __int16)a3
{
  id v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  unsigned int v8;
  char *backtrace_string;
  os_log_type_t v10;
  _BOOL4 v11;
  unsigned int v12;
  os_log_type_t v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  char v17;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v4 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  v20 = "-[NWConcrete_nw_endpoint setPriority:]";
  v21 = 1024;
  v22 = -[NWConcrete_nw_endpoint type](self, "type");
  LODWORD(v16) = 18;
  v5 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v17 = 0;
  if ((__nwlog_fault(v5, &type, &v17) & 1) == 0)
  {
LABEL_6:
    if (!v5)
      return;
    goto LABEL_7;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v6 = (id)gLogObj;
    v7 = type;
    if (os_log_type_enabled(v6, type))
    {
      v8 = -[NWConcrete_nw_endpoint type](self, "type", buf, v16);
      *(_DWORD *)buf = 136446466;
      v20 = "-[NWConcrete_nw_endpoint setPriority:]";
      v21 = 1024;
      v22 = v8;
      _os_log_impl(&dword_182FBE000, v6, v7, "%{public}s incorrect endpoint type %u", buf, 0x12u);
    }
LABEL_5:

    goto LABEL_6;
  }
  if (!v17)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v6 = (id)gLogObj;
    v13 = type;
    if (os_log_type_enabled(v6, type))
    {
      v14 = -[NWConcrete_nw_endpoint type](self, "type", buf, v16);
      *(_DWORD *)buf = 136446466;
      v20 = "-[NWConcrete_nw_endpoint setPriority:]";
      v21 = 1024;
      v22 = v14;
      _os_log_impl(&dword_182FBE000, v6, v13, "%{public}s incorrect endpoint type %u, backtrace limit exceeded", buf, 0x12u);
    }
    goto LABEL_5;
  }
  backtrace_string = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v6 = (id)gLogObj;
  v10 = type;
  v11 = os_log_type_enabled(v6, type);
  if (!backtrace_string)
  {
    if (v11)
    {
      v15 = -[NWConcrete_nw_endpoint type](self, "type", buf, v16);
      *(_DWORD *)buf = 136446466;
      v20 = "-[NWConcrete_nw_endpoint setPriority:]";
      v21 = 1024;
      v22 = v15;
      _os_log_impl(&dword_182FBE000, v6, v10, "%{public}s incorrect endpoint type %u, no backtrace", buf, 0x12u);
    }
    goto LABEL_5;
  }
  if (v11)
  {
    v12 = -[NWConcrete_nw_endpoint type](self, "type", buf, v16);
    *(_DWORD *)buf = 136446722;
    v20 = "-[NWConcrete_nw_endpoint setPriority:]";
    v21 = 1024;
    v22 = v12;
    v23 = 2082;
    v24 = backtrace_string;
    _os_log_impl(&dword_182FBE000, v6, v10, "%{public}s incorrect endpoint type %u, dumping backtrace:%{public}s", buf, 0x1Cu);
  }

  free(backtrace_string);
  if (v5)
LABEL_7:
    free(v5);
}

- (void)setWeight:(unsigned __int16)a3
{
  id v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  unsigned int v8;
  char *backtrace_string;
  os_log_type_t v10;
  _BOOL4 v11;
  unsigned int v12;
  os_log_type_t v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  char v17;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v4 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  v20 = "-[NWConcrete_nw_endpoint setWeight:]";
  v21 = 1024;
  v22 = -[NWConcrete_nw_endpoint type](self, "type");
  LODWORD(v16) = 18;
  v5 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v17 = 0;
  if ((__nwlog_fault(v5, &type, &v17) & 1) == 0)
  {
LABEL_6:
    if (!v5)
      return;
    goto LABEL_7;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v6 = (id)gLogObj;
    v7 = type;
    if (os_log_type_enabled(v6, type))
    {
      v8 = -[NWConcrete_nw_endpoint type](self, "type", buf, v16);
      *(_DWORD *)buf = 136446466;
      v20 = "-[NWConcrete_nw_endpoint setWeight:]";
      v21 = 1024;
      v22 = v8;
      _os_log_impl(&dword_182FBE000, v6, v7, "%{public}s incorrect endpoint type %u", buf, 0x12u);
    }
LABEL_5:

    goto LABEL_6;
  }
  if (!v17)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v6 = (id)gLogObj;
    v13 = type;
    if (os_log_type_enabled(v6, type))
    {
      v14 = -[NWConcrete_nw_endpoint type](self, "type", buf, v16);
      *(_DWORD *)buf = 136446466;
      v20 = "-[NWConcrete_nw_endpoint setWeight:]";
      v21 = 1024;
      v22 = v14;
      _os_log_impl(&dword_182FBE000, v6, v13, "%{public}s incorrect endpoint type %u, backtrace limit exceeded", buf, 0x12u);
    }
    goto LABEL_5;
  }
  backtrace_string = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v6 = (id)gLogObj;
  v10 = type;
  v11 = os_log_type_enabled(v6, type);
  if (!backtrace_string)
  {
    if (v11)
    {
      v15 = -[NWConcrete_nw_endpoint type](self, "type", buf, v16);
      *(_DWORD *)buf = 136446466;
      v20 = "-[NWConcrete_nw_endpoint setWeight:]";
      v21 = 1024;
      v22 = v15;
      _os_log_impl(&dword_182FBE000, v6, v10, "%{public}s incorrect endpoint type %u, no backtrace", buf, 0x12u);
    }
    goto LABEL_5;
  }
  if (v11)
  {
    v12 = -[NWConcrete_nw_endpoint type](self, "type", buf, v16);
    *(_DWORD *)buf = 136446722;
    v20 = "-[NWConcrete_nw_endpoint setWeight:]";
    v21 = 1024;
    v22 = v12;
    v23 = 2082;
    v24 = backtrace_string;
    _os_log_impl(&dword_182FBE000, v6, v10, "%{public}s incorrect endpoint type %u, dumping backtrace:%{public}s", buf, 0x1Cu);
  }

  free(backtrace_string);
  if (v5)
LABEL_7:
    free(v5);
}

- (OS_dispatch_data)echConfig
{
  return 0;
}

- (void)setEchConfig:(id)a3
{
  id v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  unsigned int v8;
  char *backtrace_string;
  os_log_type_t v10;
  _BOOL4 v11;
  unsigned int v12;
  os_log_type_t v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  char v17;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v4 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  v20 = "-[NWConcrete_nw_endpoint setEchConfig:]";
  v21 = 1024;
  v22 = -[NWConcrete_nw_endpoint type](self, "type");
  LODWORD(v16) = 18;
  v5 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v17 = 0;
  if (!__nwlog_fault(v5, &type, &v17))
  {
LABEL_6:
    if (!v5)
      return;
    goto LABEL_7;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v6 = (id)gLogObj;
    v7 = type;
    if (os_log_type_enabled(v6, type))
    {
      v8 = -[NWConcrete_nw_endpoint type](self, "type", buf, v16);
      *(_DWORD *)buf = 136446466;
      v20 = "-[NWConcrete_nw_endpoint setEchConfig:]";
      v21 = 1024;
      v22 = v8;
      _os_log_impl(&dword_182FBE000, v6, v7, "%{public}s incorrect endpoint type %u", buf, 0x12u);
    }
LABEL_5:

    goto LABEL_6;
  }
  if (!v17)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v6 = (id)gLogObj;
    v13 = type;
    if (os_log_type_enabled(v6, type))
    {
      v14 = -[NWConcrete_nw_endpoint type](self, "type", buf, v16);
      *(_DWORD *)buf = 136446466;
      v20 = "-[NWConcrete_nw_endpoint setEchConfig:]";
      v21 = 1024;
      v22 = v14;
      _os_log_impl(&dword_182FBE000, v6, v13, "%{public}s incorrect endpoint type %u, backtrace limit exceeded", buf, 0x12u);
    }
    goto LABEL_5;
  }
  backtrace_string = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v6 = (id)gLogObj;
  v10 = type;
  v11 = os_log_type_enabled(v6, type);
  if (!backtrace_string)
  {
    if (v11)
    {
      v15 = -[NWConcrete_nw_endpoint type](self, "type", buf, v16);
      *(_DWORD *)buf = 136446466;
      v20 = "-[NWConcrete_nw_endpoint setEchConfig:]";
      v21 = 1024;
      v22 = v15;
      _os_log_impl(&dword_182FBE000, v6, v10, "%{public}s incorrect endpoint type %u, no backtrace", buf, 0x12u);
    }
    goto LABEL_5;
  }
  if (v11)
  {
    v12 = -[NWConcrete_nw_endpoint type](self, "type", buf, v16);
    *(_DWORD *)buf = 136446722;
    v20 = "-[NWConcrete_nw_endpoint setEchConfig:]";
    v21 = 1024;
    v22 = v12;
    v23 = 2082;
    v24 = backtrace_string;
    _os_log_impl(&dword_182FBE000, v6, v10, "%{public}s incorrect endpoint type %u, dumping backtrace:%{public}s", buf, 0x1Cu);
  }

  free(backtrace_string);
  if (v5)
LABEL_7:
    free(v5);
}

- (char)createDescription:(BOOL)a3
{
  id v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  unsigned int v8;
  char *backtrace_string;
  os_log_type_t v11;
  _BOOL4 v12;
  unsigned int v13;
  os_log_type_t v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  char v18;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v4 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  v21 = "-[NWConcrete_nw_endpoint createDescription:]";
  v22 = 1024;
  v23 = -[NWConcrete_nw_endpoint type](self, "type");
  LODWORD(v17) = 18;
  v5 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v18 = 0;
  if ((__nwlog_fault(v5, &type, &v18) & 1) != 0)
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v6 = (id)gLogObj;
      v7 = type;
      if (os_log_type_enabled(v6, type))
      {
        v8 = -[NWConcrete_nw_endpoint type](self, "type", buf, v17);
        *(_DWORD *)buf = 136446466;
        v21 = "-[NWConcrete_nw_endpoint createDescription:]";
        v22 = 1024;
        v23 = v8;
        _os_log_impl(&dword_182FBE000, v6, v7, "%{public}s incorrect endpoint type %u", buf, 0x12u);
      }
    }
    else if (v18)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v6 = (id)gLogObj;
      v11 = type;
      v12 = os_log_type_enabled(v6, type);
      if (backtrace_string)
      {
        if (v12)
        {
          v13 = -[NWConcrete_nw_endpoint type](self, "type", buf, v17);
          *(_DWORD *)buf = 136446722;
          v21 = "-[NWConcrete_nw_endpoint createDescription:]";
          v22 = 1024;
          v23 = v13;
          v24 = 2082;
          v25 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v6, v11, "%{public}s incorrect endpoint type %u, dumping backtrace:%{public}s", buf, 0x1Cu);
        }

        free(backtrace_string);
        if (v5)
          goto LABEL_7;
        return 0;
      }
      if (v12)
      {
        v16 = -[NWConcrete_nw_endpoint type](self, "type", buf, v17);
        *(_DWORD *)buf = 136446466;
        v21 = "-[NWConcrete_nw_endpoint createDescription:]";
        v22 = 1024;
        v23 = v16;
        _os_log_impl(&dword_182FBE000, v6, v11, "%{public}s incorrect endpoint type %u, no backtrace", buf, 0x12u);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v6 = (id)gLogObj;
      v14 = type;
      if (os_log_type_enabled(v6, type))
      {
        v15 = -[NWConcrete_nw_endpoint type](self, "type", buf, v17);
        *(_DWORD *)buf = 136446466;
        v21 = "-[NWConcrete_nw_endpoint createDescription:]";
        v22 = 1024;
        v23 = v15;
        _os_log_impl(&dword_182FBE000, v6, v14, "%{public}s incorrect endpoint type %u, backtrace limit exceeded", buf, 0x12u);
      }
    }

  }
  if (v5)
LABEL_7:
    free(v5);
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  NWConcrete_nw_endpoint *v4;
  BOOL v5;

  v4 = (NWConcrete_nw_endpoint *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[NWConcrete_nw_endpoint isEqualToEndpoint:matchFlags:](self, "isEqualToEndpoint:matchFlags:", v4, 31);
  }

  return v5;
}

- (id)copyEndpoint
{
  return 0;
}

- (unint64_t)getHash
{
  return 4095;
}

@end
