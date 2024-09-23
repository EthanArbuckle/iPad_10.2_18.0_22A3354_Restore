@implementation NWStatisticsManager

- (void)handleReadEvent
{
  void *v3;
  ssize_t v4;
  ssize_t i;
  char *v6;
  char *v7;
  unint64_t v8;

  v3 = (void *)MEMORY[0x212BD9F2C](self, a2);
  v4 = recv(-[NWStatisticsManager sockfd](self, "sockfd"), -[NWStatisticsManager readBuffer](self, "readBuffer"), 0x1000uLL, 0);
  if (v4 >= 1)
  {
    for (i = v4;
          i > 0;
          i = recv(-[NWStatisticsManager sockfd](self, "sockfd"), -[NWStatisticsManager readBuffer](self, "readBuffer"), 0x1000uLL, 0))
    {
      v6 = -[NWStatisticsManager readBuffer](self, "readBuffer");
      if ((unint64_t)i >= 0x10)
      {
        v7 = v6;
        do
        {
          v8 = *((unsigned __int16 *)v7 + 6);
          if (v8 < 0x10 || i < (uint64_t)v8)
            break;
          if ((self->_interfaceTraceFd & 0x80000000) == 0 && self->_iftracebuf)
            -[NWStatisticsManager traceMemoryBuf:length:tag:](self, "traceMemoryBuf:length:tag:", v7, *((unsigned __int16 *)v7 + 6), "Input");
          if (!*(_QWORD *)v7
            || !-[NWStatisticsManager handleCompletionMessage:length:](self, "handleCompletionMessage:length:", v7, v8))
          {
            -[NWStatisticsManager handleMessage:length:](self, "handleMessage:length:", v7, v8);
          }
          v7 += v8;
          i -= v8;
        }
        while ((unint64_t)i > 0xF);
      }
    }
  }
  objc_autoreleasePoolPop(v3);
}

- (char)readBuffer
{
  return self->_readBuffer;
}

- (int)sockfd
{
  return self->_sockfd;
}

- (BOOL)handleCompletionMessage:(nstat_msg_hdr *)a3 length:(unsigned int)a4
{
  uint64_t v4;
  NSObject *v7;
  NSObject *v8;
  unint64_t context;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t v35[4];
  NWStatisticsManager *v36;
  __int16 v37;
  unint64_t v38;
  _BYTE buf[24];
  uint64_t v40;

  v4 = *(_QWORD *)&a4;
  v40 = *MEMORY[0x24BDAC8D0];
  -[NWStatisticsManager internalQueue](self, "internalQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (!a3->context)
    return 0;
  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x10) != 0)
  {
    NStatGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      context = a3->context;
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = context;
      _os_log_impl(&dword_211429000, v8, OS_LOG_TYPE_DEBUG, "Manager %p: completion message with context %lld", buf, 0x16u);
    }

  }
  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
    NStatMgrTraceF(self, "%s Manager %p: completion message with context %lld", v10, v11, v12, v13, v14, v15, (char)"-[NWStatisticsManager handleCompletionMessage:length:]");
  if (self->_currentQueryAllReference != a3->context)
    return -[NWStatisticsManager handleCompletion:message:length:](self, "handleCompletion:message:length:", a3->context, a3, v4);
  if ((a3->flags & 2) == 0 || a3->type || self->_continuationCount > 0x27)
  {
    self->_continuationCount = 0;
    self->_currentQueryAllReference = 0;
    if (-[NSMutableDictionary count](self->_queuedQueryAlls, "count"))
    {
      if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x10) != 0)
      {
        NStatGetLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          -[NSMutableDictionary description](self->_queuedQueryAlls, "description");
          v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v27 = objc_msgSend(v26, "UTF8String");
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = v27;
          _os_log_impl(&dword_211429000, v25, OS_LOG_TYPE_DEBUG, "Manager %p: found queued queries %s", buf, 0x16u);

        }
      }
      if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
      {
        -[NSMutableDictionary description](self->_queuedQueryAlls, "description");
        v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v28, "UTF8String");
        NStatMgrTraceF(self, "%s Manager %p: found queued queries %s", v29, v30, v31, v32, v33, v34, (char)"-[NWStatisticsManager handleCompletionMessage:length:]");

      }
      -[NWStatisticsManager startQueuedQuery](self, "startQueuedQuery");
    }
    return -[NWStatisticsManager handleCompletion:message:length:](self, "handleCompletion:message:length:", a3->context, a3, v4);
  }
  *(_QWORD *)&buf[8] = 0;
  *(_DWORD *)&buf[8] = -[NWStatisticsManager commandFromReference:](self, "commandFromReference:");
  *(_QWORD *)buf = a3->context;
  *(_QWORD *)&buf[16] = -1;
  *(_WORD *)&buf[14] = 2;
  ++self->_continuationCount;
  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x10) != 0)
  {
    NStatGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = a3->context;
      *(_DWORD *)v35 = 134218240;
      v36 = self;
      v37 = 2048;
      v38 = v17;
      _os_log_impl(&dword_211429000, v16, OS_LOG_TYPE_DEBUG, "Manager %p: sent continuation for completion message with context %lld", v35, 0x16u);
    }

  }
  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
    NStatMgrTraceF(self, "%s Manager %p: sent continuation for completion message with context %lld", v18, v19, v20, v21, v22, v23, (char)"-[NWStatisticsManager handleCompletionMessage:length:]");
  return -[NWStatisticsManager sendMessage:length:](self, "sendMessage:length:", buf, 24);
}

- (BOOL)queryAll:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  void *v15;
  uint8_t buf[4];
  NWStatisticsManager *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x10) != 0)
  {
    NStatGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = (void *)MEMORY[0x212BDA0A0](v4);
      *(_DWORD *)buf = 134218240;
      v17 = self;
      v18 = 2048;
      v19 = v6;
      _os_log_impl(&dword_211429000, v5, OS_LOG_TYPE_DEBUG, "Manager %p: Query all update, completion %p", buf, 0x16u);

    }
  }
  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
  {
    v15 = (void *)MEMORY[0x212BDA0A0](v4);
    NStatMgrTraceF(self, "%s Manager %p: Query all update, completion %p", v7, v8, v9, v10, v11, v12, (char)"-[NWStatisticsManager queryAll:]");

  }
  if (-[NWStatisticsManager isInvalidated](self, "isInvalidated"))
  {
    if (v4)
      v4[2](v4);
    v13 = 0;
  }
  else
  {
    v13 = -[NWStatisticsManager performQuery:sourceRef:completion:](self, "performQuery:sourceRef:completion:", 1007, -1, v4);
  }

  return v13;
}

- (BOOL)performQuery:(unsigned int)a3 sourceRef:(unint64_t)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  BOOL v23;
  void *v25;
  _QWORD v26[5];
  id v27;
  uint64_t *v28;
  unint64_t v29;
  unsigned int v30;
  _QWORD block[6];
  unsigned int v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint8_t buf[4];
  NWStatisticsManager *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  unint64_t v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x10) != 0)
  {
    NStatGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = "NSTAT_MSG_TYPE_GET_SRC_DESC";
      v11 = "UNKNOWN -???";
      if (a3 == 1007)
        v11 = "NSTAT_MSG_TYPE_GET_UPDATE";
      if (a3 != 1005)
        v10 = v11;
      if (a3 == 1004)
        v12 = "NSTAT_MSG_TYPE_QUERY_SRC";
      else
        v12 = v10;
      v13 = (void *)MEMORY[0x212BDA0A0](v8);
      *(_DWORD *)buf = 134218754;
      v38 = self;
      v39 = 2080;
      v40 = v12;
      v41 = 2048;
      v42 = a4;
      v43 = 2048;
      v44 = v13;
      _os_log_impl(&dword_211429000, v9, OS_LOG_TYPE_DEBUG, "Manager %p: Entry command %s  source ref %llu completion %p", buf, 0x2Au);

    }
  }
  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
  {
    v25 = (void *)MEMORY[0x212BDA0A0](v8);
    NStatMgrTraceF(self, "%s Manager %p: Entry command %s  source ref %llu completion %p", v14, v15, v16, v17, v18, v19, (char)"-[NWStatisticsManager performQuery:sourceRef:completion:]");

  }
  -[NWStatisticsManager internalQueue](self, "internalQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v20);

  if (a4 == -1 || v8)
  {
    -[NWStatisticsManager internalQueue](self, "internalQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __57__NWStatisticsManager_performQuery_sourceRef_completion___block_invoke_2;
    v26[3] = &unk_24CBD2910;
    v26[4] = self;
    v29 = a4;
    v30 = a3;
    v27 = v8;
    v28 = &v33;
    dispatch_sync(v22, v26);

  }
  else
  {
    -[NWStatisticsManager internalQueue](self, "internalQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__NWStatisticsManager_performQuery_sourceRef_completion___block_invoke;
    block[3] = &unk_24CBD2898;
    v32 = a3;
    block[4] = self;
    block[5] = a4;
    dispatch_async(v21, block);

    *((_BYTE *)v34 + 24) = 1;
  }
  v23 = *((_BYTE *)v34 + 24) != 0;
  _Block_object_dispose(&v33, 8);

  return v23;
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 288, 1);
}

- (BOOL)handleCompletion:(unint64_t)a3 message:(nstat_msg_hdr *)a4 length:(unsigned int)a5
{
  uint64_t v5;
  void *v9;
  uint64_t (**v10)(_QWORD, _QWORD, _QWORD);
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v40;
  uint8_t buf[4];
  NWStatisticsManager *v42;
  __int16 v43;
  unint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v5 = *(_QWORD *)&a5;
  v47 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_currentQueries, "objectForKey:", v9);
  v10 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x10) != 0)
  {
    NStatGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = (void *)MEMORY[0x212BDA0A0](v10);
      *(_DWORD *)buf = 134218496;
      v42 = self;
      v43 = 2048;
      v44 = a3;
      v45 = 2048;
      v46 = (uint64_t)v12;
      _os_log_impl(&dword_211429000, v11, OS_LOG_TYPE_DEBUG, "Manager %p: Called with reference %lld find completion %p", buf, 0x20u);

    }
  }
  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
  {
    v40 = (void *)MEMORY[0x212BDA0A0](v10);
    NStatMgrTraceF(self, "%s Manager %p: Called with reference %lld find completion %p", v13, v14, v15, v16, v17, v18, (char)"-[NWStatisticsManager handleCompletion:message:length:]");

  }
  if (v10)
  {
    v19 = ((uint64_t (**)(_QWORD, nstat_msg_hdr *, uint64_t))v10)[2](v10, a4, v5);
    -[NSMutableDictionary removeObjectForKey:](self->_currentQueries, "removeObjectForKey:", v9);
    if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x10) != 0)
    {
      NStatGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        -[NSMutableDictionary description](self->_currentQueries, "description");
        v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v22 = objc_msgSend(v21, "UTF8String");
        *(_DWORD *)buf = 134218242;
        v42 = self;
        v43 = 2080;
        v44 = v22;
        _os_log_impl(&dword_211429000, v20, OS_LOG_TYPE_DEBUG, "Manager %p: after remove currentQueries %s", buf, 0x16u);

      }
    }
    if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
    {
      -[NSMutableDictionary description](self->_currentQueries, "description");
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v23, "UTF8String");
      NStatMgrTraceF(self, "%s Manager %p: after remove currentQueries %s", v24, v25, v26, v27, v28, v29, (char)"-[NWStatisticsManager handleCompletion:message:length:]");
