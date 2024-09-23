@implementation NWAdvertiseDescriptor

- (NWAdvertiseDescriptor)initWithName:(id)a3 type:(id)a4 domain:(id)a5
{
  id v8;
  id v9;
  id v10;
  NWAdvertiseDescriptor *v11;
  NWAdvertiseDescriptor *v12;
  nw_advertise_descriptor_t bonjour_service;
  OS_nw_advertise_descriptor *internalDescriptor;
  void *v16;
  char *v17;
  NSObject *v18;
  os_log_type_t v19;
  const char *v20;
  void *v21;
  char *v22;
  NSObject *v23;
  os_log_type_t v24;
  const char *v25;
  char *v26;
  _BOOL4 v27;
  char *backtrace_string;
  _BOOL4 v29;
  objc_super v30;
  char v31;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    v30.receiver = self;
    v30.super_class = (Class)NWAdvertiseDescriptor;
    v11 = -[NWAdvertiseDescriptor init](&v30, sel_init);
    if (v11)
    {
      v12 = v11;
      bonjour_service = nw_advertise_descriptor_create_bonjour_service((const char *)objc_msgSend(v8, "UTF8String"), (const char *)objc_msgSend(v9, "UTF8String"), (const char *)objc_msgSend(v10, "UTF8String"));
      internalDescriptor = v12->_internalDescriptor;
      v12->_internalDescriptor = (OS_nw_advertise_descriptor *)bonjour_service;

      goto LABEL_4;
    }
    __nwlog_obj();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v34 = "-[NWAdvertiseDescriptor initWithName:type:domain:]";
    v22 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v31 = 0;
    if (!__nwlog_fault(v22, &type, &v31))
      goto LABEL_38;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = type;
      if (os_log_type_enabled(v23, type))
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWAdvertiseDescriptor initWithName:type:domain:]";
        v25 = "%{public}s [super init] failed";
LABEL_36:
        _os_log_impl(&dword_182FBE000, v23, v24, v25, buf, 0xCu);
      }
    }
    else if (v31)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = type;
      v29 = os_log_type_enabled(v23, type);
      if (backtrace_string)
      {
        if (v29)
        {
          *(_DWORD *)buf = 136446466;
          v34 = "-[NWAdvertiseDescriptor initWithName:type:domain:]";
          v35 = 2082;
          v36 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v23, v24, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_38;
      }
      if (v29)
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWAdvertiseDescriptor initWithName:type:domain:]";
        v25 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_36;
      }
    }
    else
    {
      __nwlog_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = type;
      if (os_log_type_enabled(v23, type))
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWAdvertiseDescriptor initWithName:type:domain:]";
        v25 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_36;
      }
    }

LABEL_38:
    if (v22)
      free(v22);
    v12 = 0;
    goto LABEL_4;
  }
  __nwlog_obj();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v34 = "-[NWAdvertiseDescriptor initWithName:type:domain:]";
  v17 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v31 = 0;
  if (__nwlog_fault(v17, &type, &v31))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWAdvertiseDescriptor initWithName:type:domain:]";
        v20 = "%{public}s called with null type";
LABEL_29:
        _os_log_impl(&dword_182FBE000, v18, v19, v20, buf, 0xCu);
      }
    }
    else
    {
      if (v31)
      {
        v26 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = type;
        v27 = os_log_type_enabled(v18, type);
        if (v26)
        {
          if (v27)
          {
            *(_DWORD *)buf = 136446466;
            v34 = "-[NWAdvertiseDescriptor initWithName:type:domain:]";
            v35 = 2082;
            v36 = v26;
            _os_log_impl(&dword_182FBE000, v18, v19, "%{public}s called with null type, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v26);
          goto LABEL_31;
        }
        if (!v27)
          goto LABEL_30;
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWAdvertiseDescriptor initWithName:type:domain:]";
        v20 = "%{public}s called with null type, no backtrace";
        goto LABEL_29;
      }
      __nwlog_obj();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWAdvertiseDescriptor initWithName:type:domain:]";
        v20 = "%{public}s called with null type, backtrace limit exceeded";
        goto LABEL_29;
      }
    }
LABEL_30:

  }
LABEL_31:
  if (v17)
    free(v17);

  v12 = 0;
LABEL_4:

  return v12;
}

