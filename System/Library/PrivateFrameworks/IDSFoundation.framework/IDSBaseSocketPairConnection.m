@implementation IDSBaseSocketPairConnection

- (IDSBaseSocketPairConnection)initWithQueue:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  IDSBaseSocketPairConnection *v10;
  double v11;
  uint64_t v12;
  IMWeakReference *delegate;
  id v14;
  const char *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  const char *v19;
  double v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  double v29;
  const char *v30;
  dispatch_queue_t v31;
  OS_dispatch_queue *readQueue;
  NSMutableArray *v33;
  NSMutableArray *outgoingDataArray;
  objc_super v36;

  v7 = a3;
  v8 = a4;
  v36.receiver = self;
  v36.super_class = (Class)IDSBaseSocketPairConnection;
  v10 = -[IDSBaseSocketPairConnection init](&v36, sel_init);
  if (v10)
  {
    objc_msgSend_weakRefWithObject_(MEMORY[0x1E0D36B18], v9, (uint64_t)v8, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    delegate = v10->_delegate;
    v10->_delegate = (IMWeakReference *)v12;

    objc_storeStrong((id *)&v10->_queue, a3);
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend_stringGUID(MEMORY[0x1E0CB3940], v15, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend_initWithFormat_(v14, v19, (uint64_t)CFSTR("com.apple.identityservices.socketConnection-%@"), v20, v18);

    LOBYTE(v18) = IMGetDomainBoolForKey();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if ((v18 & 1) != 0)
    {
      dispatch_queue_attr_make_with_qos_class(v22, QOS_CLASS_USER_INTERACTIVE, 0);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = v22;
    }
    v25 = v24;
    v26 = objc_retainAutorelease(v21);
    v30 = (const char *)objc_msgSend_UTF8String(v26, v27, v28, v29);
    v31 = dispatch_queue_create(v30, v25);
    readQueue = v10->_readQueue;
    v10->_readQueue = (OS_dispatch_queue *)v31;

    v10->_lastDateCheck = 0.0;
    v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    outgoingDataArray = v10->_outgoingDataArray;
    v10->_outgoingDataArray = v33;

  }
  return v10;
}

- (IDSBaseSocketPairConnection)initWithSocket:(int)a3 queue:(id)a4 delegate:(id)a5 start:(BOOL)a6
{
  double v6;
  _BOOL4 v7;
  IDSBaseSocketPairConnection *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  IDSBaseSocketPairConnection *v13;

  v7 = a6;
  v9 = (IDSBaseSocketPairConnection *)objc_msgSend_initWithQueue_delegate_(self, a2, (uint64_t)a4, v6, a5);
  v13 = v9;
  if (v9)
  {
    v9->_connectedSocket = a3;
    if (v7)
      objc_msgSend_start(v9, v10, v11, v12);
  }
  return v13;
}

- (IDSBaseSocketPairConnection)initWithSocket:(int)a3 queue:(id)a4 delegate:(id)a5
{
  return (IDSBaseSocketPairConnection *)((uint64_t (*)(IDSBaseSocketPairConnection *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_initWithSocket_queue_delegate_start_, *(_QWORD *)&a3);
}

- (void)dealloc
{
  uint64_t v2;
  double v3;
  objc_super v5;

  objc_msgSend_endSession(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)IDSBaseSocketPairConnection;
  -[IDSBaseSocketPairConnection dealloc](&v5, sel_dealloc);
}

- (void)endSession
{
  OS_dispatch_queue *readQueue;
  NSObject *readSource;
  OS_dispatch_source *v5;
  NSObject *writeSource;
  OS_dispatch_source *v7;
  int connectedSocket;
  uint64_t v9;
  const char *v10;
  _QWORD v11[5];

  readQueue = self->_readQueue;
  if (readQueue)
  {
    self->_readQueue = 0;

  }
  readSource = self->_readSource;
  if (readSource)
  {
    dispatch_source_cancel(readSource);
    v5 = self->_readSource;
    self->_readSource = 0;

  }
  writeSource = self->_writeSource;
  if (writeSource)
  {
    dispatch_source_cancel(writeSource);
    if (!self->_writeSourceIsResumed)
      dispatch_resume((dispatch_object_t)self->_writeSource);
    v7 = self->_writeSource;
    self->_writeSource = 0;

  }
  self->_writeSourceIsResumed = 0;
  connectedSocket = self->_connectedSocket;
  if ((connectedSocket & 0x80000000) == 0)
  {
    close(connectedSocket);
    v9 = MEMORY[0x1E0C809B0];
    self->_connectedSocket = -1;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = sub_19B9B9528;
    v11[3] = &unk_1E3C1FBB0;
    v11[4] = self;
    objc_msgSend__callDelegatesWithBlock_(self, v10, (uint64_t)v11, COERCE_DOUBLE(3221225472));
  }
}

- (void)setDestination:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  int connectedSocket;
  const sockaddr *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  unsigned __int8 *v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    connectedSocket = self->_connectedSocket;
    if ((connectedSocket & 0x80000000) == 0)
    {
      v14 = v4;
      v9 = (const sockaddr *)objc_msgSend_sa(v4, v5, v6, v7);
      v13 = (unsigned __int8 *)objc_msgSend_sa(v14, v10, v11, v12);
      connect(connectedSocket, v9, *v13);
      v4 = v14;
    }
  }

}

- (void)_callDelegatesWithBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  double v7;
  uint64_t v8;
  void *v9;
  NSObject *queue;
  BOOL v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  if (v6)
  {
    objc_msgSend_object(self->_delegate, v4, v5, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    queue = self->_queue;
    if (queue)
      v11 = v8 == 0;
    else
      v11 = 1;
    if (!v11)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = sub_19B9B9688;
      v12[3] = &unk_1E3C1C7E8;
      v14 = v6;
      v13 = v9;
      dispatch_async(queue, v12);

    }
  }

}