LABEL_19:

    }
  }
  else
  {
    NStatGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      -[NSMutableDictionary description](self->_currentQueries, "description");
      v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v32 = objc_msgSend(v31, "UTF8String");
      *(_DWORD *)buf = 134218498;
      v42 = self;
      v43 = 2048;
      v44 = a3;
      v45 = 2080;
      v46 = v32;
      _os_log_impl(&dword_211429000, v30, OS_LOG_TYPE_ERROR, "Manager %p: can't find completion for key %lld, queries are %s", buf, 0x20u);

    }
    if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
    {
      -[NSMutableDictionary description](self->_currentQueries, "description");
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v23, "UTF8String");
      NStatMgrTraceF(self, "%s Manager %p: can't find completion for key %lld, queries are %s", v33, v34, v35, v36, v37, v38, (char)"-[NWStatisticsManager handleCompletion:message:length:]");
      v19 = 0;
      goto LABEL_19;
    }
    v19 = 0;
  }

  return v19;
}

uint64_t __57__NWStatisticsManager_performQuery_sourceRef_completion___block_invoke_3(uint64_t a1, uint64_t a2, int a3)
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v38;
  _QWORD block[5];
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  int v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "mgrflags") & 0x10) != 0)
  {
    NStatGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_QWORD *)(a1 + 48);
      v8 = *(_QWORD *)(a1 + 32);
      v9 = (void *)MEMORY[0x212BDA0A0](*(_QWORD *)(a1 + 40));
      *(_DWORD *)buf = 134219008;
      v42 = v8;
      v43 = 2048;
      v44 = v7;
      v45 = 2048;
      v46 = a2;
      v47 = 1024;
      v48 = a3;
      v49 = 2048;
      v50 = v9;
      _os_log_impl(&dword_211429000, v6, OS_LOG_TYPE_DEBUG, "Manager %p: Outer completion block called, for ref %lld, msg %p len %d completion %p", buf, 0x30u);

    }
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "mgrflags") & 0x80) != 0)
  {
    v10 = *(void **)(a1 + 32);
    v38 = (void *)MEMORY[0x212BDA0A0](*(_QWORD *)(a1 + 40));
    NStatMgrTraceF(v10, "%s Manager %p: Outer completion block called, for ref %lld, msg %p len %d completion %p", v11, v12, v13, v14, v15, v16, (char)"-[NWStatisticsManager performQuery:sourceRef:completion:]_block_invoke");

  }
  objc_msgSend(*(id *)(a1 + 32), "clientQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17)
    goto LABEL_23;
  if (a2 && *(_DWORD *)(a2 + 8) > 1u)
  {
    NStatGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = *(_QWORD *)(a1 + 32);
      v30 = *(_DWORD *)(a2 + 8);
      *(_DWORD *)buf = 134218240;
      v42 = v29;
      v43 = 1024;
      LODWORD(v44) = v30;
      _os_log_impl(&dword_211429000, v28, OS_LOG_TYPE_ERROR, "Manager %p: Outer completion block called, type mismatch %d", buf, 0x12u);
    }

    if ((objc_msgSend(*(id *)(a1 + 32), "mgrflags") & 0x80) != 0)
      NStatMgrTraceF(*(void **)(a1 + 32), "%s Manager %p: Outer completion block called, type mismatch %d", v31, v32, v33, v34, v35, v36, (char)"-[NWStatisticsManager performQuery:sourceRef:completion:]_block_invoke");
LABEL_23:
    v27 = 0;
    goto LABEL_24;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "mgrflags") & 0x10) != 0)
  {
    NStatGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218240;
      v42 = v19;
      v43 = 2048;
      v44 = a2;
      _os_log_impl(&dword_211429000, v18, OS_LOG_TYPE_DEBUG, "Manager %p: Outer completion block ready to dispatch async to inner block, msg %p", buf, 0x16u);
    }

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "mgrflags") & 0x80) != 0)
    NStatMgrTraceF(*(void **)(a1 + 32), "%s Manager %p: Outer completion block ready to dispatch async to inner block, msg %p", v20, v21, v22, v23, v24, v25, (char)"-[NWStatisticsManager performQuery:sourceRef:completion:]_block_invoke");
  v26 = *(void **)(a1 + 40);
  if (v26)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__NWStatisticsManager_performQuery_sourceRef_completion___block_invoke_2_47;
    block[3] = &unk_24CBD28C0;
    block[4] = *(_QWORD *)(a1 + 32);
    v40 = v26;
    dispatch_async(v17, block);

  }
  v27 = 1;
LABEL_24:

  return v27;
}

