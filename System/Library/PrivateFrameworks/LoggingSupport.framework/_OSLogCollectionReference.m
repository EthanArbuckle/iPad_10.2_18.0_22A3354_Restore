@implementation _OSLogCollectionReference

- (_OSLogDirectoryReference)diagnosticsDirectoryReference
{
  return self->_diagnosticsDirectoryReference;
}

+ (id)localDBRefWithError:(id *)a3
{
  void *v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *v8;
  void *v9;
  id v10;
  const char *string;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  _OSLogDirectoryReference *v19;
  uint64_t v20;
  const char *v21;
  _OSLogDirectoryReference *v22;
  int v23;
  id result;
  uint64_t v25;
  const char *v26;
  _OSLogDirectoryReference *v27;
  int v28;
  int v29;
  _QWORD v30[3];
  _QWORD v31[4];

  v31[3] = *MEMORY[0x1E0C80C00];
  OSLogLogdAdminConnection();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v9 = 0;
LABEL_28:

    return v9;
  }
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v6, "operation", 6uLL);
  v7 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)v5, v6);
  if (MEMORY[0x1A1AECA14]() == MEMORY[0x1E0C81310])
  {
    if (a3)
    {
      v10 = v7;
      string = xpc_dictionary_get_string(v10, (const char *)*MEMORY[0x1E0C81270]);
      if (string)
        v12 = string;
      else
        v12 = "unknown error";
      v30[0] = CFSTR("_OSLogErrorInternalCode");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v13;
      v30[1] = CFSTR("_OSLogErrorXPCErrorDescription");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v30[2] = *MEMORY[0x1E0CB2D50];
      v31[1] = v14;
      v31[2] = CFSTR("Connection to logd failed");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("OSLogErrorDomain"), 10, v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v16;
      goto LABEL_12;
    }
LABEL_19:
    v9 = 0;
    goto LABEL_27;
  }
  if (xpc_dictionary_get_uint64(v7, "errorcode") == 1)
  {
    if (a3)
    {
      _OSLogError(14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
      v9 = 0;
      *a3 = v8;
LABEL_27:

      goto LABEL_28;
    }
    goto LABEL_19;
  }
  v17 = xpc_dictionary_dup_fd(v7, "persistdir_fd");
  v18 = xpc_dictionary_get_string(v7, "persistdir_sbext");
  if ((_DWORD)v17 == -1)
    goto LABEL_19;
  v19 = -[_OSLogDirectoryReference initWithDescriptor:sandboxExtensionToken:]([_OSLogDirectoryReference alloc], "initWithDescriptor:sandboxExtensionToken:", v17, v18);
  if (close(v17) == -1)
  {
    v29 = *__error();
    result = (id)*__error();
    if (v29 == 9)
    {
      qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_1EE52EA88 = (uint64_t)result;
      __break(1u);
      goto LABEL_32;
    }
    _os_assumes_log();
  }
  v20 = xpc_dictionary_dup_fd(v7, "timesyncdir_fd");
  v21 = xpc_dictionary_get_string(v7, "timesyncdir_sbext");
  if ((_DWORD)v20 == -1)
  {
    v22 = 0;
    goto LABEL_21;
  }
  v22 = -[_OSLogDirectoryReference initWithDescriptor:sandboxExtensionToken:]([_OSLogDirectoryReference alloc], "initWithDescriptor:sandboxExtensionToken:", v20, v21);
  if (close(v20) == -1)
  {
    v23 = *__error();
    result = (id)*__error();
    if (v23 != 9)
    {
      _os_assumes_log();
      goto LABEL_21;
    }
LABEL_32:
    qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_1EE52EA88 = (uint64_t)result;
    __break(1u);
    goto LABEL_33;
  }
LABEL_21:
  v25 = xpc_dictionary_dup_fd(v7, "uuidtextdir_fd");
  v26 = xpc_dictionary_get_string(v7, "uuidtextdir_sbext");
  if ((_DWORD)v25 == -1)
  {
    v27 = 0;
    goto LABEL_26;
  }
  v27 = -[_OSLogDirectoryReference initWithDescriptor:sandboxExtensionToken:]([_OSLogDirectoryReference alloc], "initWithDescriptor:sandboxExtensionToken:", v25, v26);
  if (close(v25) != -1)
  {
LABEL_26:
    v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDiagnosticsDirectory:timesyncDirectory:UUIDTextDirectory:", v19, v22, v27);

    goto LABEL_27;
  }
  v28 = *__error();
  result = (id)*__error();
  if (v28 != 9)
  {
    _os_assumes_log();
    goto LABEL_26;
  }
LABEL_33:
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = (uint64_t)result;
  __break(1u);
  return result;
}

