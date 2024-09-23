@implementation NWURLSessionRequestBodyFile

- (int64_t)countOfBytesSent
{
  if (self)
    return *(_QWORD *)(self + 32);
  return self;
}

- (void)readMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5
{
  void (**v7)(id, _QWORD, uint64_t, NWURLSessionRequestBodyFile *);
  uint64_t error;
  void *v9;
  NWURLError *v10;
  uint64_t v11;
  NWURLSessionRequestBodyFile *v12;
  void *v13;
  id v14;
  OS_dispatch_io *v15;
  NSObject *queue;
  _QWORD io_handler[5];
  void (**v18)(id, _QWORD, uint64_t, NWURLSessionRequestBodyFile *);
  objc_super *v19;
  objc_super v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v7 = (void (**)(id, _QWORD, uint64_t, NWURLSessionRequestBodyFile *))a5;
  if (self && (error = self->_error, (_DWORD)error))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], error, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [NWURLError alloc];
    if (v10)
    {
      v11 = *MEMORY[0x1E0CB32E8];
      v20.receiver = v10;
      v20.super_class = (Class)NWURLError;
      v12 = -[NWURLSessionRequestBodyFile initWithDomain:code:userInfo:](&v20, sel_initWithDomain_code_userInfo_, v11, -3001, 0);
    }
    else
    {
      v12 = 0;
    }
    -[NWURLSessionRequestBodyFile setUnderlyingError:](v12, "setUnderlyingError:", v9);
    v7[2](v7, 0, 1, v12);

  }
  else
  {
    v20.receiver = 0;
    v20.super_class = (Class)&v20;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__14641;
    v23 = __Block_byref_object_dispose__14642;
    v13 = (void *)MEMORY[0x1E0C80D00];
    v14 = MEMORY[0x1E0C80D00];
    v24 = v13;
    if (self)
    {
      v15 = self->_io;
      queue = self->_queue;
    }
    else
    {
      v15 = 0;
      queue = 0;
    }
    if (a3 <= 0x4000)
      a3 = 0x4000;
    io_handler[0] = MEMORY[0x1E0C809B0];
    io_handler[1] = 3221225472;
    io_handler[2] = __91__NWURLSessionRequestBodyFile_readMinimumIncompleteLength_maximumLength_completionHandler___block_invoke;
    io_handler[3] = &unk_1E14A2058;
    v18 = v7;
    v19 = &v20;
    io_handler[4] = self;
    dispatch_io_read((dispatch_io_t)v15, 0, a3, queue, io_handler);

    _Block_object_dispose(&v20, 8);
  }

}

- (void)close
{
  NSObject *io;

  if (self)
  {
    io = self->_io;
    if (io)
      dispatch_io_close(io, 1uLL);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_io, 0);
}

void __91__NWURLSessionRequestBodyFile_readMinimumIncompleteLength_maximumLength_completionHandler___block_invoke(_QWORD *a1, int a2, void *a3, int a4)
{
  NSObject *v7;
  dispatch_data_t concat;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  size_t size;
  uint64_t v13;
  void *v14;
  NWURLError *v15;
  uint64_t v16;
  id v17;
  NSObject *data;
  objc_super v19;

  v7 = a3;
  data = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], a4, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = [NWURLError alloc];
    if (v15)
    {
      v16 = *MEMORY[0x1E0CB32E8];
      v19.receiver = v15;
      v19.super_class = (Class)NWURLError;
      v17 = objc_msgSendSuper2(&v19, sel_initWithDomain_code_userInfo_, v16, -3001, 0);
    }
    else
    {
      v17 = 0;
    }
    objc_msgSend(v17, "setUnderlyingError:", v14);
    (*(void (**)(void))(a1[5] + 16))();

LABEL_6:
    v11 = data;
    goto LABEL_7;
  }
  concat = dispatch_data_create_concat(*(dispatch_data_t *)(*(_QWORD *)(a1[6] + 8) + 40), v7);
  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = concat;

  v11 = data;
  if (a2)
  {
    size = dispatch_data_get_size(data);
    v13 = a1[4];
    if (v13)
      *(_QWORD *)(v13 + 32) += size;
    (*(void (**)(_QWORD, _QWORD, BOOL, _QWORD))(a1[5] + 16))(a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), size == 0, 0);
    goto LABEL_6;
  }
LABEL_7:

}

uint64_t __60__NWURLSessionRequestBodyFile_initWithFileURL_offset_queue___block_invoke(uint64_t a1, int a2)
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
      v7 = "-[NWURLSessionRequestBodyFile initWithFileURL:offset:queue:]_block_invoke";
      v8 = 1024;
      v9 = a2;
      _os_log_impl(&dword_182FBE000, v3, OS_LOG_TYPE_DEBUG, "%{public}s Failed to read file %{errno}d", buf, 0x12u);
    }

    a1 = v5;
  }
  return close(*(_DWORD *)(a1 + 32));
}

@end