void __57__NWStatisticsManager_performQuery_sourceRef_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  id *v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int v42;
  NSObject *v43;
  id *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  id *v56;
  int v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  id *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD v74[5];
  id v75;
  uint64_t v76;
  uint8_t buf[4];
  id *v78;
  __int16 v79;
  _BYTE v80[34];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_nextReferenceForTarget:command:", *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 64));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = MEMORY[0x24BDAC760];
  v74[1] = 3221225472;
  v74[2] = __57__NWStatisticsManager_performQuery_sourceRef_completion___block_invoke_3;
  v74[3] = &unk_24CBD28E8;
  v4 = *(void **)(a1 + 40);
  v74[4] = *(_QWORD *)(a1 + 32);
  v76 = v2;
  v75 = v4;
  v5 = (void *)MEMORY[0x212BDA0A0](v74);
  v6 = (void *)MEMORY[0x212BDA0A0]();
  if ((objc_msgSend(*(id *)(a1 + 32), "mgrflags") & 0x10) != 0)
  {
    NStatGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = *(id **)(a1 + 32);
      v9 = (void *)MEMORY[0x212BDA0A0](v5);
      v10 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 134218752;
      v78 = v8;
      v79 = 2048;
      *(_QWORD *)v80 = v9;
      *(_WORD *)&v80[8] = 2048;
      *(_QWORD *)&v80[10] = v2;
      *(_WORD *)&v80[18] = 2048;
      *(_QWORD *)&v80[20] = v10;
      _os_log_impl(&dword_211429000, v7, OS_LOG_TYPE_DEBUG, "Manager %p: Outer completion block %p for ref %lld  src %llu", buf, 0x2Au);

    }
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "mgrflags") & 0x80) != 0)
  {
    v11 = *(void **)(a1 + 32);
    v12 = (void *)MEMORY[0x212BDA0A0](v5);
    NStatMgrTraceF(v11, "%s Manager %p: Outer completion block %p for ref %lld  src %llu", v13, v14, v15, v16, v17, v18, (char)"-[NWStatisticsManager performQuery:sourceRef:completion:]_block_invoke");

  }
  if (*(_QWORD *)(a1 + 56) != -1)
    goto LABEL_8;
  v51 = objc_msgSend(*(id *)(a1 + 32), "currentQueryAllReference");
  v52 = *(_QWORD **)(a1 + 32);
  if (!v51)
  {
    objc_msgSend(v52, "setCurrentQueryAllReference:", v2);
    v69 = *(void **)(*(_QWORD *)(a1 + 32) + 248);
    v70 = (void *)MEMORY[0x212BDA0A0](v6);
    objc_msgSend(v69, "setObject:forKey:", v70, v3);

LABEL_8:
    if ((objc_msgSend(*(id *)(a1 + 32), "mgrflags") & 0x10) != 0)
    {
      NStatGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v20 = *(void **)(a1 + 32);
        v21 = objc_msgSend(v20, "currentQueryAllReference");
        v22 = *(_QWORD *)(a1 + 32);
        v24 = *(_QWORD *)(v22 + 248);
        v23 = *(_QWORD *)(v22 + 256);
        *(_DWORD *)buf = 134218754;
        v78 = (id *)v20;
        v79 = 2048;
        *(_QWORD *)v80 = v21;
        *(_WORD *)&v80[8] = 2112;
        *(_QWORD *)&v80[10] = v24;
        *(_WORD *)&v80[18] = 2112;
        *(_QWORD *)&v80[20] = v23;
        _os_log_impl(&dword_211429000, v19, OS_LOG_TYPE_DEBUG, "Manager %p: currentQueryAllReference %llu current %@, pending %@", buf, 0x2Au);
      }

    }
    if ((objc_msgSend(*(id *)(a1 + 32), "mgrflags") & 0x80) != 0)
    {
      v25 = *(void **)(a1 + 32);
      objc_msgSend(v25, "currentQueryAllReference");
      NStatMgrTraceF(v25, "%s Manager %p: currentQueryAllReference %llu current %@, pending %@", v26, v27, v28, v29, v30, v31, (char)"-[NWStatisticsManager performQuery:sourceRef:completion:]_block_invoke");
    }
    if ((objc_msgSend(*(id *)(a1 + 32), "mgrflags") & 0x10) != 0)
    {
      NStatGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        v33 = *(id **)(a1 + 32);
        v34 = *(_DWORD *)(a1 + 64);
        v35 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 134219008;
        v78 = v33;
        v79 = 1024;
        *(_DWORD *)v80 = v34;
        *(_WORD *)&v80[4] = 2048;
        *(_QWORD *)&v80[6] = v2;
        *(_WORD *)&v80[14] = 2048;
        *(_QWORD *)&v80[16] = v35;
        *(_WORD *)&v80[24] = 1024;
        *(_DWORD *)&v80[26] = 0;
        _os_log_impl(&dword_211429000, v32, OS_LOG_TYPE_DEBUG, "Manager %p: about to prepare message %x context %lld srcef %llu, prev pended %d", buf, 0x2Cu);
      }

    }
    if ((objc_msgSend(*(id *)(a1 + 32), "mgrflags") & 0x80) != 0)
      NStatMgrTraceF(*(void **)(a1 + 32), "%s Manager %p: about to prepare message %x context %lld srcef %llu, prev pended %d", v36, v37, v38, v39, v40, v41, (char)"-[NWStatisticsManager performQuery:sourceRef:completion:]_block_invoke");
    v42 = *(_DWORD *)(a1 + 64);
    v71 = v2;
    v72 = v42;
    v73 = *(_QWORD *)(a1 + 56);
    if (v73 == -1)
    {
      HIWORD(v72) = 2;
      if ((objc_msgSend(*(id *)(a1 + 32), "mgrflags") & 0x10) != 0)
      {
        NStatGetLog();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          v44 = *(id **)(a1 + 32);
          *(_DWORD *)buf = 134218752;
          v78 = v44;
          v79 = 1024;
          *(_DWORD *)v80 = v42;
          *(_WORD *)&v80[4] = 2048;
          *(_QWORD *)&v80[6] = v2;
          *(_WORD *)&v80[14] = 2048;
          *(_QWORD *)&v80[16] = -1;
          _os_log_impl(&dword_211429000, v43, OS_LOG_TYPE_DEBUG, "Manager %p: about to send message %x context %lld srcef %llu", buf, 0x26u);
        }

      }
      if ((objc_msgSend(*(id *)(a1 + 32), "mgrflags") & 0x80) != 0)
        NStatMgrTraceF(*(void **)(a1 + 32), "%s Manager %p: about to send message %x context %lld srcef %llu", v45, v46, v47, v48, v49, v50, (char)"-[NWStatisticsManager performQuery:sourceRef:completion:]_block_invoke");
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "sendMessage:length:", &v71, 24);
    goto LABEL_36;
  }
  v53 = (void *)v52[32];
  v54 = (void *)MEMORY[0x212BDA0A0](v6);
  objc_msgSend(v53, "setObject:forKey:", v54, v3);

  if ((objc_msgSend(*(id *)(a1 + 32), "mgrflags") & 0x10) != 0)
  {
    NStatGetLog();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
    {
      v56 = *(id **)(a1 + 32);
      v57 = *(_DWORD *)(a1 + 64);
      v58 = *(_QWORD *)(a1 + 56);
      objc_msgSend(v56[32], "description");
      v59 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v60 = objc_msgSend(v59, "UTF8String");
      *(_DWORD *)buf = 134219010;
      v78 = v56;
      v79 = 1024;
      *(_DWORD *)v80 = v57;
      *(_WORD *)&v80[4] = 2048;
      *(_QWORD *)&v80[6] = v2;
      *(_WORD *)&v80[14] = 2048;
      *(_QWORD *)&v80[16] = v58;
      *(_WORD *)&v80[24] = 2080;
      *(_QWORD *)&v80[26] = v60;
      _os_log_impl(&dword_211429000, v55, OS_LOG_TYPE_DEBUG, "Manager %p: set pended for message %x context %lld srcef %llu dictionary %s", buf, 0x30u);

    }
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "mgrflags") & 0x80) != 0)
  {
    v61 = *(id **)(a1 + 32);
    objc_msgSend(v61[32], "description");
    v62 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v62, "UTF8String");
    NStatMgrTraceF(v61, "%s Manager %p: set pended for message %x context %lld srcef %llu dictionary %s", v63, v64, v65, v66, v67, v68, (char)"-[NWStatisticsManager performQuery:sourceRef:completion:]_block_invoke");

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
LABEL_36:

}

- (unsigned)mgrflags
{
  return self->_mgrflags;
}

void __59__NWStatisticsManager_dispatchDidReceiveCounts_fromUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "removing") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v2 = (void *)MEMORY[0x212BD9F2C]();
      objc_msgSend(v3, "sourceDidReceiveCounts:", *(_QWORD *)(a1 + 32));
      objc_autoreleasePoolPop(v2);
    }

  }
}

uint64_t __57__NWStatisticsManager_performQuery_sourceRef_completion___block_invoke_2_47(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isInvalidated");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

void __53__NWStatisticsManager_dispatchDidReceiveDescription___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "removing") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v2 = (void *)MEMORY[0x212BD9F2C]();
      objc_msgSend(v3, "sourceDidReceiveDescription:", *(_QWORD *)(a1 + 32));
      objc_autoreleasePoolPop(v2);
    }

  }
}

uint64_t __37__NWStatisticsManager_initWithQueue___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleReadEvent");
}

- (void)setCurrentQueryAllReference:(unint64_t)a3
{
  self->_currentQueryAllReference = a3;
}

- (BOOL)sendMessage:(nstat_msg_hdr *)a3 length:(int64_t)a4
{
  void *v7;

  -[NWStatisticsManager readSource](self, "readSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    a3->length = a4;
    a3->flags |= 1u;
    if ((self->_interfaceTraceFd & 0x80000000) == 0 && self->_iftracebuf)
      -[NWStatisticsManager traceMemoryBuf:length:tag:](self, "traceMemoryBuf:length:tag:", a3, a4, "Output");
    if (send(-[NWStatisticsManager sockfd](self, "sockfd"), a3, a4, 0) == a4)
      return 1;
    if (a3->context)
      -[NWStatisticsManager handleCompletion:message:length:](self, "handleCompletion:message:length:", a3->context, 0, 0);
  }
  return 0;
}

- (OS_dispatch_source)readSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 232, 1);
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)handleMessage:(nstat_msg_hdr *)a3 length:(int64_t)a4
{
  unsigned int type;
  unint64_t context;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  int v16;
  const char *v17;
  int v18;
  int context_high;
  uint64_t v20;
  char v21;
  int v22;
  unsigned int mgrflags;
  void *v24;
  void *v25;
  void *v26;
  unsigned int *p_type;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  nstat_msg_hdr *v44;
  uint64_t context_low;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint8_t buf[4];
  NWStatisticsManager *v59;
  __int16 v60;
  _BYTE v61[20];
  __int16 v62;
  const char *v63;
  __int16 v64;
  int v65;
  __int16 v66;
  int v67;
  __int16 v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  type = a3->type;
  switch(type)
  {
    case 0x2711u:
      if ((unint64_t)a4 >= 0x20)
      {
        mgrflags = self->_mgrflags;
        if ((mgrflags & 0x20) != 0)
        {
          ++self->_numSourceAddsSkipped;
          if ((mgrflags & 0x40) != 0)
          {
            ++self->_numSourcesQueried;
            -[NWStatisticsManager sendRequestMessage:sourceRef:](self, "sendRequestMessage:sourceRef:", 1007, a3[1].context);
          }
        }
        else
        {
          +[NWStatisticsSource createSourceForProvider:srcRef:manager:](NWStatisticsSource, "createSourceForProvider:srcRef:manager:", a3[1].type, a3[1].context, self);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            -[NWStatisticsManager _internalSources](self, "_internalSources");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3[1].context);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setObject:forKey:", v24, v26);

            ++self->_numSourcesInserted;
            -[NWStatisticsManager dispatchDidAddSource:](self, "dispatchDidAddSource:", v24);
          }
          else
          {
            -[NWStatisticsManager sendRemoveSourceInternal:](self, "sendRemoveSourceInternal:", a3[1].context);
          }

        }
      }
      v50 = self->_numSourceAddsReceived + 1;
      self->_numSourceAddsReceived = v50;
      if ((self->_mgrflags & 0x10) != 0 && !(v50 % 0x64))
        -[NWStatisticsManager reportInternalCounts](self, "reportInternalCounts");
      return;
    case 0x2712u:
    case 0x2713u:
    case 0x2714u:
    case 0x2716u:
      if ((unint64_t)a4 < 0x18)
        return;
      context = a3[1].context;
      -[NWStatisticsManager _internalSources](self, "_internalSources");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", context);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v10);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = a3->type;
      if (v11 == 10002)
      {
        v12 = v57;
        if (v57)
        {
          -[NWStatisticsManager removeSourceInternal:isFromClient:](self, "removeSourceInternal:isFromClient:", context, 0);
LABEL_6:

          return;
        }
      }
      else
      {
        v12 = v57;
        if (v57)
        {
          v21 = objc_msgSend(v57, "removing");
          v12 = v57;
          if ((v21 & 1) == 0)
          {
            v22 = objc_msgSend(v57, "handleMessage:length:", a3, a4);
            v12 = v57;
            if (v22)
            {
              if ((self->_mgrflags & 8) == 0 || (a3->flags & 4) == 0)
              {
                ++self->_numUpdatesDispatched;
                -[NWStatisticsManager dispatchDidReceiveType:source:](self, "dispatchDidReceiveType:source:", a3->type, v57);
                goto LABEL_6;
              }
              ++self->_numUpdatesSkipped;
            }
          }
        }
        else
        {
          if (v11 == 10003)
          {
            v44 = a3 + 2;
          }
          else
          {
            if (v11 != 10006)
              goto LABEL_63;
            v44 = a3 + 9;
          }
          context_low = LODWORD(v44->context);
          if ((context_low - 11) >= 0xFFFFFFF6
            && ((self->_providerFilters[context_low] & 0x100000) != 0 || (self->_mgrflags & 0x20) != 0))
          {
            +[NWStatisticsSource createSourceForProvider:srcRef:manager:](NWStatisticsSource, "createSourceForProvider:srcRef:manager:");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            if (v46)
            {
              -[NWStatisticsManager _internalSources](self, "_internalSources");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", context);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "setObject:forKey:", v46, v48);

              ++self->_numSourcesInserted;
              v49 = objc_msgSend(v46, "handleMessage:length:", a3, a4);
              -[NWStatisticsManager dispatchDidAddSource:](self, "dispatchDidAddSource:", v46);
              if (v49)
              {
                if ((self->_mgrflags & 8) != 0 && (a3->flags & 4) != 0)
                {
                  ++self->_numUpdatesLazySkipped;
                }
                else
                {
                  ++self->_numUpdatesLazyDispatched;
                  -[NWStatisticsManager dispatchDidReceiveType:source:](self, "dispatchDidReceiveType:source:", a3->type, v46);
                }
              }
            }

            goto LABEL_6;
          }
        }
      }
