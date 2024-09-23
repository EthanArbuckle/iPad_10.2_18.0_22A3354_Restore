@implementation NWURLSessionRequestBodyInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (id)initWithFileURL:(void *)a3 queue:
{
  id v6;
  id v7;
  id *v8;
  uint64_t v9;
  int v10;
  id v11;
  id v12;
  NSObject *v13;
  id v15;
  id v16;
  objc_super v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)NWURLSessionRequestBodyInfo;
    v8 = (id *)objc_msgSendSuper2(&v17, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 3, a2);
      v16 = 0;
      v9 = *MEMORY[0x1E0C99998];
      v15 = 0;
      v10 = objc_msgSend(v6, "getResourceValue:forKey:error:", &v16, v9, &v15);
      v11 = v16;
      v12 = v15;
      if (v10)
      {
        a1[1] = (id)objc_msgSend(v11, "longLongValue");
      }
      else
      {
        a1[1] = (id)-1;
        if (__nwlog_url_log::onceToken != -1)
          dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
        v13 = (id)gurlLogObj;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v19 = v6;
          v20 = 2112;
          v21 = v12;
          _os_log_impl(&dword_182FBE000, v13, OS_LOG_TYPE_ERROR, "Failed to size file %@: %@", buf, 0x16u);
        }

      }
      objc_storeStrong(a1 + 5, a3);

    }
  }

  return a1;
}

- (id)initWithRequest:(void *)a3 queue:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  objc_super v16;

  v6 = a3;
  if (a1)
  {
    v7 = a2;
    objc_msgSend(v7, "HTTPBody");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "HTTPBodyStream");
    v9 = objc_claimAutoreleasedReturnValue();

    if (v8 | v9)
    {
      v16.receiver = a1;
      v16.super_class = (Class)NWURLSessionRequestBodyInfo;
      v11 = objc_msgSendSuper2(&v16, sel_init);
      if (v11)
      {
        if (v8)
        {
          v12 = objc_msgSend((id)v8, "_createDispatchData");
          v13 = (void *)*((_QWORD *)v11 + 2);
          *((_QWORD *)v11 + 2) = v12;

          v14 = objc_msgSend((id)v8, "length");
        }
        else
        {
          if (!objc_msgSend((id)v9, "streamStatus"))
            objc_storeStrong((id *)v11 + 4, (id)v9);
          v14 = -1;
        }
        *((_QWORD *)v11 + 1) = v14;
        objc_storeStrong((id *)v11 + 5, a3);
      }
      a1 = v11;
      v10 = a1;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)bodyProviderFromOffset:(id *)a1
{
  NSObject *v2;
  id *v3;
  id v4;
  NWURLSessionRequestBodyData *v5;
  id v6;
  id *v7;
  NWURLSessionRequestBodyFile *v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  dispatch_fd_t v13;
  dispatch_io_t v14;
  id v15;
  id v16;
  id v17;
  NWURLSessionRequestBodyStream *v18;
  id v19;
  NWURLSessionReadRequest *v20;
  id v21;
  objc_super cleanup_handler;
  uint64_t (*v24)(uint64_t, int);
  void *v25;
  dispatch_fd_t v26;
  objc_super v27;

  v3 = a1;
  if (!a1)
    return v3;
  v4 = a2;
  if (a1[2])
  {
    v5 = [NWURLSessionRequestBodyData alloc];
    v6 = v3[2];
    v2 = v6;
    if (v5)
    {
      cleanup_handler.receiver = v5;
      cleanup_handler.super_class = (Class)NWURLSessionRequestBodyData;
      v7 = objc_msgSendSuper2(&cleanup_handler, sel_init);
      v3 = v7;
      if (v7)
      {
        objc_storeStrong(v7 + 1, v6);
        v3[2] = (id)dispatch_data_get_size(v2);
        v3[3] = v4;
      }
      goto LABEL_6;
    }
LABEL_26:
    v3 = 0;
LABEL_6:

    return v3;
  }
  if (!a1[3])
  {
    v16 = a1[4];
    if (v16)
    {
      if (a1[6] != a2)
      {
        _os_crash();
        __break(1u);
        goto LABEL_25;
      }
      a1[4] = 0;
      v17 = v16;

      v18 = [NWURLSessionRequestBodyStream alloc];
      v19 = v3[5];
      v4 = v17;
      v2 = v19;
      if (v18)
      {
        cleanup_handler.receiver = v18;
        cleanup_handler.super_class = (Class)NWURLSessionRequestBodyStream;
        v3 = objc_msgSendSuper2(&cleanup_handler, sel_init);
        if (!v3)
        {
LABEL_21:

          return v3;
        }
        if (!objc_msgSend(v4, "streamStatus"))
        {
          objc_storeStrong(v3 + 2, v16);
          v3[3] = 0;
          objc_storeStrong(v3 + 4, v19);
          v20 = objc_alloc_init(NWURLSessionReadRequest);
          v21 = v3[5];
          v3[5] = v20;

          goto LABEL_21;
        }
LABEL_25:
        _os_crash();
        __break(1u);
        goto LABEL_26;
      }
    }
    else
    {
      _os_crash();
      __break(1u);
    }
    v3 = 0;
    goto LABEL_21;
  }
  v8 = [NWURLSessionRequestBodyFile alloc];
  v9 = v3[5];
  v10 = v3[3];
  v11 = v9;
  if (v8)
  {
    v27.receiver = v8;
    v27.super_class = (Class)NWURLSessionRequestBodyFile;
    v3 = objc_msgSendSuper2(&v27, sel_init);
    if (v3)
    {
      v12 = open((const char *)objc_msgSend(v10, "fileSystemRepresentation"), 0);
      if (v12 < 0)
      {
        *((_DWORD *)v3 + 2) = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
      }
      else
      {
        v13 = v12;
        if (v4)
        {
          lseek(v12, (off_t)v4, 0);
          v3[4] = v4;
        }
        cleanup_handler.receiver = (id)MEMORY[0x1E0C809B0];
        cleanup_handler.super_class = (Class)3221225472;
        v24 = __60__NWURLSessionRequestBodyFile_initWithFileURL_offset_queue___block_invoke;
        v25 = &__block_descriptor_36_e8_v12__0i8l;
        v26 = v13;
        v14 = dispatch_io_create(0, v13, v11, &cleanup_handler);
        v15 = v3[2];
        v3[2] = v14;

        dispatch_io_set_low_water((dispatch_io_t)v3[2], 0xFFFFFFFFFFFFFFFFLL);
        objc_storeStrong(v3 + 3, v9);
      }
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