- (NSString)bonjourServiceDomain
{
  void *v2;
  uint64_t bonjour_domain;
  _BOOL8 v4;

  -[NWAdvertiseDescriptor internalDescriptor](self, "internalDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  bonjour_domain = nw_advertise_descriptor_get_bonjour_domain(v2);

  if (bonjour_domain)
    v4 = nw_nsstring(bonjour_domain);
  else
    v4 = 0;
  return (NSString *)(id)v4;
}

- (NSString)bonjourServiceType
{
  void *v2;
  uint64_t bonjour_type;
  _BOOL8 v4;

  -[NWAdvertiseDescriptor internalDescriptor](self, "internalDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  bonjour_type = nw_advertise_descriptor_get_bonjour_type(v2);

  if (bonjour_type)
    v4 = nw_nsstring(bonjour_type);
  else
    v4 = 0;
  return (NSString *)(id)v4;
}

- (NSString)bonjourServiceName
{
  void *v2;
  uint64_t bonjour_name;
  _BOOL8 v4;

  -[NWAdvertiseDescriptor internalDescriptor](self, "internalDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  bonjour_name = nw_advertise_descriptor_get_bonjour_name(v2);

  if (bonjour_name)
    v4 = nw_nsstring(bonjour_name);
  else
    v4 = 0;
  return (NSString *)(id)v4;
}

- (NWAdvertiseDescriptor)initWithDescriptor:(id)a3
{
  id v5;
  NWAdvertiseDescriptor *v6;
  NWAdvertiseDescriptor *v7;
  void *v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  const char *v13;
  void *v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  const char *v18;
  char *v19;
  _BOOL4 v20;
  char *backtrace_string;
  _BOOL4 v22;
  objc_super v23;
  char v24;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v23.receiver = self;
    v23.super_class = (Class)NWAdvertiseDescriptor;
    v6 = -[NWAdvertiseDescriptor init](&v23, sel_init);
    if (v6)
    {
      v7 = v6;
      objc_storeStrong((id *)&v6->_internalDescriptor, a3);
      goto LABEL_4;
    }
    __nwlog_obj();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v27 = "-[NWAdvertiseDescriptor initWithDescriptor:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v24 = 0;
    if (!__nwlog_fault(v15, &type, &v24))
      goto LABEL_38;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWAdvertiseDescriptor initWithDescriptor:]";
        v18 = "%{public}s [super init] failed";
LABEL_36:
        _os_log_impl(&dword_182FBE000, v16, v17, v18, buf, 0xCu);
      }
    }
    else if (v24)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = type;
      v22 = os_log_type_enabled(v16, type);
      if (backtrace_string)
      {
        if (v22)
        {
          *(_DWORD *)buf = 136446466;
          v27 = "-[NWAdvertiseDescriptor initWithDescriptor:]";
          v28 = 2082;
          v29 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v16, v17, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_38;
      }
      if (v22)
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWAdvertiseDescriptor initWithDescriptor:]";
        v18 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_36;
      }
    }
    else
    {
      __nwlog_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWAdvertiseDescriptor initWithDescriptor:]";
        v18 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_36;
      }
    }

LABEL_38:
    if (v15)
      free(v15);
    v7 = 0;
    goto LABEL_4;
  }
  __nwlog_obj();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v27 = "-[NWAdvertiseDescriptor initWithDescriptor:]";
  v10 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v24 = 0;
  if (__nwlog_fault(v10, &type, &v24))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWAdvertiseDescriptor initWithDescriptor:]";
        v13 = "%{public}s called with null internalDescriptor";
LABEL_29:
        _os_log_impl(&dword_182FBE000, v11, v12, v13, buf, 0xCu);
      }
    }
    else
    {
      if (v24)
      {
        v19 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = type;
        v20 = os_log_type_enabled(v11, type);
        if (v19)
        {
          if (v20)
          {
            *(_DWORD *)buf = 136446466;
            v27 = "-[NWAdvertiseDescriptor initWithDescriptor:]";
            v28 = 2082;
            v29 = v19;
            _os_log_impl(&dword_182FBE000, v11, v12, "%{public}s called with null internalDescriptor, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v19);
          goto LABEL_31;
        }
        if (!v20)
          goto LABEL_30;
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWAdvertiseDescriptor initWithDescriptor:]";
        v13 = "%{public}s called with null internalDescriptor, no backtrace";
        goto LABEL_29;
      }
      __nwlog_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWAdvertiseDescriptor initWithDescriptor:]";
        v13 = "%{public}s called with null internalDescriptor, backtrace limit exceeded";
        goto LABEL_29;
      }
    }
LABEL_30:

  }
LABEL_31:
  if (v10)
    free(v10);

  v7 = 0;
LABEL_4:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[NWAdvertiseDescriptor internalDescriptor](self, "internalDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithDescriptor:", v5);

  return v6;
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  -[NWAdvertiseDescriptor internalDescriptor](self, "internalDescriptor", *(_QWORD *)&a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  return -[NWAdvertiseDescriptor descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0, 0);
}

- (id)privateDescription
{
  return -[NWAdvertiseDescriptor descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0, 1);
}

- (NSData)txtRecord
{
  void *v2;
  uint64_t txt_record;
  id v4;
  uint64_t v6;

  v6 = 0;
  -[NWAdvertiseDescriptor internalDescriptor](self, "internalDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  txt_record = nw_advertise_descriptor_get_txt_record(v2, &v6);

  if (!txt_record)
    return (NSData *)0;
  v4 = objc_alloc(MEMORY[0x1E0C99D50]);
  return (NSData *)(id)objc_msgSend(v4, "initWithBytes:length:", txt_record, v6);
}

- (void)setTxtRecord:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  -[NWAdvertiseDescriptor internalDescriptor](self, "internalDescriptor");
  v4 = objc_claimAutoreleasedReturnValue();
  nw_advertise_descriptor_set_txt_record(v4, (const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));

}

- (OS_nw_advertise_descriptor)internalDescriptor
{
  return self->_internalDescriptor;
}

- (void)setInternalDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_internalDescriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalDescriptor, 0);
}

@end