LABEL_63:

      return;
    case 0x2715u:
      if ((unint64_t)a4 < 0x1C)
      {
        NStatGetLog();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v59 = self;
          v60 = 2048;
          *(_QWORD *)v61 = a4;
          _os_log_impl(&dword_211429000, v37, OS_LOG_TYPE_ERROR, "Manager %p: Received message too short SYSINFO_COUNTS length %zd could not read nstat_sysinfo_len", buf, 0x16u);
        }

        if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
          NStatMgrTraceF(self, "%s Manager %p: Received message too short SYSINFO_COUNTS length %zd could not read nstat_sysinfo_len", v38, v39, v40, v41, v42, v43, (char)"-[NWStatisticsManager handleMessage:length:]");
      }
      else
      {
        p_type = &a3[1].type;
        if ((unint64_t)a3[1].type + 24 <= a4)
        {
          -[NWStatisticsManager handleSystemInformationCounts:](self, "handleSystemInformationCounts:", &a3[1].type);
        }
        else
        {
          NStatGetLog();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            v29 = *p_type + 24;
            *(_DWORD *)buf = 134218496;
            v59 = self;
            v60 = 2048;
            *(_QWORD *)v61 = a4;
            *(_WORD *)&v61[8] = 2048;
            *(_QWORD *)&v61[10] = v29;
            _os_log_impl(&dword_211429000, v28, OS_LOG_TYPE_ERROR, "Manager %p: Received message too short SYSINFO_COUNTS length %zd < %zd", buf, 0x20u);
          }

          if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
            NStatMgrTraceF(self, "%s Manager %p: Received message too short SYSINFO_COUNTS length %zd < %zd", v30, v31, v32, v33, v34, v35, (char)"-[NWStatisticsManager handleMessage:length:]");
        }
      }
      return;
    default:
      if (type == 1)
      {
        if ((unint64_t)a4 < 0x28)
        {
          NStatGetLog();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            -[NWStatisticsManager handleMessage:length:].cold.1((uint64_t)a3, v36);

        }
        else
        {
          if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x10) != 0)
          {
            NStatGetLog();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              v14 = a3[1].context;
              v15 = *(_QWORD *)&a3[1].type;
              v16 = a3[2].context;
              v17 = msgTypeToString(v16);
              v18 = WORD2(a3[2].context);
              context_high = HIWORD(a3[2].context);
              if ((unint64_t)a4 < 0x30)
                v20 = 0;
              else
                v20 = *(_QWORD *)&a3[2].type;
              *(_DWORD *)buf = 134219778;
              v59 = self;
              v60 = 1024;
              *(_DWORD *)v61 = v14;
              *(_WORD *)&v61[4] = 2048;
              *(_QWORD *)&v61[6] = v15;
              *(_WORD *)&v61[14] = 1024;
              *(_DWORD *)&v61[16] = v16;
              v62 = 2080;
              v63 = v17;
              v64 = 1024;
              v65 = v18;
              v66 = 1024;
              v67 = context_high;
              v68 = 2048;
              v69 = v20;
              _os_log_impl(&dword_211429000, v13, OS_LOG_TYPE_DEBUG, "Manager %p: error: %d hdr {0x%lld, %d (%s) %d, 0x%x} srcref %lld}", buf, 0x42u);
            }

          }
          if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
          {
            msgTypeToString(a3[2].context);
            NStatMgrTraceF(self, "%s Manager %p: error: %d hdr {0x%lld, %d (%s) %d, 0x%x} srcref %lld}", v51, v52, v53, v54, v55, v56, (char)"-[NWStatisticsManager handleMessage:length:]");
          }
        }
      }
      return;
  }
}

- (void)dispatchDidReceiveType:(unsigned int)a3 source:(id)a4
{
  id v6;
  NWStatisticsManager *v7;
  id v8;
  uint64_t v9;
  id v10;

  v6 = a4;
  switch(a3)
  {
    case 0x2713u:
      v10 = v6;
      -[NWStatisticsManager dispatchDidReceiveDescription:](self, "dispatchDidReceiveDescription:", v6);
LABEL_8:
      v6 = v10;
      break;
    case 0x2714u:
      v7 = self;
      v10 = v6;
      v8 = v6;
      v9 = 0;
      goto LABEL_7;
    case 0x2716u:
      v10 = v6;
      -[NWStatisticsManager dispatchDidReceiveDescription:](self, "dispatchDidReceiveDescription:", v6);
      v7 = self;
      v8 = v10;
      v9 = 1;
LABEL_7:
      -[NWStatisticsManager dispatchDidReceiveCounts:fromUpdate:](v7, "dispatchDidReceiveCounts:fromUpdate:", v8, v9);
      goto LABEL_8;
  }

}

- (void)dispatchDidReceiveDescription:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[NWStatisticsManager clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__NWStatisticsManager_dispatchDidReceiveDescription___block_invoke;
  block[3] = &unk_24CBD27A8;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

- (void)dispatchDidReceiveCounts:(id)a3 fromUpdate:(BOOL)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a3;
  -[NWStatisticsManager clientQueue](self, "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__NWStatisticsManager_dispatchDidReceiveCounts_fromUpdate___block_invoke;
  block[3] = &unk_24CBD27A8;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

- (unint64_t)currentQueryAllReference
{
  return self->_currentQueryAllReference;
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 296, 1);
}

- (unint64_t)_nextReferenceForTarget:(unint64_t)a3 command:(unsigned int)a4
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = self->_querySequenceNumber + 1;
  self->_querySequenceNumber = v4;
  v5 = 4 * v4;
  v6 = v5 | 2;
  v7 = v5 | 1;
  v8 = v5 | 3;
  if (a4 != 1007)
    v8 = v5;
  if (a4 != 1005)
    v7 = v8;
  if (a4 != 1004)
    v6 = v7;
  if (a3 == -1)
    return v6;
  else
    return v5;
}

- (NSMutableDictionary)_internalSources
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 240, 1);
}

- (void)traceMemoryBuf:(char *)a3 length:(int64_t)a4 tag:(char *)a5
{
  NWStatisticsManager *v8;
  size_t v9;
  size_t v10;
  NSObject *v11;
  int v12;
  int *v13;
  char *v14;
  timeval v15;
  uint8_t buf[4];
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = self;
  objc_sync_enter(v8);
  if ((v8->_interfaceTraceFd & 0x80000000) == 0 && v8->_iftracebuf)
  {
    v15.tv_sec = 0;
    *(_QWORD *)&v15.tv_usec = 0;
    gettimeofday(&v15, 0);
    __snprintf_chk(v8->_iftracebuf, 0x1100uLL, 0, 0xFFFFFFFFFFFFFFFFLL, "%ld.%06d %s len %zu\n", v15.tv_sec, v15.tv_usec, a5, a4);
    v9 = strlen(v8->_iftracebuf) + 1;
    v10 = v9 + a4;
    if ((v9 + a4) >> 8 > 0x10)
    {
      NStatGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[NWStatisticsManager traceMemoryBuf:length:tag:].cold.1((uint64_t)a5, a4, v11);
      goto LABEL_9;
    }
    memcpy(&v8->_iftracebuf[v9], a3, a4);
    if (write(v8->_interfaceTraceFd, v8->_iftracebuf, v10) < 0)
    {
      NStatGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = *__error();
        v13 = __error();
        v14 = strerror(*v13);
        *(_DWORD *)buf = 136315650;
        v17 = a5;
        v18 = 1024;
        v19 = v12;
        v20 = 2080;
        v21 = v14;
        _os_log_debug_impl(&dword_211429000, v11, OS_LOG_TYPE_DEBUG, "save %s failed: %d - %s", buf, 0x1Cu);
      }
LABEL_9:

    }
  }
  objc_sync_exit(v8);

}

- (void)trace:(char *)a3
{
  if (a3)
  {
    if ((self->_interfaceTraceFd & 0x80000000) == 0)
      -[NWStatisticsManager traceMemoryBuf:length:tag:](self, "traceMemoryBuf:length:tag:", a3, strlen(a3) + 1, "Trace");
  }
}

- (void)handleSystemInformationCounts:(nstat_sysinfo_counts *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned int *p_var3;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  -[NWStatisticsManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && (int)(((unint64_t)a3->var0 - 8) / 0x28) >= 1)
  {
    v6 = (((unint64_t)a3->var0 - 8) / 0x28);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v6);
    p_var3 = &a3->var2[0].var3;
    while (1)
    {
      v9 = *(p_var3 - 8);
      if (!(_DWORD)v9)
        goto LABEL_15;
      v10 = *(p_var3 - 7);
      if ((v10 & 1) != 0)
        break;
      if ((v10 & 2) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)p_var3 - 3));
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v11 = (void *)v12;
        if (v12)
          goto LABEL_13;
        goto LABEL_15;
      }
      if ((v10 & 4) != 0)
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", p_var3 - 6, *p_var3);
        if (v11)
        {
LABEL_13:
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v13);

        }
      }