- (_OSLogCollectionReference)initWithDiagnosticsDirectory:(id)a3 timesyncDirectory:(id)a4 UUIDTextDirectory:(id)a5
{
  id v9;
  id v10;
  id v11;
  _OSLogCollectionReference *v12;
  _OSLogCollectionReference *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_OSLogCollectionReference;
  v12 = -[_OSLogCollectionReference init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_diagnosticsDirectoryReference, a3);
    objc_storeStrong((id *)&v13->_timesyncReference, a4);
    objc_storeStrong((id *)&v13->_UUIDTextReference, a5);
  }

  return v13;
}

- (_OSLogDirectoryReference)timesyncReference
{
  return self->_timesyncReference;
}

- (void)close
{
  -[_OSLogDirectoryReference close](self->_diagnosticsDirectoryReference, "close");
  -[_OSLogDirectoryReference close](self->_timesyncReference, "close");
  -[_OSLogDirectoryReference close](self->_UUIDTextReference, "close");
}

- (_OSLogDirectoryReference)UUIDTextReference
{
  return self->_UUIDTextReference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUIDTextReference, 0);
  objc_storeStrong((id *)&self->_timesyncReference, 0);
  objc_storeStrong((id *)&self->_diagnosticsDirectoryReference, 0);
}

+ (_OSLogCollectionReference)referenceWithURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _OSLogDirectoryReference *v18;
  _OSLogDirectoryReference *v19;
  id v20;
  uint64_t v21;
  int v22;
  _OSLogDirectoryReference *v23;
  int v24;
  _OSLogCollectionReference *result;
  int v26;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB3940];
  if (_os_trace_shared_paths_init_once != -1)
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  objc_msgSend(v7, "stringWithUTF8String:", _os_trace_persist_path);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasPrefix:", v8);

  if (v10)
  {
    objc_msgSend(a1, "localDBRefWithError:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

    return (_OSLogCollectionReference *)v11;
  }
  objc_msgSend(v6, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "rangeOfString:options:", CFSTR(".logarchive"), 4);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 3, 0);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    goto LABEL_20;
  }
  objc_msgSend(v12, "substringToIndex:", v13 + v14);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = open((const char *)objc_msgSend(v15, "fileSystemRepresentation"), 0);
  if ((_DWORD)v16 == -1)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    goto LABEL_19;
  }
  v17 = v16;
  v18 = -[_OSLogDirectoryReference initWithDescriptor:sandboxExtensionToken:]([_OSLogDirectoryReference alloc], "initWithDescriptor:sandboxExtensionToken:", v16, 0);
  v19 = -[_OSLogDirectoryReference initWithDescriptor:sandboxExtensionToken:]([_OSLogDirectoryReference alloc], "initWithDescriptor:sandboxExtensionToken:", v17, 0);
  if (close(v17) == -1)
  {
    v26 = *__error();
    result = (_OSLogCollectionReference *)*__error();
    if (v26 == 9)
    {
      qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_1EE52EA88 = (uint64_t)result;
      __break(1u);
      goto LABEL_26;
    }
    _os_assumes_log();
  }
  objc_msgSend(v15, "stringByAppendingPathComponent:", CFSTR("timesync"));
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v21 = open((const char *)objc_msgSend(v20, "fileSystemRepresentation"), 0);
  if ((_DWORD)v21 == -1)
  {
    v23 = 0;
    goto LABEL_18;
  }
  v22 = v21;
  v23 = -[_OSLogDirectoryReference initWithDescriptor:sandboxExtensionToken:]([_OSLogDirectoryReference alloc], "initWithDescriptor:sandboxExtensionToken:", v21, 0);
  if (close(v22) != -1)
  {
LABEL_18:
    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDiagnosticsDirectory:timesyncDirectory:UUIDTextDirectory:", v18, v23, v19);

LABEL_19:
LABEL_20:

    goto LABEL_21;
  }
  v24 = *__error();
  result = (_OSLogCollectionReference *)*__error();
  if (v24 != 9)
  {
    _os_assumes_log();
    goto LABEL_18;
  }
LABEL_26:
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = (uint64_t)result;
  __break(1u);
  return result;
}

@end
