@implementation NPTuscanyLoopbackConnection

- (NPTuscanyLoopbackConnection)init
{
  char *v2;
  NPTuscanyLoopbackConnection *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NPTuscanyLoopbackConnection;
  v2 = -[NPTuscanyLoopbackConnection init](&v5, sel_init);
  v3 = (NPTuscanyLoopbackConnection *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 8) = xmmword_19E995400;
    *(_OWORD *)(v2 + 24) = xmmword_19E995410;
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *(_OWORD *)(v2 + 88) = 0u;
    *((_QWORD *)v2 + 7) = &xmmword_1ED062798;
    *((_QWORD *)v2 + 8) = &xmmword_1ED0627C0;
    nw_frame_array_init();
  }
  return v3;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  nplog_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19E8FE000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating loopback connection", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)NPTuscanyLoopbackConnection;
  -[NPTuscanyLoopbackConnection dealloc](&v4, sel_dealloc);
}

- (nw_protocol)protocol
{
  return &self->_protocol;
}

- (unsigned)addOutputFramesToArray:(nw_frame_array_s *)a3 maximumBytes:(unsigned int)a4 minimumBytes:(unsigned int)a5 maximumFrameCount:(unsigned int)a6
{
  unsigned int result;
  unsigned int i;
  unint64_t v11;
  size_t v12;
  BOOL v13;

  nw_frame_array_init();
  result = 0;
  if (a4 && a6)
  {
    for (i = 0; ; ++i)
    {
      v11 = -[NPTuscanyLoopbackConnection currentBlobSizeIndex](self, "currentBlobSizeIndex");
      v12 = self->_blobSizes[v11] >= a4 ? a4 : self->_blobSizes[v11];
      if (!malloc_type_malloc(v12, 0x100004077774924uLL))
        break;
      nw_frame_create();
      nw_frame_array_append();
      -[NPTuscanyLoopbackConnection setCurrentBlobSizeIndex:](self, "setCurrentBlobSizeIndex:", -[NPTuscanyLoopbackConnection currentBlobSizeIndex](self, "currentBlobSizeIndex") + 1);
      if (-[NPTuscanyLoopbackConnection currentBlobSizeIndex](self, "currentBlobSizeIndex") == 4)
        -[NPTuscanyLoopbackConnection setCurrentBlobSizeIndex:](self, "setCurrentBlobSizeIndex:", 0);
      a4 -= v12;
      result = i + 1;
      if (a4)
        v13 = a6 - 1 == i;
      else
        v13 = 1;
      if (v13)
        return result;
    }
    return i;
  }
  return result;
}

- (unsigned)addInputFramesToArray:(nw_frame_array_s *)a3 maximumBytes:(unsigned int)a4 minimumBytes:(unsigned int)a5 maximumFrameCount:(unsigned int)a6
{
  NSObject *v9;
  const char *v10;
  unsigned int v11;
  NSObject *v13;
  uint32_t v14;
  NSObject *v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;
  uint8_t buf[4];
  unsigned int v23;
  __int16 v24;
  unsigned int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  nw_frame_array_init();
  if (!a4 || !a6)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109376;
      v23 = a6;
      v24 = 1024;
      v25 = a4;
      v10 = "Maximum frame count (%u) and/or maximum byte count (%u) is 0";
      v13 = v9;
      v14 = 14;
      goto LABEL_22;
    }
    goto LABEL_7;
  }
  if (nw_frame_array_is_empty())
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v10 = "No input data currently available";
LABEL_13:
      v13 = v9;
      v14 = 2;
LABEL_22:
      _os_log_debug_impl(&dword_19E8FE000, v13, OS_LOG_TYPE_DEBUG, v10, buf, v14);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  nw_frame_array_foreach();
  if (*((_DWORD *)v19 + 6) < a5)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v10 = "Not enough data available to meet the required minimum";
      goto LABEL_13;
    }
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  nw_frame_array_first();
  v11 = 0;
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_9;
  v16 = 0;
  while (nw_frame_unclaimed_length() + v16 < a4)
  {
    nw_frame_array_next();
    v9 = objc_claimAutoreleasedReturnValue();
    nw_frame_array_remove();
    nw_frame_array_append();
    v17 = nw_frame_unclaimed_length();

    ++v11;
    if (v9)
    {
      v16 += v17;
      v15 = v9;
      if (v11 < a6)
        continue;
    }
    goto LABEL_8;
  }
  v9 = v15;
LABEL_8:

LABEL_9:
  _Block_object_dispose(&v18, 8);
  return v11;
}

uint64_t __97__NPTuscanyLoopbackConnection_addInputFramesToArray_maximumBytes_minimumBytes_maximumFrameCount___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += nw_frame_unclaimed_length();
  return 1;
}

- (void)handleOutputFrame:(id)a3
{
  id v3;

  v3 = a3;
  nw_frame_get_buffer();
  nw_frame_reset();
  nw_frame_array_append();

}

- (void)notifyInputHandler
{
  void *v2;
  void *v3;

  (*((void (**)(nw_protocol *, SEL))self->_protocol.callbacks + 14))(&self->_protocol, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)nw_parameters_copy_context();
  nw_queue_context_async();

}

uint64_t __49__NPTuscanyLoopbackConnection_notifyInputHandler__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(objc_msgSend(*(id *)(a1 + 32), "protocol") + 48);
  result = objc_msgSend(*(id *)(a1 + 32), "waitingForOutput");
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "setWaitingForOutput:", 0);
    if (!v2)
      return result;
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 + 24) + 40))(v2, objc_msgSend(*(id *)(a1 + 32), "protocol"));
  }
  else if (!v2)
  {
    return result;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 + 24) + 64))(v2, objc_msgSend(*(id *)(a1 + 32), "protocol"));
}

- (unint64_t)currentBlobSizeIndex
{
  return self->_currentBlobSizeIndex;
}

- (void)setCurrentBlobSizeIndex:(unint64_t)a3
{
  self->_currentBlobSizeIndex = a3;
}

- (BOOL)waitingForOutput
{
  return self->_waitingForOutput;
}

- (void)setWaitingForOutput:(BOOL)a3
{
  self->_waitingForOutput = a3;
}

@end