LABEL_15:
      p_var3 += 10;
      if (!--v6)
      {
        if (objc_msgSend(v7, "count"))
        {
          -[NWStatisticsManager clientQueue](self, "clientQueue");
          v14 = objc_claimAutoreleasedReturnValue();
          v16[0] = MEMORY[0x24BDAC760];
          v16[1] = 3221225472;
          v16[2] = __53__NWStatisticsManager_handleSystemInformationCounts___block_invoke;
          v16[3] = &unk_24CBD2780;
          v16[4] = self;
          v17 = v7;
          v15 = v7;
          dispatch_async(v14, v16);

        }
        else
        {

        }
        goto LABEL_19;
      }
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *((_QWORD *)p_var3 - 3));
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
LABEL_19:

}

void __53__NWStatisticsManager_handleSystemInformationCounts___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "isInvalidated") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v2 = (void *)MEMORY[0x212BD9F2C]();
      objc_msgSend(v3, "statisticsManager:didReceiveDirectSystemInformation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      objc_autoreleasePoolPop(v2);
    }

  }
}

- (void)reportInternalCounts
{
  NSObject *v3;
  unint64_t numSourceAddsReceived;
  unint64_t numSourcesInserted;
  unint64_t numSourcesRemoved;
  uint64_t v7;
  unint64_t numSourceAddsSkipped;
  unint64_t numSourcesQueried;
  unint64_t numUpdatesDispatched;
  unint64_t numUpdatesSkipped;
  unint64_t numUpdatesLazyDispatched;
  unint64_t numUpdatesLazySkipped;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  NWStatisticsManager *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  unint64_t v39;
  __int16 v40;
  unint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  NStatGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    numSourceAddsReceived = self->_numSourceAddsReceived;
    numSourcesInserted = self->_numSourcesInserted;
    numSourcesRemoved = self->_numSourcesRemoved;
    v7 = -[NSMutableDictionary count](self->__internalSources, "count");
    numSourceAddsSkipped = self->_numSourceAddsSkipped;
    numSourcesQueried = self->_numSourcesQueried;
    numUpdatesDispatched = self->_numUpdatesDispatched;
    numUpdatesSkipped = self->_numUpdatesSkipped;
    numUpdatesLazyDispatched = self->_numUpdatesLazyDispatched;
    numUpdatesLazySkipped = self->_numUpdatesLazySkipped;
    *(_DWORD *)buf = 134220544;
    v21 = self;
    v22 = 2048;
    v23 = numSourceAddsReceived;
    v24 = 2048;
    v25 = numSourcesInserted;
    v26 = 2048;
    v27 = numSourcesRemoved;
    v28 = 2048;
    v29 = v7;
    v30 = 2048;
    v31 = numSourceAddsSkipped;
    v32 = 2048;
    v33 = numSourcesQueried;
    v34 = 2048;
    v35 = numUpdatesDispatched;
    v36 = 2048;
    v37 = numUpdatesSkipped;
    v38 = 2048;
    v39 = numUpdatesLazyDispatched;
    v40 = 2048;
    v41 = numUpdatesLazySkipped;
    _os_log_impl(&dword_211429000, v3, OS_LOG_TYPE_DEBUG, "Manager %p: source kernel added msgs %lld insert %lld remove %lld dict %lld skip %lld query %lld, updates dispatched %lld skipped %lld lazy %lld lazy skip %lld", buf, 0x70u);
  }

  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
  {
    -[NSMutableDictionary count](self->__internalSources, "count");
    NStatMgrTraceF(self, "%s Manager %p: source kernel added msgs %lld insert %lld remove %lld dict %lld skip %lld query %lld, updates dispatched %lld skipped %lld lazy %lld lazy skip %lld", v14, v15, v16, v17, v18, v19, (char)"-[NWStatisticsManager reportInternalCounts]");
  }
}

- (void)dispatchDidAddSource:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NWStatisticsManager clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__NWStatisticsManager_dispatchDidAddSource___block_invoke;
  v7[3] = &unk_24CBD2780;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __44__NWStatisticsManager_dispatchDidAddSource___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = (void *)MEMORY[0x212BD9F2C]();
    objc_msgSend(v3, "statisticsManager:didAddSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    objc_autoreleasePoolPop(v2);
  }

}

- (void)sendRequestMessage:(int)a3 sourceRef:(unint64_t)a4
{
  NSObject *v7;
  _QWORD v8[3];

  -[NWStatisticsManager internalQueue](self, "internalQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (a4 == -1)
    -[NWStatisticsManager sendRequestMessage:sourceRef:].cold.1();
  if (!-[NWStatisticsManager isInvalidated](self, "isInvalidated"))
  {
    v8[0] = 0;
    v8[1] = a3;
    v8[2] = a4;
    -[NWStatisticsManager sendMessage:length:](self, "sendMessage:length:", v8, 24);
  }
}

- (void)startQueuedQuery
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *currentQueries;
  void *v18;
  unint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t v27[4];
  NWStatisticsManager *v28;
  __int16 v29;
  unint64_t v30;
  _BYTE buf[24];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[NSMutableDictionary allKeys](self->_queuedQueryAlls, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x10) != 0)
  {
    NStatGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "description");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = objc_msgSend(v6, "UTF8String");
      _os_log_impl(&dword_211429000, v5, OS_LOG_TYPE_DEBUG, "Manager %p: found keys %s", buf, 0x16u);

    }
  }
  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
  {
    objc_msgSend(v4, "description");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "UTF8String");
    NStatMgrTraceF(self, "%s Manager %p: found keys %s", v8, v9, v10, v11, v12, v13, (char)"-[NWStatisticsManager startQueuedQuery]");

  }
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_queuedQueryAlls, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x212BDA0A0]();

    if (v16)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_queuedQueryAlls, "removeObjectForKey:", v14);
      currentQueries = self->_currentQueries;
      v18 = (void *)MEMORY[0x212BDA0A0](v16);
      -[NSMutableDictionary setObject:forKey:](currentQueries, "setObject:forKey:", v18, v14);

      v19 = objc_msgSend(v14, "unsignedLongLongValue");
      self->_currentQueryAllReference = v19;
      *(_QWORD *)&buf[8] = 0;
      *(_DWORD *)&buf[8] = -[NWStatisticsManager commandFromReference:](self, "commandFromReference:", v19);
      *(_QWORD *)buf = v19;
      *(_QWORD *)&buf[16] = -1;
      *(_WORD *)&buf[14] = 2;
      if (!-[NWStatisticsManager sendMessage:length:](self, "sendMessage:length:", buf, 24))
      {
        -[NWStatisticsManager handleCompletion:message:length:](self, "handleCompletion:message:length:", v19, 0, 0);
        NStatGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v27 = 134218240;
          v28 = self;
          v29 = 2048;
          v30 = v19;
          _os_log_impl(&dword_211429000, v20, OS_LOG_TYPE_ERROR, "Manager %p: Failure to send message with reference %llu", v27, 0x16u);
        }

        if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
          NStatMgrTraceF(self, "%s Manager %p: Failure to send message with reference %llu", v21, v22, v23, v24, v25, v26, (char)"-[NWStatisticsManager startQueuedQuery]");
      }
    }

  }
}

- (BOOL)addSource:(id)a3 request:(nstat_msg_add_src *)a4 length:(unint64_t)a5
{
  id v8;
  dispatch_semaphore_t v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  dispatch_time_t v14;
  BOOL v15;
  _QWORD block[5];
  id v18;
  NSObject *v19;
  nstat_msg_add_src *v20;
  unint64_t v21;

  v8 = a3;
  v9 = dispatch_semaphore_create(0);
  if (v9)
  {
    v10 = v9;
    a4->var0.context = 0;
    -[NWStatisticsManager internalQueue](self, "internalQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__NWStatisticsManager_addSource_request_length___block_invoke;
    block[3] = &unk_24CBD27F8;
    block[4] = self;
    v12 = v8;
    v18 = v12;
    v13 = v10;
    v19 = v13;
    v20 = a4;
    v21 = a5;
    dispatch_sync(v11, block);

    if (a4->var0.context)
    {
      v14 = dispatch_time(0, 10000000000);
      dispatch_semaphore_wait(v13, v14);
    }

    v15 = objc_msgSend(v12, "reference") != 0;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __48__NWStatisticsManager_addSource_request_length___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "readSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "_nextReferenceForTarget:command:", 0, 1001);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __48__NWStatisticsManager_addSource_request_length___block_invoke_2;
    v12[3] = &unk_24CBD27D0;
    v4 = *(id *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 32);
    v13 = v4;
    v14 = v5;
    v15 = *(id *)(a1 + 48);
    v6 = (void *)MEMORY[0x212BDA0A0](v12);
    v7 = (void *)MEMORY[0x212BDA0A0]();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 248);
    v10 = (void *)MEMORY[0x212BDA0A0](v7);
    objc_msgSend(v9, "setObject:forKey:", v10, v8);

    v11 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)(v11 + 8) = 1001;
    *(_QWORD *)v11 = v3;
    objc_msgSend(*(id *)(a1 + 32), "sendMessage:length:");

  }
}

uint64_t __48__NWStatisticsManager_addSource_request_length___block_invoke_2(uint64_t a1, uint64_t a2, unsigned int a3)
{
  void *v4;
  void *v5;
  void *v6;

  if (a3 >= 0x20 && *(_DWORD *)(a2 + 8) == 10001)
  {
    objc_msgSend(*(id *)(a1 + 32), "setReference:", *(_QWORD *)(a2 + 16));
    objc_msgSend(*(id *)(a1 + 40), "_internalSources");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v5, "reference"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return 1;
}

- (void)sendRemoveSourceInternal:(unint64_t)a3
{
  _QWORD v3[3];

  v3[0] = 0;
  v3[1] = 1003;
  v3[2] = a3;
  -[NWStatisticsManager sendMessage:length:](self, "sendMessage:length:", v3, 24);
}

- (void)removeSourceInternal:(unint64_t)a3 isFromClient:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;

  v4 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatisticsManager _internalSources](self, "_internalSources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_13;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = 40;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = 56;
LABEL_7:
      v10 = *(uint64_t *)((char *)&self->super.isa + v9);
      -[NWStatisticsManager sendRemoveSourceInternal:](self, "sendRemoveSourceInternal:", objc_msgSend(v8, "reference"));
      if ((v10 & 0x100000) != 0)
      {
        objc_msgSend(v8, "setRemoving:", 1);
        goto LABEL_13;
      }
      goto LABEL_10;
    }
    -[NWStatisticsManager sendRemoveSourceInternal:](self, "sendRemoveSourceInternal:", objc_msgSend(v8, "reference"));
  }