- (void)_processBytesAvailable
{
  ssize_t v3;
  ssize_t v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  id v19;
  const char *v20;
  double v21;
  const char *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  NSObject *v31;
  double prevBPS;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  double v37;
  NSObject *v38;
  int v39;
  int *v40;
  char *v41;
  const char *v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  int *v46;
  uint64_t v47;
  int *v48;
  uint64_t v49;
  char *v50;
  _QWORD v51[5];
  id v52;
  uint8_t buf[4];
  _BYTE v54[18];
  _BYTE __b[10000];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  memset(__b, 170, sizeof(__b));
  v3 = recv(self->_connectedSocket, __b, 0x2710uLL, 0);
  v4 = v3;
  if (v3 < 0)
  {
    if (*__error() == 35)
    {
      OSLogHandleForIDSCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v33, OS_LOG_TYPE_DEFAULT, "resource temporarily unavailable, trying again later...", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
          MarcoLog();
        if (IMShouldLog())
          IMLogString();
      }
    }
    else
    {
      OSLogHandleForIDSCategory();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = *__error();
        v40 = __error();
        v41 = strerror(*v40);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v54 = v39;
        *(_WORD *)&v54[4] = 2080;
        *(_QWORD *)&v54[6] = v41;
        _os_log_impl(&dword_19B949000, v38, OS_LOG_TYPE_DEFAULT, "Error %d (%s) when receiving bytes, closing connection", buf, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
        {
          v45 = *__error();
          v46 = __error();
          v49 = v45;
          v50 = strerror(*v46);
          MarcoLog();
        }
        if (IMShouldLog())
        {
          v47 = *__error();
          v48 = __error();
          v49 = v47;
          v50 = strerror(*v48);
          IMLogString();
        }
      }
      objc_msgSend_endSession(self, v42, v43, v44, v49, v50);
    }
  }
  else if (v3)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99D50]);
    v8 = (void *)objc_msgSend_initWithBytes_length_(v5, v6, (uint64_t)__b, v7, v4);
    OSLogHandleForIDSCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v54 = objc_msgSend_hash(v8, v10, v11, v12);
      _os_log_impl(&dword_19B949000, v9, OS_LOG_TYPE_DEFAULT, "Processing incoming bytes %lu", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        objc_msgSend_hash(v8, v13, v14, v15);
        MarcoLog();
      }
      if (IMShouldLog())
      {
        objc_msgSend_hash(v8, v16, v17, v18);
        IMLogString();
      }
    }
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = sub_19B9B9D2C;
    v51[3] = &unk_1E3C1FBD8;
    v51[4] = self;
    v52 = v8;
    v19 = v8;
    objc_msgSend__callDelegatesWithBlock_(self, v20, (uint64_t)v51, v21);
    v25 = objc_msgSend_length(v19, v22, v23, v24);

    self->_bytesReceived += v25;
    if (self->_lastDateCheck == 0.0)
    {
      IMTimeOfDay();
      self->_lastDateCheck = v26;
    }
    IMTimeOfDay();
    v28 = v27;
    v29 = v27 - self->_lastDateCheck;
    if (v29 >= 1.0)
    {
      v30 = (double)(8 * self->_bytesReceived) / v29;
      self->_prevBPS = v30 * 0.1 + self->_prevBPS * 0.9;
      OSLogHandleForIDSCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        prevBPS = self->_prevBPS;
        *(_DWORD *)buf = 134218240;
        *(double *)v54 = prevBPS;
        *(_WORD *)&v54[8] = 2048;
        *(double *)&v54[10] = v30;
        _os_log_impl(&dword_19B949000, v31, OS_LOG_TYPE_DEFAULT, "Socekt Pair BPS: avg %f instant %f", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
          MarcoLog();
        if (IMShouldLog())
          IMLogString();
      }
      self->_bytesReceived = 0;
      self->_lastDateCheck = v28;
    }

  }
  else
  {
    OSLogHandleForIDSCategory();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v34, OS_LOG_TYPE_DEFAULT, "Remote side closed the connection, cleaning up", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
        MarcoLog();
      if (IMShouldLog())
        IMLogString();
    }
    objc_msgSend_endSession(self, v35, v36, v37);
  }
}

