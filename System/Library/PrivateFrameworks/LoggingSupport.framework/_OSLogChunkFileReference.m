@implementation _OSLogChunkFileReference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oslcr, 0);
}

- (char)path
{
  return self->_path;
}

- (id)copyMappedChunkFile:(id *)a3
{
  void *v5;
  uint64_t v6;
  _OSLogChunkFile *v7;
  int v8;
  id result;

  -[_OSLogCollectionReference diagnosticsDirectoryReference](self->_oslcr, "diagnosticsDirectoryReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = openat(objc_msgSend(v5, "fileDescriptor"), self->_path, 0);

  if ((_DWORD)v6 == -1)
  {
    if (!a3)
      return 0;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
    v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  v7 = -[_OSLogChunkFile initWithFileDescriptor:error:]([_OSLogChunkFile alloc], "initWithFileDescriptor:error:", v6, a3);
  if (close(v6) != -1)
    return v7;
  v8 = *__error();
  result = (id)*__error();
  if (v8 != 9)
  {
    _os_assumes_log();
    return v7;
  }
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = (uint64_t)result;
  __break(1u);
  return result;
}

- (unint64_t)xattrOldestTime
{
  return self->_xot;
}

- (unint64_t)xattrEndTime
{
  return self->_xet;
}

- (BOOL)readXattrForTimespan:(id *)a3
{
  NSObject *v5;
  char *path;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  int v13;
  int v15;
  int v16;
  __int16 v17;
  int v18;
  uint8_t buf[16];
  _BYTE v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  _index_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    path = self->_path;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = path;
    _os_signpost_emit_with_name_impl(&dword_19EA26000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Read Extended Attributes", "for %s", buf, 0xCu);
  }

  *(_OWORD *)buf = 0u;
  memset(v20, 0, sizeof(v20));
  -[_OSLogCollectionReference diagnosticsDirectoryReference](self->_oslcr, "diagnosticsDirectoryReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileDescriptor");
  v8 = _os_trace_getxattr_at();

  if (v8 == 40)
  {
    *(_OWORD *)&self->_xot = *(_OWORD *)&v20[8];
    _index_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      v15 = 67109120;
      v16 = 1;
      v10 = "success: %{BOOL}d";
      v11 = v9;
      v12 = 8;
LABEL_10:
      _os_signpost_emit_with_name_impl(&dword_19EA26000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Read Extended Attributes", v10, (uint8_t *)&v15, v12);
    }
  }
  else
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    _index_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      v13 = *__error();
      v15 = 67109376;
      v16 = 0;
      v17 = 1024;
      v18 = v13;
      v10 = "success: %{BOOL}d %{darwin.errno}d";
      v11 = v9;
      v12 = 14;
      goto LABEL_10;
    }
  }

  return v8 == 40;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_path);
  v3.receiver = self;
  v3.super_class = (Class)_OSLogChunkFileReference;
  -[_OSLogChunkFileReference dealloc](&v3, sel_dealloc);
}

- (_OSLogChunkFileReference)initWithCollection:(id)a3 subpath:(const char *)a4
{
  id v7;
  _OSLogChunkFileReference *v8;
  _OSLogChunkFileReference *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_OSLogChunkFileReference;
  v8 = -[_OSLogChunkFileReference init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_oslcr, a3);
    v9->_path = strdup(a4);
  }

  return v9;
}

@end
