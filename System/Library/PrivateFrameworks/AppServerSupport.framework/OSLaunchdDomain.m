@implementation OSLaunchdDomain

+ (id)domainForPid:(int)a3
{
  return -[OSLaunchdDomain initWithType:handle:]([OSLaunchdDomain alloc], "initWithType:handle:", 5, a3);
}

+ (id)currentDomain
{
  return -[OSLaunchdDomain initWithType:handle:]([OSLaunchdDomain alloc], "initWithType:handle:", 7, 0);
}

- (OSLaunchdDomain)initWithType:(int)a3 handle:(unint64_t)a4
{
  OSLaunchdDomain *v6;
  OSLaunchdDomain *v7;
  OSLaunchdDomain *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OSLaunchdDomain;
  v6 = -[OSLaunchdDomain init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = a3;
    v6->_handle = a4;
    v8 = v6;
  }

  return v7;
}

+ (id)domainForUser:(unsigned int)a3
{
  return -[OSLaunchdDomain initWithType:handle:]([OSLaunchdDomain alloc], "initWithType:handle:", 2, a3);
}

+ (id)systemDomain
{
  return -[OSLaunchdDomain initWithType:handle:]([OSLaunchdDomain alloc], "initWithType:handle:", 1, 0);
}

+ (id)loginwindowDomain
{
  return -[OSLaunchdDomain initWithType:handle:]([OSLaunchdDomain alloc], "initWithType:handle:", 8, -1);
}

+ (id)domainForRoleAccountUser:(unsigned int)a3
{
  return -[OSLaunchdDomain initWithType:handle:]([OSLaunchdDomain alloc], "initWithType:handle:", 2, a3);
}

+ (id)domainForAsid:(int)a3
{
  return -[OSLaunchdDomain initWithType:handle:]([OSLaunchdDomain alloc], "initWithType:handle:", 3, a3);
}

+ (unsigned)_createDomainOptions2flags:(unint64_t)a3
{
  return a3 & 1;
}

+ (id)createDomainForRoleAccount:(unsigned int)a3 sessionType:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  uint64_t v8;
  id v9;
  xpc_object_t empty;
  id v11;
  const char *v12;
  xpc_object_t v13;
  uint64_t v14;
  void *v15;

  v8 = *(_QWORD *)&a3;
  v9 = a4;
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "type", 2uLL);
  xpc_dictionary_set_uint64(empty, "handle", v8);
  v11 = objc_retainAutorelease(v9);
  v12 = (const char *)objc_msgSend(v11, "UTF8String");

  xpc_dictionary_set_string(empty, "session", v12);
  v13 = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(v13, "type", 1uLL);
  xpc_dictionary_set_uint64(v13, "handle", 0);
  xpc_dictionary_set_value(v13, "properties", empty);
  xpc_dictionary_set_uint64(v13, "flags", +[OSLaunchdDomain _createDomainOptions2flags:](OSLaunchdDomain, "_createDomainOptions2flags:", a5));
  v14 = _xpc_domain_routine();
  if ((_DWORD)v14)
  {
    if (a6)
    {
      +[OSLaunchdError createXPCError:](OSLaunchdError, "createXPCError:", v14);
      v15 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    +[OSLaunchdDomain domainForRoleAccountUser:](OSLaunchdDomain, "domainForRoleAccountUser:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (BOOL)unpendLaunches:(id *)a3
{
  xpc_object_t empty;
  uint64_t v6;
  int v7;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "type", self->_type);
  xpc_dictionary_set_uint64(empty, "handle", self->_handle);
  v6 = _xpc_domain_routine();
  v7 = v6;
  if (a3 && (_DWORD)v6)
  {
    +[OSLaunchdError createXPCError:](OSLaunchdError, "createXPCError:", v6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7 == 0;
}

- (BOOL)initiateRemoval:(id *)a3
{
  xpc_object_t empty;
  uint64_t v6;
  int v7;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "type", self->_type);
  xpc_dictionary_set_uint64(empty, "handle", self->_handle);
  xpc_dictionary_set_BOOL(empty, "no-einprogress", 1);
  v6 = _xpc_domain_routine();
  v7 = v6;
  if (a3 && (_DWORD)v6)
  {
    +[OSLaunchdError createXPCError:](OSLaunchdError, "createXPCError:", v6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7 == 0;
}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_type == v4[2] && self->_handle == *((_QWORD *)v4 + 2);

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", self->_handle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

@end