LABEL_10:
  -[NWStatisticsManager _internalSources](self, "_internalSources");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObjectForKey:", v6);

  ++self->_numSourcesRemoved;
  -[NWStatisticsManager delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NWStatisticsManager clientQueue](self, "clientQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __57__NWStatisticsManager_removeSourceInternal_isFromClient___block_invoke;
    v14[3] = &unk_24CBD2780;
    v14[4] = self;
    v15 = v8;
    dispatch_async(v13, v14);

  }
LABEL_13:

}

void __57__NWStatisticsManager_removeSourceInternal_isFromClient___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = (void *)MEMORY[0x212BD9F2C]();
    objc_msgSend(v3, "statisticsManager:didRemoveSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    objc_autoreleasePoolPop(v2);
  }

}

- (void)subscribeToSystemInformation
{
  NSObject *v3;
  _QWORD block[5];

  -[NWStatisticsManager internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__NWStatisticsManager_subscribeToSystemInformation__block_invoke;
  block[3] = &unk_24CBD27A8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __51__NWStatisticsManager_subscribeToSystemInformation__block_invoke(uint64_t result)
{
  uint64_t v1;
  __int128 v2;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    *(_BYTE *)(v1 + 8) = 1;
    v2 = xmmword_211459A40;
    return objc_msgSend(*(id *)(result + 32), "sendMessage:length:", &v2, 16);
  }
  return result;
}

- (BOOL)addAllForProvider:(int)a3 filter:(unint64_t)a4 events:(unint64_t)a5 pid:(int)a6 uuid:(unsigned __int8 *)(a7
{
  NSObject *v13;
  char v14;
  _QWORD v16[9];
  int v17;
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((a3 - 2) >= 4 && a3 != 8)
    __assert_rtn("-[NWStatisticsManager addAllForProvider:filter:events:pid:uuid:]", "NWStatisticsManager.m", 869, "(provider == NSTAT_PROVIDER_TCP_KERNEL) || (provider == NSTAT_PROVIDER_TCP_USERLAND) || (provider == NSTAT_PROVIDER_UDP_KERNEL) || (provider == NSTAT_PROVIDER_UDP_USERLAND) || (provider == NSTAT_PROVIDER_QUIC_USERLAND)");
  -[NWStatisticsManager internalQueue](self, "internalQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __64__NWStatisticsManager_addAllForProvider_filter_events_pid_uuid___block_invoke;
  v16[3] = &unk_24CBD2820;
  v16[6] = a4;
  v16[7] = a5;
  v17 = a3;
  v18 = a6;
  v16[8] = a7;
  v16[4] = self;
  v16[5] = &v19;
  dispatch_sync(v13, v16);

  v14 = *((_BYTE *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return v14;
}

void __64__NWStatisticsManager_addAllForProvider_filter_events_pid_uuid___block_invoke(uint64_t a1)
{
  __int128 v2;
  uint64_t v3;
  _OWORD *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  _QWORD v24[8];

  v24[7] = *MEMORY[0x24BDAC8D0];
  v2 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)v24 = 0u;
  LODWORD(v24[1]) = 1002;
  *(_OWORD *)&v24[2] = v2;
  memset(&v24[4], 0, 24);
  v3 = *(_QWORD *)(a1 + 72);
  v24[4] = v3;
  v4 = *(_OWORD **)(a1 + 64);
  if (v4)
    *(_OWORD *)&v24[5] = *v4;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * (int)v3 + 24) = v2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "sendMessage:length:", v24, 56);
  NStatGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_DWORD *)(a1 + 72);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      v9 = "success";
    else
      v9 = "failure";
    *(_DWORD *)buf = 134218754;
    v17 = v8;
    v18 = 1024;
    v19 = v6;
    v20 = 2048;
    v21 = v7;
    v22 = 2080;
    v23 = v9;
    _os_log_impl(&dword_211429000, v5, OS_LOG_TYPE_INFO, "Manager %p: add all for provider %d filter 0x%llx returns %s", buf, 0x26u);
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "mgrflags") & 0x80) != 0)
    NStatMgrTraceF(*(void **)(a1 + 32), "%s Manager %p: add all for provider %d filter 0x%llx returns %s", v10, v11, v12, v13, v14, v15, (char)"-[NWStatisticsManager addAllForProvider:filter:events:pid:uuid:]_block_invoke");
}

- (BOOL)addAllTCP:(unint64_t)a3 events:(unint64_t)a4 pid:(int)a5 uuid:(unsigned __int8 *)(a6
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  unsigned __int8 (*v12)[16];
  BOOL v13;
  uint64_t v14;
  unint64_t v15;
  _BOOL4 v16;

  v8 = -805306369;
  if (!a5)
    v8 = -855638017;
  v9 = v8 & a3;
  if (a6)
    v10 = v9;
  else
    v10 = v9 & 0xFFFFFFFFC3FFFFFFLL;
  if (a6)
    v11 = (a3 & 0xC000000) == 0;
  else
    v11 = 1;
  if (v11)
    v12 = 0;
  else
    v12 = a6;
  if (a5)
    v13 = (a3 & 0x3000000) == 0;
  else
    v13 = 1;
  if (v13)
    v14 = 0;
  else
    v14 = a5;
  if ((a3 & 0x30000000) != 0)
    v15 = a3 & 0x30000000;
  else
    v15 = 805306368;
  v16 = (v15 & 0x10000000) == 0
     || -[NWStatisticsManager addAllForProvider:filter:events:pid:uuid:](self, "addAllForProvider:filter:events:pid:uuid:", 2, v10, a4, v14, v12);
  if (v15 >> 29 && v16)
    LOBYTE(v16) = -[NWStatisticsManager addAllForProvider:filter:events:pid:uuid:](self, "addAllForProvider:filter:events:pid:uuid:", 3, v10, a4, v14, v12);
  return v16;
}

- (BOOL)addAllUDP:(unint64_t)a3 events:(unint64_t)a4 pid:(int)a5 uuid:(unsigned __int8 *)(a6
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  unsigned __int8 (*v12)[16];
  BOOL v13;
  uint64_t v14;
  unint64_t v15;
  _BOOL4 v16;

  v8 = -1879048193;
  if (!a5)
    v8 = -1929379841;
  v9 = v8 & a3;
  if (a6)
    v10 = v9;
  else
    v10 = v9 & 0xFFFFFFFF83FFFFFFLL;
  if (a6)
    v11 = (a3 & 0xC000000) == 0;
  else
    v11 = 1;
  if (v11)
    v12 = 0;
  else
    v12 = a6;
  if (a5)
    v13 = (a3 & 0x3000000) == 0;
  else
    v13 = 1;
  if (v13)
    v14 = 0;
  else
    v14 = a5;
  if ((a3 & 0x70000000) != 0)
    v15 = a3 & 0x70000000;
  else
    v15 = 1879048192;
  if ((v15 & 0x10000000) != 0)
  {
    v16 = -[NWStatisticsManager addAllForProvider:filter:events:pid:uuid:](self, "addAllForProvider:filter:events:pid:uuid:", 4, v10, a4, v14, v12);
    if ((v15 & 0x20000000) == 0)
      goto LABEL_27;
  }
  else
  {
    v16 = 1;
    if ((v15 & 0x20000000) == 0)
      goto LABEL_27;
  }
  if (v16)
    v16 = -[NWStatisticsManager addAllForProvider:filter:events:pid:uuid:](self, "addAllForProvider:filter:events:pid:uuid:", 5, v10, a4, v14, v12);
LABEL_27:
  if (v15 >> 30 && v16)
    LOBYTE(v16) = -[NWStatisticsManager addAllForProvider:filter:events:pid:uuid:](self, "addAllForProvider:filter:events:pid:uuid:", 8, v10, a4, v14, v12);
  return v16;
}

- (BOOL)addAllTCP:(unint64_t)a3
{
  return -[NWStatisticsManager addAllTCP:events:pid:uuid:](self, "addAllTCP:events:pid:uuid:", a3, 0, 0, 0);
}

- (BOOL)addAllUDP:(unint64_t)a3
{
  return -[NWStatisticsManager addAllUDP:events:pid:uuid:](self, "addAllUDP:events:pid:uuid:", a3, 0, 0, 0);
}

- (BOOL)addAllRoute:(unint64_t)a3
{
  NWStatisticsManager *v4;
  NSObject *v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = self;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[NWStatisticsManager internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__NWStatisticsManager_addAllRoute___block_invoke;
  block[3] = &unk_24CBD2848;
  block[5] = &v8;
  block[6] = a3;
  block[4] = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v4;
}

void __35__NWStatisticsManager_addAllRoute___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v15 = 0u;
  v18 = 0;
  DWORD2(v15) = 1002;
  LODWORD(v17) = 1;
  *(_QWORD *)&v16 = *(_QWORD *)(a1 + 48);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "sendMessage:length:", &v15, 56);
  NStatGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      v4 = "success";
    else
      v4 = "failure";
    *(_DWORD *)buf = 134218242;
    v12 = v3;
    v13 = 2080;
    v14 = v4;
    _os_log_impl(&dword_211429000, v2, OS_LOG_TYPE_DEBUG, "Manager %p: add all routes returns %s", buf, 0x16u);
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "mgrflags") & 0x80) != 0)
    NStatMgrTraceF(*(void **)(a1 + 32), "%s Manager %p: add all routes returns %s", v5, v6, v7, v8, v9, v10, (char)"-[NWStatisticsManager addAllRoute:]_block_invoke");
}

- (BOOL)addAllRoute
{
  return -[NWStatisticsManager addAllRoute:](self, "addAllRoute:", 0);
}

