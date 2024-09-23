@implementation NWURLLoaderFile

- (void)start:(id)a3
{
  void (**v4)(_QWORD);
  NSURL *URL;
  NSURL *v6;
  int v7;
  dispatch_fd_t v8;
  NSNumber *v9;
  NSNumber *v10;
  dev_t st_dev;
  OS_dispatch_queue *queue;
  NSObject *v13;
  dispatch_io_t v14;
  OS_dispatch_io **p_io;
  OS_dispatch_io *io;
  NSObject *v17;
  NSObject *v18;
  int v19;
  NWURLError *v20;
  uint64_t v21;
  NWURLError *v22;
  NWURLError *error;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _QWORD cleanup_handler[4];
  dispatch_fd_t v35;
  stat v36;
  _BYTE buf[18];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  if (self)
    URL = self->_URL;
  else
    URL = 0;
  v6 = URL;
  v7 = open(-[NSURL fileSystemRepresentation](v6, "fileSystemRepresentation"), 0);
  v8 = v7;
  if ((v7 & 0x80000000) == 0)
  {
    memset(&v36, 0, sizeof(v36));
    if (fstat(v7, &v36))
    {
      v29 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
      v30 = -1101;
      v31 = -3001;
      if (v29 == 13)
        v31 = -1102;
      if (v29 != 21)
        v30 = v31;
      if (v29 == 2)
        v32 = -1100;
      else
        v32 = v30;
      -[NWURLLoaderFile errorForErrorCode:withPOSIXCode:]((uint64_t)self, v32, v29);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWURLLoaderFile setError:]((uint64_t)self, v33);

      goto LABEL_19;
    }
    if (self)
    {
      self->_fileSize = v36.st_size;
      v9 = self->_expectedDevice;
      if (v9)
      {
        v10 = v9;
        st_dev = v36.st_dev;
        LOBYTE(st_dev) = st_dev == -[NSNumber intValue](self->_expectedDevice, "intValue");

        if ((st_dev & 1) == 0)
        {
          if (__nwlog_url_log::onceToken != -1)
            dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
          v18 = (id)gurlLogObj;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v19 = -[NSNumber intValue](self->_expectedDevice, "intValue");
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v6;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v19;
            _os_log_impl(&dword_182FBE000, v18, OS_LOG_TYPE_ERROR, "File %@ not on the expected device %d", buf, 0x12u);
          }

          v20 = [NWURLError alloc];
          if (v20)
          {
            v21 = *MEMORY[0x1E0CB32E8];
            *(_QWORD *)buf = v20;
            *(_QWORD *)&buf[8] = NWURLError;
            v22 = (NWURLError *)objc_msgSendSuper2((objc_super *)buf, sel_initWithDomain_code_userInfo_, v21, -1104, 0);
          }
          else
          {
            v22 = 0;
          }
          -[NWURLError setFailingURL:](v22, "setFailingURL:", self->_URL);
          error = self->_error;
          self->_error = v22;

          goto LABEL_19;
        }
      }
      queue = self->_queue;
    }
    else
    {
      queue = 0;
    }
    v13 = queue;
    cleanup_handler[0] = MEMORY[0x1E0C809B0];
    cleanup_handler[1] = 3221225472;
    cleanup_handler[2] = __25__NWURLLoaderFile_start___block_invoke;
    cleanup_handler[3] = &__block_descriptor_36_e8_v12__0i8l;
    v35 = v8;
    v14 = dispatch_io_create(0, v8, v13, cleanup_handler);
    if (self)
    {
      io = self->_io;
      p_io = &self->_io;
      *p_io = (OS_dispatch_io *)v14;

      v17 = *p_io;
    }
    else
    {

      v17 = 0;
    }
    dispatch_io_set_low_water(v17, 0xFFFFFFFFFFFFFFFFLL);
LABEL_19:
    v4[2](v4);
    goto LABEL_20;
  }
  v24 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  v25 = -1101;
  v26 = -3001;
  if (v24 == 13)
    v26 = -1102;
  if (v24 != 21)
    v25 = v26;
  if (v24 == 2)
    v27 = -1100;
  else
    v27 = v25;
  -[NWURLLoaderFile errorForErrorCode:withPOSIXCode:]((uint64_t)self, v27, v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWURLLoaderFile setError:]((uint64_t)self, v28);

  v4[2](v4);
LABEL_20:

}

- (void)stop
{
  NSObject *io;
  OS_dispatch_io *v4;

  if (self)
  {
    io = self->_io;
    if (io)
    {
      dispatch_io_close(io, 1uLL);
      v4 = self->_io;
      self->_io = 0;

    }
  }
}