- (void)start
{
  NSObject *readQueue;
  _QWORD block[5];

  readQueue = self->_readQueue;
  if (readQueue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19B9B9DD4;
    block[3] = &unk_1E3C1F898;
    block[4] = self;
    dispatch_async(readQueue, block);
  }
}

- (void)_sendToConnectedSocket
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  int connectedSocket;
  id v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const void *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  size_t v18;
  const char *v19;
  double v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  NSObject *v25;
  NSObject *writeSource;
  NSObject *v27;
  NSObject *v28;
  int v29;
  int *v30;
  char *v31;
  const char *v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  int *v36;
  uint64_t v37;
  int *v38;
  NSObject *v39;
  const char *v40;
  double v41;
  NSObject *v42;
  int v43;
  int *v44;
  char *v45;
  const char *v46;
  uint64_t v47;
  double v48;
  const char *v49;
  double v50;
  uint64_t v51;
  int *v52;
  const char *v53;
  uint64_t v54;
  double v55;
  uint64_t v56;
  int *v57;
  const char *v58;
  uint64_t v59;
  double v60;
  NSObject *v61;
  int v62;
  int *v63;
  char *v64;
  const char *v65;
  uint64_t v66;
  double v67;
  const char *v68;
  uint64_t v69;
  double v70;
  uint64_t v71;
  int *v72;
  const char *v73;
  uint64_t v74;
  double v75;
  uint64_t v76;
  int *v77;
  const char *v78;
  uint64_t v79;
  double v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  socklen_t v84;
  unsigned int v85;
  uint8_t buf[4];
  unsigned int v87;
  __int16 v88;
  char *v89;
  __int16 v90;
  uint64_t v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  if (self->_connectedSocket < 0)
  {
    OSLogHandleForIDSCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v21, OS_LOG_TYPE_DEFAULT, "Connected socket closed, cannot send data, cleaning up...", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
        MarcoLog();
      if (IMShouldLog())
        IMLogString();
    }
    objc_msgSend_endSession(self, v22, v23, v24);
  }
  else if (objc_msgSend_count(self->_outgoingDataArray, a2, v2, v3))
  {
    objc_msgSend_firstObject(self->_outgoingDataArray, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    connectedSocket = self->_connectedSocket;
    v10 = objc_retainAutorelease(v8);
    v14 = (const void *)objc_msgSend_bytes(v10, v11, v12, v13);
    v18 = objc_msgSend_length(v10, v15, v16, v17);
    if (send(connectedSocket, v14, v18, 0) < 0)
    {
      if (*__error() == 35)
      {
        OSLogHandleForIDSCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B949000, v27, OS_LOG_TYPE_DEFAULT, "socket timeout, ignoring...", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (MarcoShouldLog())
            MarcoLog();
          if (IMShouldLog())
            IMLogString();
        }
      }
      else if (*__error() == 55)
      {
        v84 = 4;
        v85 = -1431655766;
        if (getsockopt(self->_connectedSocket, 0xFFFF, 4098, &v85, &v84) < 0)
        {
          OSLogHandleForIDSCategory();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = *__error();
            v30 = __error();
            v31 = strerror(*v30);
            *(_DWORD *)buf = 67109378;
            v87 = v29;
            v88 = 2080;
            v89 = v31;
            _os_log_impl(&dword_19B949000, v28, OS_LOG_TYPE_DEFAULT, "error %d (%s) trying to get SO_RCVBUF size, cleaning up...", buf, 0x12u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
            {
              v35 = *__error();
              v36 = __error();
              v81 = v35;
              v82 = strerror(*v36);
              MarcoLog();
            }
            if (IMShouldLog())
            {
              v37 = *__error();
              v38 = __error();
              v81 = v37;
              v82 = strerror(*v38);
              IMLogString();
            }
          }
          objc_msgSend_endSession(self, v32, v33, v34, v81, v82);
        }
        OSLogHandleForIDSCategory();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v87 = v85;
          _os_log_impl(&dword_19B949000, v39, OS_LOG_TYPE_DEFAULT, "no buffer space available socket is full with %d bytes, waiting...", buf, 8u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (MarcoShouldLog())
          {
            v81 = v85;
            MarcoLog();
          }
          if (IMShouldLog())
          {
            v81 = v85;
            IMLogString();
          }
        }
        objc_msgSend_removeObjectAtIndex_(self->_outgoingDataArray, v40, 0, v41, v81);
      }
      else if (*__error() == 40)
      {
        OSLogHandleForIDSCategory();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          v43 = *__error();
          v44 = __error();
          v45 = strerror(*v44);
          *(_DWORD *)buf = 67109634;
          v87 = v43;
          v88 = 2080;
          v89 = v45;
          v90 = 2048;
          v91 = objc_msgSend_length(v10, v46, v47, v48);
          _os_log_impl(&dword_19B949000, v42, OS_LOG_TYPE_DEFAULT, "send error %d (%s) trying to send data of size %lu, dropping packets to send...", buf, 0x1Cu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (MarcoShouldLog())
          {
            v51 = *__error();
            v52 = __error();
            v82 = strerror(*v52);
            v83 = objc_msgSend_length(v10, v53, v54, v55);
            v81 = v51;
            MarcoLog();
          }
          if (IMShouldLog())
          {
            v56 = *__error();
            v57 = __error();
            v82 = strerror(*v57);
            v83 = objc_msgSend_length(v10, v58, v59, v60);
            v81 = v56;
            IMLogString();
          }
        }
        objc_msgSend_removeObjectAtIndex_(self->_outgoingDataArray, v49, 0, v50, v81, v82, v83);
      }
      else
      {
        OSLogHandleForIDSCategory();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          v62 = *__error();
          v63 = __error();
          v64 = strerror(*v63);
          *(_DWORD *)buf = 67109634;
          v87 = v62;
          v88 = 2080;
          v89 = v64;
          v90 = 2048;
          v91 = objc_msgSend_length(v10, v65, v66, v67);
          _os_log_impl(&dword_19B949000, v61, OS_LOG_TYPE_DEFAULT, "send error %d (%s) trying to send data of size %lu, cleaning up...", buf, 0x1Cu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (MarcoShouldLog())
          {
            v71 = *__error();
            v72 = __error();
            v82 = strerror(*v72);
            v83 = objc_msgSend_length(v10, v73, v74, v75);
            v81 = v71;
            MarcoLog();
          }
          if (IMShouldLog())
          {
            v76 = *__error();
            v77 = __error();
            v82 = strerror(*v77);
            v83 = objc_msgSend_length(v10, v78, v79, v80);
            v81 = v76;
            IMLogString();
          }
        }
        objc_msgSend_endSession(self, v68, v69, v70, v81, v82, v83);
      }
    }
    else
    {
      objc_msgSend_removeObjectAtIndex_(self->_outgoingDataArray, v19, 0, v20);
    }

  }
  else
  {
    OSLogHandleForIDSCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v25, OS_LOG_TYPE_DEFAULT, "No data to send on socket, suspending write source", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
        MarcoLog();
      if (IMShouldLog())
        IMLogString();
    }
    writeSource = self->_writeSource;
    if (writeSource)
    {
      self->_writeSourceIsResumed = 0;
      dispatch_suspend(writeSource);
    }
  }
}

- (void)_setupWriteSource
{
  NSObject *readQueue;
  _QWORD block[5];

  readQueue = self->_readQueue;
  if (readQueue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19B9BA7D0;
    block[3] = &unk_1E3C1F898;
    block[4] = self;
    dispatch_async(readQueue, block);
  }
}

- (BOOL)sendData:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSObject *readQueue;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v5 = v4;
  v6 = 1;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 1;
    readQueue = self->_readQueue;
    if (readQueue)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_19B9BAA40;
      block[3] = &unk_1E3C1FC00;
      block[4] = self;
      v10 = v4;
      v11 = &v12;
      dispatch_sync(readQueue, block);

      v6 = *((_BYTE *)v13 + 24) != 0;
    }
    _Block_object_dispose(&v12, 8);
  }

  return v6;
}

- (int)socket
{
  return self->_connectedSocket;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeSource, 0);
  objc_storeStrong((id *)&self->_readSource, 0);
  objc_storeStrong((id *)&self->_readQueue, 0);
  objc_storeStrong((id *)&self->_outgoingDataArray, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