- (void)removeSource:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[6];

  v4 = objc_msgSend(a3, "reference");
  -[NWStatisticsManager internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__NWStatisticsManager_removeSource___block_invoke;
  v6[3] = &unk_24CBD2870;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(v5, v6);

}

uint64_t __36__NWStatisticsManager_removeSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeSourceInternal:isFromClient:", *(_QWORD *)(a1 + 40), 1);
}

- (unsigned)commandFromReference:(unint64_t)a3
{
  unsigned int v3;

  if ((a3 & 3) == 2)
    v3 = 1004;
  else
    v3 = 1007;
  if ((a3 & 3) == 1)
    return 1005;
  else
    return v3;
}

uint64_t __57__NWStatisticsManager_performQuery_sourceRef_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendRequestMessage:sourceRef:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)queryAllCounts:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  NWStatisticsManager *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x10) != 0)
  {
    NStatGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = (void *)MEMORY[0x212BDA0A0](v4);
      *(_DWORD *)buf = 134218240;
      v15 = self;
      v16 = 2048;
      v17 = v6;
      _os_log_impl(&dword_211429000, v5, OS_LOG_TYPE_DEBUG, "Manager %p: Query all counts, completion %p", buf, 0x16u);

    }
  }
  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
  {
    v13 = (void *)MEMORY[0x212BDA0A0](v4);
    NStatMgrTraceF(self, "%s Manager %p: Query all counts, completion %p", v7, v8, v9, v10, v11, v12, (char)"-[NWStatisticsManager queryAllCounts:]");

  }
  if (-[NWStatisticsManager isInvalidated](self, "isInvalidated"))
  {
    if (v4)
      v4[2](v4);
  }
  else
  {
    -[NWStatisticsManager performQuery:sourceRef:completion:](self, "performQuery:sourceRef:completion:", 1004, -1, v4);
  }

}

- (void)queryAllDescriptions:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  NWStatisticsManager *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x10) != 0)
  {
    NStatGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = (void *)MEMORY[0x212BDA0A0](v4);
      *(_DWORD *)buf = 134218240;
      v15 = self;
      v16 = 2048;
      v17 = v6;
      _os_log_impl(&dword_211429000, v5, OS_LOG_TYPE_DEBUG, "Manager %p: Query all descriptions, completion %p", buf, 0x16u);

    }
  }
  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
  {
    v13 = (void *)MEMORY[0x212BDA0A0](v4);
    NStatMgrTraceF(self, "%s Manager %p: Query all descriptions, completion %p", v7, v8, v9, v10, v11, v12, (char)"-[NWStatisticsManager queryAllDescriptions:]");

  }
  if (-[NWStatisticsManager isInvalidated](self, "isInvalidated"))
  {
    if (v4)
      v4[2](v4);
  }
  else
  {
    -[NWStatisticsManager performQuery:sourceRef:completion:](self, "performQuery:sourceRef:completion:", 1005, -1, v4);
  }

}

- (void)querySource:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  NWStatisticsManager *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x10) != 0)
  {
    NStatGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = objc_msgSend(v6, "reference");
      v10 = (void *)MEMORY[0x212BDA0A0](v7);
      *(_DWORD *)buf = 134218752;
      v19 = self;
      v20 = 2048;
      v21 = v6;
      v22 = 2048;
      v23 = v9;
      v24 = 2048;
      v25 = v10;
      _os_log_impl(&dword_211429000, v8, OS_LOG_TYPE_DEBUG, "Manager %p: Query Source for %p, %llu  completion %p", buf, 0x2Au);

    }
  }
  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
  {
    objc_msgSend(v6, "reference");
    v17 = (void *)MEMORY[0x212BDA0A0](v7);
    NStatMgrTraceF(self, "%s Manager %p: Query Source for %p, %llu  completion %p", v11, v12, v13, v14, v15, v16, (char)"-[NWStatisticsManager querySource:completion:]");

  }
  if (-[NWStatisticsManager isInvalidated](self, "isInvalidated"))
  {
    if (v7)
      v7[2](v7);
  }
  else
  {
    -[NWStatisticsManager performQuery:sourceRef:completion:](self, "performQuery:sourceRef:completion:", 1007, objc_msgSend(v6, "reference"), v7);
  }

}

- (void)setQueuePriority:(int64_t)a3
{
  NSObject *v3;

  NStatGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[NWStatisticsManager setQueuePriority:].cold.1();

}

- (void)setMgrflags:(unsigned int)a3
{
  NSObject *v5;
  _QWORD v6[5];
  unsigned int v7;

  -[NWStatisticsManager internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__NWStatisticsManager_setMgrflags___block_invoke;
  v6[3] = &unk_24CBD2938;
  v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);

}

uint64_t __35__NWStatisticsManager_setMgrflags___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(result + 40);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(_DWORD *)(v2 + 204))
    *(_DWORD *)(v2 + 204) = defaultMgrFlags | v1;
  return result;
}

- (void)setInterfaceTraceFd:(int)a3
{
  NSObject *v5;
  _QWORD v6[5];
  int v7;

  -[NWStatisticsManager internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__NWStatisticsManager_setInterfaceTraceFd___block_invoke;
  v6[3] = &unk_24CBD2938;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

void __43__NWStatisticsManager_setInterfaceTraceFd___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 112))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = malloc_type_malloc(0x1000uLL, 0x1B1A54B4uLL);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v3 = *(_DWORD *)(v2 + 208);
  if ((v3 & 0x80000000) == 0)
  {
    close(v3);
    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_DWORD *)(v2 + 208) = *(_DWORD *)(a1 + 40);
  objc_sync_exit(obj);

}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[NWStatisticsManager internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__NWStatisticsManager_setDelegate___block_invoke;
  block[3] = &unk_24CBD2780;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __35__NWStatisticsManager_setDelegate___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 224), *(id *)(a1 + 40));
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "subscribeToSystemInformation");
  return result;
}

- (unsigned)filter
{
  return self->_filter;
}

- (NSSet)sources
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[NWStatisticsManager internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __30__NWStatisticsManager_sources__block_invoke;
  v6[3] = &unk_24CBD2960;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

void __30__NWStatisticsManager_sources__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(*(id *)(a1 + 32), "_internalSources");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)performAllCompletions:(id)a3
{
  id v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__NWStatisticsManager_performAllCompletions___block_invoke;
  v4[3] = &unk_24CBD29B0;
  v4[4] = self;
  v3 = a3;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);
  objc_msgSend(v3, "removeAllObjects");

}

void __45__NWStatisticsManager_performAllCompletions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = (void *)MEMORY[0x212BDA0A0](a3);
  objc_msgSend(*(id *)(a1 + 32), "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__NWStatisticsManager_performAllCompletions___block_invoke_2;
  block[3] = &unk_24CBD2988;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

uint64_t __45__NWStatisticsManager_performAllCompletions___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  NSObject *v3;
  _QWORD block[5];

  -[NWStatisticsManager internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__NWStatisticsManager_invalidate__block_invoke;
  block[3] = &unk_24CBD27A8;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __33__NWStatisticsManager_invalidate__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _DWORD *v15;
  _DWORD *v16;
  void *v17;

  objc_msgSend(*(id *)(a1 + 32), "readSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "readSource");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v3);

    objc_msgSend(*(id *)(a1 + 32), "setReadSource:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "currentQueries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "currentQueries");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performAllCompletions:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "setCurrentQueries:", 0);
  objc_msgSend(*(id *)(a1 + 32), "queuedQueryAlls");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "queuedQueryAlls");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "performAllCompletions:", v9);

  }
  objc_msgSend(*(id *)(a1 + 32), "setQueuedQueryAlls:", 0);
  while (1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_internalSources");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (!v11)
      break;
    objc_msgSend(*(id *)(a1 + 32), "_internalSources");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "removeSourceInternal:isFromClient:", objc_msgSend(v14, "unsignedLongLongValue"), 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "set_internalSources:", 0);
  v15 = *(_DWORD **)(a1 + 32);
  if ((v15[52] & 0x80000000) == 0)
  {
    v16 = v15;
    objc_sync_enter(v16);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 208) = -1;
    v17 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
    if (v17)
    {
      free(v17);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = 0;
    }
    objc_sync_exit(v16);

    v15 = *(_DWORD **)(a1 + 32);
  }
  return objc_msgSend(v15, "setInvalidated:", 1);
}

- (void)dealloc
{
  NSObject *readSource;
  OS_dispatch_source *v4;
  char *readBuffer;
  objc_super v6;

  readSource = self->_readSource;
  if (readSource)
  {
    dispatch_source_cancel(readSource);
    v4 = self->_readSource;
    self->_readSource = 0;

  }
  readBuffer = self->_readBuffer;
  if (readBuffer)
    free(readBuffer);
  v6.receiver = self;
  v6.super_class = (Class)NWStatisticsManager;
  -[NWStatisticsManager dealloc](&v6, sel_dealloc);
}