- (void)readResponse:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  NSURL *URL;
  uint64_t v7;
  NSURL *v8;
  id v9;
  void *v10;
  id v11;
  NSURL *v12;
  unint64_t fileSize;
  void *v14;
  id v15;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  if (self)
  {
    if (self->_error)
    {
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
      goto LABEL_9;
    }
    URL = self->_URL;
  }
  else
  {
    URL = 0;
  }
  v15 = 0;
  v7 = *MEMORY[0x1E0C998E0];
  v8 = URL;
  -[NSURL getResourceValue:forKey:error:](v8, "getResourceValue:forKey:error:", &v15, v7, 0);
  v9 = v15;

  objc_msgSend(v9, "preferredMIMEType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0C92C88]);
  if (self)
  {
    v12 = self->_URL;
    if ((self->_fileSize & 0x8000000000000000) != 0)
      fileSize = -1;
    else
      fileSize = self->_fileSize;
  }
  else
  {
    v12 = 0;
    fileSize = 0;
  }
  v14 = (void *)objc_msgSend(v11, "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v12, v10, fileSize, 0);
  ((void (**)(_QWORD, void *, _QWORD))v5)[2](v5, v14, 0);

LABEL_9:
}

- (void)readDataOfMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5
{
  id v7;
  void *v8;
  id v9;
  OS_dispatch_io *v10;
  NSObject *queue;
  id v12;
  _QWORD io_handler[5];
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;

  v7 = a5;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__42417;
  v16[4] = __Block_byref_object_dispose__42418;
  v8 = (void *)MEMORY[0x1E0C80D00];
  v9 = MEMORY[0x1E0C80D00];
  v17 = v8;
  if (self)
  {
    v10 = self->_io;
    queue = self->_queue;
  }
  else
  {
    v10 = 0;
    queue = 0;
  }
  if (a3 <= 0x4000)
    a3 = 0x4000;
  io_handler[0] = MEMORY[0x1E0C809B0];
  io_handler[1] = 3221225472;
  io_handler[2] = __85__NWURLLoaderFile_readDataOfMinimumIncompleteLength_maximumLength_completionHandler___block_invoke;
  io_handler[3] = &unk_1E14A2058;
  io_handler[4] = self;
  v14 = v7;
  v15 = v16;
  v12 = v7;
  dispatch_io_read((dispatch_io_t)v10, 0, a3, queue, io_handler);

  _Block_object_dispose(v16, 8);
}

- (NSString)multipartMixedReplaceBoundary
{
  return 0;
}

- (OS_sec_trust)peerTrust
{
  return 0;
}

- (BOOL)requestComplete
{
  return 1;
}

- (void)notifyRequestCompletion:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (id)takeCachedResponse
{
  return 0;
}

- (OS_nw_http_fields)trailerFields
{
  return 0;
}

- (BOOL)allowsWrite
{
  return 0;
}

- (void)writeData:(id)a3 complete:(BOOL)a4 completionHandler:(id)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a5;
  _os_crash();
  __break(1u);
}

- (OS_nw_connection)underlyingConnection
{
  OS_nw_connection *result;

  result = (OS_nw_connection *)_os_crash();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_io, 0);
  objc_storeStrong((id *)&self->_expectedDevice, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

void __85__NWURLLoaderFile_readDataOfMinimumIncompleteLength_maximumLength_completionHandler___block_invoke(uint64_t *a1, int a2, void *a3, int a4)
{
  NSObject *v7;
  dispatch_data_t concat;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *data;

  v7 = a3;
  data = v7;
  if (v7)
  {
    concat = dispatch_data_create_concat(*(dispatch_data_t *)(*(_QWORD *)(a1[6] + 8) + 40), v7);
    v9 = *(_QWORD *)(a1[6] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = concat;

    if (a2)
    {
      v11 = a1[5];
      v12 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
      v13 = dispatch_data_get_size(data) == 0;
      (*(void (**)(uint64_t, uint64_t, _BOOL8, _QWORD))(v11 + 16))(v11, v12, v13, 0);
    }
  }
  else
  {
    v14 = -1101;
    v15 = -3001;
    if (a4 == 13)
      v15 = -1102;
    if (a4 != 21)
      v14 = v15;
    if (a4 == 2)
      v16 = -1100;
    else
      v16 = v14;
    v17 = a1[5];
    -[NWURLLoaderFile errorForErrorCode:withPOSIXCode:](a1[4], v16, a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, uint64_t, void *))(v17 + 16))(v17, 0, 1, v18);

  }
}

- (id)errorForErrorCode:(int)a3 withPOSIXCode:
{
  NWURLError *v6;
  uint64_t v7;
  id v8;
  void *v9;
  objc_super v11;

  if (a1)
  {
    v6 = [NWURLError alloc];
    if (v6)
    {
      v7 = *MEMORY[0x1E0CB32E8];
      v11.receiver = v6;
      v11.super_class = (Class)NWURLError;
      v8 = objc_msgSendSuper2(&v11, sel_initWithDomain_code_userInfo_, v7, a2, 0);
      if (!a3)
      {
LABEL_5:
        objc_msgSend(v8, "setFailingURL:", *(_QWORD *)(a1 + 8));
        return v8;
      }
    }
    else
    {
      v8 = 0;
      if (!a3)
        goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], a3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUnderlyingError:", v9);

    goto LABEL_5;
  }
  return 0;
}

- (void)setError:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

uint64_t __25__NWURLLoaderFile_start___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  uint64_t v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2 && gLogDatapath)
  {
    v5 = a1;
    if (__nwlog_url_log::onceToken != -1)
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
    v3 = (id)gurlLogObj;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v7 = "-[NWURLLoaderFile start:]_block_invoke";
      v8 = 1024;
      v9 = a2;
      _os_log_impl(&dword_182FBE000, v3, OS_LOG_TYPE_DEBUG, "%{public}s Failed to read file %{errno}d", buf, 0x12u);
    }

    a1 = v5;
  }
  return close(*(_DWORD *)(a1 + 32));
}

- (id)initWithRequest:(void *)a3 queue:
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  objc_super v12;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)NWURLLoaderFile;
    a1 = (id *)objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      objc_msgSend(v5, "URL");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = a1[1];
      a1[1] = (id)v7;

      objc_storeStrong(a1 + 2, a3);
      objc_msgSend(MEMORY[0x1E0C92C78], "propertyForKey:inRequest:", CFSTR("NSURLRequestFileProtocolExpectedDevice"), v5);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[3];
      a1[3] = (id)v9;

    }
  }

  return a1;
}

@end
