@implementation ABPKMLNetworkV2

- (ABPKMLNetworkV2)initWithNetworkPath:(id)a3 inputNames:(id)a4 outputNames:(id)a5 useSurface:(BOOL)a6
{
  return -[ABPKMLNetworkV2 initWithNetworkPath:networkConfig:inputNames:outputNames:useSurface:](self, "initWithNetworkPath:networkConfig:inputNames:outputNames:useSurface:", a3, CFSTR("main"), a4, a5, a6);
}

- (ABPKMLNetworkV2)initWithNetworkPath:(id)a3 networkConfig:(id)a4 inputNames:(id)a5 outputNames:(id)a6 useSurface:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  ABPKMLNetworkV2 *v16;
  NSObject *v17;
  id v18;
  id v19;
  uint64_t v20;
  NSString *networkPath;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  ABPKMLNetworkBufferV2 *v29;
  ABPKMLNetworkBufferV2 *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  ABPKMLNetworkBufferV2 *v38;
  ABPKMLNetworkBufferV2 *v39;
  ABPKMLNetworkV2 *v40;
  NSObject *v41;
  NSObject *v42;
  const char *last_error_message;
  id v45;
  id v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  objc_super v56;
  _BYTE v57[128];
  uint8_t v58[128];
  uint8_t buf[4];
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v56.receiver = self;
  v56.super_class = (Class)ABPKMLNetworkV2;
  v16 = -[ABPKMLNetworkV2 init](&v56, sel_init);
  if (v16)
  {
    v47 = v15;
    __ABPKLogSharedInstance();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v13;
      _os_log_impl(&dword_210836000, v17, OS_LOG_TYPE_DEBUG, " network  config %@. ", buf, 0xCu);
    }

    v18 = objc_retainAutorelease(v12);
    objc_msgSend(v18, "UTF8String");
    v19 = objc_retainAutorelease(v18);
    objc_msgSend(v19, "UTF8String");
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    if (e5rt_execution_stream_operation_create_precompiled_compute_operation())
      goto LABEL_31;
    v20 = objc_msgSend(v19, "copy");
    networkPath = v16->_networkPath;
    v16->_networkPath = (NSString *)v20;

    v16->_useSurface = a7;
    v22 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v46 = v14;
    v23 = v14;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v53;
      while (2)
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v53 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          v29 = -[ABPKMLNetworkBufferV2 initWithName:operation:bindMode:useSurface:]([ABPKMLNetworkBufferV2 alloc], "initWithName:operation:bindMode:useSurface:", v28, v16->_operation, 0, v16->_useSurface);
          if (!v29)
          {
            __ABPKLogSharedInstance();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v60 = v28;
              _os_log_impl(&dword_210836000, v41, OS_LOG_TYPE_ERROR, " Could not create network buffer %@. ", buf, 0xCu);
            }

            v40 = 0;
            v14 = v46;
            v15 = v47;
            goto LABEL_30;
          }
          v30 = v29;
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v29, v28);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
        if (v25)
          continue;
        break;
      }
    }
    v45 = v12;

    objc_storeStrong((id *)&v16->_inputBuffers, v22);
    v31 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v32 = v47;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    if (!v33)
      goto LABEL_21;
    v34 = v33;
    v35 = *(_QWORD *)v49;
LABEL_15:
    v36 = 0;
    while (1)
    {
      if (*(_QWORD *)v49 != v35)
        objc_enumerationMutation(v32);
      v37 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v36);
      v38 = -[ABPKMLNetworkBufferV2 initWithName:operation:bindMode:useSurface:]([ABPKMLNetworkBufferV2 alloc], "initWithName:operation:bindMode:useSurface:", v37, v16->_operation, 1, 0);
      if (!v38)
        break;
      v39 = v38;
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v38, v37);

      if (v34 == ++v36)
      {
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
        if (!v34)
        {
LABEL_21:

          objc_storeStrong((id *)&v16->_outputBuffers, v31);
          if (!e5rt_execution_stream_create())
          {

            v12 = v45;
            v14 = v46;
            v15 = v47;
            goto LABEL_23;
          }
LABEL_31:
          last_error_message = (const char *)e5rt_get_last_error_message();
          printf("E5RT operation failed with message = %s", last_error_message);
          exit(1);
        }
        goto LABEL_15;
      }
    }
    __ABPKLogSharedInstance();
    v42 = objc_claimAutoreleasedReturnValue();
    v15 = v47;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v37;
      _os_log_impl(&dword_210836000, v42, OS_LOG_TYPE_ERROR, " Could not create network buffer %@. ", buf, 0xCu);
    }

    v40 = 0;
    v12 = v45;
    v14 = v46;
  }
  else
  {
LABEL_23:
    v40 = v16;
  }
LABEL_30:

  return v40;
}

- (BOOL)execute
{
  const char *last_error_message;

  e5rt_execution_stream_encode_operation();
  if (e5rt_execution_stream_execute_sync())
  {
    last_error_message = (const char *)e5rt_get_last_error_message();
    printf("E5RT operation failed with message = %s", last_error_message);
    exit(1);
  }
  e5rt_execution_stream_reset();
  return 1;
}

- (BOOL)changeNetWorkConfig:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  const char *last_error_message;
  uint8_t buf[4];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (e5rt_execution_stream_operation_release())
    goto LABEL_10;
  -[NSString UTF8String](self->_networkPath, "UTF8String");
  -[NSString UTF8String](self->_networkPath, "UTF8String");
  v5 = objc_retainAutorelease(v4);
  objc_msgSend(v5, "UTF8String");
  if (e5rt_execution_stream_operation_create_precompiled_compute_operation()
    || e5rt_execution_stream_operation_get_num_inputs())
  {
    goto LABEL_10;
  }
  __ABPKLogSharedInstance();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v6, OS_LOG_TYPE_DEBUG, " Expected input names: ", buf, 2u);
  }

  v7 = malloc_type_malloc(0, 0x10040436913F5uLL);
  if (e5rt_execution_stream_operation_get_input_names()
    || (free(v7), e5rt_execution_stream_operation_get_num_outputs())
    || (v8 = malloc_type_malloc(0, 0x10040436913F5uLL),
        e5rt_execution_stream_operation_get_output_names()))
  {
LABEL_10:
    last_error_message = (const char *)e5rt_get_last_error_message();
    printf("E5RT operation failed with message = %s", last_error_message);
    exit(1);
  }
  free(v8);

  return 1;
}

- (void)dealloc
{
  objc_super v3;

  e5rt_execution_stream_release();
  e5rt_execution_stream_operation_release();
  v3.receiver = self;
  v3.super_class = (Class)ABPKMLNetworkV2;
  -[ABPKMLNetworkV2 dealloc](&v3, sel_dealloc);
}

- (NSMutableDictionary)inputBuffers
{
  return self->_inputBuffers;
}

- (NSMutableDictionary)outputBuffers
{
  return self->_outputBuffers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputBuffers, 0);
  objc_storeStrong((id *)&self->_inputBuffers, 0);
  objc_storeStrong((id *)&self->_networkPath, 0);
}

@end