- (NWStatisticsManager)initWithQueue:(id)a3
{
  NSObject *v5;
  NWStatisticsManager *v6;
  NWStatisticsManager *v7;
  NWStatisticsManager *v8;
  id v9;
  int v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  int v15;
  char *v16;
  dispatch_qos_class_t qos_class;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *internalQueue;
  NSMutableDictionary *v21;
  NSMutableDictionary *internalSources;
  NSMutableDictionary *v23;
  NSMutableDictionary *currentQueries;
  NSMutableDictionary *v25;
  NSMutableDictionary *queuedQueryAlls;
  NSObject *v27;
  dispatch_source_t v28;
  OS_dispatch_source *readSource;
  unsigned int v30;
  unsigned int v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t id;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  int v42;
  int v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int sockfd;
  uint64_t v56;
  NSObject *v57;
  NSObject *v58;
  NWStatisticsManager *v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  _QWORD v68[4];
  NWStatisticsManager *v69;
  _QWORD handler[4];
  int v71;
  objc_super v72;
  int relative_priority_ptr;
  char __str[16];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  int v80;
  _BYTE v81[28];
  int v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v72.receiver = self;
  v72.super_class = (Class)NWStatisticsManager;
  v6 = -[NWStatisticsManager init](&v72, sel_init);
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = NStatGetLog();
    v10 = socket(32, 2, 2);
    if (v10 == -1)
    {
LABEL_10:
      v7->_sockfd = -1;
      NStatGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[NWStatisticsManager initWithQueue:].cold.1();

LABEL_13:
      v8 = 0;
      goto LABEL_14;
    }
    v11 = v10;
    v80 = 0;
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    *(_OWORD *)__str = 0u;
    v75 = 0u;
    __strlcpy_chk();
    if (ioctl(v11, 0xC0644E03uLL, __str) == -1)
    {
LABEL_9:
      close(v11);
      goto LABEL_10;
    }
    *(_OWORD *)&v81[12] = 0uLL;
    *(_DWORD *)v81 = 139296;
    *(_QWORD *)&v81[4] = *(unsigned int *)__str;
    v82 = 0;
    if (connect(v11, (const sockaddr *)v81, 0x20u))
    {
      NStatGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[NWStatisticsManager initWithQueue:].cold.7();
LABEL_8:

      goto LABEL_9;
    }
    relative_priority_ptr = 0x20000;
    if (setsockopt(v11, 0xFFFF, 4098, &relative_priority_ptr, 4u) == -1)
    {
      NStatGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[NWStatisticsManager initWithQueue:].cold.2();
      goto LABEL_8;
    }
    v15 = fcntl(v11, 3, 0);
    if (fcntl(v11, 4, v15 | 4u) == -1)
    {
      NStatGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[NWStatisticsManager initWithQueue:].cold.3();
      goto LABEL_8;
    }
    v7->_sockfd = v11;
    v16 = (char *)malloc_type_malloc(0x1000uLL, 0xC0652CC9uLL);
    v7->_readBuffer = v16;
    if (!v16)
    {
      NStatGetLog();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        -[NWStatisticsManager initWithQueue:].cold.4();

      close(v7->_sockfd);
      goto LABEL_13;
    }
    objc_storeStrong((id *)&v7->_clientQueue, a3);
    snprintf(__str, 0x3BuLL, "com.apple.network.statistics.manager.%p", v7);
    relative_priority_ptr = 0;
    qos_class = dispatch_queue_get_qos_class(v5, &relative_priority_ptr);
    dispatch_queue_attr_make_with_qos_class(0, qos_class, relative_priority_ptr);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create(__str, v18);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    internalSources = v7->__internalSources;
    v7->__internalSources = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    currentQueries = v7->_currentQueries;
    v7->_currentQueries = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    queuedQueryAlls = v7->_queuedQueryAlls;
    v7->_queuedQueryAlls = v25;

    v27 = v7->_internalQueue;
    if (v27 && v7->__internalSources && v7->_currentQueries && v7->_queuedQueryAlls)
    {
      v28 = dispatch_source_create(MEMORY[0x24BDACA00], v7->_sockfd, 0, v27);
      readSource = v7->_readSource;
      v7->_readSource = (OS_dispatch_source *)v28;

      if (v7->_readSource)
      {
        do
        {
          v30 = __ldxr(&mgrSeqno);
          v31 = v30 + 1;
        }
        while (__stxr(v31, &mgrSeqno));
        v7->_id = v31;
        v7->_interfaceTraceFd = -1;
        if (traceFilePrefix)
        {
          v32 = objc_alloc_init(MEMORY[0x24BDD1500]);
          objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setLocale:", v33);

          objc_msgSend(v32, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZZZZ"));
          objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setTimeZone:", v34);

          v35 = (void *)MEMORY[0x24BDD17C8];
          v36 = traceFilePrefix;
          id = v7->_id;
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "stringFromDate:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "stringWithFormat:", CFSTR("%@-%d.%@.trace"), v36, id, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          v41 = objc_retainAutorelease(v40);
          v42 = open((const char *)objc_msgSend(v41, "UTF8String"), 513, 438);
          if (v42 < 0)
          {
            NStatGetLog();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              -[NWStatisticsManager initWithQueue:].cold.6();

          }
          else
          {
            v43 = v42;
            v7->_iftracebuf = (char *)malloc_type_malloc(0x1000uLL, 0x867A1716uLL);
            v7->_interfaceTraceFd = v43;
          }

        }
        v7->_mgrflags = defaultMgrFlags;
        NStatGetLog();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          NStatGetLog();
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v81 = 134218240;
          *(_QWORD *)&v81[4] = v7;
          *(_WORD *)&v81[12] = 2048;
          *(_QWORD *)&v81[14] = v48;
          _os_log_impl(&dword_211429000, v47, OS_LOG_TYPE_DEBUG, "Manager %p: Log object is at %p", v81, 0x16u);

        }
        if ((-[NWStatisticsManager mgrflags](v7, "mgrflags") & 0x80) != 0)
        {
          NStatGetLog();
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          NStatMgrTraceF(v7, "%s Manager %p: Log object is at %p", v49, v50, v51, v52, v53, v54, (char)"-[NWStatisticsManager initWithQueue:]");

        }
        sockfd = v7->_sockfd;
        v56 = MEMORY[0x24BDAC760];
        v57 = v7->_readSource;
        handler[0] = MEMORY[0x24BDAC760];
        handler[1] = 3221225472;
        handler[2] = __37__NWStatisticsManager_initWithQueue___block_invoke;
        handler[3] = &__block_descriptor_36_e5_v8__0l;
        v71 = sockfd;
        dispatch_source_set_cancel_handler(v57, handler);
        v58 = v7->_readSource;
        v68[0] = v56;
        v68[1] = 3221225472;
        v68[2] = __37__NWStatisticsManager_initWithQueue___block_invoke_2;
        v68[3] = &unk_24CBD27A8;
        v59 = v7;
        v69 = v59;
        dispatch_source_set_event_handler(v58, v68);
        dispatch_resume((dispatch_object_t)v7->_readSource);
        NStatGetLog();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v81 = 134218240;
          *(_QWORD *)&v81[4] = v59;
          *(_WORD *)&v81[12] = 2048;
          *(_QWORD *)&v81[14] = v59;
          _os_log_impl(&dword_211429000, v60, OS_LOG_TYPE_INFO, "Manager %p: Created new NetworkStatistics manager at %p", v81, 0x16u);
        }

        if ((-[NWStatisticsManager mgrflags](v59, "mgrflags") & 0x80) != 0)
          NStatMgrTraceF(v59, "%s Manager %p: Created new NetworkStatistics manager at %p", v61, v62, v63, v64, v65, v66, (char)"-[NWStatisticsManager initWithQueue:]");
        v8 = v59;

        goto LABEL_35;
      }
    }
    else
    {
      NStatGetLog();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        -[NWStatisticsManager initWithQueue:].cold.5();

    }
    close(v7->_sockfd);
    v8 = 0;
LABEL_35:

  }
LABEL_14:

  return v8;
}

uint64_t __37__NWStatisticsManager_initWithQueue___block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (NWStatisticsManager)init
{
  void *v3;
  NWStatisticsManager *v4;

  dispatch_get_global_queue(0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NWStatisticsManager initWithQueue:](self, "initWithQueue:", v3);

  return v4;
}

- (NWStatisticsManagerDelegate)delegate
{
  return (NWStatisticsManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int)interfaceTraceFd
{
  return self->_interfaceTraceFd;
}

- (int)interfaceSourceFd
{
  return self->_interfaceSourceFd;
}

- (void)setInterfaceSourceFd:(int)a3
{
  self->_interfaceSourceFd = a3;
}

- (void)setReadSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (void)setSockfd:(int)a3
{
  self->_sockfd = a3;
}

- (BOOL)isReading
{
  return self->_reading;
}

- (void)setReading:(BOOL)a3
{
  self->_reading = a3;
}

- (void)set_internalSources:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSMutableDictionary)currentQueries
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 248, 1);
}

- (void)setCurrentQueries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NSMutableDictionary)queuedQueryAlls
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 256, 1);
}

- (void)setQueuedQueryAlls:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (unint64_t)querySequenceNumber
{
  return self->_querySequenceNumber;
}

- (void)setQuerySequenceNumber:(unint64_t)a3
{
  self->_querySequenceNumber = a3;
}

- (void)setReadBuffer:(char *)a3
{
  self->_readBuffer = a3;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (id)strongDelegate
{
  return objc_getProperty(self, a2, 304, 1);
}

- (void)setStrongDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_strongDelegate, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_queuedQueryAlls, 0);
  objc_storeStrong((id *)&self->_currentQueries, 0);
  objc_storeStrong((id *)&self->__internalSources, 0);
  objc_storeStrong((id *)&self->_readSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)traceMemoryBuf:(uint64_t)a1 length:(uint64_t)a2 tag:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_debug_impl(&dword_211429000, log, OS_LOG_TYPE_DEBUG, "save %s capacity limit for len %ld", (uint8_t *)&v3, 0x16u);
}

- (void)sendRequestMessage:sourceRef:.cold.1()
{
  __assert_rtn("-[NWStatisticsManager sendRequestMessage:sourceRef:]", "NWStatisticsManager.m", 388, "srcref != NSTAT_SRC_REF_ALL");
}

- (void)handleMessage:(uint64_t)a1 length:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a1 + 16);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_211429000, a2, OS_LOG_TYPE_DEBUG, "error: %d, no quoted message in return", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_4();
}

- (void)setQueuePriority:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_211429000, v0, v1, "Attempt to use obsolete setQueuePriority method", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithQueue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_211429000, v0, v1, "Unable to allocate a kernel control socket", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithQueue:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_211429000, v0, v1, "Unable to set rcv buf size", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithQueue:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_211429000, v0, v1, "Unable to set non-blocking", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithQueue:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_211429000, v0, v1, "Unable to allocate a read buffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithQueue:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_211429000, v0, v1, "Unable to initialize Sources / Queries / queuedQueryAlls", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithQueue:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_211429000, v0, v1, "Unable to open trace file", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithQueue:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_211429000, v0, v1, "Unable to connect to statistics control", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
